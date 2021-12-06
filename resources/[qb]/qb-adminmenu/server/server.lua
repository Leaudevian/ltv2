-- Variables
local QBCore = exports['qb-core']:GetCoreObject()
local frozen = false
local permissions = {
    ['kill'] = 'god',
    ['ban'] = 'admin',
    ['noclip'] = 'admin',
    ['kickall'] = 'admin',
    ['kick'] = 'admin'
}

-- Get Dealers
QBCore.Functions.CreateCallback('test:getdealers', function(source, cb)
    cb(exports['qb-drugs']:GetDealers())
end)

-- Get Players
QBCore.Functions.CreateCallback('test:getplayers', function(source, cb) -- WORKS
    local players = {}
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local targetped = GetPlayerPed(v)
        local ped = QBCore.Functions.GetPlayer(v)
        table.insert(players, {
            name = ped.PlayerData.charinfo.firstname .. ' ' .. ped.PlayerData.charinfo.lastname .. ' | (' .. GetPlayerName(v) .. ')',
            id = v,
            coords = GetEntityCoords(targetped),
            cid = ped.PlayerData.charinfo.firstname .. ' ' .. ped.PlayerData.charinfo.lastname,
            citizenid = ped.PlayerData.citizenid,
            sources = GetPlayerPed(ped.PlayerData.source),
            sourceplayer= ped.PlayerData.source

        })
    end
    cb(players)
end)

QBCore.Functions.CreateCallback('qb-admin:server:getrank', function(source, cb)
    local src = source
    if QBCore.Functions.HasPermission(src, 'god') or IsPlayerAceAllowed(src, 'command') then
        cb(true)
    else
        cb(false)
    end
end)

-- Functions

local function tablelength(table)
    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count
end

-- Events

RegisterNetEvent('qb-admin:server:GetPlayersForBlips', function()
    local src = source					                        
    local players = {}                                          
    for k, v in pairs(QBCore.Functions.GetPlayers()) do         
        local targetped = GetPlayerPed(v)                       
        local ped = QBCore.Functions.GetPlayer(v)             
        table.insert(players, {                             
            name = ped.PlayerData.charinfo.firstname .. ' ' .. ped.PlayerData.charinfo.lastname .. ' | (' .. GetPlayerName(v) .. ')',
            id = v,                                      
            coords = GetEntityCoords(targetped),             
            cid = ped.PlayerData.charinfo.firstname .. ' ' .. ped.PlayerData.charinfo.lastname,
            citizenid = ped.PlayerData.citizenid,            
            sources = GetPlayerPed(ped.PlayerData.source),    
            sourceplayer= ped.PlayerData.source              
        })                                                  
    end                                                  
    TriggerClientEvent('qb-admin:client:Show', src, players)  
end)

RegisterNetEvent('qb-admin:server:kill', function(player)
    TriggerClientEvent('hospital:client:KillPlayer', player.id)
end)

RegisterNetEvent('qb-admin:server:revive', function(player)
    TriggerClientEvent('hospital:client:Revive', player.id)
end)

RegisterNetEvent('qb-admin:server:kick', function(player, reason)
    local src = source
    if QBCore.Functions.HasPermission(src, permissions['kick']) or IsPlayerAceAllowed(src, 'command')  then
        TriggerEvent('qb-log:server:CreateLog', 'bans', 'Joueur Explusé', 'red', string.format('%s a été explusé par %s pour %s', GetPlayerName(player.id), GetPlayerName(src), reason), true)
        DropPlayer(player.id, 'You have been kicked from the server:\n' .. reason .. '\n\n🔸 Consultez notre Discord pour plus d\'informations: ' .. QBCore.Config.Server.discord)
    end
end)

