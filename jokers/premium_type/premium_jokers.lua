SMODS.Gradient {
    key = 'premiumcolor',
    colours = {
        HEX('053C60'),
        HEX('24B3C9')
    }
}

SMODS.Rarity {
    key = 'premium',
    badge_colour = SMODS.Gradients.pvz_premiumcolor,
    default_weight = 0.5,
    pools = { ["Joker"] = true },
}

SMODS.Joker {
    key = 'snow_pea',
    rarity = 'pvz_premium',
    cost = 4,
    config = { extra = { chips = 200, plant_food_used = false}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food_snow_pea", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        return {vars = {card.ability.extra.chips}}
	end,
    atlas = 'PremiumJokers',
    pos = {x = 0, y = 0},
    unlocked = true,
    discovered = true,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and context.other_card:get_seal() then
            return {
                chips = card.ability.extra.chips 
            }
        end
    end,

    on_plant_food_use = function(self,card)
        local _card = create_playing_card({
            front = pseudorandom_element(G.P_CARDS, pseudoseed('pvz_melon_pult')),
            center = G.P_CENTERS.c_base}, G.discard, true, nil, { G.C.SECONDARY_SET.Enhanced }, true)
            _card:set_seal('pvz_frozen')
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand:emplace(_card)
                    _card:start_materialize()
                    G.hand:sort()
                    return true
                end
            })) 
        return nil,true
    end,

    can_use_plantfood = function (self, card, context)
        local used = card.ability.extra.plant_food_used
        if  used == false then
            if G.GAME.blind and G.GAME.blind.in_blind then return true
            end
        end
    end,
}

SMODS.Joker {
    key = 'chomper',
    rarity = 'pvz_premium',
    cost = 4,
    config = { extra = { }},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food_chomper", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        return {vars = {card.ability.extra.chips}}
	end,
    atlas = 'PremiumJokers',
    pos = {x = 1, y = 0},
    unlocked = true,
    discovered = true,

    -- Remove From Item Pool (Not Ready)
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
    end,
}