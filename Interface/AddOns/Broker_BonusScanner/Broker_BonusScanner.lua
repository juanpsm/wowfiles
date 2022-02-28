-- Embeds & stuff, create DO etc...
local BSBroker = CreateFrame("Frame", "Broker_BonusScanner")
local L = LibStub("AceLocale-3.0"):GetLocale("BonusScanner", true)
local LB = LibStub("AceLocale-3.0"):GetLocale("Broker_BonusScanner", true)
BSBroker.obj = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("Broker_BonusScanner", {type = "data source", label = "BonusScanner", icon = "Interface\\Icons\\Spell_Nature_EnchantArmor.blp", text = LB["(Updating...)"]})
local libdbicon = LibStub("LibDBIcon-1.0", true)
LibStub("AceHook-3.0"):Embed(BSBroker)

BSBroker:RegisterEvent("ADDON_LOADED") -- registered for initialization when loaded after PLAYER_LOGIN
BSBroker:RegisterEvent("PLAYER_LOGIN") -- registered for initialization when loaded before PLAYER_LOGIN

BSBroker:SetScript("OnEvent", function(_, event, ...)
	BSBroker[event](BSBroker, ...)
end)

-- local variables go here

local _G = getfenv(0)
local BSVersion = GetAddOnMetadata("BonusScanner", "Version")
local bonuses, AverageiLvl, GRed, GYellow, GBlue, GPrismatic = {}, 0, 0, 0, 0, 0

local BONUSSCANNER_EFFECTS = {
	{ effect = "STR", cat = "ATT" },
	{ effect = "AGI", cat = "ATT" },
	{ effect = "STA",	cat = "ATT" },
	{ effect = "INT",	cat = "ATT" },
	{ effect = "SPI",	cat = "ATT" },
	{ effect = "ARMOR", cat = "ATT" },

	{ effect = "ARCANERES", cat = "RES" },
	{ effect = "FIRERES", cat = "RES" },
	{ effect = "NATURERES", cat = "RES" },
	{ effect = "FROSTRES", cat = "RES" },
	{ effect = "SHADOWRES", cat = "RES" },

	{ effect = "DEFENSE", pformat="%d pt", cat = "SKILL" },
	{ effect = "EXPERTISE", pformat="%d pt", cat = "SKILL" },
	{ effect = "FISHING",	cat = "SKILL" },
	{ effect = "HERBALISM", cat = "SKILL" },
	{ effect = "MINING", cat = "SKILL" },
	{ effect = "SKINNING", cat = "SKILL" },
  
	{ effect = "ATTACKPOWER", cat = "BON" },
	{ effect = "ATTACKPOWERUNDEAD", cat = "BON" },
	{ effect = "ATTACKPOWERFERAL", cat = "BON" },
	{ effect = "ARMORPEN", pformat="%.2f%%", cat = "BON" },
	{ effect = "BLOCK", pformat="%.2f%%",	cat = "BON" },
  { effect = "BLOCKVALUE", cat = "BON" },
  { effect = "CRIT", pformat="%.2f%%", cat = "BON" },
  { effect = "DODGE", pformat="%.2f%%", cat = "BON" },
	{ effect = "HASTE",	pformat="%.2f%%",	cat = "BON" },
	{ effect = "TOHIT", pformat="%.2f%%",	cat = "BON" },
	{ effect = "RANGEDHIT", pformat="%.2f%%",	cat = "BON" },
	{ effect = "PARRY", pformat="%.2f%%", cat = "BON" },
	{ effect = "RANGEDATTACKPOWER", cat = "BON" },
  { effect = "RANGEDCRIT", pformat="%.2f%%", cat = "BON" },
  { effect = "RANGEDDMG", cat = "BON" },
	{ effect = "RESILIENCE", pformat="%.2f%%", cat = "BON" },
	{ effect = "DMGWPN", cat = "BON" },
	{ effect = "DPSMAIN", cat = "BON" },
	{ effect = "DPSRANGED", cat = "BON" },
	{ effect = "DPSTHROWN", cat = "BON" },
	
	{ effect = "DMGUNDEAD",	cat = "SBON" },	
	{ effect = "SPELLPOW", cat = "SBON" },
  --{ effect = "HOLYCRIT", pformat="%.2f%%", cat = "SBON" },
	{ effect = "SPELLPEN", cat = "SBON" },
	{ effect = "ARCANEDMG", cat = "SBON" },
	{ effect = "FIREDMG", cat = "SBON" },
	{ effect = "FROSTDMG", cat = "SBON" },
	{ effect = "HOLYDMG", cat = "SBON" },
	{ effect = "NATUREDMG", cat = "SBON" },
	{ effect = "SHADOWDMG", cat = "SBON" },

	{ effect = "HEALTH", cat = "OBON" },
	{ effect = "HEALTHREG",	cat = "OBON" },
	{ effect = "MANA", cat = "OBON" },
	{ effect = "MANAREG",	cat = "OBON" },
	
	{ effect = "THREATREDUCTION",	cat = "EBON" },
	{ effect = "THREATINCREASE",	cat = "EBON" },
	{ effect = "INCRCRITDMG",	cat = "EBON" },
	{ effect = "SPELLREFLECT",	cat = "EBON" },
	{ effect = "STUNRESIST",	cat = "EBON" },
	{ effect = "PERCINT",	cat = "EBON" },
	{ effect = "PERCBLOCKVALUE",	cat = "EBON" },
	
	{ effect = "PERCARMOR",	cat = "EBON" },
	{ effect = "PERCMANA",	cat = "EBON" },
	{ effect = "PERCREDSPELLDMG",	cat = "EBON" },
	{ effect = "PERCSNARE",	cat = "EBON" },
	{ effect = "PERCSILENCE",	cat = "EBON" },
	{ effect = "PERCFEAR",	cat = "EBON" },
	{ effect = "PERCSTUN",	cat = "EBON" },
	{ effect = "PERCCRITHEALING",	cat = "EBON" },
}

