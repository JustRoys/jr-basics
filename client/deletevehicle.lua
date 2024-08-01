local Core = exports.vorp_core:GetCore()

RegisterNetEvent("jr-basics:RemoveVehicle", function()
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
end)