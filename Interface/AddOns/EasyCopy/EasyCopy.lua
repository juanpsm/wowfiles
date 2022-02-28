ECVars = {};

local EasyCopy_Original_ChatFrame_OnEvent;
local EasyCopy_Original_SetItemRef;

EasyCopy_RecentAFK = {};
EasyCopy_RecentAFK_Time = {};
EasyCopy_RecentDND = {};
EasyCopy_RecentDND_Time = {};
EasyCopy_Channels = {"Channel 1", "Channel 2", "Channel 3", "Channel 4", "Channel 5", "Channel 6", "Channel 7", "Channel 8", "Channel 9", "Channel 10"};
EasyCopy_ClassColors = {
	Deathknight = "C41F3B";
	Druid   = "ff7d0a";
	Hunter  = "abd473";
	Mage    = "69ccf0";
	Paladin = "f58cba";
	Priest  = "ffffff";
	Rogue   = "fff569";
	Shaman  = "2459ff";
	Warlock = "9482c9";
	Warrior = "c79c6e";
}

function EasyCopy_OnLoad()
	if (not EasyCopy_Original_ChatFrame_OnEvent) then
		EasyCopy_Original_ChatFrame_OnEvent = ChatFrame_OnEvent;
	end
	if (strsub(GetBuildInfo(), 1, 1) == "2") then
		ChatFrame_OnEvent = EasyCopy_ChatFrame_v2_OnEvent;
	else
		ChatFrame_OnEvent = EasyCopy_ChatFrame_v3_OnEvent;
	end
	
	if (not EasyCopy_Original_SetItemRef) then
		EasyCopy_Original_SetItemRef = SetItemRef;
	end
	SetItemRef = EasyCopy_SetItemRef;
	
	EasyCopyTitle:SetText("EasyCopy");
	
	if(ECVars.msgPrefix == nil) then
		ECVars.msgPrefix = "";
		DEFAULT_CHAT_FRAME:AddMessage("This is the first time you are running EasyCopy. Type /ec to bring up the options frame.");
	end
	
	if(ECVars.buttons == nil) then
		ECVars.buttons = 0;
	end
	EasyCopy_UpdateButtons();
	
	if(ECVars.mWheelScroll == nil) then
		ECVars.mWheelScroll = 1;
	end
	EasyCopy_MWheelOverlay_Update();
	
	if(ECVars.tabFlashing == nil) then
		ECVars.tabFlashing = 1;
	end
	
	if(ECVars.shortMSG == nil) then
		ECVars.shortMSG = 0;
	end
	
	if(ECVars.stickyChannels == nil) then
		ECVars.stickyChannels = 0;
	end
	
	if(ECVars.movableBox == nil) then
		ECVars.movableBox = 0;
		ECVars.boxLeft = -13;
		ECVars.boxTop = -37;
	end
	
	if(ECVars.cLogCopying == nil) then
		ECVars.cLogCopying = 1;
	end
	
	if(ECVars.cColNames == nil) then
		ECVars.cColNames = 0;
	end
	
	if(ECVars.stickyChannels == 1) then
		ChatTypeInfo["CHANNEL"].sticky = 1;
		ChatTypeInfo["OFFICER"].sticky = 1;
	end
	
	if(ECVars.boxLeft ~= -13 and ECVars.boxTop ~= -37) then
		ChatFrameEditBox:ClearAllPoints();
		ChatFrameEditBox:SetPoint("TOPLEFT", "UIParent", "BOTTOMLEFT", ECVars.boxLeft, ECVars.boxTop);
		ChatFrameEditBox:SetPoint("TOPRIGHT", "UIParent", "BOTTOMLEFT", ECVars.boxLeft + ChatFrame1:GetWidth() + 10, ECVars.boxTop);
	end
	
	if (ECVars.classDB == nil) then
		ECVars.classDB = {};
	end
	
	
	ChatFrame1UpButton:SetScript("OnShow", EasyCopy_UpdateButtons);
	ChatFrame2UpButton:SetScript("OnShow", EasyCopy_UpdateButtons);
	ChatFrame3UpButton:SetScript("OnShow", EasyCopy_UpdateButtons);
	ChatFrame4UpButton:SetScript("OnShow", EasyCopy_UpdateButtons);
	ChatFrame5UpButton:SetScript("OnShow", EasyCopy_UpdateButtons);
	ChatFrame6UpButton:SetScript("OnShow", EasyCopy_UpdateButtons);
	ChatFrame7UpButton:SetScript("OnShow", EasyCopy_UpdateButtons);
	
	ChatFrame1TabFlash:SetScript("OnShow", EasyCopy_RemoveFlash);
	ChatFrame2TabFlash:SetScript("OnShow", EasyCopy_RemoveFlash);
	ChatFrame3TabFlash:SetScript("OnShow", EasyCopy_RemoveFlash);
	ChatFrame4TabFlash:SetScript("OnShow", EasyCopy_RemoveFlash);
	ChatFrame5TabFlash:SetScript("OnShow", EasyCopy_RemoveFlash);
	ChatFrame6TabFlash:SetScript("OnShow", EasyCopy_RemoveFlash);
	ChatFrame7TabFlash:SetScript("OnShow", EasyCopy_RemoveFlash);
	
	SlashCmdList["EasyCopy"] = EasyCopyCMD;
	SLASH_EasyCopy1 = "/easycopy";
	SLASH_EasyCopy2 = "/ec";
	
	EasyCopy_core:RegisterForDrag("LeftButton");
	EasyCopyOptions_core:RegisterForDrag("LeftButton");
	
	-- DEFAULT_CHAT_FRAME:AddMessage("EasyCopy loaded");
	-- UIErrorsFrame:AddMessage("EasyCopy loaded", 1.0, 1.0, 1.0, 1.0, UIERRORS_HOLD_TIME);
end

function EasyCopy_AddToClassDB(uname, uclass)
	if (ECVars.cColNames == 1) then
		if (uname ~= nil and uname ~= "Unknown" and uclass ~= nil and uclass ~= "Unknown") then
			if (uclass == "Death Knight") then
				uclass = "Deathknight";
			end
			ECVars.classDB[uname] = uclass;
		end
	end
