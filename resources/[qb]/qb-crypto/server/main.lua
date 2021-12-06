QBCore.Commands.Add("setcryptoworth", "Définir le nom de la crypto", {{name="crypto", help="Nom de la crypto"}, {name="Value", help="Nouveau nom de la crypto"}}, false, function(source, args)
    local src = source
    local crypto = tostring(args[1])

    if crypto ~= nil then
        if Crypto.Worth[crypto] ~= nil then
            local NewWorth = math.ceil(tonumber(args[2]))
            
            if NewWorth ~= nil then
                local PercentageChange = math.ceil(((NewWorth - Crypto.Worth[crypto]) / Crypto.Worth[crypto]) * 100)
                local ChangeLabel = "+"
                if PercentageChange < 0 then
                    ChangeLabel = "-"
                    PercentageChange = (PercentageChange * -1)
                end
                if Crypto.Worth[crypto] == 0 then
                    PercentageChange = 0
                    ChangeLabel = ""
                end

                table.insert(Crypto.History[crypto], {
                    PreviousWorth = Crypto.Worth[crypto],
                    NewWorth = NewWorth
                })

                TriggerClientEvent('QBCore:Notify', src, "Vous avez "..Crypto.Labels[crypto].."adapté de: ($"..Crypto.Worth[crypto].." to: $"..NewWorth..") ("..ChangeLabel.." "..PercentageChange.."%)")
                Crypto.Worth[crypto] = NewWorth
                TriggerClientEvent('qb-crypto:client:UpdateCryptoWorth', -1, crypto, NewWorth)
                exports.oxmysql:insert('INSERT INTO crypto (worth, history) VALUES (@worth, @history) ON DUPLICATE KEY UPDATE worth = @worth, history = @history', {
                    ['@worth'] = NewWorth,
                    ['@history'] = json.encode(Crypto.History[crypto]),
                })
                -- exports.oxmysql:insert('UPDATE crypto SET worth=@worth, history=@history WHERE crypto=@crypto', {['@worth'] = NewWorth, ), ['@crypto'] = crypto})
            else
                TriggerClientEvent('QBCore:Notify', src, "Vous n'avez pas donné de nouvelle valeur .. Valeurs actuelles: "..Crypto.Worth[crypto])
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "Cette crypto n'existe pas :(, available: Qbit")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Vous n'avez pas fourni de Crypto, available: Qbit")
    end
end, "admin")

QBCore.Commands.Add("checkcryptoworth", "", {}, false, function(source, args)
    local src = source
    TriggerClientEvent('QBCore:Notify', src, "Le qbit a une valeur de: "..Crypto.Worth["qbit"].."$")
end, "admin")

