return {
	chicken_turretxl_meteor = {
		acceleration = 0.0115,
		activatewhenbuilt = true,
		autoheal = 1,
		bmcode = "0",
		brakerate = 0.0115,
		buildcostenergy = 6000,
		buildcostmetal = 240,
		builddistance = 500,
		builder = false,
		buildpic = "chickens/chicken_turretxl_meteor.DDS",
		buildtime = 5200,
		canattack = true,
		canreclaim = false,
		canrestore = false,
		canstop = "1",
		capturable = false,
		category = "BOT MOBILE WEAPON ALL NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE CHICKEN EMPABLE",
		collisionvolumeoffsets = "0 -15 0",
		collisionvolumescales = "80 50 80",
		collisionvolumetype = "box",
		--energystorage = 500,
		explodeas = "tentacle_death",
		--extractsmetal = 0.001,
		footprintx = 8,
		footprintz = 8,
		hightrajectory = 1,
		idleautoheal = 15,
		idletime = 300,
		levelground = false,
		mass = 1400,
		maxdamage = 11100,
		maxslope = 255,
		maxvelocity = 0,
		maxwaterdepth = 0,
		movementclass = "NANO",
		noautofire = false,
		nochasecategory = "MOBILE",
		objectname = "Chickens/chicken_turretxl_meteor_v2.s3o",
		--reclaimspeed = 200,
		repairable = false,
		script = "Chickens/chicken_turretxl_v2.cob",
		seismicsignature = 0,
		selfdestructas = "tentacle_death",
		side = "THUNDERBIRDS",
		sightdistance = 500,
		smoothanim = true,
		tedclass = "METAL",
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 1840,
		unitname = "chickend2",
		upright = false,
		waterline = 1,
		workertime = 100,
		customparams = {
			subfolder = "other/chickens",
			model_author = "LathanStanley, Beherith",
			normalmaps = "yes",
			normaltex = "unittextures/chicken_l_normals.png",
			treeshader = "yes",
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:blood_spray",
				[2] = "custom:blood_explode",
				[3] = "custom:dirt",
			},
			pieceexplosiongenerators = {
				[1] = "blood_spray",
				[2] = "blood_spray",
				[3] = "blood_spray",
			},
		},
		weapondefs = {
			weapon = {
				areaofeffect = 1920,
				avoidfriendly = 0,
				cegtag = "nuketrail-roost",
				collidefriendly = 0,
				craterareaofeffect = 1920,
				craterboost = 2.4,
				cratermult = 1.2,
				edgeeffectiveness = 0.5,
				explosiongenerator = "custom:newnukecor",
				firestarter = 70,
				hightrajectory = 1,
				model = "Chickens/greyrock2.s3o",
				name = "METEORLAUNCHER",
				proximitypriority = -6,
				range = 72000,
				reloadtime = 120,
				soundhit = "nukecor",
				soundhitwet = "nukewater",
				soundstart = "bugarty",
				targetable = 1,
				targetborder = 0.75,
				turret = 1,
				weaponvelocity = 1500,
				damage = {
					default = 30000,
				},
			},
			-- cc_laser = {
			-- 	areaofeffect = 64,
			-- 	avoidfeature = false,
			-- 	beamtime = 2.4,
			-- 	cameraShake = 200,
			-- 	corethickness = 0.3,
			-- 	craterareaofeffect = 0,
			-- 	craterboost = 0,
			-- 	cratermult = 0,
			-- 	edgeeffectiveness = 0.55,
			-- 	explosiongenerator = "custom:laserhit-large-yellow",
			-- 	firestarter = 90,
			-- 	impulseboost = 0,
			-- 	impulsefactor = 0,
			-- 	intensity = 1.0,
			-- 	laserflaresize = 5.5,
			-- 	leadLimit = 16,
			-- 	minIntensity = 0.8,
			-- 	name = "HeatRay",
			-- 	noselfdamage = true,
			-- 	range = 400,
			-- 	reloadtime = 5.5,
			-- 	rgbcolor = "0.47 0.21 0",
			-- 	rgbcolor2 = "1 0.88 0.5",
			-- 	soundhitdry = "",
			-- 	soundhitwet = "sizzle",
			-- 	soundstart = "raptorlaser",
			-- 	--soundhitvolume = 6,
			-- 	soundstartvolume = 34,
			-- 	soundtrigger = 1,
			-- 	--sweepFire = true,
			-- 	targetborder = 0.3,
			-- 	targetmoveerror = 0.1,
			-- 	thickness = 4.8,
			-- 	tolerance = 60000,
			-- 	turret = true,
			-- 	weapontype = "BeamLaser",
			-- 	weaponvelocity = 700,
			-- 	damage = {
			-- 		chicken = 0.1,
			-- 		default = 28000,
			-- 	},
			-- },
		},
		weapons = {
			[1] = {
				def = "WEAPON",
			},
			-- [2] = {
			-- 	def = "CC_LASER",
			-- },
		},
	},
}