end

function EasyCopy_OnEvent(event, arg1)
	if (event == "VARIABLES_LOADED") then
		EasyCopy_OnLoad();
	elseif (event == "PLAYER_ENTERING_WORLD") then
		EasyCopy_UpdateButtons();
	elseif (event == "GUILD_ROSTER_UPDATE") then
		for i = 1, GetNumGuildMembers(), 1 do
			local name, _, _, _, class, _, _, _, _, _ = GetGuildRosterInfo(i);
			EasyCopy_AddToClassDB(name, class);
		end
	elseif (event == "FRIENDLIST_UPDATE") then
		for i = 1, GetNumFriends(), 1 do
			local name, _, class, _, _, _, _ = GetFriendInfo(i);
			EasyCopy_AddToClassDB(name, class);
		end
	elseif (event == "WHO_LIST_UPDATE") then
		for i = 1, GetNumWhoResults(), 1 do
			local name, _, _, _, class, _, _ = GetWhoInfo(i);
			EasyCopy_AddToClassDB(name, class);
		end
	elseif (event == "RAID_ROSTER_UPDATE") then
		for i = 1, GetNumRaidMembers(), 1 do
			local name, _, _, _, class, _, _, _, _, _, _ = GetRaidRosterInfo(i);
			EasyCopy_AddToClassDB(name, class);
		end
	elseif (event == "PARTY_MEMBERS_CHANGED") then
		for i = 1, GetNumPartyMembers(), 1 do
			local name = UnitName("party"..i);
			local class = UnitClass("party"..i);
			EasyCopy_AddToClassDB(name, class);
		end
	elseif (event == "PLAYER_TARGET_CHANGED") then
		if (UnitIsPlayer("target") and UnitIsFriend("target", "player")) then
			local name = UnitName("target");
			local class = UnitClass("target");
			EasyCopy_AddToClassDB(name, class);
		end
	end
end

function EasyCopyCMD(msg)
	local args = "";
	cmd = strtrim(strlower(msg));
	if (strfind(cmd, " ") ~= nil) then
		args = strsub(cmd, strfind(cmd, " ") + 1);
		cmd = strsub(cmd, 0, strfind(cmd, " ") - 1);
	end
	
	if (cmd == "") then
		EasyCopyOptions_core:Show();
	elseif (cmd == "buttons") then
		if ((args == "" and ECVars.buttons == 0) or args == "off" or args == "1" or args == "hide") then
			ECVars.buttons = 1;
			EasyCopy_UpdateButtons();
			DEFAULT_CHAT_FRAME:AddMessage("EasyCopy - Scroll Buttons are now hidden");
		else
			ECVars.buttons = 0;
			EasyCopy_UpdateButtons();
			DEFAULT_CHAT_FRAME:AddMessage("EasyCopy - Scroll Buttons are now shown");
		end
	elseif (cmd == "mwheel") then
		if ((args == "" and ECVars.mWheelScroll == 0) or args == "on" or args == "1" or args == "enable") then
			ECVars.mWheelScroll = 1;
			DEFAULT_CHAT_FRAME:AddMessage("EasyCopy - Mouse wheel scrolling enabled");
		else
			ECVars.mWheelScroll = 0;
			DEFAULT_CHAT_FRAME:AddMessage("EasyCopy - Mouse wheel scrolling disabled");
		end
		EasyCopy_MWheelOverlay_Update();
	elseif (cmd == "flash") then
		if ((args == "" and ECVars.tabFlashing == 0) or args == "off" or args == "1" or args == "disable" or args == "hide") then
			ECVars.tabFlashing = 1;
			DEFAULT_CHAT_FRAME:AddMessage("EasyCopy - Tab-flashing disabled");
		else
			ECVars.tabFlashing = 0;
			DEFAULT_CHAT_FRAME:AddMessage("EasyCopy - Tab-flashing enabled");
		end
	elseif (cmd == "short") then
		if ((args == "" and ECVars.shortMSG == 0) or args == "on" or args == "1") then
			ECVars.shortMSG = 1;
			DEFAULT_CHAT_FRAME:AddMessage("EasyCopy - Displaying short messages");
		elseif (ECVars.shortMSG == 1) then
			ECVars.shortMSG = 0;
			DEFAULT_CHAT_FRAME:AddMessage("EasyCopy - Displaying original messages (long)");
		end
	elseif (cmd == "sticky") then
		if ((args == "" and ECVars.stickyChannels == 0) or args == "on" or args == "1" or args == "enable") then
			ECVars.stickyChannels = 1;
			ChatTypeInfo["CHANNEL"].sticky = 1;
			ChatTypeInfo["OFFICER"].sticky = 1;
			DEFAULT_CHAT_FRAME:AddMessage("EasyCopy - Sticky channels enabled");
		elseif (ECVars.stickyChannels == 1) then
			ECVars.stickyChannels = 0;
			ChatTypeInfo["CHANNEL"].sticky = 0;
			ChatTypeInfo["OFFICER"].sticky = 0;
			DEFAULT_CHAT_FRAME:AddMessage("EasyCopy - Sticky channels disabled");
		end
	elseif (cmd == "style") then
		ECVars.msgPrefix = tostring(args);
		if (args == "") then
			DEFAULT_CHAT_FRAME:AddMessage("EasyCopy - Message style: [13:37:00] [...");
		else
			DEFAULT_CHAT_FRAME:AddMessage("EasyCopy - Message style: "..ECVars.msgPrefix.." [...");
		end
	elseif (cmd == "flush") then
		ECVars.classDB = "";
		ECVars.classDB = {};
		DEFAULT_CHAT_FRAME:AddMessage("EasyCopy - The Lua garbage collector will take care of the class DB!");
	elseif (cmd == "memory" or cmd == "usage") then
		DEFAULT_CHAT_FRAME:AddMessage("EasyCopy uses "..(floor(GetAddOnMemoryUsage("EasyCopy") * 10) / 10).."kb memory.");
	end
end

