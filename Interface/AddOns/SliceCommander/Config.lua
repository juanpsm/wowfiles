-- Author      : Administrator
-- Create Date : 9/12/2008 9:43:03 PM
SliceCmdr_Save = { 
	['HideEnergy'] = false,
	['IsLocked'] = false,
	['HideCombo'] = false,
	['Energy1'] = 25,
	['Energy2'] = 40,
	['EnergyTrans'] = 20,
	['EnergyHeight'] = 20,
	['TimerHeight'] = 10,
	['BarTexture'] = 'Smooth',
	['Fail'] = 'Waaaah',
	['Expire'] = 'BassDrum',
	['Tick3'] = 'Tambourine',
	['Tick2'] = 'Tambourine',
	['Tick1'] = 'Tambourine',
	['Applied'] = 'SliceClick',
	['Apply3'] = 'High Hat 4',
	['Apply2'] = 'BoomBoomClap',
	['Apply1'] = 'Marching Band',
	['EnergySound1'] = 'None',
	['EnergySound2'] = 'None',
	['HfB.Fail'] = 'Waaaah',
	['HfB.Expire'] = 'BassDrum',
	['HfB.Applied'] = 'Tambourine',
	['HfB.Refresh3'] = 'Tambourine',
	['HfB.Refresh2'] = 'Tambourine',
	['HfB.Refresh1'] = 'Tambourine',
	['HfB.Tick'] = 'Tambourine',
	['Scale'] = 100,
	['Width'] = 200,
	['BarMargin'] = 1,
	['DPBarShow'] = true,
	['EABarShow'] = true,
	['RupBarShow'] = true,
	['RupBarMine'] = false,
	['CPBarShow'] = false,
	['PadLatency'] = true,
	['SpellText'] = true,
	['SoundCombat'] = true,
};

function SliceCmdr_Config_OnEvent(self, event, ...)
	if (event == "ADDON_LOADED") then
		local arg1 = select(1, ...);
		if (arg1 == "SliceCommander") then
			SliceCmdr_Config_LoadVars();
		end
	end	
end


function SliceCmdr_Config_Menu_OnClick(self) -- See note 1
	UIDropDownMenu_SetSelectedValue(self.owner, self.value);
	SliceCmdr_SoundTest(self.value);
end

function SliceCmdr_Config_Menu_OnClickTexture(self) -- See note 1
	UIDropDownMenu_SetSelectedValue(self.owner, self.value);
	
end

function SliceCmdr_Config_Expire_Initialise()	SliceCmdr_Config_SoundMenu_Init("Fail");	end
function SliceCmdr_Config_Fail_Initialise()		SliceCmdr_Config_SoundMenu_Init("Fail");	end
function SliceCmdr_Config_Tick_Initialise()		SliceCmdr_Config_SoundMenu_Init("Tick");	end
function SliceCmdr_Config_Apply_Initialise()	SliceCmdr_Config_SoundMenu_Init("Apply");	end
function SliceCmdr_Config_Energy_Initialise()	SliceCmdr_Config_SoundMenu_Init("Energy");	end

function SliceCmdr_Config_Texture_Initialise() 
    level = level or 1 --drop down menus can have sub menus. The value of "level" determines the drop down sub menu tier.
	 
	local info = UIDropDownMenu_CreateInfo();
	local key, value;
	
	for key, value in pairs(SliceCmdr_BarTextures) do        
		info.text = key;
		info.value = key; 
		info.func = function(self) SliceCmdr_Config_Menu_OnClickTexture(self) end; --sets the function to execute when this item is clicked
		info.owner = this:GetParent(); --binds the drop down menu as the parent of the menu item. This is very important for dynamic drop down menues.
		info.checked = nil; --initially set the menu item to being unchecked with a yellow tick
		info.icon = nil; --we can use this to set an icon for the drop down menu item to accompany the text
		UIDropDownMenu_AddButton(info, level); --Adds the new button to the drop down menu specified in the UIDropDownMenu_Initialise function. In this case, it's MyDropDownMenu
	end

end

function SliceCmdr_Config_SoundMenu_Init(WhichMenu) 
	 level = level or 1 --drop down menus can have sub menus. The value of "level" determines the drop down sub menu tier.
	 
	local info = UIDropDownMenu_CreateInfo();
	local SoundName, SoundPath;
	
	for ignore, SoundName in pairs(SliceCmdr_SoundMenu[WhichMenu]) do        
		info.text = SoundName;
		info.value = SoundName; 
		info.func = function(self) SliceCmdr_Config_Menu_OnClick(self) end; --sets the function to execute when this item is clicked
		info.owner = this:GetParent(); --binds the drop down menu as the parent of the menu item. This is very important for dynamic drop down menues.
		info.checked = nil; --initially set the menu item to being unchecked with a yellow tick
		info.icon = nil; --we can use this to set an icon for the drop down menu item to accompany the text
		UIDropDownMenu_AddButton(info, level); --Adds the new button to the drop down menu specified in the UIDropDownMenu_Initialise function. In this case, it's MyDropDownMenu
	end

end

SliceCmdr_Config_FailMenu = nil;
SliceCmdr_Config_ExpireMenu = nil;
SliceCmdr_Config_Tick3Menu = nil;
SliceCmdr_Config_Tick2Menu = nil;
SliceCmdr_Config_Tick1Menu = nil;
SliceCmdr_Config_Applied3Menu = nil;
SliceCmdr_Config_Applied2Menu = nil;
SliceCmdr_Config_Applied1Menu = nil;
SliceCmdr_Config_AppliedMenu = nil;
SliceCmdr_Config_Energy2Menu = nil;
SliceCmdr_Config_Energy1Menu = nil;

