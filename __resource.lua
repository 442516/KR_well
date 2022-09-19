resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'
author 'KR'
description 'KR_well'
version '1.0.0'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
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