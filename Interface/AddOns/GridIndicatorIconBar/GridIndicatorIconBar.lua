--[[
GridIndicatorIconBar - icon indicator for Grid
Copyright 2009 Adirelle (adirelle@tagada-team.net)
All rights reserved.
]]

--local L = AceLibrary("AceLocale-2.2"):new("GridIndicatorIconBar")
local L = setmetatable({}, {__index = function(t,k) t[k]=k return k end})
local AceOO = AceLibrary("AceOO-2.0")

local GridFrame = Grid:GetModule('GridFrame')
local GridStatus = Grid:GetModule('GridStatus')

local MAX_ICON_COUNT = 9

GridIndicatorIconBar = GridStatus:NewModule("GridIndicatorIconBar")
GridIndicatorIconBar.defaultDB = {
	scale = 1,
	opacity = 1,
	count = 4,
	rowSize = 9,
	spacing = 4,
	anchorPoint = "CENTER",
	attachPoint = "CENTER",
	xOffset = 0,
	yOffset = 0,
	flash = true,
	borders = { ['*'] = false },
}

local GetIconIndex, GetIconIndicator
do
	local iconIndicators = {}
	local iconIndexes = {}

	function GetIconIndex(indicator)
		return iconIndexes[tostring(indicator)]
	end

	function GetIconIndicator(index)
		return iconIndicators[tonumber(index) or false]
	end

	local indicators = GridFrame.frameClass.prototype.indicators
	local statusmap = GridFrame.db.profile.statusmap
	for index = 1, MAX_ICON_COUNT do
		local indicator = 'baricon'..index
		iconIndicators[index] = indicator
		iconIndexes[indicator] = index
		table.insert(indicators, { type = indicator, order = 10 * index, name = "Icon #"..index })
		statusmap[indicator] = statusmap[indicator] or {}
	end
end

local GridIndicatorIconBarFrameClass = AceOO.Class(GridFrame.frameClass)

local _frameClass = nil
if not _frameClass then
	_frameClass = GridFrame.frameClass
	GridFrame.frameClass = GridIndicatorIconBarFrameClass
end

local testMode = false
local borderIconList = {}

function GridIndicatorIconBar:OnEnable()
	self:CleanOptionsMenu() -- hack for better indicator menu
	hooksecurefunc(GridFrame, "UpdateOptionsMenu", GridIndicatorIconBar.CleanOptionsMenu) -- hack for better indicator menu
	
	local anchorPoints = {
		"TOPLEFT", "TOP", "TOPRIGHT", "RIGHT", "BOTTOMRIGHT", "BOTTOM", "BOTTOMLEFT", "LEFT", "CENTER" 
	}
	local anchorPointDescs = {
		L["Top Left"], L["Top"], L["Top right"], L["Right"], L["Bottom right"],
		L["Bottom"], L["Bottom left"], L["Left"], L["Center"]
	}

	GridFrame.options.args.advanced.args["iconbar"] = {
		type = "group",
		name = L["Icon Bar"],
		desc = L["Options for Icon Bar indicators."],
		order = 106,
		pass = true,
		get = function(k)
			return self.db.profile[k]
		end,
		set = function(k, v)
			self.db.profile[k] = v
			self:LayoutAllIconBars()
		end,
		args = {
			testMode = {
				type = "toggle",
				name = L['Test mode'],
				desc = L['Enable test mode. In test mode, every defined icon are shown.'],
				order = 1,
				get = function() return testMode end,
				set = function(v) 
					testMode = v
					GridFrame:WithAllFrames(function (f)
						f:UpdateIconBarTestMode()
					end)
				end
			},
			count = {
				type = "range",
				name = L['Number of icons'],
				desc = L['Adjust the number of icons to display.'],
				order = 5,
				min = 1,
				max = 9,
				step = 1,
				set = function(k, v)
					self.db.profile[k] = v
					self:UpdateIconCount()
				end,
				passValue = 'count',
			},
			rowSize = {
				type = "range",
				name = L["Number of icons per row"],
				desc = L["Adjust the number of icons per row."],
				min = 1,
				max = MAX_ICON_COUNT;
				step = 1,
				order = 10,
				passValue = 'rowSize',
			},			
			scale = {
				type = "range",
				name = L["Icon scale"],
				desc = L["Adjust the scale of the icon bar."],
				order = 10,
				min = 0.50,
				max = 1.50,
				step = 0.05,
				isPercent = true,
				passValue = 'scale',
			},
			opacity = {
				type = "range",
				name = L["Icon opacity"],
				desc = L["Adjust the opacity of the icon bar. 100% is fully opaque; 10% is almost transparent."],
				order = 15,
				min = 0.10,
				max = 1.00,
				step = 0.05,
				isPercent = true,
				passValue = 'opacity',
			},
			spacing = {
				type = "range",
				name = L["Icon spacing"],
				desc = L["Adjust the size of the space between the icons."],
				order = 20,
				min = 0,
				max = 30,
				step = 1,
				passValue = 'spacing',
			},
			anchorPoint = {
				type = "text",
				name = L["Bar anchoring point"],
				desc = L["Select which point of the bar is anchored to the unit frame."],
				order = 35,
				validate = anchorPoints,
				validateDesc = anchorPointDesc,
				passValue = 'anchorPoint',			
			},
			attachPoint = {
				type = "text",
				name = L["Unit frame attaching point"],
				desc = L["Select the point of the unit frame the icon bar is anchored to."],
				order = 36,
				validate = anchorPoints,
				validateDesc = anchorPointDesc,
				passValue = 'attachPoint',							
			},			
			xOffset = {
				type = "range",
				name = L["X-axis offset"],
				desc = L["Adjust the offset between the bar and the unit frame along the x-axis."],
				order = 40,
				min = -150,
				max = 150,
				step = 1,
				passValue = 'xOffset',							
			},
			yOffset = {
				type = "range",
				name = L["Y-axis offset"],
				desc = L["Adjust the offset between the bar and the unit frame along the y-axis."],
				order = 50,
				min = -150,
				max = 150,
				step = 1,
				passValue = 'yOffset',							
			},
			flash = {
				type = 'toggle',
				name = L['Flashing icons'],
				desc = L['Check this box to have the icon flashes when there is less than 3 seconds left.'],
				order = 55,
				passValue = 'flash',
			},
			borders = {
				type = "text",
				name = L["Icon borders"],
				desc = L["Select icons that should display their border."],
				order = 60,
				multiToggle = true,
				validate = borderIconList,
				set = function(k, v)
					self.db.profile.borders[tonumber(k:match("%d+"))] = v
					self:LayoutAllIconBars()
				end,
				get = function(k)
					return self.db.profile.borders[tonumber(k:match("%d+"))]
				end,
			},
		}
	}
	
	self:UpdateIconCount()
