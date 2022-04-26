SLICECMDR = { };
SLICECMDR.AlertPending = 0;
SLICECMDR.curCombo = 0;
SLICECMDR.LastTime = 0;
SLICECMDR.BarFont = 0;
SLICECMDR.LastEnergy = 0;
SLICECMDR.RupExpires = 0;
SLICECMDR.DPExpires = 0;
SLICECMDR.SliceExpires = 0;
SLICECMDR.ToTExpires = 0;
SLICECMDR.EAExpires = 0;
SLICECMDR.HungerExpires = 0;
SLICECMDR.LastSliceExpire = 0;
SLICECMDR.tNow = 0;
SLICECMDR.currnetBloodSpell = ' ';
SLICECMDR.currnetBloodCaster = '';

-- fade
local fadein = 0.5       -- fade delay for each combo point frame
local fadeout = 0.5      -- fade delay for each combo point frame
local framefadein = 0.2  -- fade delay for entering combat
local framefadeout = 0.2 -- fade delay for leaving combat
local scaleUI = 0
local widthUI = 0

SLICECMDR.BARS = { 
	['CP'] = {
		['obj'] = 0
	},
	['HfB'] = {
		['obj'] = 0,
		['AlertPending'] = 0
	},
	['ToT'] = {
		['obj'] = 0
	},
	['EA'] = {
		['obj'] = 0
	},
	['SnD'] = {
		['obj'] = 0
	},
	['DP'] = {
		['obj'] = 0
	},
	['Rup'] = {
		['obj'] = 0
	},
};

function SliceCmdr_MoveStart()
	if (SliceCmdr_Save.IsLocked == false) then
		SliceCmdr:StartMoving();
	 end
end

function SliceCmdr_MoveStop()
	if (SliceCmdr_Save.IsLocked == false) then
		SliceCmdr:StopMovingOrSizing();
	end		
end

function SliceCmdr_BarTexture() 
	if (SliceCmdr_Save.BarTexture) then
		return SliceCmdr_BarTextures[ SliceCmdr_Save.BarTexture ];
	else
		return "Interface\\AddOns\\SliceCommander\\Images\\Smooth.tga";
	end
	
end

function SliceCmdr_SoundTest(name) 
	if (SliceCmdr_Sounds[name]) then
		PlaySoundFile( SliceCmdr_Sounds[name] );
	end
end

function SliceCmdr_Sound(saved) 
	if isCombat()==1 then
		if (SliceCmdr_Save[saved]) then
			PlaySoundFile( SliceCmdr_Sounds[ SliceCmdr_Save[saved] ] );
		end
	end
end

function SliceCmdr_ChangeAnchor()
	local LastAnchor = VTimerEnergy;
	local offSetSize = SliceCmdr_Save.BarMargin; -- other good values, -1, -2
	
	-- CP Bar --
	SLICECMDR.BARS['CP']['obj']:SetPoint("BOTTOMLEFT", LastAnchor, "TOPLEFT", 0, offSetSize);
	
	-- Slice and dice --
	if (SLICECMDR.SliceExpires ~= 0) then
		SLICECMDR.BARS['SnD']['obj']:SetPoint("TOPLEFT", LastAnchor, "BOTTOMLEFT", 0, -1 * offSetSize);
		LastAnchor = SLICECMDR.BARS['SnD']['obj'];
	end
	
	-- rupture --
	if (SLICECMDR.RupExpires ~= 0) then
		SLICECMDR.BARS['Rup']['obj']:SetPoint("TOPLEFT", LastAnchor, "BOTTOMLEFT", 0, -1 * offSetSize);
		LastAnchor = SLICECMDR.BARS['Rup']['obj'];
	end
	
	-- tricks of trade--
	if (SLICECMDR.ToTExpires ~= 0) then
		SLICECMDR.BARS['ToT']['obj']:SetPoint("TOPLEFT", LastAnchor, "BOTTOMLEFT", 0, -1 * offSetSize);
		LastAnchor = SLICECMDR.BARS['ToT']['obj'];
	end
	
	-- hunger for blood --
	if (SLICECMDR.HungerExpires ~= 0) then
		SLICECMDR.BARS['HfB']['obj']:SetPoint("TOPLEFT", LastAnchor, "BOTTOMLEFT", 0, -1 * offSetSize);
		LastAnchor = SLICECMDR.BARS['HfB']['obj'];
	end
	
	-- deadly poison --
	if (SLICECMDR.DPExpires ~= 0) then
		SLICECMDR.BARS['DP']['obj']:SetPoint("TOPLEFT", LastAnchor, "BOTTOMLEFT", 0, -1 * offSetSize);
		LastAnchor = SLICECMDR.BARS['DP']['obj'];
	end
	
	-- expose armor --
	if (SLICECMDR.EAExpires ~= 0) then
		SLICECMDR.BARS['EA']['obj']:SetPoint("TOPLEFT", LastAnchor, "BOTTOMLEFT", 0, -1 * offSetSize);
		LastAnchor = SLICECMDR.BARS['EA']['obj'];
	end
	
end

function isCombat()
	if SliceCmdr_Save.SoundCombat==true then
		if UnitAffectingCombat("player")==1 then
			return 1;
		else
			return 0;
		end
	else
		return 1;
	end
end

