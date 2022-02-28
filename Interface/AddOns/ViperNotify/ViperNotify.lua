ViperNotify = {}

ViperConfig = {}

VNDISPLAY_NONE = 1;
VNDISPLAY_SCT = 2;
VNDISPLAY_RW = 3;

ViperNotify.DisplayValue = {"None", "Combat Text", "Raid Warning"};

ViperNotify.Sounds = {
	"Sound\\Interface\\AlarmClockWarning3.wav";
	"Sound\\Interface\\RaidWarning.wav";
	"Sound\\Spells\\ShaysBell.wav";
	"Sound\\Spells\\AspectofTheSnake.wav";
	"Sound\\Spells\\Bonk1.wav";
	"Sound\\Spells\\Bonk3.wav";
}

function ViperNotify.OnLoad(self)
	local _,gclass=UnitClass("player")
	if gclass ~= "HUNTER" then
		return
	end
	
	self:RegisterEvent("ADDON_LOADED");
	--self:RegisterEvent("UNIT_MANA");
	self:SetScript("OnUpdate", ViperNotify.Update);
	
	SlashCmdList["ViperNotify"] = ViperNotify.SlashHandler;
	SLASH_ViperNotify1 = "/vipernotify";
	SLASH_ViperNotify2 = "/vnote";
	
	ViperNotify.lastTime = 0;
end

function ViperNotify.LoadDefaults()
	if(nil == ViperConfig.Interval) then ViperConfig.Interval = 5 end;		
	if(nil == ViperConfig.ThresholdHigh) then ViperConfig.ThresholdHigh = 100 end;
	if(nil == ViperConfig.ThresholdLow) then ViperConfig.ThresholdLow = 15 end;
	if(nil == ViperConfig.MessageHigh) then ViperConfig.MessageHigh = "Full mana, Viper is still on!" end;
	if(nil == ViperConfig.MessageLow) then ViperConfig.MessageLow = "Low mana!" end;
	if(nil == ViperConfig.WarnHigh) then ViperConfig.WarnHigh = true end;
	if(nil == ViperConfig.WarnLow) then ViperConfig.WarnLow = false end;
	
	if(nil == ViperConfig.Color) then ViperConfig.Color = {r=.2,g=.7,b=.9} end;
	
	if(nil == ViperConfig.SoundOn) then ViperConfig.SoundOn = true end;
	if(nil == ViperConfig.SoundHigh) then ViperConfig.SoundHigh = "Sound\\Interface\\AlarmClockWarning3.wav" end;
	if(nil == ViperConfig.SoundLow) then ViperConfig.SoundLow = "Sound\\Spells\\ShaysBell.wav" end;
	
	if(nil == ViperConfig.DisplayMethod) then ViperConfig.DisplayMethod = VNDISPLAY_SCT end;
	if(nil == ViperConfig.DisableWhenSolo) then ViperConfig.DisableWhenSolo = false end;
	if(nil == ViperConfig.DisableWhenMounted) then ViperConfig.DisableWhenMounted = true end;
	if(nil == ViperConfig.CombatOnly) then ViperConfig.CombatOnly = false end;
	--if(nil == ViperConfig.WarnPVP) then ViperConfig.WarnPVP = false end;
end

function ViperNotify.EventHandler(self,event,...)
	-- default values
	if event=="ADDON_LOADED" and arg1=="ViperNotify" then
		-- Import values from older version, then remove old config vars
		if tonumber(ViperConfig.Threshold) then
			ViperConfig.ThresholdHigh = tonumber(ViperConfig.Threshold);
			ViperConfig.Threshold = nil;
		end
		if ViperConfig.Message then
			ViperConfig.MessageHigh = ViperConfig.Message;
			ViperConfig.Message = nil;
		end
		if ViperConfig.Display then
			if ViperConfig.Display == "rw" then ViperConfig.DisplayMethod = VNDISPLAY_RW;
			else ViperConfig.DisplayMethod = VNDISPLAY_SCT end;
			ViperConfig.Display = nil;
		end
		
		-- Set default values
		ViperNotify.LoadDefaults()
	
		-- Init GUI
		ViperNotify.ConfigPanelLoad(self);
		
		return;
		
	elseif event=="UNIT_MANA" then		-- currently not in use.
		ViperNotify.Update()
	end
end

