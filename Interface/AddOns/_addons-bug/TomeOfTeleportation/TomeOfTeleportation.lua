local AddonName = "TomeOfTeleportation"
local AddonTitle = "Tome of Teleportation"
local HearthString = "Hearth"

local TeleporterParentFrame = nil
local CastSpell = nil
local ItemSlot = nil
local OldItems = {}
local ButtonSettings = {}
local IsVisible = false

local ButtonInset = 6

local InvTypeToSlot = 
{	
	["INVTYPE_FEET"] = 8,
	["INVTYPE_FINGER"] = 11,
	["INVTYPE_TRINKET"] = 13,
	["INVTYPE_2HWEAPON"] = 16,
	["INVTYPE_WEAPONMAINHAND"] = 16,
	["INVTYPE_TABARD"] = 19
}

-- { id, isItem, destination }
-- If there are multiple spells or items with the same name, only one should be included in the list.
-- Every other part of the add-on uses names instead of item ids, ids are only used for the initial name look up.
local TeleporterSpells = 
{
	{ 556, false, HearthString },		-- Astral Recall
	{ 6948, true, HearthString },		-- Hearthstone
	{ 37118, true, HearthString },		-- Scroll of Recall
	{ 44314, true, HearthString },		-- Scroll of Recall II
	{ 44315, true, HearthString },		-- Scroll of Recall III
	
	{ 17690, true, "Alterac Valley" },	-- Frostwolf Insignia Rank 1
	{ 17905, true, "Alterac Valley" },	-- Frostwolf Insignia Rank 2
	{ 17906, true, "Alterac Valley" },	-- Frostwolf Insignia Rank 3
	{ 17907, true, "Alterac Valley" },	-- Frostwolf Insignia Rank 4
	{ 17908, true, "Alterac Valley" },	-- Frostwolf Insignia Rank 5
	{ 17909, true, "Alterac Valley" },	-- Frostwolf Insignia Rank 6
	{ 17691, true, "Alterac Valley" },	-- Stormpike Insignia Rank 1
	{ 17900, true, "Alterac Valley" },	-- Stormpike Insignia Rank 2
	{ 17901, true, "Alterac Valley" },	-- Stormpike Insignia Rank 3
	{ 17902, true, "Alterac Valley" },	-- Stormpike Insignia Rank 4
	{ 17903, true, "Alterac Valley" },	-- Stormpike Insignia Rank 5
	{ 17904, true, "Alterac Valley" },	-- Stormpike Insignia Rank 6

	{ 32757, true, "Black Temple" },	-- Blessed Medallion of Karabor
	
	{ 37863, true, "Blackrock Depths" },-- Direbrew's Remote
	
	{ 30544, true, "Blade's Edge" },	-- Ultrasafe Transporter - Toshley's Station

	{ 50287, true, "Booty Bay" },		-- Boots of the Bay

	{ 53140, false, "Dalaran" },		-- Teleport: Dalaran
	{ 53142, false, "Dalaran" },		-- Portal: Dalaran
	-- ilvl 200 rings
	{ 40586, true, "Dalaran" },			-- Band of the Kirin Tor
	{ 44934, true, "Dalaran" },			-- Loop of the Kirin Tor
	{ 44935, true, "Dalaran" },			-- Ring of the Kirin Tor
	{ 40585, true, "Dalaran" },			-- Signet of the Kirin Tor
	-- ilvl 213 rings
	{ 45688, true, "Dalaran" },			-- Inscribed Band of the Kirin Tor
	{ 45689, true, "Dalaran" },			-- Inscribed Loop of the Kirin Tor
	{ 45690, true, "Dalaran" },			-- Inscribed Ring of the Kirin Tor
	{ 45691, true, "Dalaran" },			-- Inscribed Signet of the Kirin Tor
	-- ilvl 226 rings
	{ 48954, true, "Dalaran" },			-- Etched Band of the Kirin Tor
	{ 48955, true, "Dalaran" },			-- Etched Loop of the Kirin Tor
	{ 48956, true, "Dalaran" },			-- Etched Ring of the Kirin Tor
	{ 48957, true, "Dalaran" },			-- Etched Signet of the Kirin Tor
	-- ilvl 251 rings
	{ 51560, true, "Dalaran" },			-- Runed Band of the Kirin Tor
	{ 51558, true, "Dalaran" },			-- Runed Loop of the Kirin Tor
	{ 51559, true, "Dalaran" },			-- Runed Ring of the Kirin Tor
	{ 51557, true, "Dalaran" },			-- Runed Signet of the Kirin Tor
	
	{ 43824, true, "Dalaran" },			-- The Schools of Arcane Magic - Mastery

	{ 3565, false, "Darnassus" },		-- Teleport: Darnassus
	{ 11419, false, "Darnassus" },		-- Portal: Darnassus

	{ 50977, false, "Ebon Hold" },		-- Death Gate

	{ 18984, true, "Winterspring" },	-- Dimensional Ripper - Everlook

	{ 32271, false, "Exodar" },			-- Teleport: Exodar
	{ 32266, false, "Exodar" },			-- Portal: Exodar

	{ 46874, true, "Icecrown" },		-- Argent Crusader's Tabard

	{ 3562, false, "Ironforge" },		-- Teleport: Ironforge
	{ 11416, false, "Ironforge" },		-- Portal: Ironforge

	{ 22589, true, "Karazhan" },		-- Atiesh, Greatstaff of the Guardian
	--{ 22630, true, "Karazhan" },		-- Atiesh, Greatstaff of the Guardian
	--{ 22631, true, "Karazhan" },		-- Atiesh, Greatstaff of the Guardian
	--{ 22632, true, "Karazhan" },		-- Atiesh, Greatstaff of the Guardian

	{ 18960, false, "Moonglade" },		-- Teleport: Moonglade

	{ 30542, true, "Netherstorm" },		-- Dimensional Ripper - Area 52

	{ 48933, true, "Northrend" },		-- Wormhole Generator: Northrend

	{ 3567, false, "Orgrimmar" },		-- Teleport: Orgrimmar
	{ 11417, false, "Orgrimmar" },		-- Portal: Orgrimmar

	{ 33690, false, "Shattrath" },		-- Teleport: Shattrath (Alliance)
	{ 33691, false, "Shattrath" },		-- Portal: Shattrath (Alliance)
	--{ 35715, false, "Shattrath" },		-- Teleport: Shattrath (Horde)
	--{ 35717, false, "Shattrath" },		-- Portal: Shattrath (Horde)

	{ 32272, false, "Silvermoon" },		-- Teleport: Silvermoon
	{ 32267, false, "Silvermoon" },		-- Portal: Silvermoon

	{ 49358, false, "Stonard" },		-- Teleport: Stonard
	{ 49361, false, "Stonard" },		-- Portal: Stonard

	{ 3561, false, "Stormwind" },		-- Teleport: Stormwind
	{ 10059, false, "Stormwind" },		-- Portal: Stormwind

	{ 18986, true, "Tanaris" },			-- Ultrasafe Transporter - Gadgetzan

	{ 49359, false, "Theramore" },		-- Teleport: Theramore
	{ 49360, false, "Theramore" },		-- Portal: Theramore

	{ 3566, false, "Thunder Bluff" },	-- Teleport: Thunder Bluff
	{ 11420, false, "Thunder Bluff" },	-- Portal: Thunder Bluff

	{ 3563, false, "Undercity" },		-- Teleport: Undercity
	{ 11418, false, "Undercity" },		-- Portal: Undercity
}