function SliceCmdr_OnEvent(self, event, ...)
	if (event == "COMBAT_LOG_EVENT_UNFILTERED") then
		local timestamp, type, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags = select(1, ...);
		if (type == "SPELL_AURA_REFRESH" or type == "SPELL_AURA_APPLIED" or type == "SPELL_AURA_REMOVED" or type == "SPELL_AURA_APPLIED_DOSE" or type == "SPELL_PERIODIC_AURA_REMOVED" or type == "SPELL_PERIODIC_AURA_APPLIED" or type == "SPELL_PERIODIC_AURA_APPLIED_DOSE" or type == "SPELL_PERIODIC_AURA_REFRESH") then
			local spellId, spellName, spellSchool = select(9, ...);
			
			if (destName == UnitName("player")) then
				-- SLICE AND DICE EVENT --
				if (spellName == SC_SPELL_SND) then
					if (type == "SPELL_AURA_REMOVED") then
						if (UnitAffectingCombat("player")) then
							SliceCmdr_Sound("Fail");
						else
							SliceCmdr_Sound("Expire");
						end					
						SLICECMDR.SliceExpires = 0;
						SliceCmdr_ChangeAnchor();
						SLICECMDR.BARS['SnD']['obj']:Hide();
					else
						local name, rank, icon, count, debuffType, duration, expirationTime, isMine, isStealable = UnitAura("player", SC_SPELL_SND);
						local timeLeftOnLast = SLICECMDR.SliceExpires - GetTime();
						SLICECMDR.BARS['SnD']['obj']:Show();
						if SliceCmdr_Save.SpellText == true then
							SLICECMDR.BARS['SnD']['obj'].text2:SetText(string.format("%s", name));
						else
							SLICECMDR.BARS['SnD']['obj'].text2:SetText("");
						end
						SLICECMDR.SliceExpires = expirationTime;
						SliceCmdr_ChangeAnchor();--change les ancres des bares
						if (type == "SPELL_AURA_APPLIED") then
							SliceCmdr_Sound("Applied");
						else
							if (timeLeftOnLast <= 1) then
								SliceCmdr_Sound("Apply1");
							else
								if (timeLeftOnLast <= 2) then
									SliceCmdr_Sound("Apply2");
								else
									SliceCmdr_Sound("Apply3");
								end
							end
						end
					end
				end		
				-- HUNGER FOR BLOOD EVENT --
				if (spellName == SC_SPELL_HFB) then
					if (type == "SPELL_AURA_REMOVED") then
						SLICECMDR.HungerExpires = 0;
						SliceCmdr_ChangeAnchor();--change les ancres des bares
						SLICECMDR.BARS['HfB']['obj']:Hide();
						if (UnitAffectingCombat("player")) then
							SliceCmdr_Sound("HfB.Fail");
						else
							SliceCmdr_Sound("HfB.Expire");
						end
					else
						local name, rank, icon, count, debuffType, duration, expirationTime, isMine, isStealable = UnitAura("player", SC_SPELL_HFB);
						local timeLeftOnLast = SLICECMDR.HungerExpires - GetTime();
						SLICECMDR.HungerExpires = expirationTime;
						if (type == "SPELL_AURA_APPLIED") then
							SliceCmdr_Sound('HfB.Applied');
						else
							if (timeLeftOnLast <= 1) then
								SliceCmdr_Sound('HfB.Refresh1');
							else
								if (timeLeftOnLast <= 2) then
									SliceCmdr_Sound('HfB.Refresh2');
								else
									SliceCmdr_Sound('HfB.Refresh3');
								end
							end							
						end
						
						SLICECMDR.BARS['HfB']['obj']:Show();
						if SliceCmdr_Save.SpellText == true then
							SLICECMDR.BARS['HfB']['obj'].text2:SetText(string.format("%s", name));
						else
							SLICECMDR.BARS['HfB']['obj'].text2:SetText("");
						end
						SliceCmdr_ChangeAnchor();--change les ancres
					end
				end
			else
				if (destName == UnitName("target")) then
					-- DEADLY POISON --
					if (spellName == SC_SPELL_DP and SliceCmdr_Save.DPBarShow == true) then
						local name1, rank1, icon1, count1, debuffType1, duration1, expirationTime1, isMine1, isStealable1 = UnitDebuff("target", SC_SPELL_DP);
						if (not(type == "SPELL_AURA_REMOVED")) then
							if (isMine1 == "player") then
								SLICECMDR.BARS['CP']['obj'].combos[count1].bg:SetVertexColor(27/255, 139/255, 27/255);
								SLICECMDR.DPExpires = expirationTime1;
								SLICECMDR.BARS['DP']['obj'].text2:SetText("x" .. string.format("%i", count1));
								SLICECMDR.BARS['DP']['obj']:Show();
								if SliceCmdr_Save.SpellText == true then
									SLICECMDR.BARS['DP']['obj'].text2:SetText( string.format("%s", name1) .. "x" .. string.format("%i", count1) );
								else
									SLICECMDR.BARS['DP']['obj'].text2:SetText("x" .. string.format("%i", count1));
								end
								SliceCmdr_ChangeAnchor();--change les ancres
							end
						end
					end
					-- EXPOSE ARMOR --
					if ( (spellId == 8647 or spellName == SC_SPELL_SA) and SliceCmdr_Save.EABarShow == true) then
						local name1, rank1, icon1, count1, debuffType1, duration1, expirationTime1, isMine1, isStealable1 = UnitDebuff("target", spellName);
						if ( not(type == "SPELL_AURA_REMOVED") ) then
							if ( spellName == SC_SPELL_SA ) then
								SLICECMDR.BARS['EA']['obj'].icon:SetTexture("Interface\\AddOns\\SliceCommander\\Icons\\Ability_Warrior_Sunder");
								if count1 ~= nil then
									if SliceCmdr_Save.SpellText == true then
										SLICECMDR.BARS['EA']['obj'].text2:SetText(string.format("%s", name1) .. " x" .. string.format("%i", count1));
									else
										SLICECMDR.BARS['EA']['obj'].text2:SetText("x" .. string.format("%i", count1));
									end
								else
									if SliceCmdr_Save.SpellText == true then
										SLICECMDR.BARS['EA']['obj'].text2:SetText(string.format("%s",  name1) .. " x1");
									else
										SLICECMDR.BARS['EA']['obj'].text2:SetText("x1");
									end
								end
							else
								SLICECMDR.BARS['EA']['obj'].text2:SetText("");
								SLICECMDR.BARS['EA']['obj'].icon:SetTexture("Interface\\AddOns\\SliceCommander\\Icons\\ability_warrior_riposte");
								if SliceCmdr_Save.SpellText == true then
									SLICECMDR.BARS['EA']['obj'].text2:SetText(string.format("%s",  name1));
								else
									SLICECMDR.BARS['EA']['obj'].text2:SetText("");
								end
							end
							SLICECMDR.EAExpires = expirationTime1;
							SLICECMDR.BARS['EA']['obj']:Show();
							SliceCmdr_ChangeAnchor();--change les ancres
						end
					end
					-- Bleed Effect --
					-- My rupture only --
					if ( SliceCmdr_Save.RupBarMine == true and SliceCmdr_Save.RupBarShow == true and (type == "SPELL_AURA_APPLIED" or type == "SPELL_AURA_REFRESH") and spellName == SC_SPELL_RUP) then
						local name2, rank2, icon2, count2, debuffType2, duration2, expirationTime2, isMine2, isStealable2 = UnitDebuff("target", SC_SPELL_RUP);
						if (isMine2 == "player") then
							SLICECMDR.RupExpires = expirationTime2;
							SLICECMDR.BARS['Rup']['Expires'] = expirationTime2;
							SLICECMDR.BARS['Rup']['obj']:Show();
							if SliceCmdr_Save.SpellText == true then
								SLICECMDR.BARS['Rup']['obj'].text2:SetText(string.format("%s", name2));
							else
								SLICECMDR.BARS['Rup']['obj'].text2:SetText("");
							end
							SliceCmdr_ChangeAnchor();
						end
					end
					-- All bleed effect --
					if (  SliceCmdr_Save.RupBarMine == false and SliceCmdr_Save.RupBarShow == true and (type == "SPELL_AURA_APPLIED" or type == "SPELL_AURA_REFRESH") ) then
						if ( spellName == SC_SPELL_RUP or spellName == SC_SPELL_GAR  or spellName == SC_SPELL_DRUIDE_LAC  or spellName == SC_SPELL_DRUIDE_POU  or spellName == SC_SPELL_DRUIDE_RIP  or spellName == SC_SPELL_DRUIDE_RAK or spellName == SC_SPELL_HUNTER_CAT or spellName == SC_SPELL_HUNTER_RAP or spellName == SC_SPELL_WARRIOR_DWO or spellName == SC_SPELL_WARRIOR_REN or spellName == SC_SPELL_HUNTER_PSH ) then
							local name2, rank2, icon2, count2, debuffType2, duration2, expirationTime2, isMine2, isStealable2 = UnitDebuff("target", spellName);
							if expirationTime2 ~= nil then
								if ( expirationTime2 > SLICECMDR.RupExpires )then
									SLICECMDR.currnetBloodCaster = isMine2;
									SLICECMDR.currnetBloodSpell = name2;
									SLICECMDR.BARS['Rup']['obj'].icon:SetTexture(SliceCmdr_BleedIcon(name2));
									SLICECMDR.RupExpires = expirationTime2;
									SLICECMDR.BARS['Rup']['obj']:Show();
									if SliceCmdr_Save.SpellText == true then
										SLICECMDR.BARS['Rup']['obj'].text2:SetText(string.format("%s", name2));
									else
										SLICECMDR.BARS['Rup']['obj'].text2:SetText("");
									end
									SliceCmdr_ChangeAnchor();
								end
							end
						end
					end
				end
			end	
		end
	end
	
	if (event == "UNIT_COMBO_POINTS") then
		local unit = select(1, ...);
		if (unit and unit == "player") then
			local name1, rank1, icon1, count1, debuffType1, duration1, expirationTime1, isMine1, isStealable1 = UnitDebuff("target", SC_SPELL_DP);
			if not name1 then
				SLICECMDR.DPExpires = 0;
				SLICECMDR.BARS['DP']['obj']:Hide();
			end
			SliceCmdr_SetComboPts();
		end
	end
	if (event == "PLAYER_TARGET_CHANGED") then
		SliceCmdr_SetComboPts();
		SliceCmdr_TestTarget();
	end