SliceCmdr_Config_HfB_AlertMenu = nil;
SliceCmdr_Config_HfB_ExpireMenu = nil;
SliceCmdr_Config_HfB_FailMenu = nil;
SliceCmdr_Config_HfB_AppliedMenu = nil;
SliceCmdr_Config_HfB_Refresh3Menu = nil;
SliceCmdr_Config_HfB_Refresh2Menu = nil;
SliceCmdr_Config_HfB_Refresh1Menu = nil;

SliceCmdr_Config_BarTextureMenu = nil;


function SliceCmdr_Config_OnLoad(panel)
    SliceCmdr_Config:SetBackdrop(nil);
    SliceCmdr_Config2:SetBackdrop(nil);
    
    this:RegisterEvent("ADDON_LOADED");
	
	
	SliceCmdr_Config_BarTextureMenu = CreateFrame("Frame", "SliceCmdr_Config_BarTexture2M", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_BarTextureMenu:SetPoint("TOPLEFT", SliceCmdr_Config_BarTextureStr, "TOPLEFT", 25, 0);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_BarTextureMenu, 100);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_BarTextureMenu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_BarTextureMenu, SliceCmdr_Config_Texture_Initialise);

    panel.name = "SliceCommander";
    panel.okay = function (self) SliceCmdr_Config_Okay(); end;
    panel.cancel = function (self)  SliceCmdr_Config_Cancel();  end;
	panel.default = function (self) SliceCmdr_Config_Default(); end;
    InterfaceOptions_AddCategory(panel);
    
    --- COMBO POINT FRAME ---
    panel = SliceCmdr_Config_CPFrame
    panel:SetBackdrop(nil);
    panel.parent= "SliceCommander";
	panel.name= SC_LANG_CP;
	panel.okay = function (self) SliceCmdr_Config_Okay(); end;
    panel.cancel = function (self)  SliceCmdr_Config_Cancel();  end;
	panel.default = function (self) SliceCmdr_Config_Default(); end;
	InterfaceOptions_AddCategory(panel);

    --- RUPTURE FRAME ---
    panel = SliceCmdr_Config_RupFrame
    panel:SetBackdrop(nil);
    panel.parent= "SliceCommander";
	panel.name= SC_SPELL_RUP;
	panel.okay = function (self) SliceCmdr_Config_Okay(); end;
    panel.cancel = function (self)  SliceCmdr_Config_Cancel();  end;
	panel.default = function (self) SliceCmdr_Config_Default(); end;
	InterfaceOptions_AddCategory(panel);
	
	--- DEADLY POISON FRAME ---
    panel = SliceCmdr_Config_DPFrame
    panel:SetBackdrop(nil);
    panel.parent= "SliceCommander";
	panel.name= SC_SPELL_DP;
	panel.okay = function (self) SliceCmdr_Config_Okay(); end;
    panel.cancel = function (self)  SliceCmdr_Config_Cancel();  end;
	panel.default = function (self) SliceCmdr_Config_Default(); end;
	InterfaceOptions_AddCategory(panel);
	
	--- EXPOSE ARMOR FRAME ---
    panel = SliceCmdr_Config_EAFrame
    panel:SetBackdrop(nil);
    panel.parent= "SliceCommander";
	panel.name= SC_SPELL_EA;
	panel.okay = function (self) SliceCmdr_Config_Okay(); end;
    panel.cancel = function (self)  SliceCmdr_Config_Cancel();  end;
	panel.default = function (self) SliceCmdr_Config_Default(); end;
	InterfaceOptions_AddCategory(panel);
	
    --- ENERGY FRAME ---
	panel = SliceCmdr_Config_EnergyFrame;
	panel:SetBackdrop(nil);

	SliceCmdr_Config_Energy1Menu = CreateFrame("Frame", "SliceCmdr_Config_Energy1M", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_Energy1Menu:SetPoint("TOPLEFT", SliceCmdr_Config_Energy1, "TOPLEFT", 0, -20);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_Energy1Menu, 142);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_Energy1Menu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_Energy1Menu, SliceCmdr_Config_Energy_Initialise);

	SliceCmdr_Config_Energy2Menu = CreateFrame("Frame", "SliceCmdr_Config_Energy2M", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_Energy2Menu:SetPoint("TOPLEFT", SliceCmdr_Config_Energy2, "TOPLEFT", 0, -20);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_Energy2Menu, 142);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_Energy2Menu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_Energy2Menu, SliceCmdr_Config_Energy_Initialise);
	
    panel.parent= "SliceCommander";
	panel.name= "Energy";
	panel.okay = function (self) SliceCmdr_Config_Okay(); end;
    panel.cancel = function (self)  SliceCmdr_Config_Cancel();  end;
	panel.default = function (self) SliceCmdr_Config_Default(); end;
	InterfaceOptions_AddCategory(panel);
	
    --- SLICE AND DICE CONFIG ---
    panel = SliceCmdr_Config2;
    
	SliceCmdr_Config_FailMenu = CreateFrame("Frame", "SliceCmdr_Config_Fail", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_FailMenu:SetPoint("TOPLEFT", SliceCmdr_Config_FailStr, "TOPLEFT", 0, -20);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_FailMenu, 142);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_FailMenu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_FailMenu, SliceCmdr_Config_Fail_Initialise);

	SliceCmdr_Config_ExpireMenu = CreateFrame("Frame", "SliceCmdr_Config_Expire", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_ExpireMenu:SetPoint("TOPLEFT", SliceCmdr_Config_ExpireStr, "TOPLEFT", 0, -20);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_ExpireMenu, 142);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_ExpireMenu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_ExpireMenu, SliceCmdr_Config_Expire_Initialise);

	SliceCmdr_Config_Tick1Menu = CreateFrame("Frame", "SliceCmdr_Config_Tick1", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_Tick1Menu:SetPoint("TOPLEFT", SliceCmdr_Config_Tick1Str, "TOPLEFT", 0, -20);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_Tick1Menu, 142);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_Tick1Menu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_Tick1Menu, SliceCmdr_Config_Tick_Initialise);

	SliceCmdr_Config_Tick2Menu = CreateFrame("Frame", "SliceCmdr_Config_Tick2", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_Tick2Menu:SetPoint("TOPLEFT", SliceCmdr_Config_Tick2Str, "TOPLEFT", 0, -20);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_Tick2Menu, 142);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_Tick2Menu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_Tick2Menu, SliceCmdr_Config_Tick_Initialise);

	SliceCmdr_Config_Tick3Menu = CreateFrame("Frame", "SliceCmdr_Config_Tick3", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_Tick3Menu:SetPoint("TOPLEFT", SliceCmdr_Config_Tick3Str, "TOPLEFT", 0, -20);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_Tick3Menu, 142);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_Tick3Menu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_Tick3Menu, SliceCmdr_Config_Tick_Initialise);

	SliceCmdr_Config_Applied1Menu = CreateFrame("Frame", "SliceCmdr_Config_Applied1", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_Applied1Menu:SetPoint("TOPLEFT", SliceCmdr_Config_Applied1Str, "TOPLEFT", 0, -20);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_Applied1Menu, 142);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_Applied1Menu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_Applied1Menu, SliceCmdr_Config_Apply_Initialise);

	SliceCmdr_Config_Applied2Menu = CreateFrame("Frame", "SliceCmdr_Config_Applied2", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_Applied2Menu:SetPoint("TOPLEFT", SliceCmdr_Config_Applied2Str, "TOPLEFT", 0, -20);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_Applied2Menu, 142);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_Applied2Menu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_Applied2Menu, SliceCmdr_Config_Apply_Initialise);
	
	SliceCmdr_Config_Applied3Menu = CreateFrame("Frame", "SliceCmdr_Config_Applied3", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_Applied3Menu:SetPoint("TOPLEFT", SliceCmdr_Config_Applied3Str, "TOPLEFT", 0, -20);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_Applied3Menu, 142);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_Applied3Menu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_Applied3Menu, SliceCmdr_Config_Apply_Initialise);
	
	SliceCmdr_Config_AppliedMenu = CreateFrame("Frame", "SliceCmdr_Config_Applied", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_AppliedMenu:SetPoint("TOPLEFT", SliceCmdr_Config_AppliedStr, "TOPLEFT", 0, -20);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_AppliedMenu, 142);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_AppliedMenu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_AppliedMenu, SliceCmdr_Config_Apply_Initialise);
	
    SliceCmdr_Config2.parent = "SliceCommander";
	SliceCmdr_Config2.name = SC_SPELL_SND;
    SliceCmdr_Config2.okay = function (self) SliceCmdr_Config_Okay(); end;
    SliceCmdr_Config2.cancel = function (self)  SliceCmdr_Config_Cancel();  end;
	SliceCmdr_Config2.default = function (self) SliceCmdr_Config_Default(); end;
	InterfaceOptions_AddCategory(SliceCmdr_Config2);
	
	--- HUNGER FOR BLOOD ---
	SliceCmdr_Config3:SetBackdrop(nil);
	panel = SliceCmdr_Config3;	    
	
	SliceCmdr_Config_HfB_FailMenu = CreateFrame("Frame", "SliceCmdr_Config_HfB_Fail", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_HfB_FailMenu:SetPoint("TOPLEFT", SliceCmdr_Config_HfB_FailureStr, "TOPLEFT", 0, -20);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_HfB_FailMenu, 142);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_HfB_FailMenu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_HfB_FailMenu, SliceCmdr_Config_Fail_Initialise);

	SliceCmdr_Config_HfB_ExpireMenu = CreateFrame("Frame", "SliceCmdr_Config_HfB_Expire", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_HfB_ExpireMenu:SetPoint("TOPLEFT", SliceCmdr_Config_HfB_ExpireStr, "TOPLEFT", 0, -20);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_HfB_ExpireMenu, 142);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_HfB_ExpireMenu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_HfB_ExpireMenu, SliceCmdr_Config_Expire_Initialise);

	SliceCmdr_Config_HfB_Refresh1Menu = CreateFrame("Frame", "SliceCmdr_Config_HfB_Refresh1", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_HfB_Refresh1Menu:SetPoint("TOPLEFT", SliceCmdr_Config_HfB_Refresh1Str, "TOPLEFT", 0, -20);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_HfB_Refresh1Menu, 142);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_HfB_Refresh1Menu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_HfB_Refresh1Menu, SliceCmdr_Config_Apply_Initialise);

	SliceCmdr_Config_HfB_Refresh2Menu = CreateFrame("Frame", "SliceCmdr_Config_HfB_Refresh2", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_HfB_Refresh2Menu:SetPoint("TOPLEFT", SliceCmdr_Config_HfB_Refresh2Str, "TOPLEFT", 0, -20);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_HfB_Refresh2Menu, 142);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_HfB_Refresh2Menu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_HfB_Refresh2Menu, SliceCmdr_Config_Apply_Initialise);

	SliceCmdr_Config_HfB_Refresh3Menu = CreateFrame("Frame", "SliceCmdr_Config_HfB_Refresh3", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_HfB_Refresh3Menu:SetPoint("TOPLEFT", SliceCmdr_Config_HfB_Refresh3Str, "TOPLEFT", 0, -20);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_HfB_Refresh3Menu, 142);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_HfB_Refresh3Menu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_HfB_Refresh3Menu, SliceCmdr_Config_Apply_Initialise);
	
	SliceCmdr_Config_HfB_AppliedMenu = CreateFrame("Frame", "SliceCmdr_Config_HfB_Refresh", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_HfB_AppliedMenu:SetPoint("TOPLEFT", SliceCmdr_Config_HfB_AppliedStr, "TOPLEFT", 0, -20);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_HfB_AppliedMenu, 142);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_HfB_AppliedMenu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_HfB_AppliedMenu, SliceCmdr_Config_Apply_Initialise);

	SliceCmdr_Config_HfB_AlertMenu = CreateFrame("Frame", "SliceCmdr_Config_HfB_Alert", panel, "UIDropDownMenuTemplate");
	SliceCmdr_Config_HfB_AlertMenu:SetPoint("TOPLEFT", SliceCmdr_Config_HfB_AlertStr, "TOPLEFT", 0, -20);
	UIDropDownMenu_SetWidth(SliceCmdr_Config_HfB_AlertMenu, 142);
	UIDropDownMenu_SetButtonWidth(SliceCmdr_Config_HfB_AlertMenu, 20);
	UIDropDownMenu_Initialize(SliceCmdr_Config_HfB_AlertMenu, SliceCmdr_Config_Tick_Initialise);

	SliceCmdr_Config3.parent = "SliceCommander";
	SliceCmdr_Config3.name = SC_SPELL_HFB;
    SliceCmdr_Config3.okay = function (self) SliceCmdr_Config_Okay(); end;
    SliceCmdr_Config3.cancel = function (self)  SliceCmdr_Config_Cancel();  end;
	SliceCmdr_Config3.default = function (self) SliceCmdr_Config_Default(); end;
	InterfaceOptions_AddCategory(SliceCmdr_Config3);
	
	SliceCmdr_Config3_Caption:SetText( SC_SPELL_HFB .. " " .. SC_LANG_SETTINGS);
	SliceCmdr_Config2_Caption:SetText( SC_SPELL_SND .. " " .. SC_LANG_SETTINGS);