function Teleporter_OnEvent(self, event, ...)
	if event == "ADDON_LOADED" then
		local loadedAddon = ...
		if string.upper(loadedAddon) == string.upper(AddonTitle) then
			Teleporter_OnAddonLoaded()			
		end
	elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
		local player, spell = ...
		if spell == CastSpell then
			TeleporterClose()
		end
	elseif event == "UNIT_INVENTORY_CHANGED" then
		TeleporterUpdateAllButtons()
	elseif event == "PLAYER_REGEN_DISABLED" then
		-- Can't close while in combat due to secure buttons, so disable Esc key
		if TeleporterParentFrame then
			local frameIndex = TeleporterFindInSpecialFrames()
			if frameIndex then
				tremove(UISpecialFrames,frameIndex);
			end
		end
	elseif event == "PLAYER_REGEN_ENABLED" then
		if TeleporterParentFrame then
			if not TeleporterFindInSpecialFrames() then
				tinsert(UISpecialFrames,TeleporterParentFrame:GetName());
			end
		end
	end
end

function TeleporterFindInSpecialFrames()
	for i,f in ipairs(UISpecialFrames) do
		if f == TeleporterParentFrame:GetName() then
			return i
		end
	end
	return nil
end

function Teleporter_OnLoad() 
	SlashCmdList["TELEPORTER"] = TeleporterSlashCmdFunction
	SLASH_TELEPORTER1 = "/tomeofteleport"
	SLASH_TELEPORTER2 = "/tele"	

	SlashCmdList["TELEPORTEREQUIP"] = TeleporterEquipSlashCmdFunction
	SLASH_TELEPORTEREQUIP1 = "/teleporterequip"

	SlashCmdList["TELEPORTERUSEITEM"] = TeleporterUseItemSlashCmdFunction
	SLASH_TELEPORTERUSEITEM1 = "/teleporteruseitem"

	SlashCmdList["TELEPORTERCASTSPELL"] = TeleporterCastSpellSlashCmdFunction
	SLASH_TELEPORTERCASTSPELL1 = "/teleportercastspell"

	SlashCmdList["TELEPORTERCREATEMACRO"] = TeleporterCreateMacroSlashCmdFunction
	SLASH_TELEPORTERCREATEMACRO1 = "/teleportercreatemacro"
