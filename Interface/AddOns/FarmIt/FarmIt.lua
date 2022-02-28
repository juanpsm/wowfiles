--[[
## Interface: 30000
##
## Title: FarmIt
## Notes: Custom loot tracker. By CHiLLZ [v1.7]
## SavedVariablesPerCharacter: FI_Config
## SavedVariables: FI_Saved
##
## Author: CHiLLZ <chillz@gmail.com>
## License: Copyright 2006-2009, Chillz Media. All rights reserved.

To Do:
	Set color of notification text.

	Set font size/color of item text.

	Farming templates - ability to save a set of item ID's as a farming "template".

	Multiple bars.

	Add an item via chat link, etc.

	Right-click interacts with actual inventory item. ie- For combining motes into primals.

	Set a time marker to track farming "sessions"
	This would need logging functionality if it is going to provide historical info once session is over.

	Basic money tracking during a "session".

	Calculate estimated drop rates for tracked items.

	Respawn timer.

	Work with auctioneer to track $$ value of items farmed?

]]--

--------------------------------------------------------------------------------
--  GLOBAL VARS
--------------------------------------------------------------------------------
FI_Debug = false;
FI_Title = "FarmIt"
FI_Version = 1.63;
FI_MaxSlots = 12;
FI_Loading = false;
local FI_Selected = nil;
local FI_Selected_Data = nil;

--------------------------------------------------------------------------------
--  DEFAULT SETTINGS
--------------------------------------------------------------------------------
function FI_Defaults()
	-- eliminate any potential for orphaned table keys
	FI_Config = nil;
	-- do garbage collection because Lua table pointers are awesome for creating memory leaks...
	collectgarbage("collect");

	-- default settings
	FI_Config = {
		["Version"] = FI_Version,

		-- general settings
		["NumBars"] = 1,
		["Show"] = true,
		["Locked"] = false,
		["Notify"] = {
			["Objective"] = true,
			["Progress"] = true,
			["Color"] = {
				["R"] = 0.9,
				["G"] = 0.9,
				["B"] = 0.3,
			},
		},

		-- item bars
		["Bars"] = {
			["FI_B1"] = {
				["Title"] = FI_Title,
				["NumSlots"] = 2,
				["Direction"] = 1,
				["Align"] = 2,
				["Scale"] = 1,
				["Spacing"] = 6,

				["Text"] = true,
				["Scale_Text"] = 1,
				["Color_Text"] = {
					["R"] = 0.9,
					["G"] = 0.9,
					["B"] = 0.3,
				},

				["Alpha_Background"] = 0.75,
				["Alpha_Icon"] = 1,
				["Alpha_Border"] = 0.9,
				["Alpha_Numbers"] = 1,
				["Alpha_Text"] = 0.9,
			},
		},

		-- item slots
		["Slots"] = {
			["FI_B1_S1"] = {
				["Item"] = false,
				["IncludeBank"] = false,
				["Quantity"] = 0,
				["Objective"] = 0,
				["Notified"] = false,
			},
		},
	}

end

--------------------------------------------------------------------------------
--  OPTIONS PANEL
--------------------------------------------------------------------------------
function FI_GetOptions( FI_Bar )
	if (bar == nil) then
		bar = "FI_B1";
	end

	-- checkboxes
	FI_Options_CB1:SetChecked( FI_Config["Show"] );
	FI_Options_CB2:SetChecked( FI_Config["Locked"] );
	FI_Options_CB3:SetChecked( FI_Config["Notify"]["Objective"] );
	FI_Options_CB4:SetChecked( FI_Config["Notify"]["Progress"] );
	FI_Options_CB5:SetChecked( FI_Config["Bars"][bar]["Text"] );
	
	-- sliders
	FI_Options_SL1:SetValue( FI_Config["Bars"][bar]["Direction"] );
	FI_Options_SL2:SetValue( FI_Config["Bars"][bar]["Align"] );
	FI_Options_SL3:SetValue( FI_Config["Bars"][bar]["Scale"] );
	FI_Options_SL4:SetValue( FI_Config["Bars"][bar]["Spacing"] );
	FI_Options_SL5:SetValue( FI_Config["Bars"][bar]["Alpha_Background"] );
	FI_Options_SL6:SetValue( FI_Config["Bars"][bar]["Alpha_Icon"] );
	FI_Options_SL7:SetValue( FI_Config["Bars"][bar]["Alpha_Border"] );
	FI_Options_SL8:SetValue( FI_Config["Bars"][bar]["Alpha_Numbers"] );
	FI_Options_SL9:SetValue( FI_Config["Bars"][bar]["Alpha_Text"] );
