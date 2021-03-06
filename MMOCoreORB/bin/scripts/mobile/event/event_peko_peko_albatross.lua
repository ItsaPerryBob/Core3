event_peko_peko_albatross = Creature:new {
	objectName = "@mob/creature_names:peko_peko_albatross",
	customName = "a peko peko albatross (event)",
	socialGroup = "peko",
	pvpFaction = "",
	faction = "",
	level = 155,
	chanceHit = 77.5,
	damageMin = 945,
	damageMax = 1600,
	baseXp = 0,
	baseHAM = 74000,
	baseHAMmax = 91000,
	armor = 2,
	resists = {100,80,30,80,80,90,25,25,-1},
	meatType = "meat_avian",
	meatAmount = 0,
	hideType = "hide_wooly",
	hideAmount = 0,
	boneType = "bone_avian",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 8,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + HERD + KILLER,
	optionsBitmask = 128,
	diet = CARNIVORE,
	scale = 2.0,

	templates = {"object/mobile/peko_peko_hue.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareacombo",""},
		{"creatureareaknockdown","knockdownChance=30"}
	}
}

CreatureTemplates:addCreatureTemplate(event_peko_peko_albatross, "event_peko_peko_albatross")