end

function SliceCmdr_Config_LoadVars() 
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_FailMenu, SliceCmdr_Save.Fail );
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_ExpireMenu, SliceCmdr_Save.Expire );
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_Tick3Menu, SliceCmdr_Save.Tick3 );
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_Tick2Menu, SliceCmdr_Save.Tick2 );
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_Tick1Menu, SliceCmdr_Save.Tick1 );
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_Applied3Menu, SliceCmdr_Save.Apply3 );
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_Applied2Menu, SliceCmdr_Save.Apply2 );
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_Applied1Menu, SliceCmdr_Save.Apply1 );
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_AppliedMenu,  SliceCmdr_Save.Applied );
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_Energy2Menu, SliceCmdr_Save.EnergySound2 );
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_Energy1Menu, SliceCmdr_Save.EnergySound1 );
	
	-- hunger for blood --
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_HfB_AlertMenu, SliceCmdr_Save['HfB.Alert'] );
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_HfB_ExpireMenu, SliceCmdr_Save['HfB.Expire'] );
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_HfB_FailMenu,		SliceCmdr_Save['HfB.Fail'] );
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_HfB_AppliedMenu,	SliceCmdr_Save['HfB.Applied'] );
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_HfB_Refresh3Menu,	SliceCmdr_Save['HfB.Refresh3'] );
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_HfB_Refresh2Menu,	SliceCmdr_Save['HfB.Refresh2'] );
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_HfB_Refresh1Menu,	SliceCmdr_Save['HfB.Refresh1'] );
	
	UIDropDownMenu_SetSelectedValue(SliceCmdr_Config_BarTextureMenu, SliceCmdr_Save.BarTexture);
	
	SliceCmdr_Config_HideE:SetChecked( SliceCmdr_Save.HideEnergy );
	SliceCmdr_Config_Lock:SetChecked( SliceCmdr_Save.IsLocked );
	SliceCmdr_Config_PadLatency:SetChecked( SliceCmdr_Save.PadLatency );
	SliceCmdr_Config_SpellText:SetChecked( SliceCmdr_Save.SpellText );
	SliceCmdr_Config_SoundCombat:SetChecked( SliceCmdr_Save.SoundCombat );
	SliceCmdr_Config_Energy1:SetValue( SliceCmdr_Save.Energy1 );
	SliceCmdr_Config_Energy1V:SetText( SliceCmdr_Save.Energy1 );
	SliceCmdr_Config_Energy2:SetValue( SliceCmdr_Save.Energy2 );
	SliceCmdr_Config_Energy2V:SetText( SliceCmdr_Save.Energy2 );
	SliceCmdr_Config_Scale:SetValue( SliceCmdr_Save.Scale );
	SliceCmdr_Config_ScaleV:SetText( SliceCmdr_Save.Scale );
	if (not SliceCmdr_Save.BarMargin) then
		SliceCmdr_Save.BarMargin = 0;
	end
	SliceCmdr_Config_BarMargin:SetText(SliceCmdr_Save.BarMargin);
	
	SliceCmdr_Config_ShowRupBar:SetChecked( SliceCmdr_Save.RupBarShow );
	SliceCmdr_Config_ShowMineRup:SetChecked( SliceCmdr_Save.RupBarMine );
	SliceCmdr_Config_ShowDPBar:SetChecked( SliceCmdr_Save.DPBarShow );
	SliceCmdr_Config_ShowEABar:SetChecked( SliceCmdr_Save.EABarShow );
	SliceCmdr_Config_ShowCPBar:SetChecked( SliceCmdr_Save.CPBarShow );
	
	if ( not SliceCmdr_Save.EnergyTrans) then
		SliceCmdr_Save.EnergyTrans = 20;
	end	
	SliceCmdr_Config_TransFull:SetValue(SliceCmdr_Save.EnergyTrans);
	SliceCmdr_Config_TransFullV:SetText(SliceCmdr_Save.EnergyTrans);
	
  	if ( not SliceCmdr_Save.Width ) then
		SliceCmdr_Save.Width = 200;
	end	
	SliceCmdr_Config_Width:SetValue( SliceCmdr_Save.Width );
	SliceCmdr_Config_WidthV:SetText( SliceCmdr_Save.Width );
	
  	if ( not SliceCmdr_Save.TimerHeight ) then
		SliceCmdr_Save.TimerHeight = 10;
	end	
	SliceCmdr_Config_TimerHeight:SetValue( SliceCmdr_Save.TimerHeight );
	SliceCmdr_Config_TimerHeightV:SetText( SliceCmdr_Save.TimerHeight );
	
  	if ( not SliceCmdr_Save.EnergyHeight ) then
		SliceCmdr_Save.EnergyHeight = 20;
	end	
	SliceCmdr_Config_EnergyHeight:SetValue( SliceCmdr_Save.EnergyHeight );
	SliceCmdr_Config_EnergyHeightV:SetText( SliceCmdr_Save.EnergyHeight );
	
	SliceCmdr_Config_VarsChanged();
	SliceCmdr_Config_OtherVars();
