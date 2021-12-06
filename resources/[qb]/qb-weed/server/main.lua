QBCore.Functions.CreateCallback('qb-weed:server:getBuildingPlants', function(source, cb, building)
    local buildingPlants = {}

    exports.oxmysql:fetch('SELECT * FROM house_plants WHERE building = @building', {['@building'] = building}, function(plants)
        for i = 1, #plants, 1 do
            table.insert(buildingPlants, plants[i])
        end

        if buildingPlants ~= nil then
            cb(buildingPlants)
        else    
            cb(nil)
        end
    end)
end)

RegisterServerEvent('qb-weed:server:placePlant')
AddEventHandler('qb-weed:server:placePlant', function(coords, sort, currentHouse)
    local random = math.random(1, 2)
    local gender
    if random == 1 then gender = "man" else gender = "woman" end
    exports.oxmysql:insert('INSERT INTO house_plants (building, coords, gender, sort, plantid) VALUES (@building, @coords, @gender, @sort, @plantid)', {
        ['@building'] = currentHouse,
        ['@coords'] = coords,
        ['@gender'] = gender,
        ['@sort'] = sort,
        ['@plantid'] = math.random(111111,999999)
    })
    TriggerClientEvent('qb-weed:client:refreshHousePlants', -1, currentHouse)
end)

RegisterServerEvent('qb-weed:server:removeDeathPlant')
AddEventHandler('qb-weed:server:removeDeathPlant', function(building, plantId)
    exports.oxmysql:insert('DELETE FROM house_plants WHERE plantid=@plantid AND building=@building', {['@plantid'] = plantId, ['@building'] = building})
    TriggerClientEvent('qb-weed:client:refreshHousePlants', -1, building)
end)

Citizen.CreateThread(function()
    while true do
        local housePlants = exports.oxmysql:fetchSync('SELECT * FROM house_plants', {})
        for k, v in pairs(housePlants) do
            if housePlants[k].food >= 50 then
                exports.oxmysql:insert('UPDATE house_plants SET food=@food WHERE plantid=@plantid', {['@food'] = (housePlants[k].food - 1), ['@plantid'] = housePlants[k].plantid})
                if housePlants[k].health + 1 < 100 then
                    exports.oxmysql:insert('UPDATE house_plants SET health=@health WHERE plantid=@plantid', {['@health'] = (housePlants[k].health + 1), ['@plantid'] = housePlants[k].plantid})
                end
            end

            if housePlants[k].food < 50 then
                if housePlants[k].food - 1 >= 0 then
                    exports.oxmysql:insert('UPDATE house_plants SET food=@food WHERE plantid=@plantid', {['@food'] = (housePlants[k].food - 1), ['@plantid'] = housePlants[k].plantid})
                end
                if housePlants[k].health - 1 >= 0 then
                    exports.oxmysql:insert('UPDATE house_plants SET health=@health WHERE plantid=@plantid', {['@health'] = (housePlants[k].health - 1), ['@plantid'] = housePlants[k].plantid})
                end
            end
        end
        TriggerClientEvent('qb-weed:client:refreshPlantStats', -1)
        Citizen.Wait((60 * 1000) * 19.2)
    end
end)

Citizen.CreateThread(function()
    while true do
        local housePlants = exports.oxmysql:fetchSync('SELECT * FROM house_plants', {})
        for k, v in pairs(housePlants) do
            if housePlants[k].health > 50 then
                local Grow = math.random(1, 3)
                if housePlants[k].progress + Grow < 100 then
                    exports.oxmysql:insert('UPDATE house_plants SET progress=@progress WHERE plantid=@plantid', {['@progress'] = (housePlants[k].progress + 1), ['@plantid'] = housePlants[k].plantid})
                elseif housePlants[k].progress + Grow >= 100 then
                    if housePlants[k].stage ~= QBWeed.Plants[housePlants[k].sort]["highestStage"] then
                        if housePlants[k].stage == "stage-a" then
                            exports.oxmysql:insert('UPDATE house_plants SET stage=@stage WHERE plantid=@plantid', {['@stage'] = 'stage-b', ['@plantid'] = housePlants[k].plantid})
                        elseif housePlants[k].stage == "stage-b" then
                            exports.oxmysql:insert('UPDATE house_plants SET stage=@stage WHERE plantid=@plantid', {['@stage'] = 'stage-c', ['@plantid'] = housePlants[k].plantid})
                        elseif housePlants[k].stage == "stage-c" then
                            exports.oxmysql:insert('UPDATE house_plants SET stage=@stage WHERE plantid=@plantid', {['@stage'] = 'stage-d', ['@plantid'] = housePlants[k].plantid})
                        elseif housePlants[k].stage == "stage-d" then
                            exports.oxmysql:insert('UPDATE house_plants SET stage=@stage WHERE plantid=@plantid', {['@stage'] = 'stage-e', ['@plantid'] = housePlants[k].plantid})
                        elseif housePlants[k].stage == "stage-e" then
                            exports.oxmysql:insert('UPDATE house_plants SET stage=@stage WHERE plantid=@plantid', {['@stage'] = 'stage-f', ['@plantid'] = housePlants[k].plantid})
                        elseif housePlants[k].stage == "stage-f" then
                            exports.oxmysql:insert('UPDATE house_plants SET stage=@stage WHERE plantid=@plantid', {['@stage'] = 'stage-g', ['@plantid'] = housePlants[k].plantid})
                        end
                        exports.oxmysql:insert('UPDATE house_plants SET progress=@progress WHERE plantid=@plantid', {['@progress'] = 0, ['@plantid'] = housePlants[k].plantid})
                    end
                end
            end
        end
        TriggerClientEvent('qb-weed:client:refreshPlantStats', -1)
        Citizen.Wait((60 * 1000) * 9.6)
    end
end)

