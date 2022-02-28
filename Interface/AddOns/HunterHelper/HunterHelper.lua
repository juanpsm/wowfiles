--------------------
-- Addon Declaration
--------------------
local HunterHelper = LibStub("AceAddon-3.0"):NewAddon("HunterHelper", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0", "LibSink-2.0")
local L = LibStub("AceLocale-3.0"):GetLocale("HunterHelper", false)
local LSM = LibStub("LibSharedMedia-3.0")
HunterHelper.version = GetAddOnMetadata("HunterHelper", "Version")
HunterHelper.versionstring = "HunterHelper v"..GetAddOnMetadata("HunterHelper", "Version")
_G["HunterHelper"] = HunterHelper

------------------
-- Register Sounds
------------------
LSM:Register("sound", "Alarm Clock", [[Sound\Interface\AlarmClockWarning3.wav]])
LSM:Register("sound", "Raid Warning", [[Sound\Interface\RaidWarning.wav]])
LSM:Register("sound", "Shay's Bell", [[Sound\Spells\ShaysBell.wav]])
LSM:Register("sound", "Snake Aspect", [[Sound\Spells\AspectofTheSnake.wav]])
LSM:Register("sound", "Bonk 1", [[Sound\Spells\Bonk1.wav]])
LSM:Register("sound", "Bonk 3", [[Sound\Spells\Bonk3.wav]])
LSM:Register("sound", "Tribal Drum", [[Sound\Doodad\BellTollTribal.wav]])
LSM:Register("sound", "Troll Gong", [[Sound\Doodad\G_GongTroll01.wav]])
LSM:Register("sound", "Raid Boss Warning", [[Sound\Interface\RaidBossWarning.wav]])

HH_SoundsList = {
	["Alarm Clock"] = "Alarm Clock",
	["Raid Warning"] = "Raid Warning",
	["Shay's Bell"] = "Shay's Bell",
	["Snake Aspect"] = "Snake Aspect",
	["Bonk 1"] = "Bonk 1",
	["Bonk 3"] = "Bonk 3",
	["Tribal Drum"] = "Tribal Drum",
	["Troll Gong"] = "Troll Gong",
	["Raid Boss Warning"] = "Raid Boss Warning",
}


------------
-- Constants
------------

VNDISPLAY_NONE = 1;
VNDISPLAY_SCT = 2;
VNDISPLAY_RW = 3;

HunterHelper.DisplayValue = {L["None"], L["Combat Text"], L["Raid Warning"]};


-- Lists all of the battle aspects.
-- HunterHelper can tell you when you're in combat without one of these selected.

-- Method: Since spell names are localized, use the SpellID of ANY rank of the desired spell.
-- On initialization, use GetSpellInfo() to get the localized name.

local spellIDs = {
	["Aspect of the Hawk"] = 13165,
	["Aspect of the Viper"] = 34074,
	["Aspect of the Dragonhawk"] = 61846,
	["Aspect of the Monkey"] = 13163,
	["Aspect of the Beast"] = 13161,
	["Aspect of the Wild"] = 20043,
	["Heart of the Phoenix"] = 54114,
	["Revive Pet"] = 982,
	["Growl"] = 2649,
}

local battleAspects = {}
local lowAspects = {}
local aspectDragonhawk;
local aspectViper;
local spellHeartofPhoenix;
local spellRevivePet;
local spellGrowl;
local spellGrowlSlotNum;


------------------
-- Local Variables
------------------
local HHConfig = {}

local defaults = {
	global = {
		SoundsEnabled = true,
		UpdateInterval = 5,
		MessageColor = {r=.2,g=.7,b=.9},
		DisplayMethod = VNDISPLAY_SCT,
		DisableWhenSolo = false,
		InCombatOnly = false,

		HighMana = {
			Enabled = true,
			Threshold = 100,
			Message = L["Default Full Mana Message"],
			Sound = "Alarm Clock",
		},
		LowMana = {
			Enabled = true,
			Threshold = 15,
			Message = L["Default Low Mana Message"],
			Sound = "Shay's Bell",
		},
		CombatNoAspect = {
			Enabled = true,
			Message = L["Default No Aspect Message"],
			Sound = "Troll Gong",
		},
		CombatDragonhawk = {
			Enabled = true,
			Message = L["Default Dragonhawk Message"],
			Sound = "Troll Gong",
		},
		CombatNoPet = {
			Enabled = true,
			Message = L["Default No Pet Message"],
			Sound = "Troll Gong",
		},
		PetPartyGrowl = {
			Enabled = true,
			PartySize = 3,
			Message = L["Default Party Growl Message"],
			Sound = "Raid Boss Warning",
		},
		PetSoloGrowl = {
			Enabled = true,
			Message = L["Default Solo Growl Message"],
			Sound = "Raid Boss Warning",
		},
		PetHappiness = {
			Enabled = true,
			Message = L["Default Pet Happiness Message"],
			Sound = "Shay's Bell",
		},
		PetPassive = {
			Enabled = true,
			Message = L["Default Pet Passive Message"],
			Sound = "Bonk 1",
		},
		PetAggressive = {
			Enabled = true,
			OnlyInParty = true,
			Message = L["Default Pet Aggressive Message"],
			Sound = "Troll Gong",
		},
	},
}




-----------------
-- Initialization
-----------------
function HunterHelper:OnInitialize()
	-- Only process anything if the player is a hunter.
	local _,gclass=UnitClass("player")
	if gclass ~= "HUNTER" then
		return
	end

	self:SetupOptions()

	self.lastUpdateTime = 0;						-- Allow us to display a warning immediately.
	self.lastDismountTime = 0;
	self.OnInitialize = nil;
	self.wasMounted = false;

	self:InitSpells();
end

function HunterHelper:OnEnable()
	-- Only process anything if the player is a hunter.
	local _,gclass=UnitClass("player")
	if gclass ~= "HUNTER" then
		return
	end

	self.UpdateTimer = self:ScheduleRepeatingTimer("ProcessCurrentState", 0.25)		-- Process every quarter-second.

	-- Load our current settings, or defaults if we don't have any.
	self.db = LibStub("AceDB-3.0"):New("HHConfig", defaults);
	HHConfig = self.db.global;

	self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED");
	self:RegisterEvent("SPELLS_CHANGED");

	self:GetCurrentGrowlSlot();
end

function HunterHelper:OnDisable()
	if self.UpdateTimer ~= nil then
		self:CancelTimer(self.UpdateTimer, true);
		self.UpdateTimer = nil;
	end

	self:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED");
	self:UnregisterEvent("SPELLS_CHANGED");
end

function HunterHelper:InitSpells()
	-- Query the server for the localized names of our spells.
	-- Note: select(x, GetSpellInfo(y)) returns all items starting at x when used inside an array constructor.
	-- The more laborious method here is a workaround.

	local x;
	x = GetSpellInfo(spellIDs["Aspect of the Hawk"]);		battleAspects[1] = x;	lowAspects[1] = x;
	x = GetSpellInfo(spellIDs["Aspect of the Viper"]);		battleAspects[2] = x;	aspectViper = x;
	x = GetSpellInfo(spellIDs["Aspect of the Dragonhawk"]);		battleAspects[3] = x;	aspectDragonhawk = x;
	x = GetSpellInfo(spellIDs["Aspect of the Monkey"]);		battleAspects[4] = x;	lowAspects[2] = x;
	x = GetSpellInfo(spellIDs["Aspect of the Beast"]);		battleAspects[5] = x;
	x = GetSpellInfo(spellIDs["Aspect of the Wild"]);		battleAspects[6] = x;
	
	x = GetSpellInfo(spellIDs["Heart of the Phoenix"]);		spellHeartofPhoenix = x;
	x = GetSpellInfo(spellIDs["Revive Pet"]);			spellRevivePet = x;
	x = GetSpellInfo(spellIDs["Growl"]);				spellGrowl = x;
end


------------------------
-- Process Current State
------------------------

function HunterHelper:SPELLS_CHANGED(eventID)
	self:GetCurrentGrowlSlot();
end
	

function HunterHelper:UNIT_SPELLCAST_SUCCEEDED(eventID, unitID, SpellName, SpellRank)
	-- If we just cast Heart of the Phoenix to battle-rez pet, suspend pet warnings
	-- for a few seconds to avoid spurious "Pet missing!" warnings.

	if (unitID == "pet" and SpellName == spellHeartofPhoenix) then
		self.lastDismountTime = GetTime();
	end
end

function HunterHelper:GetCurrentGrowlSlot()
	-- Iterate through the spells in the pet spellbook, if we have one.
	local i = 1;
	spellGrowlSlot = -1;

	while true do
		local spellName, spellRank = GetSpellName(i, BOOKTYPE_PET);
		if not spellName then
			do break end
		end

		if spellName == spellGrowl then
			spellGrowlSlot = i;
			do break end
		end

		i=i+1;
	end
end

function HunterHelper:PetIsGrowling()
	if spellGrowlSlot == -1 then
		return false;
	else
		return select(2, GetSpellAutocast(spellGrowlSlot, "pet")) == 1 and true or false;
	end
end


function HunterHelper:ProcessCurrentState()
	local currTime = GetTime();
	local isMounted = ((IsMounted() or UnitUsingVehicle("player") or UnitOnTaxi("player")) == 1) and true or false;
	
	local groupMembers = max(GetNumPartyMembers(),GetNumRaidMembers());

	-- Check to see if the current mounted state is different than the previous.

	-- NOTE: I track the state of whether a player is mounted, using a vehicle or on a taxi
	-- because Blizzard doesn't provide a simple, consistent way to do this through events.
	-- You can use UNIT_EXITING_VEHICLE, but for taxis and mounts, there doesn't appear to be
	-- a useful event that fires and gives you enough information to tell what happened and
	-- who it affected.  Since I don't actually care EXACTLY when the dismount occurs - I only
	-- need the info when the HH timer fires - I can just look for a change in the state and
	-- treat that as an event.

	if isMounted ~= self.wasMounted then
		if self.wasMounted then				-- Mount state changed from true to false (dismount/exit occurred since the previous update).
			self.lastDismountTime = currTime;	-- Mark when the state changed so we give the hunter pet time to respawn.
		end
		self.wasMounted = isMounted;
	end

	-- Skip processing if not enough time has elapsed since the last notification.
	if (currTime - self.lastUpdateTime < HHConfig.UpdateInterval) then
		return;

	-- Don't warn if dead or running back to corpse
	elseif UnitIsDead("player") or UnitIsGhost("player") then
		return;

	-- Don't bother me while I'm eating/drinking
	elseif (UnitBuff("player","Food") ~= nil) or (UnitBuff("player","Drink") ~= nil) then
		return;
	end

	-- Don't warn if mounted, or on a vehicle or taxi (option)
	if isMounted then
		return;
	
	-- Don't warn if not in combat (option)
	elseif HHConfig.InCombatOnly and not InCombatLockdown() then
		return;
	end

	-- Don't warn if solo (option)
	if HHConfig.DisableWhenSolo and groupMembers == 0 then
		return;
	end


	-- If we got here, then figure out what's going on.
	local InViper = (UnitBuff("player",aspectViper) ~= nil);
	local ManaLevel = floor(UnitPower("player") / UnitPowerMax("player") * 100);

	local DoNotify = false;
	local NotifyMessage = "";
	local NotifySound = nil;

	local hasPet = false;
	local petIsAlive = true;
	local petIsHappy = false;

	-- Check to see if we have a pet.
	if select(2, HasPetUI()) then		-- Checking second return value to see if pet is a hunter pet.
		petIsAlive = not UnitIsDead("pet");
		hasPet = true;

		-- Check to see if the pet is happy.
		petIsHappy = (select(1, GetPetHappiness()) >= 3);
	end


	-- High-Mana Notification
	if HHConfig.HighMana.Enabled and InViper and ManaLevel >= HHConfig.HighMana.Threshold then
		DoNotify = true;
		NotifyMessage = HHConfig.HighMana.Message;
		NotifySound = HHConfig.HighMana.Sound;

	-- Low-Mana notification
	elseif HHConfig.LowMana.Enabled and not InViper and ManaLevel <= HHConfig.LowMana.Threshold then
		DoNotify = true;
		NotifyMessage = HHConfig.LowMana.Message;
		NotifySound = HHConfig.LowMana.Sound;

	elseif hasPet and petIsAlive and HHConfig.PetHappiness.Enabled and not petIsHappy then
		DoNotify = true;
		NotifyMessage = HHConfig.PetHappiness.Message;
		NotifySound = HHConfig.PetHappiness.Sound;

	-- Notifications while in combat.
	elseif InCombatLockdown() then

		local inBattleAspect = true;
		local inLowAspect = false;
		local petIsGrowling = false;
		local petIsPassive = false;
		local petIsAggressive = false;

		-- No-Aspect warning
		if HHConfig.CombatNoAspect.Enabled then
			-- Determine if our buffs include any of the battle aspects.
			-- If so, turn off the notification again and exit the loop.
			inBattleAspect = false;

			for n = 1,#battleAspects do
				if UnitBuff("player",battleAspects[n]) ~= nil then
					inBattleAspect = true;

					-- Is the Aspect we found either Hawk or Monkey when we SHOULD be using Dragonhawk?
					if GetSpellInfo(aspectDragonhawk) ~= nill then
						for x = 1,#lowAspects do
							if battleAspects[n] == lowAspects[x] then
								inLowAspect = true;			-- Low Aspect flag.
								x = #lowAspects;
							end
						end
					end

					n = #battleAspects;
				end
			end
		end

		if hasPet and petIsAlive then
			-- Check to see if the pet's Growl ability is turned on.
			petIsGrowling = self:PetIsGrowling();

			-- Check to see if the pet is in Passive or Aggressive mode.
			petIsPassive = (select(5, GetPetActionInfo(10))) == 1 and true or false;
			petIsAggressive = (select(5, GetPetActionInfo(8))) == 1 and true or false;
		end


		-- Logic tree for in-combat notifications, in order of priority.

		-- No-Aspect warning
		if HHConfig.CombatNoAspect.Enabled and not inBattleAspect then
			NotifyMessage = HHConfig.CombatNoAspect.Message;
			NotifySound = HHConfig.CombatNoAspect.Sound;
			DoNotify = true;

		elseif HHConfig.CombatDragonhawk.Enabled and inLowAspect then
			NotifyMessage = HHConfig.CombatDragonhawk.Message;
			NotifySound = HHConfig.CombatDragonhawk.Sound;
			DoNotify = true;
			
		elseif hasPet then
			-- Only warn about happiness and growling if the pet is alive and we didn't just dismount.
			if petIsAlive and (currTime - self.lastDismountTime >= HHConfig.UpdateInterval) then

				-- Is pet set to aggressive?
				if HHConfig.PetAggressive.Enabled and petIsAggressive then

					-- Are we either in a group or solo and asking for notifications while solo?
					if not HHConfig.PetAggressive.OnlyInParty or (groupMembers + 1 >= HHConfig.PetPartyGrowl.PartySize) then
						DoNotify = true;
						NotifyMessage = HHConfig.PetAggressive.Message;
						NotifySound = HHConfig.PetAggressive.Sound;
					end

				-- Is pet set to passive?
				elseif HHConfig.PetPassive.Enabled and petIsPassive then
					DoNotify = true;
					NotifyMessage = HHConfig.PetPassive.Message;
					NotifySound = HHConfig.PetPassive.Sound;
			
				-- Is pet growling in a group?
				elseif groupMembers > 0 then
					if petIsGrowling and HHConfig.PetPartyGrowl.Enabled and (groupMembers + 1 >= HHConfig.PetPartyGrowl.PartySize) then
						DoNotify = true;
						NotifyMessage = HHConfig.PetPartyGrowl.Message;
						NotifySound = HHConfig.PetPartyGrowl.Sound;
					end
	
				-- Is pet not growling while solo?
				elseif HHConfig.PetSoloGrowl.Enabled and not petIsGrowling then
					DoNotify = true;
					NotifyMessage = HHConfig.PetSoloGrowl.Message;
					NotifySound = HHConfig.PetSoloGrowl.Sound;

				end
			end

		-- This code branch means no pet was detected.  (Don't notify if the player is in a vehicle or on a taxi.)
		-- Also: Only notify if we haven't just dismounted - bit of a lag time between dismount and pet spawn.
		elseif not isMounted and HHConfig.CombatNoPet.Enabled and (currTime - self.lastDismountTime >= HHConfig.UpdateInterval) then

			-- One more check: Don't notify if the player is currently reviving his/her pet.
			if UnitCastingInfo("player") ~= spellRevivePet then
				DoNotify = true;
				NotifyMessage = HHConfig.CombatNoPet.Message;
				NotifySound = HHConfig.CombatNoPet.Sound;
			end
		end
	end

	-- Did we call for a notification?
	if DoNotify then
		self.lastUpdateTime = currTime;
		self:Notify(NotifyMessage, NotifySound);
	end
end


---------------------------
-- Notification and Display
---------------------------

function HunterHelper:Notify(msg, sound)
	if HHConfig.DisplayMethod==VNDISPLAY_SCT then
		if SCT_Display then		--send via SCT if it exists
			SCT_Display(msg, HHConfig.MessageColor);
		elseif MikSBT then		--send via MSBT
			--kinda inefficient redoing the calc every time, but it's only once every few seconds so quick fix wins
			MikSBT.DisplayMessage(msg, nil, nil, HHConfig.MessageColor.r * 255, HHConfig.MessageColor.g * 255, HHConfig.MessageColor.b * 255);
		elseif SHOW_COMBAT_TEXT=="1" then		--otherwise default UI's SCT
			CombatText_AddMessage(msg, CombatText_StandardScroll, HHConfig.MessageColor.r, HHConfig.MessageColor.g, HHConfig.MessageColor.b);
		else
			RaidNotice_AddMessage(RaidWarningFrame, msg, HHConfig.MessageColor);
		end
		
	elseif HHConfig.DisplayMethod==VNDISPLAY_RW then		--raid warning frame
		RaidNotice_AddMessage(RaidWarningFrame, msg, HHConfig.MessageColor);
	end
	
	if HHConfig.SoundsEnabled then
		self:PlaySound(sound);
	end
end

function HunterHelper:PlaySound(sound)
	PlaySoundFile(LSM:Fetch("sound", sound))
end

function HunterHelper:Print(msg)
	DEFAULT_CHAT_FRAME:AddMessage("|cff8ed6f0[HunterHelper] "..msg);
end

function HunterHelper:PrintVar(varname, value)
	self:Print(varname.." = "..value);
end

function HunterHelper:PrintBool(varname, value)
	self:PrintVar(varname, L[value and "ON" or "OFF"]);
end


----------------------
-- Configuration Panel
----------------------

function HunterHelper:SetupOptions()
	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("HunterHelper", self.GenerateOptions)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HunterHelperSlashCommand", self.OptionsSlash, "hh")

	local ACD3 = LibStub("AceConfigDialog-3.0")
	self.OptionsFrames = {}
	self.OptionsFrames.HunterHelper = ACD3:AddToBlizOptions("HunterHelper", self.versionstring, nil, "General")
	self.OptionsFrames.ManaOptions = ACD3:AddToBlizOptions("HunterHelper", L["Mana/Combat Options"], self.versionstring, "ManaOptions")
	self.OptionsFrames.PetOptions = ACD3:AddToBlizOptions("HunterHelper", L["Pet Options"], self.versionstring, "PetOptions")

	self.SetupOptions = nil
end

function HunterHelper:RegisterModuleOptions(name, optionTbl, displayName)
	if moduleOptions then
		moduleOptions[name] = optionTbl
	else
		self.Options.args[name] = (type(optionTbl) == "function") and optionTbl() or optionTbl
	end
	self.OptionsFrames[name] = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HunterHelper", displayName, self.versionstring, name)
end

function HunterHelper:ShowConfig()
	InterfaceOptionsFrame_OpenToCategory(self.optionsFrames.HunterHelper)
end

function HunterHelper:GenerateOptions()
	if HunterHelper.noconfig then assert(false, HunterHelper.noconfig) end
	if not HunterHelper.Options then
		HunterHelper.GenerateOptionsInternal()
		HunterHelper.GenerateOptionsInternal = nil;
		moduleOptions = nil;
	end
	return HunterHelper.Options
end


----------------------------
-- HunterHelper Config Tables
----------------------------

HunterHelper.OptionsSlash = {
	type = "group",
	name = L["Slash Command"],
	order = -3,
	args = {
		intro = {
			order = 1,
			type = "description",
			name = L["HH_SLASH_DESC"],
			cmdHidden = true,
		},
		interval = {
			order = 2,
			type = "range",
			name = L["Update Interval"],
			desc = L["Update Interval"].." (0.5 - 20.0)",
			min = 0.5,
			max = 20.0,
			step = 0.1,
			get = function(info) return HHConfig.UpdateInterval end,
			set = function(info, value)
				HHConfig.UpdateInterval = value;
				HunterHelper:PrintVar(L["Update Interval"], HHConfig.UpdateInterval);
			end,
		},
		warnhigh = {
			order = 3,
			type = "toggle",
			name = L["Toggle High Mana Warning"],
			desc = L["Toggle High Mana Warning"],
			func = function() ToggleHighWarning() end,
			get = function(info) return HHConfig.HighMana.Enabled end,
			set = function(info, value)
				HHConfig.HighMana.Enabled = value;
				HunterHelper:PrintBool(L["High Mana Warning"], HHConfig.HighMana.Enabled);
			end,
		},
		highmana = {
			order = 4,
			type = "range",
			name = L["High Mana Threshold"],
			desc = L["High Mana Threshold"].." (0-100)",
			min = 0.0,
			max = 100.0,
			step = 1.0,
			get = function(info) return HHConfig.HighMana.Threshold end,
			set = function(info, value)
				HHConfig.HighMana.Threshold = value;
				HunterHelper:PrintVar(L["High Mana Threshold"], HHConfig.HighMana.Threshold);
			end,
		},
		warnlow = {
			order = 7,
			type = "toggle",
			name = L["Toggle Low Mana Warning"],
			desc = L["Toggle Low Mana Warning"],
			get = function(info) return HHConfig.LowMana.Enabled end,
			set = function(info, value)
				HHConfig.LowMana.Enabled = value;
				HunterHelper:PrintBool(L["Low Mana Warning"], HHConfig.LowMana.Enabled);
			end,
		},
		lowmana = {
			order = 8,
			type = "range",
			name = L["Low Mana Threshold"],
			desc = L["Low Mana Threshold"].." (0-100)",
			min = 0.0,
			max = 100.0,
			step = 1.0,
			get = function(info) return HHConfig.LowMana.Threshold end,
			set = function(info, value)
				HHConfig.LowMana.Threshold = value;
				HunterHelper:PrintVar(L["Low Mana Threshold"], HHConfig.LowMana.Threshold);
			end,
		},
		warnaspect = {
			order = 11,
			type = "toggle",
			name = L["Toggle Aspect Warning"],
			desc = L["Toggle Aspect Warning"],
			get = function(info) return HHConfig.CombatNoAspect.Enabled end,
			set = function(info, value)
				HHConfig.CombatNoAspect.Enabled = value;
				HunterHelper:PrintBool(L["No Aspect Warning"], HHConfig.CombatNoAspect.Enabled);
			end,
		},
		warndragonhawk = {
			order = 12,
			type = "toggle",
			name = L["Toggle Dragonhawk Warning"],
			desc = L["Toggle Dragonhawk Warning"],
			get = function(info) return HHConfig.CombatDragonhawk.Enabled end,
			set = function(info, value)
				HHConfig.CombatDragonhawk.Enabled = value;
				HunterHelper:PrintBool(L["Dragonhawk Warning"], HHConfig.CombatDragonhawk.Enabled);
			end,
		},
		warnpet = {
			order = 13,
			type = "toggle",
			name = L["Toggle No Pet Warning"],
			desc = L["Toggle No Pet Warning"],
			get = function(info) return HHConfig.CombatNoPet.Enabled end,
			set = function(info, value)
				HHConfig.CombatNoPet.Enabled = value;
				HunterHelper:PrintBool(L["No Pet Warning"], HHConfig.CombatNoPet.Enabled);
			end,
		},
		warnpartygrowl = {
			order = 14,
			type = "toggle",
			name = L["Toggle Party Growl Warning"],
			desc = L["Toggle Party Growl Warning"],
			get = function(info) return HHConfig.PetPartyGrowl.Enabled end,
			set = function(info, value)
				HHConfig.PetPartyGrowl.Enabled = value;
				HunterHelper:PrintBool(L["Party Growl Warning"], HHConfig.PetPartyGrowl.Enabled);
			end,
		},
		warnsologrowl = {
			order = 15,
			type = "toggle",
			name = L["Toggle Solo Growl Warning"],
			desc = L["Toggle Solo Growl Warning"],
			get = function(info) return HHConfig.PetSoloGrowl.Enabled end,
			set = function(info, value)
				HHConfig.PetSoloGrowl.Enabled = value;
				HunterHelper:PrintBool(L["Solo Growl Warning"], HHConfig.PetSoloGrowl.Enabled);
			end,
		},
		petunhappy = {
			order = 16,
			type = "toggle",
			name = L["Toggle Pet Happiness Warning"],
			desc = L["Toggle Pet Happiness Warning"],
			get = function(info) return HHConfig.PetHappiness.Enabled end,
			set = function(info, value)
				HHConfig.PetHappiness.Enabled = value;
				HunterHelper:PrintBool(L["Pet Happiness Warning"], HHConfig.PetHappiness.Enabled);
			end,
		},
		petpassive = {
			order = 17,
			type = "toggle",
			name = L["Toggle Pet Passive Warning"],
			desc = L["Toggle Pet Passive Warning"],
			get = function(info) return HHConfig.PetPassive.Enabled end,
			set = function(info, value)
				HHConfig.PetPassive.Enabled = value;
				HunterHelper:PrintBool(L["Pet Passive Warning"], HHConfig.PetPassive.Enabled);
			end,
		},
		petaggressive = {
			order = 18,
			type = "toggle",
			name = L["Toggle Pet Aggressive Warning"],
			desc = L["Toggle Pet Aggressive Warning"],
			get = function(info) return HHConfig.PetAggressive.Enabled end,
			set = function(info, value)
				HHConfig.PetAggressive.Enabled = value;
				HunterHelper:PrintBool(L["Pet Aggressive Warning"], HHConfig.PetAggressive.Enabled);
			end,
		},
		displaycombat = {
			order = 19,
			type = "execute",
			name = L["Display as Combat Text"],
			desc = L["Display as Combat Text"],
			func = function()
				HHConfig.DisplayMethod = VNDISPLAY_SCT;
				HunterHelper:PrintVar(L["Display Method"], L["Combat Text"]);
			end,
		},
		displayraid = {
			order = 20,
			type = "execute",
			name = L["Display as Raid Warning"],
			desc = L["Display as Raid Warning"],
			func = function()
				HHConfig.DisplayMethod = VNDISPLAY_RW;
				HunterHelper:PrintVar(L["Display Method"], L["Raid Warning"]);
			end,
		},
		displaynone = {
			order = 21,
			type = "execute",
			name = L["Disable Messages"],
			desc = L["Disable Messages"],
			func = function()
				HHConfig.DisplayMethod = VNDISPLAY_NONE;
				HunterHelper:PrintVar(L["Display Method"], L["None"]);
			end,
		},
		sounds = {
			order = 22,
			type = "toggle",
			name = L["Toggle Sounds"],
			desc = L["Toggle Sounds"],
			get = function(info) return HHConfig.SoundsEnabled end,
			set = function(info, value)
				HHConfig.SoundsEnabled = value;
				HunterHelper:PrintBool(L["Enable Sounds"], HHConfig.SoundsEnabled);
			end,
		},
		solo = {
			order = 23,
			type = "toggle",
			name = L["Toggle Disable When Solo"],
			desc = L["Toggle Disable When Solo"],
			get = function(info) return HHConfig.DisableWhenSolo end,
			set = function(info, value) 
				HHConfig.DisableWhenSolo = value;
				HunterHelper:PrintBool(L["Disable When Solo"], HHConfig.DisableWhenSolo);
			end,
		},
		combatonly = {
			order = 24,
			type = "toggle",
			name = L["Toggle Notify Only in Combat"],
			desc = L["Toggle Notify Only in Combat"],
			get = function(info) return HHConfig.InCombatOnly end,
			set = function(info, value)
				HHConfig.InCombatOnly = value;
				HunterHelper:PrintBool(L["Only Notify In Combat"], HHConfig.InCombatOnly);
			end,
		},
	}
}

-- This is to provide better error reporting feedback, and stop loading the rest of the file.
if not AceGUIWidgetLSMlists then
	HunterHelper.noconfig = 'Cannot find a library instance of "AceGUI-3.0-SharedMediaWidgets". HunterHelper configuration will not be available.'
	assert(AceGUIWidgetLSMlists, HunterHelper.noconfig)
end


HunterHelper.Options = {
	type = "group",
	name = "HunterHelper",
	get = function(info) return HHConfig[ info[#info] ] end,
	set = function(info, value) HHConfig[ info[#info] ] = value end,
	args = {
		General = {
			order = 1,
			type = "group",
			name = L["General Settings"],
			desc = L["General Settings"],
			args = {
				SoundsEnabled = {
					order = 1,
					type = "toggle",
					name = L["Enable Sounds"],
				},
				UpdateInterval = {
					order = 2,
					type = "range",
					name = L["Update Interval"],
					desc = L["Update Interval Desc"],
					min = 0.5,
					max = 20.0,
					step = 0.5,
				},
				MessageColor = {
					order = 3,
					type = "color",
					name = L["Message Color"],
					hasAlpha = false,
					get = function(info)
						local t = HHConfig.MessageColor
						return t.r, t.g, t.b, 1.0
					end,
					set = function(info, r, g, b, a)
						local t = HHConfig.MessageColor
						t.r, t.g, t.b = r, g, b
					end,
				},
				DisplayMethod = {
					order = 4,
					type = "select",
					name = L["Display Method"],
					desc = L["Display Method Desc"],
					values = {
						[VNDISPLAY_NONE] = L["None"],
						[VNDISPLAY_SCT] = L["Combat Text"],
						[VNDISPLAY_RW] = L["Raid Warning"],
					},
				},
				DisableWhenSolo = {
					order = 5,
					type = "toggle",
					name = L["Disable When Solo"],
				},
				InCombatOnly = {
					order = 7,
					type = "toggle",
					name = L["Only Notify In Combat"],
				},
			},	-- end General Group Args
		},	-- end General Group

		ManaOptions = {
			order = 2,
			type = "group",
			name = L["Mana/Combat Options"],
			desc = L["Mana/Combat Options"],
			args = {
				HighMana = {
					order = 10,
					type = "group",
					name = L["High Mana Options"],
					guiInline = true,
					get = function(info) return HHConfig.HighMana[ info[#info] ] end,
					set = function(info, value) HHConfig.HighMana[ info[#info] ] = value end,
					args = {
						Enabled = {
							order = 1,
							type = "toggle",
							name = L["High Mana Warning"],
							desc = L["High Mana Warning Desc"],
							width = "full",
						},
						Sound = {
							order = 2,
							type = "select",
							name = L["Sound"],
							values = HH_SoundsList,
							get = function(info) return HHConfig.HighMana.Sound end,
							set = function(info, value)
								HHConfig.HighMana.Sound = value;
								HunterHelper:PlaySound(value);
							end,
						},
						Threshold = {
							order = 3,
							type = "range",
							name = L["Threshold"],
							min = 0,
							max = 1,
							step = 0.01,
							isPercent = true,
							get = function(info) return HHConfig.HighMana.Threshold / 100.0 end,
							set = function(info, value) HHConfig.HighMana.Threshold = value * 100.0 end,
						},
						Message = {
							order = 4,
							type = "input",
							name = L["Message"],
							width = "full",
						},
					},
				},

				LowMana = {
					order = 14,
					type = "group",
					name = L["Low Mana Options"],
					guiInline = true,
					get = function(info) return HHConfig.LowMana[ info[#info] ] end,
					set = function(info, value) HHConfig.LowMana[ info[#info] ] = value end,
					args = {
						Enabled = {
							order = 1,
							type = "toggle",
							name = L["Low Mana Warning"],
							desc = L["Low Mana Warning Desc"],
							width = "full",
						},
						Sound = {
							order = 2,
							type = "select",
							name = L["Sound"],
							values = HH_SoundsList,
							get = function(info) return HHConfig.LowMana.Sound end,
							set = function(info, value)
								HHConfig.LowMana.Sound = value;
								HunterHelper:PlaySound(value);
							end,
						},
						Threshold = {
							order = 3,
							type = "range",
							name = L["Threshold"],
							min = 0,
							max = 1,
							step = 0.01,
							isPercent = true,
							get = function(info) return HHConfig.LowMana.Threshold / 100.0 end,
							set = function(info, value) HHConfig.LowMana.Threshold = value * 100.0 end,
						},
						Message = {
							order = 4,
							type = "input",
							name = L["Message"],
							width = "full",
						},
					},
				},

				CombatNoAspect = {
					order = 18,
					type = "group",
					name = L["No Aspect Options"],
					guiInline = true,
					get = function(info) return HHConfig.CombatNoAspect[ info[#info] ] end,
					set = function(info, value) HHConfig.CombatNoAspect[ info[#info] ] = value end,
					args = {
						Enabled = {
							order = 1,
							type = "toggle",
							name = L["No Aspect Warning"],
							desc = L["No Aspect Warning Desc"],
							width = "full",
							get = function(info) return HHConfig.CombatNoAspect.Enabled end,
							set = function(info, value) HHConfig.CombatNoAspect.Enabled = value end,
						},
						Sound = {
							order = 2,
							type = "select",
							name = L["Sound"],
							values = HH_SoundsList,
							get = function(info) return HHConfig.CombatNoAspect.Sound end,
							set = function(info, value)
								HHConfig.CombatNoAspect.Sound = value;
								HunterHelper:PlaySound(value);
							end,
						},
						Message = {
							order = 3,
							type = "input",
							name = L["Message"],
							width = "full",
						},
					},
				},

				CombatDragonhawk = {
					order = 20,
					type = "group",
					name = L["Dragonhawk Options"],
					guiInline = true,
					get = function(info) return HHConfig.CombatDragonhawk[ info[#info] ] end,
					set = function(info, value) HHConfig.CombatDragonhawk[ info[#info] ] = value end,
					args = {
						Enabled = {
							order = 1,
							type = "toggle",
							name = L["Dragonhawk Warning"],
							desc = L["Dragonhawk Warning Desc"],
							width = "full",
							get = function(info) return HHConfig.CombatDragonhawk.Enabled end,
							set = function(info, value) HHConfig.CombatDragonhawk.Enabled = value end,
						},
						Sound = {
							order = 2,
							type = "select",
							name = L["Sound"],
							values = HH_SoundsList,
							get = function(info) return HHConfig.CombatDragonhawk.Sound end,
							set = function(info, value)
								HHConfig.CombatDragonhawk.Sound = value;
								HunterHelper:PlaySound(value);
							end,
						},
						Message = {
							order = 3,
							type = "input",
							name = L["Message"],
							width = "full",
						},
					},
				},

			}, -- end Mana/Combat Group args
		},	-- end Mana/Combat Group
		
		PetOptions = {
			order = 3,
			type = "group",
			name = L["Pet Options"],
			desc = L["Pet Options"],
			args = {
				CombatNoPet = {
					order = 1,
					type = "group",
					name = L["Combat without Pet"],
					guiInline = true,
					get = function(info) return HHConfig.CombatNoPet[ info[#info] ] end,
					set = function(info, value) HHConfig.CombatNoPet[ info[#info] ] = value end,
					args = {
						Enabled = {
							order = 1,
							type = "toggle",
							name = L["No Pet Warning"],
							desc = L["No Pet Warning Desc"],
							width = "full",
						},
						Sound = {
							order = 2,
							type = "select",
							name = L["Sound"],
							values = HH_SoundsList,
							get = function(info) return HHConfig.CombatNoPet.Sound end,
							set = function(info, value)
								HHConfig.CombatNoPet.Sound = value;
								HunterHelper:PlaySound(value);
							end,
						},
						Message = {
							order = 4,
							type = "input",
							name = L["Message"],
							width = "full",
						},
					},
				},

				PetHappiness = {
					order = 2,
					type = "group",
					name = L["Pet Happiness"],
					guiInline = true,
					get = function(info) return HHConfig.PetHappiness[ info[#info] ] end,
					set = function(info, value) HHConfig.PetHappiness[ info[#info] ] = value end,
					args = {
						Enabled = {
							order = 1,
							type = "toggle",
							name = L["Pet Happiness Warning"],
							desc = L["Pet Happiness Warning Desc"],
							width = "full",
						},
						Sound = {
							order = 2,
							type = "select",
							name = L["Sound"],
							values = HH_SoundsList,
							get = function(info) return HHConfig.PetHappiness.Sound end,
							set = function(info, value)
								HHConfig.PetHappiness.Sound = value;
								HunterHelper:PlaySound(value);
							end,
						},
						Message = {
							order = 4,
							type = "input",
							name = L["Message"],
							width = "full",
						},
					},
				},


				PetPartyGrowl = {
					order = 3,
					type = "group",
					name = L["Growling in Party"],
					guiInline = true,
					get = function(info) return HHConfig.PetPartyGrowl[ info[#info] ] end,
					set = function(info, value) HHConfig.PetPartyGrowl[ info[#info] ] = value end,
					args = {
						Enabled = {
							order = 1,
							type = "toggle",
							name = L["Party Growl Warning"],
							desc = L["Party Growl Warning Desc"],
							width = "full",
						},
						PartySize = {
							order = 3,
							type = "range",
							name = L["Party Size"],
							desc = L["Party Size Desc"],
							min = 2,
							max = 5,
							step = 1,
							isPercent = false,
							get = function(info) return HHConfig.PetPartyGrowl.PartySize end,
							set = function(info, value) HHConfig.PetPartyGrowl.PartySize = value end,
						},
						Sound = {
							order = 3,
							type = "select",
							name = L["Sound"],
							values = HH_SoundsList,
							get = function(info) return HHConfig.PetPartyGrowl.Sound end,
							set = function(info, value)
								HHConfig.PetPartyGrowl.Sound = value;
								HunterHelper:PlaySound(value);
							end,
						},
						Message = {
							order = 4,
							type = "input",
							name = L["Message"],
							width = "full",
						},
					},
				},

				PetSoloGrowl = {
					order = 4,
					type = "group",
					name = L["Growling while Solo"],
					guiInline = true,
					get = function(info) return HHConfig.PetSoloGrowl[ info[#info] ] end,
					set = function(info, value) HHConfig.PetSoloGrowl[ info[#info] ] = value end,
					args = {
						Enabled = {
							order = 1,
							type = "toggle",
							name = L["Solo Growl Warning"],
							desc = L["Solo Growl Warning Desc"],
							width = "full",
						},
						Sound = {
							order = 2,
							type = "select",
							name = L["Sound"],
							values = HH_SoundsList,
							get = function(info) return HHConfig.PetSoloGrowl.Sound end,
							set = function(info, value)
								HHConfig.PetSoloGrowl.Sound = value;
								HunterHelper:PlaySound(value);
							end,
						},
						Message = {
							order = 4,
							type = "input",
							name = L["Message"],
							width = "full",
						},
					},
				},


				PetPassive = {
					order = 5,
					type = "group",
					name = L["Pet Passive"],
					guiInline = true,
					get = function(info) return HHConfig.PetPassive[ info[#info] ] end,
					set = function(info, value) HHConfig.PetPassive[ info[#info] ] = value end,
					args = {
						Enabled = {
							order = 1,
							type = "toggle",
							name = L["Pet Passive Warning"],
							desc = L["Pet Passive Warning Desc"],
							width = "full",
						},
						Sound = {
							order = 2,
							type = "select",
							name = L["Sound"],
							values = HH_SoundsList,
							get = function(info) return HHConfig.PetPassive.Sound end,
							set = function(info, value)
								HHConfig.PetPassive.Sound = value;
								HunterHelper:PlaySound(value);
							end,
						},
						Message = {
							order = 4,
							type = "input",
							name = L["Message"],
							width = "full",
						},
					},
				},

				PetAggressive = {
					order = 6,
					type = "group",
					name = L["Pet Aggressive"],
					guiInline = true,
					get = function(info) return HHConfig.PetAggressive[ info[#info] ] end,
					set = function(info, value) HHConfig.PetAggressive[ info[#info] ] = value end,
					args = {
						Enabled = {
							order = 1,
							type = "toggle",
							name = L["Pet Aggressive Warning"],
							desc = L["Pet Aggressive Warning Desc"],
							width = "full",
						},
						OnlyInParty = {
							order = 2,
							type = "toggle",
							name = L["Pet Aggressive Only in Party"],
							desc = L["Pet Aggressive Only in Party Desc"],
						},
						Sound = {
							order = 3,
							type = "select",
							name = L["Sound"],
							values = HH_SoundsList,
							get = function(info) return HHConfig.PetAggressive.Sound end,
							set = function(info, value)
								HHConfig.PetAggressive.Sound = value;
								HunterHelper:PlaySound(value);
							end,
						},
						Message = {
							order = 4,
							type = "input",
							name = L["Message"],
							width = "full",
						},
					},
				},


			}, -- end Pet Group args
		},	-- end Pet Group
			

	},	-- end Options args
};	-- end Options