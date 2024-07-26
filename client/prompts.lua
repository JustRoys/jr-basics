Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if Config.SwimMexico == true then
            Citizen.InvokeNative(0xC1E8A365BF3B29F2, PlayerPedId(), 364, true)
        end

        if Config.Prompts.EatOrDrink == false then
            Citizen.InvokeNative(0xFC094EF26DD153FA, 1)
        end

        if Config.Prompts.Furniture == false then
            Citizen.InvokeNative(0xFC094EF26DD153FA, 2)
        end

        if Config.Prompts.Loot == false then
            Citizen.InvokeNative(0xFC094EF26DD153FA, 3)
        end

        if Config.Prompts.Interactions == false then
            Citizen.InvokeNative(0xFC094EF26DD153FA, 5)
        end

        if Config.Prompts.LockOn == false then
            Citizen.InvokeNative(0xFC094EF26DD153FA, 7)
        end

        if Config.Prompts.Sit == false then
            Citizen.InvokeNative(0xFC094EF26DD153FA, 8)
        end

        if Config.Prompts.MountHorse == false then
            Citizen.InvokeNative(0xFC094EF26DD153FA, 12)
        end
    end
end)