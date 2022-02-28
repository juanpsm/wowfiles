local AddonName, Table = ...
local function SpellName(GlobalSpellID)
	return ({GetSpellInfo(GlobalSpellID)})[1]
end
local function ItemName(GlobalItemID)
	return ({GetItemInfo(GlobalItemID)})[1]
end
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




SpellFlashAddon.Castable["Auto Attack"] = function()
	if not SpellFlashAddon.MeleeDistance() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(6603--[[Auto Attack]])
	z.EnemyTargetNeeded = 1
	z.NotIfActive = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end
SpellFlashAddon.Castable["Attack"] = SpellFlashAddon.Castable["Auto Attack"]


SpellFlashAddon.Castable["Shoot"] = function()
	if SpellFlashAddon.AutoShoot then
		return false
	end
	local z = {}
	z.SpellName = SpellName(3018--[[Shoot]])
	z.EnemyTargetNeeded = 1
	z.NotIfActive = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end



function SpellFlashAddon.IsBreakOnDamageCC(unit, isExpirationTimeOrLess)
	return Debuff(
		{
			SpellName(118--[[Polymorph]]),
			SpellName(2637--[[Hibernate]]),
			SpellName(9484--[[Shackle Undead]]),
			SpellName(6770--[[Sap]]),
			SpellName(6358--[[Seduction]]),
			SpellName(19503--[[Scatter Shot]]),
			SpellName(1499--[[Freezing Trap]]),
			SpellName(51514--[[Hex]]),
		},unit,nil,nil,nil,isExpirationTimeOrLess)
		or Debuff(SpellName(19386--[[Wyvern Sting]]),unit,nil,nil,nil,isExpirationTimeOrLess,nil,nil,nil,nil,Table.Localize["Asleep."])
end


--all forms of fear and movement impairing affects are not included since they do not prevent the target from being damaged
--Mind Control is no longer included as a CC in this function
function SpellFlashAddon.IsNoDamageCC(unit, isExpirationTimeOrLess)
	return SpellFlashAddon.IsBreakOnDamageCC(unit, isExpirationTimeOrLess)
	or Debuff(
		{
			SpellName(710--[[Banish]]),
			SpellName(33786--[[Cyclone]]),
			--SpellName(605--[[Mind Control]]),
		},unit,nil,nil,nil,isExpirationTimeOrLess)
end


--movement impairing affects are not included since the target could still attack
function SpellFlashAddon.IsCrowedControlled(unit, isExpirationTimeOrLess)
	return SpellFlashAddon.IsNoDamageCC(unit, isExpirationTimeOrLess)
	or Debuff(
		{
			SpellName(5782--[[Fear]]),
			SpellName(5484--[[Howl of Terror]]),
			SpellName(8122--[[Psychic Scream]]),
			SpellName(1513--[[Scare Beast]]),
		},unit,nil,nil,nil,isExpirationTimeOrLess)
end


--movement impairing affects are not included since the target could still attack
function SpellFlashAddon.IsFeared(unit, isExpirationTimeOrLess)
	return Debuff(
		{
			SpellName(5782--[[Fear]]),
			SpellName(5484--[[Howl of Terror]]),
			SpellName(8122--[[Psychic Scream]]),
			SpellName(1513--[[Scare Beast]]),
		},unit,nil,nil,nil,isExpirationTimeOrLess)
end


function SpellFlashAddon.IsRooted(unit, isExpirationTimeOrLess)
	return Debuff(
		{
			SpellName(339--[[Entangling Roots]]),
			SpellName(122--[[Frost Nova]]),
			SpellName(45524--[[Chains of Ice]]),
			SpellName(16979--[[Feral Charge - Bear]]),
		},unit,nil,nil,nil,isExpirationTimeOrLess)
end


