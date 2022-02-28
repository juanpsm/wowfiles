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



-- Will return false if Sunder Armor is stacked less than 5 times on the target.
function Table.IsSunderFull(unit)
	if SpellFlashAddon.GetDebuffStack(SpellName(7386--[[Sunder Armor]]), unit) == 5 then
		return true
	end
	return false
end

function Table.IsSunder(unit)
	return Debuff(SpellName(7386--[[Sunder Armor]]),unit)
end

function Table.IsRend(unit)
	return Debuff(SpellName(772--[[Rend]]),unit,1)
end

function Table.IsHamstring(unit)
	return Debuff(SpellName(1715--[[Hamstring]]),unit)
end

function Table.IsPiercingHowl(unit)
	return Debuff(SpellName(12323--[[Piercing Howl]]),unit)
end

function Table.IsDemoralizingShout(unit)
	return Debuff(SpellName(1160--[[Demoralizing Shout]]),unit)
end

function Table.IsThunderClap(unit)
	return Debuff(SpellName(6343--[[Thunder Clap]]),unit)
end

function Table.IsDisarm(unit)
	return Debuff(SpellName(676--[[Disarm]]),unit)
end





Table.Castable["Sunder Armor"] = function()
	local z = {}
	z.SpellName = SpellName(7386--[[Sunder Armor]])
	z.EnemyTargetNeeded = 1
	if Debuff(z.SpellName,nil,nil,1,5,10) then
		return false
	end
	return SpellFlashAddon.CheckIfSpellCastable(z)
end



Table.Castable["Battle Stance"] = function()
	local z = {}
	z.SpellName = SpellName(2457--[[Battle Stance]])
	if Form(z.SpellName) then
		return false
	end
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Defensive Stance"] = function()
	local z = {}
	z.SpellName = SpellName(71--[[Defensive Stance]])
	if Form(z.SpellName) then
		return false
	end
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Berserker Stance"] = function()
	local z = {}
	z.SpellName = SpellName(2458--[[Berserker Stance]])
	if Form(z.SpellName) then
		return false
	end
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


