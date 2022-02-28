--======================================================================================================================
--Predefined values - Start
--======================================================================================================================
koordinatorVersion = GetAddOnMetadata("Koordinator", "Version");
koordinatorUpdateRate = 0.05;
koordinatorTooltipTrigger = 0;
koordinatorTooltipCounter = 0;
koordinatorAutoReplyTrigger = 0;
koordinatorAutoReplyCounter = 0;
koordinatorMapResetter = 0;
koordinatorSettings = {
	["kooVersion"] = koordinatorVersion,
	["miniWindow"] = 1,
	["miniMap"] = nil,
	["worldMap"] = 1,
	["party"] = 1,
	["divider"] = 1,
	["autoReply"] = 1,
	["slider"] = 1,
	["incompatibilitySetter"] = nil,
}

--Blacklists for addons that not working properly with Koordinator
addonIncompatibilityList = {
	[1] = "XPerl_Party,pm",
	[2] = "Perl_Party,pm",
	[3] = "ag_UnitFrames,pm",
	[4] = "TitanCoords,wm",
}
--Predefined values - End



--======================================================================================================================
--MiniMap and MiniWindow - Start
--======================================================================================================================

--KoordinatorMiniWindow - make it dragable
function KoordinatorMiniWindow_OnLoad()
	this:RegisterForDrag("LeftButton");
end


function KoordinatorMiniWindow_OnDragStart()
	KoordinatorMiniWindowFrame:StartMoving()
end


function KoordinatorMiniWindow_OnDragStop()
	KoordinatorMiniWindowFrame:StopMovingOrSizing()
end


function KoordinatorMiniWindow_OnEnter()
	koordinatorTooltipTrigger = 1;
end


function KoordinatorMiniWindow_OnLeave()
	koordinatorTooltipTrigger = 0;
	KoordinatorTooltip:Hide();
end


function KoordinatorMiniWindowLeftClick(arg1, keybindings)
	if((arg1 == "LeftButton" and IsShiftKeyDown()) or (keybindings == 1)) then
		if(px == 0 and py == 0) then
			KoordinatorCoordinateString = (GetZoneText() .. "(" .. GetSubZoneText() .. "), " .. "(N/A)");
			if(ChatFrameEditBox:IsVisible()) then
				ChatFrameEditBox:Insert(KoordinatorCoordinateString);
			else
				local kooChatType = ChatFrameEditBox:GetAttribute("chatType");
				SendChatMessage(KoordinatorCoordinateString, kooChatType, nil, "1");
			end
		else
			KOO_KSDA = 3;
			KoordinatorSliderDividerApperance(KOO_KSDA);
		end
	end
end


function KoordinatorMiniWindowRightClick(arg1, keybindings)
	if(arg1 == "RightButton" or keybindings == 1) then
		if KoordinatorOptionsFrame:IsShown() then
			KoordinatorOptionsFrame:Hide();
		else
			KoordinatorOptionsFrame:Show();
		end	
	end
end


function KoordinatorMiniMap_OnLoad()
	SlashCmdList["KOORDINATOR"] = Koordinator_OnSlash;
	SLASH_KOORDINATOR1 = "/koordinator";
	SLASH_KOORDINATOR2 = "/koo";
	this:RegisterEvent("ZONE_CHANGED");
	this:RegisterEvent("ZONE_CHANGED_INDOORS");
	this:RegisterEvent("ZONE_CHANGED_NEW_AREA");
	this:RegisterEvent("MINIMAP_ZONE_CHANGED");
	this:RegisterEvent("PLAYER_ENTERING_WORLD");
	this:RegisterEvent("ADDON_LOADED");
	this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("CHAT_MSG_WHISPER");
	this:RegisterEvent("PLAYER_FLAGS_CHANGED");
--	this:RegisterEvent("WORLD_MAP_UPDATE");
	KoordinatorMiniMapFrame.TimeSinceLastUpdate = 0;
end


