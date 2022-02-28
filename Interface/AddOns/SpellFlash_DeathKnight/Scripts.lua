local MinBuild, MaxBuild, Build = 40000, 0, select(4, GetBuildInfo())
if Build < MinBuild or ( MaxBuild > 0 and Build > MaxBuild ) then return end
local AddonName, AddonTable = ...
local L = AddonTable.Localize
local s = SpellFlashAddon
local x = s.UpdatedVariables
local function RunSpamTable(...)
	local i = s.GetModuleConfig(AddonName, "script_number") or 1
	if type(AddonTable.Spam[i]) == "table" and type(AddonTable.Spam[i].Function) == "function" then
		AddonTable.Spam[i].Function(...)
	elseif type(AddonTable.Spam[1]) == "table" and type(AddonTable.Spam[1].Function) == "function" then
		s.SetModuleConfig(AddonName, "script_number", nil)
		AddonTable.Spam[1].Function(...)
	end
end

local function Castable(English_Spell_Name, ...)
	if type(AddonTable.Castable[English_Spell_Name]) == "function" then
		return AddonTable.Castable[English_Spell_Name](...)
	end
	print(English_Spell_Name, ": has not been defined in a function!")
	return false
end

local function VehicleCastable(English_Spell_Name, ...)
	if type(AddonTable.VehicleCastable[English_Spell_Name]) == "function" then
		return AddonTable.VehicleCastable[English_Spell_Name](...)
	end
	print(English_Spell_Name, ": has not been defined in a function!")
	return false
end

local function ItemCastable(English_Item_Name, ...)
	if type(AddonTable.ItemCastable[English_Item_Name]) == "function" then
		return AddonTable.ItemCastable[English_Item_Name](...)
	end
	print(English_Item_Name, ": has not been defined in a function!")
	return false
end

local function SetColor(UseColor, Color, ElseColor)
	if UseColor then
		return Color
	end
	return ElseColor or "Pink"
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

-- SpellFlash API: http://wow.curseforge.com/addons/spellflash/pages/api/
-- x.Enemy, x.ActiveEnemy, x.NoCC, x.InInstance, x.InstanceType, x.PetAlive, x.PetActiveEnemy, x.PetNoCC, x.Lag, x.DoubleLag, x.ThreatPercent, x.EnemyDetected, x.ShouldPermanentBuff, x.ShouldTemporaryBuff

local Diseases = {
	59879--[[Blood Plague]],
	59921--[[Frost Fever]],
	65142--[[Ebon Plague]],
}

local function Diseases()
	return s.TalentRank (82334--[[Epidemic]]) > 1
	and not s.CurrentSpell(45462--[[Plague Strike]])
	and not s.Casting(45462--[[Plague Strike]], "player")
	and not s.CurrentSpell(45477--[[Icy Touch]])
	and not s.Casting(45477--[[Icy Touch]], "player")
	and not s.CurrentSpell(77575--[[Outbreak]])
	and not s.Casting(77575--[[Outbreak]], "player")
	and not s.Debuff(Diseases, nil, math.max((s.GetCasting(nil, "player")), (s.SpellCooldown(45462--[[Plague Strike]]))) + x.DoubleLag + 2)
end

local whileResting, whileCombat, whileBlood, whileFrost, whileUnholy

local function flashCheck()

	if IsResting() then
		if s.GetModuleConfig(AddonName, "Resting") then
			whileResting = true;
		else
			whileResting = false;
		end
	else
		whileResting = true;
	end
	
	if not s.InCombat() then
		if s.GetModuleConfig(AddonName, "Combat") then
			whileCombat = true;
		else
			whileCombat = false;
		end
	else
		whileCombat = true;
	end
	
	if not s.GetModuleConfig(AddonName, "DisableBlood") then
		whileBlood = true;
	else
		whileBlood = false;
	end
	
	if not s.GetModuleConfig(AddonName, "DisableFrost") then
		whileFrost = true;
	else
		whileFrost = false;
	end
	
	if not s.GetModuleConfig(AddonName, "DisableUnholy") then
		whileUnholy = true;
	else
		whileUnholy = false;
	end

