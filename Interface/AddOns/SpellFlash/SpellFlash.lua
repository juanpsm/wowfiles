
local MAXDEBUFFSLOTS = 40

local MELEESPELL = {
	DEATHKNIGHT = (GetSpellInfo(45902--[[Blood Strike]])),
	DRUID = (GetSpellInfo(1082--[[Claw]])),
	HUNTER = (GetSpellInfo(2974--[[Wing Clip]])),
	ROGUE = (GetSpellInfo(1752--[[Sinister Strike]])),
	WARRIOR = (GetSpellInfo(772--[[Rend]])),
}

local GLOBALCOOLDOWNSPELL = {
	DEATHKNIGHT = (GetSpellInfo(45902--[[Blood Strike]])),
	DRUID = (GetSpellInfo(5176--[[Wrath]])),
	HUNTER = (GetSpellInfo(1978--[[Serpent Sting]])),
	MAGE = (GetSpellInfo(133--[[Fireball]])),
	PALADIN = (GetSpellInfo(635--[[Holy Light]])),
	PRIEST = (GetSpellInfo(585--[[Smite]])),
	ROGUE = (GetSpellInfo(1752--[[Sinister Strike]])),
	SHAMAN = (GetSpellInfo(403--[[Lightning Bolt]])),
	WARLOCK = (GetSpellInfo(686--[[Shadow Bolt]])),
	WARRIOR = (GetSpellInfo(6673--[[Battle Shout]])),
}

local IMMUNITYDEBUFFS = {
	(GetSpellInfo(710--[[Banish]])),
	(GetSpellInfo(33786--[[Cyclone]])),
}

local ALTERNATEFORM = {
	[(GetSpellInfo(33943--[[Flight Form]]))] = (GetSpellInfo(40120--[[Swift Flight Form]])),
	[(GetSpellInfo(40120--[[Swift Flight Form]]))] = (GetSpellInfo(33943--[[Flight Form]])),
	[(GetSpellInfo(5487--[[Bear Form]]))] = (GetSpellInfo(9634--[[Dire Bear Form]])),
	[(GetSpellInfo(9634--[[Dire Bear Form]]))] = (GetSpellInfo(5487--[[Bear Form]])),
}


local DEFAULT_FLASH_SIZE_PERCENT = 240

local AddonName, Table = ...
local CLASS = string.gsub(string.upper(select(2,UnitClass("player"))),"[^A-Z]","")
local RACE = string.gsub(string.gsub(string.upper(select(2,UnitRace("player"))),"[^A-Z]",""),"SCOURGE","UNDEAD")
SpellFlashAddon = {}
SpellFlashAddon.CLASS = CLASS
SpellFlashAddon.RACE = RACE
SpellFlashAddon.Castable = {}
SpellFlashAddon.VehicleCastable = {}
SpellFlashAddon.ButtonFrames = {}
SpellFlashAddon.OtherAurasFunctions = {}
SpellFlashAddon.Event = {}
SpellFlashAddon.Spam = {}
local SpellButtons = {}
local MacroButtons = {}
local ItemButtons = {}
local ExtraBar_SpellButtons = {}
local ExtraBar_MacroButtons = {}
local ExtraBar_ItemButtons = {}
local OtherAurasFromSpell = {}
local OtherAurasSpellFromAura = {}
local SPELLDELAY = {}
local OUTSIDEMELEESPELL = nil
local NPC_HIT_SPELLS = {}
local FLASHSIZE = DEFAULT_FLASH_SIZE_PERCENT / 100
local FLASHBRIGHTNESS = 1
local VARIABLES_CHECKED = nil
local BUTTONSREGISTERED = nil
local FRAMESREGISTERED = nil
local TALENTRANK = {}
local TALENTTABPOINTS = {}
local IMMUNEIGNORELIST = {}
local CLASSMODULES = {}
local CLASSMODULENAMES = {}
local CURRENTFORM = nil
local COMBAT = nil
local SERVER = nil
local REALM = nil
local PLAYER = nil
local TIMER = {}
local LOADING = true

local FINDFORM = ShapeshiftButton1:GetScript("OnClick")
local FINDPET = PetActionButton1:GetScript("OnClick")
local FINDVEHICLE = VehicleMenuBarActionButton1:GetScript("OnClick")
local FINDACTION = SecureActionButton_OnClick

local PET_BUTTON_NAME = {
	Attack = "PET_ACTION_ATTACK",
	Follow = "PET_ACTION_FOLLOW",
	Stay = "PET_ACTION_WAIT",
	Aggressive = "PET_MODE_AGGRESSIVE",
	Defensive = "PET_MODE_DEFENSIVE",
	Passive = "PET_MODE_PASSIVE",
}
PET_BUTTON_NAME[PET_ACTION_ATTACK] = "PET_ACTION_ATTACK"
PET_BUTTON_NAME[PET_ACTION_FOLLOW] = "PET_ACTION_FOLLOW"
PET_BUTTON_NAME[PET_ACTION_WAIT] = "PET_ACTION_WAIT"
PET_BUTTON_NAME[PET_MODE_AGGRESSIVE] = "PET_MODE_AGGRESSIVE"
PET_BUTTON_NAME[PET_MODE_DEFENSIVE] = "PET_MODE_DEFENSIVE"
PET_BUTTON_NAME[PET_MODE_PASSIVE] = "PET_MODE_PASSIVE"

local COLORTABLE = {
	white = {1,1,1},
	yellow = {1,1,0},
	purple = {1,0,1},
	blue = {0,0,1},
	orange = {1,0.5,0},
	aqua = {0,1,1},
	green = {0,1,0},
	red = {1,0,0},
	pink = {0.9,0.4,0.4},
}

--[[
SpellFlashAddon.PRIEST
SpellFlashAddon.ROGUE
SpellFlashAddon.PALADIN
SpellFlashAddon.WARLOCK
SpellFlashAddon.WARRIOR
SpellFlashAddon.HUNTER
SpellFlashAddon.MAGE
SpellFlashAddon.SHAMAN
SpellFlashAddon.DRUID
SpellFlashAddon.DEATHKNIGHT
]]
SpellFlashAddon[CLASS] = {}

--[[
SpellFlashAddon.HUMAN
SpellFlashAddon.DWARF
SpellFlashAddon.GNOME
SpellFlashAddon.NIGHTELF
SpellFlashAddon.BLOODELF
SpellFlashAddon.ORC
SpellFlashAddon.UNDEAD
SpellFlashAddon.TAUREN
SpellFlashAddon.TROLL
SpellFlashAddon.DRAENEI
]]
SpellFlashAddon[RACE] = {}


local function CheckVariables()
	if not PLAYER then
		PLAYER = UnitName("player")
		if not PLAYER then
			--Character name not available yet
			SpellFlashAddon.ReplaceTimer("CheckVariables-InternalSpellFlashAddon", 1)
			return
		end
	end
	if not REALM then
		REALM = GetCVar("realmName")
	end
	if not SERVER then
		SERVER = string.lower(GetCVar("realmList"))
	end
	if not SpellFlashAddonConfig or ( SpellFlashAddonConfig.LastVersion or 0 ) < 3.33 then
		SpellFlashAddonConfig = {}
	end
	if not SpellFlashAddonConfig.SERVER then
		SpellFlashAddonConfig.SERVER = {}
	end
	if not SpellFlashAddonConfig.SERVER[SERVER] then
		SpellFlashAddonConfig.SERVER[SERVER] = {}
	end
	if not SpellFlashAddonConfig.SERVER[SERVER].REALM then
		SpellFlashAddonConfig.SERVER[SERVER].REALM = {}
	end
	if not SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM] then
		SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM] = {}
	end
	if not SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER then
		SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER = {}
	end
	if not SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER] then
		SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER] = {}
	end
	if not SpellFlashAddonConfig.SERVER[SERVER].Immune then
		SpellFlashAddonConfig.SERVER[SERVER].Immune = {}
	end
	if not SpellFlashAddonConfig.SERVER[SERVER].Immune[CLASS] then
		SpellFlashAddonConfig.SERVER[SERVER].Immune[CLASS] = {}
	end
	if not SpellFlashAddonConfig.SERVER[SERVER].ImmuneIgnore then
		SpellFlashAddonConfig.SERVER[SERVER].ImmuneIgnore = {}
	end
	if not string.find(SERVER, "%.worldofwarcraft%.com$") then
		SpellFlashAddon.disable_debuff_owner_checking = not SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].debuff_owner_checking
	end
	FLASHSIZE = (SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].flash_size_percent or DEFAULT_FLASH_SIZE_PERCENT) / 100
	FLASHBRIGHTNESS = (SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].flash_brightness_percent or 100) / 100
	SpellFlashAddon.auto_mob_immune_detection_off = SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].auto_mob_immune_detection_off
	SpellFlashAddon.debug_on = SpellFlashAddonConfig.debug_on
	SpellFlashAddon.full_debug_mode = SpellFlashAddonConfig.full_debug_mode
	SpellFlashAddonConfig.LastVersion = tonumber(GetAddOnMetadata(AddonName, "X-Revision"))
	VARIABLES_CHECKED = 1
end

function SpellFlashAddon.GetPlayerConfig(config)
	return SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER][config]
end

function SpellFlashAddon.SetPlayerConfig(config, value)
	SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER][config] = value
end

local function RunSpam()
	local ActiveEnemy = SpellFlashAddon.IsActiveEnemy()
	local NoCC = ActiveEnemy or not SpellFlashAddon.IsNoDamageCC()
	local PetAlive = UnitHealth("pet") > 0
	local PetActiveEnemy = PetAlive and SpellFlashAddon.IsActiveEnemy("pettarget")
	local inInstance, instanceType = IsInInstance()
	for n,v in pairs(SpellFlashAddon.Spam) do
		if not SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER][n..".spell_flashing_off"] and (
			not CLASSMODULES[n] or SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].selected_class_module == n or SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].use_all_class_modules
		) then
			if type(v) == "function" then
				v(NoCC, ActiveEnemy, PetAlive, PetActiveEnemy, instanceType)
			elseif type(v) == "table" then
				local s = SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER][n..".script_number"] or 1
				if type(v[s]) == "table" and type(v[s].Function) == "function" then
					v[s].Function(NoCC, ActiveEnemy, PetAlive, PetActiveEnemy, instanceType)
				elseif type(v[1]) == "table" and type(v[1].Function) == "function" then
					SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER][n..".script_number"] = nil
					v[1].Function(NoCC, ActiveEnemy, PetAlive, PetActiveEnemy, instanceType)
				end
			end
		end
	end
end

local function SetSpam()
	if not SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].spell_flashing_off then
		if not SpellFlashAddon.IsTimer("Spam-repeat-InternalSpellFlashAddon") then
			SpellFlashAddon.SetTimer("Spam-repeat-InternalSpellFlashAddon", 0, 0.2, RunSpam)
		end
	else
		SpellFlashAddon.ClearTimer("Spam-repeat-InternalSpellFlashAddon")
	end
end

local function RegisterOtherAuras()
	OtherAurasFromSpell = {}
	for i,v in ipairs(SpellFlashAddon.OtherAurasFunctions) do
		v()
	end
	OtherAurasSpellFromAura = {}
	for Spell,t in pairs(OtherAurasFromSpell) do
		for Aura,v in pairs(t) do
			if not OtherAurasSpellFromAura[Aura] then
				OtherAurasSpellFromAura[Aura] = {}
			end
			OtherAurasSpellFromAura[Aura][Spell] = 1
		end
	end
end

function SpellFlashAddon.SetOtherAuras(Spell, Aura, BooleanValue)
	if Spell and Aura then
		if BooleanValue or type(BooleanValue) == "nil" then
			if not OtherAurasFromSpell[Spell] then
				OtherAurasFromSpell[Spell] = {}
			end
			OtherAurasFromSpell[Spell][Aura] = 1
		elseif OtherAurasFromSpell[Spell] then
			OtherAurasFromSpell[Spell][Aura] = nil
			if next(OtherAurasFromSpell[Spell]) == nil then
				OtherAurasFromSpell[Spell] = nil
			end
		end
	end
end

-- Registers the current Form or Stance
local function RegisterForm()
	local n = GetShapeshiftForm()
	if not n or n == 0 then
		CURRENTFORM = nil
	else
		CURRENTFORM = select(2,GetShapeshiftFormInfo(n))
	end
	SpellFlashAddon.debug("Now in "..( CURRENTFORM or "Caster Form" ).."!")
end

local function RegisterTalents()
	for Tab=1,GetNumTalentTabs() do
		TALENTTABPOINTS[Tab] = 0
		for Tal=1,GetNumTalents(Tab) do
			local name, icon, tier, column, rank = GetTalentInfo(Tab, Tal)
			TALENTRANK[name] = rank
			TALENTTABPOINTS[Tab] = TALENTTABPOINTS[Tab] + rank
		end
	end
end