-- helper functions
local function BSBroker_TableContainsValue(table, value)
	if table and value then
		local i,v
		for i, v in pairs(table) do
			if v == value then
				return i;
			end
		end
	end
	return nil
end

local function BSBroker_GetAuthor()
	return GetAddOnMetadata("Broker_BonusScanner", "Author") or LB["Not available"]
end

local function BSBroker_GetCategory()
	return GetAddOnMetadata("Broker_BonusScanner", "X-Category") or LB["Not available"]
end

local function BSBroker_GetEmail()
	return GetAddOnMetadata("Broker_BonusScanner", "X-Email") or LB["Not available"]
end

local function BSBroker_GetVersion()
	return tostring(GetAddOnMetadata("Broker_BonusScanner", "Version")) or LB["Not available"]
end

-- Ace3 configuration tables

local generaloptions = {
	name = "Broker BonusScanner",
	type = "group", 
	args = {
		confdesc = {
			name = LB["LDB data feed to display item bonuses, based on BonusScanner addon."].."\n",
			order = 1, type = "description", cmdHidden = true
		},
		showminimapbutton = {
			order = 2, type = "toggle", width = "full",
			name = LB["Show minimap button"],
			desc = LB["Enables the minimap button, for users lacking a proper LDB display. This option will nullify button/block functionality."],
			get = function() return not BonusScannerBrokerConfig.minimap.hide end,
			set = function(_,v) BonusScannerBrokerConfig.minimap.hide = not(v)
				if BonusScannerBrokerConfig.minimap.hide then
					libdbicon:Hide("Broker_BonusScanner")
				else
					libdbicon:Show("Broker_BonusScanner")
				end
			end,
			disabled = function() if libdbicon then return false end
				return true
			end
		},
		nulloption1 = {
			order = 3,
			type = "description",
			name = "   ",
			cmdHidden = true
		},
		confinfodesc = {
		name = LB["About"],
		type = "group", inline = true,
		args = {
		confversiondesc = {
			order = 1,
			type = "description",			
			name = "|cffffd700"..LB["Version"]..": ".._G["GREEN_FONT_COLOR_CODE"]..BSBroker_GetVersion().."|r",
			cmdHidden = true
		},
		confauthordesc = {
			order = 2,
			type = "description",
			name = "|cffffd700"..LB["Author"]..": ".."|cffff8c00"..BSBroker_GetAuthor().."|r",
			cmdHidden = true
		},		
		confcatdesc = {
			order = 3,
			type = "description",
			name = "|cffffd700"..LB["Category"]..": ".._G["HIGHLIGHT_FONT_COLOR_CODE"]..BSBroker_GetCategory().."|r",
			cmdHidden = true
		},
		confemaildesc = {
			order = 4,
			type = "description",
			name = "|cffffd700"..LB["Email"]..": ".._G["HIGHLIGHT_FONT_COLOR_CODE"]..BSBroker_GetEmail().."|r",
			cmdHidden = true
		},		
	 }
	 }				
	},
}	
	