end

function SliceCmdr_TestTargetBleed(name, name2, expirationTime, expirationTime2)
	if name then
		if name2 then
			if expirationTime2 > expirationTime then
				expirationTime = expirationTime2;
				name = name2;
			end
		end
	else
		if name2 then
			expirationTime = expirationTime2;
			name = name2;
		end
	end
	
	return name, expirationTime
end

function SliceCmdr_BleedIcon(name)
	if name == SC_SPELL_RUP then
		return "Interface\\AddOns\\SliceCommander\\Icons\\Ability_Rogue_Rupture";
	end
	if name == SC_SPELL_GAR then
		return "Interface\\AddOns\\SliceCommander\\Icons\\Ability_Rogue_Garrote";
	end
	if name == SC_SPELL_DRUIDE_LAC then
		return "Interface\\AddOns\\SliceCommander\\Icons\\Ability_Druid_Lacerate";
	end
	if name == SC_SPELL_DRUIDE_POU then
		return "Interface\\AddOns\\SliceCommander\\Icons\\Spell_Shadow_VampiricAura";
	end
	if name == SC_SPELL_DRUIDE_RIP then
		return "Interface\\AddOns\\SliceCommander\\Icons\\Ability_GhoulFrenzy";
	end
	if name == SC_SPELL_DRUIDE_RAK then
		return "Interface\\AddOns\\SliceCommander\\Icons\\Ability_Druid_Disembowel";
	end
	if name == SC_SPELL_HUNTER_RAP then
		return "Interface\\AddOns\\SliceCommander\\Icons\\Ability_Gouge";
	end
	if name == SC_SPELL_WARRIOR_DWO then
		return "Interface\\AddOns\\SliceCommander\\Icons\\Ability_BackStab";
	end
	if name == SC_SPELL_WARRIOR_REN then
		return "Interface\\AddOns\\SliceCommander\\Icons\\Ability_Gouge";
	end
	if name == SC_SPELL_HUNTER_PSH then
		return "Interface\\AddOns\\SliceCommander\\Icons\\Ability_hunter_piercingshots";
	end
	
