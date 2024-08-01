local Core = exports.vorp_core:GetCore()

function RemoveVehicle()
    local playerPed = PlayerPedId()
    local Vehicle = GetVehiclePedIsIn(playerPed, false)
    local Mount = GetMount(PlayerPedId())

    if IsPedInAnyVehicle(playerPed, true) then
        Vehicle = GetVehiclePedIsIn(playerPed, false)
    end

    if DoesEntityExist(Vehicle) then
        DeleteVehicle(Vehicle)
    end

    if IsPedOnMount(playerPed) then
        DeleteEntity(Mount)
    end
end

-- Delete Vehicle or mounted horse
if Config.Commands.DeleteVehicle.Enable then
    RegisterCommand(Config.Commands.DeleteVehicle.Command, function(source)
--[[         local _source = source
        local User = Core.getUser(_source)
        local Character = User.getUsedCharacter

        if not User then
            return
        end

        if Config.Commands.DeleteVehicle.AccessAnyone == false then
            if Character and Character.group and HasPermission(Config.Commands.DeleteVehicle.AllowedGroups, Character.group) then
                RemoveVehicle()
            else
                TriggerClientEvent('vorp:NotifyLeft', source, 'Mission', Config.Locale.accessDenied, 'menu_textures', 'stamp_locked', 5000)
            end
        else ]]
            RemoveVehicle()
        --end

    end, false)
end

--[[ function HasPermission(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end ]]