function EasyCopy_UpdateButtons()
	if (ECVars.buttons == 1) then
		ChatFrameMenuButton:Hide();
		ChatFrame1UpButton:Hide();
		ChatFrame1DownButton:Hide();
		ChatFrame1BottomButton:Hide();
		ChatFrame2UpButton:Hide();
		ChatFrame2DownButton:Hide();
		ChatFrame2BottomButton:Hide();
		ChatFrame3UpButton:Hide();
		ChatFrame3DownButton:Hide();
		ChatFrame3BottomButton:Hide();
		ChatFrame4UpButton:Hide();
		ChatFrame4DownButton:Hide();
		ChatFrame4BottomButton:Hide();
		ChatFrame5UpButton:Hide();
		ChatFrame5DownButton:Hide();
		ChatFrame5BottomButton:Hide();
		ChatFrame6UpButton:Hide();
		ChatFrame6DownButton:Hide();
		ChatFrame6BottomButton:Hide();
		ChatFrame7UpButton:Hide();
		ChatFrame7DownButton:Hide();
		ChatFrame7BottomButton:Hide();
	else
		ChatFrameMenuButton:Show();
	end
end

function EasyCopy_RemoveFlash()
	if (ECVars.tabFlashing == 1) then
		UIFrameFlashRemoveFrame(this);
		this:Hide();
	end
end

function EasyCopy_ChatFrame_v2_OnEvent(event)
	EasyCopy_Original_ChatFrame_OnEvent(event);
	if(not this.EasyCopy_Original_AddMessage) then
		this.EasyCopy_Original_AddMessage = this.AddMessage;
		this.AddMessage = EasyCopy_AddMessage;
	end
end

function EasyCopy_ChatFrame_v3_OnEvent(self, event, ...)
	EasyCopy_Original_ChatFrame_OnEvent(self, event, ...);
	if(not this.EasyCopy_Original_AddMessage) then
		this.EasyCopy_Original_AddMessage = this.AddMessage;
		this.AddMessage = EasyCopy_AddMessage;
	end
end