end

--------------------------------------------------------------------------------
--  LOADING
--------------------------------------------------------------------------------
function FI_OnLoad()
	FI:RegisterForDrag("LeftButton");
	FI:RegisterEvent("ADDON_LOADED");
	FI:RegisterEvent("VARIABLES_LOADED");
	FI:RegisterEvent("UNIT_INVENTORY_CHANGED");
	FI:RegisterEvent("BAG_UPDATE");
	
	SlashCmdList["farmit"] = FI_Command;
	SLASH_farmit1 = "/farmit";
end

function FI_OnShow()
	FI:SetClampedToScreen(true);
end

function FI_OnEvent()
	if (event == "ADDON_LOADED" and arg1 == FI_Title) then
		FI_Loader();
	end
	
	if (event == "UNIT_INVENTORY_CHANGED" or "BAG_UPDATE") then
		FI_Update();
	end
end

function FI_Loader()
	-- loading flag
	FI_Loading = true;

	-- runtime config check
	if (FI_Config == nil) then
		-- first run
		FI_Defaults();
		DEFAULT_CHAT_FRAME:AddMessage( "FarmIt v"..FI_Version.." initialized!  By CHiLLZ" );
	elseif (FI_Config["Version"] == nil) then
		-- no version info, must be old installation
		FI_Defaults();
		DEFAULT_CHAT_FRAME:AddMessage( "FarmIt v"..FI_Version.." upgraded!  By CHiLLZ" );
	elseif (FI_Version > FI_Config["Version"]) then
		-- updated version
		FI_Defaults();
		DEFAULT_CHAT_FRAME:AddMessage( "FarmIt v"..FI_Version.." upgraded.  By CHiLLZ" );
	else
		-- normal load
		DEFAULT_CHAT_FRAME:AddMessage( "FarmIt v"..FI_Version.." loaded.  By CHiLLZ" );
	end

	-- slash interface
	DEFAULT_CHAT_FRAME:AddMessage( "  For more information, type:  /farmit" );

	-- apply saved settings
	for b=1,FI_Config["NumBars"] do
		-- CREATE BAR --
		local bar = "FI_B"..b;
		FI_CreateBar(bar, FI, FI);

		-- apply scaling
		FI_SetScale(bar);
		-- transparency
		FI_SetAlpha(bar);
		-- bar alignment
		FI_TextAlign(bar);
		FI_MoveSlots(bar);
		-- bar visibility
		FI_SetBar(bar);
		FI_TextVis(bar);

		-- initialize options panel
		FI_GetOptions(bar);
		FI_Options_Title:SetText("FarmIt  v"..FI_Version);
		FI_Options_Credits:SetText("By CHiLLZ (Somnifer of Icecrown)");
	end

	-- set visibility
	if (FI_Config["Show"]) then
		FI:Show();
	else
		FI:Hide();
	end

	-- done loading
	FI_Loading = false;
end

function FI_Reset()
	FI_Loading = true;

	-- restore default settings
	FI_Defaults();

	-- move to default location
	FI:ClearAllPoints();
	FI:SetPoint("LEFT", "UIParent", "LEFT", 0, 0);
	PlaySound("igCharacterInfoClose");
	
	-- bar settings
	for b=1,FI_Config["NumBars"] do
		local bar = "FI_B"..b;
		getglobal(bar.."_Anchor_Title"):SetText( FI_Config["Bars"][bar]["Title"] );

		-- clear all slot contents
		for s=1,FI_MaxSlots do
			local slot = bar.."_S"..s;
			FI_ClearSlot(slot);
		end

		-- apply scaling
		FI_SetScale(bar);
		-- transparency
		FI_SetAlpha(bar);
		-- other graphical options
		FI_TextAlign(bar);
		FI_TextVis(bar);
		-- bar alignment
		FI_MoveSlots(bar);
		-- set bar size
		FI_SetBar(bar);

		-- reset options panel
		FI_GetOptions(bar);
	end

	-- done
	FI:Show();
	DEFAULT_CHAT_FRAME:AddMessage( "Farmit:  Default settings restored." );

	FI_Loading = false;
