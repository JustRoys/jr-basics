local Core = exports.vorp_core:GetCore()

local T = Translation.Langs[Config.Language]

RegisterServerEvent("jr-basics:PlayerDied")
AddEventHandler("jr-basics:PlayerDied", function(msg, Weapon)
    local _source = source
    local webhook = Config.Logs.DeathLog
    local title = Config.Logs.Title.Death
    local message

    if Weapon ~= nil then
        message = msg.." "..T.Weapon.. " ***"..Weapon.."*** "
    else
        message = msg.." "
    end
    SendWebhookMessage(webhook, title, message, text, color)
end)

-- Player Joining Log
AddEventHandler('playerJoining', function(reason)
    -- Admin Log
    local webhook = Config.Logs.JoiningLog
    local title = Config.Logs.Title.Join

    Player_Details = GetPlayerDetails(source)
    message = "***"..GetPlayerName(source) .. "*** "..T.Joining.." "..Player_Details

    SendWebhookMessage(webhook, title, message, text, color)

    -- Mod Log
    if Config.Logs.UseModLogs then
        local webhook2 = Config.Logs.JoiningModLog
        local title2 = Config.Logs.Title.Join

        Player_Details = GetPlayerDetails2(source)
        message = "***"..GetPlayerName(source) .. "*** "..T.Joining.." "..Player_Details

        SendWebhookMessage(webhook2, title2, message, text, color)
    end
end)


-- Player Leaving Log
AddEventHandler('playerDropped', function(reason)
    local User = Core.getUser(source)
    local Character = User.getUsedCharacter
    local isdead = Character.isdead

    if isdead then
        -- Admin Log
        local webhook = Config.Logs.LeavingLog
        local title = Config.Logs.Title.Leave

        Player_Details = GetPlayerDetails(source)
        message = "***"..GetPlayerName(source) .. "*** "..T.Leaving.." "..reason.. "("..T.LeftWhileDead..") \n"..Player_Details

        SendWebhookMessage(webhook, title, message, text, color)

        -- Mod Log
        if Config.Logs.UseModLogs then
            local webhook2 = Config.Logs.LeavingModLog
            local title2 = Config.Logs.Title.Leave

            Player_Details2 = GetPlayerDetails2(source)
            message = "***"..GetPlayerName(source) .. "*** "..T.Leaving.." "..reason.. "("..T.LeftWhileDead..") \n"..Player_Details2

            SendWebhookMessage(webhook2, title2, message, text, color)
        end
        isdead = nil
    else
        -- Admin Log
        local webhook = Config.Logs.LeavingLog
        local title = Config.Logs.Title.Leave

        Player_Details = GetPlayerDetails(source)
        message = "***"..GetPlayerName(source) .. "*** "..T.Leaving.." "..reason.. " \n"..Player_Details

        SendWebhookMessage(webhook, title, message, text, color)

        -- Mod Log
        if Config.Logs.UseModLogs then
            local webhook2 = Config.Logs.LeavingModLog
            local title2 = Config.Logs.Title.Leave

            Player_Details2 = GetPlayerDetails2(source)
            message = "***"..GetPlayerName(source) .. "*** "..T.Leaving.." "..reason.. " \n"..Player_Details2

            SendWebhookMessage(webhook2, title2, message, text, color)
        end
        isdead = nil
    end
end)