function EasyCopy_AddMessage(this, msg, r, g, b, id)
	if (strfind(msg, "%d:%d%d:%d%d>") ~= nil and strfind(msg, "%d:%d%d:%d%d>") < 3) then
		local newmsg = "";
		if (ECVars.cLogCopying == 0) then
			newmsg = "["..strsub(msg, 1, strfind(msg, ">")-1).."]"..strsub(msg, strfind(msg,">")+1);
		else
			newmsg = "|Hezc:"..EasyCopy_UnlinkMessage(msg).."|h["..strsub(msg, 1, strfind(msg, ">")-1).."]|h"..strsub(msg, strfind(msg,">")+1);
		end
		this:EasyCopy_Original_AddMessage(newmsg, r, g, b, id);
		return;
	end
	
	if (strfind(msg, "|Hplayer.+|h%[(.-)%]|h: Level %d+ (.+) %- .+") ~= nil) then
		local _, _, uname, tcapt = strfind(msg, "|Hplayer.+|h%[(.-)%]|h: Level %d+ (.+) %- .+");
		if (uname ~= nil and tcapt ~= nil) then
			if (strfind(tcapt, "<.+>") ~= nil) then
				tcapt = strsub(tcapt, 1, strfind(tcapt, "<.+>") - 2);
			end
			tcapt = " "..tcapt..";";
			local _, _, tc1, tc2 = strfind(tcapt, ".* (%a+) (%a+);");
			if (tc1 == "Death" and tc2 == "Knight") then
				tc2 = "Deathknight";
			end
			if (tc2 ~= nil) then
				EasyCopy_AddToClassDB(uname, tc2);
			end
		end
	end
	
	local ctime = date("*t");
	local timestamp = "["..format("%02d:%02d:%02d", ctime["hour"], ctime["min"], ctime["sec"]).."]";
	if (ECVars.shortMSG == 0) then
		local newmsg = "|Hezc:"..EasyCopy_UnlinkMessage(msg).."|h"..timestamp.."|h "..msg;
		this:EasyCopy_Original_AddMessage(newmsg, r, g, b, id);
		return;
	end
	local tmsg = msg;
	local part = "";
	local done = False;
	local splittedmsg = {};
	local iterator = 0;
	for i = 1, strlen(tmsg) do
		if (tmsg == "") then break end
		if (strsub(tmsg, 1, 2) == "|H") then
			tinsert(splittedmsg, part);
			part = "|H";
			tmsg = strsub(tmsg, 3);
			iterator = 0;
		elseif (strsub(tmsg, 1, 2) == "|h") then
			if (strsub(part, 1, 2) ~= "|H") then
				iterator = -1;
				part = part.."||h";
				tmsg = strsub(tmsg, 3);
			else
				if (iterator == 1) then
					tinsert(splittedmsg, part.."|h");
					part = "";
					tmsg = strsub(tmsg, 3);
				else
					part = part.."|h";
					tmsg = strsub(tmsg, 3);
				end
				iterator = iterator + 1;
			end
		elseif (strsub(tmsg, 1, 2) == ": ") then
			if (strsub(part, 1, 2) ~= "|H") then
				iterator = -1;
				tinsert(splittedmsg, part..": ");
				part = "";
				tmsg = strsub(tmsg, 3);
			else
				part = part..strsub(tmsg, 1, 1);
				tmsg = strsub(tmsg, 2);
			end
		elseif (strsub(tmsg, 1, 7) == "{heart}") then
			part = part.."|TInterface\\AddOns\\EasyCopy\\heart:0|t";
			tmsg = strsub(tmsg, 8);
		elseif (strsub(tmsg, 1, 6) == "{herz}") then
			part = part.."|TInterface\\AddOns\\EasyCopy\\heart:0|t";
			tmsg = strsub(tmsg, 7);
		else
			part = part..strsub(tmsg, 1, 1);
			tmsg = strsub(tmsg, 2);
		end
	end
	if (part ~= "") then
		tinsert(splittedmsg, part);
	end
	local dpoint = 0;
	for i = 1, #splittedmsg do
		if (dpoint == 0) then
			if (strtrim(splittedmsg[i]) == "<AFK>") then
				splittedmsg[i] = gsub(splittedmsg[i], "<AFK>", "");
			elseif (strtrim(splittedmsg[i]) == "<DND>") then
				splittedmsg[i] = gsub(splittedmsg[i], "<DND>", "");
			elseif (strsub(splittedmsg[i], 1, 2) ~= "|H" and strfind(splittedmsg[i], ":") ~= nil) then
				if (strfind(splittedmsg[i], "%d:%d%d:%d%d") == nil) then
					dpoint = i;
				end
			end
		end
		if (ECVars.cColNames == 1 and strsub(splittedmsg[i], 1, 8) == "|Hplayer") then
			local _, _, cplayer = strfind(splittedmsg[i], "|h(.-)|h");
			local geklammert = 1;
			if (strsub(cplayer, 1, 1) == "[") then
				cplayer = strsub(cplayer, 2, -2);
			else
				geklammert = nil;
			end
			if (ECVars.classDB[cplayer] ~= nil) then
				if (EasyCopy_ClassColors[ECVars.classDB[cplayer]] ~= nil) then
					if (geklammert) then
						splittedmsg[i] = gsub(splittedmsg[i], "|h(.-)|h", "|h[|cff"..EasyCopy_ClassColors[ECVars.classDB[cplayer]]..cplayer.."|r]|h");
					else
						splittedmsg[i] = gsub(splittedmsg[i], "|h(.-)|h", "|h|cff"..EasyCopy_ClassColors[ECVars.classDB[cplayer]]..cplayer.."|r|h");
					end
				end
			end
		elseif (strsub(splittedmsg[i], 1, 9) == "|Hchannel") then
			local _, _, friendlyname = strfind(splittedmsg[i], "|h(.-)|h");
			splittedmsg[i] = friendlyname;
			splittedmsg[i] = gsub(splittedmsg[i], "%[(.-)%]", function (tmatch)
				local ident = "";
				local origmatch = tmatch;
				if (strfind(tmatch, "(%d+)%. (.+)") ~= nil) then
					local _, _, chnum, chname = strfind(tmatch, "(%d)%. (.+)");
					ident = tostring(chnum);
					if (ECVars.shortMSG == 2) then
						tmatch = tostring(chnum);
					else
						tmatch = chname;
					end
				elseif (tmatch == "Guild" or tmatch == "Gilde") then
					tmatch = "G";
				elseif (tmatch == "Officer" or tmatch == "Offizier") then
					tmatch = "O";
				elseif (tmatch == "Party" or tmatch == "Gruppe") then
					tmatch = "P";
				elseif (tmatch == "Raid" or tmatch == "Schlachtzug") then
					tmatch = "R";
				elseif (tmatch == "Raid Leader" or tmatch == "Schlachtzugsleiter") then
					tmatch = "R";
				elseif (tmatch == "Raid Warning" or tmatch == "Schlachtzugswarnung") then
					tmatch = "RW";
				elseif (tmatch == "Battleground" or tmatch == "Schlachtfeld") then
					tmatch = "BG";
				elseif (tmatch == "Battleground Leader" or tmatch == "Schlachtfeldleiter") then
					tmatch = "BG";
				else
					ident = "none";
				end
				if (ident == "") then
					if (tmatch == "RW") then
						ident = "w";
					else
						ident = strlower(strsub(tmatch, 1, 1));
					end
				end
				if (ident ~= "none") then
					if (ECVars.shortMSG == 3) then
						if (i < #splittedmsg) then
							if (strsub(splittedmsg[i + 1], 1, 1) == " ") then
								splittedmsg[i + 1] = strsub(splittedmsg[i + 1], 2);
							end
						end
						return "";
					end
					if ((dpoint == 0) or ((dpoint > 0) and (strfind(splittedmsg[dpoint], " Channel:") == nil))) then
						return "|Hezcc:"..ident.."|h["..tmatch.."]|h";
					else
						return "|Hezcc:"..ident.."|h["..origmatch.."]|h";
					end
				else
					return "["..tmatch.."]";
				end
			end);
		end
	end
	
	if (dpoint > 1) then
		if (strsub(splittedmsg[dpoint - 1], 1, 8) == "|Hplayer") then
			local _, _, cplayer = strfind(splittedmsg[dpoint - 1], "|h(.-)|h");
			cplayer = strsub(cplayer, 2, -2);
			if (splittedmsg[dpoint] == " whispers: ") then
				splittedmsg[dpoint] = ": ";
			elseif (splittedmsg[dpoint] == " is Away From Keyboard: " or splittedmsg[dpoint] == " ist nicht an der Tastatur: ") then
				local AFKmsg = "";
				for i = dpoint + 1, #splittedmsg do
					AFKmsg = AFKmsg..splittedmsg[i];
				end
				if (EasyCopy_RecentAFK_Time[cplayer] == nil) then
					EasyCopy_RecentAFK[cplayer] = AFKmsg;
				else
					if ((time() - 90) < EasyCopy_RecentAFK_Time[cplayer]) then
						if (EasyCopy_RecentAFK[cplayer] == AFKmsg) then
							EasyCopy_RecentAFK_Time[cplayer] = time();
							return;
						else
							EasyCopy_RecentAFK[cplayer] = AFKmsg;
						end
					end
				end
				EasyCopy_RecentAFK_Time[cplayer] = time();
				splittedmsg[dpoint] = " AFK: ";
			elseif (splittedmsg[dpoint] == " does not wish to be disturbed: " or splittedmsg[dpoint] == " m\195\182chte nicht gest\195\182rt werden: ") then
				local DNDmsg = "";
				for i = dpoint + 1, #splittedmsg do
					DNDmsg = DNDmsg..splittedmsg[i];
				end
				if (EasyCopy_RecentDND_Time[cplayer] == nil) then
					EasyCopy_RecentDND[cplayer] = DNDmsg;
				else
					if ((time() - 90) < EasyCopy_RecentDND_Time[cplayer]) then
						if (EasyCopy_RecentDND[cplayer] == DNDmsg) then
							EasyCopy_RecentDND_Time[cplayer] = time();
							return;
						else
							EasyCopy_RecentDND[cplayer] = DNDmsg;
						end
					end
				end
				EasyCopy_RecentDND_Time[cplayer] = time();
				splittedmsg[dpoint] = " DND: ";
			end
		end
	end
	if (dpoint > 1 and (splittedmsg[dpoint] == " whispers: " or splittedmsg[dpoint] == " fl\195\188stert:")) then
		if (strsub(splittedmsg[dpoint - 1], 1, 8) == "|Hplayer") then
			splittedmsg[dpoint] = ": ";
		end
	end
	
	local newmsg = "";
	for i = 1, #splittedmsg do
		--if (newmsg ~= "") then
			--newmsg = newmsg.."_";
		--end
		newmsg = newmsg..splittedmsg[i];
	end
	-- local newmsg = gsub(msg, "|", "||");
	newmsg = "|Hezc:"..EasyCopy_UnlinkMessage(newmsg).."|h"..timestamp.."|h "..newmsg;
	this:EasyCopy_Original_AddMessage(gsub(newmsg, "|", "|"), r, g, b, id);
end

function EasyCopy_UnlinkMessage(linkedmessage)
	local msg = "";
	local part = "";
	local mode = 0;
	if (GetLocale() == "deDE") then
		linkedmessage = gsub(linkedmessage, "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_1:0|t", "{stern}");
		linkedmessage = gsub(linkedmessage, "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_2:0|t", "{kreis}");
		linkedmessage = gsub(linkedmessage, "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_3:0|t", "{diamant}");
		linkedmessage = gsub(linkedmessage, "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_4:0|t", "{dreieck}");
		linkedmessage = gsub(linkedmessage, "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_5:0|t", "{mond}");
		linkedmessage = gsub(linkedmessage, "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_6:0|t", "{quadrat}");
		linkedmessage = gsub(linkedmessage, "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_7:0|t", "{kreuz}");
		linkedmessage = gsub(linkedmessage, "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_8:0|t", "{totensch\195\164del}");
		linkedmessage = gsub(linkedmessage, "|TInterface\\AddOns\\EasyCopy\\heart:0|t", "{herz}");
	else
		linkedmessage = gsub(linkedmessage, "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_1:0|t", "{star}");
		linkedmessage = gsub(linkedmessage, "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_2:0|t", "{circle}");
		linkedmessage = gsub(linkedmessage, "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_3:0|t", "{diamond}");
		linkedmessage = gsub(linkedmessage, "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_4:0|t", "{triangle}");
		linkedmessage = gsub(linkedmessage, "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_5:0|t", "{moon}");
		linkedmessage = gsub(linkedmessage, "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_6:0|t", "{square}");
		linkedmessage = gsub(linkedmessage, "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_7:0|t", "{cross}");
		linkedmessage = gsub(linkedmessage, "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_8:0|t", "{skull}");
		linkedmessage = gsub(linkedmessage, "|TInterface\\AddOns\\EasyCopy\\heart:0|t", "{heart}");
	end
	
	while (strfind(linkedmessage, "(%d-) |4(.-):(.-);")) do
		local _, _, num, sing, plur = strfind(linkedmessage, "(%d-) |4(.-):(.-);");
		if (num == "1") then
			linkedmessage = gsub(linkedmessage, "(%d-) |4(.-):(.-);", num.." "..sing, 1);
		else
			linkedmessage = gsub(linkedmessage, "(%d-) |4(.-):(.-);", num.." "..plur, 1);
		end
	end
	
	local retStat = 0;
	for i = 1, strlen(linkedmessage) do
		if (linkedmessage == "") then break end
		if (mode == 0) then
			if (strsub(linkedmessage, 1, 2) == "|H") then
				mode = 1;
				linkedmessage = strsub(linkedmessage, 3);
			elseif (strsub(linkedmessage, 1, 2) == "|T") then
				mode = 3;
				retStat = 0;
				linkedmessage = strsub(linkedmessage, 3);
				part = "";
			elseif (strsub(linkedmessage, 1, 2) == "||") then
				linkedmessage = strsub(linkedmessage, 3);
				msg = msg.."||";
			elseif (strsub(linkedmessage, 1, 2) == "|c") then
				linkedmessage = strsub(linkedmessage, 11);
			elseif (strsub(linkedmessage, 1, 2) == "|C") then
				linkedmessage = strsub(linkedmessage, 11);
			elseif (strsub(linkedmessage, 1, 2) == "|r") then
				linkedmessage = strsub(linkedmessage, 3);
			elseif (strsub(linkedmessage, 1, 2) == "|R") then
				linkedmessage = strsub(linkedmessage, 3);
			else
				msg = msg..strsub(linkedmessage, 1, 1);
				linkedmessage = strsub(linkedmessage, 2);
			end
		elseif (mode == 1) then
			if (strsub(linkedmessage, 1, 2) == "|h") then
				mode = 2;
				linkedmessage = strsub(linkedmessage, 3);
			else
				linkedmessage = strsub(linkedmessage, 2);
			end
		elseif (mode == 2) then
			if (strsub(linkedmessage, 1, 2) == "|h") then
				mode = 0;
				linkedmessage = strsub(linkedmessage, 3);
			elseif (strsub(linkedmessage, 1, 2) == "|T") then
				mode = 3;
				retStat = 2;
				linkedmessage = strsub(linkedmessage, 3);
				part = "";
			elseif (strsub(linkedmessage, 1, 2) == "||") then
				linkedmessage = strsub(linkedmessage, 3);
				msg = msg.."||";
			elseif (strsub(linkedmessage, 1, 2) == "|c") then
				linkedmessage = strsub(linkedmessage, 11);
			elseif (strsub(linkedmessage, 1, 2) == "|C") then
				linkedmessage = strsub(linkedmessage, 11);
			elseif (strsub(linkedmessage, 1, 2) == "|r") then
				linkedmessage = strsub(linkedmessage, 3);
			elseif (strsub(linkedmessage, 1, 2) == "|R") then
				linkedmessage = strsub(linkedmessage, 3);
			else
				msg = msg..strsub(linkedmessage, 1, 1);
				linkedmessage = strsub(linkedmessage, 2);
			end
		elseif (mode == 3) then
			if (strsub(linkedmessage, 1, 2) == "|t") then
				mode = retStat;
				linkedmessage = strsub(linkedmessage, 3);
				if (strsub(part, 1, -4) == "Interface\\TargetingFrame\\UI-RaidTargetingIcon_") then
					local iconList;
					if (GetLocale() == "deDE") then
						iconList = {"stern", "kreis", "diamant", "dreieck", "mond", "quadrat", "kreuz", "totensch\195\164del"};
					else
						iconList = {"star", "circle", "diamond", "triangle", "moon", "square", "cross", "skull"};
					end
					msg = msg.."{"..iconList[tonumber(strsub(part, -3, -3))].."}";
				elseif (part == "Interface\\AddOns\\EasyCopy\\heart:0") then
					if (GetLocale() == "deDE") then
						msg = msg.."{herz}";
					else
						msg = msg.."{heart}";
					end
				end
			else
				part = part..strsub(linkedmessage, 1, 1);
				linkedmessage = strsub(linkedmessage, 2);
			end
		end
	end
	msg = gsub(gsub(msg, "/", "/1"), "|", "/2");
	return msg;
end

function EasyCopy_SetItemRef(link, text, button)
	if ( strsub(link, 1, 4) == "ezc:" ) then
		local chatmsg = gsub(gsub(strsub(link, 5), "/2", "|"), "/1", "/");
		if (ChatFrameEditBox:IsShown() == nil) then
			if (IsShiftKeyDown()) then
				if (ChatFrameEditBox:GetAttribute("chatType") == "CHANNEL") then
					SendChatMessage(chatmsg, "CHANNEL", nil, ChatFrameEditBox:GetAttribute("channelTarget"));
				elseif (ChatFrameEditBox:GetAttribute("chatType") == "WHISPER") then
					SendChatMessage(chatmsg, "WHISPER", nil, ChatFrameEditBox:GetAttribute("tellTarget"));
				else
					SendChatMessage(chatmsg, ChatFrameEditBox:GetAttribute("chatType"), nil);
				end
			else
				if (not EasyCopy_core:IsShown()) then
					EasyCopy_core:Show();
					EasyCopy_core:SetBackdropColor(0, 0, 0, 0.9);
					EasyCopy_Edit:SetFont(DEFAULT_CHAT_FRAME:GetFont());
					EasyCopy_Edit:SetText("");
				end
				if (EasyCopy_Edit:GetText() == "") then
					EasyCopy_Edit:SetText(chatmsg);
				else
					EasyCopy_Edit:SetText(EasyCopy_Edit:GetText().."\n"..chatmsg);
				end
				-- EasyCopy_Edit:HighlightText();
				EasyCopy_Edit:SetFocus();
			end
		else
			if (IsShiftKeyDown()) then
				if (ChatFrameEditBox:GetAttribute("chatType") == "CHANNEL") then
					SendChatMessage(chatmsg, "CHANNEL", nil, ChatFrameEditBox:GetAttribute("channelTarget"));
				elseif (ChatFrameEditBox:GetAttribute("chatType") == "WHISPER") then
					SendChatMessage(chatmsg, "WHISPER", nil, ChatFrameEditBox:GetAttribute("tellTarget"));
				else
					SendChatMessage(chatmsg, ChatFrameEditBox:GetAttribute("chatType"), nil);
				end
			else
				ChatFrameEditBox:Insert(chatmsg);
			end
		end
		return;
	elseif ( strsub(link, 1, 5) == "ezcc:" ) then
		if (ChatFrameEditBox:IsShown() == nil and not IsShiftKeyDown()) then
			ChatFrameEditBox:Show();
		end
		local chanID = strsub(link, 6, 6);
		if (chanID == "g") then
			ChatFrameEditBox:SetAttribute("chatType", "GUILD");
			ChatEdit_UpdateHeader(ChatFrameEditBox);
		elseif (chanID == "o") then
			ChatFrameEditBox:SetAttribute("chatType", "OFFICER");
			ChatEdit_UpdateHeader(ChatFrameEditBox);
		elseif (chanID == "p") then
			ChatFrameEditBox:SetAttribute("chatType", "PARTY");
			ChatEdit_UpdateHeader(ChatFrameEditBox);
		elseif (chanID == "r") then
			ChatFrameEditBox:SetAttribute("chatType", "RAID");
			ChatEdit_UpdateHeader(ChatFrameEditBox);
		elseif (chanID == "w") then
			ChatFrameEditBox:SetAttribute("chatType", "RAID_WARNING");
			ChatEdit_UpdateHeader(ChatFrameEditBox);
		elseif (chanID == "b") then
			ChatFrameEditBox:SetAttribute("chatType", "BATTLEGROUND");
			ChatEdit_UpdateHeader(ChatFrameEditBox);
		else
			if (IsShiftKeyDown()) then
				ListChannelByName(strsub(link, 6, 6));
			else
				ChatFrameEditBox:SetAttribute("chatType", "CHANNEL");
				ChatFrameEditBox:SetAttribute("channelTarget", strsub(link, 6, 6));
				ChatEdit_UpdateHeader(ChatFrameEditBox);
			end
		end
		return;
	end
	EasyCopy_Original_SetItemRef(link, text, button);
end

function EasyCopy_MWheelOverlay_OnShow()
	EasyCopy_UpdateButtons();
	if (this:GetParent():GetFrameLevel() > 1) then
		this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1);
	end