end

local function Cooldowns()

	if s.TalentMastery(1) and whileBlood and whileResting and whileCombat then
		if not s.SpellCooldown(49028--[[Dancing Rune Weapon]])  and x.ActiveEnemy and Castable("Dancing Rune Weapon") then
			s.Flash(49028--[[Dancing Rune Weapon]], SetColor(x.ActiveEnemy, "Green"))
		end
		
		if s.HasTalent(49039--[[Lichborne]]) and s.Flashable(49039--[[Lichborne]]) and s.CrowedControlled("player") and Castable("Lichborne") then
			s.Flash(49039--[[Lichborne]], SetColor(x.ActiveEnemy, "Green"))
		end
		
		if s.HasSpell(77606--[[Dark Simulacrum]]) and s.Flashable(77606--[[Dark Simulacrum]]) and x.ActiveEnemy and s.UsesMana() and Castable("Dark Simulacrum") then
			s.Flash(77606--[[Dark Simulacrum]], SetColor(x.ActiveEnemy, "Aqua"))
		end
		
		if not s.SpellCooldown(47568--[[Empower Rune Weapon]]) and x.ActiveEnemy and Castable("Empower Rune Weapon") then
			s.Flash(47568--[[Empower Rune Weapon]], SetColor(x.ActiveEnemy, "Green"))
		end
		
		if x.NoCC and x.ActiveEnemy and s.Flashable(57330--[[Horn of Winter]]) and s.PowerPercent("player") < 10 and Castable("Horn of Winter") then
			s.Flash(57330--[[Horn of Winter]], SetColor(x.ActiveEnemy))
		end
		
		if not s.SpellCooldown(55233--[[Vampiric Blood]]) ==0 and x.ActiveEnemy and Castable("Vampitic Blood") then
			s.Flash(55233--[[Vampiric Blood]], SetColor(x.ActiveEnemy, "Red"))
		end
		
	end
	
	if s.TalentMastery(2) and whileFrost and whileResting and whileCombat then
		if s.HasTalent(51271--[[Pillar of Frost]]) and s.Flashable(51271--[[Pillar of Frost]]) and Castable("Pillar of Frost") then
			s.Flash(51271--[[Pillar of Frost]], SetColor(x.ActiveEnemy, "Green"))
		end
		
		if s.HasTalent(51128--[[Killing Machine]]) and s.Flashable(49020--[[Obliterate]]) and Castable("Obliterate") then
			s.Flash(49020--[[Obliterate]], SetColor(x.ActiveEnemy, "Orange"))
		end
		
		if s.HasTalent(49203--[[Hungering Cold]]) and s.Flashable(49203--[[Hungering Cold]]) and s.GetCastingOrChanneling(nil, nil, 1) and Castable("Hungering Cold") then
			s.Flash(49203--[[Hungering Cold]], SetColor(x.ActiveEnemy, "Aqua"))
		end
		
		if s.HasSpell(77606--[[Dark Simulacrum]]) and s.Flashable(77606--[[Dark Simulacrum]]) and x.ActiveEnemy and s.UsesMana() and Castable("Dark Simulacrum") then
			s.Flash(77606--[[Dark Simulacrum]], SetColor(x.ActiveEnemy, "Aqua"))
		end
		
	end
	
	if s.TalentMastery(3) and whileUnholy and whileResting and whileCombat then
		if s.HasTalent(49206--[[Summon Gargoyle]]) and x.ActiveEnemy and s.Flashable(49206--[[Summon Gargoyle]]) and Castable("Summon Gargoyle") then
			s.Flash(49206--[[Summon Gargoyle]], SetColor(x.ActiveEnemy, "Green"))
		end
		
		if s.HasTalent(49542--[[Dark Transformation]]) and x.ActiveEnemy and s.Flashable(49542--[[Dark Transformation]]) and Castable("Dark Transformation") then
			s.Flash(49542--[[Dark Transformation]], SetColor(x.ActiveEnemy, "Green"))
		end
		
		if s.HasTalent(50462--[[Anti-Magic Zone]]) and x.ActiveEnemy and s.GetCastingOrChanneling(nil, nil, 1) and Castable("Anti-Magic Zone") then
			s.Flash(50462--[[Anti-Magic Zone]], SetColor(x.ActiveEnemy, "Green"))
		end
		
		if s.HasSpell(77606--[[Dark Simulacrum]]) and s.Flashable(77606--[[Dark Simulacrum]]) and x.ActiveEnemy and s.UsesMana() and Castable("Dark Simulacrum") then
			s.Flash(77606--[[Dark Simulacrum]], SetColor(x.ActiveEnemy, "Aqua"))
		end
		
	end
