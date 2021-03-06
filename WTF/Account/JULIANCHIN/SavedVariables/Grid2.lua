
Grid2DB = {
	["profile-current"] = {
		["Skombrow - WoWArg"] = "account-druid-tree",
	},
	["setup-flat"] = {
		["statuses"] = {
			["account-druid-tree"] = {
				["health-deficit"] = "account",
				["debuff-Magic"] = "account",
				["role"] = "account",
				["buff-Rejuv-mine"] = "druid",
				["target"] = "account",
				["buff-Drink"] = "account",
				["heals-incoming"] = "account",
				["debuff-DominateMind"] = "account",
				["buff-SpiritOfRedemption"] = "account",
				["threat"] = "account",
				["buff-WildGrowth-mine"] = "druid",
				["buff-AbolishPoison-mine"] = "druid",
				["buff-Thorns"] = "druid",
				["name"] = "account",
				["death"] = "account",
				["ready-check"] = "account",
				["pvp"] = "account",
				["debuff-HarvestSoul"] = "account",
				["mana"] = "account",
				["voice"] = "account",
				["debuff-Disease"] = "account",
				["feign-death"] = "account",
				["debuff-UnchainedMagic"] = "account",
				["classcolor"] = "account",
				["vehicle"] = "account",
				["health-current"] = "account",
				["buff-Regrowth-mine"] = "druid",
				["charmed"] = "account",
				["buff-Lifebloom-mine"] = "druid",
				["debuff-UnboundPlague"] = "account",
				["buff-Food"] = "account",
				["debuff-Poison"] = "account",
				["debuff-PlagueSickness"] = "account",
				["debuff-BoilingBlood"] = "account",
				["debuff-MysticBuffet"] = "account",
				["health-low"] = "account",
				["range"] = "account",
				["raid-debuffs"] = "account",
				["debuff-Curse"] = "account",
				["offline"] = "account",
				["debuff-Inoculated"] = "account",
				["lowmana"] = "account",
			},
		},
		["indicators"] = {
			["account-druid-tree"] = {
				["corner-top-left"] = "druid",
				["side-top"] = "druid",
				["center-right"] = "druid",
				["text-down"] = "account",
				["border"] = "account",
				["corner-top-right-color"] = "druid",
				["text-down-color"] = "account",
				["side-top-color"] = "druid",
				["icon-center"] = "account",
				["heals"] = "account",
				["corner-top-right"] = "druid",
				["heals-color"] = "account",
				["alpha"] = "account",
				["text-name-color"] = "account",
				["side-right-bottom"] = "druid",
				["center-left"] = "druid",
				["corner-top-left-color"] = "druid",
				["health"] = "account",
				["corner-bottom-left"] = "account",
				["text-name"] = "account",
				["health-color"] = "account",
				["side-bottom"] = "account",
			},
		},
		["locations"] = {
			["account-druid-tree"] = {
				["center-bottom"] = "account",
				["side-top"] = "account",
				["center-right"] = "account",
				["side-left-bottom"] = "druid",
				["side-left-top"] = "druid",
				["center-top"] = "account",
				["center"] = "account",
				["side-right"] = "account",
				["side-left"] = "account",
				["side-right-bottom"] = "druid",
				["side-bottom-right"] = "account",
				["center-left"] = "account",
				["corner-bottom-right"] = "account",
				["name"] = "account",
				["side-bottom-left"] = "account",
				["corner-bottom-left"] = "account",
				["corner-top-left"] = "account",
				["corner-top-right"] = "account",
				["side-bottom"] = "account",
			},
		},
		["statusMap"] = {
			["account-druid-tree"] = {
				["corner-top-left"] = "druid",
				["side-top"] = "druid",
				["center-right"] = "druid",
				["text-down"] = "account",
				["border"] = "account",
				["corner-top-right-color"] = "druid",
				["text-down-color"] = "account",
				["side-top-color"] = "druid",
				["icon-center"] = "account",
				["heals"] = "account",
				["corner-top-right"] = "druid",
				["heals-color"] = "account",
				["alpha"] = "account",
				["text-name-color"] = "account",
				["side-bottom"] = "druid",
				["center-left"] = "druid",
				["corner-top-left-color"] = "druid",
				["health"] = "account",
				["corner-bottom-left"] = "account",
				["text-name"] = "account",
				["health-color"] = "account",
				["side-right-bottom"] = "druid",
			},
		},
	},
	["namespaces"] = {
		["Grid2_StatusRaidDebuffs"] = {
			["profiles"] = {
				["profile"] = {
				},
			},
		},
		["Grid2Layout"] = {
			["profiles"] = {
				["profile"] = {
					["ScaleSize"] = 1.15,
					["anchor"] = "TOPLEFT",
					["PosY"] = -84.00015277248781,
					["Padding"] = 0,
					["Spacing"] = 0,
					["horizontal"] = false,
					["PosX"] = 390.9999434173021,
				},
			},
		},
		["GridRange"] = {
		},
		["Grid2Frame"] = {
			["profiles"] = {
				["profile"] = {
					["invertBarColor"] = true,
				},
			},
		},
		["Grid2Blink"] = {
		},
	},
	["versions"] = {
		["druid"] = {
			["Grid2Options"] = 1,
		},
		["globals"] = {
		},
		["Grid2Options"] = 1,
		["tree"] = {
			["Grid2Options"] = 0,
		},
		["Grid2StatusRaidDebuffsOptions"] = 1,
	},
	["profiles"] = {
		["profile"] = {
		},
	},
	["objects"] = {
		["statuses"] = {
			["druid"] = {
				["buff-AbolishPoison-mine"] = {
					["type"] = "buff",
					["color1"] = {
						["a"] = 1,
						["b"] = 0.6,
						["g"] = 1,
						["r"] = 0.9,
					},
					["blinkThreshold"] = 3,
					["mine"] = true,
					["spellName"] = 2893,
				},
				["buff-Thorns"] = {
					["missing"] = true,
					["type"] = "buff",
					["color1"] = {
						["a"] = 1,
						["b"] = 0.05,
						["g"] = 0.05,
						["r"] = 0.2,
					},
					["spellName"] = 467,
				},
				["buff-Rejuv-mine"] = {
					["color1"] = {
						["a"] = 1,
						["b"] = 0.6,
						["g"] = 0,
						["r"] = 1,
					},
					["type"] = "buff",
					["mine"] = true,
					["spellName"] = 774,
				},
				["buff-Lifebloom-mine"] = {
					["color2"] = {
						["a"] = 1,
						["b"] = 0.6,
						["g"] = 0.9,
						["r"] = 0.6,
					},
					["type"] = "buff",
					["color3"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["color1"] = {
						["a"] = 1,
						["b"] = 0.2,
						["g"] = 0.7,
						["r"] = 0.2,
					},
					["colorCount"] = 3,
					["mine"] = true,
					["spellName"] = 33763,
				},
				["buff-WildGrowth-mine"] = {
					["color1"] = {
						["a"] = 1,
						["b"] = 0.2,
						["g"] = 0.9,
						["r"] = 0.2,
					},
					["type"] = "buff",
					["mine"] = true,
					["spellName"] = 53248,
				},
				["buff-Regrowth-mine"] = {
					["color1"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 1,
						["r"] = 0.5,
					},
					["type"] = "buff",
					["mine"] = true,
					["spellName"] = 8936,
				},
			},
			["tree"] = {
			},
			["account"] = {
				["health-deficit"] = {
					["threshold"] = 0.2,
					["type"] = "health-deficit",
				},
				["debuff-Magic"] = {
					["type"] = "debuffType",
					["subType"] = "Magic",
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 0.6,
						["r"] = 0.2,
					},
				},
				["role"] = {
					["color2"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 0.5,
					},
					["type"] = "role",
					["color1"] = {
						["a"] = 1,
						["b"] = 0.5,
						["g"] = 1,
						["r"] = 1,
					},
					["colorCount"] = 2,
				},
				["target"] = {
					["color1"] = {
						["a"] = 1,
						["b"] = 0.8,
						["g"] = 0.8,
						["r"] = 0.8,
					},
					["type"] = "target",
				},
				["raid-debuffs"] = {
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 0.5,
						["r"] = 1,
					},
					["type"] = "raid-debuffs",
				},
				["heals-incoming"] = {
					["flags"] = 23,
					["type"] = "heals-incoming",
					["includePlayerHeals"] = true,
					["color1"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
				},
				["debuff-DominateMind"] = {
					["type"] = "debuff",
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 0,
						["r"] = 0.5,
					},
					["spellName"] = 71289,
				},
				["buff-SpiritOfRedemption"] = {
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["type"] = "buff",
					["blinkThreshold"] = 3,
					["spellName"] = 27827,
				},
				["threat"] = {
					["color2"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 0.5,
					},
					["type"] = "threat",
					["color3"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["color1"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["colorCount"] = 3,
				},
				["name"] = {
					["type"] = "name",
				},
				["death"] = {
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["type"] = "death",
				},
				["ready-check"] = {
					["threshold"] = 10,
					["type"] = "ready-check",
					["color4"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 0,
						["r"] = 1,
					},
					["color1"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["color2"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
					["color3"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["colorCount"] = 4,
				},
				["pvp"] = {
					["color1"] = {
						["a"] = 0.75,
						["b"] = 1,
						["g"] = 1,
						["r"] = 0,
					},
					["type"] = "pvp",
				},
				["debuff-HarvestSoul"] = {
					["type"] = "debuff",
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 0,
						["r"] = 0.5,
					},
					["spellName"] = 68980,
				},
				["mana"] = {
					["type"] = "mana",
				},
				["range"] = {
					["elapsed"] = 0.1,
					["type"] = "range",
					["default"] = 0.25,
					["range"] = 40,
				},
				["debuff-Disease"] = {
					["type"] = "debuffType",
					["subType"] = "Disease",
					["color1"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0.4,
						["r"] = 0.6,
					},
				},
				["feign-death"] = {
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 0.5,
						["r"] = 1,
					},
					["type"] = "feign-death",
				},
				["debuff-UnchainedMagic"] = {
					["type"] = "debuff",
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 0,
						["r"] = 0.5,
					},
					["spellName"] = 69762,
				},
				["classcolor"] = {
					["type"] = "classcolor",
					["colors"] = {
						["UNKNOWN_UNIT"] = {
							["a"] = 1,
							["b"] = 0.5,
							["g"] = 0.5,
							["r"] = 0.5,
						},
						["Humanoid"] = {
							["a"] = 1,
							["b"] = 0.84705882352941,
							["g"] = 0.67450980392157,
							["r"] = 0.91764705882353,
						},
						["PALADIN"] = {
							["a"] = 1,
							["b"] = 0.73,
							["g"] = 0.55,
							["r"] = 0.96,
						},
						["MAGE"] = {
							["a"] = 1,
							["b"] = 0.94,
							["g"] = 0.8,
							["r"] = 0.41,
						},
						["Demon"] = {
							["a"] = 1,
							["b"] = 0.68627450980392,
							["g"] = 0.25490196078431,
							["r"] = 0.54509803921569,
						},
						["DRUID"] = {
							["a"] = 1,
							["b"] = 0.04,
							["g"] = 0.49,
							["r"] = 1,
						},
						["DEATHKNIGHT"] = {
							["a"] = 1,
							["b"] = 0.23,
							["g"] = 0.12,
							["r"] = 0.77,
						},
						["Elemental"] = {
							["a"] = 1,
							["b"] = 0.9,
							["g"] = 0.3,
							["r"] = 0.1,
						},
						["PRIEST"] = {
							["a"] = 1,
							["b"] = 1,
							["g"] = 1,
							["r"] = 1,
						},
						["HUNTER"] = {
							["a"] = 1,
							["b"] = 0.45,
							["g"] = 0.83,
							["r"] = 0.67,
						},
						["UNKNOWN_PET"] = {
							["a"] = 1,
							["b"] = 0,
							["g"] = 1,
							["r"] = 0,
						},
						["WARLOCK"] = {
							["a"] = 1,
							["b"] = 0.79,
							["g"] = 0.51,
							["r"] = 0.58,
						},
						["HOSTILE"] = {
							["a"] = 1,
							["b"] = 0.1,
							["g"] = 0.1,
							["r"] = 1,
						},
						["ROGUE"] = {
							["a"] = 1,
							["b"] = 0.41,
							["g"] = 0.96,
							["r"] = 1,
						},
						["SHAMAN"] = {
							["a"] = 1,
							["b"] = 0.87,
							["g"] = 0.44,
							["r"] = 0,
						},
						["Beast"] = {
							["a"] = 1,
							["b"] = 0.27843137254902,
							["g"] = 0.75686274509804,
							["r"] = 0.93725490196078,
						},
						["WARRIOR"] = {
							["a"] = 1,
							["b"] = 0.43,
							["g"] = 0.61,
							["r"] = 0.78,
						},
					},
					["colorHostile"] = true,
				},
				["vehicle"] = {
					["color1"] = {
						["a"] = 0.75,
						["b"] = 1,
						["g"] = 1,
						["r"] = 0,
					},
					["type"] = "vehicle",
				},
				["health-current"] = {
					["type"] = "health-current",
					["color1"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
				},
				["charmed"] = {
					["color1"] = {
						["a"] = 1,
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 1,
					},
					["type"] = "charmed",
				},
				["debuff-UnboundPlague"] = {
					["type"] = "debuff",
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 0,
						["r"] = 0.5,
					},
					["spellName"] = 70911,
				},
				["debuff-Poison"] = {
					["type"] = "debuffType",
					["subType"] = "Poison",
					["color1"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0.6,
						["r"] = 0,
					},
				},
				["buff-Drink"] = {
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 0.8,
						["r"] = 0.8,
					},
					["type"] = "buff",
					["mine"] = true,
					["spellName"] = "Drink",
				},
				["offline"] = {
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["type"] = "offline",
				},
				["voice"] = {
					["color1"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["type"] = "voice",
				},
				["debuff-MysticBuffet"] = {
					["type"] = "debuff",
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 0,
						["r"] = 0.5,
					},
					["spellName"] = 70127,
				},
				["health-low"] = {
					["threshold"] = 0.4,
					["type"] = "health-low",
					["color1"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
				},
				["debuff-BoilingBlood"] = {
					["type"] = "debuff",
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 0,
						["r"] = 0.5,
					},
					["spellName"] = 72442,
				},
				["debuff-PlagueSickness"] = {
					["type"] = "debuff",
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 0,
						["r"] = 0.5,
					},
					["spellName"] = 73117,
				},
				["debuff-Curse"] = {
					["type"] = "debuffType",
					["subType"] = "Curse",
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 0,
						["r"] = 0.6,
					},
				},
				["buff-Food"] = {
					["color1"] = {
						["a"] = 1,
						["b"] = 0.6,
						["g"] = 1,
						["r"] = 1,
					},
					["type"] = "buff",
					["mine"] = true,
					["spellName"] = "Food",
				},
				["debuff-Inoculated"] = {
					["type"] = "debuff",
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 0,
						["r"] = 0.5,
					},
					["spellName"] = 72103,
				},
				["lowmana"] = {
					["threshold"] = 0.75,
					["type"] = "lowmana",
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 0,
						["r"] = 0,
					},
				},
			},
		},
		["indicators"] = {
			["druid"] = {
				["corner-top-left"] = {
					["font"] = "Friz Quadrata TT",
					["type"] = "text",
					["duration"] = true,
					["location"] = "corner-top-left",
					["level"] = 9,
					["textlength"] = 12,
					["fontSize"] = 8,
				},
				["side-top"] = {
					["font"] = "Friz Quadrata TT",
					["type"] = "text",
					["duration"] = true,
					["location"] = "side-top",
					["level"] = 9,
					["textlength"] = 12,
					["fontSize"] = 8,
				},
				["center-right"] = {
					["fontSize"] = 8,
					["location"] = "center-right",
					["level"] = 9,
					["type"] = "icon",
					["size"] = 16,
				},
				["corner-top-right"] = {
					["font"] = "Friz Quadrata TT",
					["type"] = "text",
					["duration"] = true,
					["location"] = "corner-top-right",
					["level"] = 9,
					["textlength"] = 12,
					["fontSize"] = 8,
				},
				["corner-top-right-color"] = {
					["type"] = "text-color",
				},
				["corner-top-left-color"] = {
					["type"] = "text-color",
				},
				["center-left"] = {
					["fontSize"] = 8,
					["location"] = "center-left",
					["level"] = 9,
					["type"] = "icon",
					["size"] = 16,
				},
				["side-top-color"] = {
					["type"] = "text-color",
				},
				["side-right-bottom"] = {
					["location"] = "side-right-bottom",
					["type"] = "square",
					["level"] = 5,
					["size"] = 5,
				},
			},
			["tree"] = {
			},
			["account"] = {
				["heals"] = {
					["type"] = "bar",
					["location"] = "center",
					["level"] = 1,
					["color1"] = {
						["a"] = 0,
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["texture"] = "Gradient",
				},
				["text-down"] = {
					["font"] = "Friz Quadrata TT",
					["type"] = "text",
					["location"] = "center-bottom",
					["level"] = 7,
					["textlength"] = 12,
					["fontSize"] = 8,
				},
				["heals-color"] = {
					["type"] = "bar-color",
				},
				["border"] = {
					["color1"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["type"] = "border",
				},
				["text-name-color"] = {
					["type"] = "text-color",
				},
				["icon-center"] = {
					["fontSize"] = 8,
					["location"] = "center",
					["level"] = 8,
					["type"] = "icon",
					["size"] = 16,
				},
				["alpha"] = {
					["color1"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["type"] = "alpha",
				},
				["health"] = {
					["type"] = "bar",
					["location"] = "center",
					["level"] = 2,
					["color1"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["texture"] = "Gradient",
				},
				["text-down-color"] = {
					["type"] = "text-color",
				},
				["corner-bottom-left"] = {
					["type"] = "square",
					["location"] = "corner-bottom-left",
					["level"] = 5,
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["size"] = 5,
				},
				["text-name"] = {
					["font"] = "Friz Quadrata TT",
					["type"] = "text",
					["location"] = "name",
					["level"] = 6,
					["textlength"] = 12,
					["fontSize"] = 8,
				},
				["health-color"] = {
					["type"] = "bar-color",
				},
				["side-bottom"] = {
					["type"] = "square",
					["location"] = "side-bottom",
					["level"] = 5,
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["size"] = 5,
				},
			},
		},
		["locations"] = {
			["druid"] = {
				["side-left-bottom"] = {
					["y"] = 2,
					["relPoint"] = "LEFT",
					["name"] = "side-left-bottom",
					["point"] = "TOP",
					["x"] = 1,
				},
				["side-left-top"] = {
					["y"] = -2,
					["relPoint"] = "LEFT",
					["name"] = "side-left-top",
					["point"] = "BOTTOM",
					["x"] = 1,
				},
				["side-right-bottom"] = {
					["y"] = -2,
					["relPoint"] = "RIGHT",
					["name"] = "side-right-bottom",
					["point"] = "TOPRIGHT",
					["x"] = -1,
				},
			},
			["tree"] = {
			},
			["account"] = {
				["center-bottom"] = {
					["relIndicator"] = "center",
					["relPoint"] = "CENTER",
					["name"] = "center-bottom",
					["point"] = "TOP",
					["y"] = -4,
					["x"] = 0,
				},
				["side-top"] = {
					["y"] = -1,
					["relPoint"] = "TOP",
					["name"] = "side-top",
					["point"] = "TOP",
					["x"] = 0,
				},
				["center-right"] = {
					["relIndicator"] = "center",
					["relPoint"] = "CENTER",
					["name"] = "center-right",
					["point"] = "LEFT",
					["y"] = 0,
					["x"] = 4,
				},
				["side-left"] = {
					["y"] = 0,
					["relPoint"] = "LEFT",
					["name"] = "side-left",
					["point"] = "LEFT",
					["x"] = 2,
				},
				["side-bottom"] = {
					["y"] = 1,
					["relPoint"] = "BOTTOM",
					["name"] = "side-bottom",
					["point"] = "BOTTOM",
					["x"] = 0,
				},
				["corner-top-right"] = {
					["y"] = -1,
					["relPoint"] = "TOPRIGHT",
					["name"] = "corner-top-right",
					["point"] = "TOPRIGHT",
					["x"] = -1,
				},
				["corner-top-left"] = {
					["y"] = -1,
					["relPoint"] = "TOPLEFT",
					["name"] = "corner-top-left",
					["point"] = "TOPLEFT",
					["x"] = 1,
				},
				["side-bottom-right"] = {
					["y"] = 2,
					["relPoint"] = "BOTTOM",
					["name"] = "side-bottom-right",
					["point"] = "LEFT",
					["x"] = 2,
				},
				["center"] = {
					["y"] = 0,
					["relPoint"] = "CENTER",
					["name"] = "center",
					["point"] = "CENTER",
					["x"] = 0,
				},
				["center-top"] = {
					["relIndicator"] = "center",
					["relPoint"] = "CENTER",
					["name"] = "center-top",
					["point"] = "BOTTOM",
					["y"] = 4,
					["x"] = 0,
				},
				["name"] = {
					["y"] = -8,
					["relPoint"] = "TOP",
					["name"] = "name",
					["point"] = "TOP",
					["x"] = 0,
				},
				["side-bottom-left"] = {
					["y"] = 8,
					["relPoint"] = "BOTTOM",
					["name"] = "side-bottom-left",
					["point"] = "RIGHT",
					["x"] = -2,
				},
				["corner-bottom-left"] = {
					["y"] = 1,
					["relPoint"] = "BOTTOMLEFT",
					["name"] = "corner-bottom-left",
					["point"] = "BOTTOMLEFT",
					["x"] = 1,
				},
				["side-right"] = {
					["y"] = 0,
					["relPoint"] = "RIGHT",
					["name"] = "side-right",
					["point"] = "RIGHT",
					["x"] = -2,
				},
				["corner-bottom-right"] = {
					["y"] = 1,
					["relPoint"] = "BOTTOMRIGHT",
					["name"] = "corner-bottom-right",
					["point"] = "BOTTOMRIGHT",
					["x"] = -1,
				},
				["center-left"] = {
					["relIndicator"] = "center",
					["relPoint"] = "CENTER",
					["name"] = "center-left",
					["point"] = "RIGHT",
					["y"] = 0,
					["x"] = -4,
				},
			},
		},
		["statusMap"] = {
			["druid"] = {
				["corner-top-left"] = {
					["buff-Lifebloom-mine"] = 99,
				},
				["side-top"] = {
					["buff-Regrowth-mine"] = 99,
				},
				["center-right"] = {
					["debuff-Curse"] = 80,
					["debuff-PlagueSickness"] = 110,
					["debuff-UnchainedMagic"] = 110,
				},
				["corner-top-right"] = {
					["buff-Rejuv-mine"] = 99,
				},
				["corner-top-right-color"] = {
					["buff-Rejuv-mine"] = 99,
				},
				["corner-top-left-color"] = {
					["buff-Lifebloom-mine"] = 99,
				},
				["side-right-bottom"] = {
					["buff-AbolishPoison-mine"] = 99,
				},
				["center-left"] = {
					["debuff-MysticBuffet"] = 110,
					["debuff-HarvestSoul"] = 110,
					["debuff-Poison"] = 90,
					["debuff-BoilingBlood"] = 110,
					["debuff-UnboundPlague"] = 110,
					["debuff-Inoculated"] = 110,
					["debuff-DominateMind"] = 110,
				},
				["side-top-color"] = {
					["buff-Regrowth-mine"] = 99,
				},
				["side-bottom"] = {
					["buff-WildGrowth-mine"] = 99,
					["buff-Thorns"] = 59,
				},
			},
			["tree"] = {
			},
			["account"] = {
				["heals"] = {
					["heals-incoming"] = 99,
				},
				["text-down"] = {
					["charmed"] = 65,
					["feign-death"] = 96,
					["death"] = 95,
					["vehicle"] = 70,
					["offline"] = 93,
					["role"] = 45,
					["pvp"] = 35,
				},
				["heals-color"] = {
					["heals-incoming"] = 99,
				},
				["border"] = {
					["health-low"] = 69,
					["target"] = 99,
					["pvp"] = 45,
					["voice"] = 89,
					["lowmana"] = 79,
				},
				["text-name-color"] = {
					["classcolor"] = 99,
				},
				["health-color"] = {
					["classcolor"] = 99,
					["health-current"] = 85,
				},
				["health"] = {
					["health-current"] = 99,
				},
				["alpha"] = {
					["offline"] = 97,
					["range"] = 98,
					["death"] = 99,
				},
				["corner-bottom-left"] = {
					["threat"] = 99,
				},
				["text-name"] = {
					["name"] = 99,
				},
				["text-down-color"] = {
					["charmed"] = 65,
					["feign-death"] = 96,
					["death"] = 95,
					["vehicle"] = 70,
					["offline"] = 93,
					["role"] = 45,
					["pvp"] = 35,
				},
				["icon-center"] = {
					["buff-SpiritOfRedemption"] = 160,
					["raid-debuffs"] = 1000,
					["ready-check"] = 150,
					["death"] = 155,
				},
			},
		},
	},
	["setup-layers"] = {
		["statuses"] = {
			["druid"] = {
			},
			["tree"] = {
			},
			["account"] = {
			},
		},
		["indicators"] = {
			["druid"] = {
			},
			["tree"] = {
			},
			["account"] = {
			},
		},
		["locations"] = {
			["druid"] = {
			},
			["tree"] = {
			},
			["account"] = {
			},
		},
		["statusMap"] = {
			["druid"] = {
			},
			["tree"] = {
			},
			["account"] = {
			},
		},
	},
	["profile-available"] = {
		["Skombrow - WoWArg"] = {
		},
	},
	["profileKeys"] = {
		["Skombrow - WoWArg"] = "profile",
	},
}
