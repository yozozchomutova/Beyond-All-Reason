function gadget:GetInfo()
   return {
      name = "Air Transports Speed",
      desc = "Slows down transport depending on loaded mass (up to 50%)",
      author = "raaar",
      date = "2015",
      license = "PD",
      layer = 0,
      enabled = true,
   }
end

if (not gadgetHandler:IsSyncedCode()) then return end

local TRANSPORTED_MASS_SPEED_PENALTY = 0.2 -- higher makes unit slower
local FRAMES_PER_SECOND = Game.gameSpeed

local airTransports = {}
local airTransportMaxSpeeds = {}

local canFly = {}
local unitMass = {}
local unitTransportMass = {}
local unitSpeed = {}
for unitDefID, unitDef in pairs(UnitDefs) do
	if unitDef.canFly then
		canFly[unitDefID] = true
		unitTransportMass[unitDefID] = unitDef.transportMass
	end
	unitMass[unitDefID] = unitDef.mass
	unitSpeed[unitDefID] = unitDef.speed
end

local massUsageFraction = 0
local allowedSpeed = 0
local currentMassUsage = 0

-- update allowed speed for transport
function updateAllowedSpeed(transportId)
	local uDefID = Spring.GetUnitDefID(transportId)

	-- get sum of mass and size for all transported units                                
	currentMassUsage = 0
	for _,tUnitId in pairs(Spring.GetUnitIsTransporting(transportId)) do
		currentMassUsage = currentMassUsage + unitMass[Spring.GetUnitDefID(tUnitId)]
	end
	massUsageFraction = (currentMassUsage / unitTransportMass[uDefID])
	allowedSpeed = unitSpeed[uDefID] * (1 - massUsageFraction * TRANSPORTED_MASS_SPEED_PENALTY) / FRAMES_PER_SECOND
	--Spring.Echo("unit "..transportUnitDef.name.." is air transport at  "..(massUsageFraction*100).."%".." load, curSpeed="..vw.." allowedSpeed="..allowedSpeed)

	airTransportMaxSpeeds[transportId] = allowedSpeed
end


-- add transports to table when they load a unit
function gadget:UnitLoaded(unitId, unitDefId, unitTeam, transportId, transportTeam)
	if canFly[Spring.GetUnitDefID(transportId)] and not airTransports[transportId] then
		airTransports[transportId] = true

		-- update allowed speed
		updateAllowedSpeed(transportId)
	end
end

-- cleanup transports and unloaded unit tables when destroyed
function gadget:UnitDestroyed(unitId, unitDefId, teamId, attackerId, attackerDefId, attackerTeamId)
	airTransports[unitId] = nil
	airTransportMaxSpeeds[unitId] = nil
end

-- every frame, adjust speed of air transports according to transported mass, if any
function gadget:GameFrame(n)
    
	-- for each air transport with units loaded, reduce speed if currently greater than allowed
	local factor = 1
	local vx,vy,vz,vw = 0
	local alSpeed = 0
	for unitId,_ in pairs(airTransports) do
		vx,vy,vz,vw = Spring.GetUnitVelocity(unitId)
		alSpeed = airTransportMaxSpeeds[unitId]
		if (alSpeed and vw and vw > alSpeed) then
			factor = alSpeed / vw
			Spring.SetUnitVelocity(unitId,vx * factor,vy * factor,vz * factor)
		end
	end
end


function gadget:UnitUnloaded(unitId, unitDefId, teamId, transportId)
	if canFly[Spring.GetUnitDefID(transportId)] then
		if airTransports[transportId] and not Spring.GetUnitIsTransporting(transportId)[1] then
			-- transport is empty, cleanup tables
			airTransports[transportId] = nil
			airTransportMaxSpeeds[transportId] = nil
		else
			-- update allowed speed
			updateAllowedSpeed(transportId)
		end
	end
end
