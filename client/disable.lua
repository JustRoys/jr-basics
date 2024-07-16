Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local playerPed = PlayerPedId()
        local horse = GetMount(playerPed)

        if Config.Disable.HorseKick then
            if DoesEntityExist(horse) then
                SetPedConfigFlag(horse, 471, true)
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

        if Config.Disable.HorseGunshotFlee then
            if DoesEntityExist(horse) then
                SetPedConfigFlag(horse, 312, true)
            end
        end

        if Config.Disable.InjuredMovement then
            SetPedConfigFlag(playerPed, 584, true)
        end

        if Config.Disable.WeaponDegradation then
            SetPedConfigFlag(playerPed, 361, true)
        end

        if Config.Disable.ForceDismountLeft then
            SetPedConfigFlag(playerPed, 341, true)
        end

        if Config.Disable.ForceDismountRight then
            SetPedConfigFlag(playerPed, 342, true)
        end
    end
end)