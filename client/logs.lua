Citizen.CreateThread(function()
	local DeathReason, Killer, DeathCauseHash, Weapon

	while true do
		Citizen.Wait(6000)

		if IsEntityDead(PlayerPedId()) then
			Citizen.Wait(500)
			local PedKiller = GetPedSourceOfDeath(PlayerPedId())

			DeathCauseHash = GetPedCauseOfDeath(PlayerPedId())
			Weapon = WeaponNames[tostring(DeathCauseHash)]

			if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then
				Killer = NetworkGetPlayerIndexFromPed(PedKiller)
			elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then
				Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))
			end

			if (Killer == PlayerId()) then
				DeathReason = 'committed suicide'
			elseif (Killer == nil) then
				DeathReason = 'died'
			else
				DeathReason = 'killed'
			end

			if DeathReason == 'committed suicide' or DeathReason == 'died' then
				local msg = '***'..GetPlayerName(PlayerId()) .. '*** ' .. DeathReason .. '.'
				TriggerServerEvent('jr-basics:PlayerDied', msg, Weapon)
			else
				local msg = '***'..GetPlayerName(Killer) .. '*** ' .. DeathReason .. ' ***' .. GetPlayerName(PlayerId()) .. '***'
				TriggerServerEvent('jr-basics:PlayerDied', msg, Weapon)
			end

			Killer = nil
			DeathReason = nil
			DeathCauseHash = nil
			Weapon = nil
		end

		while IsEntityDead(PlayerPedId()) do
			Citizen.Wait(0)
		end
	end
end)

