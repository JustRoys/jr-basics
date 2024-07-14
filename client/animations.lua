local pointing = false

-- Handsup
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if (IsControlJustPressed(0, Config.Animations.HandsUp)) and IsInputDisabled(0) then
            local ped = PlayerPedId()

            if (DoesEntityExist(ped) and not IsEntityDead(ped)) then
                RequestAnimDict("script_proc@robberies@shop@rhodes@gunsmith@inside_upstairs")
                while (not HasAnimDictLoaded("script_proc@robberies@shop@rhodes@gunsmith@inside_upstairs")) do
                    Citizen.Wait(100)
                end

                if IsEntityPlayingAnim(ped, "script_proc@robberies@shop@rhodes@gunsmith@inside_upstairs", "handsup_register_owner", 3) then
                    SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
                    DisablePlayerFiring(ped, true)
                    ClearPedSecondaryTask(ped)
                else
                    SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
                    DisablePlayerFiring(ped, true)
                    TaskPlayAnim(ped, "script_proc@robberies@shop@rhodes@gunsmith@inside_upstairs", "handsup_register_owner", 2.0, -1.0, 120000, 31, 0, true, 0, false, 0, false)
                end
            end
        end
    end
end)

-- Pointing
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlPressed(0, Config.Animations.Pointing) then

            if pointing then
                pointing = false
                ClearPedSecondaryTask(PlayerPedId())
            elseif not pointing then
                pointing = true

                RequestAnimDict('script_common@other@unapproved')
                while not HasAnimDictLoaded('script_common@other@unapproved') do
                    Citizen.Wait(100)
                end

                TaskPlayAnim(PlayerPedId(), 'script_common@other@unapproved', 'loop_0', 1.0, -1.0, 9999999999, 30, 0, true, 0, false, 0, false)
            end
            Citizen.Wait(500)
        end
    end
end)