-- Admin Log
function GetPlayerDetails(source)
    local ids = ExtractIdentifiers(source)

    if Config.Logs.DiscordID then
        if ids.discord then
            _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "").."> `("..ids.discord:gsub("discord:", "")..")`"
        else
            _discordID = "\n**Discord ID:** N/A"
        end
    else
        _discordID = ""
    end

    if GetConvar("steam_webApiKey", "false") ~= 'false' then
        if Config.Logs.SteamName then
            if ids.steam then
                _steamID ="\n**Steam ID:** `" ..ids.steam.."`"
            else
                _steamID = "\n**Steam ID:** N/A"
            end
        else
            _steamID = ""
        end

        if Config.Logs.SteamURL then
            if ids.steam then
                _steamURL ="\nhttps://steamcommunity.com/profiles/" ..tonumber(ids.steam:gsub("steam:", ""),16)..""
            else
                _steamURL = "\n**Steam URL:** N/A"
            end
        else
            _steamURL = ""
        end
    else
        _steamID = ""
        _steamURL = ""
        print(T.ApiKey)
    end

	if Config.Logs.License then
        if ids.license then
            _license ="\n**License:** `" ..ids.license.."`"
        else
            _license = "\n**License:** N/A"
        end
    else
        _license = ""
    end

    if Config.Logs.IP then
        if ids.ip then
            _ip ="\n**IP:** " ..ids.ip:gsub("ip:", "")
        else
            _ip = "\n**IP:** N/A"
        end
    else
        _ip = ""
    end

    return _discordID.._steamID.._steamURL.._license.._ip
end

-- Mod Log
function GetPlayerDetails2(source)
    local ids = ExtractIdentifiers(source)

    if Config.Logs.DiscordID then
        if ids.discord then
            _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "").."> `("..ids.discord:gsub("discord:", "")..")`"
        else
            _discordID = "\n**Discord ID:** N/A"
        end
    else
        _discordID = ""
    end

    if GetConvar("steam_webApiKey", "false") ~= 'false' then
        if Config.Logs.SteamName then
            if ids.steam then
                _steamID ="\n**Steam ID:** `" ..ids.steam.."`"
            else
                _steamID = "\n**Steam ID:** N/A"
            end
        else
            _steamID = ""
        end

        if Config.Logs.SteamURL then
            if ids.steam then
                _steamURL ="\nhttps://steamcommunity.com/profiles/" ..tonumber(ids.steam:gsub("steam:", ""),16)..""
            else
                _steamURL = "\n**Steam URL:** N/A"
            end
        else
            _steamURL = ""
        end
    else
        _steamID = ""
        _steamURL = ""
        print(T.ApiKey)
    end

	if Config.Logs.License then
        if ids.license then
            _license ="\n**License:** `" ..ids.license.."`"
        else
            _license = "\n**License:** N/A"
        end
    else
        _license = ""
    end

    return _discordID.._steamID.._steamURL.._license
end

function GetIdentity(source, identity)
    local num = 0
    local num2 = GetNumPlayerIdentifiers(source)

    if GetNumPlayerIdentifiers(source) > 0 then
        local ident = nil

        while num < num2 and not ident do
            local a = GetPlayerIdentifier(source, num)
            if string.find(a, identity) then ident = a end
            num = num + 1
        end

        return ident;
    end
end

function ExtractIdentifiers(source)
    local identifiers = {}

    for i = 0, GetNumPlayerIdentifiers(source) - 1 do
        local id = GetPlayerIdentifier(source, i)

        if string.find(id, "steam:") then
            identifiers['steam'] = id
        elseif string.find(id, "ip:") then
            identifiers['ip'] = id
        elseif string.find(id, "discord:") then
            identifiers['discord'] = id
        elseif string.find(id, "license:") then
            identifiers['license'] = id
        end
    end

    return identifiers
end

--------------------------------------------------------------------------------------------------
function SendWebhookMessage(webhook, title, message, text, color)
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
        embeds = {
            {
                ["color"] = Config.Logs.WebhookColor,
                ["author"] = {
                    ["name"] = Config.Logs.BotName,
                    ["icon_url"] = Config.Logs.Logo
                },
                ["title"] = title,
                ["description"] = message,
                ["footer"] = {
                    ["text"] = ""..Config.Logs.FooterText.." " .. " • " .. os.date("%x %X %p"),
                    ["icon_url"] = Config.Logs.FooterLogo,
                },
            },
        },
        avatar_url = Config.Logs.Avatar
    }), {
        ['Content-Type'] = 'application/json'
    })
end