end

function SliceCmdr_SetScale(NewScale) 
	if (NewScale >= 50) then
		SliceCmdr:SetScale ( NewScale / 100 );
		if (SLICECMDR.BARS['HfB']['obj']) then
			SLICECMDR.BARS['HfB']['obj']:SetScale ( NewScale / 100 );
		end
		if (SLICECMDR.BARS['Rup']['obj']) then
			SLICECMDR.BARS['Rup']['obj']:SetScale ( NewScale / 100 );
		end
		if (SLICECMDR.BARS['CP']['obj']) then
			SLICECMDR.BARS['CP']['obj']:SetScale ( NewScale / 100 );
		end
		if (SLICECMDR.BARS['DP']['obj']) then
			SLICECMDR.BARS['DP']['obj']:SetScale ( NewScale / 100 );
		end
		if (SLICECMDR.BARS['SnD']['obj']) then
			SLICECMDR.BARS['SnD']['obj']:SetScale ( NewScale / 100 );
		end
		SLICECMDR.BARS['ToT']['obj']:SetScale ( NewScale / 100 );
		SLICECMDR.BARS['EA']['obj']:SetScale ( NewScale / 100 );
	end
end

function SliceCmdr_SetWidth(w) 
	if (w >= 25) then
		VTimerEnergy:SetWidth( w );
		if (SLICECMDR.BARS['HfB']['obj']) then
			SLICECMDR.BARS['HfB']['obj']:SetWidth( w - SliceCmdr_Save.TimerHeight );
		end
		if (SLICECMDR.BARS['CP']['obj']) then
			SLICECMDR.BARS['CP']['obj']:SetWidth( w );
			cx = 0
			width = ((w-(2*4))/5);
			for i = 1, 5 do
				SLICECMDR.BARS['CP']['obj'].combos[i]:ClearAllPoints()
				SLICECMDR.BARS['CP']['obj'].combos[i]:SetPoint("TOPLEFT", SLICECMDR.BARS['CP']['obj'], "TOPLEFT", cx, 0)
				SLICECMDR.BARS['CP']['obj'].combos[i]:SetPoint("BOTTOMRIGHT", SLICECMDR.BARS['CP']['obj'], "BOTTOMLEFT", cx + width , 0)
				cx = cx + width + 2
			end
		end
		if (SLICECMDR.BARS['Rup']['obj']) then
			SLICECMDR.BARS['Rup']['obj']:SetWidth( w - SliceCmdr_Save.TimerHeight );
		end
		if (SLICECMDR.BARS['DP']['obj']) then
			SLICECMDR.BARS['DP']['obj']:SetWidth(  w - SliceCmdr_Save.TimerHeight );
		end
		if (SLICECMDR.BARS['SnD']['obj']) then
			SLICECMDR.BARS['SnD']['obj']:SetWidth(  w - SliceCmdr_Save.TimerHeight );
		end
		SLICECMDR.BARS['ToT']['obj']:SetWidth(  w - SliceCmdr_Save.TimerHeight );
		SLICECMDR.BARS['EA']['obj']:SetWidth(  w - SliceCmdr_Save.TimerHeight );
		SliceCmdr_Spark1:SetPoint("TOPLEFT", VTimerEnergy, "TOPLEFT", (SliceCmdr_Save.Energy1 / UnitManaMax("player") * w), 0);
		SliceCmdr_Spark2:SetPoint("TOPLEFT", VTimerEnergy, "TOPLEFT", (SliceCmdr_Save.Energy2 / UnitManaMax("player") * w), 0);
	end
