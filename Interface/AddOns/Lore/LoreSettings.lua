Lore_SettingsClickOptions={
	"settings",
	"cycle",
	"interpreter",
	"screening",
	"reset",
	"self",
	"stutter",
	"hiss",
	"lisp",
	"cut words",
	"growl",
	"none",
	}

Lore_SettingsTextures={
	"OldPaper",
	"Alliance",
	"Horde",
	"Purple",
	"Shadow",
	"Wood",
	"Metal",
	"Marble",
	"Rock",
	"Stones",
	"Pelt",
	"Cheetah",
	"Tiger",
	"Hot",
	"Engineered",
	"Masquerade",
	}

Lore_TabposTable={
	"bot-right",
	"bot-left",
	"top-right",
	"top-left",
	"tooltip",
	}

Lore_EffectTable={
	"none",
	"stutter",
	"hiss",
	"lisp",
	"wordcut",
	"growl",
	}

Lore_SettingsMassTable={
	"none",
	"party",
	"raid",
	"guild",
	}

function Lore_RotateButton(event,value)
	PlaySoundFile("Sound\\Interface\\uChatScrollButton.wav"); 

	if ( event == "Leftclick" ) then
		Lore_Left = Lore_Left + 1;
		if (Lore_Left > 11) then Lore_Left = 0; end
		return Lore_SettingsClickOptions[Lore_Left + 1]
	elseif ( event == "Rightclick" ) then
		Lore_Right = Lore_Right + 1;
		if (Lore_Right > 11) then Lore_Right = 0; end
		return Lore_SettingsClickOptions[Lore_Right + 1]
	elseif ( event == "LockTablet" ) then
		Lore_Locked = 1 - Lore_Locked;
		return Lore_SettingsClickOptions[Lore_Locked]
	elseif ( event == "Screening" ) then
		Lore_Screen = 1 - Lore_Screen;
		return Lore_Screen
	elseif ( event == "HideLoreButton" ) then
		Lore_Visible = 1 - Lore_Visible;
		if (Lore_Visible == 1) then
			Lore_Tablet:Show();
		else
			Lore_Tablet:Hide();
		end
		return Lore_SettingsClickOptions[1 - Lore_Visible]
	elseif ( event == "ButtonTexture" ) then
		Lore_ButtonTexture = Lore_ButtonTexture + 1;
		if (Lore_ButtonTexture > 16) then Lore_ButtonTexture = 1; end
		LoreButtonBackground:SetTexture("Interface\\AddOns\\Lore\\UI\\" .. Lore_SettingsTextures[Lore_ButtonTexture]);
		if (Lore_ButtonTexture == 1) then
			Lore_TabletTextColor_R = 0.5;
			Lore_TabletTextColor_G = 0.1;
			Lore_TabletTextColor_B = 0.1;
		elseif (Lore_ButtonTexture == 2) or (Lore_ButtonTexture == 4) then
			Lore_TabletTextColor_R = 0.2;
			Lore_TabletTextColor_G = 0.7;
			Lore_TabletTextColor_B = 1.0;
		elseif (Lore_ButtonTexture == 3) then
			Lore_TabletTextColor_R = 1.0;
			Lore_TabletTextColor_G = 0.7;
			Lore_TabletTextColor_B = 0.7;
		elseif (Lore_ButtonTexture == 5) or (Lore_ButtonTexture == 16) then
			Lore_TabletTextColor_R = 0.7;
			Lore_TabletTextColor_G = 0.7;
			Lore_TabletTextColor_B = 0.7;
		elseif (Lore_ButtonTexture == 8) then
			Lore_TabletTextColor_R = 1.0;
			Lore_TabletTextColor_G = 1.0;
			Lore_TabletTextColor_B = 1.0;
		end
		LoreDialect:SetTextColor( Lore_TabletTextColor_R, Lore_TabletTextColor_G, Lore_TabletTextColor_B, 1 );
		return Lore_SettingsTextures[Lore_ButtonTexture]
	elseif ( event == "Tabletpos" ) then
		Lore_Tabletposition = Lore_Tabletposition + 1;
		if (Lore_Tabletposition > 4) then Lore_Tabletposition = 0; end
		return Lore_TabposTable[Lore_Tabletposition + 1]
	elseif ( event == "Effect" ) then
		Lore_Effect = Lore_Effect + 1;
		if (Lore_Effect > 5) then Lore_Effect = 0; end
		if (Lore_Effect == 1) then
			Lore_Text_Percent:SetText("(" .. Lore_Stutterfrequency .."%)");
		else			
			Lore_Text_Percent:SetText("N/A");
		end
		return Lore_EffectTable[Lore_Effect + 1]
	elseif ( event == "StutterFreq" ) then
		Lore_Stutterfrequency = value;
		return Lore_Stutterfrequency
	elseif ( event == "SelfTranslate" ) then
		Lore_Self = 1 - Lore_Self;
		return Lore_SettingsClickOptions[Lore_Self]
	elseif ( event == "AutoTranslate" ) then
		if (Lore_Autotrans == 0) then Lore_Autotrans = -1; else Lore_Autotrans = 0; end
		return Lore_SettingsClickOptions[Lore_Autotrans]
	elseif ( event == "CommandFeedback" ) then
		Lore_Inform = 1 - Lore_Inform;
		return Lore_SettingsClickOptions[Lore_Inform]
	elseif ( event == "MassTranslate" ) then
		Lore_To = Lore_To + 1;
		if (Lore_To > 3) then Lore_To = 0; end
		return Lore_SettingsMassTable[Lore_To + 1]
	elseif ( event == "Interpreter" ) then
		if (value ~= nil) and (value ~="") then
			local n = table.getn( Lore_Interpreter );
			local index = 0;
			local s = string.gsub( value, '([%a+])[%s.*]', '%1' );
			s = string.upper( strsub( s, 1, 1 ) ) .. string.lower( strsub( s, 2 ) );

			-- Find the interpreter if he/she already exists
			for i = 1, n, 1 do
				if ( Lore_Interpreter[i] == s ) then
					index = i;
				end
			end
			if ( index == 0 ) then
				table.insert( Lore_Interpreter, s );
				Lore_msg( "translator added: " .. s );
			else
				--Print( "Removing at index " .. n );
				table.remove( Lore_Interpreter, index );
				Lore_msg( "translator removed: " .. s );
			end
		end
		return "Add/Rem"
	elseif ( event == "Fluency" ) then
		if (value ~= nil) and (value ~="") then
			Lore_AlterTablet( string.lower(value), 1 );
		end
		return "Add/Rem"
	end

