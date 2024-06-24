-- Delete Vehicle or mounted horse
RegisterCommand(Config.CommandDeleteVehicle, function()
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
