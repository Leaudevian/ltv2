Config = {}

Config.MenuItems = {
    [1] = {
        id = 'citizen',
        title = 'Citoyen',
        icon = 'user',
        items = {
            {
                id = 'givenum',
                title = 'Donner des coordonnées',
                icon = 'address-book',
                type = 'client',
                event = 'qb-phone:client:GiveContactDetails',
                shouldClose = true
            }, {
                id = 'getintrunk',
                title = 'Entrer dans le coffre',
                icon = 'car',
                type = 'client',
                event = 'qb-trunk:client:GetIn',
                shouldClose = true
            }, {
                id = 'cornerselling',
                title = 'Vendre de la weed',
                icon = 'cannabis',
                type = 'client',
                event = 'qb-drugs:client:cornerselling',
                shouldClose = true
            }, {
                id = 'togglehotdogsell',
                title = 'Vente de Hot-dog',
                icon = 'hotdog',
                type = 'client',
                event = 'qb-hotdogjob:client:ToggleSell',
                shouldClose = true
            }, {
                id = 'interactions',
                title = 'Interactions',
                icon = 'exclamation-triangle',
                items = {
                    {
                        id = 'handcuff',
                        title = 'Arrêté',
                        icon = 'user-lock',
                        type = 'client',
                        event = 'police:client:CuffPlayerSoft',
                        shouldClose = true
                    }, {
                        id = 'playerinvehicle',
                        title = 'Mettre dans le véhicule',
                        icon = 'car-side',
                        type = 'client',
                        event = 'police:client:PutPlayerInVehicle',
                        shouldClose = true
                    }, {
                        id = 'playeroutvehicle',
                        title = 'Sortir du véhicule',
                        icon = 'car-side',
                        type = 'client',
                        event = 'police:client:SetPlayerOutVehicle',
                        shouldClose = true
                    }, {
                        id = 'stealplayer',
                        title = 'rob player',
                        icon = 'mask',
                        type = 'client',
                        event = 'police:client:RobPlayer',
                        shouldClose = true
                    }, {
                        id = 'escort',
                        title = 'Kidnapper',
                        icon = 'user-friends',
                        type = 'client',
                        event = 'police:client:KidnapPlayer',
                        shouldClose = true
                    }, {
                        id = 'escort2',
                        title = 'Escorter',
                        icon = 'user-friends',
                        type = 'client',
                        event = 'police:client:EscortPlayer',
                        shouldClose = true
                    }, {
                        id = 'escort554',
                        title = 'Otage',
                        icon = 'child',
                        type = 'client',
                        event = 'A5:Client:TakeHostage',
                        shouldClose = true
                    }
                }
            }
        }
    },
    [2] = {
        id = 'general',
        title = 'Générale',
        icon = 'list-alt',
        items = {
            {
                id = 'house',
                title = 'Maison Interaction',
                icon = 'home',
                items = {
                    {
                        id = 'givehousekey',
                        title = 'Prendre les clés',
                        icon = 'key',
                        type = 'client',
                        event = 'qb-houses:client:giveHouseKey',
                        shouldClose = true,
                        items = {}
                    }, {
                        id = 'removehousekey',
                        title = 'Enlever les clés',
                        icon = 'key',
                        type = 'client',
                        event = 'qb-houses:client:removeHouseKey',
                        shouldClose = true,
                        items = {}
                    }, {
                        id = 'togglelock',
                        title = 'Fermer la porte',
                        icon = 'door-closed',
                        type = 'client',
                        event = 'qb-houses:client:toggleDoorlock',
                        shouldClose = true
                    }, {
                        id = 'decoratehouse',
                        title = 'Décorer la maison',
                        icon = 'boxes',
                        type = 'client',
                        event = 'qb-houses:client:decorate',
                        shouldClose = true
                    }, {
                        id = 'houseLocations',
                        title = 'Locations Interaction',
                        icon = 'home',
                        items = {
                            {
                                id = 'setstash',
                                title = 'Armoire',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-houses:client:setLocation',
                                shouldClose = true
                            }, {
                                id = 'setoutift',
                                title = 'Dressing',
                                icon = 'tshirt',
                                type = 'client',
                                event = 'qb-houses:client:setLocation',
                                shouldClose = true
                            }, {
                                id = 'setlogout',
                                title = 'Sortir',
                                icon = 'door-open',
                                type = 'client',
                                event = 'qb-houses:client:setLocation',
                                shouldClose = true
                            }
                        }
                    }
                }
            }, {
                id = 'clothesmenu',
                title = 'Vêtements',
                icon = 'tshirt',
                items = {
                    {
                        id = 'Hair',
                        title = 'Cheveux',
                        icon = 'user',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Ear',
                        title = 'Oreille',
                        icon = 'deaf',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleProps',
                        shouldClose = true
                    }, {
                        id = 'Neck',
                        title = 'Cou',
                        icon = 'user-tie',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Top',
                        title = 'Top',
                        icon = 'tshirt',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Shirt',
                        title = 'Shirt',
                        icon = 'tshirt',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Pants',
                        title = 'Pantalons',
                        icon = 'user',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Shoes',
                        title = 'Chaussures',
                        icon = 'shoe-prints',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'meer',
                        title = 'Extras',
                        icon = 'plus',
                        items = {
                            {
                                id = 'Hat',
                                title = 'Chapeau',
                                icon = 'hat-cowboy-side',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Glasses',
                                title = 'Lunettes',
                                icon = 'glasses',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Visor',
                                title = 'Casque',
                                icon = 'hat-cowboy-side',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Mask',
                                title = 'Masque',
                                icon = 'theater-masks',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true
                            }, {
                                id = 'Vest',
                                title = 'Gilet',
                                icon = 'vest',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true
                            }, {
                                id = 'Bag',
                                title = 'Sac',
                                icon = 'shopping-bag',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true
                            }, {
                                id = 'Bracelet',
                                title = 'Bracelet',
                                icon = 'user',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Watch',
                                title = 'Montre',
                                icon = 'stopwatch',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Gloves',
                                title = 'Gants',
                                icon = 'mitten',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true
                            }
                        }
                    }
                }
            }
        }
    },
    [3] = {
        id = 'vehicle',
        title = 'Véhicule',
        icon = 'car',
        items = {
            {
                id = 'vehicledoors',
                title = 'Portes du véhicule',
                icon = 'car-side',
                items = {
                    {
                        id = 'door0',
                        title = 'Porte de conducteur',
                        icon = 'car-side',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false
                    }, {
                        id = 'door4',
                        title = 'Capote',
                        icon = 'car',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false
                    }, {
                        id = 'door1',
                        title = 'Porte des passagers',
                        icon = 'car-side',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false
                    }, {
                        id = 'door3',
                        title = 'Arrière droite',
                        icon = 'car-side',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false
                    }, {
                        id = 'door5',
                        title = 'Coffre',
                        icon = 'car',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false
                    }, {
                        id = 'door2',
                        title = 'Arrière gauche',
                        icon = 'car-side',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false
                    }
                }
            }, {
                id = 'vehicleextras',
                title = 'Véhicules Extras',
                icon = 'plus',
                items = {
                    {
                        id = 'extra1',
                        title = 'Extra 1',
                        icon = 'box-open',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra2',
                        title = 'Extra 2',
                        icon = 'box-open',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra3',
                        title = 'Extra 3',
                        icon = 'box-open',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra4',
                        title = 'Extra 4',
                        icon = 'box-open',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra5',
                        title = 'Extra 5',
                        icon = 'box-open',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra6',
                        title = 'Extra 6',
                        icon = 'box-open',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra7',
                        title = 'Extra 7',
                        icon = 'box-open',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra8',
                        title = 'Extra 8',
                        icon = 'box-open',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra9',
                        title = 'Extra 9',
                        icon = 'box-open',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra10',
                        title = 'Extra 10',
                        icon = 'box-open',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra11',
                        title = 'Extra 11',
                        icon = 'box-open',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra12',
                        title = 'Extra 12',
                        icon = 'box-open',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra13',
                        title = 'Extra 13',
                        icon = 'box-open',
                        type = 'client',
                        event = 'qb-radialmenu:client:setExtra',
                        shouldClose = false
                    }
                }
            }, {
                id = 'vehicleseats',
                title = 'Sièges de véhicule',
                icon = 'chair',
                items = {
                    {
                        id = 'door0',
                        title = 'Conducteur',
                        icon = 'chair',
                        type = 'client',
                        event = 'qb-radialmenu:client:ChangeSeat',
                        shouldClose = false
                    }
                }
            }
        }
    },
    [4] = {
        id = 'jobinteractions',
        title = 'Travail',
        icon = 'briefcase',
        items = {}
    }
}