RegisterNetEvent('qb-admin:server:ban', function(player, time, reason)
    local src = source
    if QBCore.Functions.HasPermission(src, permissions['ban']) or IsPlayerAceAllowed(src, 'command') then
        local time = tonumber(time)
        local banTime = tonumber(os.time() + time)
        if banTime > 2147483647 then
            banTime = 2147483647
        end
        local timeTable = os.date('*t', banTime)
        exports.oxmysql:insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            GetPlayerName(player.id),
            QBCore.Functions.GetIdentifier(player.id, 'license'),
            QBCore.Functions.GetIdentifier(player.id, 'discord'),
            QBCore.Functions.GetIdentifier(player.id, 'ip'),
            reason,
            banTime,
            GetPlayerName(src)
        })
        TriggerClientEvent('chat:addMessage', -1, {
            template = "<div class=chat-message server'><strong>ANNOUNCEMENT | {0} a été banni:</strong> {1}</div>",
            args = {GetPlayerName(player.id), reason}
        })
        TriggerEvent('qb-log:server:CreateLog', 'bans', 'Joueur banni', 'red', string.format('%s a été banni par %s pour %s', GetPlayerName(player.id), GetPlayerName(src), reason), true)
        if banTime >= 2147483647 then
            DropPlayer(player.id, 'Vous avez été banni:\n' .. reason .. '\n\nVous êtes banni à vie.\n🔸 Consultez notre Discord pour plus d\'informations: ' .. QBCore.Config.Server.discord)
        else
            DropPlayer(player.id, 'Vous avez été banni:\n' .. reason .. '\n\nBannissement expire dans : ' .. timeTable["day"] .. '/' .. timeTable["month"] .. '/' .. timeTable["year"] .. ' ' .. timeTable["hour"] .. ':' .. timeTable["min"] .. '\n🔸 Consultez notre Discord pour plus d\'informations: ' .. QBCore.Config.Server.discord)
        end
    end
end)

RegisterNetEvent('qb-admin:server:spectate')
AddEventHandler('qb-admin:server:spectate', function(player)
    local src = source
    local targetped = GetPlayerPed(player.id)
    local coords = GetEntityCoords(targetped)
    TriggerClientEvent('qb-admin:client:spectate', src, player.id, coords)
end)

RegisterNetEvent('qb-admin:server:freeze')
AddEventHandler('qb-admin:server:freeze', function(player)
    local target = GetPlayerPed(player.id)
    if not frozen then
        frozen = true
        FreezeEntityPosition(target, true)
    else
        frozen = false
        FreezeEntityPosition(target, false)
    end
end)

RegisterNetEvent('qb-admin:server:goto', function(player)
    local src = source
    local admin = GetPlayerPed(src)
    local coords = GetEntityCoords(GetPlayerPed(player.id))
    SetEntityCoords(admin, coords)
end)

RegisterNetEvent('qb-admin:server:intovehicle', function(player)
    local src = source
    local admin = GetPlayerPed(src)
    -- local coords = GetEntityCoords(GetPlayerPed(player.id))
    local targetPed = GetPlayerPed(player.id)
    local vehicle = GetVehiclePedIsIn(targetPed,false)
    local seat = -1
    if vehicle ~= 0 then
        for i=0,8,1 do
            if GetPedInVehicleSeat(vehicle,i) == 0 then
                seat = i
                break
            end
        end
        if seat ~= -1 then
            SetPedIntoVehicle(admin,vehicle,seat)
            TriggerClientEvent('QBCore:Notify', src, 'Monté dans le véhicule', 'success', 5000)
        else
            TriggerClientEvent('QBCore:Notify', src, 'Le véhicule n\'a pas de siège libre!', 'danger', 5000)
        end
    end
end)


RegisterNetEvent('qb-admin:server:bring', function(player)
    local src = source
    local admin = GetPlayerPed(src)
    local coords = GetEntityCoords(admin)
    local target = GetPlayerPed(player.id)
    SetEntityCoords(target, coords)
end)

RegisterNetEvent('qb-admin:server:inventory', function(player)
    local src = source
    TriggerClientEvent('qb-admin:client:inventory', src, player.id)
end)

RegisterNetEvent('qb-admin:server:cloth', function(player)
    TriggerClientEvent('qb-clothing:client:openMenu', player.id)
end)

RegisterNetEvent('qb-admin:server:setPermissions', function(targetId, group)
    local src = source
    if QBCore.Functions.HasPermission(src, 'god') or IsPlayerAceAllowed(src, 'command') then
        QBCore.Functions.AddPermission(targetId, group[1].rank)
        TriggerClientEvent('QBCore:Notify', targetId, 'Votre niveau d\'autorisation est maintenant '..group[1].label)
    end
end)

