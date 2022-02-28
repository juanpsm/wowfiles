

GUPPET_CN_INTERFACE_MAINFRAME = { Init = 0 , Data = { Tempi = 0 , Tempii = 0}   } ;




function GupPet_CollectMe_Interface()

	if GUPPET_CN_INTERFACE_MAINFRAME.Init == 0 then
		GUPPET_CN_INTERFACE_MAINFRAME.Init = 1 ;

		GUPPET_CN_INTERFACE_MAINFRAME.Data.Frame = CreateFrame("FRAME", "UnknownData", GupPet_CollectMe_MainMainData , "GupPet_CollectMe_FieldTemplate");
		GUPPET_CN_INTERFACE_MAINFRAME.Data.Frame:SetWidth(450); --190
		GUPPET_CN_INTERFACE_MAINFRAME.Data.Frame:SetHeight(360);	
		GUPPET_CN_INTERFACE_MAINFRAME.Data.Frame:SetPoint("TOPLEFT", 0 , -30);
				
		_G["UnknownData" .. "SubTitle"]:SetText("") ;	
		_G["UnknownData" .. "Container"]:SetWidth(418);
		_G["UnknownData" .. "Container"]:SetHeight(350);
		_G["UnknownData" .. "Enable"]:Hide();
		_G["UnknownData" .. "Disable"]:Hide();	
		
		-- Filters
		GUPPET_CN_INTERFACE_MAINFRAME.Filter = CreateFrame("FRAME", "GupPet_CollectMe_Filter", GupPet_CollectMe_MainText , "GupPet_FieldTemplate");
 		GUPPET_CN_INTERFACE_MAINFRAME.Filter:SetWidth(190);
		GUPPET_CN_INTERFACE_MAINFRAME.Filter:SetHeight(115);	
		GUPPET_CN_INTERFACE_MAINFRAME.Filter:SetPoint("TOPLEFT", 0 , -20);
		_G["GupPet_CollectMe_Filter" .. "SubTitle"]:SetText("|cFFFC830E".. GUPPET_L["FILTER"]) ;	
			 
		
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_AlreadyKnow = CreateFrame("CheckButton", "GupPet_CollectMe_Filter_AlreadyKnow"  , GUPPET_CN_INTERFACE_MAINFRAME.Filter, "GupPet_CheckButtonTemplate");
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_AlreadyKnow:SetPoint("TOPLEFT", 10, -5 );
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_AlreadyKnow:SetScript("OnClick", function (self, button, down)   GUPPET_CM_OPTIONS.Filters.AlreadyKnow = self:GetChecked(); GupPet_CollectMe_Interface();    end);
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_AlreadyKnow:SetChecked(  GUPPET_CM_OPTIONS.Filters.AlreadyKnow ); 
		_G["GupPet_CollectMe_Filter_AlreadyKnow" .. "Text"]:SetText( GUPPET_L["ALREADYKNOW"][1]  ) ;
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_AlreadyKnow.tooltipText = GUPPET_L["ALREADYKNOW"][2] ;
		
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_pvp = CreateFrame("CheckButton", "GupPet_CollectMe_Filter_pvp"  , GUPPET_CN_INTERFACE_MAINFRAME.Filter, "GupPet_CheckButtonTemplate");
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_pvp:SetPoint("TOPLEFT", 10, -20 );
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_pvp:SetScript("OnClick", function (self, button, down)   GUPPET_CM_OPTIONS.Filters.pvp = self:GetChecked(); GupPet_CollectMe_Interface();    end);
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_pvp:SetChecked(  GUPPET_CM_OPTIONS.Filters.pvp ); 
		_G["GupPet_CollectMe_Filter_pvp" .. "Text"]:SetText( GUPPET_L["PVP"][1]  ) ;
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_pvp.tooltipText = GUPPET_L["PVP"][2] ;
		
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_nlo = CreateFrame("CheckButton", "GupPet_CollectMe_Filter_nlo"  , GUPPET_CN_INTERFACE_MAINFRAME.Filter, "GupPet_CheckButtonTemplate");
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_nlo:SetPoint("TOPLEFT", 10, -35 );
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_nlo:SetScript("OnClick", function (self, button, down)   GUPPET_CM_OPTIONS.Filters.nlo = self:GetChecked(); GupPet_CollectMe_Interface();    end);
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_nlo:SetChecked(  GUPPET_CM_OPTIONS.Filters.nlo ); 
		_G["GupPet_CollectMe_Filter_nlo" .. "Text"]:SetText( GUPPET_L["NLO"][1]  ) ;
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_nlo.tooltipText = GUPPET_L["NLO"][2] ;
		
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_chi = CreateFrame("CheckButton", "GupPet_CollectMe_Filter_chi"  , GUPPET_CN_INTERFACE_MAINFRAME.Filter, "GupPet_CheckButtonTemplate");
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_chi:SetPoint("TOPLEFT", 10, -50 );
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_chi:SetScript("OnClick", function (self, button, down)   GUPPET_CM_OPTIONS.Filters.chi = self:GetChecked(); GupPet_CollectMe_Interface();    end);
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_chi:SetChecked(  GUPPET_CM_OPTIONS.Filters.chi ); 
		_G["GupPet_CollectMe_Filter_chi" .. "Text"]:SetText( GUPPET_L["CHI"][1]   ) ;
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_chi.tooltipText = GUPPET_L["CHI"][2] ;
		
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_col = CreateFrame("CheckButton", "GupPet_CollectMe_Filter_col"  , GUPPET_CN_INTERFACE_MAINFRAME.Filter, "GupPet_CheckButtonTemplate");
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_col:SetPoint("TOPLEFT", 10, -65 );
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_col:SetScript("OnClick", function (self, button, down)   GUPPET_CM_OPTIONS.Filters.col = self:GetChecked(); GupPet_CollectMe_Interface();    end);
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_col:SetChecked(  GUPPET_CM_OPTIONS.Filters.col ); 
		_G["GupPet_CollectMe_Filter_col" .. "Text"]:SetText( GUPPET_L["COL"][1]   ) ;
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_col.tooltipText = GUPPET_L["COL"][2] ;
		
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_tcg = CreateFrame("CheckButton", "GupPet_CollectMe_Filter_tcg"  , GUPPET_CN_INTERFACE_MAINFRAME.Filter, "GupPet_CheckButtonTemplate");
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_tcg:SetPoint("TOPLEFT", 10, -80 );
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_tcg:SetScript("OnClick", function (self, button, down)   GUPPET_CM_OPTIONS.Filters.tcg = self:GetChecked(); GupPet_CollectMe_Interface();    end);
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_tcg:SetChecked(  GUPPET_CM_OPTIONS.Filters.tcg ); 
		_G["GupPet_CollectMe_Filter_tcg" .. "Text"]:SetText( GUPPET_L["TCG"][1]   ) ;
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_tcg.tooltipText = GUPPET_L["TCG"][2] ;
		
		
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_ignore = CreateFrame("CheckButton", "GupPet_CollectMe_Filter_ignore"  , GUPPET_CN_INTERFACE_MAINFRAME.Filter, "GupPet_CheckButtonTemplate");
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_ignore:SetPoint("TOPLEFT", 10, -95 );
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_ignore:SetScript("OnClick", function (self, button, down)   GUPPET_CM_OPTIONS.Filters.ignore = self:GetChecked(); GupPet_CollectMe_Interface();    end);
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_ignore:SetChecked(  GUPPET_CM_OPTIONS.Filters.ignore ); 
		_G["GupPet_CollectMe_Filter_ignore" .. "Text"]:SetText( GUPPET_L["IGNORE"][1]   ) ;
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_ignore.tooltipText = GUPPET_L["IGNORE"][2] ;
		GUPPET_CN_INTERFACE_MAINFRAME.Filter_ignore.tooltipRequirement = GUPPET_L["IGNORE"][3] ;
		
		-- GameTooltip
		GUPPET_CN_INTERFACE_MAINFRAME.GameTooltip = CreateFrame("FRAME", "GupPet_CollectMe_GameTooltip", GupPet_CollectMe_MainText , "GupPet_FieldTemplate");
 		GUPPET_CN_INTERFACE_MAINFRAME.GameTooltip:SetWidth(190);
		GUPPET_CN_INTERFACE_MAINFRAME.GameTooltip:SetHeight(30);	
		GUPPET_CN_INTERFACE_MAINFRAME.GameTooltip:SetPoint("TOPLEFT", 0 , -155);
		_G["GupPet_CollectMe_GameTooltip" .. "SubTitle"]:SetText("|cFFFC830E".. GUPPET_L["GAMETOOLTIP"]) ;	
			 
		
		GUPPET_CN_INTERFACE_MAINFRAME.GameTooltip_Show = CreateFrame("CheckButton", "GupPet_CollectMe_GameTooltip_Show"  , GUPPET_CN_INTERFACE_MAINFRAME.GameTooltip, "GupPet_CheckButtonTemplate");
		GUPPET_CN_INTERFACE_MAINFRAME.GameTooltip_Show:SetPoint("TOPLEFT", 10, -5 );
		GUPPET_CN_INTERFACE_MAINFRAME.GameTooltip_Show:SetScript("OnClick", function (self, button, down)   GUPPET_CM_OPTIONS.GameTooltip.Show = self:GetChecked();     end);
		GUPPET_CN_INTERFACE_MAINFRAME.GameTooltip_Show:SetChecked(  GUPPET_CM_OPTIONS.GameTooltip.Show ); 
		_G["GupPet_CollectMe_GameTooltip_Show" .. "Text"]:SetText( GUPPET_L["GAMETOOLTIPSHOW"][1]  ) ;
		GUPPET_CN_INTERFACE_MAINFRAME.GameTooltip_Show.tooltipText = GUPPET_L["GAMETOOLTIPSHOW"][2] ;
		GUPPET_CN_INTERFACE_MAINFRAME.GameTooltip_Show.tooltipRequirement = GUPPET_L["GAMETOOLTIPSHOW"][3] ;
		
		
		-- Export
		GUPPET_CN_INTERFACE_MAINFRAME.Export = CreateFrame("FRAME", "GupPet_CollectMe_Export", GupPet_CollectMe_MainText , "GupPet_FieldTemplate");
 		GUPPET_CN_INTERFACE_MAINFRAME.Export:SetWidth(190);
		GUPPET_CN_INTERFACE_MAINFRAME.Export:SetHeight(50);	
		GUPPET_CN_INTERFACE_MAINFRAME.Export:SetPoint("BOTTOMLEFT", 0 , 0);
		_G["GupPet_CollectMe_Export" .. "SubTitle"]:SetText("|cFFFC830E".. GUPPET_L["EXPORT"]) ;	
		
		GUPPET_CN_INTERFACE_MAINFRAME.Export_AllChar = CreateFrame("CheckButton", "GupPet_CollectMe_Export_AllChar"  , GUPPET_CN_INTERFACE_MAINFRAME.Export, "GupPet_CheckButtonTemplate");
		GUPPET_CN_INTERFACE_MAINFRAME.Export_AllChar:SetPoint("TOPLEFT", 10, -5 );
		GUPPET_CN_INTERFACE_MAINFRAME.Export_AllChar:SetScript("OnClick", function (self, button, down) GUPPET_CM_OPTIONS.ExportAllChars = self:GetChecked();        end);
		GUPPET_CN_INTERFACE_MAINFRAME.Export_AllChar:SetChecked( GUPPET_CM_OPTIONS.ExportAllChars  ); 
		_G["GupPet_CollectMe_Export_AllChar" .. "Text"]:SetText( GUPPET_L["ALLCHARS"][1]   ) ;
		GUPPET_CN_INTERFACE_MAINFRAME.Export_AllChar.tooltipText = GUPPET_L["ALLCHARS"][2] ;
		
		GUPPET_CN_INTERFACE_MAINFRAME.Export_DoExport = CreateFrame("Button", "GupPet_CollectMe_Export_DoExport", GUPPET_CN_INTERFACE_MAINFRAME.Export , "GupPet_ButtonTemplate");
		GUPPET_CN_INTERFACE_MAINFRAME.Export_DoExport:SetScript("OnClick", function () GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox.val = "" 
					local TextBoxData = GupPet_CollectMe_CreateExport( "Companions" ) ;
					
					for i = 1 , #TextBoxData do
						GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox.val = GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox.val .."["..TextBoxData[i].."]" ;
					end
					_G["GupPet_CollectMe_Export_TextBox"]:Show();
					GUPPET_CN_INTERFACE_MAINFRAME.Export:SetHeight(65);
		end) ;
		GUPPET_CN_INTERFACE_MAINFRAME.Export_DoExport:SetWidth(150); 
		GUPPET_CN_INTERFACE_MAINFRAME.Export_DoExport:SetHeight(15); 
		GUPPET_CN_INTERFACE_MAINFRAME.Export_DoExport:SetPoint("TOPLEFT",10, -25);
		GUPPET_CN_INTERFACE_MAINFRAME.Export_DoExport:SetText( GUPPET_L["DOEXPORT"][1] );
		GUPPET_CN_INTERFACE_MAINFRAME.Export_DoExport.tooltipText = GUPPET_L["DOEXPORT"][2];
		GUPPET_CN_INTERFACE_MAINFRAME.Export_DoExport:SetNormalFontObject( GupPet_FontText);
		GUPPET_CN_INTERFACE_MAINFRAME.Export_DoExport:SetHighlightFontObject( GupPet_FontText);
		
		GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox = CreateFrame('EditBox', "GupPet_CollectMe_Export_TextBox", GUPPET_CN_INTERFACE_MAINFRAME.Export );
		GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox:Hide();
		GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox:SetAutoFocus(true);
		GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox:SetHeight(20);
		GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox:SetWidth(170);
		GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox:SetPoint("TOPLEFT", 10 , -40);
		GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox:SetFontObject('GameFontHighlightSmall');
		GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox:SetScript("OnEscapePressed", GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox.ClearFocus);
		GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox:SetScript("OnEnterPressed", GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox.ClearFocus);
		GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox:SetScript("OnEditFocusLost", function() _G["GupPet_CollectMe_Export"]:SetHeight(50); _G["GupPet_CollectMe_Export_TextBox"]:Hide(); end);
		GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox:SetScript("OnEditFocusGained", GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox.HighlightText);
		GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox:SetScript("OnMouseUp", GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox.HighlightText);
		GUPPET_CN_INTERFACE_MAINFRAME.Export_TextBox:SetScript("OnTextChanged", function(self)
			self:SetText(self.val)
			self:HighlightText()
		end);
		
	end
 
	-- Detect what tab is open --
	if GupPet_Interface_GetSelected( "CollectMeTabs" ) == "GupPet_CollectMe_MainMainTabMount" then
		-- Mount Tab open
		GUPPET_CN_INTERFACE_MAINFRAME.Data = GupPet_CollectMe_Interface_UpdateLocalDuelFrame( GUPPET_CN_INTERFACE_MAINFRAME.Data ,   "Mounts"  ) ;
	
	else
		-- Companion Tab open
		GUPPET_CN_INTERFACE_MAINFRAME.Data = GupPet_CollectMe_Interface_UpdateLocalDuelFrame( GUPPET_CN_INTERFACE_MAINFRAME.Data ,  "Companions"  ) ;
	end
	
	
	local knownItemPercentage = 0 ;
	if  GUPPET_CN_INTERFACE_MAINFRAME.Data.Known > 0 then
			knownItemPercentage = floor(GUPPET_CN_INTERFACE_MAINFRAME.Data.Known/(GUPPET_CN_INTERFACE_MAINFRAME.Data.Known+GUPPET_CN_INTERFACE_MAINFRAME.Data.Unknown)*100);
	end
	
    _G["UnknownData" .. "StatusBar"]:SetValue(knownItemPercentage);
    _G["UnknownData" .. "StatusBarText"]:SetText( GUPPET_CN_INTERFACE_MAINFRAME.Data.Known.." / "..(GUPPET_CN_INTERFACE_MAINFRAME.Data.Known+GUPPET_CN_INTERFACE_MAINFRAME.Data.Unknown).." - "..knownItemPercentage.."\%");
	
	GupPet_Interface_ScrollFrame_Update( _G["UnknownData" .. "Container"] , math.ceil( GUPPET_CN_INTERFACE_MAINFRAME.Data.Show ) ,17 ,20 , 440);

	
	GupPet_CM_GT_CreateNameTable();
