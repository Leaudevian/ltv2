maxVehiclePerformanceUpgrades = 0 -- Set to 0 to have all the upgrades
vehicleBaseRepairCost = 600
vehicleRepairCostMultiplier = 1
moneyType = 'bank'

-- Location Configs
-- Add locations here
-- Add jobs specific to the garage.
bennyGarages = {
    [1] = {coords = vector4(-560.63, -914.62, 23.15, 270.0), useJob = true, job = {"mechanic"}}
}

--[[ bennyLocations = {
    vector4(-211.55, -1324.55, 30.90, 319.731)
} ]]

-- ADJUST PRICING

vehicleCustomisationPrices = {
    cosmetics = {price = 400},
    respray = {price = 1000},
    performance = {prices = {0, 3250, 5500, 10450, 15250, 20500}},
    turbo = {price = 15000},
    wheels = {price = 400},
    customwheels = {price = 600},
    wheelsmoke = {price = 400},
    windowtint = {price = 400},
    neonside = {price = 100},
    neoncolours = {price = 500},
    headlights = {price = 100},
    xenoncolours = {price = 500},
    oldlivery = {price = 500},
    plateindex = {price = 1000}
}

-- RESPRAY CATEGORIES

vehicleResprayCategories = {
    {category = "Couleur primaire", id = 0},
    {category = "Couleur secondaire", id = 1},
    {category = "Couleur perles", id = 2},
    {category = "Couleur des jantes", id = 3},
    {category = "Couleur du tableau de bord", id = 4},
    {category = "Couleur intérieure", id = 5}
}

-- WINDOW TINTS

vehicleWindowTintOptions = {
    {name = "Aucune", id = 0},
    {name = "Noir pur", id = 1},
    {name = "Teinté noir", id = 2},
    {name = "Teinté légé", id = 3}
}

-- HEADLIGHTS

vehicleXenonOptions = {
    xenonColours = {
        {name = "Aucune", id = 255},
        {name = "Blanche",id = 0}, {name = "Blue",id = 1},
        {name = "Blue électrique",id = 2},
        {name = "Menthe verte",id = 3},
        {name = "Vert citron",id = 4},
        {name = "Jaune",id = 5},
        {name = "Or",id = 6},
        {name = "Orange",id = 7},
        {name = "Rouge",id = 8},
        {name = "Poney rose",id = 9},
        {name = "Rose vif",id = 10},
        {name = "Violet",id = 11},
        {name = "Noir",id = 12}
    }
}

-- WHEELS

vehicleWheelOptions = {
    {category = "Pneus personnalisés", id = -1, wheelID = 23},
    {category = "Fumée de pneu", id = 20, wheelID = 23},
    {category = "Sport", id = 0, wheelID = 23},
    {category = "Muscle", id = 1, wheelID = 23},
    {category = "Lowrider", id = 2, wheelID = 23},
    {category = "SUV", id = 3, wheelID = 23},
    {category = "Offroad", id = 4, wheelID = 23},
    {category = "Tuner", id = 5, wheelID = 23},
    {category = "Moto", id = 6, wheelID = 23},
    {category = "Haut de gamme", id = 7, wheelID = 23}
}

-- TIRE SMOKE

vehicleTyreSmokeOptions = {
    {
        name = "Fumée blanche",
        r = 254,
        g = 254,
        b = 254
    }, 
    {
        name = "Fumée noire",
        r = 1,
        g = 1,
        b = 1
    },
    {
        name = "Fumée bleue",
        r = 0,
        g = 150,
        b = 255
    },
    {
        name = "Fumée jaune",
        r = 255,
        g = 255,
        b = 50
    },
    {
        name = "Fumée orange",
        r = 255,
        g = 153,
        b = 51
    },
    {
        name = "Fumée rouge",
        r = 255,
        g = 10,
        b = 10
    },
    {
        name = "Fumée verte",
        r = 10,
        g = 255,
        b = 10
    },
    {
        name = "Fumée violette",
        r = 153,
        g = 10,
        b = 153
    },
    {
        name = "Fumée rose",
        r = 255,
        g = 102,
        b = 178
    },
    {
        name = "Fumée grise",
        r = 128,
        g = 128,
        b = 128
    }
}

-- NEONS