RegisterNetEvent('qb-admin:server:SendReport', function(name, targetSrc, msg)
    local src = source
    if QBCore.Functions.HasPermission(src, 'admin')or IsPlayerAceAllowed(src, 'command') then
        if QBCore.Functions.IsOptin(src) then
            TriggerClientEvent('chat:addMessage', src, 'REPORT - '..name..' ('..targetSrc..')', 'report', msg)
        end
    end
end)

RegisterNetEvent('qb-admin:server:Staffchat:addMessage', function(name, msg)
    local src = source
    if QBCore.Functions.HasPermission(src, 'admin') or IsPlayerAceAllowed(src, 'command') then
        if QBCore.Functions.IsOptin(src) then
            TriggerClientEvent('chat:addMessage', src, 'STAFFCHAT - '..name, 'error', msg)
        end
    end
end)

RegisterNetEvent('qb-admin:server:SaveCar', function(mods, vehicle, hash, plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local result = exports.oxmysql:fetchSync('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
    if result[1] == nil then
        exports.oxmysql:insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            Player.PlayerData.license,
            Player.PlayerData.citizenid,
            vehicle.model,
            vehicle.hash,
            json.encode(mods),
            plate,
            0
        })
        TriggerClientEvent('QBCore:Notify', src, 'Le véhicule est maintenant à vous!', 'success', 5000)
    else
        TriggerClientEvent('QBCore:Notify', src, 'Ce véhicule vous appartient déjà ...', 'error', 3000)
    end
end)

-- Commands

QBCore.Commands.Add('blips', 'Afficher la position des joueurs (Admin)', {}, false, function(source, args)
    TriggerClientEvent('qb-admin:client:toggleBlips', source)
end, 'admin')

QBCore.Commands.Add('names', 'Afficher le nom des joueurs (Admin)', {}, false, function(source, args)
    TriggerClientEvent('qb-admin:client:toggleNames', source)
end, 'admin')

QBCore.Commands.Add('coords', 'Afficher les coordonées (Admin)', {}, false, function(source, args)
    TriggerClientEvent('qb-admin:client:ToggleCoords', source)
end, 'admin')

QBCore.Commands.Add('admincar', 'Garé le véhicule dans votre garage (Admin)', {}, false, function(source, args)
    local ply = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('qb-admin:client:SaveCar', source)
end, 'admin')

QBCore.Commands.Add('announce', 'Faire une annonce (Admin)', {}, false, function(source, args)
    local msg = table.concat(args, ' ')
    for i = 1, 3, 1 do
        TriggerClientEvent('chat:addMessage', -1, "SYSTEM", "error", msg)
    end
end, 'admin')

QBCore.Commands.Add('admin', 'Ouvrir le menu admin (Admin)', {}, false, function(source, args)
    TriggerClientEvent('qb-admin:client:openMenu', source)
end, 'admin')

QBCore.Commands.Add('report', 'Admin Report', {{name='message', help='Message'}}, true, function(source, args)
    local msg = table.concat(args, ' ')
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('qb-admin:client:SendReport', -1, GetPlayerName(source), source, msg)
    TriggerClientEvent('chat:addMessage', source, 'REPORT Send', 'normal', msg)
    TriggerEvent('qb-log:server:CreateLog', 'report', 'Report', 'green', '**'..GetPlayerName(source)..'** (CitizenID: '..Player.PlayerData.citizenid..' | ID: '..source..') **Report:** ' ..msg, false)
end)

QBCore.Commands.Add('staffchat', 'Envoyer un message à tout le staff (Admin)', {{name='message', help='Message'}}, true, function(source, args)
    local msg = table.concat(args, ' ')
    TriggerClientEvent('qb-admin:client:SendStaffChat', -1, GetPlayerName(source), msg)
end, 'admin')

QBCore.Commands.Add('givenuifocus', 'Give A Player NUI Focus (Admin uniquement)', {{name='id', help='Id du joueur'}, {name='focus', help='Set focus on/off'}, {name='mouse', help='Set mouse on/off'}}, true, function(source, args)
    local playerid = tonumber(args[1])
    local focus = args[2]
    local mouse = args[3]
    TriggerClientEvent('qb-admin:client:GiveNuiFocus', playerid, focus, mouse)
end, 'admin')

