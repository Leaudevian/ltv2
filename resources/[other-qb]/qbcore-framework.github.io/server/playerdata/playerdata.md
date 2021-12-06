# PlayerData Server

In order to retrieve player data server sided. You will need the following to call the values you desire.
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local citizenid = Player.PlayerData.citizenid
```
!> **Important** - Unlike a client sided script, we need to specify the source. In this case, we set source equal to the local variable `_src` due to source being global. This actions prevents global source from changing during execution. Another important thing to notice is that **WE DO** need to add `PlayerData` before calling our desired value.

## Basic Info
All the following is for obtaining a player's basic data.

### Citizen Id
*Returns player's citizen id*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local citizenid = Player.PlayerData.citizenid
print(citizenid)
```
### Steam
*Returns player's steam*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local steam = Player.PlayerData.steam
print(steam)
```
### License
*Returns player's license*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local license = Player.PlayerData.license
print(license)
```
### Name
*Returns player's name*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local name = Player.PlayerData.name
print(name)
```
### Cid
*Returns player's in-game id*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local cid = Player.PlayerData.cid
print(cid)
```
### Position 
*Returns player's position*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local position = Player.PlayerData.position
print(position)
```
### Cash
*Returns player's cash amount*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local cashAmount = Player.PlayerData.money['cash']
print(cashAmount)
```
### Bank
*Returns player's bank amount*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local bankAmount = Player.PlayerData.money['bank']
print(bankAmount)
```
## Character Info
*Returns player's character info*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local charInfo = Player.PlayerData.charinfo
print(charInfo)
```
### Firstname
*Returns player's characters first name*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local firstName = Player.PlayerData.charinfo.firstname
print(firstName)
```
### Lastname
*Returns player's characters last name*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local lastName = Player.PlayerData.charinfo.lastname
print(lastName)
```
### Birthdate
*Returns player's characters birth date*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local birthDate = Player.PlayerData.charinfo.birthdate
print(birthDate)
```
### Gender
*Returns player's characters gender*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local gender = Player.PlayerData.charinfo.gender
print(gender)
```
### Nationality
*Returns player's characters nationality*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local nationality = Player.PlayerData.charinfo.nationality
print(nationality)
```
### Phone Number
*Returns player's characters phone number*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local phoneNumber = Player.PlayerData.charinfo.phone
print(phoneNumber)
```
### Account
*Returns player's characters bank account number*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local accountNumber = Player.PlayerData.charinfo.account
print(accountNumber)
```
## Metadata Info
*Returns a table of the player's metadata*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local meta = Player.PlayerData.metadata
print(json.encode(meta))
```
### Hunger
*Returns player's hunger level*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local hunger = Player.PlayerData.metadata['hunger']
print(hunger)
```
### Thirst
*Returns player's thirst level*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local thirst = Player.PlayerData.metadata['thirst']
print(thirst)
```
### Stress
*Returns player's stress level*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local stress = Player.PlayerData.metadata['stress']
print(stress)
```
### Armor
*Returns player's armor status*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local armor = Player.PlayerData.metadata['armor']
print(armor)
```
### Death State
*Returns player's death status*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local isDead = Player.PlayerData.metadata['isdead']
print(isDead)
```
### Stand State
*Returns player's last stand status*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local inLastStand = Player.PlayerData.metadata['inlaststand']
print(inLastStand)
```
### Handcuffed State
*Returns player's handcuff status*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local isHandcuffed = Player.PlayerData.metadata['ishandcuffed']
print(isHandcuffed)
```
### Jail State
*Returns player's jail status*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local inJail = Player.PlayerData.metadata['injail']
print(inJail)
```
### Jail Items
*Returns a table of the player's jail items*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local jailItems = Player.PlayerData.metadata['jailitems']
print(json.encode(jailItems))
```
### Tracker
*Returns if player is wearing a tracker*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local hasTracker = Player.PlayerData.metadata['tracker']
print(hasTracker)
```
### Status
*Returns a table of the player's status*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local status = Player.PlayerData.metadata['status']
print(json.encode(status))
```
### Phone
*Returns a table of the player's phone data*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local phoneData = Player.PlayerData.metadata['phone']
print(json.encode(phoneData))
```
### Fitbit
*Returns a table of the player's fitbit data*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local fitbitData = Player.PlayerData.metadata['fitbit']
print(json.encode(fitbitData))
```
### Commandbinds
*Returns player's a table of the player's binds*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local bindsData = Player.PlayerData.metadata['commandbinds']
print(json.encode(bindsData))
```
### Bloodtype
*Returns the player's blood type*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local bloodType = Player.PlayerData.metadata['bloodtype']
print(bloodType)
```
### Dealer Rep
*Returns the player's dealer rep amount*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local dealerRep = Player.PlayerData.metadata['dealerrep']
print(dealerRep)
```
### Crafting Rep
*Returns the player's crafting rep amount*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local craftingRep = Player.PlayerData.metadata['craftingrep']
print(craftingRep)
```
### Attachment Crafting Rep
*Returns the player's attachment crafting rep amount*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local atchRep = Player.PlayerData.metadata['attachmentcraftingrep']
print(atchRep)
```
### Job Rep
*Returns the player's job rep amount*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local jobRep = Player.PlayerData.metadata['jobrep']
print(jobRep)
```
### Current Apartment
*Returns the player's current apartment*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local currApt = Player.PlayerData.metadata['currentapartment']
print(currApt)
```
### Callsign
*Returns the player's callsign*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local callSign = Player.PlayerData.metadata['callsign']
print(callSign)
```
### Fingerprint
*Returns the player's fingerprint*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local fingerPrint = Player.PlayerData.metadata['fingerprint']
print(fingerPrint)
```
### Wallet Id
*Returns the player's wallet id*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local walletId = Player.PlayerData.metadata['walletid']
print(walletId)
```
### Criminal Record
*Returns a table of the player's criminal record*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local crimRecord = Player.PlayerData.metadata['criminalrecord']
print(json.encode(crimRecord))
```
### Licenses
*Returns a table of the player's licenses*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local licenses = Player.PlayerData.metadata['licences']
print(json.encode(licenses))
```
### Inside Data
*Returns a table of the player's inside info*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local inside = Player.PlayerData.metadata['inside']
print(json.encode(inside))
```
### Phone Data Apps
*Returns a table of the player's phone data (installed apps)*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local phoneApps = Player.PlayerData.metadata['phonedata']
print(json.encode(phoneApps))
```
## Jobs Info
*Returns a table of the player's job info*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local job = Player.PlayerData.job
print(json.encode(job))
```
### Job Name
*Returns the player's job name*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local jobName = Player.PlayerData.job.name
print(jobName)
```
### Job Label
*Returns the player's job label*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local jobLabel = Player.PlayerData.job.label
print(jobLabel)
```
### Job Payment
*Returns the player's job payment amount*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local jobPay = Player.PlayerData.job.payment
print(jobPay)
```
### Job Duty Status
*Returns the player's duty status*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local jobDuty = Player.PlayerData.job.onduty
print(jobDuty)
```
## Gangs Info
*Returns a table of the player's gang info*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local gang = Player.PlayerData.gang
print(json.encode(gang))
```
### Gang Name
*Returns the player's gang name*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local gangName = Player.PlayerData.gang.name
print(gangName)
```
### Gang Label
*Returns the player's gang label*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local gangLabel = Player.PlayerData.gang.label
print(gangLabel)
```

### Gang Grade
*Returns the player's gang grade*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local gangGrade = Player.PlayerData.gang.grade.name
print(gangGrade)
```

### Gang Grade Level
*Returns the player's gang grade level*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local gangLevel = Player.PlayerData.gang.grade.level
print(gangLevel)
```

### Gang isBoss
*Returns true if the player is the boss*
```lua
local _src = source
local Player = QBCore.Functions.GetPlayer(_src)
local isBoss = Player.PlayerData.gang.isBoss
print(isBoss)
```