local function LoadAddOns()
	local Loaded, Error
	for i=1,GetNumAddOns() do
		local name, _, _, enabled = GetAddOnInfo(i)
		if enabled and IsAddOnLoadOnDemand(i) and name ~= "SpellFlash_TemplateAddon" then
			local LoadWith = ","..(string.gsub(string.upper(GetAddOnMetadata(name, "X-SpellFlashAddon-LoadWith") or ""),"[^A-Z,]",""))..","
			local LoadWithClass = ","..(string.gsub(string.upper(GetAddOnMetadata(name, "X-SpellFlashAddon-LoadWithClass") or ""),"[^A-Z,]",""))..","
			local LoadWithRace = ","..(string.gsub(string.upper(GetAddOnMetadata(name, "X-SpellFlashAddon-LoadWithRace") or ""),"[^A-Z,]",""))..","
			local found = 0
			local passed = 0
			if string.find(LoadWith, "%w") then
				found = found + 1
				if string.find(LoadWith,",ANY,") or string.find(LoadWith,","..RACE..",") or string.find(LoadWith,","..CLASS..",") then
					passed = passed + 1
				end
			end
			if string.find(LoadWithRace, "%w") then
				found = found + 1
				if string.find(LoadWithRace,","..RACE..",") then
					passed = passed + 1
				end
			end
			if string.find(LoadWithClass, "%w") then
				found = found + 1
				if string.find(LoadWithClass,","..CLASS..",") then
					passed = passed + 1
				end
			end
			if found > 0 and found == passed then
				Loaded = IsAddOnLoaded(i)
				if not Loaded then
					Loaded, Error = LoadAddOn(name)
					if not Loaded then
						SpellFlashAddon.msg("Error loading: "..name.." ("..Error..")")
					end
				end
				if Loaded
					and not string.find(LoadWith,",ANY,")
					and not string.find(LoadWith,","..RACE..",")
					and not string.find(LoadWithRace, "%w")
					and not string.find(string.gsub(LoadWith,",",""),"%w"..CLASS)
					and not string.find(string.gsub(LoadWith,",",""),CLASS.."%w")
					and not string.find(string.gsub(LoadWithClass,",",""),"%w"..CLASS)
					and not string.find(string.gsub(LoadWithClass,",",""),CLASS.."%w")
					and string.find(string.lower(name), "^spellflash_.")
				then
					CLASSMODULES[name] = gsub(name, "^.........._", "")
					CLASSMODULENAMES[gsub(name, "^.........._", "")] = name
				end
			end
		end
	end
	if not SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].selected_class_module or not CLASSMODULES[SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].selected_class_module] then
		SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].selected_class_module = next(CLASSMODULES)
	end
	UIDropDownMenu_Initialize(SpellFlashAddonOptionsFrame_ClassModulesList, function()
		for name,value in pairs(CLASSMODULES) do
			local info = {}
			info.text = value
			info.func = function()
				UIDropDownMenu_SetSelectedID(SpellFlashAddonOptionsFrame_ClassModulesList, this:GetID())
			end
			UIDropDownMenu_AddButton(info)
		end
	end)
end

function SpellFlashAddon.OpenToClassCategory()
	local name = UIDropDownMenu_GetText(SpellFlashAddonOptionsFrame_ClassModulesList)
	if name and name ~= "" and getglobal(CLASSMODULENAMES[name].."_SpellFlashAddonOptionsFrame") then
		InterfaceOptionsFrame_OpenToCategory(getglobal(CLASSMODULENAMES[name].."_SpellFlashAddonOptionsFrame"))
	else
		InterfaceOptionsFrame_OpenToCategory(name or "")
	end
end

local function RegisterOutsideMeleeDistanceSpell()
	if not SpellFlashAddon.IsSpellKnown(MELEESPELL[CLASS]) then
		OUTSIDEMELEESPELL = nil
		local i = 1
		while true do
			local name = GetSpellName(i, BOOKTYPE_SPELL)
			if not name then break end
			if SpellHasRange(name) then
				if select(8,GetSpellInfo(name)) == 5 and select(9,GetSpellInfo(name)) >= 10 then
					OUTSIDEMELEESPELL = name
					break
				end
			end
			i = i + 1
		end
	end
end

local function RegisterFrames()
	FRAMESREGISTERED = nil
	SpellFlashAddon.ButtonFrames.Action = {}
	SpellFlashAddon.ButtonFrames.Pet = {}
	SpellFlashAddon.ButtonFrames.Form = {}
	SpellFlashAddon.ButtonFrames.Vehicle = {}
	SpellFlashAddon.debug("-     Button Frames Found:")
	local frame = EnumerateFrames()
	while frame do
		if frame.IsProtected and frame.GetObjectType and frame.GetScript and frame:GetObjectType() == "CheckButton" and frame:IsProtected() then
			local Type
			local script = frame:GetScript("OnClick")
			if script == FINDFORM then
				tinsert(SpellFlashAddon.ButtonFrames.Form, frame)
				Type = "Form: "
			elseif script == FINDPET then
				tinsert(SpellFlashAddon.ButtonFrames.Pet, frame)
				Type = "Pet: "
			elseif script == FINDVEHICLE then
				tinsert(SpellFlashAddon.ButtonFrames.Vehicle, frame)
				Type = "Vehicle: "
			elseif script == FINDACTION then
				tinsert(SpellFlashAddon.ButtonFrames.Action, frame)
				Type = "Action: "
			else
				Type = "Other: "
			end
			local slot = ""
			if frame.action then
				slot = " - Current Button Slot: "..frame.action
			end
			SpellFlashAddon.debug(Type..""..(frame:GetName() or "")..""..slot)
		end
		frame = EnumerateFrames(frame)
	end
	FRAMESREGISTERED = 1
end

local function GetActionSlotInfo(slot)
	if slot and HasAction(slot) then
		local MacroName = GetActionText(slot)
		local Type, id, subType, globalID = GetActionInfo(slot)
		if MacroName then
			return nil, nil, nil, nil, MacroName, id
		elseif Type == "item" then
			local ItemName = GetItemInfo(id)
			return nil, nil, nil, ItemName, nil, id
		elseif globalID then
			local SpellName, RankName = GetSpellInfo(globalID)
			local SpellRank = 1
			if RankName then
				local found, _, rank = string.find(RankName, "(%d+)")
				if found then
					SpellRank = tonumber(rank)
				else
					RankName = nil
				end
			end
			return SpellName, SpellRank, RankName, nil, nil, id
		end
	end
	return nil
end

local function BodyHasMetaTag(body)
	return body and (
		string.find(body,"^ *#show *$")
		or string.find(body,"\n *#show *$")
		or string.find(body,"^ *#show *\n")
		or string.find(body,"\n *#show *\n")
		or string.find(body,"^ *#show ")
		or string.find(body,"\n *#show ")
		or string.find(body,"^ *#showtooltip *$")
		or string.find(body,"\n *#showtooltip *$")
		or string.find(body,"^ *#showtooltip *\n")
		or string.find(body,"\n *#showtooltip *\n")
		or string.find(body,"^ *#showtooltip ")
		or string.find(body,"\n *#showtooltip ")
	)
end

local function RegisterButtons()
	BUTTONSREGISTERED = nil
	SpellButtons = {}
	MacroButtons = {}
	ItemButtons = {}
	ExtraBar_SpellButtons = {}
	ExtraBar_MacroButtons = {}
	ExtraBar_ItemButtons = {}
	SpellFlashAddon.debug("-     Button Slots Found:")
	for i=1,120 do
		local SpellName, SpellRank, RankName, ItemName, MacroName, id = GetActionSlotInfo(i)
		if MacroName then
			if BodyHasMetaTag(GetMacroBody(id)) then
				if not MacroButtons[""..id] then
					MacroButtons[""..id] = {}
				end
				tinsert(MacroButtons[""..id], i)
			end
			SpellFlashAddon.debug("Macro: "..MacroName.." = "..i)
		elseif ItemName then
			if not ItemButtons[ItemName] then
				ItemButtons[ItemName] = {}
			end
			tinsert(ItemButtons[ItemName], i)
			SpellFlashAddon.debug("Item: "..ItemName.." = "..i)
		elseif SpellName then
			if SpellRank == SpellFlashAddon.GetSpellRank(SpellName) then
				if not SpellButtons[SpellName] then
					SpellButtons[SpellName] = {}
				end
				tinsert(SpellButtons[SpellName], i)
			end
			if RankName then
				SpellFlashAddon.debug(SpellName.."("..RankName..") = "..i)
			else
				SpellFlashAddon.debug(SpellName.." = "..i)
			end
		end
	end
	if IsAddOnLoaded("ExtraBar") then
		local t = GetActiveTalentGroup()
		for i=1,4 do
			local c = 1
			local frame = getglobal("ExtraBar"..i.."Button"..c)
			while frame do
				local Name = frame["set"..t.."name"]
				if Name and Name ~= "" then
					local Type = frame["set"..t.."type"]
					local id = frame["set"..t.."value"]
					if Type == "macro" then
						if BodyHasMetaTag(GetMacroBody(id)) then
							if not ExtraBar_MacroButtons[""..id] then
								ExtraBar_MacroButtons[""..id] = {}
							end
							tinsert(ExtraBar_MacroButtons[""..id], frame)
						end
						SpellFlashAddon.debug("ExtraBar Macro: "..Name.." = Bar: "..i.." Button: "..c)
					elseif Type == "item" then
						if not ExtraBar_ItemButtons[Name] then
							ExtraBar_ItemButtons[Name] = {}
						end
						tinsert(ExtraBar_ItemButtons[Name], frame)
						SpellFlashAddon.debug("ExtraBar Item: "..Name.." = Bar: "..i.." Button: "..c)
					else
						local rank = 1
						local found, _, r = string.find(id, "%(.*(%d+).*%)$")
						if found then
							rank = tonumber(r)
						end
						if rank == SpellFlashAddon.GetSpellRank(Name) then
							if not ExtraBar_SpellButtons[Name] then
								ExtraBar_SpellButtons[Name] = {}
							end
							tinsert(ExtraBar_SpellButtons[Name], frame)
							if found then
								SpellFlashAddon.debug("ExtraBar: "..id.." = Bar: "..i.." Button: "..c)
							else
								SpellFlashAddon.debug("ExtraBar: "..Name.." = Bar: "..i.." Button: "..c)
							end
						end
					end
				end
				c = c + 1
				frame = getglobal("ExtraBar"..i.."Button"..c)
			end
		end
	end
	BUTTONSREGISTERED = 1
end


local function PopulateImmuneIgnoreListDropDownMenu()
	UIDropDownMenu_ClearAll(SpellFlashAddonOptionsFrame_ImmuneIgnoreList)
	UIDropDownMenu_Initialize(SpellFlashAddonOptionsFrame_ImmuneIgnoreList, function()
		for name,value in pairs(IMMUNEIGNORELIST) do
			local info = {}
			info.text = name
			info.func = function()
				UIDropDownMenu_SetSelectedID(SpellFlashAddonOptionsFrame_ImmuneIgnoreList, this:GetID())
			end
			UIDropDownMenu_AddButton(info)
		end
	end)
end

function SpellFlashAddon.AddToImmuneIgnoreList(TargetName)
	local name = SpellFlashAddonOptionsFrame_AddImmuneIgnore:GetText()
	if not name or name == "" then
		name = TargetName
	end
	if name and name ~= "" then
		IMMUNEIGNORELIST[name] = true
		PopulateImmuneIgnoreListDropDownMenu()
		SpellFlashAddonOptionsFrame_ImmuneIgnoreRemoveButton:Show()
		UIDropDownMenu_SetSelectedValue(SpellFlashAddonOptionsFrame_ImmuneIgnoreList, name)
		SpellFlashAddonOptionsFrame_AddImmuneIgnore:SetText("")
	end
end

function SpellFlashAddon.RemoveFromImmuneIgnoreList()
	local name = UIDropDownMenu_GetText(SpellFlashAddonOptionsFrame_ImmuneIgnoreList)
	if name and name ~= "" then
		IMMUNEIGNORELIST[name] = nil
	end
	if next(IMMUNEIGNORELIST) == nil then
		SpellFlashAddonOptionsFrame_ImmuneIgnoreRemoveButton:Hide()
	end
	PopulateImmuneIgnoreListDropDownMenu()
end

function SpellFlashAddon.TestFlashSettings()
	local sizepercent = SpellFlashAddonOptionsFrame_FlashSizePercent:GetNumber()
	if sizepercent > 0 then
		FLASHSIZE = sizepercent / 100
	else
		FLASHSIZE = DEFAULT_FLASH_SIZE_PERCENT / 100
	end
	local brightnesspercent = SpellFlashAddonOptionsFrame_FlashBrightnessPercent:GetNumber()
	if brightnesspercent > 0 and brightnesspercent < 100 then
		FLASHBRIGHTNESS = brightnesspercent / 100
	else
		FLASHBRIGHTNESS = 1
	end
end

local function ResetFlashSettings()
	FLASHSIZE = (SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].flash_size_percent or DEFAULT_FLASH_SIZE_PERCENT) / 100
	FLASHBRIGHTNESS = (SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].flash_brightness_percent or 100) / 100
end

local function ResetDefaults()
	SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].spell_flashing_off = nil
	SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].flash_size_percent = nil
	SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].flash_brightness_percent = nil
	SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].auto_mob_immune_detection_off = nil
	SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].use_all_class_modules = nil
	SpellFlashAddonConfig.debug_on = nil
	SpellFlashAddonConfig.full_debug_mode = nil
	SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].debuff_owner_checking = SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].debuff_owner_found
	CheckVariables()
	SetSpam()
end