end 

function TeleporterItemMustBeEquipped(item)
	if IsEquippableItem( item ) then
		return not IsEquippedItem ( item )
	else
		return false
	end
end

function TeleporterUpdateButton(button)

	if UnitAffectingCombat("player") then
		return
	end

	local settings = ButtonSettings[button]
	local isItem = settings[1]
	
	local item = settings[2]
	local cooldownbar = settings[3]
	local cooldownString = settings[4]
	local onCooldown = false

	if item then
		local cooldownStart, cooldownDuration
		if isItem then
			cooldownStart, cooldownDuration = GetItemCooldown(item)
		else
			cooldownStart, cooldownDuration = GetSpellCooldown(item)
		end

		if cooldownStart and cooldownStart > 0 then
			if GetTime() < cooldownStart then
				-- Long cooldowns seem to be reported incorrectly after a server reset.  Looks like the
				-- time is taken from a 32 bit unsigned int.
				cooldownStart = cooldownStart - 4294967.295
			end

			onCooldown = true
			local durationRemaining = cooldownDuration - ( GetTime() - cooldownStart )
			
			local parentWidth = button:GetWidth()
			local inset = 8
			cooldownbar:SetWidth( inset + ( parentWidth - inset ) * durationRemaining / cooldownDuration )
			
			if durationRemaining > 3600 then
				cooldownString:SetText(string.format("%.0fh", durationRemaining / 3600))
			elseif durationRemaining > 60 then
				cooldownString:SetText(string.format("%.0fm", durationRemaining / 60))
			else
				cooldownString:SetText(string.format("%.0fs", durationRemaining))
			end
			cooldownString:SetPoint("TOPLEFT",button,"TOPRIGHT",-cooldownString:GetStringWidth()-ButtonInset-2,-ButtonInset)
		else
			cooldownString:SetPoint("TOPLEFT",button,"TOPRIGHT",-6,-ButtonInset)
			cooldownString:SetText("")
			cooldownbar:SetWidth( 1 )
		end		

		if isItem and TeleporterItemMustBeEquipped( item ) then 
			button:SetBackdropColor(1,0,0,1)

			button:SetAttribute(
				"macrotext1",
				"/teleporterequip " .. item)
		elseif onCooldown then
			if cooldownDuration >2 then
				button:SetBackdropColor(1,0.7,0,1)
			else
				button:SetBackdropColor(0,0.7,0,1)
			end
			button:SetAttribute(
				"macrotext1",
				"/script print( \"" .. item .. " is currently on cooldown.\")")
		else
			button:SetBackdropColor(0,0.7,0,1)

			if isItem then
				button:SetAttribute(
					"macrotext1",
					"/teleporteruseitem " .. item .. "\n" ..
					"/use " .. item .. "\n" )
			else
				button:SetAttribute(
					"macrotext1",
					"/teleportercastspell " .. item .. "\n" ..
					"/cast " .. item .. "\n" )
			end
		end

		button:SetAttribute(
			"ctrl-macrotext1",
			"/teleportercreatemacro " .. item )
	end