end

function SliceCmdr_TestTarget()
	local name, rank, icon, count, debuffType, duration, expirationTime, isMine, isStealable = UnitDebuff("target", SC_SPELL_DP);
	if (SliceCmdr_Save.DPBarShow == true) then
		if not name then
			SLICECMDR.DPExpires = 0;
			SLICECMDR.BARS['DP']['obj']:Hide();
		else
			if (isMine == "player") then
				SLICECMDR.DPExpires = expirationTime;
 				SLICECMDR.BARS['DP']['obj'].text:SetText(expirationTime);
				if SliceCmdr_Save.SpellText == true then
					SLICECMDR.BARS['DP']['obj'].text2:SetText( string.format("%s", name) .. "x" .. string.format("%i", count) );
				else
					SLICECMDR.BARS['DP']['obj'].text2:SetText("x" .. string.format("%i", count));
				end
				SLICECMDR.BARS['DP']['obj']:Show();
			else
				SLICECMDR.DPExpires = 0;
				SLICECMDR.BARS['DP']['obj']:Hide();
			end
		end
	end
	
	if ( SliceCmdr_Save.RupBarShow == true and SliceCmdr_Save.RupBarMine == false ) then
		
		name, _, _, _, _, _, expirationTime = UnitDebuff("target", SC_SPELL_RUP);
		name2, _, _, _, _, _, expirationTime2 = UnitDebuff("target", SC_SPELL_GAR);
		name, expirationTime = SliceCmdr_TestTargetBleed(name, name2, expirationTime, expirationTime2);
		name2, _, _, _, _, _, expirationTime2 = UnitDebuff("target", SC_SPELL_GAR);
		name, expirationTime = SliceCmdr_TestTargetBleed(name, name2, expirationTime, expirationTime2);
		name2, _, _, _, _, _, expirationTime2 = UnitDebuff("target", SC_SPELL_DRUIDE_LAC);
		name, expirationTime = SliceCmdr_TestTargetBleed(name, name2, expirationTime, expirationTime2);
		name2, _, _, _, _, _, expirationTime2 = UnitDebuff("target", SC_SPELL_DRUIDE_POU);
		name, expirationTime = SliceCmdr_TestTargetBleed(name, name2, expirationTime, expirationTime2);
		name2, _, _, _, _, _, expirationTime2 = UnitDebuff("target", SC_SPELL_DRUIDE_RIP);
		name, expirationTime = SliceCmdr_TestTargetBleed(name, name2, expirationTime, expirationTime2);
		name2, _, _, _, _, _, expirationTime2 = UnitDebuff("target", SC_SPELL_DRUIDE_RAK);
		name, expirationTime = SliceCmdr_TestTargetBleed(name, name2, expirationTime, expirationTime2);
		name2, _, _, _, _, _, expirationTime2 = UnitDebuff("target", SC_SPELL_HUNTER_RAP);
		name, expirationTime = SliceCmdr_TestTargetBleed(name, name2, expirationTime, expirationTime2);
		name2, _, _, _, _, _, expirationTime2 = UnitDebuff("target", SC_SPELL_WARRIOR_DWO);
		name, expirationTime = SliceCmdr_TestTargetBleed(name, name2, expirationTime, expirationTime2);
		name2, _, _, _, _, _, expirationTime2 = UnitDebuff("target", SC_SPELL_WARRIOR_REN);
		name, expirationTime = SliceCmdr_TestTargetBleed(name, name2, expirationTime, expirationTime2);
		name2, _, _, _, _, _, expirationTime2 = UnitDebuff("target", SC_SPELL_HUNTER_PSH);
		name, expirationTime = SliceCmdr_TestTargetBleed(name, name2, expirationTime, expirationTime2);
		
		if not name then
			SLICECMDR.RupExpires = 0;
			SLICECMDR.BARS['Rup']['obj']:Hide();
			SliceCmdr_ChangeAnchor();--change les ancres
		else
			SLICECMDR.BARS['Rup']['obj'].icon:SetTexture(SliceCmdr_BleedIcon(name));
			SLICECMDR.RupExpires = expirationTime;
			SLICECMDR.BARS['Rup']['obj']:Show();
			SliceCmdr_ChangeAnchor();
		end
	end
	
	if ( SliceCmdr_Save.RupBarShow == true and SliceCmdr_Save.RupBarMine == true ) then
		name, rank, icon, count, debuffType, duration, expirationTime, isMine, isStealable = UnitDebuff("target", SC_SPELL_RUP);
		if not name then
			SLICECMDR.RupExpires = 0;
			SLICECMDR.BARS['Rup']['Expires'] = 0;
			SLICECMDR.BARS['Rup']['obj']:Hide();
			SliceCmdr_ChangeAnchor();--change les ancres
		else
			if (isMine == "player") then
				SLICECMDR.RupExpires = expirationTime;
				SLICECMDR.BARS['Rup']['Expires'] = expirationTime;
				SLICECMDR.BARS['Rup']['obj']:Show();
				SliceCmdr_ChangeAnchor();--change les ancres
			else
				SLICECMDR.RupExpires = 0;
				SLICECMDR.BARS['Rup']['Expires'] = 0;
				SLICECMDR.BARS['Rup']['obj']:Hide();
				SliceCmdr_ChangeAnchor();--change les ancres
			end
		end
	end
	
	if (SliceCmdr_Save.EABarShow == true) then
		name, _, icon, _, _, _, expirationTime = UnitDebuff("target", SC_SPELL_EA);
		if not name then
			name, _, icon, count, _, _, expirationTime = UnitDebuff("target", SC_SPELL_SA);
			if not name then
				SLICECMDR.EAExpires = 0;
				SLICECMDR.BARS['EA']['obj']:Hide();
				SliceCmdr_ChangeAnchor();--change les ancres
			else
				SLICECMDR.BARS['EA']['obj'].icon:SetTexture("Interface\\AddOns\\SliceCommander\\Icons\\Ability_Warrior_Sunder");
				if count1 ~= nil then
					if SliceCmdr_Save.SpellText == true then
						SLICECMDR.BARS['EA']['obj'].text2:SetText(string.format("%s", name) .. " x" .. string.format("%i", count));
					else
						SLICECMDR.BARS['EA']['obj'].text2:SetText("x" .. string.format("%i", count));
					end
				else
					if SliceCmdr_Save.SpellText == true then
						SLICECMDR.BARS['EA']['obj'].text2:SetText(string.format("%s",  name) .. " x1");
					else
						SLICECMDR.BARS['EA']['obj'].text2:SetText("x1");
					end
				end
				SLICECMDR.EAExpires = expirationTime;
				SLICECMDR.BARS['EA']['obj']:Show();
				SliceCmdr_ChangeAnchor();
			end
		else
			SLICECMDR.BARS['EA']['obj'].icon:SetTexture("Interface\\AddOns\\SliceCommander\\Icons\\ability_warrior_riposte");
			SLICECMDR.EAExpires = expirationTime;
			SLICECMDR.BARS['EA']['obj']:Show();
			if SliceCmdr_Save.SpellText == true then
				SLICECMDR.BARS['EA']['obj'].text2:SetText(string.format("%s",  name1));
			else
				SLICECMDR.BARS['EA']['obj'].text2:SetText("");
			end
			SliceCmdr_ChangeAnchor();
			
		end
	end
