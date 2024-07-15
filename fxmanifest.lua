fx_version "adamant"
game "rdr3"
lua54 "yes"

author 'JustRoy'
version '1.3'
description 'This script is made by JustRoy and tested in my own server'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

files {
    'stream/emeraldranchnohover/*.ybn'
}

shared_scripts {
    'config.lua',
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}