Config.JobInteractions = {
    ["ambulance"] = {
        {
            id = 'statuscheck',
            title = 'Vérifier l\'état de santé',
            icon = 'heartbeat',
            type = 'client',
            event = 'hospital:client:CheckStatus',
            shouldClose = true
        },{
            id = 'revivep',
            title = 'Revive',
            icon = 'user-md',
            type = 'client',
            event = 'hospital:client:RevivePlayer',
            shouldClose = true
        },{
            id = 'treatwounds',
            title = 'Guérir les blessures',
            icon = 'band-aid',
            type = 'client',
            event = 'hospital:client:TreatWounds',
            shouldClose = true
        }, {
            id = 'emergencybutton2',
            title = 'Bouton d\'urgence',
            icon = 'bell',
            type = 'client',
            event = 'police:client:SendPoliceEmergencyAlert',
            shouldClose = true
        }, {
            id = 'escort',
            title = 'Escorter',
            icon = 'user-friends',
            type = 'client',
            event = 'police:client:EscortPlayer',
            shouldClose = true
        }, {
            id = 'stretcheroptions',
            title = 'Civière',
            icon = 'procedures',
            items = {
                {
                    id = 'spawnstretcher',
                    title = 'Sortir la civière',
                    icon = 'plus',
                    type = 'client',
                    event = 'qb-radialmenu:client:TakeStretcher',
                    shouldClose = false
                }, {
                    id = 'despawnstretcher',
                    title = 'Ranger la civière',
                    icon = 'minus',
                    type = 'client',
                    event = 'qb-radialmenu:client:RemoveStretcher',
                    shouldClose = false
                }
            }
        }
    },
    ["taxi"] = {
        {
            id = 'togglemeter',
            title = 'Montrer/Masquer le compteur',
            icon = 'eye-slash',
            type = 'client',
            event = 'qb-taxi:client:toggleMeter',
            shouldClose = false
        }, {
            id = 'togglemouse',
            title = 'Démarrer/Arrêté le compteur',
            icon = 'hourglass-start',
            type = 'client',
            event = 'qb-taxi:client:enableMeter',
            shouldClose = true
        }, {
            id = 'npc_mission',
            title = 'Mission PNJ',
            icon = 'taxi',
            type = 'client',
            event = 'qb-taxi:client:DoTaxiNpc',
            shouldClose = true
        }
    },
    ["tow"] = {
        {
            id = 'togglenpc',
            title = 'Mission PNJ',
            icon = 'toggle-on',
            type = 'client',
            event = 'jobs:client:ToggleNpc',
            shouldClose = true
        }, {
            id = 'towvehicle',
            title = 'Remorquager',
            icon = 'truck-pickup',
            type = 'client',
            event = 'qb-tow:client:TowVehicle',
            shouldClose = true
        }
    },
    ["police"] = {
        {
            id = 'emergencybutton',
            title = 'Bouton d\'urgence',
            icon = 'bell',
            type = 'client',
            event = 'police:client:SendPoliceEmergencyAlert',
            shouldClose = true
        }, {
            id = 'checkvehstatus',
            title = 'Check Tune Status',
            icon = 'info-circle',
            type = 'client',
            event = 'qb-tunerchip:client:TuneStatus',
            shouldClose = true
        }, {
            id = 'resethouse',
            title = 'Réinitialiser la serrure de la maison',
            icon = 'key',
            type = 'client',
            event = 'qb-houses:client:ResetHouse',
            shouldClose = true
        }, {
            id = 'takedriverlicense',
            title = 'Retirer le permis de conduire',
            icon = 'id-card',
            type = 'client',
            event = 'police:client:SeizeDriverLicense',
            shouldClose = true
        }, {
            id = 'policeinteraction',
            title = 'Police Actions',
            icon = 'tasks',
            items = {
                {
                    id = 'statuscheck',
                    title = 'Vérifier l\'état de santé',
                    icon = 'heartbeat',
                    type = 'client',
                    event = 'hospital:client:CheckStatus',
                    shouldClose = true
                }, {
                    id = 'checkstatus',
                    title = 'Check status',
                    icon = 'question',
                    type = 'client',
                    event = 'police:client:CheckStatus',
                    shouldClose = true
                }, {
                    id = 'escort',
                    title = 'Escorter',
                    icon = 'user-friends',
                    type = 'client',
                    event = 'police:client:EscortPlayer',
                    shouldClose = true
                }, {
                    id = 'searchplayer',
                    title = 'Rechercher',
                    icon = 'search',
                    type = 'client',
                    event = 'police:client:SearchPlayer',
                    shouldClose = true
                }, {
                    id = 'jailplayer',
                    title = 'Prison',
                    icon = 'user-lock',
                    type = 'client',
                    event = 'police:client:JailPlayer',
                    shouldClose = true
                }
            }
        }, {
            id = 'policeobjects',
            title = 'Objects',
            icon = 'road',
            items = {
                {
                    id = 'spawnpion',
                    title = 'Cone',
                    icon = 'exclamation-triangle',
                    type = 'client',
                    event = 'police:client:spawnCone',
                    shouldClose = false
                }, {
                    id = 'spawnhek',
                    title = 'Barrière',
                    icon = 'torii-gate',
                    type = 'client',
                    event = 'police:client:spawnBarier',
                    shouldClose = false
                }, {
                    id = 'spawnschotten',
                    title = 'Panneau de limite de vitesse',
                    icon = 'sign',
                    type = 'client',
                    event = 'police:client:spawnSchotten',
                    shouldClose = false
                }, {
                    id = 'spawntent',
                    title = 'Tente',
                    icon = 'campground',
                    type = 'client',
                    event = 'police:client:spawnTent',
                    shouldClose = false
                }, {
                    id = 'spawnverlichting',
                    title = 'Éclairage',
                    icon = 'lightbulb',
                    type = 'client',
                    event = 'police:client:spawnLight',
                    shouldClose = false
                }, {
                    id = 'spikestrip',
                    title = 'Herse',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'police:client:SpawnSpikeStrip',
                    shouldClose = false
                }, {
                    id = 'deleteobject',
                    title = 'Retirer l\'objet',
                    icon = 'trash',
                    type = 'client',
                    event = 'police:client:deleteObject',
                    shouldClose = false
                }
            }
        }
    },
    ["hotdog"] = {
        {
            id = 'togglesell',
            title = 'Démarrer la vente',
            icon = 'hotdog',
            type = 'client',
            event = 'qb-hotdogjob:client:ToggleSell',
            shouldClose = true
        }
    }
    -- ["taxi"] = {

    -- },
}