vehicleNeonOptions = {
    category = "Néons",
        neonTypes = {
            {name = "Néon avant", id = 2},
            {name = "Néon arrière", id = 3},
            {name = "Néon gauche", id = 0},
            {name = "Néon droit", id = 1}
        },
    neonColours = {
        {
            name = "Blanc",
            r = 222,
            g = 222,
            b = 255
        }, {
            name = "Bleu",
            r = 2,
            g = 21,
            b = 255
        }, {
            name = "Bleu électrique",
            r = 3,
            g = 83,
            b = 255
        }, {
            name = "Menthe verte",
            r = 0,
            g = 255,
            b = 140
        }, {
            name = "Vert citron",
            r = 94,
            g = 255,
            b = 1
        }, {
            name = "Jaune",
            r = 255,
            g = 255,
            b = 0
        }, {
            name = "Or",
            r = 255,
            g = 150,
            b = 0
        }, {
            name = "Orange",
            r = 255,
            g = 62,
            b = 0
        }, {
            name = "Rouge",
            r = 255,
            g = 1,
            b = 1
        }, {
            name = "Poney rose",
            r = 255,
            g = 50,
            b = 100
        }, {
            name = "Rose vif",
            r = 255,
            g = 5,
            b = 190
        }, {
            name = "Violet",
            r = 35,
            g = 1,
            b = 255
        }, {
            name = "Noir",
            r = 15,
            g = 3,
            b = 255
        }
    }
}

-- MAIN COMPONENTS

vehicleCustomisation = {
    {category = "Aileron", id = 0}, 
    {category = "Pare-choc avant", id = 1},
    {category = "Pare-choc arrière", id = 2},
    {category = "Jupe latérale", id = 3},
    {category = "Échappement", id = 4},
    {category = "Arceau", id = 5},
    {category = "Grille", id = 6},
    {category = "Capote", id = 7},
    {category = "Aile gauche", id = 8},
    {category = "Aile droit", id = 9},
    {category = "Toit",id = 10},
    {category = "Moteur", id = 11},
    {category = "Freins", id = 12},
    {category = "Transmission", id = 13},
    {category = "Suspension", id = 15},
    {category = "Blindage", id = 16},
    {category = "Turbo", id = 18},
    {category = "Vanity Plates",id = 25},
    {category = "Trim A", id = 27},
    {category = "Ornaments", id = 28},
    {category = "Tableau de bord", id = 29},
    {category = "Cadran", id = 30},
    {category = "Haut-parleur de porte", id = 31},
    {category = "Siège", id = 32},
    {category = "Volant", id = 33},
    {category = "Levier de vitesse", id = 34},
    {category = "Plaque", id = 35},
    {category = "Haut-parleur", id = 36},
    {category = "Coffre", id = 37},
    {category = "Hydraulique", id = 38},
    {category = "Bloc moteur", id = 39},
    {category = "Filtre à air", id = 40},
    {category = "Strut", id = 41},
    {category = "Arch Cover", id = 42},
    {category = "Aerial", id = 43},
    {category = "Trim B", id = 44},
    {category = "Réservoir d'essence", id = 45},
    {category = "Vitres", id = 46},
    {category = "Liseret", id = 48},
    {category = "Klaxon", id = 14, 
        
        hornNames = {
            {name = "Klaxon de camion", id = 0},
            {name = "Klaxon de flic", id = 1},
            {name = "Klaxon de clown", id = 2},
            {name = "Klaxon musicale 1", id = 3},
            {name = "Klaxon musicale 2", id = 4},
            {name = "Klaxon musicale 3", id = 5},
            {name = "Klaxon musicale 4", id = 6},
            {name = "Klaxon musicale 5", id = 7},
            {name = "Klaxon triste", id = 8},
            {name = "Klaxon classique 1", id = 9},
            {name = "Klaxon classique 2", id = 10},
            {name = "Klaxon classique 3", id = 11},
            {name = "Klaxon classique 4", id = 12},
            {name = "Klaxon classique 5", id = 13},
            {name = "Klaxon classique 6", id = 14},
            {name = "Klaxon classique 7", id = 15},
            {name = "Scale - Do", id = 16},
            {name = "Scale - Re", id = 17},
            {name = "Scale - Mi", id = 18},
            {name = "Scale - Fa", id = 19},
            {name = "Scale - Sol", id = 20},
            {name = "Scale - La", id = 21},
            {name = "Scale - Ti", id = 22},
            {name = "Scale - Do", id = 23},
            {name = "Klaxon jazz 1", id = 24},
            {name = "Klaxon jazz 2", id = 25},
            {name = "Klaxon jazz 3", id = 26},
            {name = "Klaxon jazz Loop", id = 27},
            {name = "Star Spangled Banner 1", id = 28},
            {name = "Star Spangled Banner 2", id = 29},
            {name = "Star Spangled Banner 3", id = 30},
            {name = "Star Spangled Banner 4", id = 31},
            {name = "Klaxon classique 8 Loop", id = 32},
            {name = "Klaxon classique 9 Loop", id = 33},
            {name = "Klaxon classique 10 Loop", id = 34},
            {name = "Klaxon classique 8", id = 35},
            {name = "Klaxon classique 9", id = 36},
            {name = "Klaxon classique 10", id = 37},
            {name = "Funéraire Loop", id = 38},
            {name = "Funéraire", id = 39},
            {name = "Sinistre Loop", id = 40},
            {name = "Sinistre", id = 41},
            {name = "San Andreas Loop", id = 42},
            {name = "San Andreas", id = 43},
            {name = "Liberty City Loop", id = 44},
            {name = "Liberty City", id = 45},
            {name = "Festive 1 Loop", id = 46},
            {name = "Festive 1", id = 47},
            {name = "Festive 2 Loop", id = 48},
            {name = "Festive 2", id = 49},
            {name = "Festive 3 Loop", id = 50},
            {name = "Festive 3", id = 51}
        }
    }
}

