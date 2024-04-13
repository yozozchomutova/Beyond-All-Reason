if gadgetHandler:IsSyncedCode() then
	return
end

function gadget:GetInfo()
	return {
		name = "Lups Hex Shield FX",
		desc = "",
		author = "yzch",
		date = "5th April 2024",
		license = "Public Domain",
		layer = 10,
		enabled = true,
	}
end

local CloakEffect = {
	{ class = 'UnitCloaker', options = { life = 50 } },
	{ class = 'UnitJitter', options = { delay = 24, life = math.huge } },
	{ class = 'Sound', options = { file = "cloak", volume = 0.9 } },
}
local EnemyCloakEffect = {
	{ class = 'UnitCloaker', options = { life = 20 } },
}

local DecloakEffect = {
	{ class = 'UnitCloaker', options = { inverse = true, life = 50 } },
}
local EnemyDecloakEffect = {
	{ class = 'UnitCloaker', options = { inverse = true, life = 60 } },
}

local Lups
local particleIDs = {}
local initialized = false -- if LUPS isn't started yet, we try it once a gameframe later
local spec, fullview = Spring.GetSpectatingState()

function AddPToUnit(unitID, unitDefID, teamID)
	if not initialized then
		return
	end

	local allyTeamID = Spring.GetUnitAllyTeam(unitID)
	local LocalAllyTeamID
	local _, specFullView = Spring.GetSpectatingState()
	if specFullView then
		LocalAllyTeamID = allyTeamID
	else
		LocalAllyTeamID = Spring.GetLocalAllyTeamID()
	end

	if particleIDs[unitID] then
		for i = 1, #particleIDs[unitID] do
			Lups.RemoveParticles(particleIDs[unitID][i])
		end
	end
	particleIDs[unitID] = {}
	if LocalAllyTeamID == allyTeamID then
		if Lups then
			for i = 1, #CloakEffect do
				local fx = CloakEffect[i]
				fx.options.unit = unitID
				fx.options.unitDefID = unitDefID
				fx.options.team = teamID
				fx.options.allyTeam = allyTeamID
				particleIDs[unitID][i] = Lups.AddParticles(fx.class, fx.options)
			end
		end
	else
		if Lups then
			for i = 1, #EnemyCloakEffect do
				local fx = EnemyCloakEffect[i]
				fx.options.unit = unitID
				fx.options.unitDefID = unitDefID
				fx.options.team = teamID
				fx.options.allyTeam = allyTeamID
				particleIDs[unitID][i] = Lups.AddParticles(fx.class, fx.options)
			end
		end
	end

end

--function gadget:UnitGiven(unitID, unitDefID, teamID, oldTeamID)
--	if Spring.GetUnitIsCloaked(unitID) then
--		gadget:UnitCloaked(unitID, unitDefID, teamID)
--	end
--end

function gadget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam)
	Spring.Echo("22");
	if initialized then
		if (particleIDs[unitID] == nil) then
			Spring.Echo("33");
			AddPToUnit(unitID, unitDefID, unitTeam);
		else
			Spring.Echo("44");
			local effects = particleIDs[unitID]
			for i = 1, #effects do
				Lups.RemoveParticles(effects[i])
			end
			particleIDs[unitID] = nil
		end
	end
end

function gadget:UnitFinished(unitID, unitDefID, unitTeam)
	Spring.Echo("00");
	if initialized then
		Spring.Echo("11");
		AddPToUnit(unitID, unitDefID, unitTeam);
	end
end

function gadget:UnitDestroyed(unitID, unitDefID)
	if initialized and particleIDs[unitID] then
		local effects = particleIDs[unitID]
		for i = 1, #effects do
			Lups.RemoveParticles(effects[i])
		end
		particleIDs[unitID] = nil
	end
end

--function gadget:PlayerChanged(playerID)
--	local prevFullview = fullview
--	spec, fullview = Spring.GetSpectatingState()
--	if playerID == Spring.GetMyPlayerID() then
--		if prevFullview ~= fullview then
--			gadgetHandler:UpdateCallIn("Update")	-- this should reset the cloak fx
--		end
--	end
--end

local function ReinitializeUnitFX()
	-- clear old FXs
	for _, unitFxIDs in pairs(particleIDs) do
		for i = 1, #unitFxIDs do
			Lups.RemoveParticles(unitFxIDs[i])
		end
	end
	particleIDs = {}

	-- initialize effects for existing units
	local allUnits = Spring.GetAllUnits();
	for i = 1, #allUnits do
		local unitID = allUnits[i]
		if Spring.GetUnitIsCloaked(unitID) then
			local unitDefID = Spring.GetUnitDefID(unitID)
			local teamID = Spring.GetUnitTeam(unitID)
			gadget:UnitCloaked(unitID, unitDefID, teamID)
		end
	end

	gadgetHandler:RemoveCallIn("Update")
end

function gadget:Update()
	if Spring.GetGameFrame() < 1 then
		return
	end

	Lups = GG['Lups']
	if Lups then
		initialized = true
	else
		return
	end

	gadget.Update = ReinitializeUnitFX
	gadgetHandler:UpdateCallIn("Update")
end

function gadget:Shutdown()

	if initialized then
		for _, unitFxIDs in pairs(particleIDs) do
			for i = 1, #unitFxIDs do
				Lups.RemoveParticles(unitFxIDs[i])
			end
		end
		particleIDs = {}
	end
end
