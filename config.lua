Config = {}

Config.CommandDeleteVehicle = "dv" -- Delete Vehicle or mounted horse

Config.SwimMexico = false       -- If set to true you can safely swim across to mexico. You can also go by boat (won't break)

-- Change the water in Guarma
Config.GuarmaWater = {
    Use = true,                 -- Set false if you don't want to use this function
    WaveDirection = 0,          -- 1 and 2 
    WaveAmount = 1.28,          -- amount of waves
    WaveSpeed = 1.86,           -- wave animation speed
}

Config.Animations = {
    HandsUp = 0x8CC9CD42, -- X
    Pointing = 0x80F28E95 -- B
}

-- Disable Default RDR2 Prompts
-- If set to false it will be disabled
Config.Prompts = {
    EatOrDrink = true,          -- Eat Almonds, Pour Coffee, Take Stew Bowl etc.
    Furniture = true,           -- Close/Open drawers, cabinets etc.
    Loot = true,                -- Loot strangers
    Interactions = true,        -- Pickup strangers, animals etc, pickup hats or swap etc.
    LockOn = true,              -- All lockon actions (emote wheel, melee, whow info etc.) Right Mouse Button
    Sit = true,                 -- Sit with E
    MountHorse = true,          -- Mount horses
}

-- Me Command
Config.Me = {
    DisplayTime = 7000,         -- Time in ms to show ME commands
    Title = "💭 /ME",          -- This is the title for the logs

    Languages = {
        Said = "said:"
    }
}

-- Logs
Config.Logs = {
    WebhookColor = 16711680,                            -- Embed Color
    BotName      = "JR-Basic Logs",                     -- Bot Name
    Logo         = "https://i.imgur.com/TDpIk4e.jpg",   -- Bot Logo
    FooterText   = "JR-Basics Logs",                    -- Footer Text
    FooterLogo   = "https://i.imgur.com/TDpIk4e.jpg",   -- Footer Logo
    Avatar       = "https://i.imgur.com/TDpIk4e.jpg",   -- Avatar Logo
    Title        = {
        Death = "💀 Deaths",
        Join = "📥 Joins",
        Leave = "📤 Leaving",
    },

    SteamName = true,
    SteamURL = true,
    DiscordID = true,
    License = true,
    IP = true,

    UseLogs = true,             -- False if you don't want to use logs
    UseModLogs = true,          -- Set false if you dont want join and leave logs for mods (no IPs)
    JoiningLog = "",
    LeavingLog = "",
    JoiningModLog = "",         -- Join logs wihtout IP
    LeavingModLog = "",         -- Leave logs wihtout IP
    DeathLog = "",
    ChatLog = "",

    Languages = {
        Joining = "is Joining",
        Leaving = "is leaving. Reason:",
        LeftWhileDead = "Left the server while dead",
        Weapon = "Weapon:",
        ApiKey = "You need to set a steam api key in your server.cfg for the steam identifiers to work!"
    }
}