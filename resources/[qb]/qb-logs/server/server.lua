RegisterServerEvent('qb-log:server:CreateLog')
AddEventHandler('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone ~= nil and tagEveryone or false
    local webHook = Config.Webhooks[name] ~= nil and Config.Webhooks[name] or Config.Webhooks["default"]
    local embedData = {
        {
            ["title"] = title,
            ["color"] = Config.Colors[color] ~= nil and Config.Colors[color] or Config.Colors["default"],
            ["footer"] = {
                ["text"] = os.date("%c"),
            },
            ["description"] = message,
            ["author"] = {
            ["name"] = 'LTRP Logs',
            ["icon_url"] = "https://locktownrp3.webnode.fr/_files/200000028-2318f23191/450/logo.png?ph=9dca772acf",
                },
        }
    }
    PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = "QB Logs",embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = "QB Logs", content = "@everyone"}), { ['Content-Type'] = 'application/json' })
    end
end)

QBCore.Commands.Add("testwebhook", "Testez votre Discord WebHook pour les logs (God Only)", {}, false, function(source, args)
    TriggerEvent("qb-log:server:CreateLog", "default", "TestWebhook", "default", "A2 A3 **A4** test test test :)")
end, "god")