end

function GridIndicatorIconBar:UpdateIconCount()
	wipe(borderIconList)
	for index = 1, self.db.profile.count do
		borderIconList[index] = 'Icon #'..index
	end
	self:LayoutAllIconBars()
end

function GridIndicatorIconBar:LayoutAllIconBars()
	GridFrame:WithAllFrames(function (f)
		f:LayoutIconBar()
	end)
end

function GridIndicatorIconBar:CleanOptionsMenu()
	if not GridFrame.options.args.iconbar then
		GridFrame.options.args.iconbar = {
			type = "group",
			name = L["Icon Bar"],
			desc = L["Options for Icon Bar indicators."],
			order = 57.1,
			args = {}
		}
	end
	local	indicators = GridFrame.options.args.iconbar.args
	wipe(indicators)
	for index = 1, MAX_ICON_COUNT do
		local indicator = GetIconIndicator(index)
		local options = GridFrame.options.args[indicator] or indicators[indicator]
		if options and not options.hidden then
			options.hidden = function()
				return index > GridIndicatorIconBar.db.profile.count
			end
		end
		indicators[indicator] = options
		GridFrame.options.args[indicator] = nil
	end
end

local function LayoutIconBar(f)
	local db = GridIndicatorIconBar.db.profile
	local iconBar = f.IconBar
	local iconSize = GridFrame.db.profile.iconSize
	local spacing = db.spacing / db.scale
	local columnCount = math.min(db.count, db.rowSize)
	local rowCount = math.ceil(db.count / columnCount)
	iconBar:SetScale(db.scale)
	iconBar:SetAlpha(db.opacity)
	iconBar:SetWidth(columnCount * iconSize + (columnCount - 1) * spacing)
	iconBar:SetHeight(rowCount * iconSize + (rowCount - 1) * spacing)
	iconBar:ClearAllPoints()
	iconBar:SetPoint(db.anchorPoint, f, db.attachPoint, db.xOffset, db.yOffset)
end

local function CreateIconBar(f)
	local iconBar = CreateFrame("Frame", nil, f)
	f.IconBar = iconBar
	LayoutIconBar(f)
	return iconBar
end