end

function TeleporterUpdateAllButtons()	
	for button, settings in pairs(ButtonSettings) do
		TeleporterUpdateButton( button )
	end
end

function TeleporterShowItemTooltip( item )
	local _,link = GetItemInfo(item)
	GameTooltip_SetDefaultAnchor(TeleporterTooltip, TeleporterFrame)
	TeleporterTooltip:SetHyperlink(link)
	TeleporterTooltip:SetBackdropColor( 0, 0, 0, 1 )
	TeleporterTooltip:Show()
end

function TeleporterShowSpellTooltip( item )
	local link = GetSpellLink(item)
	GameTooltip_SetDefaultAnchor(TeleporterTooltip, TeleporterFrame)
	TeleporterTooltip:SetHyperlink(link)
	TeleporterTooltip:SetBackdropColor( 0, 0, 0, 1 )
	TeleporterTooltip:Show()
end

function TeleporterOpenFrame()

	if UnitAffectingCombat("player") then
		print( "Cannot use " .. AddonTitle .. " while in combat." )
		return
	end

	if not IsVisible then		
		local buttonHeight = 26
		local buttonWidth = 128
		local labelHeight = 16
		local numColumns = 1
		local lastDest = nil
		local maximumHeight = 200		

		IsVisible = true

		if TeleporterParentFrame == nil then
			TeleporterParentFrame = TeleporterFrame
			TeleporterParentFrame:SetFrameStrata("BACKGROUND")		
			TeleporterParentFrame:SetBackdrop({bgFile = "Interface/AchievementFrame/UI-Achievement-AchievementBackground", 
												edgeFile = "Interface/DialogFrame/UI-DialogBox-Border", 
												tile = false, edgeSize = 16, 
												insets = { left = ButtonInset, right = ButtonInset, top = ButtonInset, bottom = ButtonInset }});
			TeleporterParentFrame:SetPoint("CENTER",0,0)
			TeleporterParentFrame:SetBackdropColor(1,1,1,0.5)
			
			tinsert(UISpecialFrames,TeleporterParentFrame:GetName());
			TeleporterParentFrame:SetScript( "OnHide", TeleporterClose )

			-- Title bar
			local titleFrame = CreateFrame("Frame",nil,TeleporterParentFrame)	
			local titleFrameBG = titleFrame:CreateTexture()
			titleFrameBG:SetTexture("Interface/DialogFrame/UI-DialogBox-Header")
			titleFrameBG:SetAllPoints( titleFrame )
			titleFrame.texture = titleFrameBG
			titleFrame:SetPoint("TOP",TeleporterParentFrame,"TOP",0,12)
			titleFrame:SetWidth(280)
			titleFrame:SetHeight(48)

			local titleString = titleFrame:CreateFontString(nil, nil, "GameFontNormalSmall")
			titleString:SetText( AddonTitle )
			titleString:SetPoint("TOP", TeleporterParentFrame, "TOP", 0, 2)
			
			TeleporterParentFrame:RegisterForDrag("LeftButton")			
			TeleporterParentFrame:SetScript("OnDragStart", function() TeleporterParentFrame:StartMoving() end )
			TeleporterParentFrame:SetScript("OnDragStop", function() TeleporterParentFrame:StopMovingOrSizing() end )
			TeleporterParentFrame:EnableMouse(true)
			TeleporterParentFrame:SetMovable(true)
			
			-- Close button
			local closeButton = CreateFrame( "Button", "TeleporterCloseButton", TeleporterParentFrame, "UIPanelButtonTemplate" )
			closeButton:SetText( "Close" )
			closeButton:SetPoint( "BOTTOM", TeleporterParentFrame, "BOTTOM", 0, ButtonInset + 2 )
			closeButton:SetWidth( buttonWidth )
			closeButton:SetHeight( buttonHeight )
			closeButton:SetScript( "OnClick", TeleporterClose )

			-- Help text
			local helpString = TeleporterParentFrame:CreateFontString("TeleporterHelpString", nil, "GameFontNormalSmall")
			helpString:SetText( "Click to teleport, Ctrl+click to create a macro." )
			helpString:SetJustifyV("CENTER")
			helpString:SetJustifyH("LEFT")
		end

		local minyoffset = -ButtonInset - 10
		local yoffset = minyoffset
		local maxyoffset = -yoffset
		local xoffset = ButtonInset

		ButtonSettings = {}
		

		for index, spell in ipairs(TeleporterSpells) do		
			local spellId = spell[1]
			local isItem = spell[2]
			local destination = spell[3]
			local spellName
			local isValidSpell = true
			local itemTexture = nil

			if destination == HearthString then
				local bindLocation = GetBindLocation()
				if bindLocation then
					destination = destination .. " (" .. bindLocation .. ")"
				end
			end

			if isItem then
				spellName, _, _, _, _, _, _, _, _, itemTexture = GetItemInfo( spellId )
				if not spellName then
					isValidSpell = false
				end
			else
				spellName,_,itemTexture = GetSpellInfo( spellId )
				if not spellName then
					isValidSpell = false
				end
			end

			local haveSpell = false
			if isValidSpell then
				if isItem then
					haveSpell = GetItemCount( spellName ) > 0
				else
					haveSpell = IsUsableSpell( spellName )
				end
			end
			
			if haveSpell then
				-- Add extra column if needed
				local newColumn = false
				if -yoffset > maximumHeight then
					yoffset = minyoffset
					xoffset = xoffset + buttonWidth
					numColumns = numColumns + 1
					newColumn = true
				end		

				-- Title
				if newColumn or lastDest ~= destination then
					local destString = TeleporterCreateReusableFontString("TeleporterDL", TeleporterParentFrame, "GameFontNormalSmall")
					destString:SetPoint("TOPLEFT", TeleporterParentFrame, "TOPLEFT", xoffset, yoffset)
					destString:SetPoint("BOTTOMRIGHT", TeleporterParentFrame, "TOPLEFT", buttonWidth + xoffset, yoffset - labelHeight)
					destString:SetText(destination)
					yoffset = yoffset - labelHeight
				end
				lastDest = destination	

				-- Main button
				local buttonFrame = TeleporterCreateReusableFrame("Button","TeleporterB",TeleporterParentFrame,"SecureActionButtonTemplate")
				buttonFrame:SetFrameStrata("BACKGROUND")
				buttonFrame:SetWidth(buttonWidth)
				buttonFrame:SetHeight(buttonHeight)
				buttonFrame:SetPoint("TOPLEFT",TeleporterParentFrame,"TOPLEFT",xoffset,yoffset)
				yoffset = yoffset - buttonHeight
		
				buttonFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
													edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
													tile = true, tileSize = 16, edgeSize = 16, 
													insets = { left = 4, right = 4, top = 4, bottom = 4 }});
											
				buttonFrame:SetAttribute("type", "macro")
				buttonFrame:Show()

				if isItem then
					buttonFrame:SetScript(
						"OnEnter",
						function()
							TeleporterShowItemTooltip( spellName )
						end )
				else
					buttonFrame:SetScript(
						"OnEnter",
						function()
							TeleporterShowSpellTooltip( spellName )
						end )
				end

				buttonFrame:SetScript(
					"OnLeave",
					function()
						TeleporterTooltip:Hide()
					end )

				-- Icon
				local icon = TeleporterCreateReusableFrame( "Frame", "TeleporterI", buttonFrame, nil )
				icon:SetPoint("TOPLEFT",buttonFrame,"TOPLEFT",6,-5)
				if itemTexture then
					icon:SetWidth(buttonHeight - 10)
					icon:SetHeight(buttonHeight - 10)
					icon:SetBackdrop({bgFile = itemTexture})
				else
					icon:SetWidth(1)
					icon:SetHeight(1)
				end

				-- Cooldown bar
				local cooldownbar = TeleporterCreateReusableFrame( "Frame", "TeleporterCB", buttonFrame, nil )
				cooldownbar:SetFrameStrata("LOW")
				cooldownbar:SetWidth(64)
				cooldownbar:SetHeight(buttonHeight)
				cooldownbar:SetPoint("TOPLEFT",buttonFrame,"TOPLEFT",0,0)
				cooldownbar:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",insets = { left = 4, right = 4, top = 3, bottom = 3 }})

				-- Cooldown label
				local cooldownString = TeleporterCreateReusableFontString("TeleporterCL", cooldownbar, "GameFontNormalSmall")
				cooldownString:SetJustifyH("RIGHT")
				cooldownString:SetJustifyV("CENTER")
				cooldownString:SetPoint("TOPLEFT",buttonFrame,"TOPRIGHT",-50,-ButtonInset - 2)
				cooldownString:SetPoint("BOTTOMRIGHT",buttonFrame,"BOTTOMRIGHT",-ButtonInset - 2,6)

				-- Name label
				local nameString = TeleporterCreateReusableFontString("TeleporterSNL", cooldownbar, "GameFontNormalSmall")
				nameString:SetJustifyH("LEFT")
				nameString:SetJustifyV("CENTER")
				nameString:SetPoint("TOP",cooldownString,"TOPRIGHT",0,0)
				nameString:SetPoint("LEFT",icon,"TOPRIGHT",2,-1)
				nameString:SetPoint("BOTTOMRIGHT",cooldownString,"BOTTOMLEFT",0,0)
				nameString:SetText( spellName )

			
				if -yoffset > maxyoffset then
					maxyoffset = -yoffset
				end
			
				ButtonSettings[buttonFrame] = { isItem, spellName, cooldownbar, cooldownString }
			end	
		end
		
		local helpTextHeight
		if numColumns == 1 then
			helpTextHeight = 40
		else
			helpTextHeight = 10
		end
		TeleporterHelpString:SetPoint("TOPLEFT", TeleporterParentFrame, "TOPLEFT", 4 + ButtonInset, -maxyoffset - 3 )
		TeleporterHelpString:SetPoint("RIGHT", TeleporterParentFrame, "RIGHT", -ButtonInset, 0)
		TeleporterHelpString:SetHeight( helpTextHeight )
		
		TeleporterParentFrame:SetWidth(numColumns * buttonWidth + ButtonInset * 2)
		TeleporterParentFrame:SetHeight(maxyoffset + ButtonInset * 2 + 2 + buttonHeight + helpTextHeight)
		
	end

	TeleporterUpdateAllButtons()	
	TeleporterParentFrame:Show()
