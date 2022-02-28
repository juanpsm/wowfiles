
SCT_CONFIG = {
	["profileKeys"] = {
		["Gilraenloss - WoWArg"] = "Gilraenloss - WoWArg",
	},
	["profiles"] = {
		["Gilraenloss - WoWArg"] = {
			["SHOWBLOCK"] = false,
			["CRITS"] = {
				["SHOWPARRY"] = false,
				["SHOWRUNES"] = false,
			},
			["SHOWABSORB"] = false,
			["SHOWREP"] = false,
			["SHOWHEAL"] = false,
			["SHOWDEBUFF"] = false,
			["SHOWBUFF"] = false,
			["SHOWPARRY"] = false,
			["SHOWSKILL"] = false,
			["SHOWSPELL"] = false,
			["SHOWDISPEL"] = false,
			["SHOWTARGETS"] = false,
			["SHOWDODGE"] = false,
			["SHOWPOWER"] = false,
			["SHOWOVERHEAL"] = false,
			["SHOWRESIST"] = false,
			["SHOWHIT"] = false,
			["SHOWHONOR"] = false,
			["SHOWSELFHEAL"] = false,
			["SHOWRUNES"] = false,
		},
	},
}
SCT_EVENT_CONFIG = {
	["profileKeys"] = {
		["Gilraenloss - WoWArg"] = "Global",
	},
	["global"] = {
		["events"] = {
			{
				["type"] = "BUFF",
				["r"] = 1,
				["class"] = {
					"Mage", -- [1]
					"Shaman", -- [2]
					"Druid", -- [3]
					"Priest", -- [4]
				},
				["g"] = 1,
				["soundwave"] = "Sound\\Spells\\Clearcasting_Impact_Chest.wav",
				["search"] = "Clearcast",
				["name"] = "Clearcast",
				["b"] = 0,
				["target"] = "SELF",
				["display"] = "Clearcast!",
				["icon"] = 1,
				["iscrit"] = 1,
			}, -- [1]
			{
				["type"] = "BUFF",
				["r"] = 0.5,
				["class"] = {
					"Warrior", -- [1]
					"Shaman", -- [2]
				},
				["g"] = 0,
				["name"] = "Flurry",
				["display"] = "Flurry!",
				["b"] = 0,
				["search"] = "Flurry",
				["target"] = "SELF",
			}, -- [2]
			{
				["type"] = "FADE",
				["r"] = 0,
				["class"] = {
					"Shaman", -- [1]
				},
				["g"] = 0,
				["name"] = "Lightning Shield",
				["display"] = "Lightning Shield!",
				["b"] = 1,
				["search"] = "Lightning Shield",
				["target"] = "SELF",
			}, -- [3]
			{
				["type"] = "BUFF",
				["r"] = 0,
				["class"] = {
					"Warlock", -- [1]
				},
				["g"] = 0.5,
				["name"] = "Nightfall",
				["display"] = "Nightfall!",
				["b"] = 0.5,
				["search"] = "Shadow Trance",
				["target"] = "SELF",
			}, -- [4]
			{
				["type"] = "MISS",
				["source"] = "SELF",
				["r"] = 1,
				["class"] = {
					"Warrior", -- [1]
				},
				["g"] = 1,
				["iscrit"] = 1,
				["name"] = "Overpower",
				["display"] = "Overpower!",
				["target"] = "TARGET",
				["override"] = false,
				["misstype"] = "DODGE",
				["b"] = 0,
			}, -- [5]
			{
				["type"] = "BUFF",
				["r"] = 0.5,
				["class"] = {
					"Warrior", -- [1]
				},
				["g"] = 1,
				["name"] = "Enraged",
				["iscrit"] = 1,
				["target"] = "SELF",
				["b"] = 0.5,
				["search"] = "Enrage",
				["display"] = "Enraged!",
			}, -- [6]
			{
				["type"] = "BUFF",
				["r"] = 0.5,
				["class"] = {
					"Warrior", -- [1]
					"Rogue", -- [2]
					"Paladin", -- [3]
					"Shaman", -- [4]
					"Hunter", -- [5]
				},
				["g"] = 0.5,
				["override"] = true,
				["name"] = "Crusader",
				["iscrit"] = 1,
				["target"] = "SELF",
				["b"] = 1,
				["display"] = "Crusader!",
				["search"] = "Holy Strength",
			}, -- [7]
			{
				["type"] = "BUFF",
				["r"] = 0.5,
				["class"] = {
					"Priest", -- [1]
				},
				["g"] = 0.5,
				["name"] = "Spirit Tap",
				["iscrit"] = 1,
				["target"] = "SELF",
				["b"] = 0.5859375,
				["search"] = "Spirit Tap",
				["display"] = "Spirit Tap!",
			}, -- [8]
			{
				["type"] = "SUMMON",
				["source"] = "SELF",
				["r"] = 0.80078125,
				["class"] = {
					"Shaman", -- [1]
				},
				["g"] = 0.80078125,
				["name"] = "Totems",
				["b"] = 0,
				["target"] = "ANY",
				["search"] = "Totem",
				["icon"] = 1,
				["display"] = "[*1]",
			}, -- [9]
			{
				["type"] = "BUFF",
				["source"] = "SELF",
				["r"] = 1,
				["class"] = {
					"Rogue", -- [1]
					"Warrior", -- [2]
				},
				["g"] = 1,
				["name"] = "Mace Stun",
				["iscrit"] = 1,
				["target"] = "TARGET",
				["b"] = 0,
				["search"] = "Mace Stun",
				["display"] = "Mace Stun!",
			}, -- [10]
			{
				["type"] = "BUFF",
				["source"] = "SELF",
				["r"] = 0,
				["class"] = {
					"Warrior", -- [1]
				},
				["g"] = 0.5,
				["name"] = "Rooted",
				["iscrit"] = 1,
				["target"] = "TARGET",
				["b"] = 0,
				["search"] = "Improved Hamstring",
				["display"] = "Rooted!",
			}, -- [11]
			{
				["type"] = "BUFF",
				["r"] = 0,
				["class"] = {
					"Warrior", -- [1]
				},
				["g"] = 1,
				["iscrit"] = 1,
				["name"] = "Full Sunder",
				["b"] = 0,
				["target"] = "TARGET",
				["buffcount"] = 5,
				["display"] = "Full Sunder!",
				["search"] = "Sunder Armor",
			}, -- [12]
			{
				["type"] = "BUFF",
				["source"] = "SELF",
				["r"] = 1,
				["class"] = {
					"Rogue", -- [1]
				},
				["g"] = 0,
				["iscrit"] = 1,
				["name"] = "Envenom",
				["b"] = 1,
				["target"] = "TARGET",
				["buffcount"] = 5,
				["display"] = "Envenom!",
				["search"] = "Deadly",
			}, -- [13]
			{
				["type"] = "BUFF",
				["source"] = "SELF",
				["r"] = 0.29296875,
				["class"] = {
					"Mage", -- [1]
				},
				["g"] = 0.5859375,
				["iscrit"] = 1,
				["name"] = "Frostbite",
				["display"] = "Frostbite!",
				["target"] = "TARGET",
				["search"] = "Frostbite",
				["icon"] = 1,
				["b"] = 0.87890625,
			}, -- [14]
			{
				["type"] = "MISS",
				["source"] = "SELF",
				["r"] = 0.5,
				["class"] = {
					"Warrior", -- [1]
				},
				["g"] = 0,
				["name"] = "Deep Wound Spam",
				["display"] = "",
				["b"] = 0,
				["search"] = "Deep Wound",
				["target"] = "TARGET",
			}, -- [15]
			{
				["type"] = "BUFF",
				["source"] = "SELF",
				["r"] = 0.5,
				["class"] = {
					"Priest", -- [1]
				},
				["g"] = 0.5,
				["name"] = "Blackout",
				["iscrit"] = 1,
				["target"] = "TARGET",
				["b"] = 0.5859375,
				["search"] = "Blackout",
				["display"] = "Blackout!",
			}, -- [16]
			{
				["type"] = "BUFF",
				["source"] = "SELF",
				["r"] = 0.5,
				["class"] = {
					"Mage", -- [1]
				},
				["g"] = 0.25,
				["name"] = "Impact",
				["iscrit"] = 1,
				["target"] = "TARGET",
				["b"] = 0.25,
				["search"] = "Impact",
				["display"] = "Impact!",
			}, -- [17]
			{
				["type"] = "MISS",
				["source"] = "SELF",
				["r"] = 0.99609375,
				["class"] = {
					"Rogue", -- [1]
				},
				["g"] = 0.59765625,
				["name"] = "Feint",
				["iscrit"] = 1,
				["target"] = "TARGET",
				["b"] = 0.19921875,
				["search"] = "Feint",
				["display"] = "Feint Failed!",
			}, -- [18]
			{
				["type"] = "FADE",
				["r"] = 0.80078125,
				["class"] = {
					"Mage", -- [1]
				},
				["g"] = 0.80078125,
				["name"] = "Sheep",
				["iscrit"] = 1,
				["target"] = "FOCUS",
				["b"] = 1,
				["search"] = "Polymorph",
				["display"] = "Sheep Broke!",
			}, -- [19]
			{
				["type"] = "FADE",
				["r"] = 0.80078125,
				["class"] = {
					"Mage", -- [1]
				},
				["g"] = 0.80078125,
				["name"] = "Slow",
				["iscrit"] = 1,
				["target"] = "ENEMY",
				["b"] = 0,
				["search"] = "Slow",
				["display"] = "Slow Removed!",
			}, -- [20]
		},
		["firstload"] = true,
	},
}