local function LayoutIcon(f, icon)
	local db = GridIndicatorIconBar.db.profile
	local index = icon.index
	local iconSize = GridFrame.db.profile.iconSize
	local spacing = db.spacing / db.scale
	local column = (index - 1) % db.rowSize
	local row = math.floor((index - 1) / db.rowSize)
	icon:SetWidth(iconSize)
	icon:SetHeight(iconSize)
	icon:ClearAllPoints()
	icon:SetPoint("TOPLEFT", f.IconBar, "TOPLEFT", (iconSize + spacing) * column, - (iconSize + spacing) * row)
	local backdrop = icon.border:GetBackdrop()
	local borderSize = GridFrame.db.profile.iconBorderSize
	backdrop.edgeSize = borderSize
	backdrop.insets.left = borderSize
	backdrop.insets.right = borderSize
	backdrop.insets.top = borderSize
	backdrop.insets.bottom = borderSize
	icon.border:SetWidth(iconSize)
	icon.border:SetHeight(iconSize)
	local r, g, b, a = icon.border:GetBackdropBorderColor()
	icon.border:SetBackdrop(backdrop)
	if borderSize == 0 then
	   icon.border:SetBackdropBorderColor(0, 0, 0, 0)
	else
	  icon.border:SetBackdropBorderColor(r, g, b, a)
	end
	icon.border:SetWidth(iconSize + borderSize * 2)
	icon.border:SetHeight(iconSize + borderSize * 2)
end

local media = LibStub("LibSharedMedia-3.0", true)

local borderBackdrop = {
	-- bgFile = "Interface\\Addons\\Grid\\white16x16", tile = true, tileSize = 16,
	edgeFile = "Interface\\Addons\\Grid\\white16x16", edgeSize = 2,
	insets = {left = 2, right = 2, top = 2, bottom = 2},
}

local function CreateIcon(f, index)
	local font = media and media:Fetch("font", GridFrame.db.profile.font) or STANDARD_TEXT_FONT
	
	if not f.IconBar then
		f.IconBar = CreateIconBar(f)
	end	
	
	local icon = CreateFrame("Frame", nil, f.IconBar)
	icon:SetFrameLevel(5)
	icon:Hide()
	icon.index = index
	
	local texture = icon:CreateTexture(nil, "OVERLAY")
	texture:SetAllPoints(icon)
	texture:SetTexCoord(0.05, 0.95, 0.05, 0.95)
	texture:SetTexture(1,1,1,0)	
	icon.texture = texture

	local cooldown = CreateFrame("Cooldown", nil, icon, "CooldownFrameTemplate")
	cooldown:SetAllPoints(texture)
	cooldown:SetReverse(true)
	icon.cooldown = cooldown

	-- create icon background/border
	local border = CreateFrame("Frame", nil, icon)
	border:SetPoint("CENTER", icon, "CENTER")
	border:SetBackdrop(borderBackdrop)
	border:SetBackdropBorderColor(1,1,1,1)
	border:SetBackdropColor(0, 0, 0, 0)
	border:SetFrameLevel(5)
	border:Hide()
	icon.border = border
	
	local stackText = icon:CreateFontString(nil, "OVERLAY")
	stackText:SetFontObject(GameFontHighlightSmall)	
	stackText:SetFont(font, GridFrame.db.profile.fontSize, "OUTLINE")
	stackText:SetShadowColor(0,0,0,0)
	stackText:SetPoint("BOTTOMRIGHT", icon, 2, -2)
	stackText:SetJustifyH("RIGHT")
	stackText:SetJustifyV("BOTTOM")
	icon.stackText = stackText
	
	LayoutIcon(f, icon)
	
	return icon
end

local function OnUpdateFlash(self)
	local timeLeft = self.expiration - GetTime()
	if timeLeft <= 0 then
		self:SetAlpha(1.0)
		self:SetScript('OnUpdate', nil)
	elseif timeLeft < 4.5 then
		local f = (timeLeft % 1.5) / 1.5
		if f > 0.5 then
			f = 1 - f
		end
		self:SetAlpha(1 - 1.6 * f)
	end
end
	 