end


function TeleporterRestoreEquipment()
	for slot,item in pairs(OldItems) do		
		EquipItemByName( item, slot )
	end
	OldItems = {}
end

function TeleporterClose()
	if UnitAffectingCombat("player") then
		print( "Sorry, cannot close " .. AddonTitle .. " while in combat." )
	else
		if TeleporterParentFrame then
			TeleporterParentFrame:Hide()
			TeleporterHideCreatedUI()
			IsVisible = false
		end
		TeleporterRestoreEquipment()
	end
end

function TeleporterSlashCmdFunction( cmd )
	TeleporterOpenFrame()
end

function TeleporterEquipSlashCmdFunction( item )
	CastSpell = nil

	if not IsEquippedItem ( item ) then
		if IsEquippableItem( item ) then 
			local _, _, _, _, _, _, _, _,itemEquipLoc = GetItemInfo(item)
			local itemSlot = InvTypeToSlot[ itemEquipLoc ]
			if itemSlot == nil then
				print( "Unrecognised equipable item type: " .. itemEquipLoc )
				return
			end
			OldItems[ itemSlot ] = GetInventoryItemID( "player", itemSlot )
			EquipItemByName( item, itemSlot )
		end
	end
end

function TeleporterUseItemSlashCmdFunction( item )
	local spell = GetItemSpell( item )
	TeleporterCastSpellSlashCmdFunction( spell )
