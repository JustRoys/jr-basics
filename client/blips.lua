local blips = {}

Blips = {
    --{name = "Test", sprite = 978474677, scale = 0.8, x = -339.76, y = -356.15, z = 88.07},
    --{name = "Test2", sprite = 978474677, scale = 0.8, x = -344.98, y = -338.38, z = 88.63},
    -- Add more if you want
}

Citizen.CreateThread(function()
	for _, v in pairs(Blips) do
		local blipId = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.x, v.y, v.z)
		SetBlipSprite(blipId, v.sprite, 1)
        SetBlipScale(blip, v.scale)
        local varString = CreateVarString(10, 'LITERAL_STRING', v.name)
		Citizen.InvokeNative(0x9CB1A1623062F402, blipId, varString)
		table.insert(blips, blipId)
	end
end)

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for k, v in pairs(blips) do
            RemoveBlip(v)
        end
    end
end)