QBCore.Commands.Add("crypto", "", {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local MyPocket = math.ceil(Player.PlayerData.money.crypto * Crypto.Worth["qbit"])

    TriggerClientEvent('QBCore:Notify', src, "Vous avez : "..Player.PlayerData.money.crypto.." Qbit, avec une valeur de: "..MyPocket.."$ ,-")
end, "admin")

RegisterServerEvent('qb-crypto:server:FetchWorth')
AddEventHandler('qb-crypto:server:FetchWorth', function()
    for name,_ in pairs(Crypto.Worth) do
        local result = exports.oxmysql:fetchSync('SELECT * FROM crypto WHERE crypto=@crypto', {['@crypto'] = name})
        if result[1] ~= nil then
            Crypto.Worth[name] = result[1].worth
            if result[1].history ~= nil then
                Crypto.History[name] = json.decode(result[1].history)
                TriggerClientEvent('qb-crypto:client:UpdateCryptoWorth', -1, name, result[1].worth, json.decode(result[1].history))
            else
                TriggerClientEvent('qb-crypto:client:UpdateCryptoWorth', -1, name, result[1].worth, nil)
            end
        end
    end
end)

RegisterServerEvent('qb-crypto:server:ExchangeFail')
AddEventHandler('qb-crypto:server:ExchangeFail', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("cryptostick")

    if ItemData ~= nil then
        Player.Functions.RemoveItem("cryptostick", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "remove")
        TriggerClientEvent('QBCore:Notify', src, "Tentative a échoué, la cryptostick à cramé ..", 'error', 5000)
    end
end)

RegisterServerEvent('qb-crypto:server:Rebooting')
AddEventHandler('qb-crypto:server:Rebooting', function(state, percentage)
    Crypto.Exchange.RebootInfo.state = state
    Crypto.Exchange.RebootInfo.percentage = percentage
end)

RegisterServerEvent('qb-crypto:server:GetRebootState')
AddEventHandler('qb-crypto:server:GetRebootState', function()
    local src = source
    TriggerClientEvent('qb-crypto:client:GetRebootState', src, Crypto.Exchange.RebootInfo)
end)

RegisterServerEvent('qb-crypto:server:SyncReboot')
AddEventHandler('qb-crypto:server:SyncReboot', function()
    TriggerClientEvent('qb-crypto:client:SyncReboot', -1)
end)

RegisterServerEvent('qb-crypto:server:ExchangeSuccess')
AddEventHandler('qb-crypto:server:ExchangeSuccess', function(LuckChance)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("cryptostick")

    if ItemData ~= nil then
        local LuckyNumber = math.random(1, 10)
        local DeelNumber = 1000000
        local Amount = (math.random(611111, 1599999) / DeelNumber)
        if LuckChance == LuckyNumber then
            Amount = (math.random(1599999, 2599999) / DeelNumber)
        end

        Player.Functions.RemoveItem("cryptostick", 1)
        Player.Functions.AddMoney('crypto', Amount)
        TriggerClientEvent('QBCore:Notify', src, "Vous avez échangé votre cryptostick pour: "..Amount.." QBit(\'s)", "success", 3500)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "remove")
        TriggerClientEvent('qb-phone:client:AddTransaction', src, Player, {}, "Vous avez "..Amount.." Qbit('s) crédité!", "Credit")
    end
end)

QBCore.Functions.CreateCallback('qb-crypto:server:HasSticky', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("cryptostick")

    if Item ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-crypto:server:GetCryptoData', function(source, cb, name)
    local Player = QBCore.Functions.GetPlayer(source)
    local CryptoData = {
        History = Crypto.History[name],
        Worth = Crypto.Worth[name],
        Portfolio = Player.PlayerData.money.crypto,
        WalletId = Player.PlayerData.metadata["walletid"],
    }

    cb(CryptoData)
end)

QBCore.Functions.CreateCallback('qb-crypto:server:BuyCrypto', function(source, cb, data)
    local Player = QBCore.Functions.GetPlayer(source)

    if Player.PlayerData.money.bank >= tonumber(data.Price) then
        local CryptoData = {
            History = Crypto.History["qbit"],
            Worth = Crypto.Worth["qbit"],
            Portfolio = Player.PlayerData.money.crypto + tonumber(data.Coins),
            WalletId = Player.PlayerData.metadata["walletid"],
        }
        Player.Functions.RemoveMoney('bank', tonumber(data.Price))
        TriggerClientEvent('qb-phone:client:AddTransaction', source, Player, data, "Vous avez acheté "..tonumber(data.Coins).." Qbit('s) !", "Credit")
        Player.Functions.AddMoney('crypto', tonumber(data.Coins))
        cb(CryptoData)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-crypto:server:SellCrypto', function(source, cb, data)
    local Player = QBCore.Functions.GetPlayer(source)

    if Player.PlayerData.money.crypto >= tonumber(data.Coins) then
        local CryptoData = {
            History = Crypto.History["qbit"],
            Worth = Crypto.Worth["qbit"],
            Portfolio = Player.PlayerData.money.crypto - tonumber(data.Coins),
            WalletId = Player.PlayerData.metadata["walletid"],
        }
        Player.Functions.RemoveMoney('crypto', tonumber(data.Coins))
        TriggerClientEvent('qb-phone:client:AddTransaction', source, Player, data, "Vous avez vendu "..tonumber(data.Coins).." Qbit('s) !", "Depreciation")
        Player.Functions.AddMoney('bank', tonumber(data.Price))
        cb(CryptoData)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-crypto:server:TransferCrypto', function(source, cb, data)
    local Player = QBCore.Functions.GetPlayer(source)

    if Player.PlayerData.money.crypto >= tonumber(data.Coins) then
        local query = '%'..data.WalletId..'%'
        local result = exports.oxmysql:fetchSync('SELECT * FROM `players` WHERE `metadata` LIKE @query', {['@query'] = query})
        if result[1] ~= nil then
            local CryptoData = {
                History = Crypto.History["qbit"],
                Worth = Crypto.Worth["qbit"],
                Portfolio = Player.PlayerData.money.crypto - tonumber(data.Coins),
                WalletId = Player.PlayerData.metadata["walletid"],
            }
            Player.Functions.RemoveMoney('crypto', tonumber(data.Coins))
            TriggerClientEvent('qb-phone:client:AddTransaction', source, Player, data, "Vous avez transféré "..tonumber(data.Coins).." Qbit('s) !", "Depreciation")
            local Target = QBCore.Functions.GetPlayerByCitizenId(result[1].citizenid)

            if Target ~= nil then
                Target.Functions.AddMoney('crypto', tonumber(data.Coins))
                TriggerClientEvent('qb-phone:client:AddTransaction', Target.PlayerData.source, Player, data, "Vous avez crédité "..tonumber(data.Coins).." Qbit('s) !", "Credit")
            else
                MoneyData = json.decode(result[1].money)
                MoneyData.crypto = MoneyData.crypto + tonumber(data.Coins)
                exports.oxmysql:insert('UPDATE players SET money=@money WHERE citizenid=@citizenid', {['@money'] = json.encode(MoneyData), ['@citizenid'] = result[1].citizenid})
            end
            cb(CryptoData)
        else
            cb("notvalid")
        end
    else
        cb("notenough")
    end
end)