local function LoadOptionsFrameSettings()
	IMMUNEIGNORELIST = SpellFlashAddon.CopyTable(SpellFlashAddonConfig.SERVER[SERVER].ImmuneIgnore)
	PopulateImmuneIgnoreListDropDownMenu()
	if next(CLASSMODULES) then
		UIDropDownMenu_SetSelectedValue(SpellFlashAddonOptionsFrame_ClassModulesList, CLASSMODULES[SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].selected_class_module])
		UIDropDownMenu_SetText(SpellFlashAddonOptionsFrame_ClassModulesList, CLASSMODULES[SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].selected_class_module])
	end
	if next(IMMUNEIGNORELIST) == nil then
		SpellFlashAddonOptionsFrame_ImmuneIgnoreRemoveButton:Hide()
	else
		SpellFlashAddonOptionsFrame_ImmuneIgnoreRemoveButton:Show()
		UIDropDownMenu_SetSelectedValue(SpellFlashAddonOptionsFrame_ImmuneIgnoreList, (next(IMMUNEIGNORELIST)))
		UIDropDownMenu_SetText(SpellFlashAddonOptionsFrame_ImmuneIgnoreList, (next(IMMUNEIGNORELIST)))
	end
	SpellFlashAddonOptionsFrame_AddImmuneIgnore:SetText("")
	if SpellFlashAddon.debug_on or SpellFlashAddon.full_debug_mode then
		SpellFlashAddonOptionsFrame_Debug:Show()
		SpellFlashAddonOptionsFrame_FullDebug:Show()
	end
	SpellFlashAddonOptionsFrame_SpellFlashing:SetChecked(not SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].spell_flashing_off)
	SpellFlashAddonOptionsFrame_UseAllClassModules:SetChecked(not not SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].use_all_class_modules)
	SpellFlashAddonOptionsFrame_FlashSizePercent:SetNumber(SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].flash_size_percent or DEFAULT_FLASH_SIZE_PERCENT)
	SpellFlashAddonOptionsFrame_FlashBrightnessPercent:SetNumber(SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].flash_brightness_percent or 100)
	SpellFlashAddonOptionsFrame_Debug:SetChecked(not not SpellFlashAddon.debug_on)
	SpellFlashAddonOptionsFrame_FullDebug:SetChecked(not not SpellFlashAddon.full_debug_mode)
	SpellFlashAddonOptionsFrame_AutoMobImmunityDetection:SetChecked(not SpellFlashAddon.auto_mob_immune_detection_off)
	SpellFlashAddonOptionsFrame_ClearImmuneDatabase:SetChecked(false)
	if not string.find(SERVER, "%.worldofwarcraft%.com$") then
		SpellFlashAddonOptionsFrame_debuff_owner_checking:Show()
		SpellFlashAddonOptionsFrame_debuff_owner_checking:SetChecked(not SpellFlashAddon.disable_debuff_owner_checking)
	end
end

local function SaveOptionsFrameSettings()
	SpellFlashAddonConfig.SERVER[SERVER].ImmuneIgnore = SpellFlashAddon.CopyTable(IMMUNEIGNORELIST)
	if next(CLASSMODULES) then
		SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].selected_class_module = CLASSMODULENAMES[UIDropDownMenu_GetText(SpellFlashAddonOptionsFrame_ClassModulesList)]
	end
	if SpellFlashAddonOptionsFrame_Debug:GetChecked() then
		SpellFlashAddonConfig.debug_on = true
	else
		SpellFlashAddonConfig.debug_on = nil
	end
	if SpellFlashAddonOptionsFrame_FullDebug:GetChecked() then
		SpellFlashAddonConfig.full_debug_mode = true
	else
		SpellFlashAddonConfig.full_debug_mode = nil
	end
	if SpellFlashAddonOptionsFrame_ClearImmuneDatabase:GetChecked() then
		SpellFlashAddonConfig.SERVER[SERVER].Immune = {}
		SpellFlashAddonConfig.SERVER[SERVER].Immune[CLASS] = {}
	end
	if SpellFlashAddonOptionsFrame_AutoMobImmunityDetection:GetChecked() then
		SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].auto_mob_immune_detection_off = nil
	else
		SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].auto_mob_immune_detection_off = true
	end
	if SpellFlashAddonOptionsFrame_SpellFlashing:GetChecked() then
		SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].spell_flashing_off = nil
	else
		SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].spell_flashing_off = true
	end
	if SpellFlashAddonOptionsFrame_UseAllClassModules:GetChecked() then
		SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].use_all_class_modules = true
	else
		SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].use_all_class_modules = nil
	end
	local sizepercent = SpellFlashAddonOptionsFrame_FlashSizePercent:GetNumber()
	if sizepercent > 0 and sizepercent ~= DEFAULT_FLASH_SIZE_PERCENT then
		SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].flash_size_percent = sizepercent
	else
		SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].flash_size_percent = nil
	end
	local brightnesspercent = SpellFlashAddonOptionsFrame_FlashBrightnessPercent:GetNumber()
	if brightnesspercent > 0 and brightnesspercent < 100 then
		SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].flash_brightness_percent = brightnesspercent
	else
		SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].flash_brightness_percent = nil
	end
	if not string.find(SERVER, "%.worldofwarcraft%.com$") then
		if SpellFlashAddonOptionsFrame_debuff_owner_checking:GetChecked() then
			SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].debuff_owner_checking = true
		else
			SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].debuff_owner_checking = nil
		end
	end
	CheckVariables()
	SetSpam()
	if SpellFlashAddon.debug_on and SpellFlashAddon.full_debug_mode then
		SpellFlashAddon.SaveAllFrameNameStringsIntoATable(SpellFlashAddonConfig)
	end
end

function SpellFlashAddon.OptionsFrame_OnLoad(self)
	
	for _, Frame in next,{self:GetChildren()} do
		if Frame:GetObjectType() == "FontString" then
			local text = Frame:GetText()
			if text and text ~= "" then
				Frame:SetText(Table.Localize[text])
			end
		else
			for _, Frame in next,{Frame:GetRegions()} do
				if Frame:GetObjectType() == "FontString" then
					local text = Frame:GetText()
					if text and text ~= "" then
						Frame:SetText(Table.Localize[text])
					end
				end
			end
		end
	end
	
	getglobal(self:GetName().."TitleString"):SetText(GetAddOnMetadata(AddonName, "Title").." "..GetAddOnMetadata(AddonName, "Version"))
	
	-- Set the name for the Category for the Panel
	self.name = GetAddOnMetadata(AddonName, "Title")
	
	-- When the player clicks okay, run this function.
	self.okay = SaveOptionsFrameSettings
	
	-- When the player clicks cancel, run this function.
	self.cancel = ResetFlashSettings
	
	-- This is a function that is called when the player presses the Default Button.
	self.default = ResetDefaults
	
	-- This will run whenever the options frame is loaded or after defaults are loaded.
	self.refresh = LoadOptionsFrameSettings
	
	-- Add the panel to the Interface Options
	InterfaceOptions_AddCategory(self)
	
end


function SpellFlashAddon.ShowBuffs(unit, Debuff)
	local unit = unit
	local msg
	if not unit then
		if UnitExists("target") then
			unit = "target"
		else
			unit = "player"
		end
	end
	local Debuff = Debuff
	if Debuff then
		Debuff = "HARMFUL"
		msg = UnitName(unit).."'s Debuff Slot"
	else
		Debuff = "HELPFUL"
		msg = UnitName(unit).."'s Buff Slot"
	end
	local c = 1
	if UnitAura(unit, c, Debuff) then
		while UnitAura(unit, c, Debuff) do
			DEFAULT_CHAT_FRAME:AddMessage(msg.." "..c..": "..(UnitAura(unit, c, Debuff)))
			c = c + 1
		end
	else
		DEFAULT_CHAT_FRAME:AddMessage("All "..msg.."'s are empty.")
	end
end

function SpellFlashAddon.CopyTable(Table)
	local t = {}
	if type(Table) == "table" then
		for k,v in pairs(Table) do
			t[k] = v
		end
	end
	return t
end

local function SlashHandler(msg)
	local msg = string.lower(""..msg)
	if string.find(msg,"reset") then
		if string.find(msg,"all") then
			VARIABLES_CHECKED = nil
			SpellFlashAddonConfig = nil
			CheckVariables()
			SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].PLAYER[PLAYER].selected_class_module = next(CLASSMODULES)
			SetSpam()
			LoadOptionsFrameSettings()
			SpellFlashAddon.msg("SpellFlash settings have been reset for all players")
		else
			ResetDefaults()
			LoadOptionsFrameSettings()
			SpellFlashAddon.msg("SpellFlash settings have been reset for "..UnitName("player"))
		end
	elseif (msg == "debug") then
		if SpellFlashAddon.debug_on then
			SpellFlashAddon.msg("SpellFlash debug is disabled")
			SpellFlashAddon.debug_on = nil
			SpellFlashAddonConfig.debug_on = nil
		else
			SpellFlashAddon.msg("SpellFlash debug is enabled")
			SpellFlashAddon.debug_on = true
			SpellFlashAddonConfig.debug_on = true
		end
		LoadOptionsFrameSettings()
	elseif (msg == "debug on") then
		SpellFlashAddon.debug_on = true
		SpellFlashAddonConfig.debug_on = true
		SpellFlashAddon.msg("SpellFlash debug is enabled")
		LoadOptionsFrameSettings()
	elseif (msg == "debug off") then
		SpellFlashAddon.debug_on = nil
		SpellFlashAddonConfig.debug_on = nil
		SpellFlashAddon.msg("SpellFlash debug is disabled")
		LoadOptionsFrameSettings()
	elseif (msg == "debug mode") then
		if SpellFlashAddon.full_debug_mode then
			SpellFlashAddon.full_debug_mode = nil
			SpellFlashAddonConfig.full_debug_mode = nil
			SpellFlashAddon.msg("SpellFlash debug mode has been set to normal")
		else
			SpellFlashAddon.full_debug_mode = true
			SpellFlashAddonConfig.full_debug_mode = true
			SpellFlashAddon.msg("SpellFlash debug mode has been set to full")
		end
		LoadOptionsFrameSettings()
	elseif (msg == "debug full on") or (msg == "debug mode full on") or (msg == "debug full") or (msg == "debug mode full") then
		SpellFlashAddon.full_debug_mode = true
		SpellFlashAddonConfig.full_debug_mode = true
		SpellFlashAddon.msg("SpellFlash debug mode has been set to full")
		LoadOptionsFrameSettings()
	elseif (msg == "debug full off") or (msg == "debug mode full off") or (msg == "debug normal") or (msg == "debug normal on") or (msg == "debug mode normal") or (msg == "debug mode normal on") then
		SpellFlashAddon.full_debug_mode = nil
		SpellFlashAddonConfig.full_debug_mode = nil
		SpellFlashAddon.msg("SpellFlash debug mode has been set to normal")
		LoadOptionsFrameSettings()
	elseif string.find(msg,"debuf") then
		SpellFlashAddon.ShowBuffs(nil,1)
	elseif string.find(msg,"buf") then
		SpellFlashAddon.ShowBuffs()
	else
		InterfaceOptionsFrame_OpenToCategory(SpellFlashAddonOptionsFrame)
	end
	if SpellFlashAddon.debug_on and SpellFlashAddon.full_debug_mode then
		SpellFlashAddon.SaveAllFrameNameStringsIntoATable(SpellFlashAddonConfig)
	end
end
SlashCmdList.SpellFlashAddon = SlashHandler
SLASH_SpellFlashAddon1 = "/spellflash"
SLASH_SpellFlashAddon2 = "/sflash"
SLASH_SpellFlashAddon3 = "/sf"


local function TimerRunDown(elapsed)
	for Name,v in pairs(TIMER) do
		TIMER[Name].Seconds = v.Seconds - elapsed
		if TIMER[Name].Seconds <= 0 then
			if v.Function then
				v.Function(unpack(v.Args))
			end
			if TIMER[Name] and TIMER[Name].Seconds <= 0 then
				if TIMER[Name].RepeatSeconds > 0 then
					TIMER[Name].Seconds = TIMER[Name].RepeatSeconds
				else
					TIMER[Name] = nil
				end
			end
		end
	end
end

local function OnUpdate(self, elapsed)
	TimerRunDown(elapsed)
end


local function AutoAddToImmuneIgnoreList(NPC)
	SpellFlashAddonConfig.SERVER[SERVER].ImmuneIgnore[NPC] = true
	if SpellFlashAddonOptionsFrame:IsVisible() then
		local name = UIDropDownMenu_GetText(SpellFlashAddonOptionsFrame_ImmuneIgnoreList)
		IMMUNEIGNORELIST[NPC] = true
		PopulateImmuneIgnoreListDropDownMenu()
		SpellFlashAddonOptionsFrame_ImmuneIgnoreRemoveButton:Show()
		if name and name ~= "" then
			UIDropDownMenu_SetSelectedValue(SpellFlashAddonOptionsFrame_ImmuneIgnoreList, name)
		end
	else
		LoadOptionsFrameSettings()
	end
	for SpellName,v in pairs(SpellFlashAddonConfig.SERVER[SERVER].Immune[CLASS]) do
		SpellFlashAddonConfig.SERVER[SERVER].Immune[CLASS][SpellName][NPC] = nil
	end
end

--Will dump the value of msg to the default chat window
function SpellFlashAddon.msg(msg)
	if msg then
		DEFAULT_CHAT_FRAME:AddMessage(tostring(msg))
	end
end

-- show: 1=msg 0=block 2=FullDebugOnly nil=DebugOnly
local DebugCount = 0
function SpellFlashAddon.debug(msg, show)
	if ( SpellFlashAddon.debug_on or show == 1 ) and ( show ~= 2 or SpellFlashAddon.full_debug_mode ) and show ~= 0 and msg then
		if show == 1 then
			DEFAULT_CHAT_FRAME:AddMessage(tostring(msg))
		else
			DebugCount = DebugCount + 1
			DEFAULT_CHAT_FRAME:AddMessage("["..DebugCount.."]   "..tostring(msg))
		end
	end
end

local LastEventTime = 0
local function EventsDebug(event, arg, ...)
	if SpellFlashAddon.debug_on and SpellFlashAddon.full_debug_mode and event then
		local t = GetTime()
		SpellFlashAddon.debug("event:  "..event)
		SpellFlashAddon.debug("       Time:  "..t.."  -  "..LastEventTime.."  =  "..( t - LastEventTime ))
		LastEventTime = t
		local n = select("#", ...)
		if n > 0 then
			for i=1,n do
				if type(arg[i]) ~= "nil" then
					SpellFlashAddon.debug("       arg"..i.." = "..type(arg[i])..": "..tostring(arg[i]))
				end
			end
		end
	end