end

local curCombo = 0;

function SliceCmdr_SetComboPts()
	local points = GetComboPoints("player");
	local name, rank, icon, count, debuffType, duration, expirationTime, isMine, isStealable = UnitDebuff("target", SC_SPELL_DP);
	if not name then
		count = 0;
	end
	if (SliceCmdr_Save.CPBarShow == true) then 
		if points == curCombo then
			if curCombo == 0 and not incombat and visible then
				UIFrameFadeOut(SLICECMDR.BARS['CP']['obj'], framefadeout);
				visible = false;
			elseif curCombo > 0 and not visible then
				UIFrameFadeIn(SLICECMDR.BARS['CP']['obj'], framefadein);
				visible = true;
			end
			return
		end
		
		if (points > curCombo) then
			for i = curCombo + 1, points do
				if ( i <= count ) then
					SLICECMDR.BARS['CP']['obj'].combos[i].bg:SetVertexColor(27/255, 139/255, 27/255);
				else
					SLICECMDR.BARS['CP']['obj'].combos[i].bg:SetVertexColor(172/255, 148/255, 16/255);
				end
				SLICECMDR.BARS['CP']['obj'].combos[i]:Show();
			end
			SliceCmdr_Combo:SetText(points);
		else
			for i = points + 1, curCombo do
				SLICECMDR.BARS['CP']['obj'].combos[i]:Hide();
			end
			SliceCmdr_Combo:SetText("");
		end	

		
		if points > 0 then
			SLICECMDR.BARS['CP']['obj'].comboText:SetText(points);
		else
			SLICECMDR.BARS['CP']['obj'].comboText:SetText("");
		end
		
		curCombo = points;
		
		if curCombo == 0 and not incombat and visible then
			UIFrameFadeOut(SLICECMDR.BARS['CP']['obj'], framefadeout);
			visible = false;
		elseif curCombo > 0 and not visible then
			UIFrameFadeIn(SLICECMDR.BARS['CP']['obj'], framefadein);
			visible = true;
		end
	else
		if (points > curCombo) then
			SliceCmdr_Combo:SetText(points);
		else
			SliceCmdr_Combo:SetText("");
		end	
	end		
end

function SliceCmdr_Unload()
	SliceCmdr:UnregisterAllEvents();
	SliceCmdr:Hide();
end

			
function SliceCmdr_NewFrame()
	local f = CreateFrame("StatusBar", nil, UIParent);
	
	f:SetWidth(widthUI);
	f:SetScale(scaleUI);
	f:SetHeight(10);
	f:SetPoint("TOPRIGHT", VTimerEnergy, "BOTTOMRIGHT", 0, -2);
	f:SetStatusBarTexture(SliceCmdr_BarTexture());
	f:SetStatusBarColor(0.768627451, 0, 0, 1);
	f:EnableMouse(false);
	f:SetMinMaxValues(0, 6.0);
	f:SetValue(0);

	f:Hide();
	
	f:SetBackdrop({
		  bgFile="Interface\\AddOns\\SliceCommander\\Images\\solid.tga",
		  edgeFile="",
		  tile=true, tileSize=1, edgeSize=0,
		  insets={left=-1, right=-1, top=-1, bottom=-1}
		});
	f:SetBackdropBorderColor(1,1,1,1);
	f:SetBackdropColor(26/255, 26/255, 26/255);
	
	-- text on the right --			
	if not f.text then
		f.text = f:CreateFontString(nil, nil, "GameFontWhite")
	end
	f.text:SetFontObject(SLICECMDR.BarFont2);
	f.text:SetHeight(10)
	f.text:SetWidth(30);
	f.text:SetPoint("TOPRIGHT", f, "TOPRIGHT",  -5, 0);
	f.text:SetJustifyH("RIGHT")
	f.text:SetText("");
	
	-- icon on the left --	
	if not f.icon then
		f.icon = f:CreateTexture(nil, "OVERLAY");
	end
	f.icon:SetHeight(f:GetHeight()+SliceCmdr_Save.BarMargin);
	f.icon:SetWidth(f.icon:GetHeight());
	f.icon:SetPoint("TOPLEFT", f, "TOPLEFT", 0, 0);
	f.icon:SetAlpha(1);
	f.icon:SetTexCoord(0.07,0.93,0.07,0.93);
	
	f:SetWidth(widthUI-f.icon:GetHeight());
	
	-- text on the left --
	if not f.text2 then
		f.text2 = f:CreateFontString(nil, nil, nil)
	end
	f.text2:SetFontObject(SLICECMDR.BarFont2);
	f.text2:SetHeight(10)
	f.text2:SetWidth(120);
	f.text2:SetPoint("TOPLEFT", f, "TOPLEFT", f.icon:GetHeight(), 0);
	f.text2:SetJustifyH("LEFT")
	f.text2:SetText("");
	
	return f;
	
