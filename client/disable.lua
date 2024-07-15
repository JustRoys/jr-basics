Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local playerPed = PlayerPedId()
        local horse = GetMount(playerPed)

        if Config.Disable.HorseKick then
            if DoesEntityExist(horse) then
                SetPedConfigFlag(Horse, 471, true)
            end
        end

        if Config.Disable.DoorBarge then
            SetPedConfigFlag(playerPed, 445, true)
        end

        if Config.Disable.SittingScenario then
            SetPedConfigFlag(playerPed, 472, true)
        end

        if Config.Disable.RestingScenario then
            SetPedConfigFlag(playerPed, 474, true)
        end
    end
end)