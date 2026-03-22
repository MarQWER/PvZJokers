SMODS.Joker { --- Sunflower
    key = 'sunflower',
    config = { extra = { money = 4, plant_food_bonus = 7 } },
    rarity = 1,
    cost = 3,
    atlas = 'Jokers',
    pos = { x = 0, y = 0 },
    unlocked = true,
    discovered = true,

    -- Info queues and setting up vars for the text
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food_sunflower", vars = { card.ability.extra.plant_food_bonus } }
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food" }
        return { vars = { card.ability.extra.money } }
    end,

    -- Give money at end of round
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.money or 0
    end,

    can_use_plantfood = function(self, card)
        return true
    end,

    --- Plant Food Effect for Sunflower
    on_plant_food_use = function(self, card)
        local bonus = card.ability.extra.plant_food_bonus
        --delay(1)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 1,
            func = function()
                ease_dollars(bonus)
                SMODS.calculate_effect({ message = localize('ploom') }, card)
                play_sound('pvz_sunpickup', 1, 0.7)
                return true
            end,
        }))
    end
}

SMODS.Joker { --- Peashooter
    key = 'peashooter',
    config = { extra = { chips = 100, plant_food_bonus = 500, plant_food_used = false } },
    rarity = 1,
    cost = 3,
    atlas = 'Jokers',
    pos = { x = 1, y = 0 },
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food_peashooter", vars = { card.ability.extra.plant_food_bonus } }
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food" }
        return { vars = { card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if not context.joker_main or not context.scoring_hand then return end
        if context.scoring_name ~= "High Card" then return end

        local chips = card.ability.extra.chips

        if card.ability.extra.plant_food_used then
            chips = chips + card.ability.extra.plant_food_bonus
        end

        return {
            message = localize { type = 'variable', key = 'a_chips', vars = { chips } },
            colour = G.C.CHIPS,
            chip_mod = chips
        }
    end,

    calculate_after = function(self, card, context)
        if context.end_of_round then
            card.ability.extra.plant_food_used = false
        end
    end,


    can_use_plantfood = function(self, card)
        return not card.ability.extra.plant_food_used
            and G.GAME.blind
            and G.GAME.blind.in_blind
    end,

    --- Plant Food Effect for Peashooter
    on_plant_food_use = function(self, card)
        card.ability.extra.plant_food_used = true
        SMODS.calculate_effect({ message = localize('stronger') }, card)
    end
}

SMODS.Joker { --- Wall-Nut
    key = 'wallnut',
    config = { extra = { hand = 1 } },
    rarity = 2,
    cost = 5,
    atlas = 'Jokers',
    pos = { x = 2, y = 0 },
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food_wall_nut" }
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food" }
        return { vars = { card.ability.extra.hand } }
    end,

    add_to_deck = function(self, card)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hand
        ease_hands_played(card.ability.extra.hand)
    end,

    remove_from_deck = function(self, card)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hand
        ease_hands_played(-card.ability.extra.hand)
    end,

    can_use_plantfood = function(self, card)
        return true
    end,

    on_plant_food_use = function(self, card)
        card:set_ability(G.P_CENTERS["j_pvz_fortified_wallnut"])
    end
}

SMODS.Joker { --- Fortified Wall-Nut
    key = 'fortified_wallnut',
    atlas = 'UpgradedJokers',
    pos = { x = 0, y = 0 },
    rarity = 3,
    config = { extra = { hand = 1, discard = 1 } },
    no_collection = true,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hand, card.ability.extra.discard } }
    end,

    in_pool = function(self, args) -- F. Wall-Nut can't be bought
        return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hand
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discard
        ease_hands_played(card.ability.extra.hand)
        ease_discard(card.ability.extra.discard)
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                SMODS.calculate_effect({ message = localize('fortified') }, card)
                return true
            end,
        }))
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hand
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discard
        ease_hands_played(-card.ability.extra.hand)
        ease_discard(-card.ability.extra.discard)
    end,

    can_use_plantfood = function() -- Always False cuz he's already upgraded
        return false
    end,
}

SMODS.Joker { --- Potato Mine
    key = 'potato_mine',
    rarity = 2,
    cost = 5,
    config = { extra = { Xmult = 3, plant_food_used = false } },
    atlas = 'Jokers',
    pos = { x = 3, y = 0 },
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food_potato_mine" }
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food" }
        return { vars = { card.ability.extra.Xmult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if G.GAME.blind.boss or card.ability.extra.plant_food_used then
                return {
                    message = localize('spudow'),
                    Xmult_mod = card.ability.extra.Xmult,
                }
            end
            return {
                message = localize('growing')
            }
        end
        -- Reset Plant food at end of blind
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.plant_food_used = false
        end
    end,



    can_use_plantfood = function(self, card)
        return not card.ability.extra.plant_food_used
            and G.GAME.blind
            and G.GAME.blind.in_blind
            and not G.GAME.blind.boss
    end,

    on_plant_food_use = function(self, card)
        card.ability.extra.plant_food_used = true
        SMODS.calculate_effect({ message = localize('grown') }, card)
    end
}

SMODS.Joker { --- Cabbage Pult
    key = 'cabbage_pult',
    config = { extra = { plant_food_used = false } },
    rarity = 3,
    cost = 6,
    atlas = 'Jokers',
    pos = { x = 4, y = 0 },
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food_cabbage_pult" }
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food" }
    end,

    calculate = function(self, card, context)
        if not context.joker_main or not context.scoring_hand then return end

        local hand = G.GAME.hands[context.scoring_name]
        if not hand then return end

        local level = hand.level
        local mult = level * level

        if card.ability.extra.plant_food_used then
            mult = (level + 1) * (level + 1)
        end

        return {
            message = localize { type = 'variable', key = 'a_mult', vars = { mult } },
            mult_mod = mult
        }
    end,

    calculate_after = function(self, card, context)
        if context.end_of_round then
            card.ability.extra.plant_food_used = false
        end
    end,

    can_use_plantfood = function(self, card)
        return not card.ability.extra.plant_food_used
            and G.GAME.blind
            and G.GAME.blind.in_blind
    end,

    on_plant_food_use = function(self, card)
        card.ability.extra.plant_food_used = true
        SMODS.calculate_effect({ message = localize('cabbages') }, card)
    end
}
