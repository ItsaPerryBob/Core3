dalyrake_harvester = Creature:new {
	objectName = "@mob/creature_names:dalyrake_harvester",
	socialGroup = "dalyrake",
	pvpFaction = "",
	faction = "",
	level = 15,
	chanceHit = 0.31,
	damageMin = 160,
	damageMax = 170,
	baseXp = 831,
	baseHAM = 2400,
	baseHAMmax = 3000,
	armor = 0,
	resists = {10,10,5,-1,-1,-1,5,-1,-1},
	meatType = "meat_insect",
	meatAmount = 25,
	hideType = "hide_scaley",
	hideAmount = 45,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0.25,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK,
	optionsBitmask = 128,
	diet = CARNIVORE,

	templates = {"object/mobile/dalyrake_hue.iff"},
	controlDeviceTemplate = "object/intangible/pet/dalyrake_hue.iff",
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"intimidationattack","intimidationChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(dalyrake_harvester, "dalyrake_harvester")