end

--------------------------------------------------------------------------------
--  SAVED ITEM SETS
--------------------------------------------------------------------------------
function FI_SaveItems( bar, name )
	if (name == nil) then
		name = bar;
	end
	
	-- need some logic here to index the saved array and get the next 'id' value
	local id = FI_Config['NumBars'];

	FI_Saved[id]['bar'] = bar;
	FI_Saved[id]['name'] = name;

	for s=1,FI_MaxSlots do
		local slot = bar.."_S"..s;
		
		FI_Saved[id][s] = FI_Config["Slots"][slot]["Item"];
	end
end

function FI_LoadItems( id )
	bar = FI_Saved[id]['bar'];
	name = FI_Saved[id]['name'];

	-- set bar title
	getglobal(bar.."_Anchor_Title"):SetText(FI_Config["Bars"][bar]["Title"]);

	-- load item ID's into all the slots
	for s=1,FI_MaxSlots do
		local slot = bar.."_S"..s;
		
		-- update config data with new item ID's (reset all other slot-specific settings)
		FI_Config["Slots"][slot]["Item"] = FI_Saved[id][s];
		FI_Config["Slots"][slot]["IncludeBank"] = false;
		FI_Config["Slots"][slot]["Quantity"] = 0;
		FI_Config["Slots"][slot]["Objective"] = 0;
		FI_Config["Slots"][slot]["Notified"] = false;

		-- apply changes to slot frame
		FI_SetSlot(slot);
	end
end

--------------------------------------------------------------------------------
--  FRAME CREATION
--------------------------------------------------------------------------------
function FI_CreateBar( bar, parent, anchor )
	-- create bar using template frame
	local b = CreateFrame("Frame", bar, parent, "FI_TPL_BAR");
	b:SetFrameStrata("BACKGROUND");
	b:SetWidth(38);
	b:SetHeight(36);
	b:SetPoint("BOTTOM", anchor, "BOTTOM", 0,0);

	-- set bar title
	getglobal(bar.."_Anchor_Title"):SetText(FI_Config["Bars"][bar]["Title"]);

	-- create slots
	for s=1,FI_MaxSlots do
		-- assemble frame name
		local slot = bar.."_S"..s;
		
		-- dynamic anchoring
		if (s > 1) then
			local prev = "_S"..s-1;
			anchor = bar..prev;
		else
			anchor = bar;
		end
		
		-- create slot frame
		FI_CreateSlot(slot, bar, anchor);
		
		-- load contents
		FI_SetSlot(slot);
	end
end

function FI_CreateSlot( slot, bar, anchor )
	-- create slot using template
	local s = CreateFrame("Frame", slot, getglobal(bar), "FI_TPL_SLOT");
	s:SetFrameStrata("BACKGROUND");
	s:SetWidth(36);
	s:SetHeight(36);

	local space = FI_Config["Bars"][bar]["Spacing"];

	-- orientation
	if (FI_Config["Bars"][bar]["Orientation"] == "VERTICAL") then
		s:SetPoint("BOTTOM", anchor, "TOP", 0,space);
	elseif (FI_Config["Bars"][bar]["Orientation"] == "HORIZONTAL") then
		-- note: this part breaks if using getglobal(bar)
		if (FI_Config["Bars"][bar]["Align"] == "RIGHT") then
			s:SetPoint("LEFT", anchor, "RIGHT", space,0);
		else
			s:SetPoint("RIGHT", anchor, "LEFT", -space,0);
		end
	end

	-- initialize array fields if they don't exist
	-- apparently lua is really picky about trying to reference fields that dont already exist
	if (FI_Config["Slots"][slot] == nil) then
		FI_Config["Slots"][slot] = {
				["Item"] = false,
				["IncludeBank"] = false,
				["Quantity"] = 0,
				["Objective"] = 0,
				["Notified"] = false,
		};
	end
end

