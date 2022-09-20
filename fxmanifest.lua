fx_version 'cerulean'
games {'gta5'}
author 'KR'
description 'KR_well'
version '1.0.0'

server_scripts {
	'@es_extended/locale.lua',
	'zh.lua',
	'en.lua',
    'config.lua',
    'server.lua'
}

client_scripts {
    '@es_extended/locale.lua',
	'zh.lua',
	'en.lua',
    'config.lua',
    'client.lua'
}

dependency 'mythic_progbar'