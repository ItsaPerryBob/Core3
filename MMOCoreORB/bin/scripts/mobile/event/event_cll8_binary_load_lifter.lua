event_cll8_binary_load_lifter = Creature:new {
	objectName = "@mob/creature_names:cll8_binary_load_lifter",
	customName = "a CLL-8 binary load lifter (event)",
	socialGroup = "townsperson",
	pvpFaction = "townsperson",
	faction = "townsperson",
	level = 4,
	chanceHit = 0.24,
	damageMin = 40,
	damageMax = 45,
	baseXp = 0,
	baseHAM = 113,
	baseHAMmax = 138,
	armor = 0,
	resists = {15,15,15,15,15,15,15,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = HERD,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {
		"object/mobile/cll8_binary_load_lifter.iff"
	},		
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(event_cll8_binary_load_lifter, "event_cll8_binary_load_lifter")
