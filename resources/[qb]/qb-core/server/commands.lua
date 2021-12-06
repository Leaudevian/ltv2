QBCore.Commands = {}
QBCore.Commands.List = {}

-- Register & Refresh Commands

function QBCore.Commands.Add(name, help, arguments, argsrequired, callback, permission)
    if type(permission) == 'string' then
        permission = permission:lower()
    else
        permission = 'user'
    end
    QBCore.Commands.List[name:lower()] = {
        name = name:lower(),
        permission = permission,
        help = help,
        arguments = arguments,
        argsrequired = argsrequired,
        callback = callback
    }
end

function QBCore.Commands.Refresh(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local suggestions = {}
    if Player then
        for command, info in pairs(QBCore.Commands.List) do
            local isGod = QBCore.Functions.HasPermission(src, 'god')
            local hasPerm = QBCore.Functions.HasPermission(src, QBCore.Commands.List[command].permission)
            local isPrincipal = IsPlayerAceAllowed(src, 'command')
            if isGod or hasPerm or isPrincipal then
                suggestions[#suggestions+1] = {
                    name = '/' .. command,
                    help = info.help,
                    params = info.arguments
                }
            end
        end
        TriggerClientEvent('chat:addSuggestions', tonumber(source), suggestions)
    end
end

-- Teleport

QBCore.Commands.Add('tp', 'Se téléporter à un joueur ou des coords (Admin)', {{name = 'id/x', help = 'Id du joueur ou X position'},{name = 'y', help = 'Y position'}, {name = 'z', help = 'Z position'}}, false, function(source, args)
    local src = source
    if args[1] and not args[2] and not args[3] then
        local target = GetPlayerPed(tonumber(args[1]))
        if target ~= 0 then
            local coords = GetEntityCoords(target)
            TriggerClientEvent('QBCore:Command:TeleportToPlayer', src, coords)
        else
            TriggerClientEvent('QBCore:Notify', src, 'Le joueur n\'est pas en ligne', 'error')
        end
    else
        if args[1] and args[2] and args[3] then
            local x = tonumber(args[1])
            local y = tonumber(args[2])
            local z = tonumber(args[3])
            if (x ~= 0) and (y ~= 0) and (z ~= 0) then
                TriggerClientEvent('QBCore:Command:TeleportToCoords', src, x, y, z)
            else
                TriggerClientEvent('QBCore:Notify', src, 'Format incorrect', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Arguments incomplets (x, y, z)', 'error')
        end
    end
end, 'admin')

QBCore.Commands.Add('tpm', 'TP sur un marqueur (Admin)', {}, false, function(source)
    local src = source
    TriggerClientEvent('QBCore:Command:GoToMarker', src)
end, 'admin')

-- Permissions

QBCore.Commands.Add('addpermission', 'Donner des permissions à un joueur (God)', {{name = 'id', help = 'Id du joueur'},{name = 'permission', help = 'Niveau de permission'}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    local permission = tostring(args[2]):lower()
    if Player then
        QBCore.Functions.AddPermission(Player.PlayerData.source, permission)
    else
        TriggerClientEvent('QBCore:Notify', src, 'Le joueur n\'est pas en ligne', 'error')
    end
end, 'god')

QBCore.Commands.Add('removepermission', 'Retirer les permissions d\'un joueur (God)', {{name = 'id', help = 'Id du joueur'}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    if Player then
        QBCore.Functions.RemovePermission(Player.PlayerData.source)
    else
        TriggerClientEvent('QBCore:Notify', src, 'Le joueur n\'est pas en ligne', 'error')
    end
end, 'god')

-- Vehicle

QBCore.Commands.Add('car', '"Faire spawn un véhicule (Admin)',{{name = 'model', help = 'Nom du modèle du véhicule'}}, true, function(source, args)
    local src = source
    TriggerClientEvent('QBCore:Command:SpawnVehicle', src, args[1])
end, 'admin')

QBCore.Commands.Add('dv', 'Supprimer un véhicule (Admin)', {}, false, function(source)
    local src = source
    TriggerClientEvent('QBCore:Command:DeleteVehicle', src)
end, 'admin')

-- Money

QBCore.Commands.Add('givemoney', 'Donner de l\'argent à un joueur (Admin)', {{name = 'id', help = 'ID du joueur'},{name = 'moneytype', help = 'Type (cash, bank, crypto)'},{name = 'amount', help = 'Montant'}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    if Player then
        Player.Functions.AddMoney(tostring(args[2]), tonumber(args[3]))
    else
        TriggerClientEvent('QBCore:Notify', src, 'Le joueur n\'est pas en ligne', 'error')
    end
end, 'admin')

QBCore.Commands.Add('setmoney', 'Définir le solde d\'argent à un joueur (Admin)', {{name = 'id', help = 'ID du joueur'},{name = 'moneytype', help = 'Type (cash, bank, crypto)'},{name = 'amount', help = 'Montant'}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    if Player then
        Player.Functions.SetMoney(tostring(args[2]), tonumber(args[3]))
    else
        TriggerClientEvent('QBCore:Notify', src, 'Le joueur n\'est pas en ligne', 'error')
    end
end, 'admin')

-- Job

QBCore.Commands.Add('job', 'Voir votre job', {}, false, function(source)
    local src = source
    local PlayerJob = QBCore.Functions.GetPlayer(src).PlayerData.job
    TriggerClientEvent('QBCore:Notify', src, string.format('[Job]: %s [Grade]: %s [On Duty]: %s', PlayerJob.label, PlayerJob.grade.name, PlayerJob.onduty))
end, 'user')

QBCore.Commands.Add('setjob', 'Donner un travail à un joueur  (Admin)', {{name = 'id', help = 'ID du joueur'}, {name = 'job', help = 'Nom du job'},{name = 'grade', help = 'Grade'}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    if Player then
        Player.Functions.SetJob(tostring(args[2]), tonumber(args[3]))
    else
        TriggerClientEvent('QBCore:Notify', src, 'Le joueur n\'est pas en ligne', 'error')
    end
end, 'admin')

-- Gang

QBCore.Commands.Add('gang', 'Voir votre gang', {}, false, function(source)
    local src = source
    local PlayerGang = QBCore.Functions.GetPlayer(source).PlayerData.gang
    TriggerClientEvent('QBCore:Notify', src, string.format('[Gang]: %s [Grade]: %s', PlayerGang.label, PlayerGang.grade.name))
end, 'user')

QBCore.Commands.Add('setgang', 'Mettre un joueur dans un Gang (Admin)', {{name = 'id', help = 'ID du joueur'}, {name = 'gang', help = 'Name of a gang'},{name = 'grade', help = 'Grade'}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    if Player then
        Player.Functions.SetGang(tostring(args[2]), tonumber(args[3]))
    else
        TriggerClientEvent('QBCore:Notify', src, 'Le joueur n\'est pas en ligne', 'error')
    end
end, 'admin')

-- Inventory (should be in qb-inventory?)

QBCore.Commands.Add('clearinv', 'Vider l\'inventaire d\'un joueur (Admin)',{{name = 'id', help = 'ID du joueur'}}, false, function(source, args)
    local src = source
    local playerId = args[1] or src
    local Player = QBCore.Functions.GetPlayer(tonumber(playerId))
    if Player then
        Player.Functions.ClearInventory()
    else
        TriggerClientEvent('QBCore:Notify', src, 'Le joueur n\'est pas en ligne', 'error')
    end
end, 'admin')

-- Out of Character Chat

QBCore.Commands.Add('ooc', 'OOC Chat Message', {}, false, function(source, args)
    local src = source
    local message = table.concat(args, ' ')
    local Players = QBCore.Functions.GetPlayers()
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(Players) do
        if v == src then
            TriggerClientEvent('chat:addMessage', v, 'OOC ' .. GetPlayerName(src), 'normal', message)
        elseif #(GetEntityCoords(GetPlayerPed(src)) -
            GetEntityCoords(GetPlayerPed(v))) < 20.0 then
            TriggerClientEvent('chat:addMessage', v, 'OOC ' .. GetPlayerName(src), 'normal', message)
        elseif QBCore.Functions.HasPermission(v, 'admin') then
            if QBCore.Functions.IsOptin(v) then
                TriggerClientEvent('chat:addMessage', v, 'Proximity OOC ' .. GetPlayerName(src), 'normal', message)
                TriggerEvent('qb-log:server:CreateLog', 'ooc', 'OOC', 'white', '**' .. GetPlayerName(src) .. '** (CitizenID: ' ..Player.PlayerData.citizenid .. ' | ID: ' .. src ..') **Message:** ' .. message, false)
            end
        end
    end
end, 'user')