end

function Lore_UpdateSliderValue(event,value)
	if ( event == "StutterFreq" ) then
		if (Lore_Effect == 1) then
			Lore_Text_Percent:SetText("(" .. value .. "%)");
		end
	elseif ( event == "Skill" ) then
		Lore_Text_Skill:SetText(value .. "%");
	elseif ( event == "SkillModifier" ) then
		if (value > 0) then
			Lore_Text_SkillModifier:SetText("+" .. value .. "%");
		else
			Lore_Text_SkillModifier:SetText(value .. "%");
		end
	end
end

function Lore_RunSelfTest()
	Lore_Text_SelfTest:SetText("Self-test: Stage 1 - Sending ST request\nFailed: Chan missing / msg not recog.");
	Lore_Text_SelfTest:SetTextColor(1.0, 0.1, 0.1);
	Lore_SendChatMessage( "LORE::ST::" .. Lore_Name , "CHANNEL", GetDefaultLanguage(), GetChannelName( "xtensionxtooltip2" ) );
end

-- OnShow
function LoreSettingsFrame_OnShow()
	getglobal(this:GetName().."LoreCheckButtonLockTablet"):SetChecked( Lore_Locked );
	getglobal(this:GetName().."LoreCheckButtonTabletVisible"):SetChecked( 1 - Lore_Visible );
	getglobal(this:GetName().."LoreCheckButtonSelfTranslate"):SetChecked( Lore_Self );
	getglobal(this:GetName().."LoreCheckButtonInform"):SetChecked( Lore_Inform );
	getglobal(this:GetName().."LoreCheckButtonScreening"):SetChecked( Lore_Screen );

	getglobal(this:GetName().."LoreLeftClickButton"):SetText( Lore_SettingsClickOptions[Lore_Left + 1] );
	getglobal(this:GetName().."LoreRightClickButton"):SetText( Lore_SettingsClickOptions[Lore_Right + 1] );
	getglobal(this:GetName().."LoreTabletPosition"):SetText( Lore_TabposTable[Lore_Tabletposition + 1] );
	getglobal(this:GetName().."LoreTextureButton"):SetText( Lore_SettingsTextures[Lore_ButtonTexture] );
	getglobal(this:GetName().."LoreEffectButton"):SetText( Lore_EffectTable[Lore_Effect + 1] );
	getglobal(this:GetName().."LoreMassTranslation"):SetText( Lore_SettingsMassTable[Lore_To + 1] );
	getglobal(this:GetName().."LoreSelfTestButton"):SetText( "Run Self-test" );
	getglobal(this:GetName().."LoreFluencyButton"):SetText( "Add/Rem" );
	getglobal(this:GetName().."LoreInterpreterButton"):SetText( "Add/Rem" );


	if (Lore_Autotrans == 0) then
		getglobal(this:GetName().."LoreCheckButtonAutoTranslate"):SetChecked( 1 );
	else
		getglobal(this:GetName().."LoreCheckButtonAutoTranslate"):SetChecked( 0 );
	end

	getglobal(this:GetName().."LoreSliderStutter"):SetValue( Lore_Stutterfrequency );
	if (Lore_Effect == 1) then
		Lore_Text_Percent:SetText("(" .. Lore_Stutterfrequency .."%)");
	else			
		Lore_Text_Percent:SetText("N/A");
	end

	getglobal(this:GetName().."LoreSliderSkill"):SetValue( 100 );
	Lore_Text_Skill:SetText("100%");

	Lore_Text_Version:SetText("Lore version: " .. Lore_Version);
	Lore_Text_Version:SetTextColor(0.5, 0.5, 1.0);

	Lore_TypedInterpreter = "";
	Lore_TypedFluency = "";
	Lore_SelectedSkill = 100;

	getglobal(this:GetName().."LoreSliderSkillAdjust"):SetValue( Lore_SelectedSkillModifier );
	if (Lore_SelectedSkillModifier > 0) then
		Lore_Text_SkillModifier:SetText("+" .. Lore_SelectedSkillModifier .. "%");
	else
		Lore_Text_SkillModifier:SetText(Lore_SelectedSkillModifier .. "%");
	end
end

function Lore_JoinChannel()
	JoinChannelByName("xtensionxtooltip2")
	RemoveChatWindowChannel(1, "xtensionxtooltip2")
end