function KoordinatorMiniMap_OnEvent()
	if(event == "PLAYER_FLAGS_CHANGED") then
		if((UnitIsAFK("player") or UnitIsDND("player")) and koordinatorSettings.autoReply == 1) then
			ChatFrame1:AddMessage(KOO_NAME .. KOO_AUTOREPLY_ENABLED);
		end
	end

	if(event == "ZONE_CHANGED_NEW_AREA") then
		SetMapToCurrentZone();
	end

	if(event == "ADDON_LOADED" and arg1 == "Koordinator") then
		ChatFrame1:AddMessage(KOO_LOADED);
		--Check if an older version of Koordinator was used before that is not compatible to the current version
		if(koordinatorSettings.kooVersion == nil) then
			koordinatorSettings = {
				["kooVersion"] = koordinatorVersion,
				["miniWindow"] = 1,
				["miniMap"] = nil,
				["worldMap"] = 1,
				["party"] = 1,
				["divider"] = 1,
				["autoReply"] = 1,
				["slider"] = 1,
				["incompatibilitySetter"] = nil,
			}
			ChatFrame1:AddMessage(KOO_NAME .. KOO_RESET);
		end
	end
	
	if(event == "CHAT_MSG_WHISPER" and (UnitIsAFK("player") or UnitIsDND("player")) and koordinatorSettings.autoReply == 1) then
		koordinatorAutoReplyTrigger = 1;
	end
	
	--Check if there is any addon loaded that is within the blacklist
	if(event == "VARIABLES_LOADED") then
		KoordinatorIncompatibilityChecker();
	end
end


