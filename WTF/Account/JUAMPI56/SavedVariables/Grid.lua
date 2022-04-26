
GridDB = {
	["namespaces"] = {
		["GridFrame"] = {
			["profiles"] = {
				["char/Arbull - WoWArg"] = {
					["healingBar_intensity"] = 0.35,
					["fontSize"] = 8,
					["statusmap"] = {
						["baricon5"] = {
						},
						["text"] = {
							["alert_offline"] = false,
							["alert_feignDeath"] = false,
							["unit_healthDeficit"] = false,
							["debuff_Ghost"] = false,
							["alert_heals"] = false,
							["alert_death"] = false,
							["unit_health"] = false,
						},
						["border"] = {
							["alert_lowMana"] = false,
							["alert_lowHealth"] = false,
							["alert_aggro"] = true,
						},
						["baricon8"] = {
						},
						["baricon1"] = {
							["buff_PowerWord:Shield"] = false,
							["buff_Regrowth"] = false,
							["buff_Lifebloom"] = true,
						},
						["baricon3"] = {
							["buff_Regrowth"] = false,
							["buff_WildGrowth"] = true,
						},
						["icon"] = {
							["debuff_curse"] = false,
							["debuff_poison"] = false,
							["debuff_magic"] = false,
							["debuff_disease"] = false,
						},
						["baricon9"] = {
						},
						["baricon7"] = {
						},
						["baricon6"] = {
						},
						["baricon4"] = {
							["buff_Regrowth"] = true,
						},
						["baricon2"] = {
							["buff_Rejuvenation"] = true,
						},
					},
					["frameWidth"] = 55,
					["iconSize"] = 11,
					["enableText2"] = true,
					["textlength"] = 15,
					["frameHeight"] = 41,
				},
				["Dps"] = {
					["fontSize"] = 8,
					["statusmap"] = {
						["baricon5"] = {
						},
						["text"] = {
							["alert_feignDeath"] = false,
							["alert_offline"] = false,
							["unit_healthDeficit"] = false,
							["debuff_Ghost"] = false,
							["alert_heals"] = false,
							["alert_death"] = false,
							["unit_health"] = false,
						},
						["baricon9"] = {
						},
						["baricon8"] = {
						},
						["baricon1"] = {
							["debuff_curse"] = true,
							["buff_Lifebloom"] = false,
							["buff_Regrowth"] = false,
							["buff_PowerWord:Shield"] = false,
						},
						["baricon3"] = {
							["alert_death"] = false,
							["buff_Regrowth"] = false,
							["buff_WildGrowth"] = false,
							["debuff_magic"] = true,
						},
						["baricon4"] = {
							["buff_Regrowth"] = false,
							["debuff_poison"] = true,
						},
						["baricon6"] = {
						},
						["baricon7"] = {
						},
						["border"] = {
							["alert_lowMana"] = false,
							["alert_lowHealth"] = false,
							["alert_aggro"] = true,
						},
						["icon"] = {
							["debuff_curse"] = false,
							["debuff_poison"] = false,
							["debuff_disease"] = false,
							["debuff_magic"] = false,
						},
						["baricon2"] = {
							["buff_Rejuvenation"] = false,
							["debuff_magic"] = false,
							["debuff_disease"] = true,
						},
					},
					["enableText2"] = true,
					["frameHeight"] = 32,
					["textlength"] = 15,
					["iconSize"] = 11,
					["orientation"] = "HORIZONTAL",
					["frameWidth"] = 53,
					["healingBar_intensity"] = 0.35,
				},
				["Default"] = {
					["fontSize"] = 9,
					["iconSize"] = 11,
					["textlength"] = 15,
					["frameHeight"] = 37,
					["enableText2"] = true,
					["healingBar_intensity"] = 0.35,
					["frameWidth"] = 57,
					["statusmap"] = {
						["baricon5"] = {
						},
						["baricon9"] = {
						},
						["icon"] = {
							["debuff_curse"] = false,
							["debuff_poison"] = false,
							["debuff_disease"] = false,
							["debuff_magic"] = false,
						},
						["baricon8"] = {
						},
						["text"] = {
							["alert_offline"] = false,
							["alert_feignDeath"] = false,
							["unit_healthDeficit"] = false,
							["debuff_Ghost"] = false,
							["alert_heals"] = false,
							["alert_death"] = false,
							["unit_health"] = false,
						},
						["baricon6"] = {
						},
						["baricon7"] = {
						},
						["baricon1"] = {
							["buff_PowerWord:Shield"] = false,
							["debuff_curse"] = false,
							["buff_Regrowth"] = false,
							["buff_Lifebloom"] = true,
						},
						["baricon3"] = {
							["buff_WildGrowth"] = true,
							["buff_Regrowth"] = false,
							["alert_death"] = false,
							["debuff_magic"] = false,
						},
						["baricon4"] = {
							["buff_Regrowth"] = true,
							["debuff_poison"] = false,
						},
						["border"] = {
							["alert_lowHealth"] = false,
							["alert_lowMana"] = false,
							["alert_aggro"] = true,
						},
						["baricon2"] = {
							["buff_Rejuvenation"] = true,
							["debuff_disease"] = false,
							["debuff_magic"] = false,
						},
					},
				},
			},
		},
		["GridStatusVehicle"] = {
			["profiles"] = {
				["char/Arbull - WoWArg"] = {
				},
			},
		},
		["GridRoster"] = {
			["profiles"] = {
				["char/Arbull - WoWArg"] = {
				},
			},
		},
		["GridStatusAuras"] = {
			["profiles"] = {
				["char/Arbull - WoWArg"] = {
					["buff_Rejuvenation"] = {
						["mine"] = true,
						["duration"] = true,
					},
					["buff_Regrowth"] = {
						["mine"] = true,
						["duration"] = true,
					},
					["buff_Lifebloom"] = {
						["mine"] = true,
						["duration"] = true,
					},
					["buff_WildGrowth"] = {
						["color"] = {
							["a"] = 1,
							["r"] = 0.5,
							["g"] = 0.5,
							["b"] = 0.5,
						},
						["duration"] = true,
						["range"] = false,
						["desc"] = "Buff: Wild Growth",
						["mine"] = true,
						["text"] = "Wild Growth",
						["priority"] = 90,
						["enable"] = true,
						["missing"] = false,
					},
				},
				["Dps"] = {
					["buff_Rejuvenation"] = {
						["mine"] = false,
						["duration"] = true,
					},
					["buff_WildGrowth"] = {
						["text"] = "Wild Growth",
						["enable"] = true,
						["priority"] = 90,
						["missing"] = false,
						["color"] = {
							["a"] = 1,
							["r"] = 0.5,
							["g"] = 0.5,
							["b"] = 0.5,
						},
						["duration"] = false,
						["range"] = false,
						["desc"] = "Buff: Wild Growth",
					},
					["buff_Regrowth"] = {
						["duration"] = true,
					},
				},
				["Default"] = {
					["buff_WildGrowth"] = {
						["missing"] = false,
						["duration"] = true,
						["range"] = false,
						["desc"] = "Buff: Wild Growth",
						["mine"] = true,
						["text"] = "Wild Growth",
						["priority"] = 90,
						["enable"] = true,
						["color"] = {
							["a"] = 1,
							["b"] = 0.5,
							["g"] = 0.5,
							["r"] = 0.5,
						},
					},
					["buff_Rejuvenation"] = {
						["duration"] = true,
						["mine"] = true,
					},
					["buff_Regrowth"] = {
						["missing"] = false,
						["duration"] = true,
						["mine"] = true,
					},
					["buff_Lifebloom"] = {
						["duration"] = true,
						["mine"] = true,
					},
				},
			},
		},
		["GridStatusTarget"] = {
			["profiles"] = {
				["char/Arbull - WoWArg"] = {
				},
			},
		},
		["GridStatusRange"] = {
			["profiles"] = {
				["char/Arbull - WoWArg"] = {
					["frequency"] = 0.3,
					["alert_range_10"] = {
						["color"] = {
							["a"] = 0.8181818181818181,
							["r"] = 0.1,
							["g"] = 0.2,
							["b"] = 0.3,
						},
						["priority"] = 81,
						["enable"] = false,
						["text"] = "10 metros",
						["range"] = false,
						["desc"] = "Más de 10 metros",
					},
					["alert_range_40"] = {
						["color"] = {
							["a"] = 0.2727272727272727,
							["r"] = 0.4,
							["g"] = 0.8,
							["b"] = 0.2,
						},
						["priority"] = 84,
						["enable"] = true,
						["text"] = "40 yards",
						["range"] = false,
						["desc"] = "More than 40 yards away",
					},
					["alert_range_30"] = {
						["color"] = {
							["a"] = 0.4545454545454546,
							["r"] = 0.3,
							["g"] = 0.6,
							["b"] = 0.9,
						},
						["priority"] = 83,
						["enable"] = false,
						["text"] = "30 yards",
						["range"] = false,
						["desc"] = "More than 30 yards away",
					},
					["alert_range_28"] = {
						["color"] = {
							["a"] = 0.490909090909091,
							["r"] = 0.28,
							["g"] = 0.5600000000000001,
							["b"] = 0.84,
						},
						["priority"] = 83,
						["enable"] = true,
						["text"] = "28 metros",
						["range"] = false,
						["desc"] = "Más de 28 metros",
					},
					["alert_range_38"] = {
						["color"] = {
							["a"] = 0.3090909090909091,
							["r"] = 0.38,
							["g"] = 0.76,
							["b"] = 0.14,
						},
						["priority"] = 84,
						["enable"] = true,
						["text"] = "38 metros",
						["range"] = false,
						["desc"] = "Más de 38 metros",
					},
					["alert_range_25"] = {
						["color"] = {
							["a"] = 0.5454545454545454,
							["r"] = 0.25,
							["g"] = 0.5,
							["b"] = 0.75,
						},
						["priority"] = 82,
						["enable"] = true,
						["text"] = "25 yards",
						["range"] = false,
						["desc"] = "More than 25 yards away",
					},
					["alert_range_100"] = {
						["color"] = {
							["a"] = 0.1090909090909091,
							["r"] = 0,
							["g"] = 0,
							["b"] = 0,
						},
						["priority"] = 90,
						["enable"] = false,
						["text"] = "100 metros",
						["range"] = false,
						["desc"] = "Más de 100 metros",
					},
				},
				["Dps"] = {
					["frequency"] = 0.3,
					["alert_range_10"] = {
						["color"] = {
							["a"] = 0.8181818181818181,
							["r"] = 0.1,
							["g"] = 0.2,
							["b"] = 0.3,
						},
						["priority"] = 81,
						["enable"] = false,
						["text"] = "10 metros",
						["range"] = false,
						["desc"] = "Más de 10 metros",
					},
					["alert_range_40"] = {
						["color"] = {
							["a"] = 0.2727272727272727,
							["r"] = 0.4,
							["g"] = 0.8,
							["b"] = 0.2,
						},
						["priority"] = 84,
						["enable"] = true,
						["text"] = "40 yards",
						["range"] = false,
						["desc"] = "More than 40 yards away",
					},
					["alert_range_38"] = {
						["color"] = {
							["a"] = 0.3090909090909091,
							["r"] = 0.38,
							["g"] = 0.76,
							["b"] = 0.14,
						},
						["priority"] = 84,
						["enable"] = true,
						["text"] = "38 metros",
						["range"] = false,
						["desc"] = "Más de 38 metros",
					},
					["alert_range_28"] = {
						["color"] = {
							["a"] = 0.490909090909091,
							["r"] = 0.28,
							["g"] = 0.5600000000000001,
							["b"] = 0.84,
						},
						["priority"] = 83,
						["enable"] = true,
						["text"] = "28 metros",
						["range"] = false,
						["desc"] = "Más de 28 metros",
					},
					["alert_range_30"] = {
						["color"] = {
							["a"] = 0.4545454545454546,
							["r"] = 0.3,
							["g"] = 0.6,
							["b"] = 0.9,
						},
						["priority"] = 83,
						["enable"] = false,
						["text"] = "30 yards",
						["range"] = false,
						["desc"] = "More than 30 yards away",
					},
					["alert_range_25"] = {
						["color"] = {
							["a"] = 0.5454545454545454,
							["r"] = 0.25,
							["g"] = 0.5,
							["b"] = 0.75,
						},
						["priority"] = 82,
						["enable"] = true,
						["text"] = "25 yards",
						["range"] = false,
						["desc"] = "More than 25 yards away",
					},
					["alert_range_100"] = {
						["color"] = {
							["a"] = 0.1090909090909091,
							["r"] = 0,
							["g"] = 0,
							["b"] = 0,
						},
						["priority"] = 90,
						["enable"] = false,
						["text"] = "100 metros",
						["range"] = false,
						["desc"] = "Más de 100 metros",
					},
				},
				["Default"] = {
					["alert_range_10"] = {
						["color"] = {
							["a"] = 0.8181818181818181,
							["b"] = 0.3,
							["g"] = 0.2,
							["r"] = 0.1,
						},
						["priority"] = 81,
						["enable"] = false,
						["text"] = "10 metros",
						["range"] = false,
						["desc"] = "Más de 10 metros",
					},
					["alert_range_38"] = {
						["color"] = {
							["a"] = 0.3090909090909091,
							["b"] = 0.14,
							["g"] = 0.76,
							["r"] = 0.38,
						},
						["priority"] = 84,
						["enable"] = true,
						["text"] = "38 metros",
						["range"] = false,
						["desc"] = "Más de 38 metros",
					},
					["alert_range_25"] = {
						["color"] = {
							["a"] = 0.5454545454545454,
							["b"] = 0.75,
							["g"] = 0.5,
							["r"] = 0.25,
						},
						["priority"] = 82,
						["enable"] = true,
						["text"] = "25 yards",
						["range"] = false,
						["desc"] = "More than 25 yards away",
					},
					["alert_range_40"] = {
						["color"] = {
							["a"] = 0.2727272727272727,
							["b"] = 0.2,
							["g"] = 0.8,
							["r"] = 0.4,
						},
						["priority"] = 84,
						["enable"] = true,
						["text"] = "40 yards",
						["range"] = false,
						["desc"] = "More than 40 yards away",
					},
					["alert_range_28"] = {
						["color"] = {
							["a"] = 0.490909090909091,
							["b"] = 0.84,
							["g"] = 0.5600000000000001,
							["r"] = 0.28,
						},
						["priority"] = 83,
						["enable"] = true,
						["text"] = "28 metros",
						["range"] = false,
						["desc"] = "Más de 28 metros",
					},
					["alert_range_30"] = {
						["color"] = {
							["a"] = 0.4545454545454546,
							["b"] = 0.9,
							["g"] = 0.6,
							["r"] = 0.3,
						},
						["priority"] = 83,
						["enable"] = false,
						["text"] = "30 yards",
						["range"] = false,
						["desc"] = "More than 30 yards away",
					},
					["alert_range_100"] = {
						["color"] = {
							["a"] = 0.1090909090909091,
							["b"] = 0,
							["g"] = 0,
							["r"] = 0,
						},
						["priority"] = 90,
						["enable"] = false,
						["text"] = "100 metros",
						["range"] = false,
						["desc"] = "Más de 100 metros",
					},
					["frequency"] = 0.3,
				},
			},
		},
		["GridIndicatorIconBar"] = {
			["profiles"] = {
				["char/Arbull - WoWArg"] = {
					["scale"] = 0.95,
					["spacing"] = 1,
					["yOffset"] = -3,
				},
				["Dps"] = {
					["scale"] = 0.95,
					["yOffset"] = -3,
					["spacing"] = 1,
				},
				["Default"] = {
					["scale"] = 0.95,
					["yOffset"] = -3,
					["spacing"] = 1,
				},
			},
		},
		["GridStatus"] = {
			["profiles"] = {
				["char/Arbull - WoWArg"] = {
					["colors"] = {
						["DEATHKNIGHT"] = {
							["r"] = 0.7686274509803921,
							["g"] = 0.1215686274509804,
							["b"] = 0.2313725490196079,
						},
						["WARRIOR"] = {
							["r"] = 0.7803921568627451,
							["g"] = 0.611764705882353,
							["b"] = 0.4313725490196079,
						},
						["ROGUE"] = {
							["r"] = 1,
							["g"] = 0.96,
							["b"] = 0.41,
						},
						["MAGE"] = {
							["r"] = 0.41,
							["g"] = 0.8,
							["b"] = 0.94,
						},
						["PRIEST"] = {
							["r"] = 1,
							["g"] = 1,
							["b"] = 1,
						},
						["WARLOCK"] = {
							["r"] = 0.580392156862745,
							["g"] = 0.5098039215686274,
							["b"] = 0.788235294117647,
						},
						["SHAMAN"] = {
							["r"] = 0,
							["g"] = 0.44,
							["b"] = 0.87,
						},
						["DRUID"] = {
							["r"] = 1,
							["g"] = 0.4901960784313725,
							["b"] = 0.0392156862745098,
						},
						["PALADIN"] = {
							["r"] = 0.9607843137254902,
							["g"] = 0.5490196078431373,
							["b"] = 0.7294117647058823,
						},
						["HUNTER"] = {
							["r"] = 0.67,
							["g"] = 0.83,
							["b"] = 0.45,
						},
					},
				},
				["Dps"] = {
					["colors"] = {
						["HUNTER"] = {
							["r"] = 0.67,
							["g"] = 0.83,
							["b"] = 0.45,
						},
						["WARRIOR"] = {
							["r"] = 0.7803921568627451,
							["g"] = 0.611764705882353,
							["b"] = 0.4313725490196079,
						},
						["PALADIN"] = {
							["r"] = 0.9607843137254902,
							["g"] = 0.5490196078431373,
							["b"] = 0.7294117647058823,
						},
						["MAGE"] = {
							["r"] = 0.41,
							["g"] = 0.8,
							["b"] = 0.94,
						},
						["PRIEST"] = {
							["r"] = 1,
							["g"] = 1,
							["b"] = 1,
						},
						["WARLOCK"] = {
							["r"] = 0.580392156862745,
							["g"] = 0.5098039215686274,
							["b"] = 0.788235294117647,
						},
						["DEATHKNIGHT"] = {
							["r"] = 0.7686274509803921,
							["g"] = 0.1215686274509804,
							["b"] = 0.2313725490196079,
						},
						["DRUID"] = {
							["r"] = 1,
							["g"] = 0.4901960784313725,
							["b"] = 0.0392156862745098,
						},
						["ROGUE"] = {
							["r"] = 1,
							["g"] = 0.96,
							["b"] = 0.41,
						},
						["SHAMAN"] = {
							["r"] = 0,
							["g"] = 0.44,
							["b"] = 0.87,
						},
					},
				},
				["Default"] = {
					["colors"] = {
						["HUNTER"] = {
							["b"] = 0.45,
							["g"] = 0.83,
							["r"] = 0.67,
						},
						["ROGUE"] = {
							["b"] = 0.41,
							["g"] = 0.96,
							["r"] = 1,
						},
						["MAGE"] = {
							["b"] = 0.94,
							["g"] = 0.8,
							["r"] = 0.41,
						},
						["DRUID"] = {
							["b"] = 0.0392156862745098,
							["g"] = 0.4901960784313725,
							["r"] = 1,
						},
						["DEATHKNIGHT"] = {
							["b"] = 0.2313725490196079,
							["g"] = 0.1215686274509804,
							["r"] = 0.7686274509803921,
						},
						["PRIEST"] = {
							["b"] = 1,
							["g"] = 1,
							["r"] = 1,
						},
						["WARLOCK"] = {
							["b"] = 0.788235294117647,
							["g"] = 0.5098039215686274,
							["r"] = 0.580392156862745,
						},
						["WARRIOR"] = {
							["b"] = 0.4313725490196079,
							["g"] = 0.611764705882353,
							["r"] = 0.7803921568627451,
						},
						["PALADIN"] = {
							["b"] = 0.7294117647058823,
							["g"] = 0.5490196078431373,
							["r"] = 0.9607843137254902,
						},
						["SHAMAN"] = {
							["b"] = 0.87,
							["g"] = 0.44,
							["r"] = 0,
						},
					},
				},
			},
		},
		["GridStatusAggro"] = {
			["profiles"] = {
				["char/Arbull - WoWArg"] = {
				},
				["Dps"] = {
					["alert_aggro"] = {
						["threatcolors"] = {
							{
								["b"] = 0.4666656414046884,
							}, -- [1]
						},
					},
				},
				["Default"] = {
					["alert_aggro"] = {
						["threatcolors"] = {
							{
								["b"] = 0.4666656414046884,
							}, -- [1]
						},
					},
				},
			},
		},
		["GridStatusHeals"] = {
			["profiles"] = {
				["char/Arbull - WoWArg"] = {
				},
			},
		},
		["GridStatusReadyCheck"] = {
			["profiles"] = {
				["char/Arbull - WoWArg"] = {
				},
			},
		},
		["GridStatusVoiceComm"] = {
			["profiles"] = {
				["char/Arbull - WoWArg"] = {
				},
			},
		},
		["GridLayout"] = {
			["profiles"] = {
				["char/Arbull - WoWArg"] = {
					["anchorRel"] = "TOPLEFT",
					["BorderB"] = 1,
					["layouts"] = {
						["bg"] = "By Group 25",
					},
					["layout"] = "By Group 5",
					["ScaleSize"] = 1.6,
					["Spacing"] = 0,
					["BorderR"] = 1,
					["PosX"] = 0,
					["Padding"] = 0,
					["horizontal"] = true,
					["BorderG"] = 1,
					["PosY"] = -380.6725964956752,
				},
				["Dps"] = {
					["anchorRel"] = "TOPLEFT",
					["BorderB"] = 1,
					["layouts"] = {
						["bg"] = "By Group 25",
					},
					["layout"] = "By Group 5",
					["ScaleSize"] = 1.6,
					["PosY"] = -445.819434552095,
					["BorderR"] = 1,
					["Spacing"] = 0,
					["BorderG"] = 1,
					["Padding"] = 0,
					["horizontal"] = true,
					["PosX"] = 0,
				},
				["Default"] = {
					["anchorRel"] = "TOPLEFT",
					["BorderB"] = 1,
					["layouts"] = {
						["raid"] = "By Group 25",
						["bg"] = "By Group 25",
					},
					["ScaleSize"] = 1.6,
					["BorderR"] = 1,
					["PosX"] = 0,
					["PosY"] = -400.859197041891,
					["layout"] = "By Group 5",
					["BorderG"] = 1,
					["horizontal"] = true,
					["Padding"] = 0,
					["Spacing"] = 0,
				},
			},
		},
		["GridStatusHealth"] = {
			["profiles"] = {
				["char/Arbull - WoWArg"] = {
					["unit_health"] = {
						["deadAsFullHealth"] = false,
					},
				},
				["Dps"] = {
					["unit_health"] = {
						["deadAsFullHealth"] = false,
					},
				},
				["Default"] = {
					["unit_health"] = {
						["deadAsFullHealth"] = false,
					},
				},
			},
		},
		["GridRange"] = {
			["profiles"] = {
				["char/Arbull - WoWArg"] = {
				},
			},
		},
		["GridStatusName"] = {
			["profiles"] = {
				["char/Arbull - WoWArg"] = {
				},
			},
		},
		["GridStatusMana"] = {
			["profiles"] = {
				["char/Arbull - WoWArg"] = {
				},
			},
		},
	},
	["profiles"] = {
		["char/Arbull - WoWArg"] = {
			["minimap"] = {
				["minimapPos"] = 243.2393591437426,
			},
		},
		["Dps"] = {
			["minimap"] = {
				["minimapPos"] = 242.0899221929883,
			},
		},
		["Default"] = {
			["minimap"] = {
				["minimapPos"] = 242.0899221929883,
			},
		},
	},
	["currentProfile"] = {
		["Insect - WoWArg"] = "Dps",
		["Arbull - WoWArg"] = "char",
	},
}
