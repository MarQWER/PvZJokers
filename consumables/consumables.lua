SMODS.ConsumableType{
    key = 'PVZConsumableType',
    collection_rows= {4,5},
    primary_colour = G.C.GREEN,
    secondary_colour = G.C.GREEN,
    loc_txt = {
        collection = 'PvZ Cards',
        name = 'PvZ',
    },
    shop_rate = 10,
}

SMODS.UndiscoveredSprite{
    key = 'PVZConsumableType',
    atlas = 'Consumables',
    pos = {x = 1, y = 0}
}

SMODS.Consumable{ -- Plant Food
    key = 'PlantFood',
    set = 'PVZConsumableType',
    atlas = 'plantfoodatlas',
    pos = {x = 0, y = 0},
    can_use = function(self,card)
        if #G.jokers.highlighted > 0 and (G.jokers.highlighted[1].config.center.original_mod and G.jokers.highlighted[1].config.center.original_mod.id == 'PVZJOKERS') and G.jokers.highlighted[1].config.center:can_use_plantfood(G.jokers.highlighted[1], context) then 
            return true 
        else
            return false
        end 
    end,

    use = function(self,card)
        G.jokers.highlighted[1].config.center:on_plant_food_use(G.jokers.highlighted[1])
        play_sound('pvz_plantfoodsound', 1, 0.7)
    end
}

SMODS.Consumable{ -- Cherry Bomb!
    key = 'CherryBomb',
    set = 'PVZConsumableType',
    atlas = 'Consumables',
    pos = {x=0,y=0},
    can_use = function (self,card)
        if G.GAME.blind and G.GAME.blind.in_blind then return true
        end
    end,

    use = function (self, card, area)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
            G.FUNCS.draw_from_hand_to_discard()
            attention_text({
                text = "POWIE!",
                scale = 1.3, 
                hold = 1.4,
                major = card,
                backdrop_colour = G.C.RED,
                align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                silent = true
            })
        return true end }))
    end
}

SMODS.Consumable{
    key = 'GraveBuster',
    set = 'PVZConsumableType',
    atlas = 'Consumables',
    pos = {x=1,y=0},

    can_use = function ()
        if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind:get_type() == 'Boss')) then 
             return true
        end
    end,

    use = function (self,card,context)
        G.GAME.blind:disable()
    end
}

SMODS.Consumable{
    key = 'Shovel',
    set = 'PVZConsumableType',
    atlas = 'Consumables',
    pos = {x=2,y=0},

    can_use = function (self, card)
        if #G.jokers.highlighted > 0 then
            return true
        end
    end,

    use = function (self,card)
        local dollars = G.jokers.highlighted[1].sell_cost
        if dollars > 25 then dollars = 25 end
        G.jokers.highlighted[1]:start_dissolve()
        ease_dollars(dollars+G.jokers.highlighted[1].sell_cost)
    end
}