local buttonoptions = {
	name = "BonusScanner "..LB["Button"],
	type = "group",
	args = {
		confdesc = {
			order = 1,
			type = "description",
			name = LB["Configure 'watched' bonus categories and general button/block look and feel."].."\n",
			cmdHidden = true
		},
		selectbuttonbonuses = {
			order = 2, type = "select", width = "double",
			name = LB["Item Bonuses List"],
			desc = LB["Enables you to select the bonus(es) you want 'watched' on the plugin's button."],
			get = function() return BonusScannerBrokerConfig.AddBonusToButton end,
			set = function(_,v) BonusScannerBrokerConfig.AddBonusToButton = v end,
			values = function()
			local bonuslist = {}
			local index,value
			for index,value in pairs(L["BONUSSCANNER_NAMES"]) do
				local temp = tostring(index)
				bonuslist[index] = _G["GREEN_FONT_COLOR_CODE"]..value.."|r"
			end
			return bonuslist
			end
		},		
		addwatchedbonus = {
			order = 3, type = "execute",
			name = LB["Add Bonus"],
			desc = LB["Adds selected bonus type to the 'watched' bonuses on the plugin's button. You may only have 4 bonuses 'watched' at any time."],
			func = function()
				local index
				local counter = #BonusScannerBrokerConfig.ButtonBonuses
					if counter < 4 and not BSBroker_TableContainsValue(BonusScannerBrokerConfig.ButtonBonuses, BonusScannerBrokerConfig.AddBonusToButton) then				
					 table.insert(BonusScannerBrokerConfig.ButtonBonuses, BonusScannerBrokerConfig.AddBonusToButton)
					 BSBroker:ButtonUpdate()
					end
				end,
		},
		removebuttonbonuses = {
			order = 4, type = "select", width = "double",
			name = LB["Watched Bonuses List"],
			desc = LB["Enables you to select the bonus(es) you want to remove from the 'watched' list on the plugin's button."],
			get = function() 
				local index
					if BonusScannerBrokerConfig.RemoveBonusFromButton == "" or not BSBroker_TableContainsValue(BonusScannerBrokerConfig.ButtonBonuses, BonusScannerBrokerConfig.RemoveBonusFromButton) then 
						for _,index in pairs(BonusScannerBrokerConfig.ButtonBonuses) do
							if index then BonusScannerBrokerConfig.RemoveBonusFromButton = index break end
						end
					end
					return BonusScannerBrokerConfig.RemoveBonusFromButton
			 end,
			set = function(_,v) BonusScannerBrokerConfig.RemoveBonusFromButton = v end,
			values = function()
			local bonuslist = {}
			local index
			for _,index in pairs(BonusScannerBrokerConfig.ButtonBonuses) do
				local temp = tostring(index)
				bonuslist[index] = _G["GREEN_FONT_COLOR_CODE"]..L["BONUSSCANNER_NAMES"][index].."|r"				
			end
			return bonuslist
			end
		},
		removewatchedbonus = {
			order = 5, type = "execute",
			name = LB["Remove Bonus"],
			desc = LB["Removes selected bonus type from the 'watched' bonuses on the plugin's button."],
			func = function()
			local value = BSBroker_TableContainsValue(BonusScannerBrokerConfig.ButtonBonuses, BonusScannerBrokerConfig.RemoveBonusFromButton)
				if value then 
					table.remove(BonusScannerBrokerConfig.ButtonBonuses, value)
					BSBroker:ButtonUpdate()
				end
			end,
		},
		removeallwatchedbonuses = {
			order = 6, type = "execute",
			name = LB["Remove All"],
			desc = LB["Removes all the selected bonuses from the 'watched' bonuses on the plugin's button."],
			func = function()
					local k;
					for k in pairs(BonusScannerBrokerConfig.ButtonBonuses) do
						BonusScannerBrokerConfig.ButtonBonuses[k] = nil
					end
					BSBroker:ButtonUpdate()
			end,
		},
		nulloption1 = {
			order = 7,
			type = "description",
			name = "   ",
			cmdHidden = true
		},
		showratingsbutton = {
			order = 8, type = "toggle", width = "full",
			name = LB["Convert combat ratings to percentages"],
			desc = LB["Enabling this option will automatically convert combat rating bonuses to percentages, on the button/block."],
			get = function() return BonusScannerBrokerConfig.ShowRatingsButton end,
			set = function(_,v) BonusScannerBrokerConfig.ShowRatingsButton = v
			BSBroker:ButtonUpdate()
			end,	
		},
		shortlabelsbutton = {
			order = 9, type = "toggle", width = "full",
			name = LB["Use short labels for bonus titles"],
			desc = LB["This option will enable short labels (bonus ID's) on the button/block instead of full names."],
			get = function() return BonusScannerBrokerConfig.ShortLabelsButton end,
			set = function(_,v) BonusScannerBrokerConfig.ShortLabelsButton = v 
			BSBroker:ButtonUpdate()
			end,
		},
		hideallbonuslabels = {
			order = 10, type = "toggle", width = "full",
			name = LB["Hide watched bonuses"],
			desc = LB["This option hides all bonus text from the button, leaving the icon as the only visual element."],
			get = function() return BonusScannerBrokerConfig.HideBonusesButton end,
			set = function(_,v) BonusScannerBrokerConfig.HideBonusesButton = v 
			BSBroker:ButtonUpdate()
			end,
		},
	},
}		