end

function SliceCmdr_SetEnergyHeight(w) 
	if (w >= 1) then
		VTimerEnergy:SetHeight( w );
		VTimerEnergyTxt:SetHeight( w );
		SliceCmdr_Combo:SetHeight( w );
		SliceCmdr_Spark1:SetHeight( w );
		SliceCmdr_Spark2:SetHeight( w );
	end
end

function SliceCmdr_SetTimerHeight(w) 
	if (w >= 1) then
		if (SLICECMDR.BARS['HfB']['obj']) then
			SLICECMDR.BARS['HfB']['obj']:SetHeight( w );
			SLICECMDR.BARS['HfB']['obj'].text:SetHeight( w );
			SLICECMDR.BARS['HfB']['obj'].text2:SetHeight( w );
			SLICECMDR.BARS['HfB']['obj'].icon:SetHeight( w );
			SLICECMDR.BARS['HfB']['obj'].icon:SetWidth( w );
			SLICECMDR.BARS['HfB']['obj'].text2:SetPoint("TOPLEFT", SLICECMDR.BARS['HfB']['obj'], "TOPLEFT", SLICECMDR.BARS['HfB']['obj'].icon:GetHeight(), 0);
		end
		if (SLICECMDR.BARS['Rup']['obj']) then
			SLICECMDR.BARS['Rup']['obj']:SetHeight( w );
			SLICECMDR.BARS['Rup']['obj'].text:SetHeight( w );
			SLICECMDR.BARS['Rup']['obj'].text2:SetHeight( w );
			SLICECMDR.BARS['Rup']['obj'].icon:SetHeight( w );
			SLICECMDR.BARS['Rup']['obj'].icon:SetWidth( w );
			SLICECMDR.BARS['Rup']['obj'].text2:SetPoint("TOPLEFT", SLICECMDR.BARS['Rup']['obj'], "TOPLEFT", SLICECMDR.BARS['Rup']['obj'].icon:GetHeight(), 0);
		end
		if (SLICECMDR.BARS['DP']['obj']) then
			SLICECMDR.BARS['DP']['obj']:SetHeight( w );
			SLICECMDR.BARS['DP']['obj'].text:SetHeight( w );
			SLICECMDR.BARS['DP']['obj'].text2:SetHeight( w );
			SLICECMDR.BARS['DP']['obj'].icon:SetHeight( w );
			SLICECMDR.BARS['DP']['obj'].icon:SetWidth( w );
			SLICECMDR.BARS['DP']['obj'].text2:SetPoint("TOPLEFT", SLICECMDR.BARS['DP']['obj'], "TOPLEFT", SLICECMDR.BARS['DP']['obj'].icon:GetHeight(), 0);
		end
		if (SLICECMDR.BARS['SnD']['obj']) then
			SLICECMDR.BARS['SnD']['obj']:SetHeight( w );
			SLICECMDR.BARS['SnD']['obj'].text:SetHeight( w );
			SLICECMDR.BARS['SnD']['obj'].text2:SetHeight( w );
			SLICECMDR.BARS['SnD']['obj'].icon:SetHeight( w );
			SLICECMDR.BARS['SnD']['obj'].icon:SetWidth( w );
			SLICECMDR.BARS['SnD']['obj'].text2:SetPoint("TOPLEFT", SLICECMDR.BARS['SnD']['obj'], "TOPLEFT", SLICECMDR.BARS['SnD']['obj'].icon:GetHeight(), 0);
		end
		
		if(SLICECMDR.BARS['CP']['obj']) then
			SLICECMDR.BARS['CP']['obj']:SetHeight( w );
			SLICECMDR.BARS['CP']['obj'].comboText:SetHeight( w );
			for i = 1, 5 do
				SLICECMDR.BARS['CP']['obj'].combos[i]:SetHeight(w-2)
			end
		end
		
		SLICECMDR.BARS['ToT']['obj']:SetHeight( w );
		SLICECMDR.BARS['ToT']['obj'].text:SetHeight( w );
		SLICECMDR.BARS['ToT']['obj'].text2:SetHeight( w );
		SLICECMDR.BARS['ToT']['obj'].icon:SetHeight( w );
		SLICECMDR.BARS['ToT']['obj'].icon:SetWidth( w );
		SLICECMDR.BARS['ToT']['obj'].text2:SetPoint("TOPLEFT", SLICECMDR.BARS['ToT']['obj'], "TOPLEFT", SLICECMDR.BARS['ToT']['obj'].icon:GetHeight(), 0);
		
		SLICECMDR.BARS['EA']['obj']:SetHeight( w );
		SLICECMDR.BARS['EA']['obj'].text:SetHeight( w );
		SLICECMDR.BARS['EA']['obj'].text2:SetHeight( w );
		SLICECMDR.BARS['EA']['obj'].icon:SetHeight( w );
		SLICECMDR.BARS['EA']['obj'].icon:SetWidth( w );
		SLICECMDR.BARS['EA']['obj'].text2:SetPoint("TOPLEFT", SLICECMDR.BARS['EA']['obj'], "TOPLEFT", SLICECMDR.BARS['EA']['obj'].icon:GetHeight(), 0);
		
		SLICECMDR.BarFont2:SetFont("Fonts\\FRIZQT__.TTF", w-2)
	end
