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


table.insert(SpellFlashAddon.OtherAurasFunctions, function()
	if HasTalent(SpellName(17793--[[Improved Shadow Bolt]])) then
		SpellFlashAddon.SetOtherAuras(SpellName(686--[[Shadow Bolt]]), SpellName(17800--[[Shadow Mastery]]))
	end
	if HasTalent(SpellName(32385--[[Shadow Embrace]])) then
		SpellFlashAddon.SetOtherAuras(SpellName(686--[[Shadow Bolt]]), SpellName(32385--[[Shadow Embrace]]))
		SpellFlashAddon.SetOtherAuras(SpellName(48181--[[Haunt]]), SpellName(32385--[[Shadow Embrace]]))
	end
end)

SpellFlashAddon.Event[AddonName] = function(event, arg, ...)

	if event == "ACTIONBAR_HIDEGRID" then
			
			SpellFlashAddon.SetTimer(AddonName.."SetShardBagSize-InternalSpellFlashAddon", 0.5, 0, Table.SetShardBagSize)
			
	elseif event == "PLAYER_ENTERING_WORLD" then
			
			SpellFlashAddon.SetTimer(AddonName.."SetShardBagSize-InternalSpellFlashAddon", 2, 0, Table.SetShardBagSize)
			
	elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
			
			if arg[2] == "SPELL_CAST_SUCCESS" and arg[3] == UnitGUID("player") and ( arg[10] == SpellName(1454--[[Life Tap]]) or arg[10] == SpellName(18220--[[Dark Pact]]) ) then
				SpellFlashAddon.SetTimer(AddonName.."TapDelay-InternalSpellFlashAddon", select(2,GetSpellCooldown(arg[10])))
			end
			
	end

end




Table.ShardBagSize = 10
function Table.SetShardBagSize()
	if NUM_BAG_FRAMES and NUM_BAG_FRAMES > 0 then
		for bag=1,NUM_BAG_FRAMES do
			local bagslots = GetContainerNumSlots(bag)
			if bagslots and bagslots > 0 then
				if select(2,GetContainerNumFreeSlots(bag)) == 4 then
					Table.ShardBagSize = bagslots
					SpellFlashAddon.debug("You have a Soul Bag equipped in bag slot:  "..bag)
					SpellFlashAddon.debug("Soul Shard gather amount has been set to:  "..Table.ShardBagSize)
					return
				end
			end
		end
	end
	Table.ShardBagSize = 10
	SpellFlashAddon.debug("No Soul Bag equipped!")
	SpellFlashAddon.debug("Soul Shard gather amount has been set to:  "..Table.ShardBagSize)
end





function Table.IsCursed(unit, any)
	return Debuff({
		SpellName(980--[[Curse of Agony]]),
		SpellName(1714--[[Curse of Tongues]]),
		SpellName(1490--[[Curse of the Elements]]),
		SpellName(18223--[[Curse of Exhaustion]]),
		SpellName(702--[[Curse of Weakness]]),
		SpellName(603--[[Curse of Doom]]),
	},unit,not any)
end


function Table.IsCursePushed()
	if AuraDelay(SpellName(980--[[Curse of Agony]]))
	or AuraDelay(SpellName(1714--[[Curse of Tongues]]))
	or AuraDelay(SpellName(1490--[[Curse of the Elements]]))
	or AuraDelay(SpellName(18223--[[Curse of Exhaustion]]))
	or AuraDelay(SpellName(702--[[Curse of Weakness]]))
	or AuraDelay(SpellName(603--[[Curse of Doom]]))
	or IsCurrentSpell(SpellName(980--[[Curse of Agony]]))
	or IsCurrentSpell(SpellName(1714--[[Curse of Tongues]]))
	or IsCurrentSpell(SpellName(1490--[[Curse of the Elements]]))
	or IsCurrentSpell(SpellName(18223--[[Curse of Exhaustion]]))
	or IsCurrentSpell(SpellName(702--[[Curse of Weakness]]))
	or IsCurrentSpell(SpellName(603--[[Curse of Doom]]))
	then
		return true
	end
	return false