local tooltipoptions = {
	name = "BonusScanner "..LB["Tooltip"],
	childGroups = "tab", type = "group",
	args = {
		general = {
			name = LB["General"],
			order = 1, type = "group",
			args = {
				header = {			
					name = LB["Configure bonuses shown and general tooltip look and feel. Click on the various bonus category tabs, to configure specific elements of the tooltip."].."\n",
					order = 1, type = "description", cmdHidden = true
				},
				nulloption1 = {
					order = 2,
					type = "description",
					name = "   ",
					cmdHidden = true
				},
				showaverageilvl = {
					order = 3, type = "toggle", width = "full",
					name = LB["Display average item level"],
					desc = LB["Enabling this option will add a line to the tooltip, containing the average item level of your equipped items (shirt and tabard are excluded from the calculation)."],
					get = function() return BonusScannerBrokerConfig.ShowAverageiLvl end,
					set = function(_,v) BonusScannerBrokerConfig.ShowAverageiLvl = v					
					end,	
				},
				showratingsbutton = {
					order = 4, type = "toggle", width = "full",
					name = LB["Append percentages to combat ratings"],
					desc = LB["Enabling this option will append the equivalent percentages next to combat ratings, on the tooltip."],
					get = function() return BonusScannerBrokerConfig.ShowRatingsTooltip end,
					set = function(_,v) BonusScannerBrokerConfig.ShowRatingsTooltip = v					
					end,	
				},
				showgemcount = {
					order = 5, type = "toggle", width = "full",
					name = LB["Display gem count summary"],
					desc = LB["Enabling this option will add a summary of gem colors and type(s) to the tooltip, for your equipped items."],
					get = function() return BonusScannerBrokerConfig.ShowGems end,
					set = function(_,v) BonusScannerBrokerConfig.ShowGems = v					
					end,	
				},				
			},
		},
		confinfodescatt = {
				name = L["BONUSSCANNER_CAT_ATT"],
				type = "group", order = 2,
				args = {
					header = {			
					name = LB["Toggle to show or hide bonuses on the tooltip."].."\n",
					order = 1, type = "description", cmdHidden = true
				},
				nulloption2 = {
					order = 2,
					type = "description",
					name = "   ",
					cmdHidden = true
				},
					strength = {
						order = 3, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["STR"],						
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["STR"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["STR"] = v end,							
					},
					agility = {
						order = 4, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["AGI"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["AGI"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["AGI"] = v end,							
					},
					stamina = {
						order = 5, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["STA"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["STA"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["STA"] = v end,							
					},
					intellect = {
						order = 6, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["INT"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["INT"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["INT"] = v end,							
					},
					spirit = {
						order = 7, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["SPI"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["SPI"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["SPI"] = v end,							
					},
					armor = {
						order = 8, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["ARMOR"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["ARMOR"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["ARMOR"] = v end,							
					},					
				},
			},
			confinfodescres = {
				name = L["BONUSSCANNER_CAT_RES"],
				type = "group", order = 3,
				args = {
					header = {			
					name = LB["Toggle to show or hide bonuses on the tooltip."].."\n",
					order = 1, type = "description", cmdHidden = true
				},
				nulloption3 = {
					order = 2,
					type = "description",
					name = "   ",
					cmdHidden = true
				},
					arcaneres = {
						order = 3, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["ARCANERES"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["ARCANERES"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["ARCANERES"] = v end,							
					},
					fireres = {
						order = 4, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["FIRERES"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["FIRERES"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["FIRERES"] = v end,							
					},
					natureres = {
						order = 5, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["NATURERES"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["NATURERES"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["NATURERES"] = v end,							
					},
					frostres = {
						order = 6, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["FROSTRES"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["FROSTRES"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["FROSTRES"] = v end,							
					},
					shadowres = {
						order = 7, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["SHADOWRES"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["SHADOWRES"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["SHADOWRES"] = v end,							
					},					
				},
			},	
			confinfodescskills = {
				name = L["BONUSSCANNER_CAT_SKILL"],
				type = "group", order = 4,
				args = {
					header = {			
					name = LB["Toggle to show or hide bonuses on the tooltip."].."\n",
					order = 1, type = "description", cmdHidden = true
				},
				nulloption4 = {
					order = 2,
					type = "description",
					name = "   ",
					cmdHidden = true
				},
					fishing = {
						order = 3, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["FISHING"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["FISHING"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["FISHING"] = v end,							
					},
					mining = {
						order = 4, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["MINING"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["MINING"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["MINING"] = v end,							
					},
					herbalism = {
						order = 5, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["HERBALISM"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["HERBALISM"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["HERBALISM"] = v end,							
					},
					skinning = {
						order = 6, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["SKINNING"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["SKINNING"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["SKINNING"] = v end,							
					},
					defense = {
						order = 7, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["DEFENSE"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["DEFENSE"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["DEFENSE"] = v end,							
					},
					expertise = {
						order = 8, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["EXPERTISE"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["EXPERTISE"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["EXPERTISE"] = v end,							
					},										
				},
			},	
			confinfodescmeleeranged = {
				name = L["BONUSSCANNER_CAT_BON"],
				type = "group", order = 5,
				args = {
					header = {			
					name = LB["Toggle to show or hide bonuses on the tooltip."].."\n",
					order = 1, type = "description", cmdHidden = true
				},
				nulloption5 = {
					order = 2,
					type = "description",
					name = "   ",
					cmdHidden = true
				},
					attackpower = {
						order = 3, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["ATTACKPOWER"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["ATTACKPOWER"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["ATTACKPOWER"] = v end,							
					},
					attackpowerundead = {
						order = 4, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["ATTACKPOWERUNDEAD"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["ATTACKPOWERUNDEAD"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["ATTACKPOWERUNDEAD"] = v end,							
					},
					attackpowerferal = {
						order = 5, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["ATTACKPOWERFERAL"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["ATTACKPOWERFERAL"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["ATTACKPOWERFERAL"] = v end,							
					},
					rap = {
						order = 6, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["RANGEDATTACKPOWER"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["RANGEDATTACKPOWER"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["RANGEDATTACKPOWER"] = v end,							
					},
					hit = {
						order = 7, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["TOHIT"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["TOHIT"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["TOHIT"] = v end,							
					},
					rangedhit = {
						order = 8, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["RANGEDHIT"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["RANGEDHIT"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["RANGEDHIT"] = v end,							
					},
					crit = {
						order = 9, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["CRIT"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["CRIT"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["CRIT"] = v end,							
					},
					rangedcrit = {
						order = 10, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["RANGEDCRIT"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["RANGEDCRIT"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["RANGEDCRIT"] = v end,							
					},
					haste = {
						order = 11, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["HASTE"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["HASTE"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["HASTE"] = v end,							
					},
					blockrating = {
						order = 12, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["BLOCK"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["BLOCK"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["BLOCK"] = v end,							
					},
					blockvalue = {
						order = 13, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["BLOCKVALUE"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["BLOCKVALUE"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["BLOCKVALUE"] = v end,							
					},
					dodge = {
						order = 14, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["DODGE"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["DODGE"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["DODGE"] = v end,							
					},
					parry = {
						order = 15, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["PARRY"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["PARRY"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["PARRY"] = v end,							
					},
					resilience = {
						order = 16, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["RESILIENCE"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["RESILIENCE"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["RESILIENCE"] = v end,							
					},
					dmgwpn = {
						order = 17, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["DMGWPN"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["DMGWPN"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["DMGWPN"] = v end,							
					},
					rangeddmg = {
						order = 18, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["RANGEDDMG"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["RANGEDDMG"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["RANGEDDMG"] = v end,							
					},
					armorpen = {
						order = 19, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["ARMORPEN"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["ARMORPEN"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["ARMORPEN"] = v end,							
					},
					dpsmain = {
						order = 20, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["DPSMAIN"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["DPSMAIN"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["DPSMAIN"] = v end,							
					},
					dpsranged = {
						order = 21, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["DPSRANGED"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["DPSRANGED"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["DPSRANGED"] = v end,							
					},
					dpsthrown = {
						order = 22, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["DPSTHROWN"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["DPSTHROWN"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["DPSTHROWN"] = v end,							
					},
				},
			},	
		  confinfodescspow = {
				name = L["BONUSSCANNER_CAT_SBON"],
				type = "group", order = 6,
				args = {
					header = {			
					name = LB["Toggle to show or hide bonuses on the tooltip."].."\n",
					order = 1, type = "description", cmdHidden = true
				},
				nulloption6 = {
					order = 2,
					type = "description",
					name = "   ",
					cmdHidden = true
				},
					dmgundead = {
						order = 3, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["DMGUNDEAD"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["DMGUNDEAD"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["DMGUNDEAD"] = v end,							
					},
					arcanedmg = {
						order = 4, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["ARCANEDMG"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["ARCANEDMG"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["ARCANEDMG"] = v end,							
					},
					firedmg = {
						order = 5, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["FIREDMG"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["FIREDMG"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["FIREDMG"] = v end,							
					},
					frostdmg = {
						order = 6, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["FROSTDMG"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["FROSTDMG"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["FROSTDMG"] = v end,							
					},
					holydmg = {
						order = 7, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["HOLYDMG"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["HOLYDMG"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["HOLYDMG"] = v end,							
					},
					naturedmg = {
						order = 8, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["NATUREDMG"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["NATUREDMG"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["NATUREDMG"] = v end,							
					},
					shadowdmg = {
						order = 9, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["SHADOWDMG"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["SHADOWDMG"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["SHADOWDMG"] = v end,							
					},
					spellpen = {
						order = 10, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["SPELLPEN"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["SPELLPEN"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["SPELLPEN"] = v end,							
					},
					spellpower = {
						order = 11, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["SPELLPOW"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["SPELLPOW"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["SPELLPOW"] = v end,							
					},
				},
			},
		  confinfodescregen = {
				name = L["BONUSSCANNER_CAT_OBON"],
				type = "group", order = 7,
				args = {
					header = {			
					name = LB["Toggle to show or hide bonuses on the tooltip."].."\n",
					order = 1, type = "description", cmdHidden = true
				},
				nulloption7 = {
					order = 2,
					type = "description",
					name = "   ",
					cmdHidden = true
				},
					healthreg = {
						order = 3, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["HEALTHREG"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["HEALTHREG"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["HEALTHREG"] = v end,							
					},
					manareg = {
						order = 4, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["MANAREG"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["MANAREG"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["MANAREG"] = v end,							
					},
					health = {
						order = 5, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["HEALTH"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["HEALTH"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["HEALTH"] = v end,							
					},
					mana = {
						order = 6, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["MANA"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["MANA"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["MANA"] = v end,							
					},
				},
			},
			confinfodescspecial = {
				name = L["BONUSSCANNER_CAT_EBON"],
				type = "group", order = 8,
				args = {
					header = {			
					name = LB["Toggle to show or hide bonuses on the tooltip."].."\n",
					order = 1, type = "description", cmdHidden = true
				},
				nulloption8 = {
					order = 2,
					type = "description",
					name = "   ",
					cmdHidden = true
				},
					threatreduction = {
						order = 3, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["THREATREDUCTION"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["THREATREDUCTION"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["THREATREDUCTION"] = v end,							
					},
					increasedthreat = {
						order = 4, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["THREATINCREASE"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["THREATINCREASE"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["THREATINCREASE"] = v end,							
					},
					increasedcritdmg = {
						order = 5, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["INCRCRITDMG"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["INCRCRITDMG"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["INCRCRITDMG"] = v end,							
					},
					spellreflect = {
						order = 6, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["SPELLREFLECT"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["SPELLREFLECT"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["SPELLREFLECT"] = v end,							
					},					
					stunresist = {
						order = 7, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["STUNRESIST"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["STUNRESIST"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["STUNRESIST"] = v end,							
					},
					percint = {
						order = 8, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["PERCINT"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["PERCINT"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["PERCINT"] = v end,							
					},
					percblockvalue = {
						order = 9, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["PERCBLOCKVALUE"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["PERCBLOCKVALUE"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["PERCBLOCKVALUE"] = v end,							
					},
					percarmor = {
						order = 10, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["PERCARMOR"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["PERCARMOR"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["PERCARMOR"] = v end,							
					},
					percmana = {
						order = 11, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["PERCMANA"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["PERCMANA"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["PERCMANA"] = v end,						
					},
					percredspelldmg = {
						order = 12, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["PERCREDSPELLDMG"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["PERCREDSPELLDMG"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["PERCREDSPELLDMG"] = v end,							
					},
					percsnare = {
						order = 13, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["PERCSNARE"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["PERCSNARE"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["PERCSNARE"] = v end,							
					},
					percsilence = {
						order = 14, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["PERCSILENCE"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["PERCSILENCE"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["PERCSILENCE"] = v end,							
					},
					percfear = {
						order = 15, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["PERCFEAR"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["PERCFEAR"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["PERCFEAR"] = v end,							
					},
					percstun = {
						order = 16, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["PERCSTUN"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["PERCSTUN"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["PERCSTUN"] = v end,							
					},
					perccrithealing = {
						order = 17, type = "toggle", width = "full",
						name = L["BONUSSCANNER_NAMES"]["PERCCRITHEALING"],
						get = function() return BonusScannerBrokerConfig.TooltipBonuses["PERCCRITHEALING"] end,							
						set = function(_,v) BonusScannerBrokerConfig.TooltipBonuses["PERCCRITHEALING"] = v end,							
					},
				},
			},
		},	
	}	

-- Add configuration to Blizzard menu
LibStub("AceConfig-3.0"):RegisterOptionsTable("Broker BonusScanner", generaloptions)
LibStub("AceConfig-3.0"):RegisterOptionsTable("Broker BonusScanner Button", buttonoptions)
LibStub("AceConfig-3.0"):RegisterOptionsTable("Broker BonusScanner Tooltip", tooltipoptions)
LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Broker BonusScanner", "Broker BonusScanner")
LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Broker BonusScanner Button", "BonusScanner "..LB["Button"], "Broker BonusScanner")
LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Broker BonusScanner Tooltip", "BonusScanner "..LB["Tooltip"], "Broker BonusScanner")

function BSBroker:ADDON_LOADED(addon)
-- this should only fire if the addon is loaded *after* the player logs in
-- we forward to the proper function for initialization
-- and force an update afterwards
	if addon == "Broker_BonusScanner" then
		self:PLAYER_LOGIN()
		self:Update()
	end
end

function BSBroker:PLAYER_LOGIN()
	-- initialize default savedvar configuration
if not BonusScannerBrokerConfig then
    	BonusScannerBrokerConfig = { 			
			ButtonBonuses = {},
			TooltipBonuses = {
			["STR"] = true,
			["AGI"] = true,
			["STA"] = true,
			["INT"] = true,
			["SPI"] = true,
	    ["ARMOR"] = true,
			["ARCANERES"] = true,
			["FIRERES"] = true,
			["NATURERES"] = true,
			["FROSTRES"] = true,
			["SHADOWRES"] = true,
			["FISHING"] = true,
			["MINING"] = true,
			["HERBALISM"] = true,
			["SKINNING"] = true,
			["DEFENSE"] = true,
			["EXPERTISE"] = true,
			["BLOCK"] = true,
			["BLOCKVALUE"] = true,
			["DODGE"] = true,
			["PARRY"] = true,
			["RESILIENCE"] = true,
			["DMGWPN"] = true,
			["RANGEDDMG"] = true,
			["ARMORPEN"] = true,
			["DPSMAIN"] = true,
			["DPSRANGED"] = true,
			["DPSTHROWN"] = true,
			["ATTACKPOWER"] = true,
			["ATTACKPOWERUNDEAD"] = true,
			["ATTACKPOWERFERAL"] = true,
			["RANGEDATTACKPOWER"] = true,
			["CRIT"] = true,
			["RANGEDCRIT"] = true,
			["TOHIT"] = true,
			["RANGEDHIT"] = true,
			["HASTE"] = true,
			["DMGUNDEAD"] = true,
			["ARCANEDMG"] = true,
			["FIREDMG"] = true,
			["FROSTDMG"] = true,
			["HOLYDMG"] = true,
			["NATUREDMG"] = true,
			["SHADOWDMG"] = true,
			["SPELLPEN"] = true,
  		["SPELLPOW"] = true,
			["HEALTHREG"] = true,
			["MANAREG"] = true,
			["HEALTH"] = true,
			["MANA"] = true,
  		["THREATREDUCTION"] = true,
  		["THREATINCREASE"] = true,
  		["INCRCRITDMG"] = true,
  		["SPELLREFLECT"] = true,
  		["STUNRESIST"] = true,
  		["PERCINT"] = true,
  		["PERCBLOCKVALUE"] = true,
  		["PERCARMOR"] = true,
  		["PERCMANA"] = true,
  		["PERCREDSPELLDMG"] = true,
  		["PERCSNARE"] = true,
  		["PERCSILENCE"] = true,
  		["PERCFEAR"] = true,
  		["PERCSTUN"] = true,
  		["PERCCRITHEALING"] = true
			},
			ShowRatingsButton = false,
			ShowRatingsTooltip = false,
			ShortLabelsButton = false,
			ShowGems = true,
			ShowAverageiLvl = true,
			AddBonusToButton = "STR",
			RemoveBonusFromButton = "",						
      }
 end
 
 -- 1.1 savedvars
 if not BonusScannerBrokerConfig.HideBonusesButton then BonusScannerBrokerConfig.HideBonusesButton = false end
 
 -- register plugin with LibDBicon and show minimap icon
	if libdbicon then
 		BonusScannerBrokerConfig.minimap = BonusScannerBrokerConfig.minimap or {}
		libdbicon:Register("Broker_BonusScanner", BSBroker.obj, BonusScannerBrokerConfig.minimap)
		if BonusScannerBrokerConfig.minimap.hide then
			libdbicon:Hide("Broker_BonusScanner")
		else
			libdbicon:Show("Broker_BonusScanner")
		end
	end
 
 if self:IsEventRegistered("ADDON_LOADED") then self:UnregisterEvent("ADDON_LOADED") end
 if self:IsEventRegistered("PLAYER_LOGIN") then self:UnregisterEvent("PLAYER_LOGIN") self.PLAYER_LOGIN = nil end
end

function BSBroker:Update()
	bonuses = BonusScanner.bonuses or {}
	AverageiLvl = BonusScanner.AverageiLvl or 0
	GRed = BonusScanner.GemsRed or 0
	GYellow = BonusScanner.GemsYellow or 0
	GBlue = BonusScanner.GemsBlue or 0
	GPrismatic = BonusScanner.GemsPrismatic or 0
	self:ButtonUpdate()
end

function BSBroker:ButtonUpdate()
	if BonusScannerBrokerConfig.HideBonusesButton then self.obj.text = "" return end -- if watched bonuses are hidden, reset text and exit function
	local buttonlabel,i,e = ""	
	local buttonlist = {}
	if #BonusScannerBrokerConfig.ButtonBonuses > 0 then		
			for _,i in pairs(BonusScannerBrokerConfig.ButtonBonuses) do
				-- handle titles
				if BonusScannerBrokerConfig.ShortLabelsButton then
					table.insert(buttonlist, "|cffffd200"..i..":|r".." ")
				else
					table.insert(buttonlist, "|cffffd200"..L["BONUSSCANNER_NAMES"][i]..":|r".." ")
				end
				--handle bonuses
				if bonuses[i] then											
					if BonusScannerBrokerConfig.ShowRatingsButton then
						for _,e in pairs (BONUSSCANNER_EFFECTS) do
							if e.effect == i and e.pformat then							
								local level = UnitLevel("player")
								local specialrating, normalrating = BonusScanner:ProcessSpecialBonus (i, bonuses[i], level)									
										if specialrating ~= "" then
										table.insert(buttonlist, specialrating.."  ") -- specialrating is already formatted
									else
										table.insert(buttonlist, format(e.pformat, normalrating).."  ") -- we have to format normalrating
									end
							elseif e.effect == i and not e.pformat then
								table.insert(buttonlist, tostring(bonuses[i]).."  ")
						  end
						end
					else
						table.insert(buttonlist, tostring(bonuses[i]).."  ")
					end					
				else					
					table.insert(buttonlist, "0 ")
				end				
			end		
	end
	
	if table.getn(buttonlist) == 0 then
		buttonlabel = LB["Nothing Watched"]
	else		
		for _, i in pairs(buttonlist) do
			buttonlabel = buttonlabel..i
		end
	end
	
	self.obj.text = buttonlabel
end

function BSBroker.obj.OnTooltipShow(tooltip)
	local e,i, specialrating, normalrating
	local cat = ""	
	local level = UnitLevel("player")
	
	tooltip:AddLine(_G["HIGHLIGHT_FONT_COLOR_CODE"].."BonusScanner")
	
	-- Handle average item level (BonusScanner version 4.5 and above)
	if  BSVersion >= "4.5" and BonusScannerBrokerConfig.ShowAverageiLvl then
		tooltip:AddLine(" ")
		tooltip:AddDoubleLine("|cffeda55f"..L["BONUSSCANNER_AVERAGE_ILVL_LABEL"]..":",_G["LIGHTYELLOW_FONT_COLOR_CODE"]..AverageiLvl)		
	end
	
	if not next(bonuses) then
		tooltip:AddLine(" ")
		tooltip:AddLine(L["BONUSSCANNER_NOBONUS_LABEL"])
		return
	end
	
	-- Handle bonuses and categories
		for _,e in pairs (BONUSSCANNER_EFFECTS) do
	  	if bonuses[e.effect] and BonusScannerBrokerConfig.TooltipBonuses[e.effect] then			
				if e.cat ~= cat then
					cat = e.cat;
					tooltip:AddLine(" ")
					tooltip:AddLine(_G["GREEN_FONT_COLOR_CODE"]..L["BONUSSCANNER_CAT_"..cat]..":".."|r")				
				end
				--handle rating conversion here
				if e.pformat and BonusScannerBrokerConfig.ShowRatingsTooltip then
					specialrating, normalrating = BonusScanner:ProcessSpecialBonus (e.effect, bonuses[e.effect], level);
				 		if specialrating == "" then
				 			specialrating = " ("..format(e.pformat,normalrating)..")"
				  	end
				  tooltip:AddDoubleLine(L["BONUSSCANNER_NAMES"][e.effect] .. ":", _G["HIGHLIGHT_FONT_COLOR_CODE"].. bonuses[e.effect].."|r".._G["LIGHTYELLOW_FONT_COLOR_CODE"]..specialrating)
				else
					tooltip:AddDoubleLine(L["BONUSSCANNER_NAMES"][e.effect] .. ":", _G["HIGHLIGHT_FONT_COLOR_CODE"].. bonuses[e.effect])			
				end
	  	end
		end
	
	-- Handle Gems (BonusScanner version 3.2 and above)
	
	if (GRed ~= 0 or GYellow ~= 0 or GBlue ~= 0 or GPrismatic ~= 0) and BSVersion >= "3.2" and BonusScannerBrokerConfig.ShowGems then
		tooltip:AddLine(" ")
		tooltip:AddLine(_G["GREEN_FONT_COLOR_CODE"]..L["BONUSSCANNER_CAT_GEMS"]..":".."|r")	
		if GRed ~= 0 then
			tooltip:AddDoubleLine(L["BONUSSCANNER_GEMCOUNT_LABEL"].._G["RED_FONT_COLOR_CODE"]..L["BONUSSCANNER_GEMRED_LABEL"]..":", _G["HIGHLIGHT_FONT_COLOR_CODE"]..GRed)
		end
		if GYellow ~= 0 then
			tooltip:AddDoubleLine(L["BONUSSCANNER_GEMCOUNT_LABEL"].._G["LIGHTYELLOW_FONT_COLOR_CODE"]..L["BONUSSCANNER_GEMYELLOW_LABEL"]..":", _G["HIGHLIGHT_FONT_COLOR_CODE"]..GYellow)
		end	
		if GBlue ~= 0 then
			tooltip:AddDoubleLine(L["BONUSSCANNER_GEMCOUNT_LABEL"].."|cff2459ff"..L["BONUSSCANNER_GEMBLUE_LABEL"]..":", _G["HIGHLIGHT_FONT_COLOR_CODE"]..GBlue)
		end
		if GPrismatic ~= 0 then
			tooltip:AddDoubleLine(L["BONUSSCANNER_GEMCOUNT_LABEL"].._G["HIGHLIGHT_FONT_COLOR_CODE"]..L["BONUSSCANNER_GEMPRISM_LABEL"]..":", _G["HIGHLIGHT_FONT_COLOR_CODE"]..GPrismatic)
		end
	end
end

function BSBroker.obj.OnClick(self, button)
	if button == "RightButton" then		
		InterfaceOptionsFrame_OpenToCategory("Broker BonusScanner")
	end
end

BSBroker:SecureHook("BonusScanner_Update", "Update")