end

function SliceCmdr_Config_VarsChanged()
	SliceCmdr_SetScale(SliceCmdr_Save.Scale); 		
	SliceCmdr_SetWidth(SliceCmdr_Save.Width);
	SliceCmdr_SetEnergyHeight(SliceCmdr_Save.EnergyHeight); 		
	SliceCmdr_SetTimerHeight(SliceCmdr_Save.TimerHeight);
		
	if (SliceCmdr_Save.HideEnergy == true) then
		VTimerEnergy:Hide();
	else
		VTimerEnergy:Show();
	end
	
	if (SliceCmdr_Save.HideCombo == true) then
		SliceCmdr_Combo:Hide();
		SliceCmdr:UnregisterEvent("UNIT_COMBO_POINTS");
		SliceCmdr:UnregisterEvent("PLAYER_TARGET_CHANGED");
	else
		SliceCmdr_Combo:Show();
		SliceCmdr:RegisterEvent("UNIT_COMBO_POINTS");
		SliceCmdr:RegisterEvent("PLAYER_TARGET_CHANGED");
	end
	
	if (SliceCmdr_Save.CPBarShow == true) then
		--SLICECMDR.BARS['CP']['obj']:Show();
	else
		SLICECMDR.BARS['CP']['obj']:Hide();		
	end
	
	SliceCmdr_Config_RetextureBars();
	SliceCmdr_Config_OtherVars();