function SpellFlashAddon.IsMovementImpaired(unit, isExpirationTimeOrLess)
	return SpellFlashAddon.IsRooted(unit, isExpirationTimeOrLess)
	or Debuff(
		{
			SpellName(2974--[[Wing Clip]]),
			SpellName(5116--[[Concussive Shot]]),
			SpellName(13809--[[Frost Trap]]),
			SpellName(116--[[Frostbolt]]),
			SpellName(120--[[Cone of Cold]]),
			SpellName(11113--[[Blast Wave]]),
			SpellName(31589--[[Slow]]),
			SpellName(15407--[[Mind Flay]]),
			SpellName(3408--[[Crippling Poison]]),
			SpellName(26679--[[Deadly Throw]]),
			SpellName(8056--[[Frost Shock]]),
			SpellName(2484--[[Earthbind Totem]]),
			SpellName(18223--[[Curse of Exhaustion]]),
			SpellName(1715--[[Hamstring]]),
			SpellName(12323--[[Piercing Howl]]),
		},unit,nil,nil,nil,isExpirationTimeOrLess)
end




function SpellFlashAddon.IsPoisoned(unit)
	return Debuff(nil,unit,nil,nil,nil,nil,nil,nil,nil,nil,nil,"Poison")
end

function SpellFlashAddon.IsDiseased(unit)
	return Debuff(nil,unit,nil,nil,nil,nil,nil,nil,nil,nil,nil,"Disease")
end




function SpellFlashAddon.IsTrackingTexture(texture)
	if GetTrackingTexture() and string.find(GetTrackingTexture(), texture) then
		return true
	end
	return false
end

function SpellFlashAddon.IsTrackingActive()
	if GetTrackingTexture() then
		return true
	end
	return false
end

function SpellFlashAddon.IsTrackHumanoidsActive()
	return SpellFlashAddon.IsTrackingTexture("Spell_Holy_PrayerOfHealing")
end

function SpellFlashAddon.IsTrackMineralsActive()
	return SpellFlashAddon.IsTrackingTexture("Spell_Nature_Earthquake")
end

function SpellFlashAddon.IsTrackBeastsActive()
	return SpellFlashAddon.IsTrackingTexture("Ability_Tracking")
end

function SpellFlashAddon.IsTrackDemonsActive()
	return SpellFlashAddon.IsTrackingTexture("Spell_Shadow_SummonFelHunter")
end

function SpellFlashAddon.IsTrackDragonsActive()
	return SpellFlashAddon.IsTrackingTexture("INV_Misc_Head_Dragon_01")
end

function SpellFlashAddon.IsTrackElementalsActive()
	return SpellFlashAddon.IsTrackingTexture("Spell_Frost_SummonWaterElemental")
end

function SpellFlashAddon.IsTrackGiantsActive()
	return SpellFlashAddon.IsTrackingTexture("Ability_Racial_Avatar")
end

function SpellFlashAddon.IsTrackHiddenActive()
	return SpellFlashAddon.IsTrackingTexture("Ability_Stealth")
end

function SpellFlashAddon.IsTrackUndeadActive()
	return SpellFlashAddon.IsTrackingTexture("Spell_Shadow_DarkSummoning")
end

function SpellFlashAddon.IsTrackHerbsActive()
	return SpellFlashAddon.IsTrackingTexture("INV_Misc_Flower_02")
end




SpellFlashAddon.Castable["Track Beasts"] = function()
	if SpellFlashAddon.IsTrackBeastsActive() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(1494--[[Track Beasts]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


SpellFlashAddon.Castable["Track Humanoids"] = function()
	if SpellFlashAddon.IsTrackHumanoidsActive() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(19883--[[Track Humanoids]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


SpellFlashAddon.Castable["Track Undead"] = function()
	if SpellFlashAddon.IsTrackUndeadActive() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(19884--[[Track Undead]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


SpellFlashAddon.Castable["Track Elementals"] = function()
	if SpellFlashAddon.IsTrackElementalsActive() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(19880--[[Track Elementals]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


SpellFlashAddon.Castable["Track Giants"] = function()
	if SpellFlashAddon.IsTrackGiantsActive() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(19882--[[Track Giants]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


SpellFlashAddon.Castable["Track Dragonkin"] = function()
	if SpellFlashAddon.IsTrackDragonkinActive() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(19879--[[Track Dragonkin]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end