end

s.Spam[AddonName] = function()
	if s.GetModuleConfig(AddonName, "spell_flashing_off") then return elseif AddonTable.Spam then RunSpamTable() else
	
	flashCheck()
	Diseases()
	Cooldowns()

--Blood Specification Rules--
		if s.TalentMastery(1) then
			if not s.SelfBuff(48263--[[Blood Presence]]) and Castable("Blood Presence") then
				if s.Flashable(48263--[[Blood Presence]]) then
					s.Flash(48263--[[Blood Presence]])
				end
				s.FlashForm(48263--[[Blood Presence]])
			end
			
			if s.Flashable(49222--[[Bone Shield]]) and Castable("Bone Shield") then
				s.Flash(49222--[[Bone Shield]], SetColor(x.ActiveEnemy, "Yellow"))
			elseif s.Flashable(48792--[[Icebound Fortitude]]) and s.HealthPercent("player") < 35 and Castable("Icebound Fortitude") then
				s.Flash(48792--[[Icebound Fortitude]], SetColor(x.ActiveEnemy, "Red"))
			elseif s.Flashable(48707--[[Anti-Magic Shell]]) and s.HealthPercent("player") < 80 and Castable("Anti-Magic Shell") then
				s.Flash(48707--[[Anti-Magic Shell]], SetColor(x.ActiveEnemy, "Yellow"))
			elseif s.Flashable(42650--[[Army of the Dead]]) and s.HealthPercent("player") < 50 and Castable("Army of the Dead") then
				s.Flash(42650--[[Army of the Dead]], SetColor(x.ActiveEnemy, "Red"))
			end	

			if x.ThreatPercent <= 99 and ( GetNumRaidMembers() > 1 or GetNumPartyMembers() > 0 ) then
			if s.Flashable(56222--[[Dark Command]]) and x.NoCC and Castable("Dark Command") then
				s.Flash(56222--[[Dark Command]], SetColor(x.ActiveEnemy, "Purple"))
			end
		end
			
			if s.Form(48263--[[Blood Presence]]) then
				
				if s.Flashable(49998--[[Death Strike]]) and s.HealthPercent("player") < 70 and Castable("Death Strike") then
					s.Flash(49998--[[Death Strike]], SetColor(x.ActiveEnemy))
				end
			
				if s.Flashable(47528--[[Mind Freeze]]) and x.NoCC and Castable("Mind Freeze") then
					s.Flash(47528--[[Mind Freeze]], SetColor(x.ActiveEnemy, "Aqua"))
				elseif s.Flashable(47476--[[Strangulate]]) and x.NoCC and Castable("Strangulate") then
					s.Flash(47476--[[Strangulate]], SetColor(x.ActiveEnemy, "Aqua"))
				end

				if x.NoCC and s.Flashable(77575--[[Outbreak]]) and Castable("Outbreak") then
					s.Flash(77575--[[Outbreak]], SetColor(x.ActiveEnemy))
				elseif x.NoCC and not s.HasSpell(77575--[[Outbreak]]) and Castable("Icy Touch") then
					s.Flash(45477--[[Icy Touch]], SetColor(x.ActiveEnemy))
				elseif x.NoCC and not s.HasSpell(77575--[[Outbreak]]) and Castable("Plague Strike") then
					s.Flash(45462--[[Plague Strike]], SetColor(x.ActiveEnemy))					
				elseif x.NoCC and s.Flashable(45477--[[Icy Touch]]) and s.DebuffDuration(59921--[[Frost Fever]]) < 5 and Castable("Icy Touch") then
					s.Flash(45477--[[Icy Touch]], SetColor(x.ActiveEnemy))
				elseif x.NoCC and s.Flashable(45462--[[Plague Strike]]) and s.DebuffDuration(59879--[[Blood Plague]]) < 5 and Castable("Plague Strike") then
					s.Flash(45462--[[Plague Strike]], SetColor(x.ActiveEnemy))
				elseif x.NoCC and s.Flashable(85948--[[Festering Strike]]) and s.Diseased("target") and Castable("Festering Strike") then
					s.Flash(85948--[[Festering Strike]], SetColor(x.ActiveEnemy))
				elseif x.NoCC and s.Flashable(55050--[[Heart Strike]]) and s.Diseased("target") and Castable("Heart Strike") then
					s.Flash(55050--[[Heart Strike]], SetColor(x.ActiveEnemy))
				elseif x.NoCC and s.Flashable(48721--[[Blood Boil]]) and Castable("Blood Boil") then
					s.Flash(48721--[[Blood Boil]], SetColor(x.ActiveEnemy))
				elseif x.NoCC and s.Flashable(43265--[[Death and Decay]]) and Castable("Death and Decay") then
					s.Flash(43265--[[Death and Decay]], SetColor(x.ActiveEnemy))
				elseif x.NoCC and s.Flashable(56815--[[Rune Strike]]) and s.Power("player") > 40 and Castable("Rune Strike") then
					s.Flash(56815--[[Rune Strike]], SetColor(x.ActiveEnemy))

				end
			end
		end

