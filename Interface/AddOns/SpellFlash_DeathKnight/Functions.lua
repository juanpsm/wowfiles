local MinBuild, MaxBuild, Build = 40000, 0, select(4, GetBuildInfo())
if Build < MinBuild or ( MaxBuild > 0 and Build > MaxBuild ) then return end
local AddonName, AddonTable = ...
local L = AddonTable.Localize
local s = SpellFlashAddon
local x = s.UpdatedVariables
local z = {}
AddonTable.Castable = {}
AddonTable.VehicleCastable = {}
AddonTable.ItemCastable = {}


AddonTable.Castable["Auto Attack"] = function()
	wipe(z)
	z.SpellID = 6603--[[Auto Attack]]
	z.EnemyTargetNeeded = 1
	z.NotIfActive = 1
	return s.MeleeDistance() and not s.CurrentSpell(88163--[[Attack]]) and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Attack"] = function()
	wipe(z)
	z.SpellID = 88163--[[Attack]]
	z.EnemyTargetNeeded = 1
	z.NotIfActive = 1
	return s.MeleeDistance() and not s.CurrentSpell(6603--[[Auto Attack]]) and s.CheckIfSpellCastable(z)
end

local StrengthAndAgilityBuffs = {
	6673--[[Battle Shout]],
	57330--[[Horn of Winter]],
	93435--[[Roar of Courage]],
	8076--[[Strength of Earth]],
}

--Death knight Buffs--
AddonTable.Castable["Horn of Winter"] = function()
	wipe(z)
	z.SpellID = 57330--[[Horn of Winter]]
	z.Buff = StrengthAndAgilityBuffs
	z.BuffUnit = "player"
	return s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Dark Transformation"] = function()
	wipe(z)
	z.SpellID = 49542--[[Dark Transformation]]
	z.Buff = 49572--[[Shadow Infusion]]
	z.BuffUnit = "pet"
	return s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Unholy Frenzy"] = function()
	wipe(z)
	z.SpellID = 49016--[[Unholy Frenzy]]
	z.Buff = z.SpellID
	z.EnemyTargetNeeded = 1
	return s.CheckIfSpellCastable(z)
end

local function OtherAurasFunction()
	s.SetOtherAuras(45462--[[Plague Strike]], 59879--[[Blood Plague]])
	s.SetOtherAuras(45477--[[Icy Touch]], 59921--[[Frost Fever]])
	s.SetOtherAuras(77575--[[Outbreak]], 59921--[[Frost Fever]])
	s.SetOtherAuras(77575--[[Outbreak]], 59879--[[Blood Plague]])
	s.SetOtherAuras(49184--[[Howling Blast]], 59921--[[Frost Fever]])
	s.SetOtherAuras(47541--[[Death Coil]], 49572--[[Shadow Infusion]])
	s.SetOtherAuras(49998--[[Death Strike]], 77513--[[Blood Shield]])
end
s.RegisterOtherAurasFunction(OtherAurasFunction)

local Diseases = {
	59879--[[Blood Plague]],
	59921--[[Frost Fever]],
}

local EbonDiseases = {
	59879--[[Blood Plague]],
	59921--[[Frost Fever]],
	65142--[[Ebon Plague]],
}

AddonTable.Castable["Plague Strike"] = function()
	wipe(z)
	z.SpellID = 45462--[[Plague Strike]]
	z.Debuff = 59879--[[Blood Plague]]
	z.EarlyRefresh = 2
	z.EnemyTargetNeeded = 1
	return s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Outbreak"] = function()
	wipe(z)
	z.SpellID = 77575--[[Outbreak]]
	if s.HasGlyph(63335--[[Glyph of Howling Blast]]) then
		z.Debuff = 59879--[[Blood Plague]]
	else
		z.Debuff = Diseases
	end
	z.EnemyTargetNeeded = 1
	return s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Icy Touch"] = function()
	wipe(z)
	z.SpellID = 45477--[[Icy Touch]]
	z.Debuff = 59921--[[Frost Fever]]
	z.EarlyRefresh = 2
	z.EnemyTargetNeeded = 1
	return s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Howling Blast"] = function()
	wipe(z)
	z.SpellID = 49184--[[Howling Blast]]
	z.EnemyTargetNeeded = 1
	return s.CheckIfSpellCastable(z)
end


--Death Knight Crowd Control--
AddonTable.Castable["Chains of Ice"] = function()
	wipe(z)
	z.SpellID = 45524--[[Chains of Ice]]
	if UnitExists("focus") and not s.Boss("focus") and ( not s.Debuff(nil, "focus") or s.NoDamageCC("focus") ) then
		z.Unit = "focus"
	end
	z.EnemyTargetNeeded = 1
	local seconds = s.CastTime(z.SpellID) + s.SpellCooldown(z.SpellID) + x.DoubleLag
	return not s.Boss(z.Unit) and s.CheckIfSpellCastable(z) and ( not s.Debuff(nil, z.Unit) or ( s.NoDamageCC(z.Unit) and not s.ImmunityDebuff(z.Unit, seconds) and not s.BreakOnDamageCC(z.Unit, seconds + 5) ) )