function ViperNotify.Update()

	if UnitIsDead("player") or UnitIsGhost("player") then
		return;
	end

	if ViperConfig.DisableWhenMounted and IsMounted() then
		return;
	end
	
	if ViperConfig.CombatOnly and not InCombatLockdown() then
		return;
	end
	
	if ViperConfig.DisableWhenSolo then
		local group = (GetNumPartyMembers()>0) or (GetNumRaidMembers()>0);
		if not group then
			return;
		end
	end
	
	-- Don't bother me while I'm eating/drinking
	if (UnitBuff("player","Food") ~= nil) or (UnitBuff("player","Drink") ~= nil) then
		return;
	end

	local currTime = GetTime();
	local aotv = UnitBuff("player",GetSpellInfo(34074)); -- nil if not found
	local mana_percent = floor(UnitPower("player") / UnitPowerMax("player") * 100);
	
	--[[
	-- Warn when pvping with AotV on
	if ViperConfig.WarnPVP and aotv and InCombatLockdown() and UnitIsPlayer("target") and not UnitCanCooperate("target", "player") then
		ViperNotify.Notify("PVPing with Viper on!", ViperConfig.SoundHigh);
		return;
	end
	]]
	
	--full mana notification
	if ViperConfig.WarnHigh and aotv and mana_percent >= ViperConfig.ThresholdHigh then
		if (currTime - ViperNotify.lastTime > ViperConfig.Interval) then	-- Show notification at most every <interval> seconds
			ViperNotify.lastTime = currTime;
			ViperNotify.Notify(ViperConfig.MessageHigh, ViperConfig.SoundHigh);
		else
			return;
		end
		
	--low mana notification. only active while in combat
	elseif ViperConfig.WarnLow and not aotv and mana_percent <= ViperConfig.ThresholdLow then
		if (currTime - ViperNotify.lastTime > ViperConfig.Interval) then	-- Show notification at most every <interval> seconds
			ViperNotify.lastTime = currTime;
			ViperNotify.Notify(ViperConfig.MessageLow, ViperConfig.SoundLow);
		else
			return;
		end
	end
end

function ViperNotify.Notify(msg, sound)
	if ViperConfig.DisplayMethod==VNDISPLAY_SCT then
		if SCT_Display then		--send via SCT if it exists
			SCT_Display(msg, ViperConfig.Color);
		elseif MikSBT then		--send via MSBT
			--kinda inefficient redoing the calc every time, but it's only once every few seconds so quick fix wins
			MikSBT.DisplayMessage(msg, nil, nil, ViperConfig.Color.r * 255, ViperConfig.Color.g * 255, ViperConfig.Color.b * 255);
		elseif SHOW_COMBAT_TEXT=="1" then		--otherwise default UI's SCT
			CombatText_AddMessage(msg, CombatText_StandardScroll, ViperConfig.Color.r, ViperConfig.Color.g, ViperConfig.Color.b);
		else
			RaidNotice_AddMessage(RaidWarningFrame, msg, ViperConfig.Color);
		end
		
	elseif ViperConfig.DisplayMethod==VNDISPLAY_RW then		--raid warning frame
		RaidNotice_AddMessage(RaidWarningFrame, msg, ViperConfig.Color);
	end
	
	if ViperConfig.SoundOn then
		ViperNotify.PlaySound(sound);
	end
	
end

function ViperNotify.PlaySound(sound)
	if sound==nil then return end;
	
	if string.match(sound,"\\") then
		return PlaySoundFile(sound);
	else
		return PlaySound(sound);
	end
end

function ViperNotify.Print(msg)
	DEFAULT_CHAT_FRAME:AddMessage("|cff8ed6f0"..msg);
end