end


function Table.IsCurseOfAgony(unit)
	return Debuff(SpellName(980--[[Curse of Agony]]),unit,1)
end

function Table.IsCurseOfDoom(unit)
	return Debuff(SpellName(603--[[Curse of Doom]]),unit,1)
end

function Table.IsCorruption(unit)
	return Debuff(SpellName(172--[[Corruption]]),unit,1)
end

function Table.IsImmolate(unit)
	return Debuff(SpellName(348--[[Immolate]]),unit,1)
end

function Table.IsArmorActive()
	return Buff({
		SpellName(28176--[[Fel Armor]]),
		SpellName(706--[[Demon Armor]]),
		SpellName(687--[[Demon Skin]]),
	})
end





Table.Castable["Fear"] = function()
	if SpellFlashAddon.IsFeared(nil,CastTime(SpellName(5782--[[Fear]]))) then
		return false
	end
	local z = {}
	z.SpellName = SpellName(5782--[[Fear]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


Table.Castable["Death Coil"] = function()
	if SpellFlashAddon.IsCrowedControlled() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(6789--[[Death Coil]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


Table.Castable["Demon Armor"] = function()
	local z = {}
	z.SpellName = SpellName(706--[[Demon Armor]])
	if not SpellKnown(z.SpellName) then
		z.SpellName = SpellName(687--[[Demon Skin]])
	end
	z.Buff = z.SpellName
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


Table.Castable["Fel Armor"] = function()
	local z = {}
	z.SpellName = SpellName(28176--[[Fel Armor]])
	z.Buff = z.SpellName
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


Table.Castable["Soul Link"] = function()
	if not UnitExists("pet") then
		return false
	end
	local z = {}
	z.SpellName = SpellName(19028--[[Soul Link]])
	z.Buff = z.SpellName
	z.BuffUnit = "pet"
	z.NoRangeCheck = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


Table.Castable["Curse of Agony"] = function()
	local z = {}
	z.SpellName = SpellName(980--[[Curse of Agony]])
	z.MyDebuff = z.SpellName
	z.DebuffSlotNeeded = 1
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Curse of Doom"] = function()
	if UnitPlayerControlled("target") then
		return false
	end
	local z = {}
	z.SpellName = SpellName(603--[[Curse of Doom]])
	z.MyDebuff = z.SpellName
	z.DebuffSlotNeeded = 1
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Curse of the Elements"] = function()
	local z = {}
	z.SpellName = SpellName(1490--[[Curse of the Elements]])
	z.Debuff = z.SpellName
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Curse of Weakness"] = function()
	local z = {}
	z.SpellName = SpellName(702--[[Curse of Weakness]])
	z.Debuff = z.SpellName
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Curse of Tongues"] = function()
	local z = {}
	z.SpellName = SpellName(1714--[[Curse of Tongues]])
	z.Debuff = z.SpellName
	z.TargetThatUsesManaNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Curse of Exhaustion"] = function()
	if SpellFlashAddon.IsMovementImpaired() then
		return false
	end
	local z = {}
	z.SpellName = SpellName(18223--[[Curse of Exhaustion]])
	z.Debuff = z.SpellName
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


Table.Castable["Corruption"] = function()
	local z = {}
	z.SpellName = SpellName(172--[[Corruption]])
	z.MyDebuff = {
		z.SpellName,
		SpellName(27243--[[Seed of Corruption]]),
	}
	z.DebuffSlotNeeded = 1
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Immolate"] = function()
	local z = {}
	z.SpellName = SpellName(348--[[Immolate]])
	z.MyDebuff = {
		z.SpellName,
		SpellName(30108--[[Unstable Affliction]]),
	}
	z.DebuffSlotNeeded = 1
	z.EnemyTargetNeeded = 1
	if SpellKnown(SpellName(29722--[[Incinerate]])) then
		z.CastTime = CastTime(SpellName(29722--[[Incinerate]])) + 2
	end
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Unstable Affliction"] = function()
	local z = {}
	z.SpellName = SpellName(30108--[[Unstable Affliction]])
	z.MyDebuff = {
		z.SpellName,
		SpellName(348--[[Immolate]]),
	}
	z.DebuffSlotNeeded = 1
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Haunt"] = function()
	local z = {}
	z.SpellName = SpellName(48181--[[Haunt]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Drain Life"] = function()
	local z = {}
	z.SpellName = SpellName(689--[[Drain Life]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Drain Mana"] = function()
	local z = {}
	z.SpellName = SpellName(5138--[[Drain Mana]])
	z.EnemyTargetNeeded = 1
	z.TargetThatUsesManaNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Hellfire"] = function()
	local z = {}
	z.SpellName = SpellName(1949--[[Hellfire]])
	z.NoRangeCheck = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Rain of Fire"] = function()
	local z = {}
	z.SpellName = SpellName(5740--[[Rain of Fire]])
	z.NoRangeCheck = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end



Table.Castable["Shadow Ward"] = function()
	local z = {}
	z.SpellName = SpellName(6229--[[Shadow Ward]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


Table.Castable["Drain Soul"] = function()
	local z = {}
	z.SpellName = SpellName(1120--[[Drain Soul]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end



Table.Castable["Shadowburn"] = function()
	local z = {}
	z.SpellName = SpellName(17877--[[Shadowburn]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Chaos Bolt"] = function()
	local z = {}
	z.SpellName = SpellName(50796--[[Chaos Bolt]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Incinerate"] = function()
	local z = {}
	z.SpellName = SpellName(29722--[[Incinerate]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Soul Fire"] = function()
	local z = {}
	z.SpellName = SpellName(6353--[[Soul Fire]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


Table.Castable["Dark Pact"] = function()
	if UnitHealth("pet") <= 0 then
		return false
	end
	local z = {}
	z.SpellName = SpellName(18220--[[Dark Pact]])
	z.NoRangeCheck = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

Table.Castable["Life Tap"] = function()
	local z = {}
	z.SpellName = SpellName(1454--[[Life Tap]])
	z.NoRangeCheck = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end




Table.Castable["Shadow Bolt"] = function()
	local z = {}
	z.SpellName = SpellName(686--[[Shadow Bolt]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end



Table.Castable["Searing Pain"] = function()
	local z = {}
	z.SpellName = SpellName(5676--[[Searing Pain]])
	z.EnemyTargetNeeded = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end



Table.Castable["Fel Domination"] = function()
	local z = {}
	z.SpellName = SpellName(18708--[[Fel Domination]])
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


Table.Castable["Conflagrate"] = function()
	if not AuraDelay(SpellName(348--[[Immolate]])) and not IsCurrentSpell(SpellName(348--[[Immolate]])) and not Casting(SpellName(348--[[Immolate]])) and not Debuff({SpellName(348--[[Immolate]]),SpellName(47897--[[Shadowflame]])},nil,1) then
		return false
	end
	local z = {}
	z.SpellName = SpellName(17962--[[Conflagrate]])
	z.EvenIfNotUsable = ( AuraDelay(SpellName(348--[[Immolate]])) or IsCurrentSpell(SpellName(348--[[Immolate]])) or Casting(SpellName(348--[[Immolate]])) )
	return SpellFlashAddon.CheckIfSpellCastable(z)
end


Table.Castable["Health Funnel"] = function()
	local z = {}
	z.SpellName = SpellName(755--[[Health Funnel]])
	z.NotIfActive = 1
	return SpellFlashAddon.CheckIfSpellCastable(z)
end

