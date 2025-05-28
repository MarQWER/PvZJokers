SMODS.Joker {
    key = 'split_pea',
    rarity = 2,
    cost = 5,
    atlas = "Jokers",
    pos = {x=7,y=1},
    config = { extra = {} },
    unlocked = true,
    discovered = true,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        return {vars = {card.ability.extra.mult}}
    end,

    on_plant_food_use = function(self,card)
    end,

    can_use_plantfood = function (self, card, context)
        return false
    end,
}

SMODS.Joker {
    key = 'chili_bean',
    rarity = 2,
    cost = 5,
    atlas = "Jokers",
    pos = {x=8,y=1},
    config = { extra = {} },
    unlocked = true,
    discovered = true,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        return {vars = {card.ability.extra.mult}}
    end,

    on_plant_food_use = function(self,card)
    end,

    can_use_plantfood = function (self, card, context)
        return false
    end,
}

SMODS.Joker {
    key = 'pea_pod',
    rarity = 2,
    cost = 5,
    atlas = "PeaPodAtlas",
    pos = {x=0,y=0},
    config = { extra = {} },
    unlocked = true,
    discovered = true,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        return {vars = {card.ability.extra.mult}}
    end,

    on_plant_food_use = function(self,card)
    end,

    can_use_plantfood = function (self, card, context)
        return false
    end,
}

SMODS.Joker {
    key = 'lightning_reed',
    rarity = 2,
    cost = 5,
    atlas = "Jokers",
    pos = {x=9,y=1},
    config = { extra = {} },
    unlocked = true,
    discovered = true,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        return {vars = {card.ability.extra.mult}}
    end,

    on_plant_food_use = function(self,card)
    end,

    can_use_plantfood = function (self, card, context)
        return false
    end,
}

SMODS.Joker {
    key = 'melon_pult',
    rarity = 2,
    cost = 5,
    atlas = "Jokers",
    pos = {x=0,y=2},
    config = { extra = {} },
    unlocked = true,
    discovered = true,
    
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        return {vars = {card.ability.extra.mult}}
    end,

    on_plant_food_use = function(self,card)
    end,

    can_use_plantfood = function (self, card, context)
        return false
    end,
}

SMODS.Joker { -- Tall Nut
    key = 'tall_nut',
    rarity = 3,
    cost = 7,
    atlas = "Jokers",
    pos = {x=1,y=2},
    config = { extra = { hand = 2} },
    unlocked = true,
    discovered = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food_tall_nut", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        return {vars = {card.ability.extra.hand}}
	end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hand
        ease_hands_played(card.ability.extra.hand)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hand
        ease_hands_played(-card.ability.extra.hand)
    end,
    can_use_plantfood = function (self, context)
        return true
    end,
    on_plant_food_use = function (self, card)
        card:set_ability(G.P_CENTERS["j_pvz_fortified_tall_nut"])
    end
}

SMODS.Joker { -- Fortified Tall Nut
    key = 'fortified_tall_nut',
    rarity = 2,
    cost = 5,
    atlas = "UpgradedJokers",
    pos = {x=1,y=0},
    config = { extra = { hand = 2, discard = 2} },
    unlocked = true,
    discovered = true,
    no_collection = true,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.hand, card.ability.extra.discard} }
	end,
    in_pool = function(self, args) -- F. Tall-Nut can't be bought
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
                SMODS.calculate_effect({message=localize('fortified')}, card)
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

    can_use_plantfood = function (self, context) -- Always False cuz he's already upgraded
        return false
    end,
}

SMODS.Joker {
    key = 'winter_melon',
    rarity = 4,
    cost = 10,
    atlas = "Jokers",
    pos = {x=2,y=2},
    config = { extra = {} },
    unlocked = true,
    discovered = true,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        return {vars = {card.ability.extra.mult}}
    end,

    on_plant_food_use = function(self,card)
    end,

    can_use_plantfood = function (self, card, context)
        return false
    end,
}