end

function EasyCopy_MWheelOverlay_OnMWheel(value)
	if (value < 0) then
		if IsShiftKeyDown() then
			this:GetParent():ScrollToBottom();
		else
			this:GetParent():ScrollDown();
			this:GetParent():ScrollDown();
		end
	else
		this:GetParent():ScrollUp();
		this:GetParent():ScrollUp();
	end
end

function EasyCopy_MWheelOverlay_Update()
	if (ECVars.mWheelScroll == 0) then
		ChatFrame1MWheelOverlay:Hide();
		ChatFrame2MWheelOverlay:Hide();
		ChatFrame3MWheelOverlay:Hide();
		ChatFrame4MWheelOverlay:Hide();
		ChatFrame5MWheelOverlay:Hide();
		ChatFrame6MWheelOverlay:Hide();
		ChatFrame7MWheelOverlay:Hide();
	else
		ChatFrame1MWheelOverlay:Show();
		ChatFrame2MWheelOverlay:Show();
		ChatFrame3MWheelOverlay:Show();
		ChatFrame4MWheelOverlay:Show();
		ChatFrame5MWheelOverlay:Show();
		ChatFrame6MWheelOverlay:Show();
		ChatFrame7MWheelOverlay:Show();
	end
end

function EasyCopyOptions_CheckButtonClick(button)
	local buttonID = strlower(strsub(button:GetName(), strfind(button:GetName(), "_") + 1));
	if (buttonID == "buttons") then
		if (button:GetChecked()) then
			ECVars.buttons = 1;
		else
			ECVars.buttons = 0;
		end
		EasyCopy_UpdateButtons();
	elseif (buttonID == "mwheelscroll") then
		if (button:GetChecked()) then
			ECVars.mWheelScroll = 1;
		else
			ECVars.mWheelScroll = 0;
		end
		EasyCopy_MWheelOverlay_Update();
	elseif (buttonID == "tabflashing") then
		if (button:GetChecked()) then
			ECVars.tabFlashing = 1;
		else
			ECVars.tabFlashing = 0;
		end
	elseif (buttonID == "stickychannels") then
		if (button:GetChecked()) then
			ECVars.stickyChannels = 1;
		else
			ECVars.stickyChannels = 0;
		end
		ChatTypeInfo["CHANNEL"].sticky = ECVars.stickyChannels;
		ChatTypeInfo["OFFICER"].sticky = ECVars.stickyChannels;
	elseif (buttonID == "classcolors") then
		if (button:GetChecked()) then
			ECVars.cColNames = 1;
		else
			ECVars.cColNames = 0;
			ECVars.classDB = "";
			ECVars.classDB = {};
		end
	elseif (buttonID == "movablebox") then
		if (button:GetChecked()) then
			ECVars.movableBox = 1;
			ChatFrameEditBox:SetMovable();
			ChatFrameEditBox:RegisterForDrag("LeftButton");
			ChatFrameEditBox:SetScript("OnDragStart", ChatFrameEditBox.StartMoving);
			ChatFrameEditBox:SetScript("OnDragStop", EasyCopy_SaveBoxPosition);
		else
			ECVars.movableBox = 0;
			ChatFrameEditBox:RegisterForDrag();
			ChatFrameEditBox:SetScript("OnDragStart", nil);
			ChatFrameEditBox:SetMovable(0);
		end
	elseif (buttonID == "combatlog") then
		if (button:GetChecked()) then
			ECVars.cLogCopying = 1;
		else
			ECVars.cLogCopying = 0;
		end
	elseif (buttonID == "shortmessages_orig") then
		EasyCopyOptions_ShortMessages_Orig:SetChecked(1);
		EasyCopyOptions_ShortMessages_Long:SetChecked(0);
		EasyCopyOptions_ShortMessages_Medium:SetChecked(0);
		EasyCopyOptions_ShortMessages_Short:SetChecked(0);
		ECVars.shortMSG = 0;
	elseif (buttonID == "shortmessages_long") then
		EasyCopyOptions_ShortMessages_Orig:SetChecked(0);
		EasyCopyOptions_ShortMessages_Long:SetChecked(1);
		EasyCopyOptions_ShortMessages_Medium:SetChecked(0);
		EasyCopyOptions_ShortMessages_Short:SetChecked(0);
		ECVars.shortMSG = 1;
	elseif (buttonID == "shortmessages_medium") then
		EasyCopyOptions_ShortMessages_Orig:SetChecked(0);
		EasyCopyOptions_ShortMessages_Long:SetChecked(0);
		EasyCopyOptions_ShortMessages_Medium:SetChecked(1);
		EasyCopyOptions_ShortMessages_Short:SetChecked(0);
		ECVars.shortMSG = 2;
	elseif (buttonID == "shortmessages_short") then
		EasyCopyOptions_ShortMessages_Orig:SetChecked(0);
		EasyCopyOptions_ShortMessages_Long:SetChecked(0);
		EasyCopyOptions_ShortMessages_Medium:SetChecked(0);
		EasyCopyOptions_ShortMessages_Short:SetChecked(1);
		ECVars.shortMSG = 3;
	end
