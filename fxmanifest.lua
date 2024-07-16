fx_version "adamant"
game "rdr3"
lua54 "yes"

author 'JustRoy'
description 'This script is made by JustRoy and tested in my own server'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

version '1.3'
vorp_checker 'yes'
vorp_name '^4Resource version Check^3'
vorp_github 'https://github.com/JustRoys/jr-basics'

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