end

function SliceCmdr_CPFrame()
	local f = CreateFrame("StatusBar", nil, UIParent);
	local width = widthUI;
	--[[naiComboBar]]
	f:ClearAllPoints();
	f:SetWidth(width);
	f:SetScale(scaleUI);
	f:SetHeight(10)
	f:SetPoint("BOTTOMLEFT", VTimerEnergy, "TOPLEFT", 0, 0)
	
	f.bg = f:CreateTexture(nil, "BACKGROUND")
	f.bg:ClearAllPoints()
	f.bg:SetPoint("TOPLEFT", f, "TOPLEFT", 0, 0)
	f.bg:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0, 0)
	f:SetBackdrop({
		  bgFile="Interface\\AddOns\\SliceCommander\\Images\\solid.tga",
		  edgeFile="",
		  tile=false, tileSize=1, edgeSize=0,
		  insets={left=-1, right=-1, top=-1, bottom=-1}
		});
	f:SetBackdropBorderColor(1,1,1,1);
	f:SetBackdropColor(26/255, 26/255, 26/255);
	
	f.combos = {}
	
	local cx = 0
	local spacing = 2;
	width = ((width-(spacing*4))/5);
	
	-- text
	local font = "Fonts\\FRIZQT__.TTF"
	local fontsize = 13
	local fontstyle = "MONOCHROME"
	
	for i = 1, 5 do
		local combo = CreateFrame("Frame", nil, f)
		combo:ClearAllPoints()
		combo:SetPoint("TOPLEFT", f, "TOPLEFT", cx, 0)
		combo:SetPoint("BOTTOMRIGHT", f, "BOTTOMLEFT", cx + width, 0)
		combo:SetHeight(8)
		combo.bg = combo:CreateTexture(nil, "BACKGROUND")
		combo.bg:ClearAllPoints()
		combo.bg:SetAllPoints(combo)
		combo.bg:SetTexture("Interface\\AddOns\\SliceCommander\\Images\\solid.tga")
		combo.bg:SetVertexColor(172/255, 148/255, 16/255)
		combo.bg:SetAlpha(1)
		combo:Hide()
		f.combos[i] = combo
		
		cx = cx + width + spacing
	end

	f.overlay = CreateFrame("Frame", nil, f)
	f.overlay:ClearAllPoints()
	f.overlay:SetAllPoints(f)
	
	if not f.comboText then
		f.comboText = f.overlay:CreateFontString(nil, "OVERLAY")
	end
	f.comboText:SetFontObject(SLICECMDR.BarFont2);
	f.comboText:SetHeight(10)
	f.comboText:SetWidth(120);
	f.comboText:SetJustifyH("CENTER")
	f.comboText:SetText("");
	f.comboText:ClearAllPoints()
	f.comboText:SetAllPoints(f.overlay)

	visible = false
	f:Hide();
	--[[naiComboBar]]
	return f;
	
