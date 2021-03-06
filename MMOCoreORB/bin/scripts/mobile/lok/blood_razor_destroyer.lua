blood_razor_destroyer = Creature:new {
	objectName = "@mob/creature_names:blood_razor_destroyer",
	socialGroup = "bloodrazor",
	pvpFaction = "bloodrazor",
	faction = "bloodrazor",
	level = 38,
	chanceHit = 0.42,
	damageMin = 385,
	damageMax = 480,
	baseXp = 3824,
	baseHAM = 8100,
	baseHAMmax = 9900,
	armor = 0,
	resists = {0,60,0,0,-1,0,0,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_blood_razor_pirate_destroyer_hum_f.iff",
		"object/mobile/dressed_blood_razor_pirate_destroyer_hum_m.iff",
		"object/mobile/dressed_blood_razor_pirate_destroyer_nikto_m.iff",
		"object/mobile/dressed_blood_razor_pirate_destroyer_tran_m.iff"
		},

	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 3800000},
				{group = "tailor_components", chance = 1000000},
				{group = "color_crystals", chance = 400000},
				{group = "crystals_okay", chance = 400000},
				{group = "melee_unarmed", chance = 600000},
				{group = "melee_polearm", chance = 600000},
				{group = "pistols", chance = 600000},
				{group = "clothing_attachments", chance = 300000},
				{group = "armor_attachments", chance = 300000},
				{group = "bloodrazor_common", chance = 2000000}
			},
			lootChance = 3500000
		}
	},
	weapons = {"blood_razer_weapons"},
	conversationTemplate = "",
	attacks = merge(pistoleermaster,pikemanmaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(blood_razor_destroyer, "blood_razor_destroyer")
