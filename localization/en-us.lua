return {
    descriptions = {
        Joker = { -- Jokers
            j_pvz_sunflower = {
                name = "Sunflower",
                text = {
                    'Generate {C:money}$#1#{}',
                    'at end of round'
                }
            },
            j_pvz_peashooter = {
                name = "Peashooter",
                text = {
                '{C:chips}+#1#{} Chips when {C:attention}High Card{} is played',
                }
            },
            j_pvz_wallnut = {
                name = "Wall-Nut",
                text = {
                '{C:chips}+#1#{} hand each round',
                }
            },
            j_pvz_fortified_wallnut = {
                name = "Fortified Wall-Nut",
                text = {
                '{C:chips}+#1#{} hand each round,',
                '{C:mult}+#2#{} discard each round'
                }
            },
            j_pvz_potato_mine = {
                name = "Potato Mine",
                text = {
                'When {C:attention}Boss Blind{} is selected,',
                '{X:mult,C:white}X#1#{}'
                }
            },
            j_pvz_cabbage_pult = {
                name = "Cabbage Pult",
                text = {
                'Adds Mult equal to the level',
                'of the {C:attention}poker hand{} played {X:dark_edition,C:white}^2{}',
                '{C:inactive}[e.g. lvl {C:attention}3{C:inactive} hand gives {C:mult}+9{C:inactive} Mult]'
                }
            },
            j_pvz_bloomerang = {
                name = "Bloomerang",
                text = { 
                '{C:chips}+#1#{} if played hand has cards ascending',
                'in order from left to right,',
                '{C:mult}+#2#{} if descending'
                }
            },
            j_pvz_iceberg_lettuce = {
                name = "Iceberg Lettuce",
                text = { 
                'Played cards have a',
                '{C:green}1 in 2{} chance to gain a',
                '{C:pvz_frozencolor}Frozen Seal{}'
                }
            },
            j_pvz_bonk_choy = {
                name = "Bonk Choy",
                text = { 
                'Not Implemented Yet',
                }
            },
            j_pvz_repeater = {
                name = "Repeater",
                text = { 
                '{C#chips}+#1#{} if ',
                }
            },
            j_pvz_twin_sunflower = {
                name = "Twin Sunflower",
                text = { 
                'Does something cool with money for sure',
                }
            },
            j_pvz_kernel_pult = {
                name = "Kernel Pult",
                text = { 
                '',
                }
            },
            j_pvz_snapdragon = {
                name = "Snapdragon",
                text = { 
                'Each played {C:attention}3{}, {C:attention}6{}, or {C:attention}9{}',
                'gives {C:mult}+#1#{} Mult when scored'
                }
            },
            j_pvz_spikeweed = {
                name = "Spikeweed",
                text = { 
                '',
                }
            },
            j_pvz_spring_bean = {
                name = "Spring Bean",
                text = { 
                'This joker gains {C:chips}+#2#{}',
                'every time {C:attention}ANY{} card shakes',
                "(doesn't work instantly for some reason)",
                '{C:inactive}[Currently {C:chips}+#1#{C:inactive} chips]'
                }
            },
            j_pvz_coconut_cannon = {
                name = "Coconut Cannon",
                text = { 
                '',
                }
            },
            j_pvz_threepeater = {
                name = "Threepeater",
                text = { 
                '',
                }
            },
            j_pvz_spikerock = {
                name = "Spikerock",
                text = { 
                '',
                }
            },
            j_pvz_split_pea = {
                name = "Split Pea",
                text = { 
                '',
                }
            },
            j_pvz_chili_bean = {
                name = "Chili Bean",
                text = { 
                '',
                }
            },
            j_pvz_pea_pod = {
                name = "Pea Pod",
                text = { 
                '',
                }
            },
            j_pvz_lightning_reed = {
                name = "Lightning Reed",
                text = { 
                '',
                }
            },
            j_pvz_melon_pult = {
                name = "Melon Pult",
                text = { 
                '',
                }
            },
            j_pvz_tall_nut = {
                name = "Tall-Nut",
                text = { 
                '{C:chips}+#1#{} hand each round,',
                }
            },
            j_pvz_fortified_tall_nut = {
                name = "Fortified Tall-Nut",
                text = { 
                '{C:chips}+#1#{} hand each round,',
                '{C:mult}+#2#{} discard each round',
                }
            },
            j_pvz_winter_melon = {
                name = "Winter Melon",
                text = { 
                'Adds Mult equal to the amount',
                'of cards in deck with the {C:pvz_frozencolor}Frozen Seal {X:dark_edition,C:white}^2{}' ,
                }
            },
            j_pvz_snow_pea = {
                name = "Snow Pea",
                text = { 
                'Played card with a',
                '{C:pvz_frozencolor}Frozen Seal{} give', 
                '{C:chips}+#1#{} chips when scored ',
                }
            },
            j_pvz_chomper = {
                name = "Chomper",
                text = {
                    'Chomp Chomp!',
                }
            },
        },
        PVZConsumableType = { -- Consumable Types
            c_pvz_PlantFood = {
                name = 'Plant Food',
                text = {
                'Instantly {C:green,E:2}Powers up{} a Plant',
                'Has a different effect for each plant'
                }
            },
            c_pvz_CherryBomb = {
                name = 'Cherry Bomb',
                text = {
                'Discards the whole Hand',
                'Without using your discards'
                }
            },
            c_pvz_GraveBuster = {
                name = 'Grave Buster',
                text = {
                'Disable the current',
                '{C:attention}Boss Blind{}',
                }
            },
            c_pvz_Shovel = {
                name = 'Shovel',
                text = {
                'Sells a selected {C:attention}Joker{}',
                'for {C:attention}twice{} the price',
                }
            },
        },
        Other = { -- Plant Food Stuff
            undiscovered_pvzconsumabletype = {
                name="Not Discovered",
                text={
                    "Purchase or use",
                    "this card in an",
                    "unseeded run to",
                    "learn what it does",
                },
            },
            pvz_frozen_seal = {
                name = "Frozen Seal",
                text = {"Does nothing {C:inactive}[Yet]{}"}
            },
            plant_food = {
                name = "Plant Food",
                text = {
                    'Instantly {C:green,E:2}Powers up{} a Plant',
                    'Has a different effect for every Plant'
                }
            },
            plant_food_sunflower = {
                name = "Plant Food Effect",
                text = {
                    'Instantly Generate {C:money}$#1#',
                }
            },
            plant_food_peashooter = {
                name = "Plant Food Effect",
                text = {
                    'Gives {C:chips}+#1#{} Chips more that round',
                }
            },
            plant_food_wall_nut = {
                name = "Plant Food Effect",
                text = {
                    'Upgrades to a Fortified Wall-Nut',
                }
            },
            plant_food_potato_mine = {
                name = "Plant Food Effect",
                text = {
                    'Grows Instantly, making it work that round',
                }
            },
            plant_food_cabbage_pult = {
                name = "Plant Food Effect",
                text = {
                    'For the rest of the round',
                    'the Mult is calculated as if your',
                    '{C:attention}hand level{} was {C:attention}1{} lvl more'
                }
            },
            plant_food_bloomerang = {
                name = "Plant Food Effect",
                text = {
                    'Both {C:chips}+#1#{} chips and {C:mult}+#2#{} mult',
                    'Is added that round'
                }
            },
            plant_food_iceberg_lettuce = {
                name = "Plant Food Effect",
                text = {
                    '{C:green}100%{} Chance for this round',
                }
            },
            plant_food_bonk_choy = {
                name = "Plant Food Effect",
                text = {
                    '',
                }
            },
            plant_food_repeater = {
                name = "Plant Food Effect",
                text = {
                    '',
                }
            },
            plant_food_twin_sunflower = {
                name = "Plant Food Effect",
                text = {
                    '',
                }
            },
            plant_food_kernel_pult = {
                name = "Plant Food Effect",
                text = {
                    '',
                }
            },
            plant_food_snapdragon = {
                name = "Plant Food Effect",
                text = {
                    'Gives {C:mult}+#1#{} Mult more that round',
                }
            },
            plant_food_spikeweed = {
                name = "Plant Food Effect",
                text = {
                    '',
                }
            },
            plant_food_spring_bean = {
                name = "Plant Food Effect",
                text = {
                    '',
                }
            },
            plant_food_coconut_cannon = {
                name = "Plant Food Effect",
                text = {
                    '',
                }
            },
            plant_food_threepeater = {
                name = "Plant Food Effect",
                text = {
                    '',
                }
            },
            plant_food_spikerock = {
                name = "Plant Food Effect",
                text = {
                    '',
                }
            },
            plant_food_split_pea = {
                name = "Plant Food Effect",
                text = {
                    '',
                }
            },
            plant_food_chili_bean = {
                name = "Plant Food Effect",
                text = {
                    '',
                }
            },
            plant_food_pea_pod = {
                name = "Plant Food Effect",
                text = {
                    '',
                }
            },
            plant_food_lightning_reed = {
                name = "Plant Food Effect",
                text = {
                    '',
                }
            },
            plant_food_melon_pult = {
                name = "Plant Food Effect",
                text = {
                    '',
                }
            },
            plant_food_tall_nut = {
                name = "Plant Food Effect",
                text = {
                    'Upgrades to a Fortified Tall-Nut',
                }
            },
            plant_food_winter_melon = {
                name = "Plant Food Effect",
                text = {
                    'Adds 3 random cards with a',
                    '{C:pvz_frozencolor}Frozen Seal{} to your hand',
                }
            },
            plant_food_snow_pea = {
                name = "Plant Food Effect",
                text = {
                    'Adds a random card with a',
                    '{C:pvz_frozencolor}Frozen Seal{} to your hand',
                }
            },
            plant_food_chomper = {
                name = "Plant Food Effect",
                text = {
                    'Chomps even more!',
                }
            },
        }
    },
    misc = { -- Messages
        dictionary = {
            ploom = 'Ploom!',
            stronger = 'Stronger!',
            fortified = 'Fortified!',
            spudow = 'SPUDOW!',
            growing = 'Still Growing...',
            grown = 'Grown!',
            cabbages = 'My Cabbages!',
            b_PVZConsumableType = 'PvZ Cards',
            both = 'Both!',
            icecold = 'Ice Cold!',
            k_pvz_premium = "Premium",
        },
        labels = {
            pvz_frozen_seal = "Frozen Seal",
            k_pvz_premium = "Premium",
        }
    }
}