end

AddonTable.Castable["Hungering Cold"] = function()
	wipe(z)
	z.SpellID = 49203--[[Hungering Cold]]
	z.EnemyTargetNeeded = 1
	z.NotIfActive = 1
	local seconds = s.CastTime(z.SpellID) + s.SpellCooldown(z.SpellID) + x.DoubleLag
	return not s.Boss(z.Unit) and s.CheckIfSpellCastable(z) and ( not s.Debuff(nil, z.Unit) or ( s.NoDamageCC(z.Unit) and not s.ImmunityDebuff(z.Unit, seconds) and not s.BreakOnDamageCC(z.Unit, seconds + 5) ) )
end

--Death Knight Interrupts--
AddonTable.Castable["Mind Freeze"] = function()
	wipe(z)
	z.SpellID = 47528--[[Mind Freeze]]
	z.EnemyTargetNeeded = 1
	return s.GetCastingOrChanneling(nil, nil, 1) > s.SpellCooldown(z.SpellID) + x.DoubleLag and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Strangulate"] = function()
	wipe(z)
	z.SpellID = 47476--[[Strangulate]]
	z.EnemyTargetNeeded = 1
	return s.GetCastingOrChanneling(nil, nil, 1) > s.SpellCooldown(z.SpellID) + x.DoubleLag and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Death Grip"] = function()
	wipe(z)
	z.SpellID = 49576--[[Death Grip]]
	z.EnemyTargetNeeded = 1
	return s.GetCastingOrChanneling(nil, nil, 1) > s.SpellCooldown(z.SpellID) + x.DoubleLag and s.CheckIfSpellCastable(z)
end

--Death Knight Pets--
AddonTable.Castable["Raise Dead"] = function()
	wipe(z)
	z.SpellID = 46584--[[Raise Dead]]
	z.NotIfActive = 1
	return s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Army of the Dead"] = function()
	wipe(z)
	z.SpellID = 42650--[[Army of the Dead]]
	z.NotWhileMoving = 1
	z.NotIfActive = 1
	return s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Summon Gargoyle"] = function()
	wipe(z)
	z.SpellID = 49206--[[Summon Gargoyle]]
	z.NotIfActive = 1
	return s.CheckIfSpellCastable(z)
end

--Death Knight Presence--
AddonTable.Castable["Unholy Presence"] = function()
	wipe(z)
	z.SpellID = 48265--[[Unholy Presence]]
	return not s.Form(z.SpellID) and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Frost Presence"] = function()
	wipe(z)
	z.SpellID = 48266--[[Frost Presence]]
	return not s.Form(z.SpellID) and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Blood Presence"] = function()
	wipe(z)
	z.SpellID = 48263--[[Blood Presence]]
	return not s.Form(z.SpellID) and s.CheckIfSpellCastable(z)
end

--Death Knight Protections--
AddonTable.Castable["Anti-Magic Shell"] = function()
	wipe(z)
	z.SpellID = 48707--[[Anti-Magic Shell]]
	z.Buff = z.SpellID
	z.BuffUnit = "player"
	z.EnemyTargetNeeded = 1
	return s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Anti-Magic Zone"] = function()
	wipe(z)
	z.SpellID = 50462--[[Anti-Magic Zone]]
	z.Buff = z.SpellID
	z.BuffUnit = "player"
	z.EnemyTargetNeeded = 1
	return s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Death Pact"] = function()
	wipe(z)
	z.SpellID = 48743--[[Death Pact]]
	z.EnemyTargetNeeded = 1
	return s.InCombat() and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Rune Tap"] = function()
	wipe(z)
	z.SpellID = 48982--[[Rune Tap]]
	return s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Vampiric Blood"] = function()
	wipe(z)
	z.SpellID = 55233--[[Vampiric Blood]]
	z.EnemyTargetNeeded = 1
	return s.InCombat() and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Bone Shield"] = function()
	wipe(z)
	z.SpellID = 49222--[[Bone Shield]]
	z.EnemyTargetNeeded = 1
	return s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Dancing Rune Weapon"] = function()
	wipe(z)
	z.SpellID = 49028--[[Dancing Rune Weapon]]
	z.EnemyTargetNeeded = 1
	z.NotIfActive = 1
	return s.CheckIfSpellCastable(z)
end


--Unholy Spells--

AddonTable.Castable["Death Coil"] = function()
	wipe(z)
	z.SpellID = 47541--[[Death Coil]]
	return s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Death Grip"] = function()
	wipe(z)
	z.SpellID = 49576--[[Death Grip]]
	z.EnemyTargetNeeded = 1
	return s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Death and Decay"] = function()
	wipe(z)
	z.SpellID = 43265--[[Death and Decay]]
	z.EnemyTargetNeeded = 1
	return s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Raise Ally"] = function()
	wipe(z)
	z.SpellID = 61999--[[Raise Ally]]
	z.NotWhileMoving = 1
	return s.MeleeDistance() and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Necrotic Strike"] = function()
	wipe(z)
	z.SpellID = 73975--[[Necrotic Strike]]
	z.EnemyTargetNeeded = 1
	return s.MeleeDistance() and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Scourge Strike"] = function()
	wipe(z)
	z.SpellID = 55090--[[Scourge Strike]]
	z.EnemyTargetNeeded = 1
	return s.MeleeDistance() and s.CheckIfSpellCastable(z)
