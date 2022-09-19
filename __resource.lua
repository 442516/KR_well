resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'
author 'KR'
description 'fetch water'
version '1.0.0'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/zh.lua',
    'config.lua',
    'server.lua'
}

client_scripts {
    '@es_extended/locale.lua',
	'locales/zh.lua',
    'config.lua',
    'client.lua'
}

dependency 'mythic_progbar'