QBCore.Commands.Add('warn', 'Avertir un joueur (Admin)', {{name='ID', help='Id du joueur'}, {name='Reason', help='Mentionner une raison'}}, true, function(source, args)
    local targetPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
    local senderPlayer = QBCore.Functions.GetPlayer(source)
    table.remove(args, 1)
    local msg = table.concat(args, ' ')
    local myName = senderPlayer.PlayerData.name
    local warnId = 'WARN-'..math.random(1111, 9999)
    if targetPlayer ~= nil then
        TriggerClientEvent('chat:addMessage', targetPlayer.PlayerData.source, 'SYSTEM', 'error', 'Vous avez été prévenu par: '..GetPlayerName(source)..', Raison: '..msg)
        TriggerClientEvent('chat:addMessage', source, 'SYSTEM', 'error', 'You have warned '..GetPlayerName(targetPlayer.PlayerData.source)..' pour: '..msg)
        exports.oxmysql:insert('INSERT INTO player_warns (senderIdentifier, targetIdentifier, reason, warnId) VALUES (?, ?, ?, ?)', {
            senderPlayer.PlayerData.license,
            targetPlayer.PlayerData.license,
            msg,
            warnId
        })
    else
        TriggerClientEvent('QBCore:Notify', source, 'Ce joueur n\'est pas en ligne', 'error')
    end
end, 'admin')

QBCore.Commands.Add('checkwarns', 'Vérifiez les avertissements du joueur (Admin)', {{name='ID', help='Id du joueur'}, {name='Warning', help='Number of warning, (1, 2 or 3 etc..)'}}, false, function(source, args)
    if args[2] == nil then
        local targetPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
        local result = exports.oxmysql:fetchSync('SELECT * FROM player_warns WHERE targetIdentifier = ?', { targetPlayer.PlayerData.license })
        TriggerClientEvent('chat:addMessage', source, 'SYSTEM', 'warning', targetPlayer.PlayerData.name..' has '..tablelength(result)..' warnings!')
    else
        local targetPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
        local warnings = exports.oxmysql:fetchSync('SELECT * FROM player_warns WHERE targetIdentifier = ?', { targetPlayer.PlayerData.license })
        local selectedWarning = tonumber(args[2])
        if warnings[selectedWarning] ~= nil then
            local sender = QBCore.Functions.GetPlayer(warnings[selectedWarning].senderIdentifier)
            TriggerClientEvent('chat:addMessage', source, 'SYSTEM', 'warning', targetPlayer.PlayerData.name..' has been warned by '..sender.PlayerData.name..', Reason: '..warnings[selectedWarning].reason)
        end
    end
end, 'admin')

QBCore.Commands.Add('delwarn', 'Supprimer les avertissements du joueur (Admin)', {{name='ID', help='Id du joueur'}, {name='Warning', help='Nombre d\'avertissement, (1, 2 or 3 etc..)'}}, true, function(source, args)
    local targetPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
    local warnings = exports.oxmysql:fetchSync('SELECT * FROM player_warns WHERE targetIdentifier = ?', { targetPlayer.PlayerData.license })
    local selectedWarning = tonumber(args[2])
    if warnings[selectedWarning] ~= nil then
        local sender = QBCore.Functions.GetPlayer(warnings[selectedWarning].senderIdentifier)
        TriggerClientEvent('chat:addMessage', source, 'SYSTEM', 'warning', 'You have deleted warning ('..selectedWarning..') , Reason: '..warnings[selectedWarning].reason)
        exports.oxmysql:execute('DELETE FROM player_warns WHERE warnId = ?', { warnings[selectedWarning].warnId })
    end
end, 'admin')

QBCore.Commands.Add('reportr', 'Répondre à un report (Admin)', {}, false, function(source, args)
    local playerId = tonumber(args[1])
    table.remove(args, 1)
    local msg = table.concat(args, ' ')
    local OtherPlayer = QBCore.Functions.GetPlayer(playerId)
    local Player = QBCore.Functions.GetPlayer(source)
    if OtherPlayer ~= nil then
        TriggerClientEvent('chat:addMessage', playerId, 'ADMIN - '..GetPlayerName(source), 'warning', msg)
        TriggerClientEvent('QBCore:Notify', source, 'Réponse envoyée')
        for k, v in pairs(QBCore.Functions.GetPlayers()) do
            if QBCore.Functions.HasPermission(v, 'admin') then
                if QBCore.Functions.IsOptin(v) then
                    TriggerClientEvent('chat:addMessage', v, 'REPORT RÉPONSE ('..source..') - '..GetPlayerName(source), 'warning', msg)
                    TriggerEvent("qb-log:server:CreateLog", 'report', 'Report Réponse', 'red', '**'..GetPlayerName(source)..'** a répondu à : **'..OtherPlayer.PlayerData.name.. ' **(ID: '..OtherPlayer.PlayerData.source..') **Message:** ' ..msg, false)
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'Le joueur n\'est pas en ligne', 'error')
    end
