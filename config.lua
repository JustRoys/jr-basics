Config = {}

Config.Language = "English"             -- English, Dutch, German

-- Disable Default RDR2 Prompts
-- If set to false it will be disabled
Config.Prompts = {
    EatOrDrink = true,                  -- Eat Almonds, Pour Coffee, Take Stew Bowl etc.
    Furniture = true,                   -- Close/Open drawers, cabinets etc.
    Loot = true,                        -- Loot strangers, skin promp disapear
    Interactions = true,                -- Pickup strangers, animals etc, pickup hats or swap etc.
    LockOn = true,                      -- All lockon actions (emote wheel, melee, whow info etc.) Right Mouse Button
    Sit = true,                         -- Sit with E
    MountHorse = true,                  -- Mount horses
}

-- Disable Default RDR2 Flags
-- If set to true it will be disabled
Config.Disable = {
    HorseKick = false,                  -- Disable horrse kicks
    DoorBarge = false,                  -- Disable Door barges
    SittingScenario = false,            -- Disable sitting scenario
    RestingScenario = false,            -- Disable sitting scenario's
    HorseGunshotFlee = false,           -- Horses don't flee after gunshots
    InjuredMovement = false,            -- Disable injured movement
    WeaponDegradation = false,          -- Disable weapon degradation
    ForceDismountLeft = false,          -- Force to dismount on the left side
    ForceDismountRight = false,         -- Force to dismount on the right side
}

-- Traffic
Config.Traffic = {
    Enable = true,
    PedTraffic = 1,
    PedFrequency = 1,
    AnimalFrequency = 1,
    TrafficFrequency = 1,
}

-- Change the water in Guarma
Config.GuarmaWater = {
    Enable = true,                      -- Set false if you don't want to use this function
    WaveDirection = 0,                  -- 1 and 2 
    WaveAmount = 1.28,                  -- amount of waves
    WaveSpeed = 1.86,                   -- wave animation speed
}

Config.SwimMexico = false               -- If set to true you can safely swim across to mexico. You can also go by boat (won't break)

-- Animations
Config.Animations = {
    HandsUp = {
        Enable = true,                  -- Set false to disable it
        Button = 0x8CC9CD42,            -- X
        Option = 1,                     -- 2 animation options, choose 1 or 2. Keep in mind that some scripts might conflict with each other is not choosen default option (1)
    },
    Pointing = {
        Enable = true,                  -- Set false to disable it
        Button = 0x4CC0E2FE             -- B
    },
    Ragdoll = {
        Enable = true,                  -- Set false to disable it
        Button = 0x26E9DC00,            -- Z
        Stay = true,                    -- Stay in ragdoll mode, if false you only stay for around 10 seconds on the ground and you still move
    },
}

-- Commands
Config.Commands = {
    Me = { -- Me command
        Enable = true,                          -- set false to disable it
        Command = "me",                         -- Command to use /me
        Distance = 2500,                        -- Distance for others players to see the text
        DisplayTime = 7000,                     -- Time in ms to show ME commands
    },
    DeleteVehicle = {                           -- Delete Vehicle or mounted horse
        Enable = true,                          -- set false to disable it
        Command = "dv",                         -- Command to delete vehicle
        AccessAnyone = false,                    -- Set true if you want everyone to have access to this command, if false only the groups in AllowedGroups will have access
        AllowedGroups = {'admin', 'moderator'}  -- Group(s) that have access to this command
    }
}

-- Logs
Config.Logs = {
    Enable = true,                                          -- Set false if you don't want to use logs
    UseModLogs = true,                                      -- Set false if you dont want join and leave logs for mods (no IPs)
    Bot = {
        Name         = "JR-Basic Logs",                     -- Bot Name
        Avatar       = "https://i.imgur.com/TDpIk4e.jpg",   -- Avatar Logo
        Logo         = "https://i.imgur.com/TDpIk4e.jpg",   -- Bot Logo
        FooterText   = "JR-Basics Logs",                    -- Footer Text
        FooterLogo   = "https://i.imgur.com/TDpIk4e.jpg",   -- Footer Logo
        Color        = 16711680,                            -- Embed Color
    },
    Options = {
        SteamName = true,
        SteamURL = true,
        DiscordID = true,
        License = true,
        IP = true,
    },
    Webhooks = {
        JoiningLog = "",
        LeavingLog = "",
        JoiningModLog = "",                     -- Join logs wihtout IP
        LeavingModLog = "",                     -- Leave logs wihtout IP
        DeathLog = "",
        ChatLog = "",
    },
}