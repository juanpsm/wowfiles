--
-- Broker_Currency
-- Copyright 2008+ Toadkiller of Proudmoore for the non-statistics code.
-- The statistics code is 100% ckknight
--
-- LDB display of currencies, totals and money rate for all characters on a server.
-- The statistics stuff (total money today, yesterday, last week) is 100% from FuBar_MoneyFu, credit to ckknight
-- http://www.wowace.com/projects/broker-currency/
--

local LDB = LibStub:GetLibrary("LibDataBroker-1.1")
local LibQTip = LibStub("LibQTip-1.0")
local startupTimer

-- The localization goal is to only use existing Blizzard strings and localized Title strings from the toc
local iconGold = GOLD_AMOUNT_TEXTURE
local iconSilver = SILVER_AMOUNT_TEXTURE
local iconCopper = COPPER_AMOUNT_TEXTURE

local settingGold = "\124TInterface\\MoneyFrame\\UI-GoldIcon:24:24\124t"
local settingSilver = "\124TInterface\\MoneyFrame\\UI-SilverIcon:24:24\124t"
local settingCopper = "\124TInterface\\MoneyFrame\\UI-CopperIcon:24:24\124t"

local SETTING_ICON_STRING = "\124T%s:24:24\124t"
local DISPLAY_ICON_STRING1 = "%d\124T"
local DISPLAY_ICON_STRING2 = ":%d:%d\124t"

local fontWhite = CreateFont("Broker_CurrencyFontWhite")
local fontPlus = CreateFont("Broker_CurrencyFontPlus")
local fontMinus = CreateFont("Broker_CurrencyFontMinus")
local fontLabel = CreateFont("Broker_CurrencyFontLabel")

local currencyInfo = {
	{itemId = "money"},
	{},
	{},
	{itemId = 43307, countFunc = GetHonorCurrency},
	{itemId = 43308, countFunc = GetArenaCurrency},
	{itemId = 49426, countFunc = function() return GetItemCount(49426) end},		-- Emblem of Frost
	{itemId = 47241, countFunc = function() return GetItemCount(47241) end},		-- Emblem of Triumph
	{itemId = 45624, countFunc = function() return GetItemCount(45624) end},		-- Emblem of Conquest
	{itemId = 40753, countFunc = function() return GetItemCount(40753) end},		-- Emblem of Valor
	{itemId = 40752, countFunc = function() return GetItemCount(40752) end},		-- Emblem of Heroism
	{itemId = 29434, countFunc = function() return GetItemCount(29434) end},		-- Badge of Justice

	{itemId = 20560, countFunc = function() return GetItemCount(20560) end},		-- Alterac Valley Mark of Honor
	{itemId = 20559, countFunc = function() return GetItemCount(20559) end},		-- Arathi Basin Mark of Honor
	{itemId = 29024, countFunc = function() return GetItemCount(29024) end},		-- Eye of the Storm Mark of Honor
	{itemId = 42425, countFunc = function() return GetItemCount(42425) end},		-- Strand of the Ancients Mark of Honor
	{itemId = 20558, countFunc = function() return GetItemCount(20558) end},		-- Warsong Gulch Mark of Honor
	{itemId = 43589, countFunc = function() return GetItemCount(43589) end},		-- Wintergrasp Mark of Honor
	{itemId = 47395, countFunc = function() return GetItemCount(47395) end},		-- Isle of Conquest Mark of Honor

	{itemId = 43016, countFunc = function() return GetItemCount(43016) end},		-- Dalaran Cooking Award
	{itemId = 41596, countFunc = function() return GetItemCount(41596) end},		-- Dalaran Jewelcrafter's Token
	{itemId = 43228, countFunc = function() return GetItemCount(43228) end},		-- Stone Keeper's Shard
	{itemId = 37836, countFunc = function() return GetItemCount(37836) end},		-- Venture Coin

	{itemId = 21100, countFunc = function() return GetItemCount(21100, true) end},		-- Coin of Ancestry
	{itemId = 37829, countFunc = function() return GetItemCount(37829, true) end},		-- Brewfest Prize Token
	{itemId = 49927, countFunc = function() return GetItemCount(49927, true) end},		-- Love Token
	{itemId = 44990, countFunc = function() return GetItemCount(44990) end},		-- Champion's Seal
	{itemId = 46114, countFunc = function() return GetItemCount(46114) end},		-- Champion's Writ
}
local arenaTexture = [[Interface\PVPFrame\PVP-ArenaPoints-Icon]]
local settingsSliderIcon = ""

local playerName = UnitName("player")
local realmName = GetRealmName()

local sCurrency = CURRENCY
local sVersion = GetAddOnMetadata("Broker_Currency", "Version")

local sDisplay = DISPLAY
local sSummary = ACHIEVEMENT_SUMMARY_CATEGORY

local sStatistics = STATISTICS
local sSession = playerName
local sToday = HONOR_TODAY
local sYesterday = HONOR_YESTERDAY
local sThisWeek = ARENA_THIS_WEEK
local sLastWeek = HONOR_LASTWEEK

local sPlus = "+"
local sMinus = "-"
local sTotal = "="

local sColor = COLOR
local sBackground = BACKGROUND
local sHighlighting = HIGHLIGHTING

local sDelete = DELETE

local playerName = UnitName("player")
local realmName = GetRealmName()


Broker_Currency = CreateFrame("frame", "Broker_CurrencyFrame")
local Broker_Currency = Broker_Currency


