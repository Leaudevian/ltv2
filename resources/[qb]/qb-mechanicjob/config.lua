Config = {}

Config.AttachedVehicle = nil

Config.AuthorizedIds = {
    "insertcitizenidhere",
}

Config.MaxStatusValues = {
    ["engine"] = 1000.0,
    ["body"] = 1000.0,
    ["radiator"] = 100,
    ["axle"] = 100,
    ["brakes"] = 100,
    ["clutch"] = 100,
    ["fuel"] = 100,
}

Config.ValuesLabels = {
    ["engine"] = "Moteur",
    ["body"] = "Carosserie",
    ["radiator"] = "Radiateur",
    ["axle"] = "Arbre de transmission",
    ["brakes"] = "Freins",
    ["clutch"] = "Embrayage",
    ["fuel"] = "Réservoir d\'essence",
}

Config.RepairCost = {
    ["body"] = "plastic",
    ["radiator"] = "plastic",
    ["axle"] = "steel",
    ["brakes"] = "iron",
    ["clutch"] = "aluminum",
    ["fuel"] = "plastic",
}

Config.RepairCostAmount = {
    ["engine"] = {
        item = "metalscrap",
        costs = 2,
    },
    ["body"] = {
        item = "plastic",
        costs = 3,
    },
    ["radiator"] = {
        item = "steel",
        costs = 5,
    },
    ["axle"] = {
        item = "aluminum",
        costs = 7,
    },
    ["brakes"] = {
        item = "copper",
        costs = 5,
    },
    ["clutch"] = {
        item = "copper",
        costs = 6,
    },
    ["fuel"] = {
        item = "plastic",
        costs = 5,
    },
}

Config.Businesses = {
    "Auto Repair",
}

Config.Plates = {
    [1] = {
        coords = vector4(-582.99, -931.75, 23.38, 269.66), --Position des ponts de réparation et sens du vehicule sur le pont
        AttachedVehicle = nil,
    },
    [2] = {
        coords = vector4(-582.99, -924.66, 23.38, 269.66), --Position des ponts de réparation et sens du vehicule sur le pont
        AttachedVehicle = nil,
    },
    [3] = {
        coords = vector4(-582.99, -917.55, 23.38, 269.66), --Position des ponts de réparation et sens du vehicule sur le pont
        AttachedVehicle = nil,
    },
}

Config.Locations = {
    ["exit"] = vector3(-595.29, -930.32, 23.89), --Entré Sortie du garage + position Blips
    ["stash"] = vector3(-592.48, -932.52, 28.14), -- Stock (coffre)
    ["duty"] = vector3(-602.55, -916.08, 23.89), --Prise de service
    ["vehicle"] = vector4(-557.76, -896.62, 23.72, 209.85), -- Garage entreprise
}

Config.Vehicles = {
    ["flatbed"] = "Flatbed",
    ["towtruck"] = "Towtruck",
    ["minivan"] = "Minivan (Leen Auto)",
    ["blista"] = "Blista",
}

Config.MinimalMetersForDamage = {
    [1] = {
        min = 8000,
        max = 12000,
        multiplier = {
            min = 1,
            max = 8,
        }
    },
    [2] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 8,
            max = 16,
        }
    },
    [3] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 16,
            max = 24,
        }
    },
}

Config.Damages = {
    ["radiator"] = "Radiator",
    ["axle"] = "Drive Shaft",
    ["brakes"] = "Brakes",
    ["clutch"] = "Clutch",
    ["fuel"] = "Fuel Tank",
}
