local ItemList = {
    ["casinochips"] = 1,
}

RegisterServerEvent("qb-casino:server:sell")
AddEventHandler("qb-casino:server:sell", function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    local xItem = Player.Functions.GetItemByName("casinochips")
    if xItem ~= nil then
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    price = price + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                        
        Player.Functions.AddMoney("cash", price, "sold-casino-chips")
            TriggerClientEvent('QBCore:Notify', src, "Votre solde de jeton est de "..price.."$")
            TriggerEvent("qb-log:server:CreateLog", "casino", "Chips", "blue", "**"..GetPlayerName(src) .. "** donne "..price.."$ pour l\'achat de jeton")
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Vous n\'avez pas de jeton..")
    end
end)

function SetExports()
exports["qb-blackjack"]:SetGetChipsCallback(function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    local Chips = Player.Functions.GetItemByName("casinochips")

    if Chips ~= nil then 
        Chips = Chips
    end

    return TriggerClientEvent('QBCore:Notify', src, "Vous n\'avez pas de jeton..")
end)

    exports["qb-blackjack"]:SetTakeChipsCallback(function(source, amount)
        local Player = QBCore.Functions.GetPlayer(source)

        if Player ~= nil then
            Player.Functions.RemoveItem("casinochips", amount)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['casinochips'], "remove")
            TriggerEvent("qb-log:server:CreateLog", "casino", "Chips", "yellow", "**"..GetPlayerName(source) .. "** mise "..amount.."$ sur la table")
        end
    end)

    exports["qb-blackjack"]:SetGiveChipsCallback(function(source, amount)
        local Player = QBCore.Functions.GetPlayer(source)

        if Player ~= nil then
            Player.Functions.AddItem("casinochips", amount)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['casinochips'], "add")
            TriggerEvent("qb-log:server:CreateLog", "casino", "Chips", "red", "**"..GetPlayerName(source) .. "** mise "..amount.."$ sur la table et gagne le double")
        end
    end)
end

AddEventHandler("onResourceStart", function(resourceName)
	if ("qb-blackjack" == resourceName) then
        Citizen.Wait(1000)
        SetExports()
    end
end)

SetExports()
