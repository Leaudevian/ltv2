# Server-Sided Functions and Usage

The following info contains every server sided function in QBCore framework and how to use it. It also contains some basic info on what it does.

?> **Important information** - All the following functions required QBCore object which is called through the import in the fxmanifest. If you don't know yet about importing the QBCore object, we recommend reading the [fxmanifest documentation](./other/fxmanifest?id=qbcore-fxmanifest-introduction)

## QBCore.Functions.ExecuteSql

**Usage -** This is an alternative to using the ghmattimysql export.

**Parameters -**

|  wait  || query  ||   cb   |
| :----: || :----: || :----: |
| bool   || ghmatt ||  bool  |
| wait   || name   ||   cb   |

**Returns -**  *Executes data into the db*

```lua
QBCore.Functions.ExecuteSql = function(wait, query, cb)
	local rtndata = {}
	local waiting = true
	exports.oxmysql:fetch(query, {}, function(data)
		if cb ~= nil and wait == false then
			cb(data)
		end
		rtndata = data
		waiting = false
	end)
	if wait then
		while waiting do
			Citizen.Wait(5)
		end
		if cb ~= nil and wait == true then
			cb(rtndata)
		end
	end
	return rtndata
end
```

## QBCore.Functions.GetIdentifier

**Usage -** Returns the players identifier (depends on config whether steam or license)

**Parameters -**

|  source  || idtype  |
| :----: || :----: |
| number   || string |
| source   || type of identifier  |

**Returns -**  *Returns specific identifier for the specified source*

```lua
QBCore.Functions.GetIdentifier = function(source, idtype)
	local idtype = idtype ~=nil and idtype or QBConfig.IdentifierType
	for _, identifier in pairs(GetPlayerIdentifiers(source)) do
		if string.find(identifier, idtype) then
			return identifier
		end
	end
	return nil
end
```

## QBCore.Functions.GetSource

**Usage -** Checks for players in the server and matches them up by identifier.

**Parameters -**

|  identifier  |
| :----: |
| string   |
| identifier   |

**Returns -**  *Player's source number*

```lua
QBCore.Functions.GetSource = function(identifier)
	for src, player in pairs(QBCore.Players) do
		local idens = GetPlayerIdentifiers(src)
		for _, id in pairs(idens) do
			if identifier == id then
				return src
			end
		end
	end
	return 0
end
```

## QBCore.Functions.GetPlayer

**Usage -** Gets the designated player and returns them (used for getting player data).

**Parameters -**

|  source  |
| :----: |
| number   |
| source   |

**Returns -**  *Specified source's player data*

```lua
QBCore.Functions.GetPlayer = function(source)
	if type(source) == "number" then
		return QBCore.Players[source]
	else
		return QBCore.Players[QBCore.Functions.GetSource(source)]
	end
end
```

## QBCore.Functions.GetPlayerByCitizenId

**Usage -** Finds a specific player from the list of players in the server by their citizen id.

**Parameters -**

|  citizenid  |
| :----: |
| number   |
| citizen id   |

**Returns -**  *A specified player's source*

```lua
QBCore.Functions.GetPlayerByCitizenId = function(citizenid)
	for src, player in pairs(QBCore.Players) do
		local cid = citizenid
		if QBCore.Players[src].PlayerData.citizenid == cid then
			return QBCore.Players[src]
		end
	end
	return nil
end
```

## QBCore.Functions.GetPlayerByPhone

**Usage -** Finds a specific player from the list of players in the server by phone number.

**Parameters -**

|  number  |
| :----: |
| number   |
| phone number   |

**Returns -**  *A specified player's source*

```lua
QBCore.Functions.GetPlayerByPhone = function(number)
	for src, player in pairs(QBCore.Players) do
		local cid = citizenid
		if QBCore.Players[src].PlayerData.charinfo.phone == number then
			return QBCore.Players[src]
		end
	end
	return nil
end
```

## QBCore.Functions.GetPlayers

**Usage -** Returns a table of players currently in the server (use for onesync).

**Parameters -** None

**Returns -**  *A table of all players source*

```lua
QBCore.Functions.GetPlayers = function()
	local sources = {}
	for k, v in pairs(QBCore.Players) do
		table.insert(sources, k)
	end
	return sources
end
```

## QBCore.Functions.CreateCallback

**Usage -** Creates a useable callback.

**Parameters -**

|  name  ||   cb   |
| :----: || :----: |
| string   ||  data  |
| name   ||   cb   |

**Returns -**  *An useable callback which can then be trigger in the client*

```lua
QBCore.Functions.CreateCallback = function(name, cb)
	QBCore.ServerCallbacks[name] = cb
end
```

## QBCore.Functions.TriggerCallback

**Usage -** Triggers a useable callback that has been created.

**Parameters -**

|  name  || source  ||   cb   ||   ...   |
| :----: || :----: || :----: || :----: |
| string   || number ||  data  ||  arguments  |
| name   || source   ||   cb   ||   varargs   |

