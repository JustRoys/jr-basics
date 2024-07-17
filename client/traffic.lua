Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- Peds
        Citizen.InvokeNative(0xAB0D553FE20A6E25, Config.Traffic.PedTraffic) -- SetAmbientPedDensityMultiplierThisFrame
        Citizen.InvokeNative(0x7A556143A1C03898, Config.Traffic.PedTraffic) -- SetScenarioPedDensityMultiplierThisFrame

        -- Humans
        Citizen.InvokeNative(0xBA0980B5C0A11924, Config.Traffic.PedFrequency) -- SetAmbientHumanDensityMultiplierThisFrame
        Citizen.InvokeNative(0x28CB6391ACEDD9DB, Config.Traffic.PedFrequency) -- SetScenarioHumanDensityMultiplierThisFrame

        -- Animals
        Citizen.InvokeNative(0xC0258742B034DFAF, Config.Traffic.AnimalFrequency) -- SetAmbientAnimalDensityMultiplierThisFrame
        Citizen.InvokeNative(0xDB48E99F8E064E56, Config.Traffic.AnimalFrequency) -- SetScenarioAnimalDensityMultiplierThisFrame

        -- Vehicles
        Citizen.InvokeNative(0xFEDFA97638D61D4A, Config.Traffic.TrafficFrequency) -- SetParkedVehicleDensityMultiplierThisFrame
        Citizen.InvokeNative(0x1F91D44490E1EA0C, Config.Traffic.TrafficFrequency) -- SetRandomVehicleDensityMultiplierThisFrame
        Citizen.InvokeNative(0x606374EBFC27B133, Config.Traffic.TrafficFrequency) -- SetVehicleDensityMultiplierThisFrame
    end
end)