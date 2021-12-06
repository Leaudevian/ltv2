QBCore.Functions.CreateUseableItem("printerdocument", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('qb-printer:client:UseDocument', source, item)
end)

QBCore.Commands.Add("spawnprinter", "Accèder à une imprimante", {}, true, function(source, args)
	TriggerClientEvent('qb-printer:client:SpawnPrinter', source)
end, "admin")

RegisterServerEvent('qb-printer:server:SaveDocument')
AddEventHandler('qb-printer:server:SaveDocument', function(url)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    local extension = string.sub(url, -4)
    local validexts = Config.ValidExtensions
    if url ~= nil then
        if validexts[extension] then
            info.url = url
            Player.Functions.AddItem('printerdocument', 1, nil, info)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['printerdocument'], "add")
        else
            TriggerClientEvent('QBCore:Notify', src, 'Extension invalide, '..Config.ValidExtensionsText..' extension autorisés.', "error")
        end
    end
end)