local function getValue(info)
	return Broker_CurrencyCharDB[info[# info]]
end

local function setValue(info, value)
	Broker_CurrencyCharDB[info[# info]] = true and value or nil
	Broker_Currency:Update()
end

local function getColorValue(info)
	local color = Broker_CurrencyCharDB[info[# info]]
	return color.r, color.g, color.b, color.a
end

local function setColorValue(info, r, g, b, a)
	local color = Broker_CurrencyCharDB[info[# info]]
	color.r, color.g, color.b, color.a = r, g, b, a
	Broker_Currency:Update()
end

local function setIconSize(info, value)
	Broker_CurrencyCharDB[info[# info]] = true and value or nil
	local iconSize = Broker_CurrencyCharDB.iconSize
	Broker_Currency.options.args.iconSize.name = string.format(settingsSliderIcon, 8, iconSize, iconSize)
	Broker_Currency:Update()
end

local function setIconSizeGold(info, value)
	Broker_CurrencyCharDB[info[# info]] = true and value or nil
	local iconSize = Broker_CurrencyCharDB.iconSizeGold
	Broker_Currency.options.args.iconSizeGold.name = string.format(iconGold, 8, iconSize, iconSize)
	Broker_Currency:Update()
end

-- Data is saved per realm/character in Broker_CurrencyDB
-- Options are saved per character in Broker_CurrencyCharDB
-- There is separate settings for display of the broker, and the summary display on the tooltip
local sName, title, sNotes, enabled, loadable, reason, security = GetAddOnInfo("Broker_Currency")
local sName = GetAddOnMetadata("Broker_Currency", "X-BrokerName")
Broker_Currency.options = {
	type = "group",
	name = sName,
	get = getValue,
	set = setValue,
	childGroups = "tree",
	args = {}
}

function Broker_Currency:InitializeOptions()
	-- Icons, names and textures for the currencies
	for index, tokenInfo in pairs(currencyInfo) do
		local itemId = tokenInfo.itemId
		if (itemId) then
			local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture = GetItemInfo(itemId)
			if (itemTexture) then
				tokenInfo.itemName = itemName
				tokenInfo.settingIcon = "\124T" .. itemTexture .. ":24:24\124t"
				tokenInfo.brokerIcon = DISPLAY_ICON_STRING1 .. itemTexture .. DISPLAY_ICON_STRING2
			end
		end
	end

	-- Use the arena icon instead of a boj clone
	local tokenInfo = currencyInfo[5]
	tokenInfo.settingIcon = "\124T" .. arenaTexture .. ":24:24\124t"
	tokenInfo.brokerIcon = DISPLAY_ICON_STRING1 .. arenaTexture .. DISPLAY_ICON_STRING2
	settingsSliderIcon = tokenInfo.brokerIcon

	Broker_Currency.options.args = {
		header1 = {
			type = "description",
			order = 3,
			name = sNotes,
			cmdHidden = true
		},
		header2 = {
			type = "description",
			order = 5,
			name = sVersion,
			cmdHidden = true
		},
		iconSize = {
			type = "range",
			order = 10,
			name = string.format(settingsSliderIcon, 8, 16, 16),
			min = 1, max = 32, step = 1, bigStep = 1,
			set = setIconSize,
		},
		iconSizeGold = {
			type = "range",
			order = 10,
			name = string.format(iconGold, 8, 16, 16),
			min = 1, max = 32, step = 1, bigStep = 1,
			set = setIconSizeGold,
		},
		brokerDisplay = {
			type = "group",
			name = sDisplay,
			order = 20,
			inline = true,
			childGroups = "tree",
			args = {
				showGold = {
					type = "toggle",
					name = settingGold,
					order = 1,
					width = "half",
				},
				showSilver = {
					type = "toggle",
					name = settingSilver,
					order = 1,
					width = "half",
				},
				showCopper = {
					type = "toggle",
					name = settingCopper,
					order = 2,
					width = "half",
				},
			},
		},
		statisticsDisplay = {
			type = "group",
			name = sStatistics,
			order = 30,
			inline = true,
			childGroups = "tree",
			args = {
				summaryPlayerSession = {
					type = "toggle",
					name = sSession,
					order = 1,
					width = "full",
				},
				summaryRealmToday = {
					type = "toggle",
					name = sToday,
					order = 2,
					width = "full",
				},
				summaryRealmYesterday = {
					type = "toggle",
					name = sYesterday,
					order = 3,
					width = "full",
				},
				summaryRealmThisWeek = {
					type = "toggle",
					name = sThisWeek,
					order = 4,
					width = "full",
				},
				summaryRealmLastWeek = {
					type = "toggle",
					name = sLastWeek,
					order = 5,
					width = "full",
				},
			},
		},
		summaryDisplay = {
			type = "group",
			name = sSummary,
			order = 40,
			inline = true,
			childGroups = "tree",
			args = {
				summaryGold = {
					type = "toggle",
					name = settingGold,
					order = 1,
					width = "half",
				},
				summarySilver = {
					type = "toggle",
					name = settingSilver,
					order = 2,
					width = "half",
				},
				summaryCopper = {
					type = "toggle",
					name = settingCopper,
					order = 3,
					width = "half",
				},
			},
		},
		color = {
			type = "group",
			name = sColor,
			order = 50,
			inline = true,
			childGroups = "tree",
			args = {
				summaryColorDark = {
					type = "color",
					name = sBackground,
					order = 11,
					get = getColorValue,
					set = setColorValue,
					hasAlpha = true,
				},
				summaryColorLight = {
					type = "color",
					name = sHighlighting,
					order = 12,
					get = getColorValue,
					set = setColorValue,
					hasAlpha = true,
				},
			},
		},
		deleteCharacter = {
			type = "group",
			name = sDelete,
			order = 60,
			inline = true,
			childGroups = "tree",
			args = {
			},
		},
	}
end

local function GetKey(itemId, broker)
	if (broker) then
		return "show" .. itemId
	else
		return "summary" .. itemId
	end
end

-- Provide settings options for tokenInfo
local function SetOptions(brokerArgs, summaryArgs, tokenInfo, index)
	if (tokenInfo.settingIcon) then
		local brokerName = GetKey(tokenInfo.itemId, true)
		local summaryName = GetKey(tokenInfo.itemId, nil)
		brokerArgs[brokerName] = {
			type = "toggle",
			order = index,
			name = tokenInfo.settingIcon,
			desc = tokenInfo.itemName,
			width = "half",
			get = function()
				local key = brokerName
				return Broker_CurrencyCharDB[key]
			end,
			set = function(_, value)
				local key = brokerName
				Broker_CurrencyCharDB[key] = true and value or nil
				Broker_Currency:Update()
			end,
		}
		summaryArgs[summaryName] = {
			type = "toggle",
			order = index,
			name = tokenInfo.settingIcon,
			desc = tokenInfo.itemName,
			width = "half",
			get = function()
				local key = summaryName
				return Broker_CurrencyCharDB[key]
			end,
			set = function(_, value)
				local key = summaryName
				Broker_CurrencyCharDB[key] = true and value or nil
				Broker_Currency:Update()
			end,
		}
	end
end

local function DeletePlayer(info)
	local playerName = info[# info]
	local deleteOptions = Broker_Currency.options.args.deleteCharacter.args
	deleteOptions[playerName] = nil
	deleteOptions[playerName .. "Name"] = nil
	deleteOptions[playerName .. "Spacer"] = nil
	Broker_CurrencyDB.realm[realmName][playerName] = nil
end

-- Provide settings options for tokenInfo
local function DeleteOptions(playerName, playerInfoList, index)
	local deleteOptions = Broker_Currency.options.args.deleteCharacter.args
	if (not deleteOptions[playerName]) then
		deleteOptions[playerName .. "Name"] = {
			type = "description",
			order = index * 3,
			name = playerName,
		}
		deleteOptions[playerName] = {
			type = "execute",
			order = index * 3 + 1,
			name = sDelete,
			func = DeletePlayer,
		}
		deleteOptions[playerName .. "Spacer"] = {
			type = "header",
			order = index * 3 + 2,
			name = "",
		}
	end
end

local AceCfgReg = LibStub("AceConfigRegistry-3.0")
local AceCfg = LibStub("AceConfig-3.0")
local brokerOptions = AceCfgReg:GetOptionsTable("Broker", "dialog", "LibDataBroker-1.1")
if (not brokerOptions) then
	brokerOptions = {
		type = "group",
		name = "Broker",
		args = {
		}
	}
	AceCfg:RegisterOptionsTable("Broker", brokerOptions)
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Broker", "Broker")
end

AceCfg:RegisterOptionsTable("Broker_Currency", Broker_Currency.options)
Broker_Currency.menu = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Broker_Currency", sName, "Broker")

local concatList = {}
-- Create the display string for a single line
-- money is the gold.silver.copper amount
-- broker is true if it is the broker string, nil if it is the tooltip summary string
-- currencyList contains totals for the set of currencies
function Broker_Currency:CreateMoneyString(currencyList)
	local money = currencyList.money

	-- Create Strings for the various currencies
	wipe(concatList)
	if (currencyList) then
		for index, tokenInfo in pairs(currencyInfo) do
			if (tokenInfo.brokerIcon) then
				local key = GetKey(tokenInfo.itemId, true)
				local count = currencyList[tokenInfo.itemId] or 0
				if ((count > 0) and (Broker_CurrencyCharDB[key])) then
					concatList[# concatList + 1] = string.format(tokenInfo.brokerIcon, count, Broker_CurrencyCharDB.iconSize, Broker_CurrencyCharDB.iconSize)
					concatList[# concatList + 1] = "  "
				end
			end
		end
	end

	-- Create Strings for gold, silver, copper
	local copper = money % 100
	money = (money - copper) / 100
	local silver = money % 100
	local gold = floor(money / 100)

	if ((gold > 0) and Broker_CurrencyCharDB.showGold) then
		concatList[# concatList + 1] = string.format(iconGold, gold, Broker_CurrencyCharDB.iconSizeGold, Broker_CurrencyCharDB.iconSizeGold)
		concatList[# concatList + 1] = " "
	end

	if ((gold + silver > 0) and Broker_CurrencyCharDB.showSilver) then
		concatList[# concatList + 1] = string.format(iconSilver, silver, Broker_CurrencyCharDB.iconSizeGold, Broker_CurrencyCharDB.iconSizeGold)
		concatList[# concatList + 1] = " "
	end

	if ((gold + silver + copper > 0) and Broker_CurrencyCharDB.showCopper) then
		concatList[# concatList + 1] = string.format(iconCopper, copper, Broker_CurrencyCharDB.iconSizeGold, Broker_CurrencyCharDB.iconSizeGold)
		concatList[# concatList + 1] = " "
	end

	return table.concat(concatList)
end

local tooltipBackdrop = {
	bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
	tile = false,
	tileSize = 16,
	insets = {
		left = 0,
		right = 0,
		top = 2,
		bottom = 2
	},
}
local tooltipLines = {}
local tooltipLinesRecycle = {}
local tooltipAlignment = {}
local tooltipHeader = {}
local temp = {}

function Broker_Currency:ShowTooltip(button)
	Broker_Currency:Update()
	local maxColumns = 0
	for index, rowList in pairs(tooltipLines) do
		local columns = 0
		for i in pairs(rowList) do
			columns = columns + 1
		end
		maxColumns = max(maxColumns, columns)
	end

	if (maxColumns > 0) then
		tooltipAlignment[1] = "LEFT"
		for index = 2, maxColumns + 1 do
			tooltipAlignment[index] = "RIGHT"
		end
		for index = # tooltipAlignment, maxColumns + 2, -1 do
			tooltipAlignment[index] = nil
		end

		wipe(tooltipHeader)
		tooltipHeader[1] = " "
		for index, tokenInfo in pairs(currencyInfo) do
			if (tokenInfo.brokerIcon) then
				local key = GetKey(tokenInfo.itemId, false)
				if (Broker_CurrencyCharDB[key]) then
					tooltipHeader[# tooltipHeader + 1] = tokenInfo.settingIcon
				end
			end
		end
		if (Broker_CurrencyCharDB.summaryGold) then
			tooltipHeader[# tooltipHeader + 1] = settingGold
		end
		if (Broker_CurrencyCharDB.summarySilver) then
			tooltipHeader[# tooltipHeader + 1] = settingSilver
		end
		if (Broker_CurrencyCharDB.summaryCopper) then
			tooltipHeader[# tooltipHeader + 1] = settingCopper
		end

		local tooltip = LibQTip:Acquire("Broker_CurrencyTooltip", maxColumns, unpack(tooltipAlignment))
		self.tooltip = tooltip

		local fontName, fontHeight, fontFlags = tooltip.regularFont:GetFont()

		fontPlus:SetFont(fontName, fontHeight, fontFlags)
		fontPlus:SetTextColor(0, 1, 0)
		fontPlus:SetJustifyH("RIGHT")
		fontPlus:SetJustifyV("MIDDLE")

		fontMinus:SetFont(fontName, fontHeight, fontFlags)
		fontMinus:SetTextColor(1, 0, 0)
		fontMinus:SetJustifyH("RIGHT")
		fontMinus:SetJustifyV("MIDDLE")

		fontWhite:SetFont(fontName, fontHeight, fontFlags)
		fontWhite:SetTextColor(1, 1, 1)
		fontWhite:SetJustifyH("RIGHT")
		fontWhite:SetJustifyV("MIDDLE")

		fontName, fontHeight, fontFlags = tooltip.headerFont:GetFont()
		fontLabel:SetFont(fontName, fontHeight, fontFlags)
		fontLabel:SetTextColor(1, 1, 0.5)
		fontLabel:SetJustifyH("LEFT")
		fontLabel:SetJustifyV("MIDDLE")

		tooltip:AddHeader(unpack(tooltipHeader))
		tooltip:SetFont(fontWhite)

		for index, rowList in pairs(tooltipLines) do
			local label = rowList[1]
			local currentRow = index + 1

			if label == " " then
				tooltip:AddSeparator()
			elseif (label == sStatistics) or (label == sToday) or (label == sYesterday) or (label == sThisWeek) or (label == sLastWeek) then
				tooltip:AddHeader(unpack(tooltipHeader))
				--					tooltip:SetCell(currentRow, 1, label, fontLabel, "CENTER", maxColumns)
				tooltip:SetCell(currentRow, 1, label, fontLabel)
			else
				tooltip:AddLine(unpack(rowList))

				if (label == sPlus) then
					for i, value in ipairs(rowList) do
						if (value == 0) then
							tooltip:SetCell(currentRow, i, " ", fontPlus)
						else
							tooltip:SetCell(currentRow, i, value, fontPlus)
						end
					end
				elseif (label == sMinus) then
					for i, value in ipairs(rowList) do
						if (value == 0) then
							tooltip:SetCell(currentRow, i, " ", fontMinus)
						else
							tooltip:SetCell(currentRow, i, value, fontMinus)
						end
					end
				elseif (label == sTotal) then
					for i, value in ipairs(rowList) do
						if (value and type(value) == "number") then
							if (value == 0) then
								tooltip:SetCell(currentRow, i, " ", fontMinus)
							elseif (value < 0) then
								tooltip:SetCell(currentRow, i, -1 * value, fontMinus)
							else
								tooltip:SetCell(currentRow, i, value, fontPlus)
							end
						end
					end
				end
				tooltip:SetCell(currentRow, 1, label, fontLabel)
			end
		end

		-- Color the even columns
		local column
		local summaryColorLight = Broker_CurrencyCharDB.summaryColorLight
		if (summaryColorLight.a > 0) then
			for index = 2, maxColumns, 2 do
				tooltip:SetColumnColor(index, summaryColorLight.r, summaryColorLight.g, summaryColorLight.b, summaryColorLight.a)
			end
		end
		local summaryColorDark = Broker_CurrencyCharDB.summaryColorDark

		if _G.TipTac and _G.TipTac.AddModifiedTip then
			-- Pass true as second parameter because hooking OnHide causes C stack overflows
			_G.TipTac:AddModifiedTip(tooltip, true)
		elseif (summaryColorDark.a > 0) then
			tooltip:SetBackdrop(tooltipBackdrop)
			tooltip:SetBackdropColor(summaryColorDark.r, summaryColorDark.g, summaryColorDark.b, summaryColorDark.a)
		end

		tooltip:SmartAnchorTo(button)
		tooltip:Show()
	end
end


function Broker_Currency:AddLine(label, currencyList)
	local newIndex = # tooltipLines + 1
	if (not tooltipLinesRecycle[newIndex]) then
		tooltipLinesRecycle[newIndex] = {}
	end
	tooltipLines[newIndex] = tooltipLinesRecycle[newIndex]
	local line = tooltipLines[newIndex]
	wipe(line)

	line[1] = label
	if (currencyList) then
		-- Create Strings for the various currencies
		for index, tokenInfo in pairs(currencyInfo) do
			if (tokenInfo.brokerIcon) then
				local key = GetKey(tokenInfo.itemId, false)
				local count = currencyList[tokenInfo.itemId] or 0
				if (Broker_CurrencyCharDB[key]) then
					if (count ~= 0) then
						line[# line + 1] = count
					else
						line[# line + 1] = " "
					end
				end
			end
		end

		-- Create Strings for gold, silver, copper
		local money = currencyList.money
		local moneySign = (money < 0) and -1 or 1
		money = money * moneySign
		local copper = money % 100
		money = (money - copper) / 100
		local silver = money % 100
		local gold = floor(money / 100)

		gold = gold * moneySign
		silver = silver * moneySign
		copper = copper * moneySign

		if (gold + silver + copper ~= 0) then
			if (Broker_CurrencyCharDB.summaryGold) then
				line[# line + 1] = gold
			end

			if (Broker_CurrencyCharDB.summarySilver) then
				line[# line + 1] = silver
			end

			if (Broker_CurrencyCharDB.summaryCopper) then
				line[# line + 1] = copper
			end
		end
	end
end


local offset
function Broker_Currency:GetServerOffset()
	if offset then
		return offset
	end
	local serverHour, serverMinute = GetGameTime()
	local utcHour = tonumber(date("!%H"))
	local utcMinute = tonumber(date("!%M"))
	local ser = serverHour + serverMinute / 60
	local utc = utcHour + utcMinute / 60
	offset = floor((ser - utc) * 2 + 0.5) / 2
	if offset >= 12 then
		offset = offset - 24
	elseif offset < -12 then
		offset = offset + 24
	end
	return offset
end

local function GetToday(self)
	return floor((time() / 60 / 60 + self:GetServerOffset()) / 24)
end

function Broker_Currency:Update(event)		--, ...)
	if (event == "PLAYER_ENTERING_WORLD") then
		Broker_Currency:RegisterEvents()
	end
	if (event == "PLAYER_LEAVING_WORLD") then
		Broker_Currency:UnregisterEvents()
		return
	end

	if (Broker_Currency.InitializeSettings) then
		Broker_Currency.InitializeSettings()
	end

	if (event == "PLAYER_REGEN_ENABLED") then
		Broker_Currency:RegisterEvent("BAG_UPDATE", "Update")
	end
	if (event == "PLAYER_REGEN_DISABLED") then
		Broker_Currency:UnregisterEvent("BAG_UPDATE")
		return
	end
	if (GetItemCount(6948) < 1 and GetMoney() == 0) then
		-- ToDo: check all items for nil?
		return
	end

	local realmInfo = Broker_CurrencyDB.realmInfo[realmName]
	local playerInfo = Broker_CurrencyDB.realm[realmName][playerName]
	local money = GetMoney()

	-- Update the current player info
	playerInfo.money = money

	-- Update Statistics
	local today = GetToday(self)
	if not self.lastTime then
		self.lastTime = today
	end
	local cutoffDay = today - 14
	if (today > self.lastTime) then
		playerInfo.gained[cutoffDay] = nil
		playerInfo.spent[cutoffDay] = nil
		realmInfo.gained[cutoffDay] = nil
		realmInfo.spent[cutoffDay] = nil
		playerInfo.gained[today] = playerInfo.gained[today] or {money = 0}
		playerInfo.spent[today] = playerInfo.spent[today] or {money = 0}
		realmInfo.gained[today] = realmInfo.gained[today] or {money = 0}
		realmInfo.spent[today] = realmInfo.spent[today] or {money = 0}
		self.lastTime = today
	end

	-- Update Money
	if (self.last.money < money) then
		self.gained.money = (self.gained.money or 0) + money - self.last.money
		playerInfo.gained[today].money = (playerInfo.gained[today].money or 0) + money - self.last.money
		realmInfo.gained[today].money = (realmInfo.gained[today].money or 0) + money - self.last.money
	elseif (self.last.money > money) then
		self.spent.money = (self.spent.money or 0) + self.last.money - money
		playerInfo.spent[today].money = (playerInfo.spent[today].money or 0) + self.last.money - money
		realmInfo.spent[today].money = (realmInfo.spent[today].money or 0) + self.last.money - money
	end
	self.last.money = money

	-- Update Tokens
	for index, tokenInfo in pairs(currencyInfo) do
		if (tokenInfo.brokerIcon) then
			local itemId = tokenInfo.itemId
			local count = tokenInfo.countFunc()
			playerInfo[tokenInfo.itemId] = count

			if (self.last[itemId]) then
				if (self.last[itemId] < count) then
					self.gained[itemId] = (self.gained[itemId] or 0) + count - self.last[itemId]
					playerInfo.gained[today][itemId] = (playerInfo.gained[today][itemId] or 0) + count - self.last[itemId]
					realmInfo.gained[today][itemId] = (realmInfo.gained[today][itemId] or 0) + count - self.last[itemId]
				elseif (self.last[itemId] > count) then
					self.spent[itemId] = (self.spent[itemId] or 0) + self.last[itemId] - count
					playerInfo.spent[today][itemId] = (playerInfo.spent[today][itemId] or 0) + self.last[itemId] - count
					realmInfo.spent[today][itemId] = (realmInfo.spent[today][itemId] or 0) + self.last[itemId] - count
				end
			end
			self.last[itemId] = count
		end
	end

	-- Display the money string according to the broker settings
	Broker_Currency.ldb.text = Broker_Currency:CreateMoneyString(playerInfo)

	local now = time()
	if (not self.savedTime) then
		self.savedTime = now
	end
	self.savedTime = now
end


-- Add counts from playerInfo to totalList according to the summary settings this character is interested in
local function TotalCurrencies(totalList, playerInfo)
	for summaryName in pairs(Broker_CurrencyCharDB) do
		local countKey = tonumber(string.match(summaryName, "summary(%d+)"))
		local count = playerInfo[countKey]
		if (count) then
			totalList[countKey] = (totalList[countKey] or 0) + count
		end
	end
	totalList.money = (totalList.money or 0) + (playerInfo.money or 0)
end
-- /dump Broker_CurrencyDB.realm["Proudmoore"]["Bliksem"]

local totalList = {}
local weekGained = {}
local weekSpent = {}
local lastWeekGained = {}
local lastWeekSpent = {}
local profit = {}
local sortMoneyList = {}

-- Sorting is in descending order of money
local function SortByMoneyDescending(a, b)
	if (a.playerInfo.money and b.playerInfo.money) then
		return a.playerInfo.money > b.playerInfo.money
	elseif (a.playerInfo.money) then
		return true
	elseif (b.playerInfo.money) then
		return false
	else
		return true
	end
end

local function GetSortedPlayerInfo()
	local index = 1
	for playerName, playerInfo in pairs(Broker_CurrencyDB.realm[realmName]) do
		if (not sortMoneyList[index]) then
			sortMoneyList[index] = {}
		end
		sortMoneyList[index].playerName = playerName
		sortMoneyList[index].playerInfo = playerInfo
		index = index + 1
	end
	for i = # sortMoneyList, index, -1 do
		sortMoneyList[i] = nil
	end

	table.sort(sortMoneyList, SortByMoneyDescending)

	return sortMoneyList
end

-- Handle mouse enter event in our button
local function OnEnter(button)
	if (startupTimer) then
		return
	end
	if (Broker_Currency.InitializeSettings) then
		Broker_Currency.InitializeSettings()
	end
	wipe(tooltipLines)

	-- Display the money string according to the summary settings
	wipe(totalList)
	local sortedPlayerInfo = GetSortedPlayerInfo()
	for i, data in ipairs(sortedPlayerInfo) do
		Broker_Currency:AddLine(string.format("%s: ", data.playerName), data.playerInfo, fontWhite)
		TotalCurrencies(totalList, data.playerInfo)
	end

	-- Statistics
	local charDB = Broker_CurrencyCharDB
	if (charDB.summaryPlayerSession or charDB.summaryRealmToday or charDB.summaryRealmYesterday or charDB.summaryRealmThisWeek or charDB.summaryRealmLastWeek) then
		Broker_Currency:AddLine(" ")
		Broker_Currency:AddLine(sStatistics)
	end

	-- Session totals
	local self = Broker_Currency
	local gained = self.gained
	local spent = self.spent
	if (charDB.summaryPlayerSession) then
		Broker_Currency:AddLine(" ")
		Broker_Currency:AddLine(playerName)

		wipe(profit)
		for index, tokenInfo in pairs(currencyInfo) do
			local itemId = tokenInfo.itemId
			if (itemId) then
				profit[itemId] = (gained[itemId] or 0) - (spent[itemId] or 0)
			end
		end

		Broker_Currency:AddLine(sPlus, gained)
		Broker_Currency:AddLine(sMinus, spent)
		Broker_Currency:AddLine(sTotal, profit)
	end

	-- Today totals
	local realmInfo = Broker_CurrencyDB.realmInfo[realmName]
	gained = realmInfo.gained
	spent = realmInfo.spent
	if (charDB.summaryRealmToday) then
		Broker_Currency:AddLine(" ")
		Broker_Currency:AddLine(sToday)
		Broker_Currency:AddLine(" ")

		wipe(profit)
		for index, tokenInfo in pairs(currencyInfo) do
			local itemId = tokenInfo.itemId
			if (itemId) then
				profit[itemId] = (gained[self.lastTime][itemId] or 0) - (spent[self.lastTime][itemId] or 0)
			end
		end

		Broker_Currency:AddLine(sPlus, gained[self.lastTime])
		Broker_Currency:AddLine(sMinus, spent[self.lastTime])
		Broker_Currency:AddLine(sTotal, profit)
	end

	-- Yesterday totals
	if (charDB.summaryRealmYesterday) then
		Broker_Currency:AddLine(" ")
		Broker_Currency:AddLine(sYesterday)
		Broker_Currency:AddLine(" ")

		local yesterday = self.lastTime - 1
		wipe(profit)
		for index, tokenInfo in pairs(currencyInfo) do
			local itemId = tokenInfo.itemId
			if (itemId) then
				profit[itemId] = (gained[yesterday][itemId] or 0) - (spent[yesterday][itemId] or 0)
			end
		end

		Broker_Currency:AddLine(sPlus, gained[yesterday])
		Broker_Currency:AddLine(sMinus, spent[yesterday])
		Broker_Currency:AddLine(sTotal, profit)
	end

	-- This Week totals
	if (charDB.summaryRealmThisWeek) then
		wipe(weekGained)
		wipe(weekSpent)
		wipe(profit)
		for i = self.lastTime - 6, self.lastTime do
			for index, tokenInfo in pairs(currencyInfo) do
				local itemId = tokenInfo.itemId
				if (itemId) then
					weekGained[itemId] = (weekGained[itemId] or 0) + (gained[i] and gained[i][itemId] or 0)
					weekSpent[itemId] = (weekSpent[itemId] or 0) + (spent[i] and spent[i][itemId] or 0)
				end
			end
		end
		for index, tokenInfo in pairs(currencyInfo) do
			local itemId = tokenInfo.itemId
			if (itemId) then
				profit[itemId] = weekGained[itemId] - weekSpent[itemId]
			end
		end
		Broker_Currency:AddLine(" ")
		Broker_Currency:AddLine(sThisWeek)
		Broker_Currency:AddLine(" ")

		Broker_Currency:AddLine(sPlus, weekGained)
		Broker_Currency:AddLine(sMinus, weekSpent)
		Broker_Currency:AddLine(sTotal, profit)
	end

	-- Last Week totals
	if (charDB.summaryRealmLastWeek) then
		wipe(lastWeekGained)
		wipe(lastWeekSpent)
		wipe(profit)
		for i = self.lastTime - 13, self.lastTime - 7 do
			for index, tokenInfo in pairs(currencyInfo) do
				local itemId = tokenInfo.itemId
				if (itemId) then
					lastWeekGained[itemId] = (lastWeekGained[itemId] or 0) + (gained[i] and gained[i][itemId] or 0)
					lastWeekSpent[itemId] = (lastWeekSpent[itemId] or 0) + (spent[i] and spent[i][itemId] or 0)
				end
			end
		end
		for index, tokenInfo in pairs(currencyInfo) do
			local itemId = tokenInfo.itemId
			if (itemId) then
				profit[itemId] = lastWeekGained[itemId] - lastWeekSpent[itemId]
			end
		end
		Broker_Currency:AddLine(" ")
		Broker_Currency:AddLine(sLastWeek)
		Broker_Currency:AddLine(" ")

		Broker_Currency:AddLine(sPlus, lastWeekGained)
		Broker_Currency:AddLine(sMinus, lastWeekSpent)
		Broker_Currency:AddLine(sTotal, profit)
	end

	-- Totals
	Broker_Currency:AddLine(" ")
	Broker_Currency:AddLine(sSummary, totalList)

	Broker_Currency:ShowTooltip(button)
end
--/dump Broker_CurrencyDB.realmInfo.Proudmoore.gained
--/dump Broker_CurrencyDB.realmInfo.Proudmoore.spent


local function OnLeave()
	LibQTip:Release(Broker_Currency.tooltip)
	Broker_Currency.tooltip = nil
end


-- Set up as a LibBroker data source
Broker_Currency.ldb = LDB:NewDataObject("Broker Currency", {
	type = "data source",
	label = sCurrency,
	icon = "Interface\\MoneyFrame\\UI-GoldIcon",
	text = "Initializing...",
	OnClick = function(clickedframe, button)
		if (button == "RightButton") then
			InterfaceOptionsFrame_OpenToCategory(Broker_Currency.menu)
		end
	end,
	OnEnter = OnEnter,
	OnLeave = OnLeave,
})


local wtfDelay = 5 -- For stupid cases where Blizzard pretends a player has no loots, wait up to 15 seconds
function Broker_Currency.InitializeSettings()
	-- No hearthstone and no money means trouble
	if (startupTimer) then
		Broker_Currency:CancelTimer(startupTimer)
		startupTimer = nil
	end

	if (GetItemCount(6948) < 1 and GetMoney() == 0) then
		if (wtfDelay > 0) then
			startupTimer = Broker_Currency:ScheduleTimer(Broker_Currency.InitializeSettings, wtfDelay)
			wtfDelay = wtfDelay - 1
			return
		end
	end
	self = Broker_Currency
	-- Set defaults
	if (not Broker_CurrencyCharDB) then
		Broker_CurrencyCharDB = {
			showCopper = true,
			showSilver = true,
			showGold = true,
			showToday = true,
			showYesterday = true,
			showLastWeek = true,
			summaryGold = true,
			summaryColorDark = {r = 0, g = 0, b = 0, a = 0},
			summaryColorLight = {r = 1, g = 1, b = 1, a = .3},
        }
  	end

	self:InitializeOptions()

	if (not Broker_CurrencyCharDB.iconSize) then
		Broker_CurrencyCharDB.iconSize = 16
	end
	if (not Broker_CurrencyCharDB.iconSizeGold) then
		Broker_CurrencyCharDB.iconSizeGold = 16
	end

	if (not Broker_CurrencyCharDB.summaryColorDark) then
		Broker_CurrencyCharDB.summaryColorDark = {r = 0, g = 0, b = 0, a = 0}
	end
	if (not Broker_CurrencyCharDB.summaryColorLight) then
		Broker_CurrencyCharDB.summaryColorLight = {r = 1, g = 1, b = 1, a = .3}
	end

	if (not Broker_CurrencyDB) then
		Broker_CurrencyDB = {}
	end
	if (not Broker_CurrencyDB.realm) then
		Broker_CurrencyDB.realm = {}
	end
	if (not Broker_CurrencyDB.realmInfo) then
		Broker_CurrencyDB.realmInfo = {}
	end
	if (not Broker_CurrencyDB.realmInfo[realmName]) then
		Broker_CurrencyDB.realmInfo[realmName] = {}
	end

	if (not Broker_CurrencyDB.realm[realmName]) then
		Broker_CurrencyDB.realm[realmName] = {}
	end
	if (not Broker_CurrencyDB.realm[realmName][playerName]) then
		Broker_CurrencyDB.realm[realmName][playerName] = {}
	end

	local realmInfo = Broker_CurrencyDB.realmInfo[realmName]
	if (not realmInfo.gained or type(realmInfo.gained) ~= "table") then
		realmInfo.gained = {}
	end
	if (not realmInfo.spent or type(realmInfo.spent) ~= "table") then
		realmInfo.spent = {}
	end

	local playerInfo = Broker_CurrencyDB.realm[realmName][playerName]
	if (not playerInfo.gained or type(playerInfo.gained) ~= "table") then
		playerInfo.gained = {}
	end
	if (not playerInfo.spent or type(playerInfo.spent) ~= "table") then
		playerInfo.spent = {}
	end

	if (not self.last) then
		self.last = {}
	end
	local last = self.last
	for index, tokenInfo in pairs(currencyInfo) do
		if (tokenInfo.brokerIcon) then
			local itemId = tokenInfo.itemId
			local count = tokenInfo.countFunc()
			playerInfo[tokenInfo.itemId] = count

			last[itemId] = count
		end
	end

	-- Initialize statistics
	self.last.money = GetMoney()
	self.lastTime = GetToday(self)
	local lastWeek = self.lastTime - 13
	for day in pairs(playerInfo.gained) do
		if (day < lastWeek) then
			playerInfo.gained[day] = nil
		end
	end
	for day in pairs(playerInfo.spent) do
		if (day < lastWeek) then
			playerInfo.spent[day] = nil
		end
	end
	for day in pairs(realmInfo.gained) do
		if (day < lastWeek) then
			realmInfo.gained[day] = nil
		end
	end
	for day in pairs(realmInfo.spent) do
		if (day < lastWeek) then
			realmInfo.spent[day] = nil
		end
	end
	for i = self.lastTime - 13, self.lastTime do
		if (not playerInfo.gained[i] or type(playerInfo.gained[i]) ~= "table") then
			playerInfo.gained[i] = {money = 0}
		end
		if (not playerInfo.spent[i] or type(playerInfo.spent[i]) ~= "table") then
			playerInfo.spent[i] = {money = 0}
		end
		if (not realmInfo.gained[i] or type(realmInfo.gained[i]) ~= "table") then
			realmInfo.gained[i] = {money = 0}
		end
		if (not realmInfo.spent[i] or type(realmInfo.spent[i]) ~= "table") then
			realmInfo.spent[i] = {money = 0}
		end
	end
	self.gained = {money = 0}
	self.spent = {money = 0}
	self.sessionTime = time()
	self.savedTime = time()

	-- Add faction honor icons
	local faction = UnitFactionGroup("player")
	local honorTexture
	if (faction == "Horde") then
		honorTexture = [[Interface\PVPFrame\PVP-Currency-Horde]]
	else
		honorTexture = [[Interface\PVPFrame\PVP-Currency-Alliance]]
	end
	local tokenInfo = currencyInfo[4]
	tokenInfo.settingIcon = "\124T" .. honorTexture .. ":24:24\124t"
	tokenInfo.brokerIcon = DISPLAY_ICON_STRING1 .. honorTexture .. DISPLAY_ICON_STRING2

	-- Add settings for the various currencies
	local brokerDisplay = Broker_Currency.options.args.brokerDisplay.args
	local summaryDisplay = Broker_Currency.options.args.summaryDisplay.args
	for index = 1, # currencyInfo, 1 do
		SetOptions(brokerDisplay, summaryDisplay, currencyInfo[index], index)
	end

	-- Add delete settings so deleted characters can be removed
	local index = 1
	for playerName in pairs(Broker_CurrencyDB.realm[realmName]) do
		DeleteOptions(playerName, Broker_CurrencyDB.realm[realmName], index)
		index = index + 1
	end
	Broker_Currency:UnregisterEvent("BAG_UPDATE")
	if (startupTimer) then
		Broker_Currency:CancelTimer(startupTimer)
		startupTimer = nil
	end

	-- Register for update events
	Broker_Currency:RegisterEvents()
	
	Broker_Currency:RegisterEvent("PLAYER_ENTERING_WORLD", "Update")
	Broker_Currency:RegisterEvent("PLAYER_LEAVING_WORLD", "Update")

	-- Done initializing
	Broker_Currency:SetScript("OnEvent", Broker_Currency.Update)
	Broker_Currency.InitializeSettings = nil

	self:Update()
end

function Broker_Currency:RegisterEvents()
	Broker_Currency:RegisterEvent("HONOR_CURRENCY_UPDATE", "Update")
	Broker_Currency:RegisterEvent("MERCHANT_CLOSED", "Update")
	Broker_Currency:RegisterEvent("PLAYER_MONEY", "Update")
	Broker_Currency:RegisterEvent("PLAYER_TRADE_MONEY", "Update")
	Broker_Currency:RegisterEvent("TRADE_MONEY_CHANGED", "Update")
	Broker_Currency:RegisterEvent("SEND_MAIL_MONEY_CHANGED", "Update")
	Broker_Currency:RegisterEvent("SEND_MAIL_COD_CHANGED", "Update")

	Broker_Currency:RegisterEvent("PLAYER_REGEN_ENABLED", "Update")
	Broker_Currency:RegisterEvent("PLAYER_REGEN_DISABLED", "Update")
	Broker_Currency:RegisterEvent("BAG_UPDATE", "Update")
end

function Broker_Currency:UnregisterEvents()
	Broker_Currency:UnregisterEvent("HONOR_CURRENCY_UPDATE", "Update")
	Broker_Currency:UnregisterEvent("MERCHANT_CLOSED", "Update")
	Broker_Currency:UnregisterEvent("PLAYER_MONEY", "Update")
	Broker_Currency:UnregisterEvent("PLAYER_TRADE_MONEY", "Update")
	Broker_Currency:UnregisterEvent("TRADE_MONEY_CHANGED", "Update")
	Broker_Currency:UnregisterEvent("SEND_MAIL_MONEY_CHANGED", "Update")
	Broker_Currency:UnregisterEvent("SEND_MAIL_COD_CHANGED", "Update")

	Broker_Currency:UnregisterEvent("PLAYER_REGEN_ENABLED", "Update")
	Broker_Currency:UnregisterEvent("PLAYER_REGEN_DISABLED", "Update")
	Broker_Currency:UnregisterEvent("BAG_UPDATE", "Update")
end

function Broker_Currency:Startup(event, ...)
	if (event == "BAG_UPDATE") then
		if (startupTimer) then
			Broker_Currency:CancelTimer(startupTimer)
		end
		startupTimer = Broker_Currency:ScheduleTimer(Broker_Currency.InitializeSettings, 4)
	end
end

-- Initialize after end of BAG_UPDATE events
Broker_Currency:RegisterEvent("BAG_UPDATE")
Broker_Currency:RegisterEvent("PLAYER_MONEY")
Broker_Currency:SetScript("OnEvent", Broker_Currency.Startup)

LibStub("AceTimer-3.0"):Embed(Broker_Currency)

-- This is only necessary if AddonLoader is present, using the Delayed load. -Torhal
if IsLoggedIn() then
	startupTimer = Broker_Currency:ScheduleTimer(Broker_Currency.InitializeSettings, 4)
end