function KoordinatorMiniMap_OnUpdate(arg1)
	KoordinatorMiniMapFrame.TimeSinceLastUpdate = KoordinatorMiniMapFrame.TimeSinceLastUpdate + arg1;
	if(KoordinatorMiniMapFrame.TimeSinceLastUpdate > koordinatorUpdateRate) then
		if(koordinatorSettings.miniWindow == 1) or (koordinatorSettings.miniMap == 1) or (koordinatorSettings.party == 1) then
			--Due to the fact that the event "CLOSE_WOLRD_MAP" isn't working properly I've made a little workaround that helps to keep the coordinates
			--of the minimap, miniwindow and partymembers appropriate to the current zone when zooming out within the worldmap and then closing the worldmap.
			if WorldMapFrame:IsShown() then
				koordinatorMapResetter = 1;
			end
			if(koordinatorMapResetter == 1) then
				if not WorldMapFrame:IsShown() then
					SetMapToCurrentZone();
					koordinatorMapResetter = 0;
				end
			end
			if(koordinatorSettings.miniWindow == 1) then
				MiniWindowTextX:Show();
				MiniWindowTextY:Show();
				MiniWindowTextDivider:Show();
				KoordinatorMiniWindowFrame:Show();
			end
			KoordinatorGetPlayerMapPosition();
			if(px == 0 and py == 0) then
				if(koordinatorSettings.miniWindow == 1) then
					MiniWindowTextX:SetText("N");
					MiniWindowTextY:SetText("A");
					MiniWindowTextDivider:SetText("|cff666666|");
				end
			else
				if(koordinatorSettings.miniMap == 1) then
					koordinatorMiniMapTrigger = true;
					KOO_KSDA = 1;
					KoordinatorSliderDividerApperance(KOO_KSDA);
				end
				if(koordinatorSettings.miniWindow == 1) then
					if(koordinatorSettings.divider == 1) then
						MiniWindowTextX:SetText(format("%d", px));
						MiniWindowTextY:SetText(format("%d", py));
						MiniWindowTextDivider:SetText("|cff666666|");
					else
						MiniWindowTextX:SetText(format("%d", px));
						MiniWindowTextY:SetText(format("%d", py));
						MiniWindowTextDivider:SetText(",");
					end
				end
				if(koordinatorSettings.party == 1) then
					if(GetNumPartyMembers() == 0) then
						KoordinatorPartyFrame:Hide();
					else
						if(PartyMemberFrame1:IsShown()) then
							KoordinatorPartyFrame:Show();
							if(GetNumPartyMembers() >= 1) then
								local px1, py1 = GetPlayerMapPosition("party1");
								if(px1 == 0 and py1 == 0) then
									KoordinatorPartyMember1Text:SetText("N||A");
								else
									px1 = px1 * 100;
									py1 = py1 * 100;
									if(koordinatorSettings.divider == 1) then
										KoordinatorPartyMember1Text:SetText(format("%d%s%d", px1, "||", py1));
									else
										KoordinatorPartyMember1Text:SetText(format("%d%s%d", px1, ",", py1));
									end
								end
							else
								KoordinatorPartyMember1Text:SetText("");
							end
							
							if(GetNumPartyMembers() >= 2) then
								local px2, py2 = GetPlayerMapPosition("party2");
								if(px2 == 0 and py2 == 0) then
									KoordinatorPartyMember2Text:SetText("N||A");
								else
									px2 = px2 * 100;
									py2 = py2 * 100;
									if(koordinatorSettings.divider == 1) then
										KoordinatorPartyMember2Text:SetText(format("%d%s%d", px2, "||", py2));
									else
										KoordinatorPartyMember2Text:SetText(format("%d%s%d", px2, ",", py2));
									end
								end
							else
								KoordinatorPartyMember2Text:SetText("");
							end
							
							if(GetNumPartyMembers() >= 3) then
								local px3, py3 = GetPlayerMapPosition("party3");
								if(px3 == 0 and py3 == 0) then
									KoordinatorPartyMember3Text:SetText("N||A");
								else
									px3 = px3 * 100;
									py3 = py3 * 100;
									if(koordinatorSettings.divider == 1) then
										KoordinatorPartyMember3Text:SetText(format("%d%s%d", px3, "||", py3));
									else
										KoordinatorPartyMember3Text:SetText(format("%d%s%d", px3, ",", py3));
									end
								end
							else
								KoordinatorPartyMember3Text:SetText("");
							end
							
							if(GetNumPartyMembers() >= 4) then
								local px4, py4 = GetPlayerMapPosition("party4");
								if(px4 == 0 and py4 == 0) then
									KoordinatorPartyMember4Text:SetText("N||A");
								else
									px4 = px4 * 100;
									py4 = py4 * 100;
									if(koordinatorSettings.divider == 1) then
										KoordinatorPartyMember4Text:SetText(format("%d%s%d", px4, "||", py4));
									else
										KoordinatorPartyMember4Text:SetText(format("%d%s%d", px4, ",", py4));
									end
								end
							else
								KoordinatorPartyMember4Text:SetText("");
							end
						else
							KoordinatorPartyFrame:Hide();
						end
					end
				end
			end
		end
		if(koordinatorSettings.miniMap == nil) or (koordinatorSettings.miniWindow == nil) or (koordinatorSettings.party == nil) then
			if(koordinatorSettings.miniMap == nil) and (koordinatorMiniMapTrigger == true) then
				MinimapZoneText:SetText(GetMinimapZoneText());
				koordinatorMiniMapTrigger = false;
			end
			if(koordinatorSettings.miniWindow == nil) then
				MiniWindowTextX:Hide();
				MiniWindowTextY:Hide();
				MiniWindowTextDivider:Hide();
				KoordinatorMiniWindowFrame:Hide();
			end
			if(koordinatorSettings.party == nil) then
				KoordinatorPartyFrame:Hide();
			end
		end
		
		if(koordinatorAutoReplyTrigger == 1) then
			koordinatorAutoReplyCounter = koordinatorAutoReplyTrigger + KoordinatorMiniMapFrame.TimeSinceLastUpdate;
		else
			koordinatorAutoReplyCounter = 0;
		end
		
		if(koordinatorAutoReplyCounter > 1) then
			local kooLastTell = ChatEdit_GetLastTellTarget();
			if((kooLastTell ~= "") and (kooLastTell ~= UnitName("player"))) then
				if(px == 0 and py == 0) then
					KoordinatorCoordinateString = (GetZoneText() .. "(" .. GetSubZoneText() .. "), " .. "(N/A)");
					SendChatMessage(KoordinatorCoordinateString, "WHISPER", nil, kooLastTell);
				else
					KOO_KSDA = 3;
					KoordinatorSliderDividerApperance(KOO_KSDA, kooLastTell);
					kooLastTell = "";
				end
				koordinatorAutoReplyTrigger = 0;
			end			
		end
		
		if(koordinatorTooltipTrigger == 1) then
			koordinatorTooltipCounter = koordinatorTooltipCounter + KoordinatorMiniMapFrame.TimeSinceLastUpdate;
		else
			koordinatorTooltipCounter = 0;
		end
		
		if(koordinatorTooltipCounter > 1) then
			KoordinatorTooltip:SetOwner(KoordinatorMiniWindowFrame, "ANCHOR_RIGHT");
			KoordinatorTooltip:SetText(KOO_MINIWINDOW_TOOLTIP);
		end		
		KoordinatorMiniMapFrame.TimeSinceLastUpdate = 0;
	end
