SMODS.Joker {
    key = 'kernel_pult',
    rarity = 2,
    cost = 5,
    atlas = "Jokers",
    pos = {x=0,y=1},
    config = { extra = {} },
    unlocked = true,
    discovered = true,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
    end,

    on_plant_food_use = function(self,card)
    end,

    can_use_plantfood = function (self, card, context)
        return false
    end,
}

SMODS.Joker {
    key = 'snapdragon',
    rarity = 2,
    cost = 5,
    atlas = "Jokers",
    pos = {x=1,y=1},
    config = { extra = { mult = 9, bonus = 0, plant_food_used = false, plant_food_bonus = 9} },
    unlocked = true,
    discovered = true,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food_snapdragon", vars = {card.ability.extra.plant_food_bonus}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        return { vars = { card.ability.extra.mult, } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 3 or context.other_card:get_id() == 6 or context.other_card:get_id() == 9 then
                return {
                    mult = card.ability.extra.mult + card.ability.extra.bonus
                }
            end
        end
    end,

    on_plant_food_use = function(self,card)
        card.ability.extra.bonus = card.ability.extra.plant_food_bonus
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

SMODS.Joker {
    key = 'spikeweed',
    rarity = 2,
    cost = 5,
    atlas = "Jokers",
    pos = {x=2,y=1},
    config = { extra = {} },
    unlocked = true,
    discovered = true,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
    end,

    on_plant_food_use = function(self,card)
    end,

    can_use_plantfood = function (self, card, context)
        return false
    end,
}

local cju = Card.juice_up
function Card:juice_up(scale, rot_amount)
    if G.jokers and G.jokers.cards then
        SMODS.calculate_context({pvz_juice_up = true, scale = scale, rot_amount = rot_amount})
    end
    cju(self, scale, rot_amount)
end

SMODS.Joker {
    key = 'spring_bean',
    rarity = 2,
    cost = 5,
    atlas = "Jokers",
    pos = {x=3,y=1},
    config = { extra = {  chips = 0, chips_gain = 5 } },
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food_spring_bean", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        return { vars = {card.ability.extra.chips, card.ability.extra.chips_gain} }
    end,
    unlocked = true,
    discovered = true,

    calculate = function (self, card, context)
            if context.pvz_juice_up then
                if context.scale and context.scale >= 0.3 then
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
                end 
            end
            if context.joker_main then
                return {
                    message = localize { type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}},
                    colour = G.C.CHIPS,
                    chip_mod = card.ability.extra.chips,
                }
            end
    end,

    on_plant_food_use = function(self,card)
    end,

    can_use_plantfood = function (self, card, context)
        return false
    end,
}

SMODS.Joker {
    key = 'coconut_cannon',
    rarity = 2,
    cost = 5,
    atlas = "Jokers",
    pos = {x=4,y=1},
    config = { extra = {} },
    unlocked = true,
    discovered = true,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
    end,

    on_plant_food_use = function(self,card)
    end,

    can_use_plantfood = function (self, card, context)
        return false
    end,
}

SMODS.Joker {
    key = 'threepeater',
    rarity = 2,
    cost = 5,
    atlas = "Jokers",
    pos = {x=5,y=1},
    config = { extra = {} },
    unlocked = true,
    discovered = true,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
    end,

    on_plant_food_use = function(self,card)
    end,

    can_use_plantfood = function (self, card, context)
        return false
    end,
}

SMODS.Joker {
    key = 'spikerock',
    rarity = 2,
    cost = 5,
    atlas = "Jokers",
    pos = {x=6,y=1},
    config = { extra = {} },
    unlocked = true,
    discovered = true,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
        info_queue[#info_queue + 1] = { set = "Other", key = "plant_food", vars = {}}
    end,

    on_plant_food_use = function(self,card)
    end,

    can_use_plantfood = function (self, card, context)
        return false
    end,
}
