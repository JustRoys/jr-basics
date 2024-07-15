-- Delete Vehicle or mounted horse
if Config.Commands.DeleteVehicle.Enable then
    RegisterCommand(Config.Commands.DeleteVehicle.Command, function()
        local playerPed = PlayerPedId()
        local vehicle   = GetVehiclePedIsIn(playerPed, false)
        local mount   = GetMount(PlayerPedId())

        if IsPedInAnyVehicle(playerPed, true) then
            vehicle = GetVehiclePedIsIn(playerPed, false)
        end

        if DoesEntityExist(vehicle) then
            DeleteVehicle(vehicle)
        end

        if IsPedOnMount(playerPed) then
            DeleteEntity(mount)
        end
    end)
end

--[[ RegisterNetEvent("jr-basics:remove")
AddEventHandler("jr-basics:remove", function()
    local playerPed = PlayerPedId()
    local vehicle   = GetVehiclePedIsIn(playerPed, false)
    local mount   = GetMount(PlayerPedId())

    if IsPedInAnyVehicle(playerPed, true) then
        vehicle = GetVehiclePedIsIn(playerPed, false)
    end

    if DoesEntityExist(vehicle) then
        DeleteVehicle(vehicle)
    end

    if IsPedOnMount(playerPed) then
        DeleteEntity(mount)
    end
end) ]]