end
--MiniMap and MiniWindow - End



--======================================================================================================================
--WorldMap - Start
--======================================================================================================================
function KoordinatorWorldMap_OnLoad()
	KoordinatorWorldMapFrame.TimeSinceLastUpdate = 0;
end


function KoordinatorWorldMap_OnUpdate()
	KoordinatorWorldMapFrame.TimeSinceLastUpdate = KoordinatorWorldMapFrame.TimeSinceLastUpdate + arg1;
	if(KoordinatorWorldMapFrame.TimeSinceLastUpdate > koordinatorUpdateRate) then
		if(koordinatorSettings.worldMap == nil) then
			KoordinatorWorldMapPlayer:Hide();
			KoordinatorWorldMapCursor:Hide();
			KoordinatorWorldMapInfo:Hide();
		else
			KoordinatorWorldMapPlayer:Show();
			KoordinatorWorldMapCursor:Show();
			KoordinatorWorldMapInfo:Show();
			
			KoordinatorGetPlayerMapPosition();
			KoordinatorGetCursorPosition();
		
			KOO_KSDA = 2;
			KoordinatorSliderDividerApperance(KOO_KSDA);			
		end
		KoordinatorWorldMapInfo:SetText("Koordinator " .. koordinatorVersion);
		KoordinatorWorldMapFrame.TimeSinceLastUpdate = 0;
	end
end
--WorldMap - End



--======================================================================================================================
--General Calculations - Start
--======================================================================================================================

--PlayerPosition
function KoordinatorGetPlayerMapPosition()
	px, py = GetPlayerMapPosition("player");
	px = px * 100;
	py = py * 100;
end


--MousePosition
function KoordinatorGetCursorPosition()
	mx, my = GetCursorPosition();
	mx = mx / WorldMapButton:GetEffectiveScale();
	my = my / WorldMapButton:GetEffectiveScale();
	local width = WorldMapButton:GetWidth();
	local height = WorldMapButton:GetHeight();
	local centerX, centerY = WorldMapButton:GetCenter();
	local adjustedX = (mx - (centerX - (width/2))) / width;
	local adjustedY = (centerY + (height/2) - my) / height;
	mx = adjustedX * 100;
	my = adjustedY * 100;
end
--General Calculations - End



--======================================================================================================================
--Options - Start
--======================================================================================================================

--Console commands
function Koordinator_OnSlash(arg1)
	arg1 = string.lower(arg1); --converts upper case to lower case
	if KoordinatorOptionsFrame:IsShown() then
		KoordinatorOptionsFrame:Hide();
	else
		KoordinatorOptionsFrame:Show();
	end
end


--Options dialog
function KoordinatorOptionsFrame_OnLoad()
	tinsert(UISpecialFrames, "KoordinatorOptionsFrame"); --Makes the frame closable by pressing escape
	this:RegisterForDrag("LeftButton");
	KoordinatorOptionsFrameTitle:SetText(KOO_OPTIONS_TITLE);
	KoordinatorOptionsFrameText:SetText(KOO_OPTIONS_TEXT_COORDS);
	KoordinatorOptionsFrameText2:SetText(KOO_OPTIONS_TEXT_DIVIDER);
	KoordinatorOptionsFrameText3:SetText(KOO_OPTIONS_TEXT_AUTOREPLY);
	KoordinatorOptionsFrameCloseButton:SetText(KOO_OPTIONS_BUTTON);
end


function KoordinatorOptionsFrame_OnDragStart()
	KoordinatorOptionsFrame:StartMoving()
end


function KoordinatorOptionsFrame_OnDragStop()
	KoordinatorOptionsFrame:StopMovingOrSizing()
end


function KoordinatorOptionsFrame_OnShow()
	if(savedSubStringAddonName ~= nil) then
		KoordinatorPartyButton:Disable();
		getglobal(KoordinatorPartyButton:GetName().."Text"):SetText("|cff666666" .. KOO_PARTY);
		ChatFrame1:AddMessage(KOO_NAME .. KOO_PARTY_DISABLED);
		ChatFrame1:AddMessage(KOO_NAME .. KOO_INCOMPATIBLE_ADDON .. "\"" .. savedSubStringAddonName .. "\"");
	else
		KoordinatorPartyButton:SetChecked(koordinatorSettings.party);
	end
	KoordinatorMiniWindowButton:SetChecked(koordinatorSettings.miniWindow);
	KoordinatorMiniMapButton:SetChecked(koordinatorSettings.miniMap);
	KoordinatorWorldMapButton:SetChecked(koordinatorSettings.worldMap);	
	KoordinatorDividerButton:SetChecked(koordinatorSettings.divider);
	KoordinatorAutoReplyButton:SetChecked(koordinatorSettings.autoReply);
	KoordinatorSlider:SetValue(koordinatorSettings.slider);