end


--Frost Spells--

AddonTable.Castable["Frost Strike"] = function()
	wipe(z)
	z.SpellID = 49143--[[Frost Strike]]
	z.EnemyTargetNeeded = 1
	return s.MeleeDistance() and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Obliterate"] = function()
	wipe(z)
	z.SpellID = 49020--[[Obliterate]]
	z.EnemyTargetNeeded = 1
	return s.MeleeDistance() and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Path of Frost"] = function()
	wipe(z)
	z.SpellID = 3714--[[Path of Frost]]
	z.MyBuff = z.SpellID
	z.NotIfActive = 1
	return s.MeleeDistance() and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Icebound Fortitude"] = function()
	wipe(z)
	z.SpellID = 48792--[[Icebound Fortitude]]
	z.NotIfActive = 1
	return s.InCombat() or s.EnemyTargetingYou("focus") or s.EnemyTargetingYou("enemy") and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Festering Strike"] = function()
	wipe(z)
	z.SpellID = 85948--[[Festering Strike]]
	z.EnemyTargetNeeded = 1
	z.MyDebuff = Diseases
	return s.MeleeDistance() and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Rune Strike"] = function()
	wipe(z)
	z.SpellID = 56815--[[Rune Strike]]
	z.EnemyTargetNeeded = 1
	return s.Power("player") > 35 and s.MeleeDistance() and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Empower Rune Weapon"] = function()
	wipe(z)
	z.SpellID = 47568--[[Empower Rune Weapon]]
	z.NotIfActive = 1
	return s.InCombat() or s.EnemyTargetingYou("target") or s.EnemyTargetingYou("enemy") and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Chains of Ice"] = function()
	wipe(z)
	z.SpellID = 45524--[[Chains of Ice]]
	if UnitExists("focus") and not s.Boss("focus") and ( not s.Debuff(nil, "focus") or s.NoDamageCC("focus") ) then
		z.Unit = "focus"
	end
	z.EnemyTargetNeeded = 1
	local seconds = s.CastTime(z.SpellID) + s.SpellCooldown(z.SpellID) + x.DoubleLag
	return not s.Boss(z.Unit) and s.CheckIfSpellCastable(z) and ( not s.Debuff(nil, z.Unit) or ( s.NoDamageCC(z.Unit) and not s.ImmunityDebuff(z.Unit, seconds) and not s.BreakOnDamageCC(z.Unit, seconds + 5) ) )
end

AddonTable.Castable["Lichborne"] = function()
	wipe(z)
	z.SpellID = 49039--[[Lichborne]]
	z.Buff = z.SpellID
	z.NotIfActive = 1
	return s.MeleeDistance() and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Pillar of Frost"] = function()
	wipe(z)
	z.SpellID = 51271--[[Pillar of Frost]]
	z.Buff = z.SpellID
	z.NotIfActive = 1
	return s.MeleeDistance() and s.CheckIfSpellCastable(z)
end


--Blood Spells--

AddonTable.Castable["Heart Strike"] = function()
	wipe(z)
	z.SpellID = 55050--[[Heart Strike]]
	z.EnemyTargetNeeded = 1
	return s.MeleeDistance() and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Blood Strike"] = function()
	wipe(z)
	z.SpellID = 45902--[[Blood Strike]]
	z.EnemyTargetNeeded = 1
	return s.MeleeDistance() and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Death Strike"] = function()
	wipe(z)
	z.SpellID = 49998--[[Death Strike]]
	z.EnemyTargetNeeded = 1
	return s.MeleeDistance() and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Blood Boil"] = function()
	wipe(z)
	z.SpellID = 48721--[[Blood Boil]]
	z.EnemyTargetNeeded = 1
	return s.MeleeDistance() and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Blood Tap"] = function()
	wipe(z)
	z.SpellID = 45529--[[Blood Tap]]
	return s.MeleeDistance() and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Dark Command"] = function()
	wipe(z)
	z.SpellID = 56222--[[Dark Command]]
	z.EnemyTargetNeeded = 1
	return s.EnemyTargetingYourFriend() and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Dark Simulacrum"] = function()
	wipe(z)
	z.SpellID = 77606--[[Dark Simulacrum]]
	z.EnemyTargetNeeded = 1
	z.TargetThatUsesManaNeeded = 1
	z.NotIfActive = 1
	return s.MeleeDistance() and s.CheckIfSpellCastable(z)
end

AddonTable.Castable["Pestilence"] = function()
	wipe(z)
	z.SpellID = 50842--[[Pestilence]]
	z.Debuff = Diseases
	z.MyDebuff = Diseases
	z.EarlyRefresh = 2
	z.EnemyTargetNeeded = 1
	return s.MeleeDistance() and s.CheckIfSpellCastable(z)
end