function FI_SetSlot( slot )
	local itemID = FI_Config["Slots"][slot]["Item"];
	local includeBank = FI_Config["Slots"][slot]["IncludeBank"];

	if (itemID) then
		local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture = GetItemInfo(itemID);
		local itemCount = GetItemCount(itemID, includeBank);
		FI_Config["Slots"][slot]["Quantity"] = itemCount;

		getglobal(slot.."_Icon"):SetTexture(itemTexture);
		getglobal(slot.."_Count"):SetText(itemCount);
		getglobal(slot.."_Text"):SetText(itemName);
		
		-- item quantity objective
		FI_SetObjective(slot);

		if (FI_Debug) then 
			DEFAULT_CHAT_FRAME:AddMessage( "Farmit:  "..slot.." set to "..itemLink );
		end
	else
		FI_ClearSlot(slot);
	end

	if (includeBank) then
		getglobal(slot.."_Count"):SetVertexColor(1, 1, 0);
	else
		getglobal(slot.."_Count"):SetVertexColor(1, 1, 1);
	end
end

function FI_ClearSlot( slot )
	FI_Config["Slots"][slot] = {
			["Item"] = false,
			["IncludeBank"] = false,
			["Quantity"] = 0,
			["Objective"] = 0,
			["Notified"] = false,
	};
	
	FI_ClearObjective(slot);
	
	getglobal(slot.."_Icon"):SetTexture("");
	getglobal(slot.."_Count"):SetText("0");
	getglobal(slot.."_Count"):SetVertexColor(1, 1, 1);
	getglobal(slot.."_Text"):SetText("");
end

function FI_Update()
	local bar = "FI_B1";
	for s=1,FI_Config["Bars"][bar]["NumSlots"] do
		local slot = "FI_B1_S"..s;
		local itemID = FI_Config["Slots"][slot]["Item"];
		local includeBank = FI_Config["Slots"][slot]["IncludeBank"];

		if (itemID) then
			-- get item link, etc
			local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount = GetItemInfo(itemID);

			-- check item counts
			local itemCount = GetItemCount(itemID, includeBank);
			local prevCount = FI_Config["Slots"][slot]["Quantity"];

			-- update values
			FI_Config["Slots"][slot]["Quantity"] = itemCount;
			getglobal(slot.."_Count"):SetText(itemCount);

			-- check farming progress
			FI_Progress(slot, sLink, prevCount);
		end
	end
end

--------------------------------------------------------------------------------
--  ITEM SLOTS
--------------------------------------------------------------------------------
function FI_Tooltip( slot )
	local bar = "FI_B1";
	if (FI_Config["Slots"][slot]["Item"] and not FI_Config["Bars"][bar]["Text"]) then
		local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount = GetItemInfo(FI_Config["Slots"][slot]["Item"]);
		GameTooltip:SetOwner(getglobal(slot), "ANCHOR_TOPLEFT");
		GameTooltip:SetText(sName);
	end
end

function FI_Click( slot )
	if (arg1 == "RightButton") then
		------------------------------------------------------------
		-- clear slot contents
		------------------------------------------------------------
		FI_ClearSlot(slot);

		if (FI_Selected == slot) then 
			FI_Deselect();
		end
		PlaySound("igMainMenuClose");

	elseif (CursorHasItem()) then
		------------------------------------------------------------
		-- get item off cursor
		------------------------------------------------------------
		local cursorType, itemID, cursorLink = GetCursorInfo();
		ClearCursor();
		
		-- clear old objective
		FI_ClearObjective(slot);

		-- set slot contents
		FI_Config["Slots"][slot]["Item"] = itemID;
		FI_SetSlot(slot);

	elseif (FI_Selected) then
		------------------------------------------------------------
		-- move item
		------------------------------------------------------------
		if (FI_Selected == slot) then 
			------------------------------------------------------------
			-- cancel the selection (same slot was clicked)
			------------------------------------------------------------
			FI_Deselect();

		elseif (FI_Config["Slots"][slot]["Item"]) then
			------------------------------------------------------------
			-- move target slot item to previously selected slot (swap)
			------------------------------------------------------------
			FI_Config["Slots"][FI_Selected] = FI_Config["Slots"][slot];
			-- set selected (previous) slot contents
			FI_SetSlot(FI_Selected);

			-- clear target slot
			FI_ClearSlot(slot);
			-- set target slot contents
			FI_Config["Slots"][slot] = FI_Selected_Data;
			FI_SetSlot(slot);

			-- clear previous selection
			FI_Deselect();
		else
			------------------------------------------------------------
			-- move item into empty slot
			------------------------------------------------------------
			FI_Config["Slots"][slot] = FI_Selected_Data;
			-- set target slot contents
			FI_SetSlot(slot);

			-- clear previous slot
			FI_ClearSlot(FI_Selected);
			FI_Deselect();
		end

	elseif (not IsShiftKeyDown() and not IsControlKeyDown()) then
		------------------------------------------------------------
		-- select slot contents
		------------------------------------------------------------
		if (FI_Config["Slots"][slot]["Item"]) then
			FI_Select(slot);
		end

	end
