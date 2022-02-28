local AddonName, Table = ...
Table.Castable = SpellFlashAddon.CopyTable(SpellFlashAddon.Castable)
Table.VehicleCastable = SpellFlashAddon.CopyTable(SpellFlashAddon.VehicleCastable)
Table.ItemCastable = SpellFlashAddon.CopyTable(SpellFlashAddon.ItemCastable)
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


-- Example function:
Table.Castable["English_Spell_Name"] = function()
	local z = {}
	z.SpellName = SpellName(GlobalSpellID--[[English_Spell_Name]])   --this is for defining the correct name of the spell
	z.DebuffSlotNeeded = 1   --use this if you want to make sure that a debuff slot is free on the target so that you do not replace other debuffs
	z.Debuff = z.SpellName   --place debuff name or table of names here if the spell has a debuff that may only be on a target once in total from everyone and has a cooldown shorter then the debuff duration
	z.MyDebuff = z.SpellName   --place debuff name or table of names here if the spell has a debuff that may be on the target multiple times by many people and has a cooldown shorter then the debuff duration, 
	z.Buff = z.SpellName   --place buff name or table of names here if the spell has a buff that may only be on yourself once in total from everyone and has a cooldown shorter then the buff duration
	z.MyBuff = z.SpellName   --place buff name or table of names here if the spell has a buff that may be on the target multiple times by many people and has a cooldown shorter then the buff duration
	z.BuffUnit = "player"   --you may change this if the target of a buff is different then yourself
	z.CastTime = CastTime(z.SpellName)   --use this only if you want to replace the spell cast time used for early indication of a buff or debuff
	z.EnemyTargetNeeded = 1   --use this if the spell should have an enemy targeted
	z.TargetThatUsesManaNeeded = 1   --use this if the spell is only useful on a target that uses mana such as mana draining spells
	z.NoRangeCheck = 1   --use this to disable range detection if the spell has a limited range but the detection in this function is not working correctly for the particular spell
	z.NotIfActive = 1   --use this if the spell may be toggled on such as auto attack or on next swing spells, or to disable when casting or channeling
	z.EvenIfNotUsable = 1   --use this to disable the usability checking in this function and may be used if currently in the process of completing a prerequisite that will make the spell usable
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

-- Example function:
Table.ItemCastable["English_Item_Name"] = function()
	local z = {}
	z.ItemName = ItemName(GlobalItemID--[[English_Item_Name]])   --this is for defining the correct name of the item
	z.DebuffSlotNeeded = 1   --use this if you want to make sure that a debuff slot is free on the target so that you do not replace other debuffs
	z.Debuff = z.ItemName   --place debuff name or table of names here if the item has a debuff that may only be on a target once in total from everyone and has a cooldown shorter then the debuff duration
	z.MyDebuff = z.ItemName   --place debuff name or table of names here if the item has a debuff that may be on the target multiple times by many people and has a cooldown shorter then the debuff duration, 
	z.Buff = z.ItemName   --place buff name or table of names here if the item has a buff that may only be on yourself once in total from everyone and has a cooldown shorter then the buff duration
	z.MyBuff = z.ItemName   --place buff name or table of names here if the item has a buff that may be on the target multiple times by many people and has a cooldown shorter then the buff duration
	z.BuffUnit = "player"   --you may change this if the target of a buff is different then yourself
	z.EnemyTargetNeeded = 1   --use this if the item should have an enemy targeted
	z.TargetThatUsesManaNeeded = 1   --use this if the item is only useful on a target that uses mana such as mana draining items
	z.NoRangeCheck = 1   --use this to disable range detection if the item has a limited range but the detection in this function is not working correctly for the particular item
	z.NotIfActive = 1   --use this if the item may be toggled on such as auto attack or on next swing spells, or to disable when casting or channeling
	z.EvenIfNotUsable = 1   --use this to disable the usability checking in this function and may be used if currently in the process of completing a prerequisite that will make the item usable
	return SpellFlashAddon.CheckIfItemCastable(z)
end