end, 'admin')

QBCore.Commands.Add('setmodel', 'Changer de PED (Admin)', {{name='model', help='Nom du modèle'}, {name='id', help='Id du joueur (vide pour vous-même)'}}, false, function(source, args)
    local model = args[1]
    local target = tonumber(args[2])
    if model ~= nil or model ~= '' then
        if target == nil then
            TriggerClientEvent('qb-admin:client:SetModel', source, tostring(model))
        else
            local Trgt = QBCore.Functions.GetPlayer(target)
            if Trgt ~= nil then
                TriggerClientEvent('qb-admin:client:SetModel', target, tostring(model))
            else
                TriggerClientEvent('QBCore:Notify', source, 'Le joueur n\'est pas en ligne..', 'error')
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'Vous n\'avez pas défini de modèle..', 'error')
    end
end, 'admin')

QBCore.Commands.Add('setspeed', 'Définir la vitesse de marche du joueur (Admin)', {}, false, function(source, args)
    local speed = args[1]
    if speed ~= nil then
        TriggerClientEvent('qb-admin:client:SetSpeed', source, tostring(speed))
    else
        TriggerClientEvent('QBCore:Notify', source, 'Vous n\'avez pas réglé de vitesse.. (`fast` pour super rapide, `normal` pour normal)', 'error')
    end
end, 'admin')

QBCore.Commands.Add('reporttoggle', 'Voir les reports (Admin uniquement)', {}, false, function(source, args)
    QBCore.Functions.ToggleOptin(source)
    if QBCore.Functions.IsOptin(source) then
        TriggerClientEvent('QBCore:Notify', source, 'You are receiving reports', 'success')
    else
        TriggerClientEvent('QBCore:Notify', source, 'You are not receiving reports', 'error')
    end
end, 'admin')

RegisterCommand('kickall', function(source, args, rawCommand)
    local src = source
    if src > 0 then
        local reason = table.concat(args, ' ')
        local Player = QBCore.Functions.GetPlayer(src)

        if QBCore.Functions.HasPermission(src, 'god') or IsPlayerAceAllowed(src, 'command') then
            if args[1] ~= nil then
                for k, v in pairs(QBCore.Functions.GetPlayers()) do
                    local Player = QBCore.Functions.GetPlayer(v)
                    if Player ~= nil then
                        DropPlayer(Player.PlayerData.source, reason)
                    end
                end
            else
                TriggerClientEvent('chat:addMessage', src, 'SYSTEM', 'error', 'Mentionner une raison..')
            end
        else
            TriggerClientEvent('chat:addMessage', src, 'SYSTEM', 'error', 'Vous ne pouvez pas faire cela..')
        end
    else
        for k, v in pairs(QBCore.Functions.GetPlayers()) do
            local Player = QBCore.Functions.GetPlayer(v)
            if Player ~= nil then
                DropPlayer(Player.PlayerData.source, 'Le serveur redémarre, vérifiez notre Discord pour plus d\'informations: ' .. QBCore.Config.Server.discord)
            end
        end
    end
end, false)

QBCore.Commands.Add('setammo', 'Se donner des munitions (Admin)', {{name='amount', help='Nombre de balles'}, {name='weapon', help='Nom de l\'arme, par exemplePON_VINTAGEPISTOL'}}, false, function(source, args)
    local src = source
    local weapon = args[2]
    local amount = tonumber(args[1])

    if weapon ~= nil then
        TriggerClientEvent('qb-weapons:client:SetWeaponAmmoManual', src, weapon, amount)
    else
        TriggerClientEvent('qb-weapons:client:SetWeaponAmmoManual', src, 'current', amount)
    end
end, 'admin')