end

function FI_Select( slot )
	FI_Selected = slot;
	FI_Selected_Data = FI_Config["Slots"][slot];

	-- show selection indicator
	getglobal(slot.."_Glow"):Show();
	PlaySound("igAbilityIconPickup");
end

function FI_Deselect()
	if (FI_Selected) then
		getglobal(FI_Selected.."_Glow"):Hide();
		PlaySound("igAbilityIconDrop");

		FI_Selected = nil;
		FI_Selected_Data = nil;
		
		-- do garbage collection cause Lua memory management is sweet. >_<
		collectgarbage("collect");
	end
end

function FI_ToggleBank( slot )
	if (FI_Config["Slots"][slot]["Item"]) then
		-- change setting
		FI_Config["Slots"][slot]["IncludeBank"] = FI_Toggle(FI_Config["Slots"][slot]["IncludeBank"]);
		
		
		-- apply change
		if (FI_Config["Slots"][slot]["IncludeBank"]) then
			getglobal(slot.."_Count"):SetVertexColor(1, 1, 0);
		else
			getglobal(slot.."_Count"):SetVertexColor(1, 1, 1);
		end
		
		-- update item counts
		FI_Update();

		if (FI_Loading == false) then
			PlaySound("TalentScreenClose");
		end
		DEFAULT_CHAT_FRAME:AddMessage( "FarmIt:  "..slot.." IncludeBank = "..FI_Boolean(FI_Config["Slots"][slot]["IncludeBank"])	);
	end
end

function FI_EditObjective( currentSlot )
	-- hide any other open edit boxes
	local bar = "FI_B1";
	for s=1,FI_MaxSlots do
		local slot = bar.."_S"..s;
		getglobal(slot.."_Edit"):Hide();
	end
	-- show requested edit box
	getglobal(currentSlot.."_Edit"):Show();
	-- auto select text for editing
	getglobal(currentSlot.."_Edit"):HighlightText();
end

function FI_SetObjective( slot, editbox )
	-- get user input?
	if (editbox) then
		FI_Config["Slots"][slot]["Objective"] = getglobal(slot.."_Edit"):GetNumber();
	end

	-- apply settings
	getglobal(slot.."_Objective"):SetText( FI_Config["Slots"][slot]["Objective"] );
	getglobal(slot.."_Edit"):SetText( FI_Config["Slots"][slot]["Objective"] );

	if (FI_Config["Slots"][slot]["Objective"] > 0) then
		-- check item information
		FI_Update();
		-- show objective frame
		getglobal(slot.."_Objective"):Show();
	else
		-- don't show objective frame
		getglobal(slot.."_Objective"):Hide();
	end
end

function FI_ClearObjective( slot )
	FI_Config["Slots"][slot]["Objective"] = 0;
	getglobal(slot.."_Objective"):SetText( FI_Config["Slots"][slot]["Objective"] );
	getglobal(slot.."_Edit"):SetText( FI_Config["Slots"][slot]["Objective"] );

	getglobal(slot.."_Objective"):Hide();
end

