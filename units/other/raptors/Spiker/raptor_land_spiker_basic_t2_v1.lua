return {
	raptor_land_spiker_basic_t2_v1 = {
		maxacc = 1.725,
		maxdec = 1.4375,
		energycost = 174,
		metalcost = 174,
		builder = false,
		buildpic = "raptors/raptors1.DDS",
		buildtime = 3750,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = "1",
		capturable = false,
		category = "BOT MOBILE WEAPON ALL NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE RAPTOR EMPABLE",
		collisionvolumeoffsets = "0 -3 0",
		collisionvolumescales = "21 30 46",
		collisionvolumetype = "box",
		defaultmissiontype = "Standby",
		explodeas = "BUG_DEATH",
		floater = false,
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 18,
		idletime = 20,
		leavetracks = true,
		maneuverleashlength = "750",
		mass = 900,
		health = 910,
		maxslope = 18,
		speed = 150.0,
		maxwaterdepth = 0,
		movementclass = "RAPTORSMALLHOVER",
		noautofire = false,
		nochasecategory = "VTOL SPACE",
		objectname = "Raptors/raptors.s3o",
		script = "Raptors/raptors1.cob",
		seismicsignature = 0,
		selfdestructas = "BUG_DEATH",
		side = "THUNDERBIRDS",
		sightdistance = 525,
		smoothanim = true,
		sonardistance = 720,
		trackoffset = 6,
		trackstrength = 3,
		trackstretch = 1,
		tracktype = "RaptorTrack",
		trackwidth = 28,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 1840,
		unitname = "raptor_land_spiker_basic_t2_v1",
		upright = false,
		workertime = 0,
		waterline = 24,
		customparams = {
			maxrange = "375",
			subfolder = "other/raptors",
			model_author = "KDR_11k, Beherith",
			normalmaps = "yes",
			normaltex = "unittextures/chicken_m_normals.png",
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
				areaofeffect = 16,
				cegtag = "sporetrail-large",
				avoidfeature = 0,
				avoidfriendly = 0,
				burnblow = true,
				collidefeature = true,
				collidefriendly = false,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.3,
				explosiongenerator = "custom:raptorspike-huge-sparks-burn",
				firesubmersed = true,
				impulseboost = 0,
				impulsefactor = 0.4,
				interceptedbyshieldtype = 0,
				model = "Raptors/spike.s3o",
				name = "Spike",
				noselfdamage = true,
				range = 525,
				reloadtime = 4,
				soundstart = "smallraptorattack",
				startvelocity = 600,
				texture1 = "",
				texture2 = "sporetrail",
				turret = true,
				waterweapon = false,
				weapontimer = 1,
				weapontype = "MissileLauncher",
				weaponvelocity = 1000,
				damage = {
					default = 325,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL SPACE",
				def = "WEAPON",
				maindir = "0 0 1",
				maxangledif = 180,
				onlytargetcategory = "NOTAIR",
			},
		},
	},
}
