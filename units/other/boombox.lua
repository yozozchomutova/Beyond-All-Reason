return {
	boombox = {
		blocking = true,
		energycost = 1,
		metalcost = 1,
		buildpic = "other/boombox.dds",
		buildtime = 255,
		canattack = false,
		canmove = true,
		canrepeat = false,
		cantbetransported = true,
		capturable = true,
		category = "OBJECT",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "8.5 3.5 2.5",
		collisionvolumetype = "Box",
		crushresistance = 2500000,
		explodeas = "decoycommander",
		footprintx = 1,
		footprintz = 2,
		hidedamage = true,
		idleautoheal = 0,
		mass = 40,
		health = 560000,
		maxslope = 64,
		speed = 30.0,
		maxwaterdepth = 0,
		movementclass = "BOT1",
		objectname = "Units/boombox.s3o",
		reclaimable = false,
		repairable = false,
		script = "Units/boombox.cob",
		seismicsignature = 0,
		selfdestructas = "decoycommander",
		sightdistance = 0,
		sonarstealth = true,
		stealth = true,
		usebuildinggrounddecal = false,
		yardmap = "oo",
		customparams = {
			model_author = "Hornet",
			nohealthbars = true,
			subfolder = "other",
			decoration = 1,
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:boomboxboom",
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
				[1] = "tcormove",
			},
			select = {
				[1] = "tcorsel",
			},
		},
	}
}
