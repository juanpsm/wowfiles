
XPerlConfig = nil
XPerlConfig_Global = nil
XPerlConfigNew = {
	["global"] = {
		["highlight"] = {
			["enable"] = 1,
			["HOT"] = 1,
			["AGGRO"] = 1,
			["SHIELD"] = 1,
		},
		["highlightSelection"] = 1,
		["optionsColour"] = {
			["r"] = 0.7,
			["g"] = 0.2,
			["b"] = 0.2,
		},
		["rangeFinder"] = {
			["StatsFrame"] = {
				["spell"] = "Detectar invisibilidad",
				["FadeAmount"] = 0.5,
				["item"] = "Heavy Netherweave Bandage",
				["HealthLowPoint"] = 0.85,
			},
			["Main"] = {
				["enabled"] = true,
				["spell"] = "Detectar invisibilidad",
				["item"] = "Heavy Netherweave Bandage",
				["FadeAmount"] = 0.5,
				["HealthLowPoint"] = 0.85,
			},
			["NameFrame"] = {
				["spell"] = "Detectar invisibilidad",
				["FadeAmount"] = 0.5,
				["item"] = "Heavy Netherweave Bandage",
				["HealthLowPoint"] = 0.85,
			},
		},
		["showAFK"] = 1,
		["ShowTutorials"] = true,
		["buffHelper"] = {
			["enable"] = 1,
			["sort"] = "group",
			["visible"] = 1,
		},
		["focus"] = {
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 29,
				["curable"] = 0,
				["big"] = 1,
			},
			["portrait"] = 1,
			["combo"] = {
				["enable"] = 1,
				["blizzard"] = 1,
				["pos"] = "top",
			},
			["enable"] = 1,
			["mana"] = 1,
			["castBar"] = {
				["enable"] = 1,
			},
			["hitIndicator"] = 1,
			["level"] = 1,
			["sound"] = 1,
			["size"] = {
				["width"] = 0,
			},
			["threat"] = 1,
			["portrait3D"] = 1,
			["pvpIcon"] = 1,
			["mobType"] = 1,
			["highlightDebuffs"] = {
				["who"] = 2,
			},
			["raidIconAlternate"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["elite"] = 1,
			["scale"] = 0.8,
			["values"] = 1,
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["wrap"] = 1,
				["rows"] = 3,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["target"] = {
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 29,
				["curable"] = 0,
				["big"] = 1,
			},
			["portrait"] = 1,
			["combo"] = {
				["enable"] = 1,
				["blizzard"] = 1,
				["pos"] = "top",
			},
			["enable"] = 1,
			["mana"] = 1,
			["castBar"] = {
				["enable"] = 1,
			},
			["hitIndicator"] = 1,
			["level"] = 1,
			["sound"] = 1,
			["size"] = {
				["width"] = 0,
			},
			["threat"] = 1,
			["portrait3D"] = 1,
			["pvpIcon"] = 1,
			["mobType"] = 1,
			["highlightDebuffs"] = {
				["enable"] = 1,
				["who"] = 3,
			},
			["raidIconAlternate"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["elite"] = 1,
			["scale"] = 0.8,
			["values"] = 1,
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["wrap"] = 1,
				["rows"] = 3,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["raid"] = {
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 20,
			},
			["enable"] = 1,
			["class"] = {
				{
					["enable"] = 1,
					["name"] = "WARRIOR",
				}, -- [1]
				{
					["enable"] = 1,
					["name"] = "ROGUE",
				}, -- [2]
				{
					["enable"] = 1,
					["name"] = "HUNTER",
				}, -- [3]
				{
					["enable"] = 1,
					["name"] = "MAGE",
				}, -- [4]
				{
					["enable"] = 1,
					["name"] = "WARLOCK",
				}, -- [5]
				{
					["enable"] = 1,
					["name"] = "PRIEST",
				}, -- [6]
				{
					["enable"] = 1,
					["name"] = "DRUID",
				}, -- [7]
				{
					["enable"] = 1,
					["name"] = "SHAMAN",
				}, -- [8]
				{
					["enable"] = 1,
					["name"] = "PALADIN",
				}, -- [9]
				{
					["enable"] = 1,
					["name"] = "DEATHKNIGHT",
				}, -- [10]
			},
			["group"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
				1, -- [5]
				1, -- [6]
				1, -- [7]
				1, -- [8]
				1, -- [9]
			},
			["titles"] = 1,
			["scale"] = 0.8,
			["healerMode"] = {
				["type"] = 1,
			},
			["spacing"] = 0,
			["anchor"] = "TOP",
			["buffs"] = {
				["castable"] = 0,
				["inside"] = 1,
				["right"] = 1,
				["size"] = 20,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["raidpet"] = {
			["enable"] = 1,
			["hunter"] = 1,
			["warlock"] = 1,
		},
		["colour"] = {
			["class"] = 1,
			["guildList"] = 1,
			["reaction"] = {
				["tapped"] = {
					["r"] = 0.5,
					["g"] = 0.5,
					["b"] = 0.5,
				},
				["enemy"] = {
					["r"] = 1,
					["g"] = 0,
					["b"] = 0,
				},
				["neutral"] = {
					["r"] = 1,
					["g"] = 1,
					["b"] = 0,
				},
				["unfriendly"] = {
					["r"] = 1,
					["g"] = 0.5,
					["b"] = 0,
				},
				["friend"] = {
					["r"] = 0,
					["g"] = 1,
					["b"] = 0,
				},
				["none"] = {
					["r"] = 0.5,
					["g"] = 0.5,
					["b"] = 1,
				},
			},
			["frame"] = {
				["a"] = 1,
				["r"] = 0,
				["g"] = 0,
				["b"] = 0,
			},
			["classic"] = 1,
			["gradient"] = {
				["enable"] = 1,
				["s"] = {
					["a"] = 1,
					["r"] = 0.25,
					["g"] = 0.25,
					["b"] = 0.25,
				},
				["e"] = {
					["a"] = 0,
					["r"] = 0.1,
					["g"] = 0.1,
					["b"] = 0.1,
				},
			},
			["border"] = {
				["a"] = 1,
				["r"] = 0.5,
				["g"] = 0.5,
				["b"] = 0.5,
			},
			["bar"] = {
				["rage"] = {
					["r"] = 1,
					["g"] = 0,
					["b"] = 0,
				},
				["healthFull"] = {
					["r"] = 0,
					["g"] = 1,
					["b"] = 0,
				},
				["focus"] = {
					["r"] = 1,
					["g"] = 0.5,
					["b"] = 0.25,
				},
				["energy"] = {
					["r"] = 1,
					["g"] = 1,
					["b"] = 0,
				},
				["mana"] = {
					["r"] = 0,
					["g"] = 0,
					["b"] = 1,
				},
				["healthEmpty"] = {
					["r"] = 1,
					["g"] = 0,
					["b"] = 0,
				},
				["runic_power"] = {
					["r"] = 0,
					["g"] = 0.82,
					["b"] = 1,
				},
			},
		},
		["targettarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 29,
			},
			["values"] = 1,
			["pvpIcon"] = 1,
			["enable"] = 1,
			["mana"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["scale"] = 0.7,
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["minimap"] = {
			["enable"] = 1,
			["radius"] = 78,
			["pos"] = 186,
		},
		["combatFlash"] = 1,
		["party"] = {
			["debuffs"] = {
				["halfSize"] = 1,
				["below"] = 1,
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 32,
			},
			["portrait"] = 1,
			["scale"] = 0.8,
			["castBar"] = {
				["enable"] = 1,
				["castTime"] = 1,
			},
			["spacing"] = 23,
			["anchor"] = "TOP",
			["level"] = 1,
			["size"] = {
				["width"] = 0,
			},
			["threat"] = 1,
			["portrait3D"] = 1,
			["pvpIcon"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["values"] = 1,
			["inRaid"] = 1,
			["threatMode"] = "portraitFrame",
			["name"] = 1,
			["target"] = {
				["enable"] = 1,
				["large"] = 1,
				["size"] = 120,
			},
			["hitIndicator"] = 1,
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["wrap"] = 1,
				["rows"] = 2,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["transparency"] = {
			["frame"] = 1,
			["text"] = 1,
		},
		["focustarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 29,
			},
			["values"] = 1,
			["pvpIcon"] = 1,
			["enable"] = 1,
			["mana"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["scale"] = 0.7,
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["pettarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 29,
			},
			["values"] = 1,
			["pvpIcon"] = 1,
			["enable"] = 1,
			["mana"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["scale"] = 0.7,
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["partypet"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 12,
			},
			["name"] = 1,
			["enable"] = 1,
			["scale"] = 0.7,
			["buffs"] = {
				["enable"] = 1,
				["castable"] = 0,
				["size"] = 12,
				["maxrows"] = 2,
			},
			["healerMode"] = {
				["type"] = 1,
			},
			["size"] = {
				["width"] = 0,
			},
		},
		["highlightDebuffs"] = {
			["enable"] = 1,
			["frame"] = 1,
			["border"] = 1,
			["class"] = 1,
		},
		["player"] = {
			["partyNumber"] = 1,
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 25,
			},
			["portrait"] = 1,
			["scale"] = 0.9,
			["castBar"] = {
				["enable"] = 1,
			},
			["fullScreen"] = {
				["enable"] = 1,
				["highHP"] = 40,
				["lowHP"] = 30,
			},
			["hitIndicator"] = 1,
			["dockRunes"] = 1,
			["level"] = 1,
			["size"] = {
				["width"] = 0,
			},
			["threat"] = 1,
			["portrait3D"] = 1,
			["pvpIcon"] = 1,
			["showRunes"] = 1,
			["threatMode"] = "portraitFrame",
			["classIcon"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["values"] = 1,
			["buffs"] = {
				["enable"] = 1,
				["wrap"] = 1,
				["flash"] = 1,
				["count"] = 40,
				["size"] = 25,
				["rows"] = 2,
				["hideBlizzard"] = 1,
				["cooldown"] = 1,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["energyTicker"] = 1,
		},
		["tooltip"] = {
			["enable"] = 1,
			["enableBuffs"] = 1,
			["modifier"] = "all",
		},
		["pet"] = {
			["threat"] = 1,
			["portrait"] = 1,
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 20,
			},
			["scale"] = 0.7,
			["happiness"] = {
				["enabled"] = 1,
				["flashWhenSad"] = 1,
				["onlyWhenSad"] = 1,
			},
			["level"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["castBar"] = {
				["enable"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["name"] = 1,
			["hitIndicator"] = 1,
			["values"] = 1,
			["buffs"] = {
				["enable"] = 1,
				["size"] = 18,
				["maxrows"] = 2,
			},
			["portrait3D"] = 1,
			["size"] = {
				["enable"] = 1,
				["width"] = 0,
				["size"] = 20,
			},
		},
		["targettargettarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 29,
			},
			["values"] = 1,
			["pvpIcon"] = 1,
			["scale"] = 0.7,
			["mana"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["buffs"] = {
			["countdown"] = 1,
			["cooldown"] = 1,
			["countdownStart"] = 20,
		},
		["maximumScale"] = 1.5,
		["bar"] = {
			["texture"] = {
				"Perl v2", -- [1]
				"Interface\\Addons\\XPerl\\Images\\XPerl_StatusBar", -- [2]
			},
			["background"] = 1,
			["fadeTime"] = 0.5,
			["fat"] = 1,
		},
	},
	["savedPositions"] = {
		["WoWArg"] = {
			["Jaimitico"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 497.9999982202534,
					["height"] = 250.0000042440112,
					["left"] = 504.9999991101267,
					["width"] = 350.0000094463475,
				},
				["XPerl_Focus"] = {
					["top"] = 765.3012171890663,
					["left"] = 216.8000087614768,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 423.9999687859821,
					["height"] = 79.9999989047713,
					["left"] = 576.9999832293106,
					["width"] = 206.0000061606614,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 553.3012751985439,
					["left"] = 425.6000043705225,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 537.6506416226197,
					["height"] = 149.9999990416749,
					["left"] = 749.2771092205182,
					["width"] = 140.0000002738072,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 765.3011857427242,
					["left"] = 414.7000015968528,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 553.3012751985439,
					["left"] = 182.4000138893047,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 553.3012751985439,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 914.5011905126753,
					["left"] = 20.70000123822903,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 553.3012751985439,
					["left"] = 486.4000370381458,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 553.3012751985439,
					["left"] = 243.2000185190729,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 863.0012545774042,
					["left"] = 72.10000092837578,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 524.6506099294392,
					["height"] = 123.9999969881211,
					["left"] = 654.2771472112637,
					["width"] = 329.9999768632937,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 553.3012751985439,
					["left"] = 304.0000231488411,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 503.9999939762421,
					["height"] = 240.0000054761435,
					["left"] = 430.0000346366076,
					["width"] = 500.0000084880224,
				},
				["XPerl_PetTarget"] = {
					["top"] = 1218.858905531395,
					["left"] = 233.4999786436086,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 805.3012549133661,
					["left"] = 0,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 916.9012114452722,
					["left"] = 412.9999543461507,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 553.3012751985439,
					["left"] = 364.8000277786094,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 553.3012751985439,
					["left"] = 547.2000697057691,
				},
				["XPerl_Target"] = {
					["top"] = 915.7012625822123,
					["left"] = 216.8000087614768,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 553.3012751985439,
					["left"] = 60.80000462976823,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 553.3012751985439,
					["left"] = 121.6000092595365,
				},
			},
			["Asasasdasda"] = {
				["XPerl_Focus"] = {
					["top"] = 674.7826282553771,
					["left"] = 216.8000087614768,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 462.7826301891444,
					["left"] = 425.6000043705225,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 674.7826487656342,
					["left"] = 414.7000015968528,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 462.7826301891444,
					["left"] = 182.4000138893047,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 462.7826301891444,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 823.9826123352054,
					["left"] = 20.69999926681743,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 462.7826301891444,
					["left"] = 486.4000370381458,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 462.7826301891444,
					["left"] = 243.2000185190729,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 772.4826685340694,
					["left"] = 72.10000092837578,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 462.7826301891444,
					["left"] = 303.9999951109861,
				},
				["XPerl_PetTarget"] = {
					["top"] = 1089.546681811984,
					["left"] = 233.5000277098534,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 714.7826099039668,
					["left"] = 0,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 462.7826301891444,
					["left"] = 60.80000462976823,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 462.7826301891444,
					["left"] = 364.8000277786094,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 462.7826301891444,
					["left"] = 547.200013630059,
				},
				["XPerl_Target"] = {
					["top"] = 825.1826175728129,
					["left"] = 216.8000087614768,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 826.3826254019376,
					["left"] = 413.0000034123954,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 462.7826301891444,
					["left"] = 121.6000092595365,
				},
			},
		},
	},
	["ConfigVersion"] = "3.0.8",
}
XPerlConfigSavePerCharacter = nil
