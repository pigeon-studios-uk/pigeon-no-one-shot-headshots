fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'pigeon-no-one-shot-headshots'
author 'Pigeon Studios'
description 'Stops headshots killing players in one shot, so a shot to the head does the same damage as one to the body.'
version '0.1.0'
repository 'https://github.com/pigeon-studios-uk/pigeon-no-one-shot-headshots'

-- Pigeon Studios version registry entry, read by server/version_check.lua.
pigeon_slug 'pigeon-no-one-shot-headshots'

client_scripts {
    'configuration/config.lua',
    'client/main.lua',
}

server_scripts {
    'server/version_check.lua',
}