end
function SliceCmdr_Config_RetextureBars() 
	local texture = SliceCmdr_BarTexture();
	
	VTimerEnergy:SetStatusBarTexture(texture);
	SLICECMDR.BARS['Rup']['obj']:SetStatusBarTexture(texture);
	SLICECMDR.BARS['DP']['obj']:SetStatusBarTexture(texture);
	SLICECMDR.BARS['ToT']['obj']:SetStatusBarTexture(texture);
	SLICECMDR.BARS['EA']['obj']:SetStatusBarTexture(texture);
	SLICECMDR.BARS['SnD']['obj']:SetStatusBarTexture(texture);
	SLICECMDR.BARS['HfB']['obj']:SetStatusBarTexture(texture);
	
	for i = 1, 5 do
		SLICECMDR.BARS['CP']['obj'].combos[i].bg:SetTexture("Interface\\AddOns\\SliceCommander\\Images\\solid.tga");
	end		
	
end


function SliceCmdr_Config_OtherVars()
	local p1 = SliceCmdr_Save.Energy1 / UnitManaMax("player") * SliceCmdr_Save.Width;
	local p2 = SliceCmdr_Save.Energy2 / UnitManaMax("player") * SliceCmdr_Save.Width;
	
	SliceCmdr_Spark1:SetPoint("TOPLEFT", VTimerEnergy, "TOPLEFT", p1, 0);
	SliceCmdr_Spark2:SetPoint("TOPLEFT", VTimerEnergy, "TOPLEFT", p2, 0);
end

function SliceCmdr_Config_Okay()
	if (SliceCmdr_Config_Lock:GetChecked()) then
		SliceCmdr_Save.IsLocked = true;
	else
		SliceCmdr_Save.IsLocked = false;
	end	
	if (SliceCmdr_Config_HideE:GetChecked()) then
		SliceCmdr_Save.HideEnergy = true;
	else
		SliceCmdr_Save.HideEnergy = false;
	end	
	if (SliceCmdr_Config_HideCombo:GetChecked()) then
		SliceCmdr_Save.HideCombo= true;
	else
		SliceCmdr_Save.HideCombo= false;
	end
	
	if (SliceCmdr_Config_PadLatency:GetChecked()) then
		SliceCmdr_Save.PadLatency= true;
	else
		SliceCmdr_Save.PadLatency= false;
	end
	
	if (SliceCmdr_Config_SpellText:GetChecked()) then
		SliceCmdr_Save.SpellText= true;
	else
		SliceCmdr_Save.SpellText= false;
	end
	
	if (SliceCmdr_Config_SoundCombat:GetChecked()) then
		SliceCmdr_Save.SoundCombat= true;
	else
		SliceCmdr_Save.SoundCombat= false;
	end

	if (SliceCmdr_Config_ShowDPBar:GetChecked()) then
		SliceCmdr_Save.DPBarShow= true;
	else 
		SliceCmdr_Save.DPBarShow= false;
	end
	
	if (SliceCmdr_Config_ShowEABar:GetChecked()) then
		SliceCmdr_Save.EABarShow= true;
	else 
		SliceCmdr_Save.EABarShow= false;
	end

	if (SliceCmdr_Config_ShowCPBar:GetChecked()) then
		SliceCmdr_Save.CPBarShow= true;
	else 
		SliceCmdr_Save.CPBarShow= false;
	end
	if (SliceCmdr_Config_ShowRupBar:GetChecked()) then
		SliceCmdr_Save.RupBarShow= true;
	else 
		SliceCmdr_Save.RupBarShow= false;
	end
	if (SliceCmdr_Config_ShowMineRup:GetChecked()) then
		SliceCmdr_Save.RupBarMine= true;
	else 
		SliceCmdr_Save.RupBarMine= false;
	end
	
	SliceCmdr_Save.Energy1 = SliceCmdr_Config_Energy1:GetValue();
	SliceCmdr_Save.Energy2 = SliceCmdr_Config_Energy2:GetValue();
	SliceCmdr_Save.Scale   = SliceCmdr_Config_Scale:GetValue();
	SliceCmdr_Save.Width   = SliceCmdr_Config_Width:GetValue();
	SliceCmdr_Save.EnergyHeight = SliceCmdr_Config_EnergyHeight:GetValue();
	SliceCmdr_Save.TimerHeight  = SliceCmdr_Config_TimerHeight:GetValue();
	SliceCmdr_Save.EnergyTrans = SliceCmdr_Config_TransFull:GetValue();
	SliceCmdr_Save.BarTexture  = UIDropDownMenu_GetSelectedValue( SliceCmdr_Config_BarTextureMenu );
	SliceCmdr_Save.BarMargin = SliceCmdr_Config_BarMargin:GetText();
	if (not SliceCmdr_Save.BarMargin) then
		SliceCmdr_Save.BarMargin = 0;
	end
	
	SliceCmdr_SetScale( SliceCmdr_Save.Scale );
	SliceCmdr_SetWidth( SliceCmdr_Save.Width );
	SliceCmdr_SetEnergyHeight( SliceCmdr_Save.EnergyHeight );
	SliceCmdr_SetTimerHeight( SliceCmdr_Save.TimerHeight );
		
	SliceCmdr_Save.Fail = UIDropDownMenu_GetSelectedValue( SliceCmdr_Config_FailMenu );
	SliceCmdr_Save.Expire = UIDropDownMenu_GetSelectedValue( SliceCmdr_Config_ExpireMenu );
	SliceCmdr_Save.Tick3 = UIDropDownMenu_GetSelectedValue( SliceCmdr_Config_Tick3Menu );
	SliceCmdr_Save.Tick2 = UIDropDownMenu_GetSelectedValue( SliceCmdr_Config_Tick2Menu );
	SliceCmdr_Save.Tick1 = UIDropDownMenu_GetSelectedValue( SliceCmdr_Config_Tick1Menu );
	SliceCmdr_Save.Applied = UIDropDownMenu_GetSelectedValue( SliceCmdr_Config_AppliedMenu );
	SliceCmdr_Save.Apply3 = UIDropDownMenu_GetSelectedValue( SliceCmdr_Config_Applied3Menu );
	SliceCmdr_Save.Apply2 = UIDropDownMenu_GetSelectedValue( SliceCmdr_Config_Applied2Menu );
	SliceCmdr_Save.Apply1 = UIDropDownMenu_GetSelectedValue( SliceCmdr_Config_Applied1Menu );
	SliceCmdr_Save.EnergySound1 = UIDropDownMenu_GetSelectedValue( SliceCmdr_Config_Energy1Menu );
	SliceCmdr_Save.EnergySound2 = UIDropDownMenu_GetSelectedValue( SliceCmdr_Config_Energy2Menu );
	
	-- page two --
	SliceCmdr_Save['HfB.Alert'] =	UIDropDownMenu_GetSelectedValue( SliceCmdr_Config_HfB_AlertMenu );
	SliceCmdr_Save['HfB.Expire'] =	UIDropDownMenu_GetSelectedValue(SliceCmdr_Config_HfB_ExpireMenu );
	SliceCmdr_Save['HfB.Fail'] =	UIDropDownMenu_GetSelectedValue(SliceCmdr_Config_HfB_FailMenu );
	SliceCmdr_Save['HfB.Applied'] = UIDropDownMenu_GetSelectedValue(SliceCmdr_Config_HfB_AppliedMenu );
	SliceCmdr_Save['HfB.Refresh3'] = UIDropDownMenu_GetSelectedValue(SliceCmdr_Config_HfB_Refresh3Menu );
	SliceCmdr_Save['HfB.Refresh2'] = UIDropDownMenu_GetSelectedValue(SliceCmdr_Config_HfB_Refresh2Menu );
	SliceCmdr_Save['HfB.Refresh1'] = UIDropDownMenu_GetSelectedValue(SliceCmdr_Config_HfB_Refresh1Menu );
	
	SliceCmdr_Config_VarsChanged();
