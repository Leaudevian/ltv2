PlayerJob = {}
isLoggedIn = false
isInMenu = false
inRange = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
	isLoggedIn = false
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

-- MENU
local menu = MenuV:CreateMenu(false, 'Menu Patron', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'main')
local menu2 = MenuV:CreateMenu(false, 'Argent société', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'société')
local menu3 = MenuV:CreateMenu(false, 'Management des employés', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'employers')
local menu4 = MenuV:CreateMenu(false, 'Menu recrutement', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'recrutement')

RegisterNetEvent('qb-bossmenu:client:openMenu')
AddEventHandler('qb-bossmenu:client:openMenu', function()
    for k, v in pairs(Config.Jobs) do
        if k == PlayerJob.name and PlayerJob.isboss then
            MenuV:OpenMenu(menu)
        end
    end
end)

local menu_button = menu:AddButton({
    icon = '📋',
    label = 'Employés',
    value = menu3,
    description = 'Management des employés'
})
local menu_button1 = menu:AddButton({
    icon = '🤝',
    label = 'Recrutement',
    value = menu4,
    description = 'Embaucher des nouveaux joueurs'
})
local menu_button2 = menu:AddButton({
    icon = '📦',
    label = 'Stock',
    value = nil,
    description = 'Stockage personnel'
})
local menu_button3 = menu:AddButton({
    icon = '👕',
    label = 'Tenues',
    value = nil,
    description = 'Voir les tenues'
})
local menu_button4 = menu:AddButton({
    icon = '💰',
    label = 'Argent de la société',
    value = menu2,
    description = 'Voir/Manager l\'argent de la société'
})
local menu_button5 = menu2:AddButton({
    icon = '💲',
    label = '',
    value = nil,
    description = 'Argent dans la société'
})
local menu_button6 = menu2:AddButton({
    icon = '🤑',
    label = 'Retraits',
    value = menu2,
    description = 'Retraits d\'argents depuis la société'
})
local menu_button7 = menu2:AddButton({
    icon = '🏦',
    label = 'Dépôt',
    value = menu2,
    description = 'Faire un dépôt d\'argent dans la société'
})

-- Storage
menu_button2:On("select", function()
    MenuV:CloseMenu(menu)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "boss_" .. PlayerJob.name, {
        maxweight = 4000000,
        slots = 500,
    })
    TriggerEvent("inventory:client:SetCurrentStash", "boss_" .. PlayerJob.name)
end)

-- Outfit
menu_button3:On("select", function()
    MenuV:CloseMenu(menu)
    TriggerEvent('qb-clothing:client:openOutfitMenu')
end)

-- Society
menu_button4:On('select', function()
    UpdateSociety()
end)

-- Withdraw
menu_button6:On("select", function()
    local result = LocalInput('Withdrawal Amount', 255, '')
    if result ~= nil then
        TriggerServerEvent("qb-bossmenu:server:withdrawMoney", tonumber(result))
        UpdateSociety()
    end
end)

-- Deposit
menu_button7:On("select", function()
    local result = LocalInput('Deposit Amount', 255, '')
    if result ~= nil then
        TriggerServerEvent("qb-bossmenu:server:depositMoney", tonumber(result))
        UpdateSociety()
    end
end)

-- Employees
menu_button:On("select", function()
    menu3:ClearItems()
    QBCore.Functions.TriggerCallback('qb-bossmenu:server:GetEmployees', function(cb)
        for k,v in pairs(cb) do
            local menu_button8 = menu3:AddButton({
                label = v.grade.name.. ' ' ..v.name,
                value = v,
                description = 'Employee',
                select = function(btn)
                    local select = btn.Value
                    ManageEmployees(select)
                end
            })
        end
    end, PlayerJob.name)
end)

-- Recruit
menu_button1:On("select", function()
    menu4:ClearItems()
    local playerPed = PlayerPedId()
    for k,v in pairs(QBCore.Functions.GetPlayersFromCoords(GetEntityCoords(playerPed), 10.0)) do
        if v and v ~= PlayerId() then
            local menu_button10 = menu4:AddButton({
                label = GetPlayerName(v),
                value = v,
                description = 'Available Recruit',
                select = function(btn)
                    local select = btn.Value
                    TriggerServerEvent('qb-bossmenu:server:giveJob', GetPlayerServerId(v))
                end
            })
        end
    end
end)

-- MAIN THREAD
CreateThread(function()
    while true do
        Citizen.Wait(7)
        if PlayerJob.name ~= nil then
            local pos = GetEntityCoords(PlayerPedId())
            for k, v in pairs(Config.Jobs) do
                if k == PlayerJob.name and PlayerJob.isboss then
                    if #(pos - v) < 1.0 then
                        inRange = true
                        DrawText3D(v, "~g~E~w~ - Boss Menu")
                        if IsControlJustReleased(0, 38) then
                            MenuV:OpenMenu(menu)
                        end
                    else
                        inRange = false
                    end
                end
            end
        end
        if not inRange then
            Wait(5000)
        end
    end
end)

-- FUNCTIONS
function UpdateSociety()
    QBCore.Functions.TriggerCallback('qb-bossmenu:server:GetAccount', function(cb)
        menu_button5.Label = 'Argent de la société ' ..comma_value(cb)"$"
    end, PlayerJob.name)
end

function ManageEmployees(employee)
    local manageroptions = MenuV:CreateMenu(false, employee.name .. ' Options', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv')
    manageroptions:ClearItems()
    MenuV:OpenMenu(manageroptions)
    buttons = {
        [1] = {
            icon = '↕️',
            label = "Promouvoir/Rétrograder",
            value = "promote",
            description = "Promouvoir " .. employee.name
        },
        [3] = {
            icon = '🔥',
            label = "Fire",
            value = "Fire",
            description = "Fire " .. employee.name
        }
    }
    for k, v in pairs(buttons) do
        local menu_button9 = manageroptions:AddButton({
            icon = v.icon,
            label = v.label,
            value = v.value,
            description = v.description,
            select = function(btn)
                local values = btn.Value
                if values == 'promote' then
                    local result = LocalInput('New Grade Level', 255, '')
                    if result ~= nil then
                        TriggerServerEvent('qb-bossmenu:server:updateGrade', employee.source, tonumber(result))
                    end
                else
                    TriggerServerEvent('qb-bossmenu:server:fireEmployee', employee.source)
                end
            end
        })
    end
end

-- UTIL
function DrawText3D(v, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(v, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 0)
    ClearDrawOrigin()
end

function LocalInput(text, number, windows)
    AddTextEntry("FMMC_MPM_NA", text)
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", windows or "", "", "", "", number or 30)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
        Wait(0)
    end
    if (GetOnscreenKeyboardResult()) then
    local result = GetOnscreenKeyboardResult()
        return result
    end
end

function comma_value(amount)
    local formatted = amount
    while true do  
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k==0) then
            break
        end
    end
    return formatted
end