Table.Castable["Mortal Strike"] = function()
	local z = {}
	z.SpellName = SpellName(12294--[[Mortal Strike]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Bloodthirst"] = function()
	local z = {}
	z.SpellName = SpellName(23881--[[Bloodthirst]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Devastate"] = function()
	local z = {}
	z.SpellName = SpellName(20243--[[Devastate]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Shield Slam"] = function()
	local z = {}
	z.SpellName = SpellName(23922--[[Shield Slam]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Slam"] = function()
	local z = {}
	z.SpellName = SpellName(1464--[[Slam]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


Table.Castable["Concussion Blow"] = function()
	local z = {}
	z.SpellName = SpellName(12809--[[Concussion Blow]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


Table.Castable["Victory Rush"] = function()
	local z = {}
	z.SpellName = SpellName(34428--[[Victory Rush]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Charge"] = function()
	local z = {}
	z.SpellName = SpellName(100--[[Charge]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Taunt"] = function()
	local z = {}
	z.SpellName = SpellName(355--[[Taunt]])
	if not SpellFlashAddon.IsEnemyTargetingFriendButNotYou() then
		return false
	end
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Mocking Blow"] = function()
	local z = {}
	z.SpellName = SpellName(694--[[Mocking Blow]])
	if not SpellFlashAddon.IsEnemyTargetingFriendButNotYou() then
		return false
	end
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Intercept"] = function()
	local z = {}
	z.SpellName = SpellName(20252--[[Intercept]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Intervene"] = function()
	if not UnitIsFriend("player", "target") then
		return false
	end
	local z = {}
	z.SpellName = SpellName(3411--[[Intervene]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Overpower"] = function()
	local z = {}
	z.SpellName = SpellName(7384--[[Overpower]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Revenge"] = function()
	local z = {}
	z.SpellName = SpellName(6572--[[Revenge]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Cleave"] = function()
	if not SpellFlashAddon.MeleeDistance() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(845--[[Cleave]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Whirlwind"] = function()
	if not SpellFlashAddon.MeleeDistance() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(1680--[[Whirlwind]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Shockwave"] = function()
	if not CheckInteractDistance("target", 3) then
		return false
	end
	local z = {}
	z.SpellName = SpellName(46968--[[Shockwave]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Sweeping Strikes"] = function()
	if not SpellFlashAddon.MeleeDistance() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(12328--[[Sweeping Strikes]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Rend"] = function()
	local z = {}
	z.SpellName = SpellName(772--[[Rend]])
	z.MyDebuff = z.SpellName
	z.DebuffSlotNeeded = 1
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Disarm"] = function()
	local z = {}
	z.SpellName = SpellName(676--[[Disarm]])
	z.Debuff = z.SpellName
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Hamstring"] = function()
	local z = {}
	z.SpellName = SpellName(1715--[[Hamstring]])
	z.Debuff = z.SpellName
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Execute"] = function()
	local z = {}
	z.SpellName = SpellName(5308--[[Execute]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Thunder Clap"] = function()
	if not SpellFlashAddon.MeleeDistance() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(6343--[[Thunder Clap]])
	z.Debuff = z.SpellName
	z.NoRangeCheck = 1
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Shield Bash"] = function()
	if not Casting(nil,"target",1) then
		return false
	end
	local z = {}
	z.SpellName = SpellName(72--[[Shield Bash]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Pummel"] = function()
	if not Casting(nil,"target",1) then
		return false
	end
	local z = {}
	z.SpellName = SpellName(6552--[[Pummel]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Shield Block"] = function()
	if not SpellFlashAddon.IsEnemyTargetingYou() or not SpellFlashAddon.MeleeDistance() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(2565--[[Shield Block]])
	z.Buff = z.SpellName
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Spell Reflection"] = function()
	if not Casting(nil,"target") or not SpellFlashAddon.IsEnemyTargetingYou() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(23920--[[Spell Reflection]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Heroic Strike"] = function()
	if not SpellFlashAddon.MeleeDistance() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(78--[[Heroic Strike]])
	z.EnemyTargetNeeded = 1
	z.NotIfActive = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Demoralizing Shout"] = function()
	if not CheckInteractDistance("target", 3) then
		return false
	end
	local z = {}
	z.SpellName = SpellName(1160--[[Demoralizing Shout]])
	z.Debuff = z.SpellName
	z.EnemyTargetNeeded = 1
	z.NoRangeCheck = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Piercing Howl"] = function()
	if not CheckInteractDistance("target", 3) then
		return false
	end
	local z = {}
	z.SpellName = SpellName(12323--[[Piercing Howl]])
	z.Debuff = z.SpellName
	z.EnemyTargetNeeded = 1
	z.NoRangeCheck = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Battle Shout"] = function()
	local z = {}
	z.SpellName = SpellName(6673--[[Battle Shout]])
	z.Buff = {
		z.SpellName,
		SpellName(19740--[[Blessing of Might]]),
		SpellName(25782--[[Greater Blessing of Might]]),
	}
	z.MyBuff = SpellName(469--[[Commanding Shout]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Commanding Shout"] = function()
	local z = {}
	z.SpellName = SpellName(469--[[Commanding Shout]])
	z.Buff = z.SpellName
	z.MyBuff = SpellName(6673--[[Battle Shout]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Berserker Rage"] = function()
	local z = {}
	z.SpellName = SpellName(18499--[[Berserker Rage]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Bloodrage"] = function()
	local z = {}
	z.SpellName = SpellName(2687--[[Bloodrage]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Death Wish"] = function()
	local z = {}
	z.SpellName = SpellName(12292--[[Death Wish]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Last Stand"] = function()
	if SpellFlashAddon.HealthDamagePercent("player") < 30 then
		return false
	end
	local z = {}
	z.SpellName = SpellName(12975--[[Last Stand]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Enraged Regeneration"] = function()
	if SpellFlashAddon.HealthDamagePercent("player") < 30 then
		return false
	end
	local z = {}
	z.SpellName = SpellName(55694--[[Enraged Regeneration]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Shield Wall"] = function()
	if not SpellFlashAddon.IsEnemyTargetingYou() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(871--[[Shield Wall]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Heroic Throw"] = function()
	local z = {}
	z.SpellName = SpellName(57755--[[Heroic Throw]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


