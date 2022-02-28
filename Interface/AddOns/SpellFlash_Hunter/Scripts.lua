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


local LASTASPECTFROMVIPER = nil

local function FlashSting(ActiveEnemy)
	if Flashable(SpellName(3034--[[Viper Sting]])) and ( (UnitIsPlayer("target") and HealthPercent() > 35) or string.find(string.lower(UnitClassification("target") or ""), "boss") or ( UnitLevel("target") == -1 and not UnitPlayerControlled("target") ) ) and Castable("Viper Sting") then
		Flash(SpellName(3034--[[Viper Sting]]), SetColor(ActiveEnemy))
		return true
	elseif Flashable(SpellName(1978--[[Serpent Sting]])) and ( HealthPercent() >= 35 or UnitIsPlayer("target") or string.find(string.lower(UnitClassification("target") or ""), "boss") or string.find(string.lower(UnitClassification("target") or ""), "elite") or UnitLevel("target") == -1 ) and Castable("Serpent Sting") then
		Flash(SpellName(1978--[[Serpent Sting]]), SetColor(ActiveEnemy))
		return true
	end
	return false
end

SpellFlashAddon.Spam[AddonName] = function(NoCC, ActiveEnemy, PetAlive, PetActiveEnemy, instanceType)
	
	if PetAlive then
		
		if instanceType == "party" or instanceType == "raid" then
			if PetCastable("Passive") then
				FlashPet("Passive")
				
			end
			
			if IsAutocastOn(SpellName(2649--[[Growl]])) then
				FlashPet(SpellName(2649--[[Growl]]), "Red")
				
			end
			
		elseif instanceType == "pvp" or instanceType == "arena" then
			if PetCastable("Aggressive") then
				FlashPet("Aggressive", "Pink")
				
			end
			
		else
			if PetCastable("Defensive") and PetCastable("Passive") then
				FlashPet("Defensive", "Pink")
				
			end
			
		end
		
		if ActiveEnemy and not PetActiveEnemy then
			FlashPet("Attack", "Pink")
			
		elseif PetActiveEnemy and not UnitPlayerControlled("pettarget") and not UnitExists("pettargettarget") and HealthPercent("pettarget") <= 35 then
			FlashPet("Follow")
			
		elseif UnitExists("pettarget") and SpellFlashAddon.IsBreakOnDamageCC("pettarget") then
			FlashPet("Stay")
			
		end
		
		if InCombat() then
			
			if HealthPercent("pet") <= 50 and SpellKnown(SpellName(1742--[[Cower]])) and not IsAutocastOn(SpellName(1742--[[Cower]])) and PetCastable(SpellName(1742--[[Cower]])) then
				FlashPet(SpellName(1742--[[Cower]]), "Yellow")
				
			end
			
			if PowerPercent("player") <= 30 and SpellKnown(SpellName(53517--[[Roar of Recovery]])) and not IsAutocastOn(SpellName(53517--[[Roar of Recovery]])) and PetCastable(SpellName(53517--[[Roar of Recovery]])) then
				FlashPet(SpellName(53517--[[Roar of Recovery]]))
				
			end
			
		end
		
		if HealthPercent("pet") <= 30 and SpellKnown(SpellName(53426--[[Lick Your Wounds]])) and not IsAutocastOn(SpellName(53426--[[Lick Your Wounds]])) and PetCastable(SpellName(53426--[[Lick Your Wounds]])) then
			FlashPet(SpellName(53426--[[Lick Your Wounds]]), "Yellow")
			
		elseif HealthPercent("pet") <= 30 and SpellKnown(SpellName(53478--[[Last Stand]])) and not IsAutocastOn(SpellName(53478--[[Last Stand]])) and PetCastable(SpellName(53478--[[Last Stand]])) then
			FlashPet(SpellName(53478--[[Last Stand]]), "Yellow")
			
		end
		
	elseif UnitIsDead("pet") then
		
		if SpellKnown(SpellName(55709--[[Heart of the Phoenix]])) and PetCastable(SpellName(55709--[[Heart of the Phoenix]]),nil,1) then
			FlashPet(SpellName(55709--[[Heart of the Phoenix]]), "Yellow")
			
		end
		
	end
	
	if Flashable(SpellName(136--[[Mend Pet]])) and PetAlive and ( HealthPercent("pet") <= 70  or ( HasTalent(SpellName(19572--[[Improved Mend Pet]])) and Debuff(nil,"pet",nil,nil,nil,nil,nil,nil,1) ) ) and Castable("Mend Pet") then
		Flash(SpellName(136--[[Mend Pet]]))
		
	end
	
	if Flashable(SpellName(19506--[[Trueshot Aura]])) and ( not IsResting() or InCombat() or SpellFlashAddon.IsEnemy() ) and not IsMounted() and Castable("Trueshot Aura") then
		Flash(SpellName(19506--[[Trueshot Aura]]), "Green")
		
	end
	
	if Flashable(SpellName(34490--[[Silencing Shot]])) and Casting(nil,"target",1) and Castable("Silencing Shot") then
		Flash(SpellName(34490--[[Silencing Shot]]), "Aqua")
		
	end
	
	if Flashable(SpellName(19306--[[Counterattack]])) and NoCC and Castable("Counterattack") then
		Flash(SpellName(19306--[[Counterattack]]), SetColor(ActiveEnemy))
		
	elseif Flashable(SpellName(2974--[[Wing Clip]])) and NoCC and Castable("Wing Clip") then
		Flash(SpellName(2974--[[Wing Clip]]), SetColor(ActiveEnemy))
		
	elseif Flashable(SpellName(1495--[[Mongoose Bite]])) and NoCC and Castable("Mongoose Bite") then
		Flash(SpellName(1495--[[Mongoose Bite]]), SetColor(ActiveEnemy))
		
	else
		
		if Flashable(SpellName(2973--[[Raptor Strike]])) and NoCC and UnitPower("player") >= ( SpellCost(SpellName(2973--[[Raptor Strike]])) + SpellCost(SpellName(2974--[[Wing Clip]])) ) and Castable("Raptor Strike") then
			Flash(SpellName(2973--[[Raptor Strike]]), SetColor(ActiveEnemy, "Yellow"))
		end
		
		if Flashable(SpellName(53209--[[Chimera Shot]])) and NoCC and Debuff({SpellName(1978--[[Serpent Sting]]),SpellName(3034--[[Viper Sting]])},nil,1,nil,nil,nil,4.5) and Castable("Chimera Shot") then
			Flash(SpellName(53209--[[Chimera Shot]]), "Yellow")
			
		elseif Flashable(SpellName(53351--[[Kill Shot]])) and NoCC and Castable("Kill Shot") then
			Flash(SpellName(53351--[[Kill Shot]]), SetColor(ActiveEnemy))
			
		elseif Flashable(SpellName(5116--[[Concussive Shot]])) and NoCC and not Casting(nil,"target") and SpellFlashAddon.IsEnemyTargetingYou() and Castable("Concussive Shot") then
			Flash(SpellName(5116--[[Concussive Shot]]))
			
		elseif Flashable(SpellName(1130--[[Hunter's Mark]])) and ( not ActiveEnemy or ( UnitIsPlayer("target") and UnitIsUnit("targettarget", "player") ) ) and Castable("Hunter's Mark") then
			Flash(SpellName(1130--[[Hunter's Mark]]), SetColor(ActiveEnemy))
			
			if ActiveEnemy and not IsCurrentSpell(SpellName(6603--[[Auto Attack]])) and not SpellFlashAddon.AutoShoot then
				if SpellFlashAddon.MeleeDistance() then
					if Castable("Attack") then
						Flash(SpellName(6603--[[Auto Attack]]))
					end
				elseif Castable("Auto Shot") then
					Flash(SpellName(75--[[Auto Shot]]))
				end
				
			end
			
		else
			
			if Flashable(SpellName(3674--[[Black Arrow]])) and NoCC and Castable("Black Arrow") then
				Flash(SpellName(3674--[[Black Arrow]]), "Pink")
				
			end
				
			if Flashable(SpellName(53301--[[Explosive Shot]])) and NoCC and Castable("Explosive Shot") then
				Flash(SpellName(53301--[[Explosive Shot]]), SetColor(ActiveEnemy))
				
			elseif Flashable(SpellName(3044--[[Arcane Shot]])) and NoCC and Castable("Arcane Shot") then
				Flash(SpellName(3044--[[Arcane Shot]]), SetColor(ActiveEnemy))
			
			elseif ( Flashable(SpellName(1978--[[Serpent Sting]])) or Flashable(SpellName(3034--[[Viper Sting]])) ) and NoCC and not Table.IsStingPushed() and not Table.IsStung() and FlashSting(ActiveEnemy) then
				-- Sting Flashed
			
			elseif Flashable(SpellName(1130--[[Hunter's Mark]])) and Castable("Hunter's Mark") then
				Flash(SpellName(1130--[[Hunter's Mark]]), SetColor(ActiveEnemy))
				
			else
				
				if Flashable(SpellName(2643--[[Multi-Shot]])) and NoCC and Castable("Multi-Shot") then
					Flash(SpellName(2643--[[Multi-Shot]]), "Purple")
					
				end
				
				if Flashable(SpellName(19434--[[Aimed Shot]])) and NoCC and Castable("Aimed Shot") then
					Flash(SpellName(19434--[[Aimed Shot]]), SetColor(ActiveEnemy))
					
				elseif Flashable(SpellName(56641--[[Steady Shot]])) and NoCC and Castable("Steady Shot") then
					Flash(SpellName(56641--[[Steady Shot]]), SetColor(ActiveEnemy))
					
				else
					
					if ActiveEnemy and not IsCurrentSpell(SpellName(6603--[[Auto Attack]])) and not SpellFlashAddon.AutoShoot then
						if SpellFlashAddon.MeleeDistance() then
							if Castable("Attack") then
								Flash(SpellName(6603--[[Auto Attack]]))
							end
						elseif Castable("Auto Shot") then
							Flash(SpellName(75--[[Auto Shot]]))
						end
						
					end
					
				end
				
			end
			
		end
		
	end
	
	if not IsMounted() then
		if ( Flashable(SpellName(61846--[[Aspect of the Dragonhawk]])) or ( Flashable(SpellName(13165--[[Aspect of the Hawk]])) and ( not ActiveEnemy or not SpellFlashAddon.MeleeDistance() ) ) ) and PowerPercent("player") > 10 and ( not Table.IsAspectActive() or ( not LASTASPECTFROMVIPER and Table.IsViperActive() ) ) then
			if Flashable(SpellName(61846--[[Aspect of the Dragonhawk]])) then
				if Castable("Aspect of the Dragonhawk") then
					Flash(SpellName(61846--[[Aspect of the Dragonhawk]]), "Green")
				end
			elseif Castable("Aspect of the Hawk") then
				Flash(SpellName(13165--[[Aspect of the Hawk]]), "Green")
			end
			
		elseif Flashable(SpellName(34074--[[Aspect of the Viper]])) and ( PowerPercent("player") <= 10 or ( not ActiveEnemy and PowerPercent("player") <= 70 ) ) and Castable("Aspect of the Viper") then
			Flash(SpellName(34074--[[Aspect of the Viper]]), "Green")
			LASTASPECTFROMVIPER = Table.GiveAspect()
			
		elseif LASTASPECTFROMVIPER and PowerPercent("player") >= 95 and Table.IsViperActive() and ( not ActiveEnemy or LASTASPECTFROMVIPER ~= SpellName(13165--[[Aspect of the Hawk]]) or not SpellFlashAddon.MeleeDistance() ) then
			local z = {}
			z.SpellName = LASTASPECTFROMVIPER
			z.BuffName = z.SpellName
			if SpellFlashAddon.CheckIfSpellCastable(z) then
				if Casting() or select(2,GetSpellCooldown(LASTASPECTFROMVIPER)) ~= 0 then
					Flash(LASTASPECTFROMVIPER, "Red")
				else
					Flash(LASTASPECTFROMVIPER, "Green")
				end
			end
			
		end
	end
	
end

