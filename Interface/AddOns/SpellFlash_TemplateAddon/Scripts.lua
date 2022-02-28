local AddonName, Table = ...
local function Castable(English_Spell_Name, ...)
	if type(Table.Castable[English_Spell_Name]) == "function" then
		return Table.Castable[English_Spell_Name](...)
	end
	return SpellFlashAddon.CheckIfSpellCastable(English_Spell_Name)
end
local function VehicleCastable(English_Spell_Name, ...)
	if type(Table.VehicleCastable[English_Spell_Name]) == "function" then
		return Table.VehicleCastable[English_Spell_Name](...)
	end
	return SpellFlashAddon.CheckIfVehicleSpellCastable(English_Spell_Name)
end
local function ItemCastable(English_Item_Name, ...)
	if type(Table.ItemCastable[English_Item_Name]) == "function" then
		return Table.ItemCastable[English_Item_Name](...)
	end
	return SpellFlashAddon.CheckIfItemCastable(English_Item_Name)
end
local function SpellName(GlobalSpellID)
	return ({GetSpellInfo(GlobalSpellID)})[1]
end
local function ItemName(GlobalItemID)
	return ({GetItemInfo(GlobalItemID)})[1]
end
local PetCastable = SpellFlashAddon.PetCastable
local Flash = SpellFlashAddon.FlashAction
local FlashPet = SpellFlashAddon.FlashPet
local FlashForm = SpellFlashAddon.FlashForm
local FlashVehicle = SpellFlashAddon.FlashVehicle
local Flashable = SpellFlashAddon.Flashable
local VehicleFlashable = SpellFlashAddon.VehicleSlot
local IsAutocastOn = SpellFlashAddon.IsSpellAutocastOn
local HasTalent = SpellFlashAddon.HasTalent
local TalentRank = SpellFlashAddon.GetTalentRank
local HasGlyph = SpellFlashAddon.HasGlyph
local Buff = SpellFlashAddon.CheckBuff
local Debuff = SpellFlashAddon.CheckDebuff
local HealthPercent = SpellFlashAddon.HealthPercent
local PowerPercent = SpellFlashAddon.PowerPercent
local InCombat = SpellFlashAddon.InCombat
local SpellDelay = SpellFlashAddon.SpellDelay
local AuraDelay = SpellFlashAddon.AuraDelay
local Form = SpellFlashAddon.Form
local SpellKnown = SpellFlashAddon.IsSpellKnown
local SpellRank = SpellFlashAddon.GetSpellRank
local SpellCost = SpellFlashAddon.GetSpellCost
local CastTime = SpellFlashAddon.GetSpellCastTime
local Casting = SpellFlashAddon.CastingOrChanneling

local function SetColor(UseColor, color)
	if UseColor then
		return color
	end
	return "Pink"
end

--[[
	White - Default
	Yellow - Limited Time or No Global Cooldown
	Purple - AOE or Positional Damage
	Blue - AOE Debuff
	Orange - Finishing Move
	Aqua - Spell Interrupt, Reflect or Dispel
	Green - Self Buff or Turn Autocast On
	Red - Emergency Mitigation Cooldowns or Turn Autocast Off
	Pink - Optional
]]


-- Use this single Spam function or remove this function and use the multiple Spam table below
SpellFlashAddon.Spam[AddonName] = function(NoCC, ActiveEnemy, PetAlive, PetActiveEnemy, instanceType)
	
	-- Place script here
	
end


-- Use this multiple Spam table or remove this table and use the single Spam function above
SpellFlashAddon.Spam[AddonName] = {
	
	
	-- Default script
	{Title = Table.Localize["Script Title"] -- Place script title here
	,Description = Table.Localize["Script Description"] -- Place optional script description here
	,Function = function(NoCC, ActiveEnemy, PetAlive, PetActiveEnemy, instanceType)
		
		-- Place script here
		
	end},
	
	
	-- Add and remove as many of these table sections ass needed
	{Title = Table.Localize["Script Title"] -- Place script title here
	,Description = Table.Localize["Script Description"] -- Place optional script description here
	,Function = function(NoCC, ActiveEnemy, PetAlive, PetActiveEnemy, instanceType)
		
		-- Place script here
		
	end},
	
	
	-- Add and remove as many of these table sections ass needed
	{Title = Table.Localize["Script Title"] -- Place script title here
	,Description = Table.Localize["Script Description"] -- Place optional script description here
	,Function = function(NoCC, ActiveEnemy, PetAlive, PetActiveEnemy, instanceType)
		
		-- Place script here
		
	end},
	
	
}