end

function EasyCopyOptions_LoadVars()
	EasyCopyOptions_Buttons:SetChecked(ECVars.buttons);
	EasyCopyOptions_MWheelScroll:SetChecked(ECVars.mWheelScroll);
	EasyCopyOptions_TabFlashing:SetChecked(ECVars.tabFlashing);
	EasyCopyOptions_StickyChannels:SetChecked(ECVars.stickyChannels);
	EasyCopyOptions_ClassColors:SetChecked(ECVars.cColNames);
	EasyCopyOptions_MovableBox:SetChecked(ECVars.movableBox);
	EasyCopyOptions_CombatLog:SetChecked(ECVars.cLogCopying);
	EasyCopyOptions_MsgPrefix:SetText(tostring(ECVars.msgPrefix));
	EasyCopyOptions_ShortMessages_Long:SetChecked(0);
	EasyCopyOptions_ShortMessages_Medium:SetChecked(0);
	EasyCopyOptions_ShortMessages_Short:SetChecked(0);
	EasyCopyOptions_ShortMessages_Orig:SetChecked(0);
	if (ECVars.shortMSG == 1) then
		EasyCopyOptions_ShortMessages_Long:SetChecked(1);
	elseif (ECVars.shortMSG == 2) then
		EasyCopyOptions_ShortMessages_Medium:SetChecked(1);
	elseif (ECVars.shortMSG == 3) then
		EasyCopyOptions_ShortMessages_Short:SetChecked(1);
	else
		EasyCopyOptions_ShortMessages_Orig:SetChecked(1);
	end