end

local function OnEvent(self, event, ...)
	local arg = {...}
	EventsDebug(event, arg, ...)

	if event == "PLAYER_REGEN_DISABLED" then
			
			COMBAT = 1
			
	elseif event == "PLAYER_REGEN_ENABLED" then
			
			COMBAT = nil
			
	elseif event == "START_AUTOREPEAT_SPELL" then
			
			SpellFlashAddon.AutoShoot = 1
			
	elseif event == "STOP_AUTOREPEAT_SPELL" then
			
			SpellFlashAddon.AutoShoot = nil
			
	elseif event == "ADDON_LOADED" then
			
			if arg[1] == AddonName then
				SpellFlashAddon.SetTimer("CheckVariables-InternalSpellFlashAddon", 0, 0, CheckVariables)
			end
			
	elseif event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_ALIVE" then
			
			if LOADING then
				SpellFlashAddon.SetTimer("RegisterFunctions-InternalSpellFlashAddon", 2, 0,
					function()
						if LOADING then
							if VARIABLES_CHECKED then
								LoadAddOns()
								RegisterTalents()
								RegisterOtherAuras()
								RegisterOutsideMeleeDistanceSpell()
								RegisterFrames()
								RegisterButtons()
								RegisterForm()
								SetSpam()
								if SpellFlashAddon.debug_on and SpellFlashAddon.full_debug_mode then
									SpellFlashAddon.SaveAllFrameNameStringsIntoATable(SpellFlashAddonConfig)
								end
								LOADING = nil
							else
								SpellFlashAddon.ReplaceTimer("RegisterFunctions-InternalSpellFlashAddon", 2)
							end
						end
					end
				)
			end
			SPELLDELAY = {}
			
	elseif event == "ACTIONBAR_SHOWGRID" then
			
			BUTTONSREGISTERED = nil
			
	elseif event == "ACTIONBAR_HIDEGRID" or event == "LEARNED_SPELL_IN_TAB" or event == "CHARACTER_POINTS_CHANGED" or event == "ACTIVE_TALENT_GROUP_CHANGED" or event == "UPDATE_MACROS" then
			
			SPELLDELAY = {}
			RegisterTalents()
			RegisterOtherAuras()
			SpellFlashAddon.SetTimer("RegisterOutsideMeleeDistanceSpell-InternalSpellFlashAddon", 0.5, 0, RegisterOutsideMeleeDistanceSpell)
			FRAMESREGISTERED = nil
			SpellFlashAddon.SetTimer("RegisterFrames-InternalSpellFlashAddon", 0.5, 0, RegisterFrames)
			BUTTONSREGISTERED = nil
			SpellFlashAddon.SetTimer("RegisterButtons-InternalSpellFlashAddon", 1, 0, RegisterButtons)
			
	elseif event == "UNIT_ENTERED_VEHICLE" or event == "UNIT_EXITED_VEHICLE" then
			
			if arg[1] == "player" then
				FRAMESREGISTERED = nil
				SpellFlashAddon.SetTimer("RegisterFrames-InternalSpellFlashAddon", 0.5, 0, RegisterFrames)
			end
			
	elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
			
			if arg[12] == "IMMUNE" and arg[2] ~= "SWING_DAMAGE" and arg[2] ~= "RANGE_DAMAGE" then
				if SpellFlashAddon.IsSpellKnown(arg[10]) then
					SpellFlashAddon.SetTimer(arg[10].."TempImmune_InternalSpellFlashAddon"..arg[6], 5)
				end
				if VARIABLES_CHECKED and not SpellFlashAddonConfig.SERVER[SERVER].ImmuneIgnore[arg[7]] and not SpellFlashAddon.auto_mob_immune_detection_off and arg[6] == UnitGUID("target") and SpellFlashAddon.GiveUnitTypeByGUID(arg[6]) == "npc" and not SpellFlashAddon.CheckDebuff(IMMUNITYDEBUFFS) then
					if NPC_HIT_SPELLS[arg[7]] and NPC_HIT_SPELLS[arg[7]][arg[10]] then
						AutoAddToImmuneIgnoreList(arg[7])
					elseif SpellFlashAddon.IsSpellKnown(arg[10]) then
						if not SpellFlashAddonConfig.SERVER[SERVER].Immune[CLASS][arg[10]] then
							SpellFlashAddonConfig.SERVER[SERVER].Immune[CLASS][arg[10]] = {}
						end
						SpellFlashAddonConfig.SERVER[SERVER].Immune[CLASS][arg[10]][arg[7]] = true
					end
				end
			end
			if arg[2] == "SPELL_MISS" or arg[2] == "SPELL_MISSED" or arg[2] == "SPELL_DAMAGE" or arg[2] == "SPELL_HEAL" or arg[2] == "SPELL_AURA_REFRESH" or arg[2] == "SPELL_AURA_APPLIED" or arg[2] == "SPELL_AURA_APPLIED_DOSE" then
				if not string.find(arg[2], "MISS") and arg[2] ~= "SPELL_HEAL" and arg[12] ~= "BUFF" then
					SpellFlashAddon.ClearTimer(arg[10].."TempImmune_InternalSpellFlashAddon"..arg[6])
					if SpellFlashAddon.GiveUnitTypeByGUID(arg[6]) == "npc" then
						if not NPC_HIT_SPELLS[arg[7]] then
							NPC_HIT_SPELLS[arg[7]] = {}
						end
						NPC_HIT_SPELLS[arg[7]][arg[10]] = 1
						if VARIABLES_CHECKED and not SpellFlashAddonConfig.SERVER[SERVER].ImmuneIgnore[arg[7]] and not SpellFlashAddon.auto_mob_immune_detection_off and SpellFlashAddonConfig.SERVER[SERVER].Immune[CLASS][arg[10]] and SpellFlashAddonConfig.SERVER[SERVER].Immune[CLASS][arg[10]][arg[7]] then
							AutoAddToImmuneIgnoreList(arg[7])
						end
					end
				end
				if arg[3] == UnitGUID("player") or ( SpellFlashAddon.disable_debuff_owner_checking and arg[12] == "DEBUFF" ) then
					if OtherAurasFromSpell[arg[10]] and not string.find(arg[2], "MISS") and SPELLDELAY[arg[10]] then
						for n,v in pairs(OtherAurasFromSpell[arg[10]]) do
							SpellFlashAddon.SetTimer(n.."AuraDelay-InternalSpellFlashAddon"..arg[6], 1)
						end
					end
					if not string.find(arg[12], "BUFF") and ( arg[2] == "SPELL_DAMAGE" or arg[2] == "SPELL_HEAL" ) then
						if SPELLDELAY[arg[10]] then
							SpellFlashAddon.SetTimer(arg[10].."AuraDelay-InternalSpellFlashAddon"..arg[6], 1)
						end
					else
						SpellFlashAddon.ClearTimer(arg[10].."AuraDelay-InternalSpellFlashAddon"..arg[6])
					end
					SpellFlashAddon.ClearTimer(arg[10].."ClearSpellDelay-InternalSpellFlashAddon")
					SPELLDELAY[arg[10]] = nil
					if arg[12] == "DEBUFF" and VARIABLES_CHECKED and arg[3] == UnitGUID("player") and not string.find(SERVER, "%.worldofwarcraft%.com$") and not SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].debuff_owner_found then
						SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].debuff_owner_found = true
						SpellFlashAddonConfig.SERVER[SERVER].REALM[REALM].debuff_owner_checking = true
						CheckVariables()
						LoadOptionsFrameSettings()
						SpellFlashAddon.msg("SpellFlash: Enabled checking to see if debuffs are from you.")
					end
				end
			end
			
	elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
			
			if arg[1] == "player" then
				SpellFlashAddon.SetTimer(arg[2].."ClearSpellDelay-InternalSpellFlashAddon", 5, 0,
					function()
						SPELLDELAY[arg[2]] = nil
					end
				)
				SPELLDELAY[arg[2]] = 1
			end
			
	elseif event == "PLAYER_TARGET_CHANGED" then
			
			SPELLDELAY = {}
			
	elseif event == "UPDATE_SHAPESHIFT_FORM" then
			
			RegisterForm()
			
	end

	for n,v in pairs(SpellFlashAddon.Event) do
		v(event, arg, ...)
	end
end



function SpellFlashAddon.SpellDelay(spell, unit)
	return spell and SPELLDELAY[spell]
end

function SpellFlashAddon.AuraDelay(aura, unit)
	if type(aura) == "string" then
		if UnitExists(unit or "target") and SpellFlashAddon.IsTimer(aura.."AuraDelay-InternalSpellFlashAddon"..UnitGUID(unit or "target")) then
			return true
		elseif SPELLDELAY[aura] then
			return true
		end
		if OtherAurasSpellFromAura[aura] then
			for spell, v in pairs(OtherAurasSpellFromAura[aura]) do
				if SPELLDELAY[spell] then
					return true
				end
			end
		end
	elseif type(aura) == "table" then
		for _, v in ipairs(aura) do
			if SpellFlashAddon.AuraDelay(v, unit) then
				return true
			end
		end
	end
	return false
end

function SpellFlashAddon.Form(form)
	if form then
		return form == CURRENTFORM or ( ALTERNATEFORM[form] and ALTERNATEFORM[form] == CURRENTFORM )
	end
	return CURRENTFORM
end
SpellFlashAddon.IsForm = SpellFlashAddon.Form
SpellFlashAddon.GiveForm = SpellFlashAddon.Form

function SpellFlashAddon.GiveUnitTypeByGUID(GUID)
	if GUID then
		local first3 = tonumber("0x"..strsub(GUID, 3,5))
		local unitType = bit.band(first3,0x00f)
		if unitType == 0x000 then
			--print("Player, ID #", strsub(GUID,6))
			return "player"
		elseif unitType == 0x003 then
			--local creatureID = tonumber("0x"..strsub(GUID,9,12))
			--local spawnCounter = tonumber("0x"..strsub(GUID,13)) 
			--print("NPC, ID #",creatureID,"spawn #",spawnCounter)
			return "npc"
		elseif unitType == 0x004 then
			--local petID = tonumber("0x"..strsub(GUID,6,12))
			--local spawnCounter = tonumber("0x"..strsub(GUID,13)) 
			--print("Pet, ID #",petID,"spawn #",spawnCounter)
			return "pet"
		elseif unitType == 0x005 then
			--local creatureID = tonumber("0x"..strsub(GUID,9,12))
			--local spawnCounter = tonumber("0x"..strsub(GUID,13)) 
			--print("Vehicle, ID #",creatureID,"spawn #",spawnCounter)
			return "vehicle"
		end
	end
	return nil
end

function SpellFlashAddon.HasTalent(TalentName)
	return TalentName and ( TALENTRANK[TalentName] or 0 ) > 0
end

function SpellFlashAddon.GetTalentRank(TalentName)
	if TalentName then
		return TALENTRANK[TalentName] or 0
	end
	return 0
end

-- This also works for pet spells.
function SpellFlashAddon.IsSpellKnown(SpellName)
	return type(SpellName) == "string" and SpellName ~= "" and GetSpellInfo(SpellName)
end

function SpellFlashAddon.IsItemKnown(ItemName)
	return type(ItemName) == "string" and ItemName ~= "" and not string.find(ItemName, "item:%d+") and GetItemInfo(ItemName)
end

-- This also works for pet spells.
function SpellFlashAddon.GetSpellRank(SpellName)
	if SpellName then
		local name, rank = GetSpellInfo(SpellName)
		if name then
			if rank ~= "" then
				local found, _, r = string.find(rank, "(%d+)")
				if found then
					return tonumber(r)
				end
			end
			return 1
		end
	end
	return 0
end

function SpellFlashAddon.OnCooldown(SpellNameOrActionID)
	if type(SpellNameOrActionID) == "number" then
		return select(2,GetActionCooldown(SpellNameOrActionID)) ~= 0
	end
	return SpellNameOrActionID and select(2,GetSpellCooldown(SpellNameOrActionID)) ~= 0
end



function SpellFlashAddon.IsSpellAutocastOn(SpellName)
	if SpellName then
		return select(2,GetSpellAutocast(SpellName))
	end
	return nil
end

function SpellFlashAddon.GetSpellCastTime(SpellName)
	if SpellName then
		return (select(7,GetSpellInfo(SpellName)) or 0) / 1000
	end
	return 0
end

function SpellFlashAddon.GetSpellCost(SpellName, PowerType)
	if SpellName then
		local name, rank, icon, cost, isFunnel, powerType = GetSpellInfo(SpellName)
		if not PowerType or PowerType == powerType then
			return cost or 0
		end
	end
	return 0
end



function SpellFlashAddon.VehicleSlot(SpellName)
	if SpellName and UnitHasVehicleUI("player") then
		for n=121,126 do
			local name = GetActionSlotInfo(n)
			if name then
				if name == SpellName then
					return n
				end
			else
				return nil
			end
		end
	end
	return nil
end



function SpellFlashAddon.HasGlyph(GlyphName)
	for i=1,GetNumGlyphSockets() do
		local glyphSpellID = select(3,GetGlyphSocketInfo(i))
		if glyphSpellID and GlyphName == (GetSpellInfo(glyphSpellID)) then
			return true
		end
	end
	return false
end

function SpellFlashAddon.MeleeDistance(unit)
	if SpellFlashAddon.IsSpellKnown(MELEESPELL[CLASS]) then
		if IsSpellInRange(MELEESPELL[CLASS],unit or "target") ~= 1 then
			return false
		end
	elseif not CheckInteractDistance(unit or "target", 3) then
		return false
	elseif OUTSIDEMELEESPELL and IsSpellInRange(OUTSIDEMELEESPELL,unit or "target") == 1 then
		return false
	end
	return true
end


