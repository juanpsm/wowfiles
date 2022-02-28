
XPerlConfig = nil
XPerlConfig_Global = nil
XPerlConfigNew = {
	["global"] = {
		["highlight"] = {
			["enable"] = 1,
			["AGGRO"] = 1,
		},
		["highlightSelection"] = 1,
		["optionsColour"] = {
			["r"] = 0.7,
			["g"] = 0.2,
			["b"] = 0.2,
		},
		["rangeFinder"] = {
			["StatsFrame"] = {
				["spell"] = "Holy Light",
				["FadeAmount"] = 0.5,
				["item"] = "Heavy Netherweave Bandage",
				["HealthLowPoint"] = 0.85,
			},
			["Main"] = {
				["enabled"] = true,
				["spell"] = "Holy Light",
				["item"] = "Heavy Netherweave Bandage",
				["FadeAmount"] = 0.5,
				["HealthLowPoint"] = 0.85,
			},
			["NameFrame"] = {
				["spell"] = "Holy Light",
				["FadeAmount"] = 0.5,
				["item"] = "Heavy Netherweave Bandage",
				["HealthLowPoint"] = 0.85,
			},
		},
		["showAFK"] = 1,
		["combatFlash"] = 1,
		["buffHelper"] = {
			["enable"] = 1,
			["sort"] = "group",
			["visible"] = 1,
		},
		["raidpet"] = {
			["hunter"] = 1,
			["warlock"] = 1,
		},
		["target"] = {
			["debuffs"] = {
				["enable"] = 1,
				["onlyMine"] = 1,
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
			["scale"] = 1.13,
			["values"] = 1,
			["buffs"] = {
				["size"] = 22,
				["above"] = 1,
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
			["scale"] = 1.13,
			["healerMode"] = {
				["type"] = 1,
			},
			["spacing"] = 1,
			["anchor"] = "LEFT",
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
		["targettargettarget"] = {
			["scale"] = 0.8100000000000001,
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 29,
			},
			["values"] = 1,
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
		["colour"] = {
			["classic"] = 1,
			["guildList"] = 1,
			["border"] = {
				["a"] = 1,
				["r"] = 0.5,
				["g"] = 0.5,
				["b"] = 0.5,
			},
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
			["class"] = 1,
			["classbarBright"] = 1,
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
			["frame"] = {
				["a"] = 1,
				["r"] = 0,
				["g"] = 0,
				["b"] = 0,
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
		["minimap"] = {
			["enable"] = 1,
			["radius"] = 78,
			["pos"] = 153.5620056499828,
		},
		["xperlOldroleicons"] = 1,
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
			["scale"] = 0.89,
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
		["party"] = {
			["debuffs"] = {
				["halfSize"] = 1,
				["below"] = 1,
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 32,
			},
			["portrait"] = 1,
			["scale"] = 1.25,
			["castBar"] = {
				["castTime"] = 1,
			},
			["spacing"] = 39,
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
			["values"] = 1,
			["threatMode"] = "portraitFrame",
			["name"] = 1,
			["target"] = {
				["large"] = 1,
				["size"] = 120,
			},
			["hitIndicator"] = 1,
			["buffs"] = {
				["castable"] = 0,
				["size"] = 22,
				["wrap"] = 1,
				["rows"] = 2,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["targettarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 29,
			},
			["values"] = 1,
			["enable"] = 1,
			["mana"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["scale"] = 0.8100000000000001,
			["buffs"] = {
				["castable"] = 0,
				["size"] = 22,
				["rows"] = 3,
				["wrap"] = 1,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["focustarget"] = {
			["healerMode"] = {
				["type"] = 1,
			},
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 29,
			},
			["values"] = 1,
			["mana"] = 1,
			["scale"] = 0.7,
			["buffs"] = {
				["castable"] = 0,
				["size"] = 22,
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
			["scale"] = 0.69,
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 29,
			},
			["values"] = 1,
			["buffs"] = {
				["above"] = 1,
				["castable"] = 0,
				["size"] = 22,
				["rows"] = 3,
				["wrap"] = 1,
				["maxrows"] = 2,
			},
			["healerMode"] = {
				["type"] = 1,
			},
			["mana"] = 1,
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
		["transparency"] = {
			["frame"] = 1,
			["text"] = 1,
		},
		["player"] = {
			["partyNumber"] = 1,
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 25,
			},
			["values"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["scale"] = 1.18,
			["threat"] = 1,
			["portrait"] = 1,
			["showRunes"] = 1,
			["castBar"] = {
				["castTime"] = 1,
				["precast"] = 1,
				["enable"] = 1,
				["inside"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["fullScreen"] = {
				["enable"] = 1,
				["highHP"] = 40,
				["lowHP"] = 30,
			},
			["hitIndicator"] = 1,
			["dockRunes"] = 1,
			["buffs"] = {
				["above"] = 1,
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
		["tooltip"] = {
			["enable"] = 1,
			["enableBuffs"] = 1,
			["modifier"] = "all",
		},
		["pet"] = {
			["xpBar"] = 1,
			["threat"] = 1,
			["portrait"] = 1,
			["scale"] = 1.06,
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 26,
			},
			["healerMode"] = {
				["type"] = 1,
			},
			["castBar"] = {
				["enable"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["name"] = 1,
			["hitIndicator"] = 1,
			["buffs"] = {
				["enable"] = 1,
				["wrap"] = 1,
				["size"] = 21,
				["maxrows"] = 2,
			},
			["level"] = 1,
			["values"] = 1,
			["size"] = {
				["enable"] = 1,
				["width"] = 44,
				["size"] = 20,
			},
		},
		["buffs"] = {
			["countdown"] = 1,
			["cooldown"] = 1,
			["countdownStart"] = 20,
		},
		["maximumScale"] = 1.5,
		["bar"] = {
			["fadeTime"] = 0.5,
			["texture"] = {
				"Minimalist", -- [1]
				"Interface\\Addons\\Recount\\Textures\\statusbar\\Minimalist", -- [2]
			},
			["fat"] = 1,
		},
	},
	["savedPositions"] = {
		["WoWArg"] = {
			["Skombrow"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 497.9999619811539,
					["height"] = 250.000011214192,
					["left"] = 508.0000191461815,
					["width"] = 350.0000051968207,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 567.6184012856387,
					["height"] = 124.0000016411013,
					["left"] = 33.70785908355708,
					["width"] = 330.0000309074073,
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
					["top"] = 862.9213710439307,
					["left"] = 355.8208180593211,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 506.460657400553,
					["height"] = 149.9999997264831,
					["left"] = 697.4157704088379,
					["width"] = 139.9999950766962,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 702.9214041840679,
					["left"] = 414.6999959399009,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 862.9213710439307,
					["left"] = 153.5903739462394,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 862.92134716743,
					["left"] = 1.917603170721973,
				},
				["XPerl_Player"] = {
					["top"] = 102.5765517713827,
					["left"] = 12.7527872573008,
				},
				["XPerl_OptionsAnchor"] = {
					["top"] = 806.9287740746164,
					["height"] = 540.0000686607884,
					["left"] = 667.1178579530017,
					["width"] = 855.6668824739986,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 862.9213094786354,
					["left"] = 367.4117295719359,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 862.9213710439307,
					["left"] = 205.1067792149247,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 139.0483993162334,
					["left"] = 16.48949303881231,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 121.9967651481785,
					["left"] = 413.9587649370781,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 862.9213710439307,
					["left"] = 254.7057136507135,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 503.9999682720421,
					["height"] = 240.0000065644051,
					["left"] = 432.9999580151591,
					["width"] = 500.0000224283841,
				},
				["XPerl_PetTarget"] = {
					["top"] = 188.7497248334955,
					["left"] = 148.5776245980259,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 601.0187187334944,
					["left"] = 0.958800819423893,
				},
				["XPerl_Focus"] = {
					["top"] = 702.9213846119731,
					["left"] = 216.8000086468412,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 862.9213710439307,
					["left"] = 305.2631538093667,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 862.9213447835479,
					["left"] = 363.006163401409,
				},
				["XPerl_Target"] = {
					["top"] = 118.8795433799836,
					["left"] = 217.758811326398,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 862.92134716743,
					["left"] = 66.55281501377908,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 862.9213710439307,
					["left"] = 103.9916075789267,
				},
			},
			["Doroteo"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 497.9999982202534,
					["height"] = 250.0000042440112,
					["left"] = 504.9999991101267,
					["width"] = 350.0000094463475,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 531.1039077006967,
					["height"] = 123.9999794644619,
					["left"] = 455.519564241358,
					["width"] = 329.9999418159754,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 423.9999687859821,
					["height"] = 79.9999989047713,
					["left"] = 579.9999986309641,
					["width"] = 199.9999928810135,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 423.9999687859821,
					["height"] = 79.9999989047713,
					["left"] = 576.9999832293106,
					["width"] = 206.0000061606614,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 552.1827799272775,
					["left"] = 0,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 573.701259533538,
					["height"] = 149.9999990416749,
					["left"] = 813.1169210711802,
					["width"] = 140.0000002738072,
				},
				["XPerl_TargetTargetTarget"] = {
					["top"] = 153.7377438570907,
					["left"] = 1423.063980834631,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 837.4026095922001,
					["left"] = 414.7000506630977,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 796.2626854578732,
					["left"] = 0,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 981.2235148619376,
					["left"] = 0,
				},
				["XPerl_OptionsAnchor"] = {
					["top"] = 768.7012442687881,
					["height"] = 539.9999334648566,
					["left"] = 427.7077998286104,
					["width"] = 910.8181200933326,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 918.3025986197016,
					["left"] = 0,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 491.1628233463633,
					["left"] = 0,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 735.2427684804287,
					["left"] = 0,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 141.886371941131,
					["left"] = 1020.678230165592,
				},
				["XPerl_PetTarget"] = {
					["top"] = 309.6979068226603,
					["left"] = 609.7961239786855,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 674.2227722960449,
					["left"] = 0,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 503.9999939762421,
					["height"] = 240.0000054761435,
					["left"] = 430.0000346366076,
					["width"] = 500.0000084880224,
				},
				["XPerl_Focus"] = {
					["top"] = 837.402580255643,
					["left"] = 216.8000087614768,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 979.6629704519543,
					["left"] = 5.194807640780994,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 613.2028157151308,
					["left"] = 0,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 430.1428271619797,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 259.3301716926587,
					["left"] = 555.7652523759182,
				},
				["XPerl_Target"] = {
					["top"] = 258.770000687105,
					["left"] = 900.066943446992,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 219.985269438198,
					["left"] = 1204.566149766402,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 857.282681642257,
					["left"] = 0,
				},
			},
		},
		["Sin'Dorei"] = {
			["Draenoric"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 498.0000006838724,
					["height"] = 250.0000077961453,
					["left"] = 507.6667394078937,
					["width"] = 350.0000179174567,
				},
				["XPerl_Focus"] = {
					["top"] = 859.837888540625,
					["left"] = 241.1900021489135,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 579.6666458541502,
					["width"] = 205.9999949393443,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 512.3877965968859,
					["left"] = 601.160007663867,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 593.9189229611593,
					["height"] = 149.9999976748339,
					["left"] = 852.5226013329631,
					["width"] = 140.0000106684094,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 512.3877965968859,
					["left"] = 257.6400004583629,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 512.3877965968859,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 1023.677747613006,
					["left"] = 27.13999968126832,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 512.3877965968859,
					["left"] = 687.0400539771292,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 512.3877965968859,
					["left"] = 343.5200269885646,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 943.4978391894987,
					["left"] = 109.1799914241453,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 512.3877965968859,
					["left"] = 429.4000337357057,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 504.000045409127,
					["height"] = 240.0000032825875,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 667.405255053287,
					["height"] = 123.9999964438636,
					["left"] = 849.7746116613511,
					["width"] = 329.9998688332747,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 850.337833646809,
					["left"] = 0,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 1028.117864253585,
					["left"] = 477.9000469402615,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 512.3877965968859,
					["left"] = 515.2800009167258,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 512.3877965968859,
					["left"] = 772.9199815920281,
				},
				["XPerl_Target"] = {
					["top"] = 1024.27785139039,
					["left"] = 306.2299865751912,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 512.3877965968859,
					["left"] = 85.88000674714115,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 512.3877965968859,
					["left"] = 171.7600134942823,
				},
			},
		},
	},
	["ConfigVersion"] = "3.0.8",
}
XPerlConfigSavePerCharacter = nil