WeaponNames = {
	[tostring(GetHashKey('WEAPON_UNARMED'))] = 'Unarmed',
	[tostring(GetHashKey('WEAPON_MELEE_KNIFE'))] = 'KNIFE',
	[tostring(GetHashKey('WEAPON_MELEE_KNIFE_BEAR'))] = 'KNIFE BEAR',
	[tostring(GetHashKey('WEAPON_MELEE_KNIFE_RUSTIC'))] = 'Knife Rustic',
	[tostring(GetHashKey('WEAPON_MELEE_KNIFE_HORROR'))] = 'Knife Horror',
	[tostring(GetHashKey('WEAPON_MELEE_KNIFE_CIVIL_WAR'))] = 'KNIFE CIVIL WAR',
	[tostring(GetHashKey('WEAPON_MELEE_KNIFE_JAWBONE'))] = 'KNIFE JAWBONE',
	[tostring(GetHashKey('WEAPON_MELEE_KNIFE_JOHN'))] = 'KNIFE JOHN',
	[tostring(GetHashKey('WEAPON_MELEE_KNIFE_MINER'))] = 'KNIFE MINER',
	[tostring(GetHashKey('WEAPON_MELEE_KNIFE_VAMPIRE'))] = 'KNIFE VAMPIRE',
	[tostring(GetHashKey('WEAPON_MELEE_LANTERN_ELECTRIC'))] = 'LANTERN ELECTRIC',
	[tostring(GetHashKey('WEAPON_MELEE_MACHETE'))] = 'MACHETE',
	[tostring(GetHashKey('WEAPON_MELEE_TORCH'))] = 'TORCH',
	[tostring(GetHashKey('WEAPON_MOONSHINEJUG'))] = 'MOONSHINEJUG',
	[tostring(GetHashKey('WEAPON_PISTOL_M1899'))] = 'PISTOL M1899',
	[tostring(GetHashKey('WEAPON_PISTOL_MAUSER'))] = 'PISTOL MAUSER',
	[tostring(GetHashKey('WEAPON_PISTOL_MAUSER_DRUNK'))] = 'PISTOL MAUSER DRUNK',
	[tostring(GetHashKey('WEAPON_PISTOL_SEMIAUTO'))] = 'PISTOL SEMIAUTO',
	[tostring(GetHashKey('WEAPON_PISTOL_VOLCANIC'))] = 'PISTOL VOLCANIC',
	[tostring(GetHashKey('WEAPON_REPEATER_CARBINE'))] = 'REPEATER CARBINE',
	[tostring(GetHashKey('WEAPON_REPEATER_EVANS'))] = 'REPEATER EVANS',
	[tostring(GetHashKey('WEAPON_REPEATER_HENRY'))] = 'REPEATER HENRY',
	[tostring(GetHashKey('WEAPON_REVOLVER_NAVY'))] = 'Revolver Navy',
	[tostring(GetHashKey('WEAPON_REVOLVER_NAVY_CROSSOVER'))] = 'Revolver Navy Crossover',
	[tostring(GetHashKey('WEAPON_REPEATER_WINCHESTER'))] = 'REPEATER WINCHESTER',
	[tostring(GetHashKey('WEAPON_REVOLVER_CATTLEMAN'))] = 'REVOLVER CATTLEMAN',
	[tostring(GetHashKey('WEAPON_REVOLVER_CATTLEMAN_JOHN'))] = 'REVOLVER CATTLEMAN JOHN',
	[tostring(GetHashKey('WEAPON_REVOLVER_CATTLEMAN_MEXICAN'))] = 'REVOLVER CATTLEMAN MEXICAN',
	[tostring(GetHashKey('WEAPON_REVOLVER_CATTLEMAN_PIG'))] = 'REVOLVER CATTLEMAN PIG',
	[tostring(GetHashKey('WEAPON_REVOLVER_DOUBLEACTION'))] = 'REVOLVER DOUBLEACTION',
	[tostring(GetHashKey('WEAPON_REVOLVER_DOUBLEACTION_EXOTIC'))] = 'REVOLVER DOUBLEACTION EXOTIC',
	[tostring(GetHashKey('WEAPON_REVOLVER_DOUBLEACTION_GAMBLER'))] = 'REVOLVER DOUBLEACTION GAMBLER',
	[tostring(GetHashKey('WEAPON_REVOLVER_DOUBLEACTION_MICAH'))] = 'REVOLVER DOUBLEACTION MICAH',
	[tostring(GetHashKey('WEAPON_REVOLVER_LEMAT'))] = 'REVOLVER LEMAT',
	[tostring(GetHashKey('WEAPON_REVOLVER_SCHOFIELD'))] = 'REVOLVER SCHOFIELD',
	[tostring(GetHashKey('WEAPON_REVOLVER_SCHOFIELD_CALLOWAY'))] = 'REVOLVER SCHOFIELD CALLOWAY',
	[tostring(GetHashKey('WEAPON_REVOLVER_SCHOFIELD_GOLDEN'))] = 'REVOLVER SCHOFIELD GOLDEN',
	[tostring(GetHashKey('WEAPON_RIFLE_BOLTACTION'))] = 'RIFLE BOLTACTION',
	[tostring(GetHashKey('WEAPON_RIFLE_SPRINGFIELD'))] = 'RIFLE SPRINGFIELD',
	[tostring(GetHashKey('WEAPON_RIFLE_VARMINT'))] = 'RIFLE VARMINT',
	[tostring(GetHashKey('WEAPON_RIFLE_ELEPHANT'))] = 'Elephant Rifle',
	[tostring(GetHashKey('WEAPON_SHOTGUN_DOUBLEBARREL'))] = 'SHOTGUN DOUBLEBARREL',
	[tostring(GetHashKey('WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC'))] = 'SHOTGUN DOUBLEBARREL EXOTIC',
	[tostring(GetHashKey('WEAPON_SHOTGUN_PUMP'))] = 'SHOTGUN PUMP',
	[tostring(GetHashKey('WEAPON_SHOTGUN_REPEATING'))] = 'SHOTGUN REPEATING',
	[tostring(GetHashKey('WEAPON_SHOTGUN_SAWEDOFF'))] = 'SHOTGUN SAWEDOFF',
	[tostring(GetHashKey('OBJECT'))] = 'Object',
	[tostring(GetHashKey('WEAPON_SHOTGUN_SEMIAUTO'))] = 'SHOTGUN SEMIAUTO',
	[tostring(GetHashKey('WEAPON_SNIPERRIFLE_CARCANO'))] = 'SNIPERRIFLE CARCANO',
	[tostring(GetHashKey('WEAPON_SNIPERRIFLE_ROLLINGBLOCK'))] = 'SNIPERRIFLE ROLLINGBLOCK',
	[tostring(GetHashKey('WEAPON_SNIPERRIFLE_ROLLINGBLOCK_EXOTIC'))] = 'SNIPERRIFLE ROLLINGBLOCK EXOTIC',
	[tostring(GetHashKey('WEAPON_THROWN_DYNAMITE'))] = 'DYNAMITE',
	[tostring(GetHashKey('WEAPON_THROWN_MOLOTOV'))] = 'MOLOTOV',
	[tostring(GetHashKey('WEAPON_THROWN_THROWING_KNIVES'))] = 'THROWING KNIVES',
	[tostring(GetHashKey('WEAPON_THROWN_TOMAHAWK'))] = 'TOMAHAWK',
	[tostring(GetHashKey('WEAPON_THROWN_TOMAHAWK_ANCIENT'))] = 'TOMAHAWK ANCIENT',
	[tostring(GetHashKey('WEAPON_MELEE_HATCHET_VIKING'))] = 'HATCHET VIKING',
	[tostring(GetHashKey('WEAPON_MELEE_HATCHET_HUNTER_RUSTED'))] = 'HATCHET HUNTER RUSTED',
	[tostring(GetHashKey('WEAPON_MELEE_HATCHET_HUNTER'))] = 'HATCHET HUNTER',
	[tostring(GetHashKey('WEAPON_MELEE_HATCHET_HEWING'))] = 'HATCHET HEWING',
	[tostring(GetHashKey('WEAPON_MELEE_HATCHET_DOUBLE_BIT_RUSTED'))] = 'HATCHET DOUBLE BIT RUSTED',
	[tostring(GetHashKey('WEAPON_MELEE_HATCHET_DOUBLE_BIT'))] = 'HATCHET DOUBLE BIT',
	[tostring(GetHashKey('WEAPON_MELEE_HATCHET'))] = 'HATCHET',
	[tostring(GetHashKey('WEAPON_MELEE_CLEAVER'))] = 'CLEAVER',
	[tostring(GetHashKey('WEAPON_MELEE_BROKEN_SWORD'))] = 'BROKEN SWORD',
	[tostring(GetHashKey('WEAPON_MELEE_KNIFE_TRADER'))] = 'Knife Trader',
	[tostring(GetHashKey('WEAPON_MELEE_ANCIENT_HATCHET'))] = 'ANCIENT HATCHET',
	[tostring(GetHashKey('WEAPON_LASSO'))] = 'LASSO',
	[tostring(GetHashKey('WEAPON_LASSO_REINFORCED'))] = 'Reinforced Lasso',
	[tostring(GetHashKey('WEAPON_FISHINGROD'))] = 'FISHINGROD',
	[tostring(GetHashKey('WEAPON_BOW_IMPROVED'))] = 'Improved Bow',
	[tostring(GetHashKey('WEAPON_MACHETE_HORROR'))] = 'Machete Horror',
	[tostring(GetHashKey('WEAPON_BOW'))] = 'BOW'
}