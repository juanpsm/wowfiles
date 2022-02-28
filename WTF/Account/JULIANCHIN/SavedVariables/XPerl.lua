
XPerlConfig = nil
XPerlConfig_Global = nil
XPerlConfigNew = {
	["ConfigVersion"] = "3.0.8",
	["global"] = {
		["highlight"] = {
			["enable"] = 1,
			["AGGRO"] = 1,
			["SHIELD"] = 1,
		},
		["highlightSelection"] = 1,
		["bar"] = {
			["fading"] = 1,
			["fat"] = 1,
			["background"] = 1,
			["fadeTime"] = 0.2,
			["texture"] = {
				"Minimalist", -- [1]
				"Interface\\Addons\\Recount\\Textures\\statusbar\\Minimalist", -- [2]
			},
		},
		["rangeFinder"] = {
			["StatsFrame"] = {
				["item"] = "Heavy Netherweave Bandage",
				["spell"] = "Remove Curse",
				["HealthLowPoint"] = 0.85,
				["FadeAmount"] = 0.5,
			},
			["Main"] = {
				["enabled"] = true,
				["spell"] = "Remove Curse",
				["item"] = "Heavy Netherweave Bandage",
				["FadeAmount"] = 0.5,
				["HealthLowPoint"] = 0.85,
			},
			["NameFrame"] = {
				["item"] = "Heavy Netherweave Bandage",
				["spell"] = "Remove Curse",
				["HealthLowPoint"] = 0.85,
				["FadeAmount"] = 0.5,
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
				["big"] = 1,
				["curable"] = 0,
				["size"] = 29,
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
			},
			["hitIndicator"] = 1,
			["level"] = 1,
			["sound"] = 1,
			["size"] = {
				["width"] = 0,
			},
			["threat"] = 1,
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
			["scale"] = 0.77,
			["values"] = 1,
			["buffs"] = {
				["maxrows"] = 2,
				["castable"] = 0,
				["enable"] = 1,
				["wrap"] = 1,
				["rows"] = 3,
				["size"] = 22,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["target"] = {
			["debuffs"] = {
				["enable"] = 1,
				["big"] = 1,
				["curable"] = 0,
				["size"] = 23,
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
			["ownDamageOnly"] = 1,
			["pvpIcon"] = 1,
			["range30yard"] = 1,
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
			["scale"] = 1.17,
			["values"] = 1,
			["buffs"] = {
				["maxrows"] = 2,
				["castable"] = 0,
				["enable"] = 1,
				["wrap"] = 1,
				["rows"] = 3,
				["size"] = 22,
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
			["mana"] = 1,
			["manaPercent"] = 1,
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
				1, -- [10]
			},
			["scale"] = 1.17,
			["healerMode"] = {
				["type"] = 1,
			},
			["spacing"] = 0,
			["anchor"] = "TOP",
			["buffs"] = {
				["castable"] = 0,
				["maxrows"] = 2,
				["right"] = 1,
				["inside"] = 1,
				["size"] = 20,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["raidpet"] = {
			["warlock"] = 1,
			["hunter"] = 1,
		},
		["colour"] = {
			["classic"] = 1,
			["class"] = 1,
			["border"] = {
				["a"] = 1,
				["b"] = 0.4941176470588236,
				["g"] = 0.4941176470588236,
				["r"] = 0.4941176470588236,
			},
			["reaction"] = {
				["tapped"] = {
					["b"] = 0.5,
					["g"] = 0.5,
					["r"] = 0.5,
				},
				["none"] = {
					["b"] = 1,
					["g"] = 0.5,
					["r"] = 0.5,
				},
				["neutral"] = {
					["b"] = 0,
					["g"] = 1,
					["r"] = 1,
				},
				["unfriendly"] = {
					["b"] = 0,
					["g"] = 0.5,
					["r"] = 1,
				},
				["friend"] = {
					["b"] = 0,
					["g"] = 1,
					["r"] = 0,
				},
				["enemy"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 1,
				},
			},
			["classbarBright"] = 1,
			["guildList"] = 1,
			["frame"] = {
				["a"] = 1,
				["b"] = 0,
				["g"] = 0,
				["r"] = 0,
			},
			["gradient"] = {
				["enable"] = 1,
				["s"] = {
					["a"] = 1,
					["b"] = 0.25,
					["g"] = 0.25,
					["r"] = 0.25,
				},
				["e"] = {
					["a"] = 0,
					["b"] = 0.1,
					["g"] = 0.1,
					["r"] = 0.1,
				},
			},
			["bar"] = {
				["rage"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 1,
				},
				["healthFull"] = {
					["b"] = 0,
					["g"] = 1,
					["r"] = 0,
				},
				["focus"] = {
					["b"] = 0.25,
					["g"] = 0.5,
					["r"] = 1,
				},
				["runic_power"] = {
					["b"] = 1,
					["g"] = 0.82,
					["r"] = 0,
				},
				["mana"] = {
					["b"] = 1,
					["g"] = 0,
					["r"] = 0,
				},
				["energy"] = {
					["b"] = 0,
					["g"] = 1,
					["r"] = 1,
				},
				["healthEmpty"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 1,
				},
			},
		},
		["minimap"] = {
			["enable"] = 1,
			["radius"] = 78,
			["pos"] = 163.4760403180188,
		},
		["targettargettarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 23,
			},
			["values"] = 1,
			["pvpIcon"] = 1,
			["scale"] = 0.87,
			["mana"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["buffs"] = {
				["maxrows"] = 2,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["size"] = 22,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["tooltip"] = {
			["enable"] = 1,
			["enableBuffs"] = 1,
			["modifier"] = "all",
		},
		["pet"] = {
			["threat"] = 1,
			["portrait"] = 1,
			["scale"] = 0.79,
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 20,
			},
			["values"] = 1,
			["buffs"] = {
				["enable"] = 1,
				["maxrows"] = 2,
				["above"] = 1,
				["size"] = 18,
			},
			["happiness"] = {
				["enabled"] = 1,
				["flashWhenSad"] = 1,
				["enable"] = 1,
				["onlyWhenSad"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["name"] = 1,
			["hitIndicator"] = 1,
			["castBar"] = {
				["enable"] = 1,
			},
			["level"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["size"] = {
				["enable"] = 1,
				["size"] = 20,
				["width"] = 35,
			},
		},
		["player"] = {
			["partyNumber"] = 1,
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 25,
			},
			["portrait"] = 1,
			["scale"] = 1.17,
			["castBar"] = {
				["castTime"] = 1,
				["inside"] = 1,
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
			["showRunes"] = 1,
			["energyTicker"] = 1,
			["threatMode"] = "portraitFrame",
			["classIcon"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["values"] = 1,
			["buffs"] = {
				["flash"] = 1,
				["maxrows"] = 2,
				["count"] = 40,
				["wrap"] = 1,
				["hideBlizzard"] = 1,
				["rows"] = 2,
				["cooldown"] = 1,
				["size"] = 25,
			},
			["percent"] = 1,
			["repBar"] = 1,
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
				["maxrows"] = 2,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["size"] = 22,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["targettarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 23,
			},
			["values"] = 1,
			["pvpIcon"] = 1,
			["enable"] = 1,
			["mana"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["scale"] = 0.87,
			["buffs"] = {
				["castable"] = 0,
				["maxrows"] = 2,
				["rows"] = 3,
				["wrap"] = 1,
				["size"] = 22,
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
			["scale"] = 0.7,
			["enable"] = 1,
			["buffs"] = {
				["maxrows"] = 2,
				["size"] = 12,
				["castable"] = 0,
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
		["transparency"] = {
			["text"] = 1,
			["frame"] = 1,
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
			["scale"] = 0.67,
			["level"] = 1,
			["buffs"] = {
				["maxrows"] = 2,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["size"] = 22,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["party"] = {
			["debuffs"] = {
				["halfSize"] = 1,
				["below"] = 1,
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 20,
			},
			["portrait"] = 1,
			["scale"] = 1.2,
			["castBar"] = {
				["castTime"] = 1,
			},
			["spacing"] = 25,
			["anchor"] = "TOP",
			["level"] = 1,
			["size"] = {
				["width"] = 0,
			},
			["threat"] = 1,
			["range30yard"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["name"] = 1,
			["values"] = 1,
			["target"] = {
				["size"] = 120,
				["large"] = 1,
			},
			["buffs"] = {
				["castable"] = 0,
				["maxrows"] = 2,
				["wrap"] = 1,
				["rows"] = 2,
				["size"] = 22,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["combatFlash"] = 1,
		["buffs"] = {
			["countdown"] = 1,
			["cooldown"] = 1,
			["countdownStart"] = 20,
		},
		["maximumScale"] = 1.5,
		["optionsColour"] = {
			["b"] = 0.2,
			["g"] = 0.2,
			["r"] = 0.7,
		},
	},
	["savedPositions"] = {
		["WoWArg"] = {
			["Skom"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 498.0000333168132,
					["height"] = 249.999991143632,
					["left"] = 439.4000133970139,
					["width"] = 349.999994798641,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 626.7059066562705,
					["height"] = 123.9999940957546,
					["left"] = 738.5295159200596,
					["width"] = 330.0000012651955,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000500455084,
					["height"] = 80.00000112461817,
					["left"] = 514.4000611229973,
					["width"] = 199.9999893161274,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 424.0000500455084,
					["height"] = 80.00000112461817,
					["left"] = 511.4000117100866,
					["width"] = 205.9999981724955,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 585.3618142264185,
					["left"] = 622.4399274974658,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 639.7059168481227,
					["height"] = 149.9999964855682,
					["left"] = 833.5294132283633,
					["width"] = 139.9999997188455,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 975.4118002158086,
					["left"] = 399.2799678907707,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 585.3618142264185,
					["left"] = 266.7599839652363,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 585.3618142264185,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 1115.371724472534,
					["left"] = 26.90999925966018,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 585.3618142264185,
					["left"] = 711.3600133815669,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 585.3618142264185,
					["left"] = 355.6800066907834,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 1059.101766424277,
					["left"] = 81.37000148827592,
				},
				["XPerl_PetTarget"] = {
					["top"] = 1324.835198011509,
					["left"] = 268.3499994524406,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 585.3618142264185,
					["left"] = 444.6000083634793,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 504.0000241792906,
					["height"] = 239.9999943769092,
					["left"] = 364.4000016588118,
					["width"] = 499.9999822872639,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 585.3618142264185,
					["left"] = 88.92000167269586,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 949.4118053792776,
					["left"] = 0,
				},
				["XPerl_Focus"] = {
					["top"] = 975.4118027418579,
					["left"] = 208.6700049519455,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 585.3618142264185,
					["left"] = 800.2800150542628,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 585.3618142264185,
					["left"] = 533.5199679304726,
				},
				["XPerl_Target"] = {
					["top"] = 1115.371724472534,
					["left"] = 317.0699826955404,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 1118.971832971844,
					["left"] = 513.2999933960678,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 585.3618142264185,
					["left"] = 177.8400033453917,
				},
			},
			["Anetha"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 498.0000333168132,
					["height"] = 249.999991143632,
					["left"] = 439.4000133970139,
					["width"] = 349.999994798641,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 626.7059066562705,
					["height"] = 123.9999940957546,
					["left"] = 738.5295159200596,
					["width"] = 330.0000012651955,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 424.0000500455084,
					["height"] = 80.00000112461817,
					["left"] = 511.4000117100866,
					["width"] = 205.9999981724955,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 585.3618142264185,
					["left"] = 622.4399274974658,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 639.7059168481227,
					["height"] = 149.9999964855682,
					["left"] = 833.5294132283633,
					["width"] = 139.9999997188455,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 975.4118002158086,
					["left"] = 399.2799678907707,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 585.3618142264185,
					["left"] = 266.7599839652363,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 585.3618142264185,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 1115.371724472534,
					["left"] = 26.90999925966018,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 585.3618142264185,
					["left"] = 711.3600133815669,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 585.3618142264185,
					["left"] = 355.6800066907834,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 1059.101766424277,
					["left"] = 81.37000148827592,
				},
				["XPerl_PetTarget"] = {
					["top"] = 1324.835198011509,
					["left"] = 268.3499994524406,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 585.3618142264185,
					["left"] = 444.6000083634793,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 504.0000241792906,
					["height"] = 239.9999943769092,
					["left"] = 364.4000016588118,
					["width"] = 499.9999822872639,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 1118.971832971844,
					["left"] = 513.2999933960678,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 949.4118053792776,
					["left"] = 0,
				},
				["XPerl_Focus"] = {
					["top"] = 975.4118027418579,
					["left"] = 208.6700049519455,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 585.3618142264185,
					["left"] = 533.5199679304726,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 585.3618142264185,
					["left"] = 800.2800150542628,
				},
				["XPerl_Target"] = {
					["top"] = 1115.371724472534,
					["left"] = 317.0699826955404,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 585.3618142264185,
					["left"] = 88.92000167269586,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 585.3618142264185,
					["left"] = 177.8400033453917,
				},
			},
			["Rivothrill"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 497.9999982202534,
					["height"] = 250.0000042440112,
					["left"] = 504.9999991101267,
					["width"] = 350.0000094463475,
				},
				["XPerl_Focus"] = {
					["top"] = 743.5293863409162,
					["left"] = 216.7999878042196,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 423.9999687859821,
					["height"] = 79.9999989047713,
					["left"] = 579.9999986309641,
					["width"] = 199.9999928810135,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 444.4804650560097,
					["height"] = 29.62092888947027,
					["left"] = 604.389602692784,
					["width"] = 205.9999886370023,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 731.1688052283192,
					["left"] = 185.1873654450041,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 526.7647299437937,
					["height"] = 149.9999997264831,
					["left"] = 733.5294511350472,
					["width"] = 139.9999950766962,
				},
				["XPerl_TargetTargetTarget"] = {
					["top"] = 118.818940479437,
					["left"] = 1430.539939559963,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 743.529404611427,
					["left"] = 414.7000350456239,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 997.4025899847385,
					["left"] = 281.8183437436941,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 997.4025899847385,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 323.3762929287269,
					["left"] = 451.9474745117814,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 285.7514181055346,
					["left"] = 1388.424075966852,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 730.8759449404787,
					["left"] = 278.7291638718435,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 997.4025899847385,
					["left"] = 376.2022077601372,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 410.4958977103217,
					["left"] = 448.1621724347463,
				},
				["XPerl_OptionsAnchor"] = {
					["top"] = 749.220753132645,
					["height"] = 539.9999334648566,
					["left"] = 717.318090487932,
					["width"] = 910.8181200933326,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 730.618677305935,
					["left"] = 0,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 503.9999939762421,
					["height"] = 240.0000054761435,
					["left"] = 430.0000346366076,
					["width"] = 500.0000084880224,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 449.7012888309056,
					["height"] = 123.9999969881211,
					["left"] = 340.9999982887052,
					["width"] = 329.9999768632937,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 981.8182222061454,
					["left"] = 0,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 731.1688052283192,
					["left"] = 92.88603044333085,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 731.5311285975938,
					["left"] = 372.843909704431,
				},
				["XPerl_PetTarget"] = {
					["top"] = 521.2590259271848,
					["left"] = 731.7681804471596,
				},
				["XPerl_Target"] = {
					["top"] = 285.714058059893,
					["left"] = 1097.543094110285,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 997.4025899847385,
					["left"] = 94.38389477046388,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 997.4025899847385,
					["left"] = 188.7677485355668,
				},
			},
		},
		["Sin'Dorei"] = {
			["Crobar"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 498.0000006838724,
					["height"] = 250.0000077961453,
					["left"] = 507.6667394078937,
					["width"] = 350.0000179174567,
				},
				["XPerl_Focus"] = {
					["top"] = 883.8378016636199,
					["left"] = 208.6699865637521,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 579.6666458541502,
					["width"] = 205.9999949393443,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 493.7878244230685,
					["left"] = 622.4399877307618,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 593.9189229611593,
					["height"] = 149.9999976748339,
					["left"] = 852.5226013329631,
					["width"] = 140.0000106684094,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 883.8378477212652,
					["left"] = 399.2800038085305,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 493.7878244230685,
					["left"] = 266.7599918155629,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 493.7878244230685,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 1023.797822985358,
					["left"] = 26.90999989309082,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 493.7878244230685,
					["left"] = 711.3600327970883,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 493.7878244230685,
					["left"] = 355.6800163985441,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 967.5278728345148,
					["left"] = 81.37000021118116,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 580.9189310992408,
					["height"] = 124.0000051974302,
					["left"] = 757.5225934684305,
					["width"] = 330.0000088903411,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 493.7878244230685,
					["left"] = 444.6000204981801,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 504.000045409127,
					["height"] = 240.0000032825875,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 493.7878244230685,
					["left"] = 88.92000409963603,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 857.83777307944,
					["left"] = 0,
				},
				["XPerl_PetTarget"] = {
					["top"] = 1208.918755864954,
					["left"] = 268.3500035051156,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 493.7878244230685,
					["left"] = 800.2799549633434,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 493.7878244230685,
					["left"] = 533.5199836311258,
				},
				["XPerl_Target"] = {
					["top"] = 1023.797822985358,
					["left"] = 317.0699962912354,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 1027.39785308798,
					["left"] = 513.3000517197899,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 493.7878244230685,
					["left"] = 177.8400081992721,
				},
			},
			["Skom"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 497.9999619811539,
					["height"] = 250.000011214192,
					["left"] = 508.0000191461815,
					["width"] = 350.0000051968207,
				},
				["XPerl_Focus"] = {
					["top"] = 893.0232263816633,
					["left"] = 208.6699934621333,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 423.9999660839071,
					["height"] = 80.00000218813503,
					["left"] = 582.9999752467224,
					["width"] = 200.0000054703376,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 423.9999660839071,
					["height"] = 80.00000218813503,
					["left"] = 580.0000596266796,
					["width"] = 205.9999767510653,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 622.0116496050699,
					["left"] = 688.8860250892763,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 676.5116937354925,
					["height"] = 149.9999997264831,
					["left"] = 900.1860773617875,
					["width"] = 139.9999950766962,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 893.0232774072355,
					["left"] = 399.2800376960272,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 622.0116496050699,
					["left"] = 266.7600036559205,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 622.0116496050699,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 893.0232717628863,
					["left"] = 26.90999821291024,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 622.0116496050699,
					["left"] = 777.8060877507458,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 622.0116496050699,
					["left"] = 422.126041914299,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 893.0233329759565,
					["left"] = 81.36999994131766,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 663.51158090978,
					["height"] = 124.0000016411013,
					["left"] = 805.1860769515122,
					["width"] = 329.9999958972468,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 622.0116496050699,
					["left"] = 511.0460636138823,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 503.9999682720421,
					["height"] = 240.0000065644051,
					["left"] = 432.9999580151591,
					["width"] = 500.0000224283841,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 882.5833215166857,
					["left"] = 579.2960644909759,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 893.0233000927594,
					["left"] = 0,
				},
				["XPerl_PetTarget"] = {
					["top"] = 1114.609160279484,
					["left"] = 268.3499895827952,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 622.0116496050699,
					["left"] = 599.9660443515793,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 622.0116496050699,
					["left"] = 866.7260684884428,
				},
				["XPerl_Target"] = {
					["top"] = 878.9832575571927,
					["left"] = 383.5160233295843,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 622.0116496050699,
					["left"] = 88.92000121864015,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 622.0116496050699,
					["left"] = 177.8400024372803,
				},
			},
		},
	},
}
XPerlConfigSavePerCharacter = nil