Config.TrunkClasses = {
    [0] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupes  
    [1] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sedans  
    [2] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- SUVs  
    [3] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupes  
    [4] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Muscle  
    [5] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sports Classics  
    [6] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sports  
    [7] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Super  
    [8] = {allowed = false, x = 0.0, y = -1.0, z = 0.25}, -- Motorcycles  
    [9] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Off-road  
    [10] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Industrial  
    [11] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Utility  
    [12] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Vans  
    [13] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Cycles  
    [14] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Boats  
    [15] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Helicopters  
    [16] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Planes  
    [17] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Service  
    [18] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Emergency  
    [19] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Military  
    [20] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Commercial  
    [21] = {allowed = true, x = 0.0, y = -1.0, z = 0.25} -- Trains  
}

Config.ExtrasEnabled = true

Config.Commands = {
    ["top"] = {
        Func = function() ToggleClothing("Top") end,
        Sprite = "top",
        Desc = "Mettre/Enlever sa chemise",
        Button = 1,
        Name = "Torso"
    },
    ["gloves"] = {
        Func = function() ToggleClothing("Gloves") end,
        Sprite = "gloves",
        Desc = "Mettre/Enlever ces gants",
        Button = 2,
        Name = "Gloves"
    },
    ["visor"] = {
        Func = function() ToggleProps("Visor") end,
        Sprite = "visor",
        Desc = "Mettre/Enlever son casque",
        Button = 3,
        Name = "Visor"
    },
    ["bag"] = {
        Func = function() ToggleClothing("Bag") end,
        Sprite = "bag",
        Desc = "Ouvrir ou fermer votre sac",
        Button = 8,
        Name = "Bag"
    },
    ["shoes"] = {
        Func = function() ToggleClothing("Shoes") end,
        Sprite = "shoes",
        Desc = "Mettre/Enlever ces chaussures",
        Button = 5,
        Name = "Shoes"
    },
    ["vest"] = {
        Func = function() ToggleClothing("Vest") end,
        Sprite = "vest",
        Desc = "Mettre/Enlever son gilet",
        Button = 14,
        Name = "Vest"
    },
    ["hair"] = {
        Func = function() ToggleClothing("Hair") end,
        Sprite = "hair",
        Desc = "Mettre ces cheveux haut/bas/en chignon/queue de cheval.",
        Button = 7,
        Name = "Hair"
    },
    ["hat"] = {
        Func = function() ToggleProps("Hat") end,
        Sprite = "hat",
        Desc = "Mettre/Enlever son chapeau",
        Button = 4,
        Name = "Hat"
    },
    ["glasses"] = {
        Func = function() ToggleProps("Glasses") end,
        Sprite = "glasses",
        Desc = "Mettre/Enlever ces lunettes",
        Button = 9,
        Name = "Glasses"
    },
    ["ear"] = {
        Func = function() ToggleProps("Ear") end,
        Sprite = "ear",
        Desc = "Mettre/Enlever ses accessoires d'oreille",
        Button = 10,
        Name = "Ear"
    },
    ["neck"] = {
        Func = function() ToggleClothing("Neck") end,
        Sprite = "neck",
        Desc = "Mettre/Enlever l'accessoire de cou",
        Button = 11,
        Name = "Neck"
    },
    ["watch"] = {
        Func = function() ToggleProps("Watch") end,
        Sprite = "watch",
        Desc = "Mettre/Enlever sa montre",
        Button = 12,
        Name = "Watch",
        Rotation = 5.0
    },
    ["bracelet"] = {
        Func = function() ToggleProps("Bracelet") end,
        Sprite = "bracelet",
        Desc = "Mettre/Enlever son bracelet",
        Button = 13,
        Name = "Bracelet"
    },
    ["mask"] = {
        Func = function() ToggleClothing("Mask") end,
        Sprite = "mask",
        Desc = "Mettre/Enlever son masque",
        Button = 6,
        Name = "Mask"
    }
}

