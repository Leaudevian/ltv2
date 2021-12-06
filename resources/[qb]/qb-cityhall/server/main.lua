local DrivingSchools = {
    
}

RegisterServerEvent('qb-cityhall:server:requestId')
AddEventHandler('qb-cityhall:server:requestId', function(identityData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    if identityData.item == "id_card" then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
    elseif identityData.item == "driver_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = "Class C Driver License"
    elseif identityData.item == "weaponlicense" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
    end

    Player.Functions.AddItem(identityData.item, 1, nil, info)

    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[identityData.item], 'add')
end)


RegisterServerEvent('qb-cityhall:server:getIDs')
AddEventHandler('qb-cityhall:server:getIDs', function()
    local src = source
    GiveStarterItems(src)
end)


RegisterServerEvent('qb-cityhall:server:sendDriverTest')
AddEventHandler('qb-cityhall:server:sendDriverTest', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(DrivingSchools) do 
        local SchoolPlayer = QBCore.Functions.GetPlayerByCitizenId(v)
        if SchoolPlayer ~= nil then 
            TriggerClientEvent("qb-cityhall:client:sendDriverEmail", SchoolPlayer.PlayerData.source, Player.PlayerData.charinfo)
        else
            local mailData = {
                sender = "LesMunicipaux",
                subject = "Demande de leçons de conduite",
                message = "Bonjour,<br /><br />Nous venons de recevoir votre demande de leçons de conduite.<br />Si vous êtes prêt, merci de nous contacter :<br />Nom: <strong>".. Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. "<br />Tel: <strong>"..Player.PlayerData.charinfo.phone.."</strong><br/><br/>Cordialement,<br />Les Municipauxs",
                button = {}
            }
            TriggerEvent("qb-phone:server:sendNewEventMail", v, mailData)
        end
    end
    TriggerClientEvent('QBCore:Notify', src, 'Un email a été envoyé à l\'auto-école et vous serez recontacté rapidement.', "success", 5000)
end)

RegisterServerEvent('qb-cityhall:server:ApplyJob')
AddEventHandler('qb-cityhall:server:ApplyJob', function(job)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local JobInfo = QBCore.Shared.Jobs[job]

    Player.Functions.SetJob(job, 0)

    TriggerClientEvent('QBCore:Notify', src, 'Félicitations pour votre nouveau travail! ('..JobInfo.label..')')
end)


-- QBCore.Commands.Add("drivinglicense", "Give a driver's license to someone", {{"id", "ID of a person"}}, true, function(source, args)
--     local Player = QBCore.Functions.GetPlayer(source)

--         local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
--         if SearchedPlayer ~= nil then
--             local driverLicense = SearchedPlayer.PlayerData.metadata["licences"]["driver"]
--             if not driverLicense then
--                 local licenses = {
--                     ["driver"] = true,
--                     ["business"] = SearchedPlayer.PlayerData.metadata["licences"]["business"]
--                 }
--                 SearchedPlayer.Functions.SetMetaData("licences", licenses)
--                 TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, "You have passed! Pick up your driver's license at the town hall", "success", 5000)
--             else
--                 TriggerClientEvent('QBCore:Notify', src, "Can't give driver's license ..", "error")
--             end
--         end

-- end)

function GiveStarterItems(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    for k, v in pairs(QBCore.Shared.StarterItems) do
        local info = {}
        if v.item == "id_card" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
        elseif v.item == "driver_license" then
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.type = "Class C Driver License"
        end
        Player.Functions.AddItem(v.item, 1, false, info)
    end
end

function IsWhitelistedSchool(citizenid)
    local retval = false
    for k, v in pairs(DrivingSchools) do 
        if v == citizenid then
            retval = true
        end
    end
    return retval
end

RegisterServerEvent('qb-cityhall:server:banPlayer')
AddEventHandler('qb-cityhall:server:banPlayer', function()
    local src = source
    TriggerClientEvent('chatMessage', -1, "QB Anti-Cheat", "error", GetPlayerName(src).." a été banni pour abuser de requete POST")
    exports.oxmysql:insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (@name, @license, @discord, @ip, @reason, @expire, @bannedby)', {
        ['@name'] = GetPlayerName(src),
        ['@license'] = QBCore.Functions.GetIdentifier(src, 'license'),
        ['@discord'] = QBCore.Functions.GetIdentifier(src, 'discord'),
        ['@ip'] = QBCore.Functions.GetIdentifier(src, 'ip'),
        ['@reason'] = 'Abuse localhost:13172 For POST Requests',
        ['@expire'] = 2145913200,
        ['@bannedby'] = GetPlayerName(src)
    })
    DropPlayer(src, 'Attempting To Exploit')
end)