end

function TeleporterCastSpellSlashCmdFunction( spell )
	CastSpell = spell
end

function TeleporterCreateMacroSlashCmdFunction( spell )
	if spell then
		local macro
		local printEquipInfo = false

		if GetItemInfo( spell ) then
			if IsEquippableItem( spell ) then
				macro =
					"#showtooltip " .. spell .. "\n" ..
					"/teleporterequip " .. spell .. "\n" ..
					"/teleporteruseitem " .. spell .. "\n" ..
					"/use " .. spell .. "\n"
				printEquipInfo = true
			else
				macro =
					"#showtooltip " .. spell .. "\n" ..
					"/use " .. spell .. "\n"
			end
		else
			macro =
				"#showtooltip " .. spell .. "\n" ..
				"/cast " .. spell .. "\n"
		end

		local macroName = "Use" .. string.gsub( spell, "[^%a%d]", "" )
		if GetMacroInfo( macroName ) then
			DeleteMacro( macroName )
		end
		CreateMacro( macroName, 1, macro, 1, 1 )

		local extraInstructions = ""
		if printEquipInfo then
			extraInstructions = "If the item is not equipped then the first click of the macro will equip it and the second click will use it."
		end
		print( "Created macro " .. macroName .. ". " .. extraInstructions )

		PickupMacro( macroName )
	end