-- Crypto New Value (Random)
local coin = Crypto.Coin

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(Crypto.RefreshTimer*60000)
        HandlePriceChance()            
    end
end)

HandlePriceChance = function()
    local currentValue = Crypto.Worth[coin]
    local prevValue = Crypto.Worth[coin]
    local trend = math.random(0,100) 
    local event = math.random(0,100)
    local chance = event - Crypto.ChanceOfCrashOrLuck

    if event > chance then 
        if trend <= Crypto.ChanceOfDown then 
            currentValue = currentValue - math.random(Crypto.CasualDown[1], Crypto.CasualDown[2])
        elseif trend >= Crypto.ChanceOfUp then 
            currentValue = currentValue + math.random(Crypto.CasualUp[1], Crypto.CasualUp[2])
        end
    else
        if math.random(0, 1) == 1 then 
            currentValue = currentValue + math.random(Crypto.Luck[1], Crypto.Luck[2])
        else
            currentValue = currentValue - math.random(Crypto.Crash[1], Crypto.Crash[2])
        end
    end

    if currentValue <= 1 then 
        currentValue = 1
    end

    table.insert(Crypto.History[coin], {PreviousWorth = prevValue, NewWorth = currentValue})
    Crypto.Worth[coin] = currentValue

    exports.oxmysql:insert('INSERT INTO crypto (worth, history) VALUES (@worth, @history) ON DUPLICATE KEY UPDATE worth = @worth, history = @history', {
        ['@worth'] = currentValue,
        ['@history'] = json.encode(Crypto.History[coin]),
    })
    RefreshCrypto()
end

RefreshCrypto = function()
    local result = exports.oxmysql:fetchSync('SELECT * FROM crypto WHERE crypto = @crypto', {['@crypto'] = coin})
    if result ~= nil and result[1] ~= nil then
        Crypto.Worth[coin] = result[1].worth
        if result[1].history ~= nil then
            Crypto.History[coin] = json.decode(result[1].history)
            TriggerClientEvent("QBCore:Notify", -1,"La crypto se situe maintenant à "..result[1].worth.."", "success")
            TriggerClientEvent('qb-crypto:client:UpdateCryptoWorth', -1, coin, result[1].worth, json.decode(result[1].history))
        else
            TriggerClientEvent('qb-crypto:client:UpdateCryptoWorth', -1, coin, result[1].worth, nil)
        end
    end
end
