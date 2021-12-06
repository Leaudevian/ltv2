local trunkBusy = {}

RegisterServerEvent('qb-trunk:server:setTrunkBusy')
AddEventHandler('qb-trunk:server:setTrunkBusy', function(plate, busy)
    trunkBusy[plate] = busy
end)

QBCore.Functions.CreateCallback('qb-trunk:server:getTrunkBusy', function(source, cb, plate)
    if trunkBusy[plate] then
        cb(true)
    end
    cb(false)
end)

RegisterServerEvent('qb-trunk:server:KidnapTrunk')
AddEventHandler('qb-trunk:server:KidnapTrunk', function(targetId, closestVehicle)
    TriggerClientEvent('qb-trunk:client:KidnapGetIn', targetId, closestVehicle)
end)

QBCore.Commands.Add("getintrunk", "Entrer dans le coffre", {}, false, function(source, args)
    TriggerClientEvent('qb-trunk:client:GetIn', source)
end)

QBCore.Commands.Add("putintrunk", "Mettre le joueur dans le coffre", {}, false, function(source, args)
    TriggerClientEvent('qb-trunk:server:KidnapTrunk', source)
end)