local Bags = {[40] = true, [41] = true, [44] = true, [45] = true}

Config.ExtraCommands = {
    ["pants"] = {
        Func = function() ToggleClothing("Pants", true) end,
        Sprite = "pants",
        Desc = "Mettre/Enlever son pantalon",
        Name = "Pants",
        OffsetX = -0.04,
        OffsetY = 0.0
    },
    ["shirt"] = {
        Func = function() ToggleClothing("Shirt", true) end,
        Sprite = "shirt",
        Desc = "Mettre/Enlever sa chemise",
        Name = "shirt",
        OffsetX = 0.04,
        OffsetY = 0.0
    },
    ["reset"] = {
        Func = function()
            if not ResetClothing(true) then
                Notify('Rien à réinitialiser', 'error')
            end
        end,
        Sprite = "reset",
        Desc = "Tout remettre à la normal",
        Name = "reset",
        OffsetX = 0.12,
        OffsetY = 0.2,
        Rotate = true
    },
    ["bagoff"] = {
        Func = function() ToggleClothing("Bagoff", true) end,
        Sprite = "bagoff",
        SpriteFunc = function()
            local Bag = GetPedDrawableVariation(PlayerPedId(), 5)
            local BagOff = LastEquipped["Bagoff"]
            if LastEquipped["Bagoff"] then
                if Bags[BagOff.Drawable] then
                    return "bagoff"
                else
                    return "paraoff"
                end
            end
            if Bag ~= 0 then
                if Bags[Bag] then
                    return "bagoff"
                else
                    return "paraoff"
                end
            else
                return false
            end
        end,
        Desc = "Mettre/Enlever son sac",
        Name = "bagoff",
        OffsetX = -0.12,
        OffsetY = 0.2
    }
}