-- COLORS

vehicleResprayOptions = {
    {category = "Classic", id = 0,
        colours = {
            {name = "Noire", id = 0},
            {name = "Noir carbone", id = 147},
            {name = "Graphite", id = 1},
            {name = "Noir anthracite ", id = 11},
            {name = "Acier noir", id = 11},
            {name = "Acier foncé", id = 3},
            {name = "Argent", id = 4},
            {name = "Argent bleuté", id = 5},
            {name = "Rolled Steel", id = 6},
            {name = "Shadow Silver", id = 7},
            {name = "Stone Silver", id = 8},
            {name = "Midnight Silver", id = 9},
            {name = "Cast Iron Silver", id = 10},
            {name = "Rouge", id = 27},
            {name = "Rouge Torino", id = 28},
            {name = "Rouge Formula", id = 29},
            {name = "Rouge lave", id = 150},
            {name = "Rouge flamboyant", id = 30},
            {name = "Grace Red", id = 31},
            {name = "Garnet Red", id = 32},
            {name = "Sunset Red", id = 33},
            {name = "Cabernet Red", id = 34},
            {name = "Vin rouge", id = 143},
            {name = "Rouge bonbon", id = 35},
            {name = "Rose vif", id = 135},
            {name = "Pfsiter Pink", id = 137},
            {name = "Rose saumon", id = 136},
            {name = "orange soleil", id = 36},
            {name = "Orange", id = 38},
            {name = "Orange vif", id = 138},
            {name = "Or", id = 99},
            {name = "Bronze", id = 90},
            {name = "Jaune", id = 88},
            {name = "Jaune course", id = 89},
            {name = "Dew Yellow", id = 91},
            {name = "Vert foncé", id = 49},
            {name = "Vert course", id = 50},
            {name = "Vert de la mer", id = 51},
            {name = "Vert olive", id = 52},
            {name = "Vert clair", id = 53},
            {name = "Gasoline Green", id = 54},
            {name = "Vert citron", id = 92},
            {name = "Bleu nuit", id = 141},
            {name = "Bleu galaxie", id = 61},
            {name = "Bleu foncé", id = 62},
            {name = "Saxon Blue", id = 63},
            {name = "Bleue", id = 64},
            {name = "Bleu marine", id = 65},
            {name = "Harbor Blue", id = 66},
            {name = "Diamond Blue", id = 67},
            {name = "Surf Blue", id = 68},
            {name = "Nautical Blue", id = 69},
            {name = "Racing Blue", id = 73},
            {name = "Bleu ultra", id = 70},
            {name = "Bleu clair", id = 74},
            {name = "Brun chocolat", id = 96},
            {name = "Bison Brown", id = 101},
            {name = "Creeen Brown", id = 95},
            {name = "Feltzer Brown", id = 94},
            {name = "Maple Brown", id = 97},
            {name = "Beechwood Brown", id = 103},
            {name = "Sienna Brown", id = 104},
            {name = "Saddle Brown", id = 98},
            {name = "Moss Brown", id = 100},
            {name = "Woodbeech Brown", id = 102},
            {name = "Straw Brown", id = 99},
            {name = "Sandy Brown", id = 105},
            {name = "Bleached Brown", id = 106},
            {name = "Schafter Purple", id = 71},
            {name = "Spinnaker Purple", id = 72},
            {name = "Midnight Purple", id = 142},
            {name = "Bright Purple", id = 145},
            {name = "Crème", id = 107},
            {name = "Blanc glacé", id = 111},
            {name = "Blanc givré", id = 112}
        }
    }, 
    {category = "Métallique", id = 1,
        colours = {{name = "Noire", id = 0},
            {name = "Carbon Black", id = 147},
            {name = "Graphite", id = 1},
            {name = "Anhracite Black", id = 11},
            {name = "Black Steel", id = 11},
            {name = "Dark Steel", id = 3},
            {name = "Silver", id = 4},
            {name = "Bluish Silver", id = 5},
            {name = "Rolled Steel", id = 6},
            {name = "Shadow Silver", id = 7},
            {name = "Stone Silver", id = 8},
            {name = "Midnight Silver", id = 9},
            {name = "Cast Iron Silver", id = 10},
            {name = "Red", id = 27},
            {name = "Torino Red", id = 28},
            {name = "Formula Red", id = 29},
            {name = "Lava Red", id = 150},
            {name = "Blaze Red", id = 30},
            {name = "Grace Red", id = 31},
            {name = "Garnet Red", id = 32},
            {name = "Sunset Red", id = 33},
            {name = "Cabernet Red", id = 34},
            {name = "Wine Red", id = 143},
            {name = "Candy Red", id = 35},
            {name = "Hot Pink", id = 135},
            {name = "Pfsiter Pink", id = 137},
            {name = "Salmon Pink", id = 136},
            {name = "Sunrise Orange", id = 36},
            {name = "Orange", id = 38},
            {name = "Bright Orange", id = 138},
            {name = "Gold", id = 99},
            {name = "Bronze", id = 90},
            {name = "Yellow", id = 88},
            {name = "Race Yellow", id = 89},
            {name = "Dew Yellow", id = 91},
            {name = "Dark Green", id = 49},
            {name = "Racing Green", id = 50},
            {name = "Sea Green", id = 51},
            {name = "Olive Green", id = 52},
            {name = "Bright Green", id = 53},
            {name = "Gasoline Green", id = 54},
            {name = "Lime Green", id = 92},
            {name = "Midnight Blue", id = 141},
            {name = "Galaxy Blue", id = 61},
            {name = "Dark Blue", id = 62},
            {name = "Saxon Blue", id = 63},
            {name = "Blue", id = 64},
            {name = "Mariner Blue", id = 65},
            {name = "Harbor Blue", id = 66},
            {name = "Diamond Blue", id = 67},
            {name = "Surf Blue", id = 68},
            {name = "Nautical Blue", id = 69},
            {name = "Racing Blue", id = 73},
            {name = "Ultra Blue", id = 70},
            {name = "Light Blue", id = 74},
            {name = "Chocolate Brown", id = 96},
            {name = "Bison Brown", id = 101},
            {name = "Creeen Brown", id = 95},
            {name = "Feltzer Brown", id = 94},
            {name = "Maple Brown", id = 97},
            {name = "Beechwood Brown", id = 103},
            {name = "Sienna Brown", id = 104},
            {name = "Saddle Brown", id = 98},
            {name = "Moss Brown", id = 100},
            {name = "Woodbeech Brown", id = 102},
            {name = "Straw Brown", id = 99},
            {name = "Sandy Brown", id = 105},
            {name = "Bleached Brown", id = 106},
            {name = "Schafter Purple", id = 71},
            {name = "Spinnaker Purple", id = 72},
            {name = "Midnight Purple", id = 142},
            {name = "Bright Purple", id = 145},
            {name = "Cream", id = 107},
            {name = "Ice White", id = 111},
            {name = "Frost White", id = 112}
        }
    },
    {category = "Mat", id = 2,
        colours = {{name = "Black", id = 12},
            {name = "Gris", id = 13},
            {name = "Gris clair", id = 14},
            {name = "Blanc glacé", id = 131},
            {name = "Bleu", id = 83},
            {name = "Bleu foncé", id = 82},
            {name = "Midnight Blue", id = 84},
            {name = "Midnight Purple", id = 149},
            {name = "Schafter Purple", id = 148},
            {name = "Rouge", id = 39},
            {name = "Rouge foncé", id = 40},
            {name = "Orange", id = 41},
            {name = "Jaune", id = 42},
            {name = "Lime Green", id = 55},
            {name = "Vert", id = 128},
            {name = "Forest Green", id = 151},
            {name = "Foliage Green", id = 155},
            {name = "Olive Darb", id = 152},
            {name = "Dark Earth", id = 153},
            {name = "Desert Tan", id = 154}
        }
    },
    {category = "Métaux", id = 3,
            colours = {{name = "Brushed Steel", id = 117},
            {name = "Brushed Black Steel", id = 118},
            {name = "Brushed Aluminium", id = 119},
            {name = "Pure Gold", id = 158},
            {name = "Brushed Gold", id = 159},
            {name = "Chrome", id = 120}
        }
    }
}
