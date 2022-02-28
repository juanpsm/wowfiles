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


SpellFlashAddon.Spam[AddonName] = function(NoCC, ActiveEnemy, PetAlive, PetActiveEnemy, instanceType)
	
	if SpellFlashAddon.HUMAN and Flashable(SpellName(59752--[[Every Man for Himself]])) and SpellFlashAddon.IsCrowedControlled("player") and Castable("Every Man for Himself") then
		Flash(SpellName(59752--[[Every Man for Himself]]), "Aqua")
		
	elseif SpellFlashAddon.UNDEAD and Flashable(SpellName(7744--[[Will of the Forsaken]])) and SpellFlashAddon.IsCrowedControlled("player") and Castable("Will of the Forsaken") then
		Flash(SpellName(7744--[[Will of the Forsaken]]), "Aqua")
		
	elseif SpellFlashAddon.DWARF and Flashable(SpellName(20594--[[Stoneform]])) and ( SpellFlashAddon.IsDiseased("player") or SpellFlashAddon.IsPoisoned("player") ) and Castable("Stoneform") then
		Flash(SpellName(20594--[[Stoneform]]), "Aqua")
		
	end
	
end