end

function EasyCopy_QuoteButton_OnClick()
	if (ChatFrameEditBox:IsShown()) then
		local text = EasyCopy_Edit:GetText();
		text = gsub(gsub(text, "\r\n", "\n"), "\r", "");
		local coutput = {};
		local i = 1;
		local pos = 0;
		while (strfind(text, "\n")) do
			pos = strfind(text, "\n");
			coutput[i] = strsub(text, 1, pos - 1);
			i = i + 1;
			if ((pos + 1) > strlen(text)) then
				text = "";
			else
				text = strsub(text, pos + 1);
			end
		end
		if (text ~= "") then
			coutput[i] = text;
		end
		for i = 1, #(coutput), 1 do
			if (ChatFrameEditBox:GetAttribute("chatType") == "WHISPER") then
				SendChatMessage(coutput[i], "WHISPER", nil, ChatFrameEditBox:GetAttribute("tellTarget"));
			elseif (ChatFrameEditBox:GetAttribute("chatType") == "CHANNEL") then
				SendChatMessage(coutput[i], "CHANNEL", nil, ChatFrameEditBox:GetAttribute("channelTarget"));
			else
				SendChatMessage(coutput[i], ChatFrameEditBox:GetAttribute("chatType"));
			end
		end
	else
		ToggleDropDownMenu(1, nil, EasyCopy_QuoteDropDown, EasyCopy_QuoteButton, 0, 0);
	end