end

function Teleporter_OnAddonLoaded()
	-- No saved variables yet, but if I add some initialise them here
end

function Teleporter_OnUpdate()
	if IsVisible then
		TeleporterUpdateAllButtons()
	end
end

-----------------------------------------------------------------------
-- UI reuse

local uiElements = {}
local numUIElements = {}

-- Returns frame,frameName.  if frame is null then the caller must create a new object with this name
function TeleporterFindOrAddUIElement( prefix, parentFrame )
	local fullPrefix = parentFrame:GetName() .. prefix

	local numElementsWithPrefix = numUIElements[ fullPrefix ]
	if not numElementsWithPrefix then
		numElementsWithPrefix = 0
	end

	local frameName = fullPrefix .. numElementsWithPrefix
	local oldFrame = getglobal( frameName )
	if oldFrame then
		oldFrame:Show()
	end

	tinsert(uiElements, frameName)

	numElementsWithPrefix = numElementsWithPrefix + 1
	numUIElements[ fullPrefix ] = numElementsWithPrefix	
	
	return oldFrame, frameName
end


function TeleporterCreateReusableFrame( frameType, prefix, parentFrame, inheritsFrame )
	local frame, frameName = TeleporterFindOrAddUIElement( prefix, parentFrame )

	if not frame then
		frame = CreateFrame( frameType, frameName, parentFrame, inheritsFrame )
	end	
	
	return frame
end

function TeleporterCreateReusableFontString( prefix, parentFrame, font )
	local frame, frameName = TeleporterFindOrAddUIElement( prefix, parentFrame )

	if not frame then
		frame = parentFrame:CreateFontString(frameName, nil, font)
	end	
	
	return frame
end

function TeleporterHideCreatedUI()
	for index, itemName in pairs( uiElements ) do		
		local item = getglobal(itemName)
		if item then
			item:Hide()
		end
	end
	numUIElements = {}
	uiElements = {}
end