--Frost Specification Rules--
		if s.TalentMastery(2) then

			if s.Form(48266--[[Frost Presence]]) or s.Form(48265--[[Unholy Presence]]) then
				if s.Boss() and s.Flashable(51271--[[Pillar of Frost]]) and x.NoCC and s.HealthPercent("player") < 90 and Castable("Pillar of Frost") then
					s.Flash(51271--[[Pillar of Frost]], SetColor(x.ActiveEnemy, "Red"))
				elseif s.Flashable(48792--[[Icebound Fortitude]]) and x.NoCC and s.HealthPercent("player") < 35 and Castable("Icebound Fortitude") then
					s.Flash(48792--[[Icebound Fortitude]], SetColor(x.ActiveEnemy, "Red"))
				elseif s.Flashable(48707--[[Anti-Magic Shell]]) and x.NoCC and s.HealthPercent("player") < 60 and Castable("Anti-Magic Shell") then
					s.Flash(48707--[[Anti-Magic Shell]], SetColor(x.ActiveEnemy, "Red"))
				end
			end
			
			if s.Flashable(47528--[[Mind Freeze]]) and x.NoCC and Castable("Mind Freeze") then
				s.Flash(47528--[[Mind Freeze]], SetColor(x.ActiveEnemy, "Aqua"))
			elseif s.Flashable(47476--[[Strangulate]]) and x.NoCC and Castable("Strangulate") then
				s.Flash(47476--[[Strangulate]], SetColor(x.ActiveEnemy, "Aqua"))
			end
			
			if s.Flashable(77575--[[Outbreak]]) and x.NoCC and Castable("Outbreak") then 
				s.Flash(77575--[[Outbreak]], SetColor(x.ActiveEnemy)) 
			elseif s.Flashable(49184--[[Howling Blast]]) and x.NoCC and not s.MyDebuff("Frost Fever", "target", 2) and s.HasGlyph("Glyph of Howling Blast") and Castable("Howling Blast") then 
				s.Flash(49184--[[Howling Blast]], SetColor(x.ActiveEnemy)) 
			elseif s.Flashable(45477--[[Icy Touch]]) and x.NoCC and Castable("Icy Touch") then 
				s.Flash(45477--[[Icy Touch]], SetColor(x.ActiveEnemy)) 
			elseif s.Flashable(45462--[[Plague Strike]]) and x.NoCC and Castable("Plague Strike") then 
				s.Flash(45462--[[Plague Strike]], SetColor(x.ActiveEnemy)) 
			elseif s.Flashable(49020--[[Obliterate]]) and s.Buff("Killing Machine", "player") and x.NoCC and Castable("Obliterate") then 
				s.Flash(49020--[[Obliterate]], SetColor(x.ActiveEnemy)) 
			elseif s.Flashable(49143--[[Frost Strike]]) and x.NoCC and s.PowerMissing("player") < 20 and Castable("Frost Strike") then 
				s.Flash(49143--[[Frost Strike]], SetColor(x.ActiveEnemy)) 
			elseif s.Flashable(49143--[[Frost Strike]]) and x.NoCC and s.Buff("Killing Machine", "player") and Castable("Frost Strike") then 
				s.Flash(49143--[[Frost Strike]], SetColor(x.ActiveEnemy)) 
			elseif s.Flashable(49184--[[Howling Blast]]) and x.NoCC and s.Buff("Freezing Fog", "player") and Castable("Howling Blast") then 
				s.Flash(49184--[[Howling Blast]], SetColor(x.ActiveEnemy)) 
			elseif s.Flashable(49020--[[Obliterate]]) and x.NoCC and Castable("Obliterate") then 
				s.Flash(49020--[[Obliterate]], SetColor(x.ActiveEnemy)) 
			elseif s.Flashable(49143--[[Frost Strike]]) and x.NoCC and s.Power("player") > 31 and Castable("Frost Strike") then 
				s.Flash(49143--[[Frost Strike]], SetColor(x.ActiveEnemy)) 
			elseif s.Flashable(57330--[[Horn of Winter]]) and x.NoCC and Castable("Horn of Winter") then 
				s.Flash(57330--[[Horn of Winter]], SetColor(x.ActiveEnemy)) 
			end 

		end
	
