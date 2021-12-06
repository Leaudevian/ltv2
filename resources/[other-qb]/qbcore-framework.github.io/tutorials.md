# QBCore Tutorials
Here you can find tutorials about everything related to QBCore + some extra ones about FiveM. We will add the most updated ones or the ones with the most useful information

## Videos

### QBCore Setting Permissions
- *https://www.youtube.com/watch?v=7OzvgL7B7hs*

### QBCore Installation with txAdmin
- *https://www.youtube.com/watch?v=7OzvgL7B7hs*

### QBCore Installation on ZapHosting
- *https://zap-hosting.com/guides/docs/en/fivem_txadmin_setup/*

- *https://youtu.be/dGXEj_06WEw*

- **Remote URL:** 

```input
https://raw.githubusercontent.com/qbcore-framework/txAdminRecipe/main/qbcore.yaml
```

## Text

### Script Optimization
- Always replace GetPlayerPed(-1) with PlayerPedId()

- Always replace GetDistanceBetweenCoords with lua math aka #(vector3 - vector3)

- Don't create unnecessary threads. If you can take a thread and turn it into a function and call that somewhere else to trigger it, do it.

- As kody said, if you are creating a function or an event, make it so that it can be used in many different formats with different variables. Keep it universal basically.

- If you do have to create a thread that includes a `while` loop, always avoid using `while true do` if able.

- For markers, use a variable like `inRange` that you can set to true or false so that you can control the loop for checking distance. You can set a massive wait if not inRange of the marker which creates less overhead when not in use.

- If you have job specific loops, make sure they only apply to players with that job. There's no reason for someone who is not a cop to be running a loop on their machine that does not apply to them.

- Not really optimization related but a surplus amount of security in a code is not a bad thing. Don't be afraid to add in multiple if checks or create random variables to pass through your events.

- Ties into security as well, never do any type of transaction with the player regarding money or items on the client side of a resource.

### Enable Onesync Infinity

- Startup Args: 

```cmd
+set onesync on
```

- `server.cfg` file: 
```cfg
set onesync on
```

- txAdmin: Go to settings, then onesync, and choose infinity.

### Deleting Client Cache

1) Navigate to your FiveM Application Data folder, you can find this by searching in the windows search bar %localappdata% and then going into the FiveM folder

2) Open the data folder

3) Delete all folders besides game-storage and nui-storage according to CFX.re, this prevents longer downloading times when starting up FiveM after clearing you cache, of course you can delete all folders, no harm in that, but as I said it will take longer to startup but that's a one time thing

4) Delete the files from your trash bin and start FiveM

### Enabling Casino

- Enable build 2189 and use [**this**](https://forum.cfx.re/t/cayo-perico-casino-dlc-ipl-loader/2099391)

- If you want the wheel too, you can use [**this**](https://github.com/GhzGarage/esx_tpnrp_luckywheel)

### Voice System
1) Set onesync infinity on
2) Download [**pma-voice**](https://github.com/AvarianKnight/pma-voice/releases/tag/v4.0.0)
3) Add the following code in your `server.cfg` file.
```cfg
# PMA Voice Convars (Onesync Infinity Only) -- https://github.com/AvarianKnight/pma-voice
ensure pma-voice
setr voice_useNativeAudio true
setr voice_useSendingRangeOnly true
setr voice_defaultCycle "N"
setr voice_defaultVolume 0.3
setr voice_enableRadioAnim 1
setr voice_syncData 1
```
4) Download [rp-radio](https://github.com/qbcore-framework/rp-radio) for a better roleplaying experience.