function ViperNotify.SlashHandler(arg1)
	if arg1 and string.match(arg1,"interval") then
		local interval = string.match(arg1,"interval (%d+)");
		if interval then
			interval = tonumber(interval)
			if interval==nil or interval<0 then
				ViperNotify.Print("ViperNotify: Invalid input.");
				return;
			end
			ViperConfig.Interval = interval;
		else
			ViperNotify.Print("ViperNotify Interval: |cffffff33"..ViperConfig.Interval)
			ViperNotify.Print("Usage: |r/vipernotify interval <interval>")
			ViperNotify.Print("  Time (in seconds) between notification messages.")
		end
		
	elseif arg1 and string.match(arg1,"lowwarn") then
		if arg1=="warnlow on" then
			ViperConfig.WarnLow = true;
		elseif arg1=="warnlow off" then
			ViperConfig.WarnLow = false;
		else
			local val;
			if ViperConfig.WarnLow then
				val = "on";
			else
				val = "off";
			end
			ViperNotify.Print("ViperNotify Warn at Low Mana: |cffffff33"..val)
			ViperNotify.Print("Usage: |r/vipernotify warnlow [on, off]")
			ViperNotify.Print("  Warn when at low mana and not in AotV.")
		end
			
	elseif arg1 and string.match(arg1,"highmsg") then
		local msg = string.match(arg1,"highmsg (.+)");
		if msg then
			ViperConfig.MessageHigh = msg;
		else
			ViperNotify.Print("ViperNotify Full Mana Message: |cffffff33"..ViperConfig.MessageHigh)
			ViperNotify.Print("Usage: |r/vipernotify highmsg <message>")
			ViperNotify.Print("  Notification message to be displayed at full mana.")
		end
		
	elseif arg1 and string.match(arg1,"lowmsg") then
		local msg = string.match(arg1,"lowmsg (.+)");
		if msg then
			ViperConfig.MessageLow = msg;
		else
			ViperNotify.Print("ViperNotify Low Mana Message: |cffffff33"..ViperConfig.MessageLow)
			ViperNotify.Print("Usage: |r/vipernotify lowmsg <message>")
			ViperNotify.Print("  Notification message to be displayed at low mana.")
		end
			
	elseif arg1 and string.match(arg1,"highsound") then
		local sound = string.match(arg1,"highsound (.+)");
		if sound then
			if PlaySoundFile(sound) then
				ViperConfig.SoundHigh = sound;
			else
				ViperNotify.Print(format("%q","ViperNotify: "..sound.." could not be found"));
			end
		else
			ViperNotify.Print("ViperNotify Full Mana Warning Sound: |cffffff33"..format("%q",ViperConfig.SoundHigh))
			ViperNotify.Print("Usage: |r/vipernotify highsound <sound file>")
			ViperNotify.Print("  Sound file to play at full mana. File path is relative to the WoW folder. Note that there is no error checking here, so make sure you give a valid file.")
			ViperNotify.Print("  eg. /vipernotify highsound "..format("%q","Sound\\Interface\\AlarmClockWarning3.wav"))
		end
		
	elseif arg1 and string.match(arg1,"lowsound") then
		local sound = string.match(arg1,"lowsound (.+)");
		if sound then
			if PlaySoundFile(sound) then
				ViperConfig.SoundLow = sound;
			else
				ViperNotify.Print("ViperNotify: "..sound.." could not be found");
			end
		else
			ViperNotify.Print("ViperNotify Low Mana Warning Sound: |cffffff33"..ViperConfig.SoundLow)
			ViperNotify.Print("Usage: |r/vipernotify lowsound <sound file>")
			ViperNotify.Print("  Sound file to play at low mana. File path is relative to the WoW folder. Note that there is no error checking here, so make sure you give a valid file.")
			ViperNotify.Print("  eg. /vipernotify lowsound Sound\\Spells\\ShaysBell.wav")
		end
		
	elseif arg1 and string.match(arg1,"sound") then
		if arg1=="sound on" then
			ViperConfig.SoundOn = true;
		elseif arg1=="sound off" then
			ViperConfig.SoundOn = false;
		else
			local val;
			if ViperConfig.SoundOn then
				val = "on";
			else
				val = "off";
			end
			ViperNotify.Print("ViperNotify Enable Sound: |cffffff33"..val)
			ViperNotify.Print("Usage: |r/vipernotify sound [on, off]")
			ViperNotify.Print("  Turn sound notification on/off.")
		end
					
	elseif arg1 and string.match(arg1,"high") then
		local threshold = string.match(arg1,"high (%d+)");
		if threshold then
			threshold = tonumber(threshold);
			if threshold==nil or threshold<0 or threshold>100 then
				ViperNotify.Print("ViperNotify: Invalid input.");
				return;
			end
			ViperConfig.ThresholdHigh = threshold;
		else
			ViperNotify.Print("ViperNotify Upper Threshold: |cffffff33"..ViperConfig.ThresholdHigh)
			ViperNotify.Print("Usage: |r/vipernotify high [0-100]")
			ViperNotify.Print("  Notification threshold as % of max mana.")
		end
		
	elseif arg1 and string.match(arg1,"low") then
		local threshold = string.match(arg1,"low (%d+)");
		if threshold then
			threshold = tonumber(threshold);
			if threshold==nil or threshold<0 or threshold>100 then
				ViperNotify.Print("ViperNotify: Invalid input.");
				return;
			end
			ViperConfig.ThresholdLow = threshold;
		else
			ViperNotify.Print("ViperNotify Lower Threshold: |cffffff33"..ViperConfig.ThresholdLow)
			ViperNotify.Print("Usage: |r/vipernotify low [0-100]")
			ViperNotify.Print("  Notification threshold as % of max mana.")
		end

	elseif arg1 and string.match(arg1,"display") then
		if arg1=="display none" then
			ViperConfig.DisplayMethod = VNDISPLAY_NONE;
		elseif arg1=="display sct" then
			ViperConfig.DisplayMethod = VNDISPLAY_SCT;
		elseif arg1=="display rw" then
			ViperConfig.DisplayMethod = VNDISPLAY_RW;
		else
			local val;
			if ViperConfig.DisplayMethod == VNDISPLAY_SCT then
				val = "sct";
			elseif ViperConfig.DisplayMethod == VNDISPLAY_RW then
				val = "rw";
			elseif ViperConfig.DisplayMethod == VNDISPLAY_NONE then
				val = "none";
			end
			ViperNotify.Print("ViperNotify Display: |cffffff33"..val)
			ViperNotify.Print("Usage: |r/vipernotify display [none, sct, rw]")
			ViperNotify.Print("  Show notifications through either scrolling combat text or raid warning, or 'none' to disable the text notification.")
		end
	
	elseif arg1 and string.match(arg1,"disablesolo") then
		if arg1=="disablesolo on" then
			ViperConfig.DisableWhenSolo = true;
		elseif arg1=="disablesolo off" then
			ViperConfig.DisableWhenSolo = false;
		else
			local val;
			if ViperConfig.DisableWhenSolo then
				val = "on";
			else
				val = "off";
			end
			ViperNotify.Print("ViperNotify Disable while Solo: |cffffff33"..val)
			ViperNotify.Print("Usage: |r/vipernotify disablesolo [on, off]")
			ViperNotify.Print("  Disable notifications while not in a group.")
		end
		
	elseif arg1 and string.match(arg1,"disablemounted") then
		if arg1=="disablemounted on" then
			ViperConfig.DisableWhenMounted = true;
		elseif arg1=="disablemounted off" then
			ViperConfig.DisableWhenMounted = false;
		else
			local val;
			if ViperConfig.DisableWhenMounted then
				val = "on";
			else
				val = "off";
			end
			ViperNotify.Print("ViperNotify Disable while Mounted: |cffffff33"..val)
			ViperNotify.Print("Usage: |r/vipernotify disablemounted [on, off]")
			ViperNotify.Print("  Disable notifications while mounted.")
		end

	else
		InterfaceOptionsFrame_OpenToCategory(ViperNotifyPanelFrame.name);
		InterfaceOptionsFrame_OpenToCategory(ViperNotifyPanelFrame.name);

		--[[
		ViperNotify.Print("ViperNotify: /vipernotify or /vnote")
		ViperNotify.Print("  /vipernotify interval <interval>")
		ViperNotify.Print("  /vipernotify high <threshold>")
		ViperNotify.Print("  /vipernotify low <threshold>")
		ViperNotify.Print("  /vipernotify highmsg <message>")
		ViperNotify.Print("  /vipernotify lowmsg <message>")
		ViperNotify.Print("  /vipernotify display [sct, rw, none]")
		ViperNotify.Print("  /vipernotify sound [on, off]")
		ViperNotify.Print("  /vipernotify highsound <sound file>")
		ViperNotify.Print("  /vipernotify lowsound <sound file>")
		ViperNotify.Print("  /vipernotify disablesolo [on, off]")
		ViperNotify.Print("  /vipernotify disablemounted [on, off]")
		ViperNotify.Print("Use \"/vipernotify <command>\" for more info.")
		]]
	end
