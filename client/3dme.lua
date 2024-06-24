RegisterCommand('me', function(source, args)                                                       -- Set the command that you want to use /me / example: RegisterCommand('NEWCOMMAND', function(source, args)   
    local text = '*'

    for i = 1,#args do
        text = text .. ' ' .. args[i]
    end

    text = text .. ' * '
    TriggerServerEvent('jr-basics:server', text)
end)

RegisterNetEvent('jr-basics:Display')
AddEventHandler('jr-basics:Display', function(text, source)
    Display(GetPlayerFromServerId(source), text)
end)

function Display(mePlayer, text)
    local displaying = true
    local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
    local coords = GetEntityCoords(PlayerPedId(), false)
    local dist = Vdist2(coordsMe, coords)

    if chatMessage then
        if dist < 2500 then
            TriggerEvent('chat:addMessage', {
                color = { color.r, color.g, color.b },
                multiline = true,
                args = { text}
            })
        end
    end

    Citizen.CreateThread(function()
    	Wait(Config.Me.DisplayTime)
        displaying = false
    end)

    Citizen.CreateThread(function()
        local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
        local coords = GetEntityCoords(PlayerPedId(), false)
        local dist = Vdist2(coordsMe, coords)

        while displaying do
            Wait(0)
            if dist < 2500 then                                                                       -- Distance for others players to see the text
                DrawText3D(coordsMe['x'], coordsMe['y'], coordsMe['z'] + 1.0, text)                     -- Set the position here by adding ['x']+numbers / example: coordsMe['z']+1.0
            end
        end
    end)
end

function DrawText3D(x, y, z, text)
    local onScreen,_x,_y = GetScreenCoordFromWorldCoord(x, y, z)
    local px,py,pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())

    if onScreen then
    	SetTextScale(0.30, 0.30)                                                                         -- Set the text size
  		SetTextFontForCurrentCommand(1)
    	SetTextColor(255, 143, 0, 100)                                                                   -- Set the text color here (rgba), you can make it with RGBA generator
    	SetTextCentre(1)
    	DisplayText(str,_x,_y)
    	local factor = (string.len(text)) / 225
        DrawSprite("feeds", "toast_bg", _x, _y + 0.0125, 0.015 + factor, 0.03, 0.1, 20, 20, 20, 200, 0)   -- Set the text background theme here
    end
end