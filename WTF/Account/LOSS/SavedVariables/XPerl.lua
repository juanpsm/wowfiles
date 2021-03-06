
XPerlConfig = nil
XPerlConfig_Global = nil
XPerlConfigNew = {
	["global"] = {
		["highlight"] = {
			["enable"] = 1,
			["AGGRO"] = 1,
		},
		["highlightSelection"] = 1,
		["bar"] = {
			["fat"] = 1,
			["background"] = 1,
			["fadeTime"] = 0.5,
			["texture"] = {
				"Perl v2", -- [1]
				"Interface\\Addons\\XPerl\\Images\\XPerl_StatusBar", -- [2]
			},
		},
		["rangeFinder"] = {
			["StatsFrame"] = {
				["FadeAmount"] = 0.5,
				["item"] = "Heavy Netherweave Bandage",
				["HealthLowPoint"] = 0.85,
			},
			["Main"] = {
				["enabled"] = true,
				["item"] = "Heavy Netherweave Bandage",
				["FadeAmount"] = 0.5,
				["HealthLowPoint"] = 0.85,
			},
			["NameFrame"] = {
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
				["size"] = 13,
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
				["width"] = 30,
			},
			["threat"] = 1,
			["portrait3D"] = 1,
			["pvpIcon"] = 1,
			["mobType"] = 1,
			["highlightDebuffs"] = {
				["enable"] = 1,
				["who"] = 2,
			},
			["raidIconAlternate"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["elite"] = 1,
			["scale"] = 1.26,
			["values"] = 1,
			["buffs"] = {
				["maxrows"] = 2,
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
				["maxrows"] = 2,
				["right"] = 1,
				["size"] = 20,
				["inside"] = 1,
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
			["class"] = 1,
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
			["guildList"] = 1,
			["classic"] = 1,
			["frame"] = {
				["a"] = 1,
				["b"] = 0,
				["g"] = 0,
				["r"] = 0,
			},
			["border"] = {
				["a"] = 1,
				["b"] = 0.5,
				["g"] = 0.5,
				["r"] = 0.5,
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
				["healthEmpty"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 1,
				},
				["energy"] = {
					["b"] = 0,
					["g"] = 1,
					["r"] = 1,
				},
			},
		},
		["minimap"] = {
			["enable"] = 1,
			["radius"] = 78,
			["pos"] = 186,
		},
		["targettargettarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 13,
			},
			["values"] = 1,
			["pvpIcon"] = 1,
			["scale"] = 0.7,
			["mana"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["buffs"] = {
				["maxrows"] = 2,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["size"] = 22,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 2,
			},
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
				["size"] = 13,
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
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["size"] = 22,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 2,
			},
		},
		["player"] = {
			["partyNumber"] = 1,
			["debuffs"] = {
				["size"] = 25,
			},
			["portrait"] = 1,
			["scale"] = 1.09,
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
				["width"] = 20,
			},
			["threat"] = 1,
			["portrait3D"] = 1,
			["pvpIcon"] = 1,
			["showRunes"] = 1,
			["threatMode"] = "portraitFrame",
			["energyTicker"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["values"] = 1,
			["buffs"] = {
				["maxrows"] = 2,
				["count"] = 40,
				["size"] = 25,
				["rows"] = 2,
				["wrap"] = 1,
				["cooldown"] = 1,
				["flash"] = 1,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["tooltip"] = {
			["enable"] = 1,
			["enableBuffs"] = 1,
			["modifier"] = "all",
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
				["enable"] = 1,
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
		["pet"] = {
			["threat"] = 1,
			["portrait"] = 1,
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 20,
			},
			["scale"] = 1.03,
			["portrait3D"] = 1,
			["buffs"] = {
				["enable"] = 1,
				["maxrows"] = 2,
				["size"] = 18,
			},
			["values"] = 1,
			["castBar"] = {
				["enable"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["name"] = 1,
			["hitIndicator"] = 1,
			["happiness"] = {
				["enabled"] = 1,
				["flashWhenSad"] = 1,
				["onlyWhenSad"] = 1,
			},
			["level"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["size"] = {
				["enable"] = 1,
				["size"] = 20,
				["width"] = 32,
			},
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
			["hitIndicator"] = 1,
			["target"] = {
				["enable"] = 1,
				["size"] = 120,
				["large"] = 1,
			},
			["buffs"] = {
				["maxrows"] = 2,
				["castable"] = 0,
				["enable"] = 1,
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
		["Sin'Dorei"] = {
			["Lossena"] = {
				["XPerl_Focus"] = {
					["top"] = 877.8377746296078,
					["left"] = 216.800001808284,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 665.8377499174311,
					["left"] = 425.5999857734647,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 877.8377886115096,
					["left"] = 414.7000350456239,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 665.8377499174311,
					["left"] = 182.4000119081391,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 665.8377499174311,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 1027.037762404427,
					["left"] = 20.69999883622431,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 665.8377499174311,
					["left"] = 486.4000317550375,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 665.8377499174311,
					["left"] = 243.2000158775188,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 975.5378409535954,
					["left"] = 72.09999063501731,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 665.8377499174311,
					["left"] = 304.0000058428341,
				},
				["XPerl_PetTarget"] = {
					["top"] = 1379.625512314426,
					["left"] = 233.4999636801484,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 917.8378078288666,
					["left"] = 0,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 1029.4378026049,
					["left"] = 412.9999766923979,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 665.8377499174311,
					["left"] = 364.8000238162782,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 665.8377499174311,
					["left"] = 547.2000217203528,
				},
				["XPerl_Target"] = {
					["top"] = 1028.237785185656,
					["left"] = 216.800001808284,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 665.8377499174311,
					["left"] = 60.80000396937969,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 665.8377499174311,
					["left"] = 121.6000079387594,
				},
			},
			["Lossana"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 497.9999619811539,
					["height"] = 250.000011214192,
					["left"] = 508.0000191461815,
					["width"] = 350.0000051968207,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 446.0000008205506,
					["height"] = 124.0000016411013,
					["left"] = 517.9999712807278,
					["width"] = 329.9999958972468,
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
					["top"] = 767.9999764339308,
					["left"] = 433.6000036165679,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 459.0000086157817,
					["height"] = 149.9999997264831,
					["left"] = 613.000041711324,
					["width"] = 139.9999950766962,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 607.9999782675197,
					["left"] = 414.6999860314,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 767.9999764339308,
					["left"] = 187.399967043821,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 767.9999764339308,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 146.2000473020293,
					["left"] = 19.70000496214149,
				},
				["XPerl_OptionsAnchor"] = {
					["top"] = 717.0001040731723,
					["height"] = 540.0000060173713,
					["left"] = 289.4998396507299,
					["width"] = 770.9999856403639,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 767.9999764339308,
					["left"] = 497.4000562893045,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 767.9999764339308,
					["left"] = 250.2000314902342,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 66.54408310157641,
					["left"] = 34.51851657422917,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 767.9999764339308,
					["left"] = 61.8000132017998,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 767.9999764339308,
					["left"] = 309.0001290272888,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 503.9999682720421,
					["height"] = 240.0000065644051,
					["left"] = 432.9999580151591,
					["width"] = 500.0000224283841,
				},
				["XPerl_PetTarget"] = {
					["top"] = 994.1429541168537,
					["left"] = 233.4999881872603,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 584.9999603867461,
					["left"] = 0,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 767.9999764339308,
					["left"] = 561.2001089620412,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 767.9999764339308,
					["left"] = 370.8000091904768,
				},
				["XPerl_Focus"] = {
					["top"] = 607.9999556694105,
					["left"] = 216.800001808284,
				},
				["XPerl_Target"] = {
					["top"] = 174.4549928584545,
					["left"] = 293.2600760581558,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 102.6000042974553,
					["left"] = 419.0000529014264,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 767.9999764339308,
					["left"] = 124.5999586136655,
				},
			},
		},
	},
	["ConfigVersion"] = "3.0.8",
}
XPerlConfigSavePerCharacter = nil
