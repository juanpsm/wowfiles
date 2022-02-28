
XPerlConfig = nil
XPerlConfig_Global = nil
XPerlConfigNew = {
	["ConfigVersion"] = "3.0.8",
	["global"] = {
		["bar"] = {
			["fadeTime"] = 2,
			["fat"] = 1,
			["texture"] = {
				"Healbot", -- [1]
				"Interface\\AddOns\\Quartz\\textures\\Healbot", -- [2]
			},
		},
		["showReadyCheck"] = 1,
		["highlight"] = {
			["enable"] = 1,
			["AGGRO"] = 1,
			["TARGET"] = 1,
		},
		["showFD"] = 1,
		["minimap"] = {
			["enable"] = 1,
			["radius"] = 78,
			["pos"] = 244.9772769915963,
		},
		["highlightSelection"] = 1,
		["raidpet"] = {
			["warlock"] = 1,
			["hunter"] = 1,
		},
		["rangeFinder"] = {
			["StatsFrame"] = {
				["interact"] = 3,
				["item"] = "Venda de tejido de Escarcha gruesa",
				["FadeAmount"] = 0.5,
				["HealthLowPoint"] = 0.85,
			},
			["enabled"] = 1,
			["Main"] = {
				["enabled"] = 1,
				["interact"] = 1,
				["item"] = "Venda de tejido de Escarcha gruesa",
				["FadeAmount"] = 0.6,
				["HealthLowPoint"] = 0.85,
			},
			["NameFrame"] = {
				["enabled"] = 1,
				["item"] = "Venda de tejido de Escarcha gruesa",
				["FadeAmount"] = 0.5,
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
				["big"] = 1,
				["curable"] = 0,
				["size"] = 20,
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
			["eliteGfx"] = true,
			["mobType"] = 1,
			["highlightDebuffs"] = {
				["who"] = 2,
			},
			["raidIconAlternate"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["elite"] = true,
			["scale"] = 1,
			["values"] = 1,
			["buffs"] = {
				["big"] = 1,
				["castable"] = 0,
				["maxrows"] = 2,
				["wrap"] = 1,
				["rows"] = 3,
				["size"] = 20,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["target"] = {
			["debuffs"] = {
				["enable"] = 1,
				["big"] = 1,
				["curable"] = 0,
				["size"] = 20,
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
			["pvpIcon"] = 1,
			["level"] = 1,
			["sound"] = 1,
			["size"] = {
				["width"] = 0,
			},
			["mobType"] = 1,
			["threat"] = 1,
			["portrait3D"] = 1,
			["eliteGfx"] = true,
			["buffs"] = {
				["maxrows"] = 2,
				["above"] = 1,
				["wrap"] = 1,
				["enable"] = 1,
				["rows"] = 5,
				["size"] = 20,
				["big"] = 1,
			},
			["range30yard"] = 1,
			["highlightDebuffs"] = {
				["enable"] = 1,
				["who"] = 3,
			},
			["raidIconAlternate"] = 1,
			["values"] = 1,
			["threatMode"] = "nameFrame",
			["scale"] = 1.29,
			["elite"] = true,
			["healerMode"] = {
				["type"] = 1,
			},
			["reactionHighlight"] = 1,
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["raid"] = {
			["debuffs"] = {
				["size"] = 20,
			},
			["enable"] = 1,
			["class"] = {
				{
					["name"] = "HUNTER",
					["enable"] = 1,
				}, -- [1]
				{
					["name"] = "WARRIOR",
					["enable"] = 1,
				}, -- [2]
				{
					["name"] = "PALADIN",
					["enable"] = 1,
				}, -- [3]
				{
					["name"] = "DRUID",
					["enable"] = 1,
				}, -- [4]
				{
					["name"] = "SHAMAN",
					["enable"] = 1,
				}, -- [5]
				{
					["name"] = "ROGUE",
					["enable"] = 1,
				}, -- [6]
				{
					["name"] = "MAGE",
					["enable"] = 1,
				}, -- [7]
				{
					["name"] = "PRIEST",
					["enable"] = 1,
				}, -- [8]
				{
					["name"] = "WARLOCK",
					["enable"] = 1,
				}, -- [9]
				{
					["name"] = "DEATHKNIGHT",
					["enable"] = 1,
				}, -- [10]
			},
			["healerMode"] = {
				["type"] = 1,
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
			["titles"] = 1,
			["notInBG"] = 1,
			["mana"] = 1,
			["spacing"] = 0,
			["anchor"] = "TOP",
			["buffs"] = {
				["castable"] = 0,
				["size"] = 20,
				["maxrows"] = 2,
				["inside"] = 1,
			},
			["scale"] = 1.01,
			["size"] = {
				["width"] = 0,
			},
		},
		["targettargettarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 20,
			},
			["values"] = 1,
			["pvpIcon"] = 1,
			["scale"] = 0.92,
			["mana"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["buffs"] = {
				["maxrows"] = 2,
				["wrap"] = 1,
				["rows"] = 5,
				["size"] = 20,
			},
			["level"] = 1,
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["colour"] = {
			["classbarBright"] = 1,
			["gradient"] = {
				["e"] = {
					["a"] = 0,
					["r"] = 0.1,
					["g"] = 0.1,
					["b"] = 0.1,
				},
				["s"] = {
					["a"] = 1,
					["r"] = 0.25,
					["g"] = 0.25,
					["b"] = 0.25,
				},
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
			["frame"] = {
				["a"] = 1,
				["r"] = 0,
				["g"] = 0,
				["b"] = 0,
			},
			["guildList"] = 1,
			["class"] = 1,
			["border"] = {
				["a"] = 1,
				["r"] = 0.08235294117647059,
				["g"] = 0.08235294117647059,
				["b"] = 0.08235294117647059,
			},
			["bar"] = {
				["rage"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 1,
				},
				["healthFull"] = {
					["b"] = 0,
					["g"] = 0.592156862745098,
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
		["party"] = {
			["debuffs"] = {
				["below"] = 1,
				["halfSize"] = 1,
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
			["inRaid"] = 1,
			["pvpIcon"] = 1,
			["portrait3D"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["values"] = 1,
			["threatMode"] = "nameFrame",
			["name"] = 1,
			["target"] = {
				["enable"] = 1,
				["size"] = 120,
				["large"] = 1,
			},
			["hitIndicator"] = 1,
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
		["pet"] = {
			["xpBar"] = 1,
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 29,
				["big"] = 1,
			},
			["values"] = 1,
			["scale"] = 1,
			["castBar"] = {
				["enable"] = 1,
			},
			["hitIndicator"] = 1,
			["level"] = 1,
			["size"] = {
				["enable"] = 1,
				["size"] = 20,
				["width"] = 89,
			},
			["threat"] = 1,
			["extendPortrait"] = 1,
			["threatMode"] = "nameFrame",
			["name"] = 1,
			["happiness"] = {
				["enabled"] = 1,
				["flashWhenSad"] = 1,
				["enable"] = 1,
				["onlyWhenSad"] = 1,
			},
			["healerMode"] = {
				["type"] = 1,
			},
			["buffs"] = {
				["maxrows"] = 2,
				["above"] = 1,
				["castable"] = 1,
				["enable"] = 1,
				["wrap"] = 1,
				["size"] = 19,
				["big"] = 1,
			},
			["portrait"] = 1,
			["portrait3D"] = 1,
		},
		["player"] = {
			["partyNumber"] = 1,
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 45,
			},
			["portrait"] = 1,
			["scale"] = 1.44,
			["castBar"] = {
				["precast"] = 1,
				["castTime"] = 1,
				["enable"] = 1,
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
			["portrait3D"] = 1,
			["withName"] = 1,
			["showRunes"] = 1,
			["values"] = 1,
			["threatMode"] = "portraitFrame",
			["pvpIcon"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["totems"] = {
				["enable"] = true,
				["offsetY"] = 0,
				["offsetX"] = 0,
			},
			["buffs"] = {
				["count"] = 40,
				["maxrows"] = 2,
				["flash"] = 1,
				["rows"] = 4,
				["cooldown"] = 1,
				["size"] = 26,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["targettarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 20,
			},
			["values"] = 1,
			["pvpIcon"] = 1,
			["enable"] = 1,
			["mana"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["scale"] = 0.92,
			["buffs"] = {
				["maxrows"] = 2,
				["wrap"] = 1,
				["rows"] = 5,
				["size"] = 20,
			},
			["level"] = 1,
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["pettarget"] = {
			["enable"] = 1,
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 29,
			},
			["healerMode"] = {
				["type"] = 1,
			},
			["pvpIcon"] = 1,
			["scale"] = 0.96,
			["mana"] = 1,
			["buffs"] = {
				["above"] = 1,
				["castable"] = 0,
				["maxrows"] = 2,
				["wrap"] = 1,
				["rows"] = 3,
				["size"] = 22,
			},
			["size"] = {
				["width"] = 0,
			},
		},
		["tooltip"] = {
			["enable"] = 1,
			["enableBuffs"] = 1,
			["fading"] = 1,
			["modifier"] = "all",
		},
		["highlightDebuffs"] = {
			["enable"] = 1,
			["class"] = 1,
			["border"] = 1,
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
		["focustarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 20,
			},
			["enable"] = 1,
			["pvpIcon"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["buffs"] = {
				["castable"] = 0,
				["maxrows"] = 2,
				["rows"] = 3,
				["wrap"] = 1,
				["size"] = 20,
			},
			["scale"] = 0.83,
			["size"] = {
				["width"] = 6,
			},
		},
		["transparency"] = {
			["text"] = 1,
			["frame"] = 1,
		},
		["custom"] = {
			["enable"] = true,
			["zones"] = {
				["Ulduar"] = {
					[64153] = true,
					[64157] = true,
					[62269] = true,
					[62470] = true,
					[63612] = true,
					[62055] = true,
					[64705] = true,
					[62130] = true,
					[63018] = true,
					[61888] = true,
					[62331] = true,
					[64152] = true,
					[64156] = true,
					[62589] = true,
					[62717] = true,
					[63276] = true,
					[62469] = true,
					[62861] = true,
					[63355] = true,
					[63042] = true,
					[62928] = true,
					[63802] = true,
					[63615] = true,
					[62042] = true,
					[62548] = true,
					[64125] = true,
					[64668] = true,
					[62680] = true,
					[62997] = true,
					[63322] = true,
					[63666] = true,
					[61903] = true,
					[63024] = true,
					[62188] = true,
					[62526] = true,
					[63830] = true,
					[61969] = true,
					[62532] = true,
					[64544] = true,
					[64290] = true,
				},
				["Serpentshrine Cavern"] = {
					[38132] = true,
				},
				["Hyjal Summit"] = {
					[39941] = true,
					[31347] = true,
				},
				["The Obsidian Sanctum"] = {
					[58936] = true,
					[60708] = true,
					[39647] = true,
					[57491] = true,
				},
				["Karazhan"] = {
					[34661] = true,
					[30753] = true,
				},
				["Black Temple"] = {
					[41001] = true,
					[41917] = true,
					[38132] = true,
					[40585] = true,
					[43581] = true,
					[40251] = true,
					[39837] = true,
					[40932] = true,
					[46787] = true,
				},
				["Naxxramas"] = {
					[28622] = true,
					[29212] = true,
					[28794] = true,
					[29213] = true,
					[29214] = true,
					[28796] = true,
					[54121] = true,
					[28410] = true,
					[55550] = true,
					[29310] = true,
					[27808] = true,
					[54378] = true,
					[28786] = true,
					[55314] = true,
					[29998] = true,
					[27819] = true,
					[28542] = true,
					[28522] = true,
					[29306] = true,
					[28169] = true,
				},
				["Sunwell Plateau"] = {
					[45141] = true,
					[45662] = true,
					[45641] = true,
					[45342] = true,
					[45855] = true,
				},
				["The Eye of Eternity"] = {
					[57407] = true,
					[56272] = true,
				},
			},
			["blend"] = "ADD",
			["alpha"] = 0.5,
		},
		["sortByClass"] = false,
		["combatFlash"] = 1,
		["buffs"] = {
			["countdown"] = 1,
			["cooldown"] = 1,
			["countdownStart"] = 20,
		},
		["maximumScale"] = 4,
		["optionsColour"] = {
			["b"] = 0.2,
			["g"] = 0.2,
			["r"] = 0.7,
		},
	},
	["savedPositions"] = {
		["Kel'Thuzad"] = {
			["Korigami"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 498.0000006838724,
					["height"] = 250.0000077961453,
					["left"] = 507.6667394078937,
					["width"] = 350.0000179174567,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 580.9189310992408,
					["height"] = 124.0000051974302,
					["left"] = 757.5225934684305,
					["width"] = 330.0000088903411,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 579.6666458541502,
					["width"] = 205.9999949393443,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 568.1878283836946,
					["left"] = 537.3200040438394,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 593.9189229611593,
					["height"] = 149.9999976748339,
					["left"] = 852.5226013329631,
					["width"] = 140.0000106684094,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 837.8378713824988,
					["left"] = 518.15000951408,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 568.1878283836946,
					["left"] = 230.2799992070448,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 568.1878283836946,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 1020.557832821749,
					["left"] = 33.11999924804036,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 568.1878283836946,
					["left"] = 614.0800450379981,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 568.1878283836946,
					["left"] = 307.040022518999,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 948.8378150796735,
					["left"] = 103.0000062232388,
				},
				["XPerl_PetTarget"] = {
					["top"] = 940.4377790632968,
					["left"] = 323.8000198630007,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 568.1878283836946,
					["left"] = 383.7999927843398,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 504.000045409127,
					["height"] = 240.0000032825875,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 568.1878283836946,
					["left"] = 76.76000562974976,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 917.8378357730536,
					["left"] = 0,
				},
				["XPerl_Focus"] = {
					["top"] = 837.8378280048618,
					["left"] = 270.9999892632034,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 568.1878283836946,
					["left"] = 690.8400506677477,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 568.1878283836946,
					["left"] = 460.5599984140896,
				},
				["XPerl_Target"] = {
					["top"] = 1022.35779436126,
					["left"] = 349.5899758117033,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 1026.79783219909,
					["left"] = 542.8000615638542,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 568.1878283836946,
					["left"] = 153.5200112594995,
				},
			},
		},
		["saved"] = {
			["jpp"] = {
				["XPerl_RosterTextAnchor"] = {
					["height"] = 249.9999962747098,
					["top"] = 497.9999468028553,
					["left"] = 336.9999644607311,
					["width"] = 349.9999947845936,
				},
				["XPerl_Focus"] = {
					["top"] = 556.8857908877336,
					["left"] = 349.4323076827907,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["height"] = 103.3675772404805,
					["top"] = 1097.142912165276,
					["left"] = 1165.571923646194,
					["width"] = 383.5808704751839,
				},
				["XPerl_MTList_Anchor"] = {
					["height"] = 58.31069376050557,
					["top"] = 1085.333370353626,
					["left"] = 449.5000243116637,
					["width"] = 272.9999866644883,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 890.0571800985483,
					["left"] = 134.0953292964267,
				},
				["XPerl_AdminFrameAnchor"] = {
					["height"] = 182.999998563868,
					["top"] = 430.4523683219092,
					["left"] = 1798.642398953238,
					["width"] = 171.0000841846918,
				},
				["XPerl_Raid_TitlePets"] = {
					["top"] = 251.0000610351563,
					["left"] = 879.999755859375,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 888.5333591932372,
					["left"] = 266.6666696190602,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 534.2413261600393,
					["left"] = 950.2181453213227,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 1075.961873952983,
					["left"] = 198.0952610969235,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 1079.009515763606,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 289.8730997410743,
					["left"] = 493.2816291458095,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 1077.485694858294,
					["left"] = 68.57142252784358,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 890.057012030066,
					["left"] = 199.6190960079414,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 1072.914232142361,
					["left"] = 265.1428487137491,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 406.4711496462568,
					["left"] = 418.4953201586229,
				},
				["XPerl_OptionsAnchor"] = {
					["height"] = 540.000103675055,
					["top"] = 911.5238114451653,
					["left"] = 1011.404878102823,
					["width"] = 823.6666439393074,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 891.5808889582045,
					["left"] = 0,
				},
				["XPerl_CheckAnchor"] = {
					["height"] = 239.9999964237214,
					["top"] = 503.9999696016316,
					["left"] = 261.9999655783182,
					["width"] = 499.9999925494195,
				},
				["XPerl_PetTarget"] = {
					["top"] = 260.4325701983456,
					["left"] = 479.0442220084104,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 576.1904660630291,
					["left"] = 0,
				},
				["XPerl_AggroAnchor"] = {
					["top"] = 539.0000962208459,
					["left"] = 1052.000068660788,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 891.5808889582045,
					["left"] = 65.52387875716944,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["height"] = 124.0000038743019,
					["top"] = 445.9999780952934,
					["left"] = 346.9999643117195,
					["width"] = 329.9999950826169,
				},
				["XPerl_Target"] = {
					["top"] = 331.1232799725133,
					["left"] = 859.2216012493732,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 321.4808467751984,
					["left"] = 1301.378600082341,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 1071.925718973017,
					["left"] = 167.7713199124003,
				},
			},
			["jp"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 497.9999468028553,
					["height"] = 249.9999962747098,
					["left"] = 336.9999644607311,
					["width"] = 349.9999947845936,
				},
				["XPerl_Focus"] = {
					["top"] = 607.9999389648438,
					["left"] = 216.8000030517578,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["height"] = 45.69230488317032,
					["top"] = 707.5129069630588,
					["left"] = 0,
					["width"] = 216.0000344671687,
				},
				["XPerl_MTList_Anchor"] = {
					["height"] = 47.63107546251487,
					["top"] = 336.9332888633911,
					["left"] = 190.5666691126503,
					["width"] = 223.0000866466324,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 815.4666509890192,
					["left"] = 126.3999636960717,
				},
				["XPerl_AdminFrameAnchor"] = {
					["height"] = 149.9999977648259,
					["top"] = 458.9999702721839,
					["left"] = 442.0000010430813,
					["width"] = 139.9999979138375,
				},
				["XPerl_Raid_TitlePets"] = {
					["top"] = 251.0000610351563,
					["left"] = 879.999755859375,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 814.1331956512173,
					["left"] = 252.2666460981119,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 607.9999576977332,
					["left"] = 414.6999722623406,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 997.3332754672074,
					["left"] = 195.2000293882462,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 998.6667308050094,
					["left"] = 3.733336708025073,
				},
				["XPerl_Player"] = {
					["top"] = 237.6665825275664,
					["left"] = 510.3667945485249,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 997.3332754672074,
					["left"] = 67.73332803277593,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 814.1333637196993,
					["left"] = 189.3331508343165,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 997.3332754672074,
					["left"] = 256.8000973256534,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 354.3540726220249,
					["left"] = 378.9123475387935,
				},
				["XPerl_OptionsAnchor"] = {
					["height"] = 540.0001737035882,
					["top"] = 1072.666399181377,
					["left"] = 758.8327572962174,
					["width"] = 813.0003179322763,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 815.4667070118466,
					["left"] = 0,
				},
				["XPerl_CheckAnchor"] = {
					["height"] = 239.9999964237214,
					["top"] = 503.9999696016316,
					["left"] = 261.9999655783182,
					["width"] = 499.9999925494195,
				},
				["XPerl_PetTarget"] = {
					["top"] = 230.172503293022,
					["left"] = 494.1789640046758,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 543.2001356228368,
					["left"] = 7.486969054650561e-007,
				},
				["XPerl_AggroAnchor"] = {
					["top"] = 539.0000962208459,
					["left"] = 1052.000068660788,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 815.4666509890192,
					["left"] = 62.13345427424004,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["height"] = 124.0000038743019,
					["top"] = 445.9999780952934,
					["left"] = 346.9999643117195,
					["width"] = 329.9999950826169,
				},
				["XPerl_Target"] = {
					["top"] = 329.0135913483578,
					["left"] = 837.6541781765241,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 299.0666849802638,
					["left"] = 1264.466756936944,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 997.333499558517,
					["left"] = 131.4666542005241,
				},
			},
			["jsanchez"] = {
				["XPerl_RosterTextAnchor"] = {
					["height"] = 249.9999962747098,
					["top"] = 497.9999468028553,
					["left"] = 336.9999644607311,
					["width"] = 349.9999947845936,
				},
				["XPerl_Focus"] = {
					["top"] = 712.5491044702546,
					["left"] = 5.627777271105814,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 734.0562778622671,
					["left"] = 319.7764790329185,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["height"] = 278.8269383627862,
					["top"] = 278.8269558699195,
					["left"] = 1592.476296333124,
					["width"] = 358.0000075225963,
				},
				["XPerl_MTList_Anchor"] = {
					["height"] = 92.76699051899828,
					["top"] = 990.1052795564349,
					["left"] = 251.1052856428992,
					["width"] = 273.0000391858882,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 737.6002867393871,
					["left"] = 160.7605380272765,
				},
				["XPerl_TargetTargetTarget"] = {
					["top"] = 198.0229110579483,
					["left"] = 591.9174762026618,
				},
				["XPerl_Raid_TitlePets"] = {
					["top"] = 251.0000610351563,
					["left"] = 879.999755859375,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 963.7683423440029,
					["left"] = 81.4164904009765,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 674.9210931207773,
					["left"] = 278.0706272127333,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 966.3023437019085,
					["left"] = 240.2094588082765,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 965.2922654538762,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 227.1907445591801,
					["left"] = 30.39244939631799,
				},
				["XPerl_AdminFrameAnchor"] = {
					["height"] = 183.2142858754842,
					["top"] = 443.8928046434389,
					["left"] = 1702.476416010793,
					["width"] = 170.9999441276254,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 736.0582570521383,
					["left"] = 241.3900111895851,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 966.798294172828,
					["left"] = 317.1924724007771,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 64.69861777763219,
					["left"] = 24.75670589883024,
				},
				["XPerl_PetTarget"] = {
					["top"] = 70.02007499717939,
					["left"] = 217.6523906587073,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 734.0922081017461,
					["left"] = 0,
				},
				["XPerl_CheckAnchor"] = {
					["height"] = 239.9999964237214,
					["top"] = 503.9999696016316,
					["left"] = 261.9999655783182,
					["width"] = 499.9999925494195,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 736.0942580204353,
					["left"] = 79.78999282298395,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 498.201200083555,
					["left"] = 0,
				},
				["XPerl_AggroAnchor"] = {
					["top"] = 539.0000962208459,
					["left"] = 1052.000068660788,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["height"] = 151.8060685605327,
					["top"] = 526.8060627476174,
					["left"] = 1067.210546187682,
					["width"] = 404.000000273549,
				},
				["XPerl_OptionsAnchor"] = {
					["height"] = 540.0000686607884,
					["top"] = 936.5174151182713,
					["left"] = 665.8286326566439,
					["width"] = 773.0089834161628,
				},
				["XPerl_Target"] = {
					["top"] = 232.4944981699711,
					["left"] = 351.5980307213889,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 134.6495695165131,
					["left"] = 573.8987421216083,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 963.2722504154475,
					["left"] = 162.832980801953,
				},
			},
			["jjjj"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 497.9999468028553,
					["height"] = 249.9999962747098,
					["left"] = 336.9999644607311,
					["width"] = 349.9999947845936,
				},
				["XPerl_Focus"] = {
					["top"] = 549.1688002843483,
					["left"] = 307.715482456463,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["height"] = 141.5384675144542,
					["top"] = 773.1136060447755,
					["left"] = 190.4285378308977,
					["width"] = 320.0000744053165,
				},
				["XPerl_MTList_Anchor"] = {
					["height"] = 75.77671155992593,
					["top"] = 973.379594656522,
					["left"] = 366.8865583581482,
					["width"] = 223.0000166180992,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 890.0571800985483,
					["left"] = 134.0953292964267,
				},
				["XPerl_AdminFrameAnchor"] = {
					["height"] = 149.9999977648259,
					["top"] = 458.9999702721839,
					["left"] = 442.0000010430813,
					["width"] = 139.9999979138375,
				},
				["XPerl_Raid_TitlePets"] = {
					["top"] = 251.0000610351563,
					["left"] = 879.999755859375,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 888.5333591932372,
					["left"] = 266.6666696190602,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 534.2413261600393,
					["left"] = 950.2181453213227,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 1075.961873952983,
					["left"] = 198.0952610969235,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 1079.009515763606,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 289.8730997410743,
					["left"] = 493.2816291458095,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 1077.485694858294,
					["left"] = 68.57142252784358,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 890.057012030066,
					["left"] = 199.6190960079414,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 1072.914232142361,
					["left"] = 265.1428487137491,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 406.4711496462568,
					["left"] = 418.4953201586229,
				},
				["XPerl_OptionsAnchor"] = {
					["height"] = 540.0000686607884,
					["top"] = 1028.857179063301,
					["left"] = 714.2618368224389,
					["width"] = 823.6665739107742,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 891.5808889582045,
					["left"] = 0,
				},
				["XPerl_CheckAnchor"] = {
					["height"] = 239.9999964237214,
					["top"] = 503.9999696016316,
					["left"] = 261.9999655783182,
					["width"] = 499.9999925494195,
				},
				["XPerl_PetTarget"] = {
					["top"] = 260.4325701983456,
					["left"] = 479.0442220084104,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 576.1904660630291,
					["left"] = 0,
				},
				["XPerl_AggroAnchor"] = {
					["top"] = 539.0000962208459,
					["left"] = 1052.000068660788,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 891.5808889582045,
					["left"] = 65.52387875716944,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["height"] = 124.0000038743019,
					["top"] = 445.9999780952934,
					["left"] = 346.9999643117195,
					["width"] = 329.9999950826169,
				},
				["XPerl_Target"] = {
					["top"] = 331.1232799725133,
					["left"] = 859.2216012493732,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 321.4808467751984,
					["left"] = 1301.378600082341,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 1075.961873952983,
					["left"] = 134.0952592678925,
				},
			},
		},
		["Sin'dorei(WoWArg)"] = {
			["Gilraenloss"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 497.9999468028553,
					["height"] = 249.9999962747098,
					["left"] = 336.9999644607311,
					["width"] = 349.9999947845936,
				},
				["XPerl_Focus"] = {
					["top"] = 731.7435828495618,
					["left"] = 265.7179277868942,
				},
				["XPerl_AdminFrameAnchor"] = {
					["height"] = 183.2142858754842,
					["top"] = 443.8928046434389,
					["left"] = 1702.476416010793,
					["width"] = 170.9999441276254,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["height"] = 228.8000073311121,
					["top"] = 776.8859030716197,
					["left"] = 1000.895065867512,
					["width"] = 123.1999992340629,
				},
				["XPerl_MTList_Anchor"] = {
					["height"] = 58.31068500693891,
					["top"] = 990.526291098081,
					["left"] = 251.0000152503544,
					["width"] = 273.0000041716216,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 1052.054811235924,
					["left"] = 565.6000377597972,
				},
				["XPerl_TargetTargetTarget"] = {
					["top"] = 198.0229110579483,
					["left"] = 591.9174762026618,
				},
				["XPerl_Raid_TitlePets"] = {
					["top"] = 251.0000610351563,
					["left"] = 879.999755859375,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 1052.054811235924,
					["left"] = 80.80000918330056,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 799.5711341389774,
					["left"] = 380.6982450289938,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 1052.054811235924,
					["left"] = 242.3999833443905,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 1052.054811235924,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 199.7175185221898,
					["left"] = 30.39248045630493,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 1052.054811235924,
					["left"] = 727.199967715376,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 1052.054811235924,
					["left"] = 646.4000734664045,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 1052.054811235924,
					["left"] = 323.2000367332022,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 74.00000889034114,
					["left"] = 26.99999993161276,
				},
				["XPerl_PetTarget"] = {
					["top"] = 88.54632192427512,
					["left"] = 245.4725637992793,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 1052.054811235924,
					["left"] = 404.0000017109916,
				},
				["XPerl_CheckAnchor"] = {
					["height"] = 239.9999964237214,
					["top"] = 503.9999696016316,
					["left"] = 261.9999655783182,
					["width"] = 499.9999925494195,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 1052.054811235924,
					["left"] = 484.7999666887811,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 726.7076481722112,
					["left"] = 0,
				},
				["XPerl_AggroAnchor"] = {
					["top"] = 539.0000962208459,
					["left"] = 1052.000068660788,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["height"] = 151.8060685605327,
					["top"] = 526.8060627476174,
					["left"] = 1067.210546187682,
					["width"] = 404.000000273549,
				},
				["XPerl_OptionsAnchor"] = {
					["height"] = 540.0000686607884,
					["top"] = 783.342883976056,
					["left"] = 379.7692174126768,
					["width"] = 800.7259967457248,
				},
				["XPerl_Target"] = {
					["top"] = 184.3488616229883,
					["left"] = 453.6998013046958,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 100.036824385554,
					["left"] = 483.520035860428,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 1052.054811235924,
					["left"] = 161.6000183666011,
				},
			},
		},
		["WoWArg"] = {
			["Gilraenloss"] = {
				["XPerl_RosterTextAnchor"] = {
					["height"] = 249.9999962747098,
					["top"] = 497.9999468028553,
					["left"] = 336.9999644607311,
					["width"] = 349.9999947845936,
				},
				["XPerl_Focus"] = {
					["top"] = 731.7435828495618,
					["left"] = 265.7179277868942,
				},
				["XPerl_TargetTargetTarget"] = {
					["top"] = 198.0229110579483,
					["left"] = 591.9174762026618,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 776.8859030716197,
					["height"] = 228.8000073311121,
					["left"] = 1000.895065867512,
					["width"] = 123.1999992340629,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 990.526291098081,
					["height"] = 180.2830315324671,
					["left"] = 251.0000152503544,
					["width"] = 273.0000041716216,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 1052.054811235924,
					["left"] = 565.6000377597972,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 443.8928046434389,
					["height"] = 183.2142858754842,
					["left"] = 1702.476416010793,
					["width"] = 170.9999441276254,
				},
				["XPerl_Raid_TitlePets"] = {
					["top"] = 251.0000610351563,
					["left"] = 879.999755859375,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 100.036824385554,
					["left"] = 483.520035860428,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 799.5711341389774,
					["left"] = 380.6982450289938,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 1052.054811235924,
					["left"] = 242.3999833443905,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 1052.054811235924,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 199.7175185221898,
					["left"] = 30.39248045630493,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 1052.054811235924,
					["left"] = 727.199967715376,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 1052.054811235924,
					["left"] = 646.4000734664045,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 1052.054811235924,
					["left"] = 323.2000367332022,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 74.00000889034114,
					["left"] = 26.99999993161276,
				},
				["XPerl_OptionsAnchor"] = {
					["top"] = 796.0275723672058,
					["height"] = 540.0000336465218,
					["left"] = 668.0575008115856,
					["width"] = 800.726066774258,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 1052.054811235924,
					["left"] = 404.0000017109916,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 503.9999696016316,
					["height"] = 239.9999964237214,
					["left"] = 261.9999655783182,
					["width"] = 499.9999925494195,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 526.8060627476174,
					["height"] = 151.8060685605327,
					["left"] = 1067.210546187682,
					["width"] = 404.000000273549,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 726.7076481722112,
					["left"] = 0,
				},
				["XPerl_AggroAnchor"] = {
					["top"] = 539.0000962208459,
					["left"] = 1052.000068660788,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 1052.054811235924,
					["left"] = 484.7999666887811,
				},
				["XPerl_PetTarget"] = {
					["top"] = 88.54632192427512,
					["left"] = 245.4725637992793,
				},
				["XPerl_Target"] = {
					["top"] = 184.3488616229883,
					["left"] = 453.6998013046958,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 1052.054811235924,
					["left"] = 80.80000918330056,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 1052.054811235924,
					["left"] = 161.6000183666011,
				},
			},
			["Finweloss"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 497.9999468028553,
					["height"] = 249.9999962747098,
					["left"] = 336.9999644607311,
					["width"] = 349.9999947845936,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 445.9999780952934,
					["height"] = 124.0000038743019,
					["left"] = 346.9999643117195,
					["width"] = 329.9999950826169,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 423.9999707937245,
					["height"] = 79.99999880790712,
					["left"] = 412.0000014901161,
					["width"] = 199.9999970197678,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 423.9999707937245,
					["height"] = 79.99999880790712,
					["left"] = 409.000009164214,
					["width"] = 206.0000007450581,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 395.9999389648438,
					["left"] = 425.6000061035156,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 458.9999702721839,
					["height"] = 149.9999977648259,
					["left"] = 442.0000010430813,
					["width"] = 139.9999979138375,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 607.9999576977332,
					["left"] = 414.6999722623406,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 395.9999389648438,
					["left"] = 182.4000091552734,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 395.9999389648438,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 757.1999503473453,
					["left"] = 20.69999871402982,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 395.9999389648438,
					["left"] = 486.3999938964844,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 395.9999389648438,
					["left"] = 243.1999969482422,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 695.0199268182983,
					["left"] = 84.4599995687604,
				},
				["XPerl_PetTarget"] = {
					["top"] = 823.585178780177,
					["left"] = 333.4999855362946,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 395.9999389648438,
					["left"] = 304,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 503.9999696016316,
					["height"] = 239.9999964237214,
					["left"] = 261.9999655783182,
					["width"] = 499.9999925494195,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 395.9999389648438,
					["left"] = 60.79999923706055,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 647.9999389648438,
					["left"] = 0,
				},
				["XPerl_Focus"] = {
					["top"] = 607.9999389648438,
					["left"] = 216.8000030517578,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 395.9999389648438,
					["left"] = 547.2000122070313,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 395.9999389648438,
					["left"] = 364.8000183105469,
				},
				["XPerl_Target"] = {
					["top"] = 756.39990234375,
					["left"] = 306.7999572753906,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 759.6000047368657,
					["left"] = 412.9999868124725,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 395.9999389648438,
					["left"] = 121.5999984741211,
				},
			},
			["Flemitax"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 497.9999982202534,
					["height"] = 250.0000042440112,
					["left"] = 504.9999991101267,
					["width"] = 350.0000094463475,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 874.0000009583251,
					["height"] = 123.9999882262915,
					["left"] = 866.9998598791785,
					["width"] = 329.9999768632937,
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
					["top"] = 1023.999918900518,
					["left"] = 445.5866869557993,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 587.0000345681558,
					["height"] = 149.9999990416749,
					["left"] = 836.6666862438797,
					["width"] = 140.0000002738072,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 690.2336671809633,
					["left"] = 342.825314653735,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 1023.999918900518,
					["left"] = 192.6799988010856,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 1023.999918900518,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 205.386973639257,
					["left"] = 49.12003543299606,
				},
				["XPerl_OptionsAnchor"] = {
					["top"] = 832.6667358029782,
					["height"] = 539.9999334648566,
					["left"] = 910.8334007241241,
					["width"] = 813.0000032172343,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 1023.999918900518,
					["left"] = 507.1466909073222,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 1023.999918900518,
					["left"] = 255.5733315446674,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 75.00010466279244,
					["left"] = 40.33314173676302,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 1023.999918900518,
					["left"] = 65.55999742478134,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 1023.999918900518,
					["left"] = 317.1333071078623,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 503.9999939762421,
					["height"] = 240.0000054761435,
					["left"] = 430.0000346366076,
					["width"] = 500.0000084880224,
				},
				["XPerl_PetTarget"] = {
					["top"] = 77.26648263607135,
					["left"] = 238.1333000713551,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 721.8871131095705,
					["left"] = 0,
				},
				["XPerl_Focus"] = {
					["top"] = 750.9481262931365,
					["left"] = 220.3506240219207,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 1023.999918900518,
					["left"] = 567.3733802609503,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 1023.999918900518,
					["left"] = 380.0267108222639,
				},
				["XPerl_Target"] = {
					["top"] = 100.611200121884,
					["left"] = 481.8639588885309,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 176.9601049130894,
					["left"] = 648.1334565905843,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 1023.999918900518,
					["left"] = 131.1200232378906,
				},
			},
			["Nigthcrow"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 497.9999468028553,
					["height"] = 249.9999962747098,
					["left"] = 336.9999644607311,
					["width"] = 349.9999947845936,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 445.9999780952934,
					["height"] = 124.0000038743019,
					["left"] = 346.9999643117195,
					["width"] = 329.9999950826169,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 423.9999707937245,
					["height"] = 79.99999880790712,
					["left"] = 412.0000014901161,
					["width"] = 199.9999970197678,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 423.9999707937245,
					["height"] = 79.99999880790712,
					["left"] = 409.000009164214,
					["width"] = 206.0000007450581,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 395.9999389648438,
					["left"] = 425.6000061035156,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 458.9999702721839,
					["height"] = 149.9999977648259,
					["left"] = 442.0000010430813,
					["width"] = 139.9999979138375,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 607.9999576977332,
					["left"] = 414.6999722623406,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 395.9999389648438,
					["left"] = 182.4000091552734,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 395.9999389648438,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 328.347525950032,
					["left"] = 444.3187498336968,
				},
				["XPerl_OptionsAnchor"] = {
					["top"] = 768.8693867326431,
					["height"] = 540.0000686607884,
					["left"] = 33.17695205049221,
					["width"] = 775.1409320811448,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 394.5522746635691,
					["left"] = 487.6570316927314,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 395.9999389648438,
					["left"] = 243.1999969482422,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 758.6807603648897,
					["left"] = 498.5046613084352,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 395.9999389648438,
					["left"] = 60.79999923706055,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 395.9999389648438,
					["left"] = 304,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 503.9999696016316,
					["height"] = 239.9999964237214,
					["left"] = 261.9999655783182,
					["width"] = 499.9999925494195,
				},
				["XPerl_PetTarget"] = {
					["top"] = 823.585178780177,
					["left"] = 333.4999855362946,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 647.9999389648438,
					["left"] = 0,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 395.9999389648438,
					["left"] = 547.2000122070313,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 395.9999389648438,
					["left"] = 364.8000183105469,
				},
				["XPerl_Focus"] = {
					["top"] = 607.9999389648438,
					["left"] = 216.8000030517578,
				},
				["XPerl_Target"] = {
					["top"] = 256.4660458407598,
					["left"] = 816.9213930149842,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 249.8554856571505,
					["left"] = 1137.84277600304,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 395.9999389648438,
					["left"] = 121.5999984741211,
				},
			},
			["Acrux"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 497.9999468028553,
					["height"] = 249.9999962747098,
					["left"] = 336.9999644607311,
					["width"] = 349.9999947845936,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 445.9999780952934,
					["height"] = 124.0000038743019,
					["left"] = 346.9999643117195,
					["width"] = 329.9999950826169,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 423.9999707937245,
					["height"] = 79.99999880790712,
					["left"] = 412.0000014901161,
					["width"] = 199.9999970197678,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 423.9999707937245,
					["height"] = 79.99999880790712,
					["left"] = 409.000009164214,
					["width"] = 206.0000007450581,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 395.9999389648438,
					["left"] = 425.6000061035156,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 458.9999702721839,
					["height"] = 149.9999977648259,
					["left"] = 442.0000010430813,
					["width"] = 139.9999979138375,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 607.9999576977332,
					["left"] = 414.6999722623406,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 395.9999389648438,
					["left"] = 182.4000091552734,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 395.9999389648438,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 757.1999503473453,
					["left"] = 20.69999871402982,
				},
				["XPerl_OptionsAnchor"] = {
					["top"] = 319.9999952316285,
					["height"] = 539.9999919533731,
					["left"] = 60.49995332211326,
					["width"] = 770.9999732524161,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 395.9999389648438,
					["left"] = 486.3999938964844,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 395.9999389648438,
					["left"] = 243.1999969482422,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 695.0199268182983,
					["left"] = 84.4599995687604,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 758.5999818806139,
					["left"] = 502.3000785655181,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 395.9999389648438,
					["left"] = 304,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 503.9999696016316,
					["height"] = 239.9999964237214,
					["left"] = 261.9999655783182,
					["width"] = 499.9999925494195,
				},
				["XPerl_PetTarget"] = {
					["top"] = 823.585178780177,
					["left"] = 333.4999855362946,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 647.9999389648438,
					["left"] = 0,
				},
				["XPerl_Focus"] = {
					["top"] = 607.9999389648438,
					["left"] = 216.8000030517578,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 395.9999389648438,
					["left"] = 364.8000183105469,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 395.9999389648438,
					["left"] = 547.2000122070313,
				},
				["XPerl_Target"] = {
					["top"] = 756.3999633789063,
					["left"] = 306.7999877929688,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 395.9999389648438,
					["left"] = 60.79999923706055,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 395.9999389648438,
					["left"] = 121.5999984741211,
				},
			},
			["Darinakitomt"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 498.0000006838724,
					["height"] = 250.0000077961453,
					["left"] = 507.6667394078937,
					["width"] = 350.0000179174567,
				},
				["XPerl_Focus"] = {
					["top"] = 810.5262798825736,
					["left"] = 270.9999892632034,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 579.6666458541502,
					["width"] = 205.9999949393443,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 638.5263378155229,
					["left"] = 425.6000135636268,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 580.2631489000152,
					["height"] = 149.9999976748339,
					["left"] = 828.2455996401737,
					["width"] = 140.0000106684094,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 810.526250979707,
					["left"] = 518.1499513903987,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 638.5263378155229,
					["left"] = 182.4000038121677,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 638.5263378155229,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 993.2463340347434,
					["left"] = 33.11999924804036,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 638.5263378155229,
					["left"] = 486.3999914915046,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 638.5263378155229,
					["left"] = 243.1999957457523,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 921.5263369859185,
					["left"] = 102.9999974696721,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 846.8420968047361,
					["height"] = 124.0000139509968,
					["left"] = 1027.421243989873,
					["width"] = 330.0000088903411,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 638.5263378155229,
					["left"] = 304.0000296964575,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 504.000045409127,
					["height"] = 240.0000032825875,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 999.486384422445,
					["left"] = 542.8000615638542,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 890.5263712780329,
					["left"] = 0,
				},
				["XPerl_PetTarget"] = {
					["top"] = 913.1263828130977,
					["left"] = 300.799983385066,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 638.5263378155229,
					["left"] = 364.8000076243353,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 638.5263378155229,
					["left"] = 547.2000534536235,
				},
				["XPerl_Target"] = {
					["top"] = 991.6863811958737,
					["left"] = 425.4700248439447,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 638.5263378155229,
					["left"] = 60.79999893643807,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 638.5263378155229,
					["left"] = 121.5999978728761,
				},
			},
		},
		["Sin'Dorei"] = {
			["Gilraenloss"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 498.0000006838724,
					["height"] = 250.0000077961453,
					["left"] = 507.6667394078937,
					["width"] = 350.0000179174567,
				},
				["XPerl_Focus"] = {
					["top"] = 837.8378280048618,
					["left"] = 270.9999892632034,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 815.5585302788948,
					["height"] = 79.59991933041233,
					["left"] = 0,
					["width"] = 359.3366421359359,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 1037.837823741896,
					["left"] = 565.9924412413519,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 593.9189229611593,
					["height"] = 149.9999976748339,
					["left"] = 852.5226013329631,
					["width"] = 140.0000106684094,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 568.1878283836946,
					["left"] = 230.2799992070448,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 776.7207041495063,
					["left"] = 412.0598762973243,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 568.1878283836946,
					["left"] = 690.8400506677477,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 568.1878283836946,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 220.2694153805785,
					["left"] = 28.50738905139636,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 1026.79783219909,
					["left"] = 542.8000615638542,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 568.1878283836946,
					["left"] = 614.0800450379981,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 568.1878283836946,
					["left"] = 307.040022518999,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 948.8378150796735,
					["left"] = 103.0000062232388,
				},
				["XPerl_OptionsAnchor"] = {
					["top"] = 434.9009308939423,
					["height"] = 540.0000686607884,
					["left"] = 641.1395830744591,
					["width"] = 795.7027100016543,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 568.1878283836946,
					["left"] = 383.7999927843398,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 504.000045409127,
					["height"] = 240.0000032825875,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_PetTarget"] = {
					["top"] = 79.03234365524754,
					["left"] = 245.3856387835219,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 726.9189868205615,
					["left"] = 0,
				},
				["XPerl_AggroAnchor"] = {
					["top"] = 517.0088958804963,
					["left"] = 1144.927582085033,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 568.1878283836946,
					["left"] = 460.5599984140896,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 580.9189310992408,
					["height"] = 124.0000051974302,
					["left"] = 757.5225934684305,
					["width"] = 330.0000088903411,
				},
				["XPerl_Target"] = {
					["top"] = 1022.35779436126,
					["left"] = 349.5899758117033,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 568.1878283836946,
					["left"] = 76.76000562974976,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 568.1878283836946,
					["left"] = 153.5200112594995,
				},
			},
		},
	},
}
XPerlConfigSavePerCharacter = nil
