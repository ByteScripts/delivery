--[[ FX Information ]]--
fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

--[[ Resource Information ]]--
author       'ByteScripts'
name         'delivery'
description  'Delivery system featuring npc missions.'
version      '0.0.0'

--[[ Manifest ]]--
dependencies {
    '/server:6683',
    '/onesync',
    'es_extended',
    'oxmysql',
    'ox_lib'
}

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua'
}

client_script 'init.lua'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'init.lua'
}

ui_page 'web/build/index.html'

files {
    'modules/**/client.lua',
    'modules/**/shared.lua',
    'locales/*.json',
    'client.lua',
    'data/*.lua',
    'init.lua',
    'web/build/**',
}