**Returns -**  *Data from the already created callback*

```lua
QBCore.Functions.TriggerCallback = function(name, source, cb, ...)
	if QBCore.ServerCallbacks[name] ~= nil then
		QBCore.ServerCallbacks[name](source, cb, ...)
	end
end
```

## QBCore.Functions.CreateUseableItem

**Usage -** Makes an item useable.

**Parameters -**

|  item  || cb  |
| :----: || :----: |
| string   || data |
| item name   || cb   |

**Returns -**  *An specified item with useability*

```lua
QBCore.Functions.CreateUseableItem = function(item, cb)
	QBCore.UseableItems[item] = cb
end
```

## QBCore.Functions.CanUseItem

**Usage -** A check to make sure the item has been created as useable.

**Parameters -**

|  item  |
| :----: |
| string   |
| item name   |

**Returns -**  *If specified item is useable*

```lua
QBCore.Functions.CanUseItem = function(item)
	return QBCore.UseableItems[item] ~= nil
end
```

## QBCore.Functions.UseItem

**Usage -** Uses an item.

**Parameters -**

|  source  || item  |
| :----: || :----: |
| number  || string |
| source   || item name   |

**Returns -**  *Uses an item*

```lua
QBCore.Functions.UseItem = function(source, item)
	QBCore.UseableItems[item.name](source, item)
end
```

## QBCore.Functions.Kick

**Usage -** Kicks a player with parameters for a reason (add your discord link to config).

**Parameters -**

|  source  || reason  ||   setKickReason   ||   deferrals   |
| :----: || :----: || :----: || :----: |
| number   || string ||  bool  ||  bool  |
| source   || reason   ||   use reason   ||   deferrals   |

**Returns -**  *Kicks an specified source from the server with a reason*

```lua
QBCore.Functions.Kick = function(source, reason, setKickReason, deferrals)
	local src = source
	reason = "\n"..reason.."\n🔸 Check our Discord for further information: "..QBCore.Config.Server.discord
	if(setKickReason ~=nil) then
		setKickReason(reason)
	end
	Citizen.CreateThread(function()
		if(deferrals ~= nil)then
			deferrals.update(reason)
			Citizen.Wait(2500)
		end
		if src ~= nil then
			DropPlayer(src, reason)
		end
		local i = 0
		while (i <= 4) do
			i = i + 1
			while true do
				if src ~= nil then
					if(GetPlayerPing(src) >= 0) then
						break
					end
					Citizen.Wait(100)
					Citizen.CreateThread(function() 
						DropPlayer(src, reason)
					end)
				end
			end
			Citizen.Wait(5000)
		end
	end)
end
```
## QBCore.Functions.IsWhitelisted

**Usage -** Checks the whitelist table in the database for a matching identifier.

**Parameters -**

|  source  |
| :----: |
| number   |
| source   |

**Returns -**  *Is specified source whitelisted*

```lua
QBCore.Functions.IsWhitelisted = function(source)
	local identifiers = GetPlayerIdentifiers(source)
	local rtn = false
	if (QBCore.Config.Server.whitelist) then
		QBCore.Functions.ExecuteSql(true, "SELECT * FROM `whitelist` WHERE `"..QBCore.Config.IdentifierType.."` = '".. QBCore.Functions.GetIdentifier(source).."'", function(result)
			local data = result[1]
			if data ~= nil then
				for _, id in pairs(identifiers) do
					if data.steam == id or data.license == id then
						rtn = true
					end
				end
			end
		end)
	else
		rtn = true
	end
	return rtn
end
```

## QBCore.Functions.AddPermission

**Usage -** Allows you to give a player elevated permissions while in the server.

**Parameters -**

|  source  || permission  |
| :----: || :----: |
| number   || string |
| source   || permission name   |

**Returns -** *Specified permission name to source*

```lua
QBCore.Functions.AddPermission = function(source, permission)
	local Player = QBCore.Functions.GetPlayer(source)
	if Player ~= nil then 
		QBCore.Config.Server.PermissionList[GetPlayerIdentifiers(source)[1]] = {
			steam = GetPlayerIdentifiers(source)[1],
			license = GetPlayerIdentifiers(source)[2],
			permission = permission:lower(),
		}
		QBCore.Functions.ExecuteSql(true, "DELETE FROM `permissions` WHERE `steam` = '"..GetPlayerIdentifiers(source)[1].."'")
		QBCore.Functions.ExecuteSql(true, "INSERT INTO `permissions` (`name`, `steam`, `license`, `permission`) VALUES ('"..GetPlayerName(source).."', '"..GetPlayerIdentifiers(source)[1].."', '"..GetPlayerIdentifiers(source)[2].."', '"..permission:lower().."')")
		Player.Functions.UpdatePlayerData()
		TriggerClientEvent('QBCore:Client:OnPermissionUpdate', source, permission)
	end
end
```

## QBCore.Functions.RemovePermission

**Usage -** Allows you to remove a players permissions while in the server.

**Parameters -**

