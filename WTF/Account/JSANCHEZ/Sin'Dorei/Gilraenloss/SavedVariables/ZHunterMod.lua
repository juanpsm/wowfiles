
ZHunterMod_Saved = {
	["ZAspect"] = {
		["perRow"] = 11,
		["spells"] = {
			61846, -- [1]
			34074, -- [2]
			13159, -- [3]
			20043, -- [4]
			13161, -- [5]
			5118, -- [6]
			19506, -- [7]
			19506, -- [8]
			19506, -- [9]
			19506, -- [10]
		},
		["trigger"] = "OnMouseOver",
		["special"] = true,
		["expand"] = "BOTTOM",
		["tooltip"] = true,
		["y"] = 368,
		["x"] = 1685,
		["count"] = 7,
		["roundButton"] = true,
		["enabled"] = true,
		["stack"] = "RIGHT",
		["backgroundColor"] = {
			["b"] = 0.5019607843137255,
			["g"] = 0.1411764705882353,
			["r"] = 0.1098039215686275,
		},
		["size"] = 35,
	},
	["ZAntiDaze"] = {
		["on"] = true,
	},
	["version"] = 1,
	["ZPet"] = {
		["perRow"] = 1,
		["trigger"] = "AlwaysOn",
		["spells"] = {
			62757, -- [1]
			982, -- [2]
			6991, -- [3]
			1513, -- [4]
			1462, -- [5]
			2641, -- [6]
			1515, -- [7]
			1002, -- [8]
		},
		["expand"] = "RIGHT",
		["count"] = 8,
		["y"] = 593,
		["x"] = 1212,
		["roundButton"] = true,
		["tooltip"] = true,
		["enabled"] = false,
		["stack"] = "BOTTOM",
		["backgroundColor"] = {
			["b"] = 0.1568627450980392,
			["g"] = 0.3843137254901961,
			["r"] = 0.5019607843137255,
		},
		["size"] = 37,
	},
	["ZFreezeFail"] = {
		["channelNum"] = 9,
		["party"] = false,
		["playSound"] = true,
		["channel"] = false,
		["raidWarning"] = false,
		["raid"] = false,
		["format"] = "Freeze failed on $player ($type)",
		["yell"] = false,
	},
	["ZTrap"] = {
		["perRow"] = 7,
		["trigger"] = "AlwaysOn",
		["spells"] = {
			5384, -- [1]
			13813, -- [2]
			13795, -- [3]
			1499, -- [4]
			13809, -- [5]
			60192, -- [6]
			34600, -- [7]
		},
		["expand"] = "RIGHT",
		["tooltip"] = false,
		["y"] = 403,
		["x"] = 1109,
		["count"] = 7,
		["roundButton"] = true,
		["enabled"] = false,
		["stack"] = "BOTTOM",
		["backgroundColor"] = {
			["b"] = 0.1019607843137255,
			["g"] = 0,
			["r"] = 0.5019607843137255,
		},
		["size"] = 50,
	},
	["ZAutoShot"] = {
		["on"] = true,
	},
	["ZTrack"] = {
		["perRow"] = 5,
		["trigger"] = "OnMouseOver",
		["spells"] = {
			2580, -- [1]
			1494, -- [2]
			19879, -- [3]
			19883, -- [4]
			19880, -- [5]
			19878, -- [6]
			19884, -- [7]
			19885, -- [8]
			19882, -- [9]
			43308, -- [10]
			2383, -- [11]
			2383, -- [12]
		},
		["expand"] = "BOTTOM",
		["tooltip"] = true,
		["y"] = 323,
		["x"] = 1737,
		["count"] = 10,
		["roundButton"] = true,
		["enabled"] = true,
		["stack"] = "RIGHT",
		["backgroundColor"] = {
			["b"] = 0.09019607843137255,
			["g"] = 0.5019607843137255,
			["r"] = 0.3529411764705882,
		},
		["size"] = 35,
	},
	["ZArcaneDispel"] = {
		["channelNum"] = 9,
		["party"] = false,
		["raidWarning"] = false,
		["channel"] = false,
		["raid"] = false,
		["format"] = ">$spell< removed from $player",
		["condition"] = "dBlessing of Protection\nBlessing of Freedom\nPain Suppression",
		["yell"] = true,
	},
	["ZMisdirect"] = {
		["channelNum"] = 9,
		["party"] = false,
		["format"] = "Misdirecting $player",
		["channel"] = false,
		["raid"] = false,
		["raidWarning"] = false,
		["print"] = true,
		["yell"] = true,
	},
}