function SpellFlashAddon.IsImmune(SpellName)
	return (
		not SpellFlashAddon.auto_mob_immune_detection_off
		and not UnitPlayerControlled("target")
		and SpellName and SpellName ~= ""
		and UnitName("target")
		and ( not SpellFlashAddonConfig.SERVER[SERVER].ImmuneIgnore or not SpellFlashAddonConfig.SERVER[SERVER].ImmuneIgnore[UnitName("target")] )
		and SpellFlashAddonConfig.SERVER[SERVER].Immune[CLASS][SpellName] and SpellFlashAddonConfig.SERVER[SERVER].Immune[CLASS][SpellName][UnitName("target")]
	) or SpellFlashAddon.IsTimer(SpellName.."TempImmune_InternalSpellFlashAddon"..(UnitGUID("target") or ""))
end



--Example: SpellFlashAddon.IsClass("DeathKnight")
--The example above will return true if your target is a Death Knight.
--This function has been made so that english class names must be used with this function even if you are not using an english game client.
--Spaces are allowed in the class name and the class name may also be in upper or lower case when using this function.
function SpellFlashAddon.IsClass(class, unit)
	return UnitIsPlayer(unit or "target") and type(class) == "string" and string.gsub(string.upper(select(2,UnitClass(unit or "target"))),"[^A-Z]","") == string.gsub(string.upper(class),"[^A-Z]","")
end


function SpellFlashAddon.Casting(SpellName, unit, interruptable)
	local name, nameSubtext, text, texture, startTime, endTime, isTradeSkill, castID, notInterruptable = UnitCastingInfo(unit or "player")
	if name and ( not interruptable or not notInterruptable ) and ( not SpellName or SpellName == name ) then
		return name
	end
	return nil
end
SpellFlashAddon.IsCasting = SpellFlashAddon.Casting

function SpellFlashAddon.Channeling(SpellName, unit, interruptable)
	local name, nameSubtext, text, texture, startTime, endTime, isTradeSkill, notInterruptable = UnitChannelInfo(unit or "player")
	if name and ( not interruptable or not notInterruptable ) and ( not SpellName or SpellName == name ) then
		return name
	end
	return nil
end
SpellFlashAddon.IsChanneling = SpellFlashAddon.Channeling

function SpellFlashAddon.CastingOrChanneling(SpellName, unit, interruptable)
	return SpellFlashAddon.Casting(SpellName, unit, interruptable) or SpellFlashAddon.Channeling(SpellName, unit, interruptable)
end
SpellFlashAddon.IsCastingOrChanneling = SpellFlashAddon.CastingOrChanneling

--Since the PlayerFrame combat variable can be wrong, The same information
--can be accessed here.	Returns true if you are in combat
function SpellFlashAddon.InCombat()
	return COMBAT
end

-- Returns true if you are not in combat, and may use abilitys that can only be used out of combat
function SpellFlashAddon.NotInCombat()
	return not COMBAT
end

function SpellFlashAddon.UsesMana(unit)
	if UnitPowerType(unit or "target") == 0 then
		return true
	end
	return false
end

function SpellFlashAddon.HasMana(unit)
	if UnitPowerType(unit or "target") == 0 and UnitPower(unit or "target") > 0 then
		return true
	end
	return false
end

function SpellFlashAddon.HealthPercent(unit)
	return ( UnitHealth(unit or "target") / UnitHealthMax(unit or "target") ) * 100
end

function SpellFlashAddon.HealthDamagePercent(unit)
	return 100 - SpellFlashAddon.HealthPercent(unit)
end

function SpellFlashAddon.HealthDamage(unit)
	return UnitHealthMax(unit or "target") - UnitHealth(unit or "target")
end

function SpellFlashAddon.PowerMissing(unit, PowerType)
	return UnitPowerMax(unit or "target", PowerType) - UnitPower(unit or "target", PowerType)
end
SpellFlashAddon.ManaMissing = SpellFlashAddon.PowerMissing

function SpellFlashAddon.PowerPercent(unit, PowerType)
	return ( UnitPower(unit or "target", PowerType) / UnitPowerMax(unit or "target", PowerType) ) * 100
end
SpellFlashAddon.ManaPercent = SpellFlashAddon.PowerPercent


--returns true if all of the debuff slots are used
function SpellFlashAddon.AllDebuffSlotsUsed(unit)
	return not not UnitAura(unit or "target", MAXDEBUFFSLOTS, "HARMFUL")
end


function SpellFlashAddon.CancelBuff(SpellName, icon_texture)
	local SpellName = SpellName or SpellFlashAddon.CheckBuff(nil,nil,nil,nil,nil,nil,nil,nil,nil,icon_texture,nil,nil,nil,1)
	if SpellName then
		CancelUnitBuff("player", SpellName)
	end
end


--Looks through all buffs looking for a match
function SpellFlashAddon.CheckBuff(SpellName, unit, mine, CheckRank, applications, isExpirationTimeGreater, isExpirationTimeOrLess, Stealable, castable, icon_texture, SpellToolTipLineTwo, Type, giveapplications, giveindex, Debuff)
	if type(SpellName) == "table" then
		local result = nil
		for _, v in ipairs(SpellName) do
			result = SpellFlashAddon.CheckBuff(v, unit, mine, CheckRank, applications, isExpirationTimeGreater, isExpirationTimeOrLess, Stealable, castable, icon_texture, SpellToolTipLineTwo, Type, giveapplications, giveindex, Debuff)
			if result then
				return result
			end
		end
		return result
	end
	if unit == "MainHandSlot" or unit == "SecondaryHandSlot" then
		local slot = GetInventorySlotInfo(unit)
		if SpellName and GetInventoryItemLink("player", slot) then
			SpellFlashAddon_Tooltip:SetInventoryItem("player", slot)
			for i=1,SpellFlashAddon_Tooltip:NumLines() do
				local line = getglobal("SpellFlashAddon_TooltipTextLeft"..i):GetText()
				if line then
					if string.find(line, SpellName) then
						return true
					end
				end
			end
		end
		return false
	end
	local m = mine
	if m and ( not Debuff or not SpellFlashAddon.disable_debuff_owner_checking ) then
		m = "|PLAYER"
	else
		m = ""
	end
	local d = Debuff
	local u = unit
	if d then
		d = "HARMFUL"
		u = u or "target"
	else
		d = "HELPFUL"
		u = u or "player"
	end
	local c = castable
	if c then
		c = "|RAID"
	else
		c = ""
	end
	local t = SpellToolTipLineTwo
	local r = CheckRank
	if SpellName and not giveindex and not t then
		local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitAura(u, SpellName, nil, d..""..m..""..c)
		if name and ( not Type or string.lower(Type) == string.lower(debuffType or "") ) and ( not Stealable or isStealable ) then
			if r then
				local found, _, n = string.find(rank, "(%d+)")
				if found then
					rank = tonumber(n)
				else
					rank = 1
				end
				if type(r) ~= "number" then
					r = SpellFlashAddon.GetSpellRank(name)
				end
			end
			if ( r and rank > r and type(CheckRank) ~= "number" ) or (
					( not r or rank >= r )
				and ( not applications or applications == count )
				and ( not isExpirationTimeGreater or isExpirationTimeGreater <= 0 or expirationTime == 0 or ( expirationTime - GetTime() ) > isExpirationTimeGreater )
				and ( not isExpirationTimeOrLess or isExpirationTimeOrLess <= 0 or ( expirationTime ~= 0 and ( expirationTime - GetTime() ) <= isExpirationTimeOrLess ) )
			) then
				if giveapplications then
					if count == 0 then
						return 1
					end
					return count
				end
				return true
			end
		end
	elseif not SpellName or UnitAura(u, SpellName, nil, d..""..m..""..c) then
		local i = 1
		while UnitAura(u, i, d) do
			local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitAura(u, i, d..""..m..""..c)
			if name and ( not SpellName or SpellName == name ) and ( not icon_texture or string.find(icon or "", icon_texture) ) and ( not Type or string.lower(Type) == string.lower(debuffType or "") ) and ( not Stealable or isStealable ) then
				if r then
					local found, _, n = string.find(rank, "(%d+)")
					if found then
						rank = tonumber(n)
					else
						rank = 1
					end
					if type(r) ~= "number" then
						r = SpellFlashAddon.GetSpellRank(name)
					end
				end
				if ( r and rank > r and type(CheckRank) ~= "number" ) or (
						( not r or rank >= r )
					and ( not applications or applications == count )
					and ( not isExpirationTimeGreater or isExpirationTimeGreater <= 0 or expirationTime == 0 or ( expirationTime - GetTime() ) > isExpirationTimeGreater )
					and ( not isExpirationTimeOrLess or isExpirationTimeOrLess <= 0 or ( expirationTime ~= 0 and ( expirationTime - GetTime() ) <= isExpirationTimeOrLess ) )
				) then
					if t then
						SpellFlashAddon_Tooltip:SetUnitAura(u, i, d)
						if string.find(SpellFlashAddon_TooltipTextLeft2:GetText() or "", t) then
							t = nil
						end
					end
					if not t then
						if giveapplications then
							if count == 0 then
								return 1
							end
							return count
						elseif giveindex then
							return i
						end
						return true
					end
				end
			end
			i = i + 1
		end
	end
	if giveapplications then
		return 0
	elseif giveindex then
		return nil
	end
	return false
end


--Looks through all debuffs looking for a match
function SpellFlashAddon.CheckDebuff(SpellName, unit, mine, CheckRank, applications, isExpirationTimeGreater, isExpirationTimeOrLess, Stealable, dispelable, icon_texture, SpellToolTipLineTwo, Type, giveapplications, giveindex)
	return SpellFlashAddon.CheckBuff(SpellName, unit, mine, CheckRank, applications, isExpirationTimeGreater, isExpirationTimeOrLess, Stealable, dispelable, icon_texture, SpellToolTipLineTwo, Type, giveapplications, giveindex, 1)
end


--Loops through all buffs looking for a match and returns the index number
function SpellFlashAddon.GiveBuffIndex(SpellName, unit, mine, CheckRank, applications, isExpirationTimeGreater, isExpirationTimeOrLess, Stealable, castable, icon_texture, SpellToolTipLineTwo, Type)
	return SpellFlashAddon.CheckBuff(SpellName, unit, mine, CheckRank, applications, isExpirationTimeGreater, isExpirationTimeOrLess, Stealable, castable, icon_texture, SpellToolTipLineTwo, Type, nil, 1)
end

--Loops through all buffs looking for a match and returns the index number
function SpellFlashAddon.GiveDebuffIndex(SpellName, unit, mine, CheckRank, applications, isExpirationTimeGreater, isExpirationTimeOrLess, Stealable, dispelable, icon_texture, SpellToolTipLineTwo, Type)
	return SpellFlashAddon.CheckBuff(SpellName, unit, mine, CheckRank, applications, isExpirationTimeGreater, isExpirationTimeOrLess, Stealable, dispelable, icon_texture, SpellToolTipLineTwo, Type, nil, 1, 1)
end


-- Returns the amount of times a debuff is stacked on the target, and returns 0 if the debuff is not on the target.
function SpellFlashAddon.GetDebuffStack(SpellName, unit, mine, CheckRank, applications, isExpirationTimeGreater, isExpirationTimeOrLess, Stealable, castable, icon_texture, SpellToolTipLineTwo, Type, giveindex)
	return SpellFlashAddon.CheckBuff(SpellName, unit, mine, CheckRank, applications, isExpirationTimeGreater, isExpirationTimeOrLess, Stealable, castable, icon_texture, SpellToolTipLineTwo, Type, 1, giveindex, 1)
end

-- Returns the amount of times a buff is stacked on the target, and returns 0 if the buff is not on the target.
function SpellFlashAddon.GetBuffStack(SpellName, unit, mine, CheckRank, applications, isExpirationTimeGreater, isExpirationTimeOrLess, Stealable, castable, icon_texture, SpellToolTipLineTwo, Type, giveindex, Debuff)
	return SpellFlashAddon.CheckBuff(SpellName, unit, mine, CheckRank, applications, isExpirationTimeGreater, isExpirationTimeOrLess, Stealable, castable, icon_texture, SpellToolTipLineTwo, Type, 1, giveindex, Debuff)
end


function SpellFlashAddon.CheckMainHandItemBuff(SpellName)
	return SpellFlashAddon.CheckBuff(SpellName, "MainHandSlot")
end

function SpellFlashAddon.CheckOffHandItemBuff(SpellName)
	return SpellFlashAddon.CheckBuff(SpellName, "SecondaryHandSlot")
end

function SpellFlashAddon.CheckHandItemBuff(SpellName, hand)
	if hand then
		local hand = string.lower(""..hand)
		if hand == "main" or hand == 1 or hand == "1" or hand == "mainhandslot" then
			return SpellFlashAddon.CheckBuff(SpellName, "MainHandSlot")
		elseif hand == "off" or hand == 2 or hand == "2" or hand == "secondaryhandslot" then
			return SpellFlashAddon.CheckBuff(SpellName, "SecondaryHandSlot")
		end
		SpellFlashAddon.debug("Valid arguments for SpellFlashAddon.CheckHandItemBuff() are: \"main\", \"off\", 1, 2 and nil")
	else
		return SpellFlashAddon.CheckBuff(SpellName, "MainHandSlot") or SpellFlashAddon.CheckBuff(SpellName, "SecondaryHandSlot")
	end
	return false
end




