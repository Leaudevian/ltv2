# QBCore Manifest Introduction

With one of our latest updates, we introduced a new way of calling the QBCore object by using the fxmanifest. Similar to how MySQL does it, we do it by importing it from the framework. In this guide, you'll learn about the best way to setup you resource manifest. You can skip to an example [**here**](/./other/fxmanifest/fxmanifest?id=example). If you want more information about resource manifest go [**here**](https://docs.fivem.net/docs/scripting-reference/resource-manifest/resource-manifest/).

## fx_version
This comes at the top of you manifest. Currently the latest version is **cerulean** which is the recommended one.

?> **Important information** - The cerulean version requires `https://`, else it won't work if using with NUI. Example: `$.post('https://nui-example/event')`

```lua
fx_version 'cerulean'
```

## game
Currently QBCore is only designed for FiveM (gta5). However, in the future we may support RedM(rdr3).

```lua
game 'gta5'
```

## lua54
Allow for the use of [Lua 5.4](https://www.lua.org/manual/5.4/manual.html)

```lua
lua54 'yes'
```

## server_only
This can only be used when you only have a server sided file. Meaning that everything in your resource is on the server.

```lua
server_only 'yes'
```

## client_script
Loads a script/s on the client.

```lua
client_scripts {
	'config.lua',
	'client/*.lua' -- Supports globbing
}
```

## server_script
Loads a script/s on the server.

```lua
server_scripts {
	'config.lua',
	'server/*.lua' -- Supports globbing
}
```

## shared_script
Loads a script/s on both the client and server.

```lua
shared_script '@qb-core/import.lua'
```

## dependency
Requires the specified resource/s to load before starting itself.

```lua
dependencies {
	'qb-core',
	'qb-policejob'
}
```

## ui_page
This is used when declaring the UI of your resource. This is what is going to appear on the player's screen.

```lua
ui_page 'html/ui.html' -- Path can be changed
```

## file
This adds the specified files to the resource packfile. This is then downloaded by a player's client uppon loading a resource.

```lua
files {
	'html/ui.html',
	'html/css/style.css',
	'html/js/*.js' -- Notice we can use globbing too
}
```

# Example

```lua
fx_version 'cerulean'
game 'gta5'

description 'QBCore Example Manifest'
version '1.0.0'

lua54 'yes' -- Add in case you want to use lua 5.4 (https://www.lua.org/manual/5.4/manual.html)

shared_script { 
    '@qb-core/import.lua'
}

client_scripts {
    'config/config_cl.lua', -- Non globbing method (Client config)
	'client/*.lua' -- Globbing method for multiple files
}

server_scripts {
    'config/config_sv.lua', -- Non globbing method (Server config for keeping webhooks or other important information)
	'server/*.lua' -- Globbing method for multiple files
}

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/css/main.css',
    --'html/js/*.js', -- Globbing also works here in case you have multiple js files
	'html/js/app.js'
}

dependency 'qb-core'
```