function FI_Progress( slot, sLink, prevCount )
	if (FI_Config["Slots"][slot]["Item"] and (FI_Loading == false)) then
		local R = FI_Config["Notify"]["Color"]["R"];
		local G = FI_Config["Notify"]["Color"]["G"];
		local B = FI_Config["Notify"]["Color"]["B"];

		-- deal with font color and notification flag
		if (FI_Config["Slots"][slot]["Quantity"] < FI_Config["Slots"][slot]["Objective"]) then
			-- reset notification flag
			FI_Config["Slots"][slot]["Notified"] = false;
			-- set default font color
			getglobal(slot.."_Objective"):SetVertexColor(1, .2, .2);
		else
			-- update objective font color
			getglobal(slot.."_Objective"):SetVertexColor(0.3, 1, 0.3);
		end

		-- check a ton of stuff to know whether its time to say "grats you win" or not
		if (FI_Config["Notify"]["Objective"]
			and (FI_Config["Slots"][slot]["Objective"] > 0)
			and (FI_Config["Slots"][slot]["Quantity"] >= FI_Config["Slots"][slot]["Objective"])
			and (FI_Config["Slots"][slot]["Notified"] == false)
		) then
			-- set notification flag
			FI_Config["Slots"][slot]["Notified"] = true;
			-- display objective success
			local message = "Farming objective met for "..sLink.."  ("..FI_Config["Slots"][slot]["Quantity"].."/"..FI_Config["Slots"][slot]["Objective"]..")";
			UIErrorsFrame:AddMessage(message, R,G,B);
		elseif (FI_Config["Notify"]["Progress"] and (FI_Config["Slots"][slot]["Quantity"] > prevCount) and not IsShiftKeyDown()) then
			-- display loot progress message
			local message = "Farming progress:  "..sLink.."  ("..FI_Config["Slots"][slot]["Quantity"]..")";
			UIErrorsFrame:AddMessage(message, R,G,B);
		end
	end
end

--------------------------------------------------------------------------------
--  BAR FUNCTIONALITY
--------------------------------------------------------------------------------
function FI_ChangeBar( action )
	-- adjusts how many slots on the bar
	local bar = "FI_B1";
	local current = FI_Config["Bars"][bar]["NumSlots"];
	
	-- change setting
	if (action == "+" and current < FI_MaxSlots) then
		FI_Config["Bars"][bar]["NumSlots"] = current+1;
		PlaySound("gsTitleOptionOK");
	elseif (action == "-" and current > 0) then
		FI_Config["Bars"][bar]["NumSlots"] = current-1;
		PlaySound("gsTitleOptionOK");
	end
	
	-- apply the change
	FI_SetBar("FI_B1");
	FI_Update();
end

function FI_SetBar( bar )
	-- applies bar slot visibility
	for s=1,FI_MaxSlots do
		local slot = bar.."_S"..s;
		getglobal(slot):Hide();
	end
	
	for s=1,FI_Config["Bars"][bar]["NumSlots"] do
		local slot = bar.."_S"..s;
		getglobal(slot):Show();
	end
end

function FI_MoveSlots( bar )
	-- determine orientation
	if (FI_Config["Bars"][bar]["Direction"] == 1) then
		-- vertical
		point = "BOTTOM";
		relative = "TOP";
		x = 0;
		y = FI_Config["Bars"][bar]["Spacing"];

		-- show text labels in vertical mode
		if (FI_Loading == false) then
			FI_Config["Bars"][bar]["Text"] = true;
		end
	elseif (FI_Config["Bars"][bar]["Direction"] == 2) then
		-- horizontal
		if (FI_Config["Bars"][bar]["Align"] == 1) then
			-- grow to the left
			point = "RIGHT";
			relative = "LEFT";
			x = -FI_Config["Bars"][bar]["Spacing"];
			y = 0;
		elseif (FI_Config["Bars"][bar]["Align"] == 2) then
			-- grow to the right
			point = "LEFT";
			relative = "RIGHT";
			x = FI_Config["Bars"][bar]["Spacing"];
			y = 0;
		end
		
		-- hide text labels in horizontal mode
		FI_Config["Bars"][bar]["Text"] = false;
	end
	
	for s=1,FI_MaxSlots do
		local slot = bar.."_S"..s;

		-- dynamic anchoring
		if (s > 1) then
			local prev = "_S"..s-1;
			anchor = bar..prev;
		else
			anchor = bar;
		end
		
		-- set position
		getglobal(slot):ClearAllPoints();
		getglobal(slot):SetPoint(point, anchor, relative, x,y);
	end
	
	-- handle item text
	FI_TextVis(bar);
end

function FI_SetScale( bar )
	-- apply setting
	for s=1,FI_MaxSlots do
		local slot = bar.."_S"..s;
		getglobal(slot):SetScale( FI_Config["Bars"][bar]["Scale"] );
	end
end

