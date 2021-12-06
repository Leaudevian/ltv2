local group = Config.Group

-- Check if is decorating --

local IsDecorating = false

RegisterNetEvent('qb-anticheat:client:ToggleDecorate')
AddEventHandler('qb-anticheat:client:ToggleDecorate', function(bool)
  IsDecorating = bool
end)

-- Few frequently used locals --

local flags = 0
local isLoggedIn = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('qb-anticheat:server:GetPermissions', function(UserGroup)
        group = UserGroup
    end)
    isLoggedIn = true
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
    IsDecorating = false
    flags = 0
end)

-- Superjump --

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(500)

        local ped = PlayerPedId()
        local player = PlayerId()

        if group == Config.Group and isLoggedIn then
            if IsPedJumping(ped) then
                local firstCoord = GetEntityCoords(ped)

                while IsPedJumping(ped) do
                    Citizen.Wait(0)
                end

                local secondCoord = GetEntityCoords(ped)
                local lengthBetweenCoords = #(firstCoord - secondCoord)

                if (lengthBetweenCoords > Config.SuperJumpLength) then
                    flags = flags + 1
                    TriggerServerEvent("qb-log:server:CreateLog", "anticheat", "Triche détectée!", "orange", "** @everyone " ..GetPlayerName(player).. "** est signalé par Anticheat! **(Flag "..flags.." /"..Config.FlagsForBan.." | Superjump)**")
                end
            end
        end
    end
end)

-- Speedhack --

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(500)

        local ped = PlayerPedId()
        local player = PlayerId()
        local speed = GetEntitySpeed(ped)
        local inveh = IsPedInAnyVehicle(ped, false)
        local ragdoll = IsPedRagdoll(ped)
        local jumping = IsPedJumping(ped)
        local falling = IsPedFalling(ped)

        if group == Config.Group and isLoggedIn then
            if not inveh then
                if not ragdoll then
                    if not falling then
                        if not jumping then
                            if speed > Config.MaxSpeed then
                                flags = flags + 1
                                TriggerServerEvent("qb-log:server:CreateLog", "anticheat", "Triche détectée!", "orange", "** @everyone " ..GetPlayerName(player).. "** est signalé par Anticheat! **(Flag "..flags.." /"..Config.FlagsForBan.." | Speedhack)**")
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- Invisibility --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10000)

        local ped = PlayerPedId()
        local player = PlayerId()

        if group == Config.Group and isLoggedIn then
            if not IsDecorating then
                if not IsEntityVisible(ped) then
                    SetEntityVisible(ped, 1, 0)
                    TriggerEvent('QBCore:Notify', "QB-ANTICHEAT: Vous étiez invisible et avez été rendu visible à nouveau!")
                    TriggerServerEvent("qb-log:server:CreateLog", "anticheat", "Rendre le joueur visible", "green", "** @everyone " ..GetPlayerName(player).. "** était invisible et a été rendu visible à nouveau par QB-Anticheat")
                end
            end
        end
    end
end)

-- Nightvision --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)

        local ped = PlayerPedId()
        local player = PlayerId()

        if group == Config.Group and isLoggedIn then
            if GetUsingnightvision(true) then
                if not IsPedInAnyHeli(ped) then
                    flags = flags + 1
                    TriggerServerEvent("qb-log:server:CreateLog", "anticheat", "Triche détectée!", "orange", "** @everyone " ..GetPlayerName(player).. "** est signalé par anticheat! **(Flag "..flags.." /"..Config.FlagsForBan.." | Nightvision)**")
                end
            end
        end
    end
end)

-- Thermalvision --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)

        local ped = PlayerPedId()

        if group == Config.Group and isLoggedIn then
            if GetUsingseethrough(true) then
                if not IsPedInAnyHeli(ped) then
                    flags = flags + 1
                    TriggerServerEvent("qb-log:server:CreateLog", "anticheat", "Triche détectée!", "orange", "** @everyone " ..GetPlayerName(player).. "** est signalé par anticheat! **(Flag "..flags.." /"..Config.FlagsForBan.." | Thermalvision)**") 
                end
            end
        end
    end
end)

-- Spawned car --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local ped = PlayerPedId()
        local player = PlayerId()
        local veh = GetVehiclePedIsIn(ped)
        local DriverSeat = GetPedInVehicleSeat(veh, -1)
        local plate = GetVehicleNumberPlateText(veh)

        if isLoggedIn then
            if group == Config.Group then
                if IsPedInAnyVehicle(ped, true) then
                    for _, BlockedPlate in pairs(Config.BlacklistedPlates) do
                        if plate == BlockedPlate then
                            if DriverSeat == ped then
                                DeleteVehicle(veh)
                                TriggerServerEvent("qb-anticheat:server:banPlayer", "Cheating")
                                TriggerServerEvent("qb-log:server:CreateLog", "anticheat", "Triche détectée!", "red", "** @everyone " ..GetPlayerName(player).. "** a été banni pour triche (assis sous forme de pilote dans un véhicule engendré avec une plaque d'immatriculation **"..BlockedPlate..")**")
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- Check if ped has weapon in inventory --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)

        if isLoggedIn then

            local PlayerPed = PlayerPedId()
            local player = PlayerId()
            local CurrentWeapon = GetSelectedPedWeapon(PlayerPed)
            local WeaponInformation = QBCore.Shared.Weapons[CurrentWeapon]

            if WeaponInformation["name"] ~= "weapon_unarmed" then
                QBCore.Functions.TriggerCallback('qb-anticheat:server:HasWeaponInInventory', function(HasWeapon)
                    if not HasWeapon then
                        RemoveAllPedWeapons(PlayerPed, false)
                        TriggerServerEvent("qb-log:server:CreateLog", "anticheat", "Arme enlevée!", "orange", "** @everyone " ..GetPlayerName(player).. "** à une arme sur lui qu'ils n'avaient pas dans son inventaire. QB Anticheat a enlevé l\'arme.")
                    end
                end, WeaponInformation)
            end
        end
    end
end)

-- Max flags reached = ban, log, explosion & break --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local player = PlayerId()
        if flags >= Config.FlagsForBan then
            -- TriggerServerEvent("qb-anticheat:server:banPlayer", "Cheating")
            -- AddExplosion(coords, EXPLOSION_GRENADE, 1000.0, true, false, false, true)
            TriggerServerEvent("qb-log:server:CreateLog", "anticheat", "Joueur banni! (Pas vraiment bien sûr, c'est un test hahahaha)", "red", "** @everyone " ..GetPlayerName(player).. "** Trop souvent a été signalé par l'anti-triche et préventivement banni du serveur")
            flags = 0
        end
    end
end)

RegisterNetEvent('qb-anticheat:client:NonRegisteredEventCalled')
AddEventHandler('qb-anticheat:client:NonRegisteredEventCalled', function(reason, CalledEvent)
    local player = PlayerId()

    TriggerServerEvent('qb-anticheat:server:banPlayer', reason)
    TriggerServerEvent("qb-log:server:CreateLog", "anticheat", "Joueur banni! (Pas vraiment bien sûr, c'est un test hahahaha)", "red", "** @everyone " ..GetPlayerName(player).. "** a un événement **"..CalledEvent.."essayé de déclencher (injecteur Lua!)")
end)