end


--Action of the checkboxes
function KoordinatorOptionsFrame_OnClick()
	if(this:GetName() == ("KoordinatorMiniWindowButton")) then
		koordinatorSettings.miniWindow = this:GetChecked();
	end
	if(this:GetName() == ("KoordinatorMiniMapButton")) then
		koordinatorSettings.miniMap = this:GetChecked();
	end
	if(this:GetName() == ("KoordinatorWorldMapButton")) then
		koordinatorSettings.worldMap = this:GetChecked();
		if(koordinatorSettings.incompatibilitySetter == 1) then
			inc = 1;
			KoordinatorIncompatibilityChecker(inc);
		end
	end
	if(this:GetName() == ("KoordinatorPartyButton")) then
		koordinatorSettings.party = this:GetChecked();
	end
	if(this:GetName() == ("KoordinatorDividerButton")) then
		koordinatorSettings.divider = this:GetChecked();
	end
	if(this:GetName() == ("KoordinatorAutoReplyButton")) then
		koordinatorSettings.autoReply = this:GetChecked();
	end
	if(this:GetName() == ("KoordinatorSlider")) then
		koordinatorSettings.slider = this:GetValue();
	end
end


--Sets the name of the checkboxes
function KoordinatorMiniWindowButton_OnLoad()
	getglobal(this:GetName().."Text"):SetText(KOO_MINIWINDOW);
end

function KoordinatorMiniMapButton_OnLoad()
	getglobal(this:GetName().."Text"):SetText(KOO_MINIMAP);
end

function KoordinatorWorldMapButton_OnLoad()
	getglobal(this:GetName().."Text"):SetText(KOO_WORLDMAP);
end

function KoordinatorPartyButton_OnLoad()
	getglobal(this:GetName().."Text"):SetText(KOO_PARTY);
end

function KoordinatorDividerButton_OnLoad()
	getglobal(this:GetName().."Text"):SetText(KOO_DIVIDER);
end

function KoordinatorAutoReplyButton_OnLoad()
	getglobal(this:GetName().."Text"):SetText(KOO_AUTOREPLY);
end


--Slider
function KoordinatorSlider_OnLoad()
	getglobal(this:GetName().."Text"):SetText(KOO_SLIDER);
	getglobal(this:GetName().."Low"):SetText("0");
	getglobal(this:GetName().."High"):SetText("2");
	this:SetMinMaxValues(1,3);
	this:SetValueStep(1);
end


