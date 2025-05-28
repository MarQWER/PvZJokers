SMODS.Joker { --- Bloomerang
    key = 'bloomerang',
    rarity = 2,
    cost = 6,
    config = { extra = { chips = 300, mult = 15, plant_food_used = false } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food_bloomerang", vars = {card.ability.extra.chips,card.ability.extra.mult}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
	end,
    atlas = 'Jokers',
    pos = {x = 5, y = 0},
    unlocked = true,
    discovered = true,

    calculate = function (self, card, context)
        if context.joker_main then
            local isascending = false -- set to false so dont have to check 2 times
            for i = #context.full_hand,2,-1 do -- check if actually is ascending and check it to true if it is
                if context.full_hand[i]:get_id() > context.full_hand[i-1]:get_id() then
                   isascending = true
                end
            end
            if context.joker_main and not card.ability.extra.plant_food_used then -- when plant food is not used
                if context.joker_main and isascending then -- is isascending
                    return {
                    message = localize { type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}},
                    colour = G.C.CHIPS,
                    chip_mod = card.ability.extra.chips,
                    }
                elseif context.joker_main and not isascending then -- if is descending
                    return {
                    message = localize { type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}},
                    colour = G.C.MULT,
                    mult_mod = card.ability.extra.mult,
                    }
                end 
            end
            if context.joker_main and card.ability.extra.plant_food_used then
                return {
                    message = localize('both'),
                    colour = G.C.FILTER,
                    chip_mod = card.ability.extra.chips,
                    mult_mod = card.ability.extra.mult,
                }
            end
        end
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.plant_food_used = false
        end
    end,

    on_plant_food_use = function(self,card)
        card.ability.extra.plant_food_used = true
        SMODS.calculate_effect({message=localize('stronger')}, card)
    end,

    can_use_plantfood = function (self, card, context)
        local used = card.ability.extra.plant_food_used
        if  used == false then
            if G.GAME.blind and G.GAME.blind.in_blind then return true
            end  
        end
    end,
}

SMODS.Joker { --- Iceberg Lettuce
    key = 'iceberg_lettuce',
    rarity = 3,
    cost = 6,
    config = { extra = { odds = 2, plant_food_used = false}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food_iceberg_lettuce", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "pvz_frozen_seal"}
        return { vars = {(G.GAME and G.GAME.probabilities.normal or 1 ), card.ability.extra.odds }}
	end,
    atlas = 'Jokers',
    pos = {x = 6, y = 0},
    unlocked = true,
    discovered = true,

    calculate = function (self, card, context)
        if context.scoring_hand then
            if context.individual and context.cardarea == G.play and pseudorandom('pvz_iceberg_lettuce') < G.GAME.probabilities.normal / card.ability.extra.odds then  
                local played = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function ()
                            if not (played:get_seal() == "pvz_frozen") then  
                                played:set_seal("pvz_frozen")
                                play_sound('pvz_snowspark', 1, 0.7)
                                card:juice_up(0.3, 0.4)
                            end
                            return true
                        end
                }))
            end
        end

        -- Reset Plant food at end of blind
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.plant_food_used = false
            card.ability.extra.odds = 2
        end

    end,
    
    on_plant_food_use = function(self,card)
        card.ability.extra.plant_food_used = true
        card.ability.extra.odds = 1
        SMODS.calculate_effect({message=localize('icecold')}, card)
    end,

    can_use_plantfood = function (self, card, context)
        local used = card.ability.extra.plant_food_used
        if  used == false then
            if G.GAME.blind and G.GAME.blind.in_blind then return true
            end  
        end
    end,
}

SMODS.Joker { --- Bonk Choy
    key = 'bonk_choy',
    rarity = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food_bonk_choy", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
	end,
    atlas = 'Jokers',
    pos = {x = 7, y = 0},
    unlocked = true,
    discovered = true,

    -- Remove From Item Pool (Not Ready)
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
    end,

    on_plant_food_use = function(self,card)
    end,

    can_use_plantfood = function (self, card, context)
        return false
    end,
}

SMODS.Joker { --- Repeater
    key = 'repeater',
    rarity = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food_repeater", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
	end,
    atlas = 'Jokers',
    pos = {x = 8, y = 0},
    unlocked = true,
    discovered = true,

    calculate = function(self,card,context)
        
    end,

    on_plant_food_use = function(self,card)
    end,

    can_use_plantfood = function (self, card, context)
        return false
    end,
}

SMODS.Joker { --- Twin Sunflower
    key = 'twin_sunflower',
    rarity = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food_twin_sunflower", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
	end,
    atlas = 'Jokers',
    pos = {x = 9, y = 0},
    unlocked = true,
    discovered = true,

    -- Remove From Item Pool (Not Ready)
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
    end,

    on_plant_food_use = function(self,card)
    end,

    can_use_plantfood = function (self, card, context)
        return false
    end,
}