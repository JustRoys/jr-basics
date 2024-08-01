local pointing = false
local ragdoll = false

-- Handsup
if Config.Animations.HandsUp.Enable then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if (IsControlJustPressed(0, Config.Animations.HandsUp.Button)) and IsInputDisabled(0) then
                local ped = PlayerPedId()

                if (DoesEntityExist(ped) and not IsEntityDead(ped)) then

                    if Config.Animations.HandsUp.Option == 1 then
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
                    elseif Config.Animations.HandsUp.Option == 2 then
                        RequestAnimDict("script_proc@robberies@homestead@lonnies_shack@deception")
                        while (not HasAnimDictLoaded("script_proc@robberies@homestead@lonnies_shack@deception")) do
                            Citizen.Wait(100)
                        end

                        if IsEntityPlayingAnim(ped, "script_proc@robberies@homestead@lonnies_shack@deception",  "hands_up_loop", 3) then
                            SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
                            DisablePlayerFiring(ped, true)
                            ClearPedSecondaryTask(ped)
                        else
                            SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
                            DisablePlayerFiring(ped, true)
                            TaskPlayAnim(ped, "script_proc@robberies@homestead@lonnies_shack@deception", "hands_up_loop", 4.0, 4.0, -1, 25, 0, false, false, false, '', false)
                        end
                    end
                end
            end
        end
    end)
end

-- Pointing
if Config.Animations.Pointing.Enable then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if IsControlPressed(0, Config.Animations.Pointing.Button) then

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
end

-- Ragdoll
if Config.Animations.Ragdoll.Enable then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if IsControlPressed(0, Config.Animations.Ragdoll.Button) then
                if Config.Animations.Ragdoll.Stay then
                    if not ragdoll then
                        ragdoll = true
                        SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
                    else
                        ragdoll = false
                    end
                    Citizen.Wait(200)
                else
                    SetPedToRagdoll(PlayerPedId(), -1, -1, 0, 0, 0, 0)
                end
            end
        end
    end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if ragdoll then
            ResetPedRagdollTimer(PlayerPedId())
        end
    end
end)