function GridIndicatorIconBarFrameClass.prototype:SetIndicator(indicator, color, text, value, maxValue, texture, start, duration, stack)
	GridIndicatorIconBarFrameClass.super.prototype.SetIndicator(self, indicator, color, text, value, maxValue, texture, start, duration, stack)
	local index = GetIconIndex(indicator)
	if not index then return end
	local hasColor = type(color) == "table" and not color.ignore
	local icon = self[indicator]
	if not texture and not hasColor then 
		if icon then
			icon:Hide()
		end
		return 
	end	
	if not icon then
		icon = CreateIcon(self.frame, index)
		self[indicator] = icon
	end
	
	if texture then
		local tex, border = icon.texture, icon.border
		if type(texture) == "table" then
			tex:SetTexture(texture.r, texture.g, texture.b, texture.a)
		else
			tex:SetTexture(texture)
		end

		if hasColor then
			if GridFrame.db.profile.iconBorderSize > 0 and GridIndicatorIconBar.db.profile.borders[index] then
				border:SetBackdropBorderColor(color.r, color.g, color.b, color.a)
				border:Show()
			else
				border:Hide()
			end
			tex:SetAlpha(color.a)
		else
			border:Hide()
			tex:SetAlpha(1.0)
		end
	else
		icon.texture:SetTexture(color.r, color.g, color.b, color.a)
		icon.border:Hide()
	end

	local expiration = type(duration) == "number" and type(start) == "number" and start > 0 and duration > 0 and (start + duration) or 0
	if expiration > GetTime() and GridFrame.db.profile.enableIconCooldown then
		icon.cooldown:SetCooldown(start, duration)
		icon.cooldown:Show()
	else
		icon.cooldown:Hide()
	end
	
	icon:SetAlpha(1.0)
	if expiration > GetTime() and GridIndicatorIconBar.db.profile.flash then
		icon.expiration = expiration
		icon:SetScript('OnUpdate', OnUpdateFlash)
	end
		
	if tonumber(stack) and tonumber(stack) > 1 and GridFrame.db.profile.enableIconStackText then
		icon.stackText:SetText(stack)
		icon.stackText:Show()
	else
		icon.stackText:Hide()
	end

	icon:Show()		
end

function GridIndicatorIconBarFrameClass.prototype:ClearIndicator(indicator)
	GridIndicatorIconBarFrameClass.super.prototype.ClearIndicator(self, indicator)
	local index = GetIconIndex(indicator)
	if not index then return end
	local icon = self[indicator]	
	if not icon or testMode then return end
	icon.texture:SetTexture(1,1,1,0)
	icon.cooldown:Hide()
	icon.stackText:Hide()
	icon:SetAlpha(1)
	icon:Hide()
end

do
	local function iconIterator(self, index)
		for i = 1, MAX_ICON_COUNT do
			index = index + 1
			local icon = self[GetIconIndicator(index)]
			if icon then
				return index, icon
			end
		end
	end

	function GridIndicatorIconBarFrameClass.prototype:IterateBarIcons()
		return iconIterator, self, 0
	end
end

do
	local toLayout = {}
	local layoutHandler 
	
	local function DoLayoutIconBar(self)
		local f = self.frame
		LayoutIconBar(f)
		for index, icon in self:IterateBarIcons() do
			LayoutIcon(f, icon)
			if index > GridIndicatorIconBar.db.profile.count then
				icon:Hide()
			end
		end
		if testMode then
			self:UpdateIconBarTestMode()
		end
	end

	function GridIndicatorIconBarFrameClass.prototype:LayoutIconBar()
		if self.frame.IconBar then
			if not layoutHandler then
				layoutHandler = CreateFrame("Frame")
				layoutHandler:SetScript('OnUpdate', function()
					for frame in pairs(toLayout) do
						DoLayoutIconBar(frame)
					end
					wipe(toLayout)
					layoutHandler:Hide()
				end)
			end
			toLayout[self] = true
			layoutHandler:Show()
		end
	end
end

local testColor = { r=1, g=1, b=1, a=1 }

function GridIndicatorIconBarFrameClass.prototype:UpdateIconBarTestMode()
	local num = GridIndicatorIconBar.db.profile.count
	if testMode then
		local now = GetTime()
		for index = 1, num do
			testColor.r = 0.5 + 0.5 * math.cos(index/num * 2 * math.pi)
			testColor.g = 0.5 + 0.5 * math.cos((index/num+0.33) * 2 * math.pi)
			testColor.b = 0.5 + 0.5 * math.cos((index/num+0.66) * 2 * math.pi)
			self:SetIndicator(GetIconIndicator(index), testColor, tostring(index), index, num, GetMacroIconInfo(index), now, index*3 + 1, index % 4)
		end
	else
		for index = 1, num do
			self:ClearIndicator(GetIconIndicator(index))
		end
	end
end

function GridIndicatorIconBarFrameClass.prototype:SetIconSize(...)
	GridIndicatorIconBarFrameClass.super.prototype.SetIconSize(self, ...)
	self:LayoutIconBar()
end

function GridIndicatorIconBarFrameClass.prototype:SetFrameFont(font, fontSize)
	GridIndicatorIconBarFrameClass.super.prototype.SetFrameFont(self, font, fontSize)
	for index, icon in self:IterateBarIcons() do
		icon.stackText:SetFont(font, fontSize, "OUTLINE")
	end
end
