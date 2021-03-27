function gadget:GetInfo()
	return {
		name = "Air Release",
		desc = "Adds falling damage = falling height * mass / 50",
		author = "Pako",
		date = "21 Feb 2010",
		layer = 0,
		enabled = true  --  loaded by default?
	}
end

if not gadgetHandler:IsSyncedCode() then
	return
end

local fC = 0
local fallingUnits = {}
local unitMass = {}
local isCommando = {}
for udid, ud in pairs(UnitDefs) do
	if string.find(ud.name, 'cormando') then
		isCommando[udid] = true
	end
	unitMass[udid] = ud.mass
end

function gadget:GameFrame(n)
	if fC > 0 then
		local x, y, z, h
		for k, t in ipairs(fallingUnits) do
			local unitAlive = (Spring.ValidUnitID(t[1]) and (not Spring.GetUnitIsDead(t[1]))) --+++
			if unitAlive then
				--++
				x, y, z = Spring.GetUnitBasePosition(t[1])        --maybe check if units were off map
				h = Spring.GetGroundHeight(x, z)
				--else
				--Spring.Echo ("unit was not alive anymore. There would have been error spam")
			end
			if not unitAlive or h > y - 10 then
				--+++
				Spring.AddUnitDamage(t[1], t[2])
				table.remove(fallingUnits, k)
				fC = fC - 1
			end
		end
	end
end

function gadget:UnitUnloaded(unitID, unitDefID, _, transID)
	if not isCommando[unitDefID] then
		local x, y, z = Spring.GetUnitBasePosition(unitID)
		local h = math.max(0, Spring.GetGroundHeight(x, z))
		local damage = 0
		if y - h > 25 then
			damage = unitMass[unitDefID] * (y - h) / 50
		end
		if damage > 10 then
			fC = fC + 1
			fallingUnits[fC] = { unitID, damage }
		end
	end
end
