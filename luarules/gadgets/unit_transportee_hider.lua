function gadget:GetInfo()
	return {
		name = "Transportee Hider",
		desc = "Hides units when inside a closed transport, issues stop command to units trying to enter a full transport",
		author = "FLOZi",
		date = "09/02/10",
		layer = 0,
		enabled = true  --  loaded by default?
	}
end

if not gadgetHandler:IsSyncedCode() then
	return
end

local SetUnitNoDraw = Spring.SetUnitNoDraw
local SetUnitNeutral = Spring.SetUnitNeutral
local SetUnitStealth = Spring.SetUnitStealth
local SetUnitSonarStealth = Spring.SetUnitSonarStealth
local GetUnitDefID = Spring.GetUnitDefID
local GetUnitPosition = Spring.GetUnitPosition
local GetUnitTransporter = Spring.GetUnitTransporter
local GetUnitsInCylinder = Spring.GetUnitsInCylinder
local GiveOrderToUnit = Spring.GiveOrderToUnit

-- Constants
local CMD_LOAD_ONTO = CMD.LOAD_ONTO
local CMD_STOP = CMD.STOP
-- Variables
local massLeft = {}
local toBeLoaded = {}

local unitTransportMass = {}
local unitTransportVtol = {}
local unitMass = {}
for unitDefID, unitDef in pairs(UnitDefs) do
	unitMass[unitDefID] = unitDef.mass
	unitTransportMass[unitDefID] = unitDef.transportMass
	if not unitDef.modCategories.vtol and not unitDef.customParams.isairbase then
		unitTransportVtol[unitDefID] = true
	end
end

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions, cmdTag, playerID, fromSynced, fromLua)
	if cmdID == CMD_LOAD_ONTO then
		local transportID = cmdParams[1]
		toBeLoaded[unitID] = transportID
	end
	return true
end

function gadget:UnitCreated(unitID, unitDefID, teamID)
	massLeft[unitID] = unitTransportMass[unitDefID]
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
	massLeft[unitID] = nil
	toBeLoaded[unitID] = nil
end

function gadget:Initialize()
	local allUnits = Spring.GetAllUnits()
	for _, unitID in ipairs(allUnits) do
		gadget:UnitCreated(unitID, Spring.GetUnitDefID(unitID), Spring.GetUnitTeam(unitID))
	end
end

local function TransportIsFull(transportID)
	for unitID, targetTransporterID in pairs(toBeLoaded) do
		if targetTransporterID == transportID then
			GiveOrderToUnit(unitID, CMD_STOP, {}, 0)
			toBeLoaded[unitID] = nil
		end
	end
end

function gadget:UnitLoaded(unitID, unitDefID, unitTeam, transportID, transportTeam)
	--Spring.Echo("UnitLoaded", unitID, unitDefID, transportID)
	if not unitDefID or not transportID then
		return
	end
	-- Check if transport is full (former crash risk!)
	if not massLeft[transportID] then
		--Spring.Echo("no mass left")
		return
	end
	massLeft[transportID] = massLeft[transportID] - unitMass[unitDefID]
	if massLeft[transportID] == 0 then
		TransportIsFull(transportID)
	end
	if unitTransportVtol[GetUnitDefID(transportID)] then
		SetUnitNoDraw(unitID, true)
		SetUnitStealth(unitID, true)
		SetUnitSonarStealth(unitID, true)
	end
end

function gadget:UnitUnloaded(unitID, unitDefID, teamID, transportID)
	--Spring.Echo("UnitUnloaded", unitID, unitDefID, transportID)
	if not unitDefID or not transportID then
		return
	end
	if not massLeft[transportID] then
		return
	end
	massLeft[transportID] = massLeft[transportID] + unitMass[unitDefID]
	if unitTransportVtol[GetUnitDefID(transportID)] then
		SetUnitNoDraw(unitID, false)
		SetUnitStealth(unitID, false)
		SetUnitSonarStealth(unitID, false)
	end
end