end


-- OPTIONS PANEL --

function ViperNotify.ConvertBool(value)
	if value then return true;
	else return false;
	end
end

function ViperNotify.ConfigPanelOkay(self)
	ViperConfig.Interval =      ViperNotifyPanelFrame_Slider1Slider:GetValue();
	ViperConfig.ThresholdHigh = ViperNotifyPanelFrame_Slider2Slider:GetValue();
	ViperConfig.ThresholdLow =  ViperNotifyPanelFrame_Slider3Slider:GetValue();
	
	ViperConfig.MessageHigh = ViperNotifyPanelFrame_InputBox1Input:GetText();
	ViperConfig.SoundHigh =   ViperNotifyPanelFrame_InputBox2Input:GetText();
	ViperConfig.MessageLow =  ViperNotifyPanelFrame_InputBox3Input:GetText();
	ViperConfig.SoundLow =    ViperNotifyPanelFrame_InputBox4Input:GetText();
	
	ViperConfig.DisplayMethod = ViperNotifyPanelFrame_Slider4Slider:GetValue();
	
	ViperConfig.SoundOn = 			 ViperNotify.ConvertBool(ViperNotifyPanelFrame_CheckButton1:GetChecked());
	ViperConfig.WarnLow = 			 ViperNotify.ConvertBool(ViperNotifyPanelFrame_CheckButton2:GetChecked());
	ViperConfig.DisableWhenMounted = ViperNotify.ConvertBool(ViperNotifyPanelFrame_CheckButton3:GetChecked());
	ViperConfig.DisableWhenSolo = 	 ViperNotify.ConvertBool(ViperNotifyPanelFrame_CheckButton4:GetChecked());
	ViperConfig.CombatOnly =    	 ViperNotify.ConvertBool(ViperNotifyPanelFrame_CheckButton5:GetChecked());