end

			
function SliceCmdr_OnLoad()
	local localizedClass, englishClass = UnitClass("player");
	if (englishClass == "ROGUE") then
		scaleUI = VTimerEnergy:GetScale();
		widthUI = VTimerEnergy:GetWidth();
		
		SliceCmdr:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
		SliceCmdr:RegisterEvent("UNIT_COMBO_POINTS");
		SLICECMDR.BarFont = CreateFont("VTimerFont");
		SLICECMDR.BarFont:SetFont("Fonts\\FRIZQT__.TTF", 17);
		SLICECMDR.BarFont:SetShadowColor(0,0,0, 0.7);
		SLICECMDR.BarFont:SetTextColor(1,1,1,1);
		SLICECMDR.BarFont:SetShadowOffset(0.8, -0.8);
		
		SLICECMDR.BarFont2 = CreateFont("VTimerFont2");
		SLICECMDR.BarFont2:SetFont("Fonts\\FRIZQT__.TTF", 8)
		SLICECMDR.BarFont2:SetShadowColor(0,0,0, 0.7);
		SLICECMDR.BarFont2:SetTextColor(213/255,200/255,184/255,1);
		SLICECMDR.BarFont2:SetShadowOffset(0.8, -0.8);
		
		SLICECMDR.BarFont3 = CreateFont("VTimerFont1O");
		SLICECMDR.BarFont3:SetFont("Fonts\\FRIZQT__.TTF", 17);
		SLICECMDR.BarFont3:SetShadowColor(0,0,0, 0.2);
		SLICECMDR.BarFont3:SetTextColor(0,0,0,1);
		SLICECMDR.BarFont3:SetShadowOffset(0.8, -0.8);
		
		SLICECMDR.BarFont4 = CreateFont("VTimerFont4");
		SLICECMDR.BarFont4:SetFont("Fonts\\FRIZQT__.TTF", 8)
		SLICECMDR.BarFont4:SetShadowColor(0,0,0, 0.7);
		SLICECMDR.BarFont3:SetTextColor(0,0,0,1);
		SLICECMDR.BarFont4:SetShadowOffset(0.8, -0.8);
		
		SLICECMDR.LastEnergy = UnitMana('player');
		
		VTimerEnergyTxt:SetFontObject(SLICECMDR.BarFont);
		SliceCmdr_Combo:SetFontObject(SLICECMDR.BarFont3);
		
		VTimerEnergy:SetMinMaxValues(0,UnitManaMax("player"));
		VTimerEnergy:SetBackdrop({
		  bgFile="Interface\\AddOns\\SliceCommander\\Images\\solid.tga",
		  edgeFile="",
		  tile=true, tileSize=1, edgeSize=0,
		  insets={left=-1, right=-1, top=-1, bottom=-1}
		});
		VTimerEnergy:SetBackdropBorderColor(1,1,1,1);
		VTimerEnergy:SetBackdropColor(26/255, 26/255, 26/255);
		VTimerEnergy:SetStatusBarTexture(SliceCmdr_BarTexture());
		VTimerEnergy:SetWidth(200);
		VTimerEnergy:SetStatusBarColor(254/255, 246/255, 226/255);
		
		SLICECMDR.BARS['CP']['obj'] = SliceCmdr_CPFrame();

		SLICECMDR.BARS['SnD']['obj'] = SliceCmdr_NewFrame();
		SLICECMDR.BARS['SnD']['obj']:SetStatusBarColor(255/255, 74/255, 18/255, 0.9);
		SLICECMDR.BARS['SnD']['obj'].icon:SetTexture("Interface\\AddOns\\SliceCommander\\Icons\\Ability_Rogue_SliceDice");
		
		SLICECMDR.BARS['Rup']['obj'] = SliceCmdr_NewFrame();
		SLICECMDR.BARS['Rup']['obj']:SetStatusBarColor(130/255, 15/255, 0);
		SLICECMDR.BARS['Rup']['obj'].icon:SetTexture("Interface\\AddOns\\SliceCommander\\Icons\\Ability_Rogue_Rupture");

		SLICECMDR.BARS['HfB']['obj'] = SliceCmdr_NewFrame();
		SLICECMDR.BARS['HfB']['obj']:SetStatusBarColor(104/255, 98/255, 100/255);		
		SLICECMDR.BARS['HfB']['obj'].icon:SetTexture("Interface\\AddOns\\SliceCommander\\Icons\\Ability_Rogue_HungerforBlood");
		
		SLICECMDR.BARS['DP']['obj'] = SliceCmdr_NewFrame();
		SLICECMDR.BARS['DP']['obj']:SetStatusBarColor(27/255, 139/255, 27/255);
		SLICECMDR.BARS['DP']['obj'].icon:SetTexture("Interface\\AddOns\\SliceCommander\\Icons\\Ability_Rogue_DualWeild");
		
		SLICECMDR.BARS['ToT']['obj'] = SliceCmdr_NewFrame();
		SLICECMDR.BARS['ToT']['obj']:SetStatusBarColor(65/255, 65/255, 116/255);
		SLICECMDR.BARS['ToT']['obj'].icon:SetTexture("Interface\\AddOns\\SliceCommander\\Icons\\Ability_Rogue_TricksOftheTrade");
		
		SLICECMDR.BARS['EA']['obj'] = SliceCmdr_NewFrame();
		SLICECMDR.BARS['EA']['obj']:SetStatusBarColor(128/255, 0/255, 255/255);
		SLICECMDR.BARS['EA']['obj'].icon:SetTexture("Interface\\AddOns\\SliceCommander\\Icons\\ability_warrior_riposte");

		SliceCmdr_OnUpdate();
	else
		SliceCmdr_Unload();
		return;
	end
	
end

function SliceCmdr_util_SnDBuffTime()
	if ((SLICECMDR.SliceExpires > 0) and (SLICECMDR.tNow < SLICECMDR.SliceExpires)) then
		return SLICECMDR.SliceExpires - SLICECMDR.tNow;
	else
		return 0;
	end
end

function getExpirationTime(start)
	
end

function SliceCmdr_util_ToTCDTime(ToTExpires)
	expirationTime = 30 - ( SLICECMDR.tNow - ToTExpires )
	if expirationTime <= 0 then
		expirationTime = 0;
	end
	return expirationTime;
end

function SliceCmdr_util(Timer)
	if ((Timer > 0) and (SLICECMDR.tNow < Timer)) then
		return Timer - SLICECMDR.tNow;
	else
		return 0;
	end
end

function SliceCmdr_RupBar()
	local x = SliceCmdr_util(SLICECMDR.RupExpires);
	
	SliceCmdr_Bar(x,SLICECMDR.BARS['Rup'])
	
	if (x <= 0) then
		SLICECMDR.RupExpires = 0;
	end	
end

function SliceCmdr_DPBar()
	local x = SliceCmdr_util(SLICECMDR.DPExpires);
	SliceCmdr_Bar(x,SLICECMDR.BARS['DP'])
	
	if (x == 0) then
		for i = 1, 5 do
			SLICECMDR.BARS['CP']['obj'].combos[i].bg:SetVertexColor(172/255, 148/255, 16/255);
		end
		SLICECMDR.DPExpires = 0;
	end
end