function FI_SetAlpha( bar )
	-- apply settings
	for s=1,FI_MaxSlots do
		local slot = bar.."_S"..s;

		-- slot background
		getglobal(slot.."_Background"):SetAlpha( FI_Config["Bars"][bar]["Alpha_Background"] );
		-- item icon
		getglobal(slot.."_Icon"):SetAlpha( FI_Config["Bars"][bar]["Alpha_Icon"] );
		-- slot border
		getglobal(slot.."_Border"):SetAlpha( FI_Config["Bars"][bar]["Alpha_Border"] );
		-- item count and objective
		getglobal(slot.."_Count"):SetAlpha( FI_Config["Bars"][bar]["Alpha_Numbers"] );
		getglobal(slot.."_Objective"):SetAlpha( FI_Config["Bars"][bar]["Alpha_Numbers"] );
		-- item text
		getglobal(slot.."_Text"):SetAlpha( FI_Config["Bars"][bar]["Alpha_Text"] );
	end
end

--------------------------------------------------------------------------------
--  ITEM TEXT
--------------------------------------------------------------------------------
function FI_TextVis( bar )
	for s=1,FI_MaxSlots do
		local slot = bar.."_S"..s;

		if (FI_Config["Bars"][bar]["Text"]) then
			getglobal(slot.."_Text"):Show();
		else
			getglobal(slot.."_Text"):Hide();
		end
	end
end

function FI_TextAlign( bar )
	if (FI_Config["Bars"][bar]["Align"] == 1) then
		align = "LEFT";
		point = "RIGHT";
		x = "-10";
	elseif (FI_Config["Bars"][bar]["Align"] == 2) then
		align = "RIGHT";
		point = "LEFT";
		x = "10";
	end

	for s=1,FI_MaxSlots do
		local slot = bar.."_S"..s;
		local anchor = slot.."_Icon";
		
		getglobal(slot.."_Text"):ClearAllPoints();
		getglobal(slot.."_Text"):SetPoint(point, anchor, align, x,0);
	end
end

function FI_TextColor( bar )
	for s=1,FI_MaxSlots do
		local slot = bar.."_S"..s;

		local R = FI_Config["Bars"][bar]["Color_Text"]["R"];
		local G = FI_Config["Bars"][bar]["Color_Text"]["G"];
		local B = FI_Config["Bars"][bar]["Color_Text"]["B"];
		
		getglobal(slot.."_Text"):SetVertexColor(R,G,B);
	end
end

function FI_TextSize( bar )

end

--------------------------------------------------------------------------------
--  SLASH COMMANDS
--------------------------------------------------------------------------------
function FI_Command( cmd, val )
	if (cmd == "") then
		DEFAULT_CHAT_FRAME:AddMessage(
			"FarmIt:  Available commands..."
		);
		DEFAULT_CHAT_FRAME:AddMessage(
			"    /farmit help\n"..
			"        Show the help window."
		);
		DEFAULT_CHAT_FRAME:AddMessage( 
			"    /farmit options\n"..
			"        Show the options panel."
		);
		DEFAULT_CHAT_FRAME:AddMessage( 
			"    /farmit show\n"..
			"    /farmit hide\n"..
			"        Toggle visibility of the entire mod."
		);
		DEFAULT_CHAT_FRAME:AddMessage( 
			"    /farmit reset\n"..
			"        Reset the mod to default settings."
		);
	
	elseif (cmd == "help") then
		FI_Help:Show();
		FI_Options:Hide();

	elseif (cmd == "options") then
		FI_Options:Show();
		FI_Help:Hide();

	elseif (cmd == "show") then
		FI_Config["Show"] = true;
		FI:Show();
		DEFAULT_CHAT_FRAME:AddMessage( "FarmIt:  Show = "..FI_Boolean(FI_Config["Show"]) );

	elseif (cmd == "hide") then
		FI_Config["Show"] = false;
		FI:Hide();
		DEFAULT_CHAT_FRAME:AddMessage( "FarmIt:  Show = "..FI_Boolean(FI_Config["Show"]) );

	elseif (cmd == "reset") then
		FI_Reset();

	end
end

--------------------------------------------------------------------------------
--  STATISTICS
--------------------------------------------------------------------------------
function FI_Stats( itemID )
	-- future version
end

--------------------------------------------------------------------------------
--  HELPER FUNCTIONS
--------------------------------------------------------------------------------
function FI_Boolean( value )
	local text;
	
	if (value) then
		text = "true";
	else
		text = "false";
	end
	
	return text;
end

function FI_Toggle( value )
	if (value) then
		value = false;
	else
		value = true;
	end
	return value;
end