--Unholy Specification Rules--
		if s.TalentMastery(3) then
			if s.Flashable(46584--[[Raise Dead]]) and s.PetCastable("Raise Dead") then
				s.Flash(46584--[[Raise Dead]], "Green")
			elseif not x.PetAlive and x.ActiveEnemy then
				s.Flash(46584--[[Raise Dead]], "Green")
			end
				
			if x.PetAlive then
				if not s.InCombat() then
					if x.InstanceType == "party" or x.InstanceType == "raid" then
						if ( GetNumRaidMembers() > 1 or GetNumPartyMembers() > 0 ) and s.PetCastable("Defensive") and s.PetCastable("Passive") then
							s.FlashPet("Passive", "Pink")
						end
					elseif not x.InInstance and s.PetCastable("Defensive") and s.PetCastable("Passive") then
						s.FlashPet("Defensive", "Pink")
					end
				end
				if x.ActiveEnemy and not x.PetActiveEnemy then
					s.FlashPet("Attack", "Pink")
				elseif x.PetActiveEnemy and not UnitPlayerControlled("pettarget") and not UnitExists("pettargettarget") and s.HealthPercent("pettarget") <= 25 then
					s.FlashPet("Follow")
				elseif not x.PetNoCC then
					s.FlashPet("Stay")
				end
				if x.PetActiveEnemy and s.HasTalent(49542--[[Dark Transformation]]) and s.Flashable(49542--[[Dark Transformation]]) and Castable("Dark Transformation") then
					s.Flash(49542--[[Dark Transformation]], SetColor(s.GetCastingOrChanneling(nil, "pettarget", 1) > (s.SpellCooldown(49542--[[Dark Transformation]]) + x.DoubleLag), "Aqua"))
				end
			end
	
			if s.Flashable(48707--[[Anti-Magic Shell]]) and x.NoCC and s.HealthPercent("player") <= 75 and Castable("Anti-Magic Shell") then
				s.Flash(48707--[[Anti-Magic Shell]], SetColor(x.ActiveEnemy, "Red"))
			elseif s.Flashable(49998--[[Death Strike]]) and x.NoCC and s.HealthPercent("player") < 50 and Castable("Death Strike") then
				s.Flash(49998--[[Death Strike]], SetColor(x.ActiveEnemy, "red"))
			elseif s.Flashable(48792--[[Icebound Fortitude]]) and x.NoCC and s.HealthPercent("player") < 35 and Castable("Icebound Fortitude") then
				s.Flash(48792--[[Icebound Fortitude]], SetColor(x.ActiveEnemy, "Red"))
			end
			
			if s.Flashable(47528--[[Mind Freeze]]) and x.NoCC and Castable("Mind Freeze") then
				s.Flash(47528--[[Mind Freeze]], SetColor(x.ActiveEnemy, "Aqua"))
			elseif s.Flashable(47476--[[Strangulate]]) and x.NoCC and Castable("Strangulate") then
				s.Flash(47476--[[Strangulate]], SetColor(x.ActiveEnemy, "Aqua"))
			end
			
			if x.NoCC and s.Flashable(77575--[[Outbreak]]) and Castable("Outbreak") then
				s.Flash(77575--[[Outbreak]], SetColor(x.ActiveEnemy))
			elseif x.NoCC and s.Flashable(45477--[[Icy Touch]]) and s.DebuffDuration(59921--[[Frost Fever]]) < 2 and Castable("Icy Touch") then
				s.Flash(45477--[[Icy Touch]], SetColor(x.ActiveEnemy))
			elseif x.NoCC and s.Flashable(45462--[[Plague Strike]]) and s.DebuffDuration(59879--[[Blood Plague]]) < 2 and Castable("Plague Strike") then
				s.Flash(45462--[[Plague Strike]], SetColor(x.ActiveEnemy))
			elseif x.NoCC and s.Flashable(49206--[[Summon Gargoyle]]) and s.Power("player") > 60 and Castable("Summon Gargoyle") then 
				s.Flash(49206--[[Summon Gargoyle]], SetColor(x.ActiveEnemy, "Green"))
			elseif x.NoCC and s.Diseased("target") ==1 and s.Flashable(43265--[[Death and Decay]]) and Castable("Death and Decay") then
				s.Flash(43265--[[Death and Decay]], SetColor(x.ActiveEnemy))
			elseif x.NoCC and s.Flashable(55090--[[Scourge Strike]]) and s.Diseased("target") and Castable("Scourge Strike") then
				s.Flash(55090--[[Scourge Strike]], SetColor(x.ActiveEnemy))
			elseif x.NoCC and s.Diseased("target") ==1 and s.Flashable(85948--[[Festering Strike]]) and Castable("Festering Strike") then
				s.Flash(85948--[[Festering Strike]], SetColor(x.ActiveEnemy))
			elseif x.NoCC and s.Flashable(49016--[[Unholy Frenzy]]) and Castable("Obliterate") then
				s.Flash(49016--[[Unholy Frenzy]], SetColor(x.ActiveEnemy))
			elseif x.NoCC and s.Flashable(47541--[[Death Coil]]) and s.Power("player") > 35 and Castable("Death Coil") then
				s.Flash(47541--[[Death Coil]], SetColor(x.ActiveEnemy))
			elseif x.NoCC and x.ActiveEnemy and s.Flashable(57330--[[Horn of Winter]]) and s.PowerPercent("player") < 10 and Castable("Horn of Winter") then
				s.Flash(57330--[[Horn of Winter]], SetColor(x.ActiveEnemy))
			end
			
		end
	end
end