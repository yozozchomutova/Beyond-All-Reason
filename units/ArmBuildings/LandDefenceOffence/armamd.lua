return {
	armamd = {
		maxacc = 0,
		maxdec = 0,
		buildangle = 4096,
		energycost = 38000,
		metalcost = 1500,
		buildpic = "ARMAMD.DDS",
		buildtime = 60000,
		canattack = false,
		canrepeat = false,
		category = "ALL NOTLAND WEAPON NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE EMPABLE",
		collisionvolumeoffsets = "0 0 -1",
		collisionvolumescales = "53 78 53",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		explodeas = "largeexplosiongeneric",
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		health = 3650,
		maxslope = 10,
		maxwaterdepth = 0,
		noautofire = true,
		objectname = "Units/ARMAMD.s3o",
		radardistance = 50,
		script = "Units/ARMAMD.cob",
		seismicsignature = 0,
		selfdestructas = "largeExplosionGenericSelfd",
		sightdistance = 201,
		yardmap = "oooooooooooooooo",
		customparams = {
			usebuildinggrounddecal = true,
			buildinggrounddecaltype = "decals/armamd_aoplane.dds",
			buildinggrounddecalsizey = 5,
			buildinggrounddecalsizex = 5,
			buildinggrounddecaldecayspeed = 30,
			unitgroup = 'antinuke',
			model_author = "FireStorm",
			normaltex = "unittextures/Arm_normal.dds",
			removestop = true,
			removewait = true,
			subfolder = "armbuildings/landdefenceoffence",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 0 0",
				collisionvolumescales = "53 78 53",
				collisionvolumetype = "Box",
				damage = 1980,
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 5,
				footprintz = 6,
				height = 20,
				hitdensity = 100,
				metal = 934,
				object = "Units/armamd_dead.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 990,
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 5,
				footprintz = 5,
				height = 4,
				hitdensity = 100,
				metal = 374,
				object = "Units/arm5X5B.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:dust_cloud_huge_white",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
				[3] = "deathceg4",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
			cant = {
				[1] = "cantdo4",
			},
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			ok = {
				[1] = "loadwtr2",
			},
			select = {
				[1] = "loadwtr2",
			},
		},
		weapondefs = {
			amd_rocket = {
				areaofeffect = 1,
				avoidfeature = false,
				avoidfriendly = false;
				avoidenemy = false;
				avoidneutral = false;
				beamdecay = 0.0,
				beamtime = 0.6,
				cannon1name = "barrel",
				corethickness = 0.4,
				coverage = 2000;
				collideenemy = false,
				collidefriendly = false,
				collidefeature = false,
				collideneutral = false,
				collisionsize = 10,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.2,
				energypershot = 7500,
				explosiongenerator = "custom:laserhit-beamer",
				firestarter = 30,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				interceptor = 1,
				interceptsolo = 0,
				laserflaresize = 5,
				metalpershot = 150,
				name = "Taychon intercepting nuke missile weapon",
				noselfdamage = true,
				proximitypriority = 0,
				range = 7500,
				reloadtime = 1.05,
				rgbcolor = "0.7 0 1",
				soundhitdry = "",
				soundhitwet = "sizzle",
				soundstart = "antinukepulsar",
				soundtrigger = 1,
				stockpile = true,
				stockpiletime = 90,
				smoketrail = true,
				smokePeriod = 30,
				smoketime = 2000,
				smokesize = 300,
				smokecolor = 0.85,
				smokeTrailCastShadow = true,
				targetmoveerror = 0,
				thickness = 12,
				tolerance = 10000,
				turret = true,
				weapontype = "BeamLaser",
				weaponvelocity = 1400,
				damage = {
					default = 1500,
				},
			},
			amd_open = {
				name = "Antinuke Open",
				range = 0,
				soundhit = "armamdopen",
				weapontype = "Cannon",
				damage = {
					default = 0,
				},
			},
		},
		weapons = {
			[1] = {
				def = "AMD_ROCKET",
				fastautoretargeting = true,
			},
			[2] = {
				def = "AMD_OPEN",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