--SliderDividerApperance
function KoordinatorSliderDividerApperance(KOO_KSDA, kooLastTell)
	local kooChatType = ChatFrameEditBox:GetAttribute("chatType");
	
	if(koordinatorSettings.slider == 1) then
		if(koordinatorSettings.divider == 1) then
			if(KOO_KSDA == 1) then
				MinimapZoneText:SetText(format("%s%d%s%d", KOO_POSITION_MINIMAP, px, "||", py));
			end
			if(KOO_KSDA == 2) then
				if(px == 0 and py == 0) then
					KoordinatorWorldMapPlayer:SetText(KOO_POSITION_WORLDMAP_PLAYER_NA);
				else
					KoordinatorWorldMapPlayer:SetText(format("%s%d%s%d", KOO_POSITION_WORLDMAP_PLAYER, px, "||", py));
				end
				KoordinatorWorldMapCursor:SetText(format("%s%d%s%d", KOO_POSITION_WORLDMAP_CURSOR, mx, "||", my));
			end
			if(KOO_KSDA == 3) then
				KoordinatorCoordinateString = (GetZoneText() .. "(" .. GetSubZoneText() .. "), (" .. format("%d%s%d%s", px, "||", py, ")"));
				if(kooLastTell ~= nil) then
					if(UnitIsAFK("player")) then
						--Case AFK
						SendChatMessage(KOO_AUTOREPLY_MESSAGE, "WHISPER", nil, kooLastTell);
						SendChatMessage(KoordinatorCoordinateString, "WHISPER", nil, kooLastTell);
						SendChatMessage("", "AFK", nil, "1");
					else
						--Case DND
						SendChatMessage(KOO_AUTOREPLY_MESSAGE, "WHISPER", nil, kooLastTell);
						SendChatMessage(KoordinatorCoordinateString, "WHISPER", nil, kooLastTell);
					end
				elseif(ChatFrameEditBox:IsVisible()) then
					ChatFrameEditBox:Insert(KoordinatorCoordinateString);
				else
					SendChatMessage(KoordinatorCoordinateString, kooChatType, nil, "1");
				end
			end
		else
			if(KOO_KSDA == 1) then
				MinimapZoneText:SetText(format("%s%d%s%d", KOO_POSITION_MINIMAP, px, ",", py));
			end
			if(KOO_KSDA == 2) then
				if(px == 0 and py == 0) then
					KoordinatorWorldMapPlayer:SetText(KOO_POSITION_WORLDMAP_PLAYER_NA);
				else
					KoordinatorWorldMapPlayer:SetText(format("%s%d%s%d", KOO_POSITION_WORLDMAP_PLAYER, px, ",", py));
				end
				KoordinatorWorldMapCursor:SetText(format("%s%d%s%d", KOO_POSITION_WORLDMAP_CURSOR, mx, ",", my));
			end
			if(KOO_KSDA == 3) then
				KoordinatorCoordinateString = (GetZoneText() .. "(" .. GetSubZoneText() .. "), (" .. format("%d%s%d%s", px, ",", py, ")"));
				if(kooLastTell ~= nil) then
					if(UnitIsAFK("player")) then
						--Case AFK
						SendChatMessage(KOO_AUTOREPLY_MESSAGE, "WHISPER", nil, kooLastTell);
						SendChatMessage(KoordinatorCoordinateString, "WHISPER", nil, kooLastTell);
						SendChatMessage("", "AFK", nil, "1");
					else
						--Case DND
						SendChatMessage(KOO_AUTOREPLY_MESSAGE, "WHISPER", nil, kooLastTell);
						SendChatMessage(KoordinatorCoordinateString, "WHISPER", nil, kooLastTell);
					end
				elseif(ChatFrameEditBox:IsVisible()) then
					ChatFrameEditBox:Insert(KoordinatorCoordinateString);
				else
					SendChatMessage(KoordinatorCoordinateString, kooChatType, nil, "1");
				end
			end
		end
	elseif(koordinatorSettings.slider == 2) then
		if(koordinatorSettings.divider == 1) then
			if(KOO_KSDA == 1) then
				MinimapZoneText:SetText(format("%s%.1f%s%.1f", KOO_POSITION_MINIMAP_SHORT, px, "||", py));
			end
			if(KOO_KSDA == 2) then
				if(px == 0 and py == 0) then
					KoordinatorWorldMapPlayer:SetText(KOO_POSITION_WORLDMAP_PLAYER_NA);
				else
					KoordinatorWorldMapPlayer:SetText(format("%s%.1f%s%.1f", KOO_POSITION_WORLDMAP_PLAYER, px, "||", py));
				end
				KoordinatorWorldMapCursor:SetText(format("%s%.1f%s%.1f", KOO_POSITION_WORLDMAP_CURSOR, mx, "||", my));
			end
			if(KOO_KSDA == 3) then
				KoordinatorCoordinateString = (GetZoneText() .. "(" .. GetSubZoneText() .. "), (" .. format("%.1f%s%.1f%s", px, "||", py, ")"));
				if(kooLastTell ~= nil) then
					if(UnitIsAFK("player")) then
						--Case AFK
						SendChatMessage(KOO_AUTOREPLY_MESSAGE, "WHISPER", nil, kooLastTell);
						SendChatMessage(KoordinatorCoordinateString, "WHISPER", nil, kooLastTell);
						SendChatMessage("", "AFK", nil, "1");
					else
						--Case DND
						SendChatMessage(KOO_AUTOREPLY_MESSAGE, "WHISPER", nil, kooLastTell);
						SendChatMessage(KoordinatorCoordinateString, "WHISPER", nil, kooLastTell);
					end
				elseif(ChatFrameEditBox:IsVisible()) then
					ChatFrameEditBox:Insert(KoordinatorCoordinateString);
				else
					SendChatMessage(KoordinatorCoordinateString, kooChatType, nil, "1");
				end
			end
		else
			if(KOO_KSDA == 1) then
				MinimapZoneText:SetText(format("%s%.1f%s%.1f", KOO_POSITION_MINIMAP_SHORT, px, ",", py));
			end
			if(KOO_KSDA == 2) then
				if(px == 0 and py == 0) then
					KoordinatorWorldMapPlayer:SetText(KOO_POSITION_WORLDMAP_PLAYER_NA);
				else
					KoordinatorWorldMapPlayer:SetText(format("%s%.1f%s%.1f", KOO_POSITION_WORLDMAP_PLAYER, px, ",", py));
				end
				KoordinatorWorldMapCursor:SetText(format("%s%.1f%s%.1f", KOO_POSITION_WORLDMAP_CURSOR, mx, ",", my));
			end
			if(KOO_KSDA == 3) then
				KoordinatorCoordinateString = (GetZoneText() .. "(" .. GetSubZoneText() .. "), (" .. format("%.1f%s%.1f%s", px, ",", py, ")"));
				if(kooLastTell ~= nil) then
					if(UnitIsAFK("player")) then
						--Case AFK
						SendChatMessage(KOO_AUTOREPLY_MESSAGE, "WHISPER", nil, kooLastTell);
						SendChatMessage(KoordinatorCoordinateString, "WHISPER", nil, kooLastTell);
						SendChatMessage("", "AFK", nil, "1");
					else
						--Case DND
						SendChatMessage(KOO_AUTOREPLY_MESSAGE, "WHISPER", nil, kooLastTell);
						SendChatMessage(KoordinatorCoordinateString, "WHISPER", nil, kooLastTell);
					end
				elseif(ChatFrameEditBox:IsVisible()) then
					ChatFrameEditBox:Insert(KoordinatorCoordinateString);
				else
					SendChatMessage(KoordinatorCoordinateString, kooChatType, nil, "1");
				end
			end
		end
	elseif(koordinatorSettings.slider == 3) then
		if(koordinatorSettings.divider == 1) then
			if(KOO_KSDA == 1) then
				MinimapZoneText:SetText(format("%s%.2f%s%.2f", KOO_POSITION_MINIMAP_SHORT, px, "||", py));
			end
			if(KOO_KSDA == 2) then
				if(px == 0 and py == 0) then
					KoordinatorWorldMapPlayer:SetText(KOO_POSITION_WORLDMAP_PLAYER_NA);
				else
					KoordinatorWorldMapPlayer:SetText(format("%s%.2f%s%.2f", KOO_POSITION_WORLDMAP_PLAYER, px, "||", py));
				end
				KoordinatorWorldMapCursor:SetText(format("%s%.2f%s%.2f", KOO_POSITION_WORLDMAP_CURSOR, mx, "||", my));
			end
			if(KOO_KSDA == 3) then
				KoordinatorCoordinateString = (GetZoneText() .. "(" .. GetSubZoneText() .. "), (" .. format("%.2f%s%.2f%s", px, "||", py, ")"));
				if(kooLastTell ~= nil) then
					if(UnitIsAFK("player")) then
						--Case AFK
						SendChatMessage(KOO_AUTOREPLY_MESSAGE, "WHISPER", nil, kooLastTell);
						SendChatMessage(KoordinatorCoordinateString, "WHISPER", nil, kooLastTell);
						SendChatMessage("", "AFK", nil, "1");
					else
						--Case DND
						SendChatMessage(KOO_AUTOREPLY_MESSAGE, "WHISPER", nil, kooLastTell);
						SendChatMessage(KoordinatorCoordinateString, "WHISPER", nil, kooLastTell);
					end
				elseif(ChatFrameEditBox:IsVisible()) then
					ChatFrameEditBox:Insert(KoordinatorCoordinateString);
				else
					SendChatMessage(KoordinatorCoordinateString, kooChatType, nil, "1");
				end		
			end
		else
			if(KOO_KSDA == 1) then
				MinimapZoneText:SetText(format("%s%.2f%s%.2f", KOO_POSITION_MINIMAP_SHORT, px, ",", py));
			end
			if(KOO_KSDA == 2) then
				if(px == 0 and py == 0) then
					KoordinatorWorldMapPlayer:SetText(KOO_POSITION_WORLDMAP_PLAYER_NA);
				else
					KoordinatorWorldMapPlayer:SetText(format("%s%.2f%s%.2f", KOO_POSITION_WORLDMAP_PLAYER, px, ",", py));
				end
				KoordinatorWorldMapCursor:SetText(format("%s%.2f%s%.2f", KOO_POSITION_WORLDMAP_CURSOR, mx, ",", my));
			end
			if(KOO_KSDA == 3) then
				KoordinatorCoordinateString = (GetZoneText() .. "(" .. GetSubZoneText() .. "), (" .. format("%.2f%s%.2f%s", px, ",", py, ")"));
				if(kooLastTell ~= nil) then
					if(UnitIsAFK("player")) then
						--Case AFK
						SendChatMessage(KOO_AUTOREPLY_MESSAGE, "WHISPER", nil, kooLastTell);
						SendChatMessage(KoordinatorCoordinateString, "WHISPER", nil, kooLastTell);
						SendChatMessage("", "AFK", nil, "1");
					else
						--Case DND
						SendChatMessage(KOO_AUTOREPLY_MESSAGE, "WHISPER", nil, kooLastTell);
						SendChatMessage(KoordinatorCoordinateString, "WHISPER", nil, kooLastTell);
					end
				elseif(ChatFrameEditBox:IsVisible()) then
					ChatFrameEditBox:Insert(KoordinatorCoordinateString);
				else
					SendChatMessage(KoordinatorCoordinateString, kooChatType, nil, "1");
				end		
			end
		end
	end		