function SpellFlashAddon.IsUnit(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	local unit = unit or "target"
	return ( UnitExists(unit)
		and ( not enemy or ( UnitCanAttack("player", unit) and ( not UnitIsDeadOrGhost(unit) or UnitExists(unit.."target") or UnitAffectingCombat(unit) ) ) )
		and ( not active or ( not UnitIsDeadOrGhost(unit) and ( UnitAffectingCombat(unit) or UnitExists(unit.."target") or UnitHealth(unit) < UnitHealthMax(unit) or UnitIsPlayer(unit) or ( UnitIsEnemy("player", unit) and CheckInteractDistance(unit, 3) ) ) and not SpellFlashAddon.IsNoDamageCC(unit) ) )
		and ( not player or UnitIsPlayer(unit) )
		and ( not mob or ( not UnitPlayerControlled(unit) and (enemy or UnitExists(unit)) ) )
		and ( not givesxp or ( (enemy or (UnitCanAttack("player", unit) and (not UnitIsDeadOrGhost(unit) or UnitExists(unit.."target") or UnitAffectingCombat(unit) or (UnitIsPlayer(unit) and SpellFlashAddon.IsClass("Hunter", unit))))) and not UnitIsTrivial(unit) and UnitFactionGroup(unit) ~= UnitFactionGroup("player") and not (UnitPlayerControlled(unit) and not UnitIsPlayer(unit)) and (UnitIsPlayer(unit) or not UnitIsTapped(unit) or UnitIsTappedByPlayer(unit)) ) )
		and ( not lessthenhealthpercent or SpellFlashAddon.HealthPercent(unit) <= lessthenhealthpercent )
		and ( not unithasnotarget or not UnitExists(unit.."target") )
		and ( not unitistargetingyou or UnitIsUnit(unit.."target", "player") )
		and ( not unitistargetingyourfriend or (not UnitIsUnit(unit.."target", "player") and UnitIsFriend("player", unit.."target")) )
		and ( not unitistargetingselforitsfriend or UnitCanAttack("player", unit.."target") )
		and ( not isboss or string.find(string.lower(UnitClassification(unit) or ""), "boss") or ( UnitLevel(unit) == -1 and not UnitPlayerControlled(unit) ) )
	)
end


function SpellFlashAddon.IsEnemy(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	return SpellFlashAddon.IsUnit(unit, 1, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
end

function SpellFlashAddon.IsActiveEnemy(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	return SpellFlashAddon.IsUnit(unit, 1, 1, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
end

function SpellFlashAddon.IsActiveEnemyThatGivesXP(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	return SpellFlashAddon.IsUnit(unit, 1, 1, player, mob, 1, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
end

function SpellFlashAddon.IsBoss(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	return SpellFlashAddon.IsUnit(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, 1)
end

function SpellFlashAddon.IsEnemyBoss(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	return SpellFlashAddon.IsUnit(unit, 1, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, 1)
end

function SpellFlashAddon.IsActiveEnemyBoss(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	return SpellFlashAddon.IsUnit(unit, 1, 1, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, 1)
end

function SpellFlashAddon.GivesXP(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	return SpellFlashAddon.IsUnit(unit, 1, active, player, mob, 1, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
end

function SpellFlashAddon.IsEnemyPlayer(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	return SpellFlashAddon.IsUnit(unit, 1, active, 1, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
end

function SpellFlashAddon.IsEnemyMob(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	return SpellFlashAddon.IsUnit(unit, 1, active, player, 1, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
end

function SpellFlashAddon.IsActiveEnemyMob(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	return SpellFlashAddon.IsUnit(unit, 1, 1, player, 1, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
end

function SpellFlashAddon.IsDieingEnemy(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	return SpellFlashAddon.IsUnit(unit, 1, active, player, mob, givesxp, 20, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
end

function SpellFlashAddon.IsDieingEnemyWithNoTarget(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	return SpellFlashAddon.IsUnit(unit, 1, active, player, mob, givesxp, 20, 1, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
end

function SpellFlashAddon.IsEnemyTargetingYou(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	return SpellFlashAddon.IsUnit(unit, 1, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, 1, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
end

function SpellFlashAddon.IsActiveEnemyTargetingYou(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	return SpellFlashAddon.IsUnit(unit, 1, 1, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, 1, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
end

function SpellFlashAddon.IsEnemyBossTargetingYou(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	return SpellFlashAddon.IsUnit(unit, 1, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, 1, unitistargetingyourfriend, unitistargetingselforitsfriend, 1)
end

function SpellFlashAddon.IsEnemyTargetingFriendButNotYou(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	return SpellFlashAddon.IsUnit(unit, 1, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, 1, unitistargetingselforitsfriend, isboss)
end

function SpellFlashAddon.IsEnemyTargetingEnemy(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	return SpellFlashAddon.IsUnit(unit, 1, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, 1)
end

function SpellFlashAddon.IsFriendTargetingEnemy(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	if UnitIsFriend("player", unit or "target") and SpellFlashAddon.IsEnemy(unit or "target".."target", enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss) then
		return true
	end
	return false
end

function SpellFlashAddon.IsFriendTargetingActiveEnemy(unit, enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss)
	if UnitIsFriend("player", unit or "target") and SpellFlashAddon.IsActiveEnemy(unit or "target".."target", enemy, active, player, mob, givesxp, lessthenhealthpercent, unithasnotarget, unitistargetingyou, unitistargetingyourfriend, unitistargetingselforitsfriend, isboss) then
		return true
	end
	return false
end







-- checks to see if a fist weapon is equipped in the main hand
function SpellFlashAddon.IsHandFistWeapon(offhand)
	local offhand = offhand
	if offhand then
		offhand = "SecondaryHandSlot"
	end
	local slot = GetInventorySlotInfo(offhand or "MainHandSlot")
	if SpellFlashAddon.GetItemSubType(GetInventoryItemLink("player", slot)) == (GetSpellInfo(15590--[[Fist Weapons]])) then
		if GetInventoryItemBroken("player", slot) then
			--SpellFlashAddon.debug("Your fist weapon in the main hand is broken.")
			return false
		end
		--SpellFlashAddon.debug("You have a fist weapon equipped in the main hand.", 2)
		return true
	end
	--SpellFlashAddon.debug("You do not have a fist weapon equipped in the main hand.", 2)
	return false
end

-- checks to see if a stave is equipped in the main hand
function SpellFlashAddon.IsHandStave(offhand)
	local offhand = offhand
	if offhand then
		offhand = "SecondaryHandSlot"
	end
	local slot = GetInventorySlotInfo(offhand or "MainHandSlot")
	if SpellFlashAddon.GetItemSubType(GetInventoryItemLink("player", slot)) == (GetSpellInfo(227--[[Staves]])) then
		if GetInventoryItemBroken("player", slot) then
			--SpellFlashAddon.debug("Your stave in the main hand is broken.")
			return false
		end
		--SpellFlashAddon.debug("You have a stave equipped in the main hand.", 2)
		return true
	end
	--SpellFlashAddon.debug("You do not have a stave equipped.", 2)
	return false
end

-- checks to see if a polearm is equipped in the main hand
function SpellFlashAddon.IsHandPolearm(offhand)
	local offhand = offhand
	if offhand then
		offhand = "SecondaryHandSlot"
	end
	local slot = GetInventorySlotInfo(offhand or "MainHandSlot")
	if SpellFlashAddon.GetItemSubType(GetInventoryItemLink("player", slot)) == (GetSpellInfo(200--[[Polearms]])) then
		if GetInventoryItemBroken("player", slot) then
			--SpellFlashAddon.debug("Your polearm in the main hand is broken.")
			return false
		end
		--SpellFlashAddon.debug("You have a polearm equipped in the main hand.", 2)
		return true
	end
	--SpellFlashAddon.debug("You do not have a polearm equipped.", 2)
	return false
end

-- checks to see if a one or two handed mace is equipped in the main hand
function SpellFlashAddon.IsHandMace(offhand)
	local offhand = offhand
	if offhand then
		offhand = "SecondaryHandSlot"
	end
	local slot = GetInventorySlotInfo(offhand or "MainHandSlot")
	local itemType = SpellFlashAddon.GetItemSubType(GetInventoryItemLink("player", slot))
	if itemType == (GetSpellInfo(198--[[One-Handed Maces]])) or itemType == (GetSpellInfo(199--[[Two-Handed Maces]])) then
		if GetInventoryItemBroken("player", slot) then
			--SpellFlashAddon.debug("Your mace in the main hand is broken.")
			return false
		end
		--SpellFlashAddon.debug("You have a mace equipped in the main hand.", 2)
		return true
	end
	--SpellFlashAddon.debug("You do not have a mace equipped in the main hand.", 2)
	return false
end

-- checks to see if a one or two handed axe is equipped in the main hand
function SpellFlashAddon.IsHandAxe(offhand)
	local offhand = offhand
	if offhand then
		offhand = "SecondaryHandSlot"
	end
	local slot = GetInventorySlotInfo(offhand or "MainHandSlot")
	local itemType = SpellFlashAddon.GetItemSubType(GetInventoryItemLink("player", slot))
	if itemType == (GetSpellInfo(196--[[One-Handed Axes]])) or itemType == (GetSpellInfo(197--[[Two-Handed Axes]])) then
		if GetInventoryItemBroken("player", slot) then
			--SpellFlashAddon.debug("Your axe in the main hand is broken.")
			return false
		end
		--SpellFlashAddon.debug("You have a axe equipped in the main hand.", 2)
		return true
	end
	--SpellFlashAddon.debug("You do not have a axe equipped in the main hand.", 2)
	return false
end

-- checks to see if a one or two handed sword is equipped in the main hand
function SpellFlashAddon.IsHandSword(offhand)
	local offhand = offhand
	if offhand then
		offhand = "SecondaryHandSlot"
	end
	local slot = GetInventorySlotInfo(offhand or "MainHandSlot")
	local itemType = SpellFlashAddon.GetItemSubType(GetInventoryItemLink("player", slot))
	if itemType == (GetSpellInfo(201--[[One-Handed Swords]])) or itemType == (GetSpellInfo(202--[[Two-Handed Swords]])) then
		if GetInventoryItemBroken("player", slot) then
			--SpellFlashAddon.debug("Your sword in the main hand is broken.")
			return false
		end
		--SpellFlashAddon.debug("You have a sword equipped in the main hand.", 2)
		return true
	end
	--SpellFlashAddon.debug("You do not have a sword equipped in the main hand.", 2)
	return false
end

-- checks to see if a dagger is equipped in the main hand
function SpellFlashAddon.IsHandDagger(offhand)
	local offhand = offhand
	if offhand then
		offhand = "SecondaryHandSlot"
	end
	local slot = GetInventorySlotInfo(offhand or "MainHandSlot")
	if SpellFlashAddon.GetItemSubType(GetInventoryItemLink("player", slot)) == (GetSpellInfo(1180--[[Daggers]])) then
		if GetInventoryItemBroken("player", slot) then
			--SpellFlashAddon.debug("Your dagger in the main hand is broken.")
			return false
		end
		--SpellFlashAddon.debug("You have a dagger equipped in the main hand.", 2)
		return true
	end
	--SpellFlashAddon.debug("You do not have a dagger equipped in the main hand.", 2)
	return false
end

-- checks to see if a dagger is equipped in the main hand
function SpellFlashAddon.IsShieldEquipped()
	local slot = GetInventorySlotInfo("SecondaryHandSlot")
	if SpellFlashAddon.GetItemSubType(GetInventoryItemLink("player", slot)) == Table.Localize["Shields"] then
		if GetInventoryItemBroken("player", slot) then
			--SpellFlashAddon.debug("Your shield in the main hand is broken.")
			return false
		end
		--SpellFlashAddon.debug("You have a shield equipped in the main hand.", 2)
		return true
	end
	--SpellFlashAddon.debug("You do not have a shield equipped in the main hand.", 2)
	return false
end


-- checks to see if a main hand item is equipped
function SpellFlashAddon.IsHandEquipped(offhand)
	local offhand = offhand
	if offhand then
		offhand = "SecondaryHandSlot"
	end
	local slot = GetInventorySlotInfo(offhand or "MainHandSlot")
	if (GetInventoryItemLink("player", slot)) then
		if GetInventoryItemBroken("player", slot) then
			--SpellFlashAddon.debug("Your main hand item is broken.")
			return false
		end
		--SpellFlashAddon.debug("You have a main hand item equipped.", 2)
		return true
	end
	--SpellFlashAddon.debug("You do not have a main hand item equipped.", 2)
	return false
end

-- checks to see if a main hand item is equipped
function SpellFlashAddon.IsOffHandEquipped()
	return SpellFlashAddon.IsHandEquipped(1)
end


-- This is a test function
function SpellFlashAddon.ShowMainHandType()
	if (GetInventoryItemLink("player",GetInventorySlotInfo("MainHandSlot"))) then
		SpellFlashAddon.msg(SpellFlashAddon.GetItemSubType(GetInventoryItemLink("player",GetInventorySlotInfo("MainHandSlot"))))
	else
		SpellFlashAddon.msg("You do not have a main hand item equipped.")
	end
end

-- This is a test function
function SpellFlashAddon.ShowOffHandType()
	if (GetInventoryItemLink("player",GetInventorySlotInfo("SecondaryHandSlot"))) then
		SpellFlashAddon.msg(SpellFlashAddon.GetItemSubType(GetInventoryItemLink("player",GetInventorySlotInfo("SecondaryHandSlot"))))
	else
		SpellFlashAddon.msg("You do not have a off hand item equipped.")
	end
end






function SpellFlashAddon.IsTrinketByNameReady(name, find, id)
	if name or id then
		local n = SpellFlashAddon.GiveTrinketSlotNumberByName(name, find, id)
		if n then
			local s, d, e = GetInventoryItemCooldown("player", n)
			if e == 1 and s == 0 then
				return true
			end
		end
	end
	return false
end
function SpellFlashAddon.IsTrinketByItemIDReady(id, name, find)
	return SpellFlashAddon.IsTrinketByNameReady(name, find, id)
end


function SpellFlashAddon.IsTrinketByNameEquipped(name, find, id)
	if SpellFlashAddon.GiveTrinketSlotNumberByName(name, find, id) then
		return true
	end
	return false
end
function SpellFlashAddon.IsTrinketByItemIDEquipped(id, name, find)
	return SpellFlashAddon.IsTrinketByNameEquipped(name, find, id)
end


function SpellFlashAddon.GiveTrinketSlotNumberByName(name, find, id)
	if name or id then
		local id = SpellFlashAddon.GiveItemIDFromItemLink(id) or id
		for i=0,1 do
			local slot = GetInventorySlotInfo("Trinket"..i.."Slot")
			local link = GetInventoryItemLink("player", slot)
			local n, d = SpellFlashAddon.DecodeItemLink(link)
			if id then
				if d and (d == id or ""..d == id or "item:"..d..":0:0:0" == id or "item:"..d == id or d..":0:0:0" == id) then
					return slot
				end
			elseif name then
				if n then
					if (find and string.find(n, name)) or n == name then
						return slot
					end
				end
			end
		end
		if name then
			SpellFlashAddon.debug("Trinket: ( "..name.." ) is not equipped!")
		else
			local N = GetItemInfo(id)
			if N then
				SpellFlashAddon.debug("Trinket: ( "..N.." ) is not equipped!")
			end
		end
	else
		SpellFlashAddon.debug("Trinket name and id not given!")
	end
	return nil
end
function SpellFlashAddon.GiveTrinketSlotNumberByItemID(id, name, find)
	return SpellFlashAddon.GiveTrinketSlotNumberByName(name, find, id)
end






function SpellFlashAddon.IsItemByNameEquipped(name, find, id)
	if SpellFlashAddon.GiveEquippedItemSlotNumberByName(name, find, id) then
		return true
	end
	return false
end
function SpellFlashAddon.IsItemByItemIDEquipped(id, name, find)
	return SpellFlashAddon.IsItemByNameEquipped(name, find, id)
end


function SpellFlashAddon.GiveEquippedItemSlotNumberByName(name, find, id)
	if name or id then
		local id = SpellFlashAddon.GiveItemIDFromItemLink(id) or id
		for slot=0,19 do
			local link = GetInventoryItemLink("player", slot)
			local n, d = SpellFlashAddon.DecodeItemLink(link)
			if id then
				if d and (d == id or ""..d == id or "item:"..d..":0:0:0" == id or "item:"..d == id or d..":0:0:0" == id) then
					return slot
				end
			elseif name then
				if n then
					if (find and string.find(n, name)) or n == name then
						return slot
					end
				end
			end
		end
		if name then
			SpellFlashAddon.debug("Item: ( "..name.." ) is not equipped!")
		else
			local N = GetItemInfo(id)
			if N then
				SpellFlashAddon.debug("Item: ( "..N.." ) is not equipped!")
			end
		end
	else
		SpellFlashAddon.debug("Equipped Item name and id not given!")
	end
	return nil
end
function SpellFlashAddon.GiveEquippedItemSlotNumberByItemID(id, name, find)
	return SpellFlashAddon.GiveEquippedItemSlotNumberByName(name, find, id)
end


function SpellFlashAddon.DecodeItemLink(link)
	if link then
		local found, _, id, name = string.find(link, "item:(%d+):.*%[(.*)%]")
		if found then
			return name, tonumber(id)
		end
	end
	return nil
end

function SpellFlashAddon.GiveItemNameFromItemLink(link)
	return (SpellFlashAddon.DecodeItemLink(link))
end

function SpellFlashAddon.GiveItemIDFromItemLink(link)
	return select(2,SpellFlashAddon.DecodeItemLink(link))
end



function SpellFlashAddon.GetItemSubType(id)
	if id then
		return select(7,GetItemInfo(id))
	end
	return nil
end

function SpellFlashAddon.GetItemName(id)
	if id then
		return (GetItemInfo(id))
	end
	return nil
end



function SpellFlashAddon.PetCastable(SpellName, PetFrameNeeded, PetHealthNotNeeded)
	if ( PetHealthNotNeeded or UnitHealth("pet") > 0 ) and ( not PetFrameNeeded or UnitExists("pet") ) then
		for n=1,NUM_PET_ACTION_SLOTS do
			local name, subtext, texture, isToken, isActive = GetPetActionInfo(n)
			if name == ( PET_BUTTON_NAME[SpellName] or SpellName ) then
				if isActive then
					return false
				end
				if not GetPetActionSlotUsable(n) then
					return false
				end
				if select(2,GetPetActionCooldown(n)) > 0 then
					return false
				end
				return true
			end
		end
	end
	return false
end
SpellFlashAddon.PetBarActionCastable = SpellFlashAddon.PetCastable


function SpellFlashAddon.CheckIfSpellCastable(InfoArray)
	local z = InfoArray
	if type(z) ~= "table" then
		z = {SpellName = z}
	end
	if not z.SpellName then
		return false
	end
	if z.EnemyTargetNeeded and SpellFlashAddon.IsImmune(z.SpellName) then
		return false
	end
	local SpellCast = SpellFlashAddon.Casting()
	local isUsable, notEnoughPower = IsUsableSpell(z.SpellName)
	local name, rank, icon, cost, isFunnel, powerType, castTime = GetSpellInfo(z.SpellName)
	local SpellCastPower = SpellFlashAddon.GetSpellCost(SpellCast, powerType)
	local cooldown = select(2,GetSpellCooldown(z.SpellName))
	z.CastTime = z.CastTime or (castTime or 0) / 1000
	return (( z.EvenIfNotUsable or isUsable ) and not notEnoughPower
		and ( not SpellCast or SpellCastPower == 0 or UnitPower("player", powerType) >= ( (cost or 0) + SpellCastPower ) )
		and ( cooldown == 0 or ( select(2,GetSpellCooldown(GLOBALCOOLDOWNSPELL[CLASS] or "")) or 1.5 ) >= ( cooldown or 0 ) )
		and ( ( not z.NotIfActive and not z.DebuffName and not z.BuffName and not z.Debuff and not z.Buff and not z.MyDebuff and not z.MyBuff ) or ( not IsCurrentSpell(z.SpellName) and not SpellFlashAddon.CastingOrChanneling(z.SpellName) ) )
		and ( z.NoRangeCheck or ( z.Buff and ( not z.BuffUnit or UnitIsUnit(z.BuffUnit, "player") ) ) or not SpellHasRange(z.SpellName) or IsSpellInRange(z.SpellName, z.BuffUnit) == 1 )
		and ( not z.EnemyTargetNeeded or SpellFlashAddon.IsEnemy() )
		and ( not z.TargetThatUsesManaNeeded or UnitPowerType("target") == 0 )
		and ( not z.DebuffSlotNeeded or not SpellFlashAddon.AllDebuffSlotsUsed() )
		and ( not z.DebuffName or ( not SpellFlashAddon.AuraDelay(z.DebuffName) and not SpellFlashAddon.CheckDebuff(z.DebuffName,nil,z.IsMine,true,nil,z.CastTime) ) )
		and ( not z.BuffName or ( not SpellFlashAddon.AuraDelay(z.BuffName, z.BuffUnit) and not SpellFlashAddon.CheckBuff(z.BuffName,z.BuffUnit,z.IsMine,true,nil,z.CastTime) ) )
		and ( not z.Debuff or ( not SpellFlashAddon.AuraDelay(z.Debuff) and not SpellFlashAddon.CheckDebuff(z.Debuff,nil,nil,true,nil,z.CastTime) ) )
		and ( not z.Buff or ( not SpellFlashAddon.AuraDelay(z.Buff, z.BuffUnit) and not SpellFlashAddon.CheckBuff(z.Buff,z.BuffUnit,nil,true,nil,z.CastTime) ) )
		and ( not z.MyDebuff or ( not SpellFlashAddon.AuraDelay(z.MyDebuff) and not SpellFlashAddon.CheckDebuff(z.MyDebuff,nil,1,true,nil,z.CastTime) ) )
		and ( not z.MyBuff or ( not SpellFlashAddon.AuraDelay(z.MyBuff, z.BuffUnit) and not SpellFlashAddon.CheckBuff(z.MyBuff,z.BuffUnit,1,true,nil,z.CastTime) ) )
	)
end


function SpellFlashAddon.CheckIfVehicleSpellCastable(InfoArray)
	if not UnitHasVehicleUI("player") then return false end
	local z = InfoArray
	if type(z) ~= "table" then
		z = {SpellName = z}
	end
	if not z.SpellName then
		return false
	end
	if z.EnemyTargetNeeded and SpellFlashAddon.IsImmune(z.SpellName) then
		return false
	end
	local slot = SpellFlashAddon.VehicleSlot(z.SpellName)
	if not slot then
		return false
	end
	local isUsable, notEnoughPower = IsUsableAction(slot)
	local cooldown = select(2,GetActionCooldown(slot))
	return (( z.EvenIfNotUsable or isUsable ) and not notEnoughPower
		and ( cooldown == 0 or ( z.GlobalVehicleCooldownSpell and ( select(2,GetActionCooldown(SpellFlashAddon.VehicleSlot(z.GlobalVehicleCooldownSpell))) or 1.5 ) >= ( cooldown or 0 ) ) )
		and ( ( not z.NotIfActive and not z.DebuffName and not z.BuffName and not z.Debuff and not z.Buff and not z.MyDebuff and not z.MyBuff ) or ( not IsCurrentAction(slot) and not SpellFlashAddon.CastingOrChanneling(z.SpellName, "vehicle") ) )
		and ( z.NoRangeCheck or ( z.Buff and ( not z.BuffUnit or UnitIsUnit(z.BuffUnit, "player") ) ) or not ActionHasRange(slot) or IsActionInRange(slot) == 1 )
		and ( not z.EnemyTargetNeeded or SpellFlashAddon.IsEnemy() )
		and ( not z.TargetThatUsesManaNeeded or UnitPowerType("target") == 0 )
		and ( not z.DebuffSlotNeeded or not SpellFlashAddon.AllDebuffSlotsUsed() )
		and ( not z.DebuffName or not SpellFlashAddon.CheckDebuff(z.DebuffName,nil,z.IsMine) )
		and ( not z.BuffName or not SpellFlashAddon.CheckBuff(z.BuffName,z.BuffUnit,z.IsMine) )
		and ( not z.Debuff or not SpellFlashAddon.CheckDebuff(z.Debuff) )
		and ( not z.Buff or not SpellFlashAddon.CheckBuff(z.Buff,z.BuffUnit) )
		and ( not z.MyDebuff or not SpellFlashAddon.CheckDebuff(z.MyDebuff,nil,1) )
		and ( not z.MyBuff or not SpellFlashAddon.CheckBuff(z.MyBuff,z.BuffUnit,1) )
	)
end


function SpellFlashAddon.CheckIfItemCastable(InfoArray)
	local z = InfoArray
	if type(z) ~= "table" then
		z = {ItemName = z}
	end
	if not z.ItemName then
		return false
	end
	if z.EnemyTargetNeeded and SpellFlashAddon.IsImmune(z.ItemName) then
		return false
	end
	local isUsable, notEnoughPower = IsUsableItem(z.ItemName)
	local cooldown = select(2,GetItemCooldown(z.ItemName))
	return (( z.EvenIfNotUsable or isUsable ) and not notEnoughPower
		and ( not IsEquippableItem(z.ItemName) or IsEquippedItem(z.ItemName) )
		and ( cooldown == 0 or ( select(2,GetSpellCooldown(GLOBALCOOLDOWNSPELL[CLASS] or "")) or 1.5 ) >= ( cooldown or 0 ) )
		and ( ( not z.NotIfActive and not z.DebuffName and not z.BuffName and not z.Debuff and not z.Buff and not z.MyDebuff and not z.MyBuff ) or ( not IsCurrentItem(z.ItemName) and not SpellFlashAddon.CastingOrChanneling(z.ItemName) ) )
		and ( z.NoRangeCheck or ( z.Buff and ( not z.BuffUnit or UnitIsUnit(z.BuffUnit, "player") ) ) or not ItemHasRange(z.ItemName) or IsItemInRange(z.ItemName, z.BuffUnit) == 1 )
		and ( not z.EnemyTargetNeeded or SpellFlashAddon.IsEnemy() )
		and ( not z.TargetThatUsesManaNeeded or UnitPowerType("target") == 0 )
		and ( not z.DebuffSlotNeeded or not SpellFlashAddon.AllDebuffSlotsUsed() )
		and ( not z.DebuffName or not SpellFlashAddon.CheckDebuff(z.DebuffName,nil,z.IsMine) )
		and ( not z.BuffName or not SpellFlashAddon.CheckBuff(z.BuffName,z.BuffUnit,z.IsMine) )
		and ( not z.Debuff or not SpellFlashAddon.CheckDebuff(z.Debuff) )
		and ( not z.Buff or not SpellFlashAddon.CheckBuff(z.Buff,z.BuffUnit) )
		and ( not z.MyDebuff or not SpellFlashAddon.CheckDebuff(z.MyDebuff,nil,1) )
		and ( not z.MyBuff or not SpellFlashAddon.CheckBuff(z.MyBuff,z.BuffUnit,1) )
	)
end



function SpellFlashAddon.SetTimer(Name, Seconds, RepeatSeconds, Function, ...)
	if type(Name) == "string" and Name ~= "" then
		TIMER[Name] = {}
		if type(Seconds) == "number" then
			TIMER[Name].Seconds = Seconds
		else
			TIMER[Name].Seconds = 0
		end
		if type(RepeatSeconds) == "number" then
			TIMER[Name].RepeatSeconds = RepeatSeconds
		else
			TIMER[Name].RepeatSeconds = 0
		end
		if type(Function) == "function" then
			TIMER[Name].Function = Function
			TIMER[Name].Args = {...}
		end
		if TIMER[Name].Seconds <= 0 then
			if TIMER[Name].Function then
				Function(...)
			end
			if TIMER[Name] and TIMER[Name].Seconds <= 0 then
				if TIMER[Name].RepeatSeconds > 0 then
					TIMER[Name].Seconds = TIMER[Name].RepeatSeconds
				else
					TIMER[Name] = nil
				end
			end
		end
	end
end

function SpellFlashAddon.ReplaceTimer(Name, Seconds, RepeatSeconds, Function, ...)
	if type(Name) == "string" and Name ~= "" and TIMER[Name] then
		if type(Seconds) == "number" then
			TIMER[Name].Seconds = Seconds
		elseif Seconds then
			TIMER[Name].Seconds = 0
		end
		if type(RepeatSeconds) == "number" then
			TIMER[Name].RepeatSeconds = RepeatSeconds
		elseif RepeatSeconds then
			TIMER[Name].RepeatSeconds = 0
		end
		if type(Function) == "function" then
			TIMER[Name].Function = Function
			TIMER[Name].Args = {...}
		elseif Function then
			TIMER[Name].Function = nil
		end
		return true
	end
	return false
end

function SpellFlashAddon.ClearTimer(Name, All)
	local found = false
	if type(Name) == "string" and Name ~= "" then
		if All then
			for k,v in pairs(TIMER) do
				if string.find(k, Name) then
					TIMER[k] = nil
					found = true
				end
			end
		elseif TIMER[Name] then
			TIMER[Name] = nil
			return true
		end
	end
	return found
end

function SpellFlashAddon.IsTimer(Name, Any)
	if type(Name) == "string" and Name ~= "" then
		if Any then
			for k,v in pairs(TIMER) do
				if string.find(k, Name) then
					return true
				end
			end
		elseif TIMER[Name] then
			return true
		end
	end
	return false
end

function SpellFlashAddon.GetTimer(Name)
	if type(Name) == "string" and Name ~= "" and TIMER[Name] then
		return TIMER[Name].Seconds
	end
	return 0
end





local function FlashFrame_OnUpdate(frame, arg1)
	local modifier = frame.FlashModifier
	frame.FlashModifier = modifier - modifier * arg1
	local newalpha = frame.FlashModifier * FLASHBRIGHTNESS
	if frame.FlashModifier < 0.1 or newalpha <= 0 then
		frame:Hide()
	else
		frame.FlashTexture:SetHeight(modifier * frame:GetHeight() * FLASHSIZE)
		frame.FlashTexture:SetWidth(modifier * frame:GetWidth() * FLASHSIZE)
		frame.FlashTexture:SetAlpha(newalpha)
	end
end

local function FlashFrame(frame, red, green, blue)
	if frame and frame:IsVisible() then
		if not frame.SpellFlashAddonFlashFrame then
			frame.SpellFlashAddonFlashFrame = CreateFrame("Frame", nil, frame)
			frame.SpellFlashAddonFlashFrame:Hide()
			frame.SpellFlashAddonFlashFrame:SetAllPoints(frame)
			frame.SpellFlashAddonFlashFrame.FlashTexture = frame.SpellFlashAddonFlashFrame:CreateTexture(nil, "OVERLAY")
			frame.SpellFlashAddonFlashFrame.FlashTexture:SetTexture("Interface\\Cooldown\\star4")
			frame.SpellFlashAddonFlashFrame.FlashTexture:SetPoint("CENTER", frame.SpellFlashAddonFlashFrame, "CENTER")
			frame.SpellFlashAddonFlashFrame.FlashTexture:SetBlendMode("ADD")
			frame.SpellFlashAddonFlashFrame:SetScript("OnUpdate", FlashFrame_OnUpdate)
			frame.SpellFlashAddonFlashFrame:SetAlpha(1)
		end
		frame.SpellFlashAddonFlashFrame.FlashModifier = 1
		frame.SpellFlashAddonFlashFrame.FlashTexture:SetAlpha(1 * FLASHBRIGHTNESS)
		frame.SpellFlashAddonFlashFrame.FlashTexture:SetHeight(frame.SpellFlashAddonFlashFrame:GetHeight() * FLASHSIZE)
		frame.SpellFlashAddonFlashFrame.FlashTexture:SetWidth(frame.SpellFlashAddonFlashFrame:GetWidth() * FLASHSIZE)
		if type(red) == "string" then
			local t = COLORTABLE[string.lower(red)]
			if t then
				frame.SpellFlashAddonFlashFrame.FlashTexture:SetVertexColor(t[1] or 1, t[2] or 1, t[3] or 1)
			else
				frame.SpellFlashAddonFlashFrame.FlashTexture:SetVertexColor(1, 1, 1)
			end
		else
			frame.SpellFlashAddonFlashFrame.FlashTexture:SetVertexColor(red or 1, green or 1, blue or 1)
		end
		frame.SpellFlashAddonFlashFrame:Show()
		return true
	end
	return false
end

local function FlashActionButton(button, red, green, blue)
	if button and FRAMESREGISTERED then
		for _, frame in ipairs(SpellFlashAddon.ButtonFrames.Action) do
			if frame.action == button then
				FlashFrame(frame, red, green, blue)
			end
		end
	end
end


function SpellFlashAddon.FlashAction(SpellName, red, green, blue)
	if BUTTONSREGISTERED and SpellName and SpellName ~= "" then
		if SpellButtons[SpellName] then
			for _, button in ipairs(SpellButtons[SpellName]) do
				FlashActionButton(button, red, green, blue)
			end
		end
		if ExtraBar_SpellButtons[SpellName] then
			for _, frame in ipairs(ExtraBar_SpellButtons[SpellName]) do
				FlashFrame(frame, red, green, blue)
			end
		end
		if ItemButtons[SpellName] then
			for _, button in ipairs(ItemButtons[SpellName]) do
				FlashActionButton(button, red, green, blue)
			end
		end
		if ExtraBar_ItemButtons[SpellName] then
			for _, frame in ipairs(ExtraBar_ItemButtons[SpellName]) do
				FlashFrame(frame, red, green, blue)
			end
		end
		local SpellTexture = GetSpellTexture(SpellName)
		local ItemTexture = GetItemIcon(SpellName)
		for n,v in pairs(MacroButtons) do
			local name, MacroTexture, body = GetMacroInfo(tonumber(n))
			if body and string.find(string.lower(body), string.lower(SpellName)) and ( MacroTexture == SpellTexture or MacroTexture == ItemTexture ) then
				for _, button in ipairs(v) do
					FlashActionButton(button, red, green, blue)
				end
			end
		end
		for n,v in pairs(ExtraBar_MacroButtons) do
			local name, MacroTexture, body = GetMacroInfo(tonumber(n))
			if body and string.find(string.lower(body), string.lower(SpellName)) and ( MacroTexture == SpellTexture or MacroTexture == ItemTexture ) then
				for _, frame in ipairs(v) do
					FlashFrame(frame, red, green, blue)
				end
			end
		end
	end
end
SpellFlashAddon.FlashActionButtonBySpellName = SpellFlashAddon.FlashAction

function SpellFlashAddon.FlashVehicle(SpellName, red, green, blue)
	if SpellName and UnitHasVehicleUI("player") and FRAMESREGISTERED then
		for n=121,126 do
			if GetActionSlotInfo(n) == SpellName then
				for _, frame in ipairs(SpellFlashAddon.ButtonFrames.Vehicle) do
					if frame.action == n then
						FlashFrame(frame, red, green, blue)
					end
				end
				for _, frame in ipairs(SpellFlashAddon.ButtonFrames.Action) do
					if frame.action == n then
						FlashFrame(frame, red, green, blue)
					end
				end
			end
		end
	end
end
SpellFlashAddon.FlashVehicleButtonBySpellName = SpellFlashAddon.FlashVehicle

function SpellFlashAddon.FlashPet(SpellName, red, green, blue)
	if SpellName and FRAMESREGISTERED then
		for n=1,NUM_PET_ACTION_SLOTS do
			if GetPetActionInfo(n) == ( PET_BUTTON_NAME[SpellName] or SpellName ) then
				for _, frame in ipairs(SpellFlashAddon.ButtonFrames.Pet) do
					if frame:GetID() == n then
						FlashFrame(frame, red, green, blue)
					end
				end
			end
		end
	end
end
SpellFlashAddon.FlashPetButtonBySpellName = SpellFlashAddon.FlashPet

function SpellFlashAddon.FlashForm(SpellName, red, green, blue)
	if SpellName and FRAMESREGISTERED then
		for n=1,GetNumShapeshiftForms() do
			if select(2,GetShapeshiftFormInfo(n)) == SpellName then
				for _, frame in ipairs(SpellFlashAddon.ButtonFrames.Form) do
					if frame:GetID() == n then
						FlashFrame(frame, red, green, blue)
					end
				end
			end
		end
	end
end
SpellFlashAddon.FlashFormButtonBySpellName = SpellFlashAddon.FlashForm


function SpellFlashAddon.Flashable(SpellName)
	if SpellName and FRAMESREGISTERED and ( SpellFlashAddon.IsSpellKnown(SpellName) or SpellFlashAddon.IsItemKnown(SpellName) ) then
		if SpellButtons[SpellName] or ExtraBar_SpellButtons[SpellName] or ItemButtons[SpellName] or ExtraBar_ItemButtons[SpellName] then
			return true
		end
		local SpellTexture = GetSpellTexture(SpellName)
		local ItemTexture = GetItemIcon(SpellName)
		for n,v in pairs(MacroButtons) do
			local name, MacroTexture, body = GetMacroInfo(tonumber(n))
			if body and string.find(string.lower(body), string.lower(SpellName)) and ( MacroTexture == SpellTexture or MacroTexture == ItemTexture ) then
				return true
			end
		end
		for n,v in pairs(ExtraBar_MacroButtons) do
			local name, MacroTexture, body = GetMacroInfo(tonumber(n))
			if body and string.find(string.lower(body), string.lower(SpellName)) and ( MacroTexture == SpellTexture or MacroTexture == ItemTexture ) then
				return true
			end
		end
	end
	return false
end
SpellFlashAddon.FlashableButtonFound = SpellFlashAddon.Flashable



-- Example: SpellFlashAddon.SaveAllFrameNameStringsIntoATable(What_Ever_Table_I_Want)
function SpellFlashAddon.SaveAllFrameNameStringsIntoATable(TABLE)
	if type(TABLE) == "table" then
		local s = "ALL DETECTABLE FRAME STRINGS"
		local Frame = EnumerateFrames()
		while Frame do
			if Frame:GetName() then
				if not TABLE[s] then
					TABLE[s] = {}
				end
				if Frame.IsProtected and Frame.GetObjectType and Frame.GetScript and Frame:GetObjectType() == "CheckButton" and Frame:IsProtected() then
					local script = Frame:GetScript("OnClick")
					if not TABLE[s].Buttons then
						TABLE[s].Buttons = {}
					end
					if script == FINDFORM then
						if not TABLE[s].Buttons.Form then
							TABLE[s].Buttons.Form = {}
						end
						TABLE[s].Buttons.Form[Frame:GetName()] = "form"
					elseif script == FINDPET then
						if not TABLE[s].Buttons.Pet then
							TABLE[s].Buttons.Pet = {}
						end
						TABLE[s].Buttons.Pet[Frame:GetName()] = "pet"
					elseif script == FINDVEHICLE then
						if not TABLE[s].Buttons.Vehicle then
							TABLE[s].Buttons.Vehicle = {}
						end
						TABLE[s].Buttons.Vehicle[Frame:GetName()] = "vehicle"
					elseif script == FINDACTION then
						if not TABLE[s].Buttons.Action then
							TABLE[s].Buttons.Action = {}
						end
						TABLE[s].Buttons.Action[Frame:GetName()] = "action"
					else
						if not TABLE[s].Buttons.Other then
							TABLE[s].Buttons.Other = {}
						end
						TABLE[s].Buttons.Other[Frame:GetName()] = "other"
					end
				else
					if not TABLE[s].Any then
						TABLE[s].Any = {}
					end
					TABLE[s].Any[Frame:GetName()] = "any"
				end
			end
			Frame = EnumerateFrames(Frame)
		end
	end
end



local Frame = CreateFrame("Frame")
Frame:RegisterEvent("PLAYER_REGEN_ENABLED")
Frame:RegisterEvent("PLAYER_REGEN_DISABLED")
Frame:RegisterEvent("ADDON_LOADED")
Frame:RegisterEvent("PLAYER_ENTERING_WORLD")
Frame:RegisterEvent("PLAYER_ALIVE")
Frame:RegisterEvent("ACTIONBAR_HIDEGRID")
Frame:RegisterEvent("ACTIONBAR_SHOWGRID")
Frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
Frame:RegisterEvent("LEARNED_SPELL_IN_TAB")
Frame:RegisterEvent("CHARACTER_POINTS_CHANGED")
Frame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
Frame:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
Frame:RegisterEvent("START_AUTOREPEAT_SPELL")
Frame:RegisterEvent("STOP_AUTOREPEAT_SPELL")
Frame:RegisterEvent("UNIT_ENTERED_VEHICLE")
Frame:RegisterEvent("UNIT_EXITED_VEHICLE")
Frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
Frame:RegisterEvent("PLAYER_TARGET_CHANGED")
Frame:RegisterEvent("UPDATE_MACROS")
Frame:SetScript("OnUpdate", OnUpdate)
Frame:SetScript("OnEvent", OnEvent)
Frame:Show()

CreateFrame("GameTooltip", "SpellFlashAddon_Tooltip", nil, "GameTooltipTemplate")
SpellFlashAddon_Tooltip:SetOwner(UIParent, "ANCHOR_NONE")
SpellFlashAddon_Tooltip:Hide()