end

function SliceCmdr_Config_Cancel()
	SliceCmdr_Config_LoadVars();
end

function SliceCmdr_Config_Default()
	SliceCmdr_Save.IsLocked = false;
	SliceCmdr_Save.HideEnergy = false;
	SliceCmdr_Save.Energy1 = 25;
	SliceCmdr_Save.Energy2 = 40;   
	SliceCmdr_Save.Fail = 'Waaaah';
	SliceCmdr_Save.Expire = 'BassDrum';
	SliceCmdr_Save.Tick3 = 'Tambourine';
	SliceCmdr_Save.Tick2 = 'Tambourine';
	SliceCmdr_Save.Tick1 = 'Tambourine';
	SliceCmdr_Save.Applied= 'SliceClick';
	SliceCmdr_Save.Apply3= 'High Hat 4';
	SliceCmdr_Save.Apply2= 'BoomBoomClap';
	SliceCmdr_Save.Apply1= 'Marching Band';
	SliceCmdr_Save.EnergySound1= 'None';
	SliceCmdr_Save.EnergySound2= 'None';
	SliceCmdr_Save['HfB.Fail'] = 'Waaaah';
	SliceCmdr_Save['HfB.Expire'] = 'BassDrum';
	SliceCmdr_Save['HfB.Applied'] = 'None';
	SliceCmdr_Save['HfB.Refresh3'] = 'SliceClick';
	SliceCmdr_Save['HfB.Refresh2'] = 'StunningHit';
	SliceCmdr_Save['HfB.Refresh1'] = 'OH YEAH';
	SliceCmdr_Save['HfB.Alert'] = 'Growl';
	SliceCmdr_Save['Width'] = 200;
	SliceCmdr_Save['Scale'] = 100;
	SliceCmdr_Save['HideCombo'] = false;
	SliceCmdr_Save['PadLatency'] = true;
	SliceCmdr_Save.SpellText = true;
	SliceCmdr_Save.SoundCombat = true;
	SliceCmdr_Save['EnergyTrans'] = 20;
	SliceCmdr_Save.BarMargin = 1;
	SliceCmdr_Save.DPBarShow= true;
	SliceCmdr_Save.EABarShow= true;
	SliceCmdr_Save.RupBarShow= true;
	SliceCmdr_Save.RupBarMine= false;
	SliceCmdr_Save.CPBarShow= false;
	SliceCmdr_Config_LoadVars();
end





function SliceCmdr_Config_TransFull_OnValueChanged()
	if (SliceCmdr_Config_TransFullV) then	
		SliceCmdr_Config_TransFullV:SetText(this:GetValue());
	end
end

function SliceCmdr_Config_TransFullV_OnTextChanged()
	local adjust = floor(this:GetText() + 0.5);
	if ( adjust > 0) then
		SliceCmdr_Config_TransFull:SetValue( adjust );
		--SliceCmdr_SetWidth( adjust );
		VTimerEnergy:SetAlpha( adjust / 100.0 );
	end
end

function SliceCmdr_Config_Energy2_OnValueChanged()
	if (SliceCmdr_Config_Energy2V) then
		SliceCmdr_Config_Energy2V:SetText(this:GetValue());
	end
end

function SliceCmdr_Config_Energy2V_OnTextChanged()
	SliceCmdr_Config_Energy2:SetValue(this:GetText());
end