|  source  |
| :----: |
| number   |
| source   |

**Returns -**  *Removal of all permissions of specified source*

```lua
QBCore.Functions.RemovePermission = function(source)
	local Player = QBCore.Functions.GetPlayer(source)
	if Player ~= nil then 
		QBCore.Config.Server.PermissionList[GetPlayerIdentifiers(source)[1]] = nil	
		QBCore.Functions.ExecuteSql(true, "DELETE FROM `permissions` WHERE `steam` = '"..GetPlayerIdentifiers(source)[1].."'")
		Player.Functions.UpdatePlayerData()
	end
end
```

## QBCore.Functions.HasPermission

**Usage -** Checks the players permission level and returns true or false.

**Parameters -**

|  source  || permission  |
| :----: || :----: |
| number   || string |
| source   || permission name  |

**Returns -**  *If player has specified permission*

```lua
QBCore.Functions.HasPermission = function(source, permission)
	local retval = false
	local steamid = GetPlayerIdentifiers(source)[1]
	local licenseid = GetPlayerIdentifiers(source)[2]
	local permission = tostring(permission:lower())
	if permission == "user" then
		retval = true
	else
		if QBCore.Config.Server.PermissionList[steamid] ~= nil then 
			if QBCore.Config.Server.PermissionList[steamid].steam == steamid and QBCore.Config.Server.PermissionList[steamid].license == licenseid then
				if QBCore.Config.Server.PermissionList[steamid].permission == permission or QBCore.Config.Server.PermissionList[steamid].permission == "god" then
					retval = true
				end
			end
		end
	end
	return retval
end
```

## QBCore.Functions.GetPermission

**Usage -** Returns the players permission level.

**Parameters -**

|  source  |
| :----: |
| number   |
| source   |

**Returns -**  *Permission name of specified source*

```lua
QBCore.Functions.GetPermission = function(source)
	local retval = "user"
	Player = QBCore.Functions.GetPlayer(source)
	local steamid = GetPlayerIdentifiers(source)[1]
	local licenseid = GetPlayerIdentifiers(source)[2]
	if Player ~= nil then
		if QBCore.Config.Server.PermissionList[Player.PlayerData.steam] ~= nil then 
			if QBCore.Config.Server.PermissionList[Player.PlayerData.steam].steam == steamid and QBCore.Config.Server.PermissionList[Player.PlayerData.steam].license == licenseid then
				retval = QBCore.Config.Server.PermissionList[Player.PlayerData.steam].permission
			end
		end
	end
	return retval
end
```

## QBCore.Functions.IsOptin

**Usage -** Checks whether the staff member is opted in or out and returns true or false.

**Parameters -**

|  source  |
| :----: |
| number   |
| source   |

**Returns -**  *If specified source with permission is opted in*

```lua
QBCore.Functions.IsOptin = function(source)
	local retval = false
	local steamid = GetPlayerIdentifiers(source)[1]
	if QBCore.Functions.HasPermission(source, "admin") then
		retval = QBCore.Config.Server.PermissionList[steamid].optin
	end
	return retval
end
```

## QBCore.Functions.ToggleOptin

**Usage -** Allows a staff member to opt in or out of receiving reports or being included in the staff chat (basically go off duty as staff).

**Parameters -**

|  source  |
| :----: |
| number   |
| source   |

**Returns -**  *Toggle of specified source to change optin state*

```lua
QBCore.Functions.ToggleOptin = function(source)
	local steamid = GetPlayerIdentifiers(source)[1]
	if QBCore.Functions.HasPermission(source, "admin") then
		QBCore.Config.Server.PermissionList[steamid].optin = not QBCore.Config.Server.PermissionList[steamid].optin
	end
end
```

## QBCore.Functions.IsPlayerBanned

**Usage -** Checks the bans table in the database for a matching identifier.

**Parameters -**

|  source  |
| :----: |
| number   |
| source   |

**Returns -**  *Check if source's identifier is banned*

```lua
QBCore.Functions.IsPlayerBanned = function (source)
	local retval = false
	local message = ""
	QBCore.Functions.ExecuteSql(true, "SELECT * FROM `bans` WHERE `steam` = '"..GetPlayerIdentifiers(source)[1].."' OR `license` = '"..GetPlayerIdentifiers(source)[2].."' OR `ip` = '"..GetPlayerIdentifiers(source)[3].."'", function(result)
		if result[1] ~= nil then 
			if os.time() < result[1].expire then
				retval = true
				local timeTable = os.date("*t", tonumber(result[1].expire))
				message = "You have been banned from the server:\n"..result[1].reason.."\nYour Ban Expires In: "..timeTable.day.. "/" .. timeTable.month .. "/" .. timeTable.year .. " " .. timeTable.hour.. ":" .. timeTable.min .. "\n"
			else
				QBCore.Functions.ExecuteSql(true, "DELETE FROM `bans` WHERE `id` = "..result[1].id)
			end
		end
	end)
	return retval, message
end
```