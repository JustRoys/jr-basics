--[[ local Core = exports.vorp_core:GetCore()

if Config.Commands.DeleteVehicle.Enable then
    RegisterCommand(Config.Commands.DeleteVehicle.Command, function()
        local _source = source
        local Character = Core.getUser(_source)

        if Character.getGroup() == Config.Commands.DeleteVehicle.Access then
            TriggerClientEvent("jr-basics:remove")
        else
            TriggerClientEvent('vorp:NotifyLeft', _source, 'Mission', Config.Locale.accessDenied, 'menu_textures', 'stamp_locked', 5000)
        end
    end)
end ]]