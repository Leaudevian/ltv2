fx_version 'cerulean'
game 'gta5'

description 'QB-Shops'
version '1.0.0'

shared_scripts { 
	'@qb-core/import.lua',
	'config.lua'
}

client_script 'client/main.lua'
client_script 'client/SpawnPed.lua'
server_script 'server/main.lua'

dependencies {
	'qb-inventory'
}