QBCore.Functions.CreateUseableItem("weed_white-widow_seed", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('qb-weed:client:placePlant', source, 'white-widow', item)
end)

QBCore.Functions.CreateUseableItem("weed_skunk_seed", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('qb-weed:client:placePlant', source, 'skunk', item)
end)

QBCore.Functions.CreateUseableItem("weed_purple-haze_seed", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('qb-weed:client:placePlant', source, 'purple-haze', item)
end)

QBCore.Functions.CreateUseableItem("weed_og-kush_seed", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('qb-weed:client:placePlant', source, 'og-kush', item)
end)

QBCore.Functions.CreateUseableItem("weed_amnesia_seed", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('qb-weed:client:placePlant', source, 'amnesia', item)
end)

QBCore.Functions.CreateUseableItem("weed_ak47_seed", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('qb-weed:client:placePlant', source, 'ak47', item)
end)

QBCore.Functions.CreateUseableItem("weed_nutrition", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('qb-weed:client:foodPlant', source, item)
end)

RegisterServerEvent('qb-weed:server:removeSeed')
AddEventHandler('qb-weed:server:removeSeed', function(itemslot, seed)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(seed, 1, itemslot)
end)

RegisterServerEvent('qb-weed:server:harvestPlant')
AddEventHandler('qb-weed:server:harvestPlant', function(house, amount, plantName, plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local weedBag = Player.Functions.GetItemByName('empty_weed_bag')
    local sndAmount = math.random(12, 16)

    if weedBag ~= nil then
        if weedBag.amount >= sndAmount then
            if house ~= nil then
                local result = exports.oxmysql:fetchSync('SELECT * FROM house_plants WHERE plantid=@plantid AND building=@building', {['@plantid'] = plantId, ['@building'] = house}) 
                if result[1] ~= nil then
                    Player.Functions.AddItem('weed_'..plantName..'_seed', amount)
                    Player.Functions.AddItem('weed_'..plantName, sndAmount)
                    Player.Functions.RemoveItem('empty_weed_bag', 1)
                    exports.oxmysql:insert('DELETE FROM house_plants WHERE plantid=@plantid AND building=@building', {['@plantid'] = plantId, ['@building'] = house})
                    TriggerClientEvent('QBCore:Notify', src, 'The plant has been harvested', 'success', 3500)
                    TriggerClientEvent('qb-weed:client:refreshHousePlants', -1, house)
                else
                    TriggerClientEvent('QBCore:Notify', src, 'This plant no longer exists?', 'error', 3500)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'House Not Found', 'error', 3500)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You Don't Have Enough Resealable Bags", 'error', 3500)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You Don't Have Enough Resealable Bags", 'error', 3500)
    end
end)

RegisterServerEvent('qb-weed:server:foodPlant')
AddEventHandler('qb-weed:server:foodPlant', function(house, amount, plantName, plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local plantStats = exports.oxmysql:fetchSync('SELECT * FROM house_plants WHERE building=@building AND sort=@sort AND plantid=@plantid', {['@building'] = house, ['@sort'] = plantName,['@plantid'] = tostring(plantId)})
    TriggerClientEvent('QBCore:Notify', src, QBWeed.Plants[plantName]["label"]..' | Nutrition: '..plantStats[1].food..'% + '..amount..'% ('..(plantStats[1].food + amount)..'%)', 'success', 3500)
    if plantStats[1].food + amount > 100 then
        exports.oxmysql:insert('UPDATE house_plants SET food=@food WHERE building=@building AND plantid=@plantid', {
            ['@food'] = 100,
            ['@building'] = house,
            ['@plantid'] = plantId
        })
    else
        exports.oxmysql:insert('UPDATE house_plants SET food=@food WHERE building=@building AND plantid=@plantid', {
            ['@food'] = (plantStats[1].food + amount),
            ['@building'] = house,
            ['@plantid'] = plantId
        })
    end
    Player.Functions.RemoveItem('weed_nutrition', 1)
    TriggerClientEvent('qb-weed:client:refreshHousePlants', -1, house)
end)