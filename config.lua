Config = {}

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

-- Disable Default RDR2 Flags
-- If set to true it will be disabled
Config.Disable = {
    HorseKick = false,          -- Disable horrse kicks
    DoorBarge = false,          -- Disable Door barges
    SittingScenario = false,    -- Disable sitting scenario
    RestingScenario = false,    -- Disable sitting scenario's
    HorseGunshotFlee = false,    -- Horses don't flee after gunshots
    InjuredMovement = false,     -- Disable injured movement
    WeaponDegradation = false,   -- Disable weapon degradation
    ForceDismountLeft = false,   -- Force to dismount on the left side
    ForceDismountRight = false, -- Force to dismount on the right side
}

-- Change the water in Guarma
Config.GuarmaWater = {
    Use = true,                 -- Set false if you don't want to use this function
    WaveDirection = 0,          -- 1 and 2 
    WaveAmount = 1.28,          -- amount of waves
    WaveSpeed = 1.86,           -- wave animation speed
}

Config.SwimMexico = false       -- If set to true you can safely swim across to mexico. You can also go by boat (won't break)

Config.Animations = {
    HandsUp = {
        Enable = true,
        Button = 0x8CC9CD42, -- X
    },
    Pointing = {
        Enable = true,
        Button = 0x80F28E95 -- B
    }
}

-- Commands
Config.Commands = {
    Me = { -- Me command
        Enable = true,                      -- set false to disable it
        Command = "me",
        DisplayTime = 7000,                 -- Time in ms to show ME commands
        Title = "💭 /ME",                   -- This is the title for the logs
    },
    DeleteVehicle = {                       -- Delete Vehicle or mounted horse
        Enable = true,                      -- set false to disable it
        Command = "dv",
        --Access = {'admin', 'moderator'}     -- group that have access to this command
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
}

Config.Languages = {
    Said = "said:",
    Joining = "is Joining",
    Leaving = "is leaving. Reason:",
    LeftWhileDead = "Left the server while dead",
    Weapon = "Weapon:",
    ApiKey = "You need to set a steam api key in your server.cfg for the steam identifiers to work!"
}