function Table.IsStingPushed()
	if SpellFlashAddon.AuraDelay(SpellName(1978--[[Serpent Sting]]))
	or SpellFlashAddon.AuraDelay(SpellName(3034--[[Viper Sting]]))
	or SpellFlashAddon.AuraDelay(SpellName(3043--[[Scorpid Sting]]))
	or SpellFlashAddon.AuraDelay(SpellName(19386--[[Wyvern Sting]]))
	or IsCurrentSpell(SpellName(1978--[[Serpent Sting]]))
	or IsCurrentSpell(SpellName(3034--[[Viper Sting]]))
	or IsCurrentSpell(SpellName(3043--[[Scorpid Sting]]))
	or IsCurrentSpell(SpellName(19386--[[Wyvern Sting]]))
	then
		return true
	end
	return false
end


--Returns true if the target has Wing Clip on it
function Table.IsClipped(unit)
	return Debuff(SpellName(2974--[[Wing Clip]]),unit)
end

--Returns true if the target has Concussion Shot on it
function Table.IsConcussiveShot(unit)
	return Debuff(SpellName(5116--[[Concussive Shot]]),unit)
end

--Returns true if the target has Hunter's Mark cast on it already
function Table.IsMarked(unit)
	return Debuff(SpellName(1130--[[Hunter's Mark]]),unit,nil,true)
end

function Table.IsScatterShot(unit)
	return Debuff(SpellName(19503--[[Scatter Shot]]),unit)
end

function Table.IsScorpidSting(unit, mine)
	return Debuff(SpellName(3043--[[Scorpid Sting]]),unit,mine)
end

function Table.IsViperSting(unit, any)
	return Debuff(SpellName(3034--[[Viper Sting]]),unit,not any)
end

function Table.IsWyvernSting(unit, any)
	return Debuff(SpellName(19386--[[Wyvern Sting]]),unit,not any)
end

function Table.IsSerpentSting(unit, any)
	return Debuff(SpellName(1978--[[Serpent Sting]]),unit,not any)
end


function Table.IsStung(unit, any)
	return Debuff({
		SpellName(1978--[[Serpent Sting]]),
		SpellName(3034--[[Viper Sting]]),
		SpellName(3043--[[Scorpid Sting]]),
		SpellName(19386--[[Wyvern Sting]]),
	},unit,not any)
end





Table.Castable["Auto Shot"] = function()
	if SpellFlashAddon.AutoShoot then
		return false
	end
	local z = {}
	z.SpellName = SpellName(75--[[Auto Shot]])
	z.EnemyTargetNeeded = 1
	z.NotIfActive = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end



--Returns true if any Aspect is active
function Table.IsAspectActive()
	if
		Table.IsDragonhawkActive() or
		Table.IsViperActive() or
		Table.IsHawkActive() or
		Table.IsMonkeyActive() or
		Table.IsCheetahActive() or
		Table.IsBeastActive() or
		Table.IsWildActive() or
		Table.IsPackActive()
	then
		return true
	end
	return false
end


function Table.GiveAspect()
	if Table.IsDragonhawkActive() then
		return SpellName(61846--[[Aspect of the Dragonhawk]])
	elseif Table.IsViperActive() then
		return SpellName(34074--[[Aspect of the Viper]])
	elseif Table.IsHawkActive() then
		return SpellName(13165--[[Aspect of the Hawk]])
	elseif Table.IsMonkeyActive() then
		return SpellName(13163--[[Aspect of the Monkey]])
	elseif Table.IsCheetahActive() then
		return SpellName(5118--[[Aspect of the Cheetah]])
	elseif Table.IsBeastActive() then
		return SpellName(13161--[[Aspect of the Beast]])
	elseif Table.IsWildActive() then
		return SpellName(20043--[[Aspect of the Wild]])
	elseif Table.IsPackActive() then
		return SpellName(13159--[[Aspect of the Pack]])
	end
	return nil
end

--Returns true if Aspect of the Hawk is active
function Table.IsDragonhawkActive()
	return Buff(SpellName(61846--[[Aspect of the Dragonhawk]]))
end

--Returns true if Aspect of the Hawk is active
function Table.IsViperActive()
	return Buff(SpellName(34074--[[Aspect of the Viper]]))
end

--Returns true if Aspect of the Beast is active
function Table.IsBeastActive()
	return Buff(SpellName(13161--[[Aspect of the Beast]]))
end

--Returns true if Aspect of the Hawk is active
function Table.IsHawkActive()
	return Buff(SpellName(13165--[[Aspect of the Hawk]]))
end

--Returns true if Aspect of the Monkey is active
function Table.IsMonkeyActive()
	return Buff(SpellName(13163--[[Aspect of the Monkey]]))
end

--Returns true if Aspect of the Cheetah is active
function Table.IsCheetahActive()
	return Buff(SpellName(5118--[[Aspect of the Cheetah]]))
--  return Buff("JungleTiger")
end

--Returns true if Aspect of the Wild is active
function Table.IsWildActive()
	return Buff(SpellName(20043--[[Aspect of the Wild]]),nil,1)
end

--Returns true if Aspect of the Cheetah is active
function Table.IsPackActive()
	return Buff(SpellName(13159--[[Aspect of the Pack]]),nil,1)
end



--Returns true if Trueshot Aura is active
function Table.IsTrueshotActive(unit, mine)
	return Buff(SpellName(19506--[[Trueshot Aura]]),unit,mine)
end

--Returns true if the hunter is currently feigned
function Table.IsFeignDeath(unit)
	return ( UnitHealth(unit or "player") == 0 and not UnitIsDeadOrGhost(unit or "player") )
end

--Returns true if Hunter Quickshots is active
function Table.IsQuickshotsActive()
	return Buff(nil,nil,nil,nil,nil,nil,nil,nil,nil,"InnerRage")
end

--Returns true if Hunter Rapid Fire is active
function Table.IsRapidFireActive()
	return Buff(SpellName(3045--[[Rapid Fire]]))
end



Table.Castable["Scare Beast"] = function()
	if SpellFlashAddon.IsCrowedControlled() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(1513--[[Scare Beast]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Serpent Sting"] = function()
	local z = {}
	z.SpellName = SpellName(1978--[[Serpent Sting]])
	z.MyDebuff = z.SpellName
	z.DebuffSlotNeeded = 1
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Viper Sting"] = function()
	local z = {}
	z.SpellName = SpellName(3034--[[Viper Sting]])
	z.MyDebuff = z.SpellName
	z.DebuffSlotNeeded = 1
	z.EnemyTargetNeeded = 1
	z.TargetThatUsesManaNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Scorpid Sting"] = function()
	local z = {}
	z.SpellName = SpellName(3043--[[Scorpid Sting]])
	z.Debuff = z.SpellName
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Wyvern Sting"] = function()
	if SpellFlashAddon.IsCrowedControlled() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(19386--[[Wyvern Sting]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Mongoose Bite"] = function()
	local z = {}
	z.SpellName = SpellName(1495--[[Mongoose Bite]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Counterattack"] = function()
	local z = {}
	z.SpellName = SpellName(19306--[[Counterattack]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Concussive Shot"] = function()
	if SpellFlashAddon.IsMovementImpaired() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(5116--[[Concussive Shot]])
	z.Debuff = z.SpellName
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Raptor Strike"] = function()
	if not SpellFlashAddon.MeleeDistance() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(2973--[[Raptor Strike]])
	z.EnemyTargetNeeded = 1
	z.NotIfActive = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Aspect of the Dragonhawk"] = function()
	local z = {}
	z.SpellName = SpellName(61846--[[Aspect of the Dragonhawk]])
	z.Buff = z.SpellName
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Aspect of the Hawk"] = function()
	local z = {}
	z.SpellName = SpellName(13165--[[Aspect of the Hawk]])
	z.Buff = z.SpellName
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Aspect of the Viper"] = function()
	local z = {}
	z.SpellName = SpellName(34074--[[Aspect of the Viper]])
	z.Buff = z.SpellName
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


Table.Castable["Aspect of the Wild"] = function()
	local z = {}
	z.SpellName = SpellName(20043--[[Aspect of the Wild]])
	z.MyBuff = z.SpellName
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Aspect of the Beast"] = function()
	local z = {}
	z.SpellName = SpellName(13161--[[Aspect of the Beast]])
	z.Buff = z.SpellName
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Distracting Shot"] = function()
	local z = {}
	z.SpellName = SpellName(20736--[[Distracting Shot]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Arcane Shot"] = function()
	local z = {}
	z.SpellName = SpellName(3044--[[Arcane Shot]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Disengage"] = function()
	local z = {}
	z.SpellName = SpellName(781--[[Disengage]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Scatter Shot"] = function()
	if SpellFlashAddon.IsCrowedControlled() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(19503--[[Scatter Shot]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Multi-Shot"] = function()
	local z = {}
	z.SpellName = SpellName(2643--[[Multi-Shot]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Aimed Shot"] = function()
	local z = {}
	z.SpellName = SpellName(19434--[[Aimed Shot]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Hunter's Mark"] = function()
	local z = {}
	z.SpellName = SpellName(1130--[[Hunter's Mark]])
	z.Debuff = z.SpellName
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Aspect of the Monkey"] = function()
	local z = {}
	z.SpellName = SpellName(13163--[[Aspect of the Monkey]])
	z.Buff = z.SpellName
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Feign Death"] = function()
	if Table.IsFeignDeath() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(5384--[[Feign Death]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Aspect of the Cheetah"] = function()
	local z = {}
	z.SpellName = SpellName(5118--[[Aspect of the Cheetah]])
	z.Buff = z.SpellName
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Aspect of the Pack"] = function()
	local z = {}
	z.SpellName = SpellName(13159--[[Aspect of the Pack]])
	z.MyBuff = z.SpellName
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Trueshot Aura"] = function()
	local z = {}
	z.SpellName = SpellName(19506--[[Trueshot Aura]])
	z.Buff = SpellName(53137--[[Abomination's Might]])
	z.MyBuff = z.SpellName
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Bestial Wrath"] = function()
	local z = {}
	z.SpellName = SpellName(19574--[[Bestial Wrath]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Intimidation"] = function()
	if not UnitExists("pettarget") or SpellFlashAddon.IsCrowedControlled("pettarget") then
		return false
	end
	local z = {}
	z.SpellName = SpellName(19577--[[Intimidation]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Rapid Fire"] = function()
	local z = {}
	z.SpellName = SpellName(3045--[[Rapid Fire]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Wing Clip"] = function()
	local z = {}
	z.SpellName = SpellName(2974--[[Wing Clip]])
	z.Debuff = z.SpellName
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Freezing Trap"] = function()
	local z = {}
	z.SpellName = SpellName(1499--[[Freezing Trap]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Immolation Trap"] = function()
	local z = {}
	z.SpellName = SpellName(13795--[[Immolation Trap]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Frost Trap"] = function()
	local z = {}
	z.SpellName = SpellName(13809--[[Frost Trap]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Explosive Trap"] = function()
	local z = {}
	z.SpellName = SpellName(13813--[[Explosive Trap]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Mend Pet"] = function()
	local z = {}
	z.SpellName = SpellName(136--[[Mend Pet]])
	z.Buff = z.SpellName
	z.BuffUnit = "pet"
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Master's Call"] = function()
	local z = {}
	z.SpellName = SpellName(53271--[[Master's Call]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Black Arrow"] = function()
	local z = {}
	z.SpellName = SpellName(3674--[[Black Arrow]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Explosive Shot"] = function()
	local z = {}
	z.SpellName = SpellName(53301--[[Explosive Shot]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Kill Shot"] = function()
	local z = {}
	z.SpellName = SpellName(53351--[[Kill Shot]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Steady Shot"] = function()
	local z = {}
	z.SpellName = SpellName(56641--[[Steady Shot]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


Table.Castable["Chimera Shot"] = function()
	local z = {}
	z.SpellName = SpellName(53209--[[Chimera Shot]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


Table.Castable["Silencing Shot"] = function()
	local z = {}
	z.SpellName = SpellName(34490--[[Silencing Shot]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end