end

function EasyCopy_QuoteDropDown_OnLoad()
	local buttons = {
		[1]  = {"s",  "Say"},
		[2]  = {"y",  "Yell"},
		[3]  = {"w",  "Whisper"},
		[4]  = {"g",  "Guild"},
		[5]  = {"o",  "Officer"},
		[6]  = {"p",  "Party"},
		[7]  = {"r",  "Raid"},
		[8]  = {"b",  "Battleground"},
		[9]  = {"c1", EasyCopy_Channels[1]},
		[10] = {"c2", EasyCopy_Channels[2]},
		[11] = {"c3", EasyCopy_Channels[3]},
		[12] = {"c4", EasyCopy_Channels[4]},
		[13] = {"c5", EasyCopy_Channels[5]},
		[14] = {"c6", EasyCopy_Channels[6]},
		[15] = {"c7", EasyCopy_Channels[7]},
		[16] = {"c8", EasyCopy_Channels[8]},
		[17] = {"c9", EasyCopy_Channels[9]},
		[18] = {"c10", EasyCopy_Channels[10]},
	}
	local info = {};
	info.func = EasyCopy_QuoteDropDown_OnClick 
	info.notCheckable = 1;
	local info2 = { notCheckable = 1, notClickable = 1, text = " " };
	for i = 1, #(buttons), 1 do
		info.value = buttons[i][1];
		info.text  = buttons[i][2];
		UIDropDownMenu_AddButton(info);
		if (i == 8) then
			UIDropDownMenu_AddButton(info2);
		end
	end
end

function EasyCopy_QuoteDropDown_OnClick(b)
	local text = EasyCopy_Edit:GetText();
	text = gsub(gsub(text, "\r\n", "\n"), "\r", "");
	local coutput = {};
	local i = 1;
	local pos = 0;
	local channelID = {s = "SAY", y = "YELL", g = "GUILD", o = "OFFICER", p = "PARTY", r = "RAID", b = "BATTLEGROUND"};
	while (strfind(text, "\n")) do
		pos = strfind(text, "\n");
		coutput[i] = strsub(text, 1, pos - 1);
		i = i + 1;
		if ((pos + 1) > strlen(text)) then
			text = "";
		else
			text = strsub(text, pos + 1);
		end
	end
	if (text ~= "") then
		coutput[i] = text;
	end
	for i = 1, #(coutput), 1 do
		if (b.value == "w") then
			if (ChatFrameEditBox:GetAttribute("chatType") == "WHISPER") then
				SendChatMessage(coutput[i], "WHISPER", nil, ChatFrameEditBox:GetAttribute("tellTarget"));
			else
				ChatFrame1:AddMessage("Usage: Open the chatbox and set a whisper target; You can do that for example by clicking on a name in chat.", 1, 0, 0);
				return;
			end
		elseif (channelID[b.value]) then
			SendChatMessage(coutput[i], channelID[b.value]);
		else
			-- ### b.value, 2, 2
			SendChatMessage(coutput[i], "CHANNEL", nil, tonumber(strsub(b.value, 2)));
		end
	end
end


function EasyCopy_SaveBoxPosition()
	ChatFrameEditBox:StopMovingOrSizing();
	ECVars.boxLeft = ChatFrameEditBox:GetLeft();
	ECVars.boxTop = ChatFrameEditBox:GetTop();
end


function EasyCopy_ResetEditBox()
	ChatFrameEditBox:ClearAllPoints();
	ChatFrameEditBox:SetPoint("TOPLEFT", "ChatFrame1", "BOTTOMLEFT", -5, -2);
	ChatFrameEditBox:SetPoint("TOPRIGHT", "ChatFrame1", "BOTTOMRIGHT", 5, -2);
	ECVars.boxLeft = -13;
	ECVars.boxTop = -37;
end





function ECMWhisper(wto, wtext)
	SendChatMessage(gsub(wtext, "||", "|") , "WHISPER" , nil, wto);
end



function ECmytest(start)
	-- local kids = { ChatFrame1BottomButton:GetParent():GetParent():GetChildren() };
	local kids = { UIParent:GetChildren() };
	local counters = 0;
	if (start == nil) then
		start = 1;
	end
	local numb = 15;
	for _,child in ipairs(kids) do
		if (counters == 0) then
			DEFAULT_CHAT_FRAME:AddMessage("# Children of: "..tostring(child:GetParent():GetName()), 1, 1, 0);
		end
		counters = counters + 1;
		if (counters >= start) then
			DEFAULT_CHAT_FRAME:AddMessage("#"..counters..": "..tostring(child:GetName()), 1, 1, 0);
		end
		if (counters > (start+numb-2)) then
			return;
		end
	end
end

function lolhugs()
	local frame = CreateFrame("Frame")
	function frame:OnUpdate()
		if (lasthug + 4 < time()) then
			DoEmote("hug", "Mogic");
			lasthug = time();
		end
	end
	frame:SetScript("OnUpdate", frame.OnUpdate)
end

lasthug = 0;