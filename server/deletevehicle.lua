local Core = exports.vorp_core:GetCore()

local T = Translation.Langs[Config.Language]

-- Delete Vehicle or mounted horse
if Config.Commands.DeleteVehicle.Enable then
    RegisterCommand(Config.Commands.DeleteVehicle.Command, function(source)
        local _source = source
        local User = Core.getUser(_source)
        local Character = User.getUsedCharacter

        if not User then
            return
        end

        if Config.Commands.DeleteVehicle.AccessAnyone == false then
            if Character and Character.group and HasPermission(Config.Commands.DeleteVehicle.AllowedGroups, Character.group) then
                TriggerClientEvent("jr-basics:RemoveVehicle", _source)
            else
                TriggerClientEvent("vorp:TipRight", _source, T.NoPerm, 6000)
            end
        else
            TriggerClientEvent("jr-basics:RemoveVehicle", _source)
        end

    end, false)
end

function HasPermission(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end