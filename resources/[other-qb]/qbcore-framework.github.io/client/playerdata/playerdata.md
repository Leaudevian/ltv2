# PlayerData Client

In order to retrieve player data client sided. You will need the following to call the values you desire.
```lua
local Player = QBCore.Functions.GetPlayerData()
local citizenid = Player.citizenid
```
!> **Important** - Since the client is already the source, we don't need to specify for the variable `Player`. We also won't need to add `PlayerData` after `Player` unlike obtaining PlayerData server sided.

## Basic Info
All the following is for obtaining a player's basic data.

### Citizen Id
*Returns player's citizen id*
```lua
local Player = QBCore.Functions.GetPlayerData()
local citizenid = Player.citizenid
print(citizenid)
```
### Steam
*Returns player's steam id*
```lua
local Player = QBCore.Functions.GetPlayerData()
local steam = Player.steam
print(steam)
```
### License
*Returns player's license*
```lua
local Player = QBCore.Functions.GetPlayerData()
local license = Player.license
print(license)
```
### Name
*Returns player's name*
```lua
local Player = QBCore.Functions.GetPlayerData()
local name = Player.name
print(name)
```
### Cid
*Returns player's in-game id*
```lua
local Player = QBCore.Functions.GetPlayerData()
local cid = Player.cid
print(cid)
```
### Position 
*Returns player's position*
```lua
local Player = QBCore.Functions.GetPlayerData()
local position = Player.position
print(position)
```
### Cash
*Returns player's cash amount*
```lua
local Player = QBCore.Functions.GetPlayerData()
local cashAmount = Player.money['cash']
print(cashAmount)
```
### Bank
*Returns player's bank amount*
```lua
local Player = QBCore.Functions.GetPlayerData()
local bankAmount = Player.money['bank']
print(bankAmount)
```
## Character Info
*Returns player's character info*
```lua
local Player = QBCore.Functions.GetPlayerData()
local charInfo = Player.charinfo
print(charInfo)
```
### Firstname
*Returns player's characters first name*
```lua
local Player = QBCore.Functions.GetPlayerData()
local firstName = Player.charinfo.firstname
print(firstName)
```
### Lastname
*Returns player's characters last name*
```lua
local Player = QBCore.Functions.GetPlayerData()
local lastName = Player.charinfo.lastname
print(lastName)
```
### Birthdate
*Returns player's characters birth date*
```lua
local Player = QBCore.Functions.GetPlayerData()
local birthDate = Player.charinfo.birthdate
print(birthDate)
```
### Gender
*Returns player's characters gender*
```lua
local Player = QBCore.Functions.GetPlayerData()
local gender = Player.charinfo.gender
print(gender)
```
### Nationality
*Returns player's characters nationality*
```lua
local Player = QBCore.Functions.GetPlayerData()
local nationality = Player.charinfo.nationality
print(nationality)
```
### Phone Number
*Returns player's characters phone number*
```lua
local Player = QBCore.Functions.GetPlayerData()
local phoneNumber = Player.charinfo.phone
print(phoneNumber)
```
### Account
*Returns player's characters bank account number*
```lua
local Player = QBCore.Functions.GetPlayerData()
local accountNumber = Player.charinfo.account
print(accountNumber)
```
## Metadata Info
*Returns a table of the player's metadata*
```lua
local Player = QBCore.Functions.GetPlayerData()
local meta = Player.metadata
print(json.encode(meta))
```
### Hunger
*Returns player's hunger level*
```lua
local Player = QBCore.Functions.GetPlayerData()
local hunger = Player.metadata['hunger']
print(hunger)
```
### Thirst
*Returns player's thirst level*
```lua
local Player = QBCore.Functions.GetPlayerData()
local thirst = Player.metadata['thirst']
print(thirst)
```
### Stress
*Returns player's stress level*
```lua
local Player = QBCore.Functions.GetPlayerData()
local stress = Player.metadata['stress']
print(stress)
```
### Armor
*Returns player's armor status*
```lua
local Player = QBCore.Functions.GetPlayerData()
local armor = Player.metadata['armor']
print(armor)
```
### Death State
*Returns player's death status*
```lua
local Player = QBCore.Functions.GetPlayerData()
local isDead = Player.metadata['isdead']
print(isDead)
```
### Stand State
*Returns player's last stand status*
```lua
local Player = QBCore.Functions.GetPlayerData()
local inLastStand = Player.metadata['inlaststand']
print(inLastStand)
```
### Handcuffed State
*Returns player's handcuff status*
```lua
local Player = QBCore.Functions.GetPlayerData()
local isHandcuffed = Player.metadata['ishandcuffed']
print(isHandcuffed)
```
### Jail State
*Returns player's jail status*
```lua
local Player = QBCore.Functions.GetPlayerData()
local inJail = Player.metadata['injail']
print(inJail)
```
### Jail Items
*Returns a table of the player's jail items*
```lua
local Player = QBCore.Functions.GetPlayerData()
local jailItems = Player.metadata['jailitems']
print(json.encode(jailItems))
```
### Tracker
*Returns if player is wearing a tracker*
```lua
local Player = QBCore.Functions.GetPlayerData()
local hasTracker = Player.metadata['tracker']
print(hasTracker)
```
### Status
*Returns a table of the player's status*
```lua
local Player = QBCore.Functions.GetPlayerData()
local status = Player.metadata['status']
print(json.encode(status))
```
### Phone
*Returns a table of the player's phone data*
```lua
local Player = QBCore.Functions.GetPlayerData()
local phoneData = Player.metadata['phone']
print(json.encode(phoneData))
```
### Fitbit
*Returns a table of the player's fitbit data*
```lua
local Player = QBCore.Functions.GetPlayerData()
local fitbitData = Player.metadata['fitbit']
print(json.encode(fitbitData))
```
### Commandbinds
*Returns player's a table of the player's binds*
```lua
local Player = QBCore.Functions.GetPlayerData()
local bindsData = Player.metadata['commandbinds']
print(json.encode(bindsData))
```
### Bloodtype
*Returns the player's blood type*
```lua
local Player = QBCore.Functions.GetPlayerData()
local bloodType = Player.metadata['bloodtype']
print(bloodType)
```
### Dealer Rep
*Returns the player's dealer rep amount*
```lua
local Player = QBCore.Functions.GetPlayerData()
local dealerRep = Player.metadata['dealerrep']
print(dealerRep)
```
### Crafting Rep
*Returns the player's crafting rep amount*
```lua
local Player = QBCore.Functions.GetPlayerData()
local craftingRep = Player.metadata['craftingrep']
print(craftingRep)
```
### Attachment Crafting Rep
*Returns the player's attachment crafting rep amount*
```lua
local Player = QBCore.Functions.GetPlayerData()
local atchRep = Player.metadata['attachmentcraftingrep']
print(atchRep)
```
### Job Rep
*Returns the player's job rep amount*
```lua
local Player = QBCore.Functions.GetPlayerData()
local jobRep = Player.metadata['jobrep']
print(jobRep)
```
### Current Apartment
*Returns the player's current apartment*
```lua
local Player = QBCore.Functions.GetPlayerData()
local currApt = Player.metadata['currentapartment']
print(currApt)
```
### Callsign
*Returns the player's callsign*
```lua
local Player = QBCore.Functions.GetPlayerData()
local callSign = Player.metadata['callsign']
print(callSign)
```
### Fingerprint
*Returns the player's fingerprint*
```lua
local Player = QBCore.Functions.GetPlayerData()
local fingerPrint = Player.metadata['fingerprint']
print(fingerPrint)
```
### Wallet Id
*Returns the player's wallet id*
```lua
local Player = QBCore.Functions.GetPlayerData()
local walletId = Player.metadata['walletid']
print(walletId)
```
### Criminal Record
*Returns a table of the player's criminal record*
```lua
local Player = QBCore.Functions.GetPlayerData()
local crimRecord = Player.metadata['criminalrecord']
print(json.encode(crimRecord))
```
### Licenses
*Returns a table of the player's licenses*
```lua
local Player = QBCore.Functions.GetPlayerData()
local licenses = Player.metadata['licences']
print(json.encode(licenses))
```
### Inside Data
*Returns a table of the player's inside info*
```lua
local Player = QBCore.Functions.GetPlayerData()
local inside = Player.metadata['inside']
print(json.encode(inside))
```
### Phone Data Apps
*Returns a table of the player's phone data (installed apps)*
```lua
local Player = QBCore.Functions.GetPlayerData()
local phoneApps = Player.metadata['phonedata']
print(json.encode(phoneApps))
```
## Jobs Info
*Returns a table of the player's job info*
```lua
local Player = QBCore.Functions.GetPlayerData()
local job = Player.job
print(json.encode(job))
```
### Job Name
*Returns the player's job name*
```lua
local Player = QBCore.Functions.GetPlayerData()
local jobName = Player.job.name
print(jobName)
```
### Job Label
*Returns the player's job label*
```lua
local Player = QBCore.Functions.GetPlayerData()
local jobLabel = Player.job.label
print(jobLabel)
```
### Job Payment
*Returns the player's job payment amount*
```lua
local Player = QBCore.Functions.GetPlayerData()
local jobPay = Player.job.payment
print(jobPay)
```
### Job Duty Status
*Returns the player's duty status*
```lua
local Player = QBCore.Functions.GetPlayerData()
local jobDuty = Player.job.onduty
print(jobDuty)
```
## Gangs Info
*Returns a table of the player's gang info*
```lua
local Player = QBCore.Functions.GetPlayerData()
local gang = Player.gang
print(json.encode(gang))
```
### Gang Name
*Returns the player's gang name*
```lua
local Player = QBCore.Functions.GetPlayerData()
local gangName = Player.gang.name
print(gangName)
```
### Gang Label
*Returns the player's gang label*
```lua
local Player = QBCore.Functions.GetPlayerData()
local gangLabel = Player.gang.label
print(gangLabel)
```

### Gang Grade
*Returns the player's gang grade*
```lua
local Player = QBCore.Functions.GetPlayerData()
local gangGrade = Player.PlayerData.gang.grade.name
print(gangGrade)
```

### Gang Grade Level
*Returns the player's gang grade level*
```lua
local Player = QBCore.Functions.GetPlayerData()
local gangLevel = Player.PlayerData.gang.grade.level
print(gangLevel)
```

### Gang isBoss
*Returns true if the player is the boss*
```lua
local Player = QBCore.Functions.GetPlayerData()
local isBoss = Player.PlayerData.gang.isBoss
print(isBoss)
```