end
--Options - End



--======================================================================================================================
--Functions for checking incompatibility - Start
--======================================================================================================================
function KoordinatorIncompatibilityChecker(inc)
	addonIncompatibilityArray = {};
	koordinatorMatchCounter = 0;
	for i = 1, GetNumAddOns(), 1 do
		addonIncompatibilityArray[i] = GetAddOnInfo(i);
		for j = 1, table.getn(addonIncompatibilityList), 1 do
			IncompatibilityListStringFinder = string.find (addonIncompatibilityList[j], ",");
			if(IncompatibilityListStringFinder ~= nil) then
				subStringAddonName = string.sub (addonIncompatibilityList[j], 1, (IncompatibilityListStringFinder - 1));
			end
			if(addonIncompatibilityArray[i] == subStringAddonName) then
				subStringAddonEndorsement = string.sub (addonIncompatibilityList[j], (IncompatibilityListStringFinder + 1));
				if(subStringAddonEndorsement == "pm") then
					savedSubStringAddonName = subStringAddonName;
				elseif(subStringAddonEndorsement == "wm") then
					if(IsAddOnLoaded(i)) then
						koordinatorSettings.incompatibilitySetter = 1;
					end
					if(IsAddOnLoaded(i) and koordinatorSettings.worldMap == 1) then
						KoordinatorPopup(i);
					elseif(inc ~= nil) then
						t = 1;
						KoordinatorPopup(i, t);
					end
				end
			else
				koordinatorMatchCounter = koordinatorMatchCounter + 1;
			end
		end
	end
	if(koordinatorMatchCounter == (GetNumAddOns() * table.getn(addonIncompatibilityList))) then
		koordinatorSettings.incompatibilitySetter = nil;
	end
end


function KoordinatorPopup(i, t)
	if(t ~= nil) then
		textSet = addonIncompatibilityArray[i] .. KOO_POPUP_TEXT1;
	elseif(i ~=nil) then
		textSet = addonIncompatibilityArray[i] .. KOO_POPUP_TEXT;
	end
	StaticPopupDialogs["KOORDINATOR_POPUP"] = {
	text = textSet,
	button1 = TEXT(OKAY),
	OnAccept = function()
		if(subStringAddonEndorsement == "wm" and koordinatorSettings.worldMap == 1) then
			DisableAddOn(i);
			ReloadUI();
		else
			EnableAddOn(i);
			ReloadUI();
		end

	end,
	timeout = 0,
	whileDead = 1,
	showAlert = 1,
	sound = "Deathbind Sound",
	};
	StaticPopup_Show("KOORDINATOR_POPUP");
end
--Functions for checking incompatibility - End