end

function ViperNotify.ConfigPanelLoad(self)
	ViperNotifyPanelFrame_Slider1Slider:SetValue(ViperConfig.Interval);
	ViperNotifyPanelFrame_Slider2Slider:SetValue(ViperConfig.ThresholdHigh);
	ViperNotifyPanelFrame_Slider3Slider:SetValue(ViperConfig.ThresholdLow);
	ViperNotifyPanelFrame_Slider4Slider:SetValue(ViperConfig.DisplayMethod);
	
	ViperNotifyPanelFrame_InputBox1Input:SetText(ViperConfig.MessageHigh);
	ViperNotifyPanelFrame_InputBox2Input:SetText(ViperConfig.SoundHigh);
	ViperNotifyPanelFrame_InputBox3Input:SetText(ViperConfig.MessageLow);
	ViperNotifyPanelFrame_InputBox4Input:SetText(ViperConfig.SoundLow);
	
	ViperNotifyPanelFrame_CheckButton1:SetChecked(ViperConfig.SoundOn);
	ViperNotifyPanelFrame_CheckButton2:SetChecked(ViperConfig.WarnLow);
	ViperNotifyPanelFrame_CheckButton3:SetChecked(ViperConfig.DisableWhenMounted);
	ViperNotifyPanelFrame_CheckButton4:SetChecked(ViperConfig.DisableWhenSolo);
	ViperNotifyPanelFrame_CheckButton5:SetChecked(ViperConfig.CombatOnly);
	
	ViperNotify.SetSwatchColor()
end

function ViperNotify.InitPanel(panel)
	local _,gclass=UnitClass("player")
	if gclass ~= "HUNTER" then
		return
	end
	
	panel.name = "ViperNotify";
	panel.okay = ViperNotify.ConfigPanelOkay
	panel.default = function (self) ViperConfig={} ViperNotify.LoadDefaults() ViperNotify.ConfigPanelLoad(self) end;
	InterfaceOptions_AddCategory(panel);
end

function ViperNotify.DisplayValueChanged(self)
	local value = ViperNotifyPanelFrame_Slider4Slider:GetValue();
	ViperNotifyPanelFrame_Slider4Input:SetText(ViperNotify.DisplayValue[value]);
end

function ViperNotify.SetSwatchColor()
	ViperNotifyPanelFrame_ColorSwatchNormalTexture:SetVertexColor(ViperConfig.Color.r, ViperConfig.Color.g, ViperConfig.Color.b);
end

function ViperNotify.ColorPickerFunc()
	local r,g,b = ColorPickerFrame:GetColorRGB();
	ViperConfig.Color.r = r;
	ViperConfig.Color.b = b;
	ViperConfig.Color.g = g;
	ViperNotify.SetSwatchColor()
end

function ViperNotify.ColorPickerCancel(prevvals)
	local r,g,b = unpack(prevvals)
	ViperConfig.Color.r = r;
	ViperConfig.Color.b = b;
	ViperConfig.Color.g = g;
	ViperNotify.SetSwatchColor()
end

function ViperNotify.ShowColorPicker()
	ColorPickerFrame.hasOpacity = false;
	ColorPickerFrame.func = ViperNotify.ColorPickerFunc;
	ColorPickerFrame.cancelFunc = ViperNotify.ColorPickerCancel;
	ColorPickerFrame.previousValues = {ViperConfig.Color.r, ViperConfig.Color.g, ViperConfig.Color.b};
	ColorPickerFrame:SetColorRGB(ViperConfig.Color.r, ViperConfig.Color.g, ViperConfig.Color.b)
	ColorPickerFrame:Show()
end