function SliceCmdr_ToTBar()
	start, duration, enabled = GetSpellCooldown(SC_SPELL_TOT)
	if start ~= 0 and SLICECMDR.ToTExpires == 0 and enabled == 1 and duration == 30 then
		SLICECMDR.BARS['ToT']['obj']:Show();
		if SliceCmdr_Save.SpellText == true then
			SLICECMDR.BARS['ToT']['obj'].text2:SetText(string.format("%s", SC_SPELL_TOT));
		else
			SLICECMDR.BARS['ToT']['obj'].text2:SetText("");
		end
		SliceCmdr_ChangeAnchor();
		SLICECMDR.ToTExpires = start;
	end
	
	local x = SliceCmdr_util_ToTCDTime(SLICECMDR.ToTExpires);
	SliceCmdr_Bar(x,SLICECMDR.BARS['ToT']);
	if (x <= 0) then
		SLICECMDR.ToTExpires = 0;
	end
end

function SliceCmdr_EABar()
	local x = SliceCmdr_util(SLICECMDR.EAExpires);

	SliceCmdr_Bar(x,SLICECMDR.BARS['EA']);
	
	if (x <= 0) then
		SLICECMDR.EAExpires = 0;
	end
end

function SliceCmdr_Bar(x,SLICECMDR_BARS)
	if ( x > 0 ) then
		if (SLICECMDR_BARS) then
			SLICECMDR_BARS['obj']:SetValue(x);
			SLICECMDR_BARS['obj'].text:SetText(string.format("%0.1f", x));
		end
	else
		SLICECMDR_BARS['obj']:Hide();
		SLICECMDR_BARS['obj'].text:SetText("");
		SliceCmdr_ChangeAnchor();
	end
end

function SliceCmdr_HungerBar()
	local x = SliceCmdr_util(SLICECMDR.HungerExpires);
	local hfb = SLICECMDR.BARS['HfB'];
	
	if (x > 0) then
		if (SLICECMDR.BARS['HfB']) then
			SLICECMDR.BARS['HfB']['obj']:SetValue(x);
			SLICECMDR.BARS['HfB']['obj'].text:SetText(string.format("%0.1f", x));
		end
		
		if (x <= 3) then
			if (hfb.AlertPending == 3) then
				SliceCmdr_Sound('HfB.Alert');
				hfb.AlertPending = 2;
			else 
				if (x <= 2) then
					if (hfb.AlertPending == 2) then
						SliceCmdr_Sound('HfB.Alert');
						hfb.AlertPending = 1;
					else 
						if (x <= 1) then
							if (hfb.AlertPending == 1) then
								SliceCmdr_Sound('HfB.Alert');
								hfb.AlertPending = 0;
							end
						end
					end
				end
			end
		else
			hfb.AlertPending = 3;
		end
		
	end	
	
end

function SliceCmdr_SNDBar() 
	SLICECMDR.tNow = GetTime();
	if (SliceCmdr_Save.PadLatency) then
		local down, up, lag = GetNetStats();
		SLICECMDR.tNow = SLICECMDR.tNow + (lag*2/1000);
	end	
		
	local x = SliceCmdr_util_SnDBuffTime();

	if (x > 0) then
		if (x <= 3) then
			if (SLICECMDR.AlertPending == 3) then
				SliceCmdr_Sound("Tick3");
				SLICECMDR.AlertPending = 2;
			else 
				if (x <= 2) then
					if (SLICECMDR.AlertPending == 2) then
						SliceCmdr_Sound("Tick2");
						SLICECMDR.AlertPending = 1;
					else 
						if (x <= 1) then
							if (SLICECMDR.AlertPending == 1) then
								SliceCmdr_Sound("Tick1");
								SLICECMDR.AlertPending = 0;
							end
						end
					end
				end
			end
		else
			SLICECMDR.AlertPending = 3;
		end
		
	end
	
	if (SLICECMDR.BARS['SnD']) then
		if (SLICECMDR.BARS['SnD']['obj']) then
			SLICECMDR.BARS['SnD']['obj']:SetValue(x);
			if (x > 0) then
				SLICECMDR.BARS['SnD']['obj'].text:SetText(string.format("%0.1f", x));
			else
				SLICECMDR.BARS['SnD']['obj'].text:SetText("");
			end		
		end			
	end
end

SLASH_SLICECOMMANDER1 = "/slicecommander"
SLASH_SLICECOMMANDER2 = "/sc"
SlashCmdList["SLICECOMMANDER"] = function(msg)
	if msg == "show" then
		self:ToggleFrame()
	else
		InterfaceOptionsFrame_OpenToCategory("SliceCommander")
	end
end

function SliceCmdr_OnUpdate()
	VTimerEnergy:SetValue(UnitMana("player"));
	VTimerEnergy:SetMinMaxValues(0,UnitManaMax("player"));
	
	if (UnitManaMax("player") == UnitMana('player')) then
		VTimerEnergyTxt:SetText("");
	else
		VTimerEnergyTxt:SetText(UnitMana("player"));
	end			
	
	SliceCmdr_Config_OtherVars();
	
	if (SLICECMDR.LastEnergy < UnitMana('player')) then
		if ((SLICECMDR.LastEnergy < SliceCmdr_Save.Energy2) and (UnitMana('player') >= SliceCmdr_Save.Energy2)) then
			SliceCmdr_Sound("EnergySound2");
		else
			if ((SLICECMDR.LastEnergy < SliceCmdr_Save.Energy1) and (UnitMana('player') >= SliceCmdr_Save.Energy1)) then
				SliceCmdr_Sound("EnergySound1");
			end
		end
		if (UnitManaMax("player") == UnitMana('player')) then
			VTimerEnergy:SetAlpha(SliceCmdr_Save.EnergyTrans / 100.0);
		else
			VTimerEnergy:SetAlpha(1.0);
		end
	end
	
	SLICECMDR.LastEnergy = UnitMana('player');
	SliceCmdr_SNDBar();
	SliceCmdr_HungerBar();
	SliceCmdr_ToTBar();
	SliceCmdr_EABar();
	SliceCmdr_DPBar();
	SliceCmdr_RupBar();
end
