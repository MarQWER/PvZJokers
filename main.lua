assert(SMODS.load_file("jokers/tutorial_jokers.lua"))()
assert(SMODS.load_file("jokers/egypt_jokers.lua"))()
assert(SMODS.load_file("jokers/pirate_jokers.lua"))()
assert(SMODS.load_file("jokers/wildwest_jokers.lua"))()
assert(SMODS.load_file("jokers/premium_type/premium_jokers.lua"))()
assert(SMODS.load_file("consumables/consumables.lua"))()
assert(SMODS.load_file("seals/seals.lua"))()

SMODS.Atlas{
    key = 'Jokers',
    path = 'jokers.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'PremiumJokers',
    path = 'premiumjokers.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'UpgradedJokers',
    path = 'upgradedjokers.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'PeaPodAtlas',
    path = 'peapodatlas.png',
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = 'Consumables',
    path = 'consumable.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = "plantfoodatlas",
    path = "plantfood.png",
    px = 213,
    py = 285
}
SMODS.Atlas{
    key = "Seals",
    path = "stickers.png",
    px = 71,
    py = 95,
}
SMODS.Atlas{
    key = "modicon",
    path = "modicon.png",
    px = 32,
    py = 32
}
SMODS.Sound{
    key = 'sunpickup',
    path = 'sunpickup.mp3'
}
SMODS.Sound{
    key = 'plantfoodsound',
    path = 'plantfoodsound.ogg'
}
SMODS.Sound{
    key = 'snowspark',
    path = 'snowspark.ogg'
}
SMODS.Sound{
    key = 'losesound',
    path = 'scream.ogg'
}
SMODS.Sound{
    key = 'winsound',
    path = 'winmusic.ogg'
}
----------------------------------------------
------------MOD CODE END----------------------