end

 

function GupPet_CollectMe_Interface_UpdateLocalDuelFrame( Data ,  MountType )


	local CollectedData = GupPet_CollectMe_CreateCollectedData( MountType )

	Data["Known"] = CollectedData["Known"] ;
	Data["Unknown"] = CollectedData["Unknown"] ;
	
	local t_i = 0 ;

	for i = 1 , math.ceil(#CollectedData/2) do

		if ( Data.Tempii < i ) then

			Data[i] = CreateFrame("Button", "UnknownData"..i , _G[ "UnknownData" .. "Data"] , "GupPet_CollectMe_IconTemplate");
			Data[i]:RegisterForClicks("AnyDown" );
		end

		_G["UnknownData"..i ]:SetPoint('TOPLEFT', 10, 20-(i*20));
		_G["UnknownData"..i .. "Text"]:SetText(CollectedData[ i ]["Name"]  ) ;
		_G["UnknownData"..i .. "Icon"]:SetTexture( CollectedData[ i ]["Icon"] );
		_G["UnknownData"..i .. "Text"]:SetVertexColor( CollectedData[ i ]["Color"][1] , CollectedData[ i ]["Color"][2] , CollectedData[ i ]["Color"][3]   );
		_G["UnknownData"..i ]:Show();
		
		_G["UnknownData"..i ]:SetScript("OnEnter", function(self, button, down)	
				GupPet_CollectMe_PreviewModel:RefreshUnit()  ;
				GupPet_CollectMe_PreviewModel:SetModel("Interface\\Buttons\\TalkToMeQuestion_Grey.mdx")
				GupPet_CollectMe_PreviewModel:SetCreature( GUPPET_CM_DATA[MountType][ CollectedData[ i ]["Id"] ]["Mo"]  )	
				GupPet_CollectMe_Preview:Show() 
				
		--		print( GUPPET_CM_DATA[MountType][ CollectedData[ i ]["Id"] ]["Mo"]  );
												
				GupPet_CollectMe_WhereText:SetText( GUPPET_CM[ CollectedData[ i ]["Id"] ] )
				GupPet_CollectMe_Where:Show()
				
				GupPet_CollectMe_Known:SetID( CollectedData[ i ]["Id"] ) ;
				GupPet_CollectMe_Known:Show()
			end);
		_G["UnknownData"..i ]:SetScript("OnLeave", function() 
				GupPet_CollectMe_Preview:Hide()	
				GupPet_CollectMe_Where:Hide()
				GupPet_CollectMe_Known:Hide()
			end);	
		_G["UnknownData"..i ]:SetScript("OnClick", function (self)   
				
				if arg1 == "LeftButton" then	
					if ( IsModifiedClick() ) then   
										
						if ( IsModifiedClick("CHATLINK") ) then
							if ( MacroFrame and MacroFrame:IsShown() ) then
								local spellLink = GetSpellInfo( CollectedData[ i ]["Id"] );
								ChatEdit_InsertLink(spellLink);
							else
								local spellLink = GetSpellLink( CollectedData[ i ]["Id"] );
								ChatEdit_InsertLink(spellLink);
							end
						elseif 	IsAltKeyDown() 	then
						
							local spellLink = GetSpellLink( CollectedData[ i ]["Id"] );
							ChatEdit_InsertLink(spellLink);
							ChatEdit_InsertLink( GUPPET_CM[ CollectedData[ i ]["Id"] ] );
							
						end
					end
				else
					
					myId = GupPet_CollectMe_GetPlayerInfo() ;
					
					if GUPPET_CM_SAVEDDATA[ MountType ][ CollectedData[ i ]["Id"] ]["Ignore_"..myId] then
						GUPPET_CM_SAVEDDATA[ MountType ][ CollectedData[ i ]["Id"] ]["Ignore_"..myId] = nil ;
					else
						GUPPET_CM_SAVEDDATA[ MountType ][ CollectedData[ i ]["Id"] ]["Ignore_"..myId] = true ;
					end
					GupPet_CollectMe_Interface() ;
					
				end
			end);
		
		t_i = i ;
	end

	local t_ii = 0 ;

	for i = 1 , #CollectedData- math.ceil(#CollectedData/2) do

		local ii = i + t_i ;
	
		if ( Data.Tempii  < ii ) then

			Data[ii] = CreateFrame("Button", "UnknownData"..ii , _G[ "UnknownData" .. "Data"] , "GupPet_CollectMe_IconTemplate");
			Data[ii]:RegisterForClicks("AnyDown" );

		end

		_G["UnknownData"..ii ]:SetPoint('TOPLEFT', 236, 20-(i*20));
		_G["UnknownData"..ii .. "Text"]:SetText(CollectedData[ ii ]["Name"]  ) ;
		_G["UnknownData"..ii .. "Icon"]:SetTexture( CollectedData[ ii ]["Icon"] );
		_G["UnknownData"..ii .. "Text"]:SetVertexColor( CollectedData[ ii ]["Color"][1] , CollectedData[ ii ]["Color"][2] , CollectedData[ ii ]["Color"][3]   );

		
		_G["UnknownData"..ii ]:Show();
		
		_G["UnknownData"..ii ]:SetScript("OnEnter", function(self, button, down)	
				GupPet_CollectMe_PreviewModel:RefreshUnit()  ;
				GupPet_CollectMe_PreviewModel:SetModel("Interface\\Buttons\\TalkToMeQuestion_Grey.mdx")
				GupPet_CollectMe_PreviewModel:SetCreature( GUPPET_CM_DATA[MountType][ CollectedData[ ii ]["Id"] ]["Mo"]  )	
				GupPet_CollectMe_Preview:Show() 
				
				GupPet_CollectMe_WhereText:SetText( GUPPET_CM[ CollectedData[ ii ]["Id"] ] )
				GupPet_CollectMe_Where:Show()
								
				GupPet_CollectMe_Known:SetID( CollectedData[ ii ]["Id"] ) ;
				GupPet_CollectMe_Known:Show()
				
		
			end);
		_G["UnknownData"..ii ]:SetScript("OnLeave", function() 
				GupPet_CollectMe_Preview:Hide()	
				GupPet_CollectMe_Where:Hide()
				GupPet_CollectMe_Known:Hide()

			end);	
		_G["UnknownData"..ii ]:SetScript("OnClick", function (self)   
		
				if arg1 == "LeftButton" then		
					if ( IsModifiedClick() ) then   
										
						if ( IsModifiedClick("CHATLINK") ) then
							if ( MacroFrame and MacroFrame:IsShown() ) then
								local spellLink = GetSpellInfo( CollectedData[ ii ]["Id"] );
								ChatEdit_InsertLink(spellLink);
							else
								local spellLink = GetSpellLink( CollectedData[ ii ]["Id"] );
								ChatEdit_InsertLink(spellLink);
							end
						elseif 	IsAltKeyDown() 	then
						
							local spellLink = GetSpellLink( CollectedData[ ii ]["Id"] );
							ChatEdit_InsertLink(spellLink);
							ChatEdit_InsertLink( GUPPET_CM[ CollectedData[ ii ]["Id"] ] );
							
						end
					end
				
				else
					
					myId = GupPet_CollectMe_GetPlayerInfo() ;
					
					if GUPPET_CM_SAVEDDATA[ MountType ][ CollectedData[ ii ]["Id"] ]["Ignore_"..myId] then
						GUPPET_CM_SAVEDDATA[ MountType ][ CollectedData[ ii ]["Id"] ]["Ignore_"..myId] = nil ;
					else
						GUPPET_CM_SAVEDDATA[ MountType ][ CollectedData[ ii ]["Id"] ]["Ignore_"..myId] = true ;
					end
					GupPet_CollectMe_Interface() ;
					
				end
				
			end);
		
		t_ii = ii ;
	end	
	
	
	-- Hide unneedid buttons
	for q = 1 ,Data.Tempii-t_ii do
		z = q + t_ii ;
		_G["UnknownData"..z]:Hide() ;
	end
	
	
	if Data.Tempii < t_ii then
		Data.Tempii =  t_ii ;
	end


	Data.Show =  t_i ;
	

	return Data
end

