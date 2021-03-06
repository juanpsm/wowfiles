local Target = HideBlizzard:NewModule("Target")
local class = UnitClass("player")

local db
local defaults = {
	profile = {
		["combopointframe"] = nil,
		["focusframe"] = nil,
		["targetunitframe"] = nil,
	},
}

local get, set
do
	function get(info)
		local key = info[#info]
		return db[key]
	end

	function set(info, value)
		local key = info[#info]
		db[key] = value
		Target:UpdateView()
	end
end

local options = nil
local function moduleOptions()
	if not options then
		options = {
			type = "group",
			name = "Target",
			arg = "Target",
			get = get,
			set = set,
			args = {
				enabled = {
					type = "toggle",
					order = 1,
					name = "|cff00ff66Enable Target|r",
					descStyle = "inline",
					desc = "Target module hides target related frames",
					width = "full",
					get = function() return HideBlizzard:GetModuleEnabled("Target") end,
					set = function(info, value) HideBlizzard:SetModuleEnabled("Target", value) end,
				},
				combopointframe = {
					type = "toggle",
					order = 2,
					name = "Combo Point Frame",
					desc = "Hides the combo point frame",
--					width = "full",
					disabled = function() return not Target:IsEnabled() or db.targetunitframe end,
				},
				focusframe = {
					type = "toggle",
					order = 3,
					name = "Focus Frame",
--					width = "full",
					desc = "Hides the focus frame",
					disabled = function() return not Target:IsEnabled() end,
				},
				targetunitframe = {
					type = "toggle",
					order = 4,
					name = "Target Unit Frame",
					desc = "Hides the target unit frame",
--					width = "full",
					disabled = function() return not Target:IsEnabled() end,
				},
				reset = {
					type = "execute",
					order = 5,
					name = "reset module",
					desc = "use this if you're having trouble",
					width = "full",
					confirm = true,
					func = function() HideBlizzard:ModuleReset("Target") end,
				},
			},
		}
	end
	return options
end

function Target:OnInitialize()
	self:SetEnabledState(HideBlizzard:GetModuleEnabled("Target"))
	self.db = HideBlizzard.db:RegisterNamespace("Target", defaults)
	db = self.db.profile

	HideBlizzard:RegisterModuleOptions("Target", moduleOptions, "Target")
end

function Target:OnEnable()
	self:UpdateView()
end

function Target:OnDisable()
	self:UpdateView()
end

function Target:UpdateView()
	db = self.db.profile

	if db.combopointframe == true then
		if (class == "ROGUE") or (class == "DRUID") then
			for i = 1, MAX_COMBO_POINTS do
				local combopointframe = _G["ComboPoint"..i]
				combopointframe:Hide()
				combopointframe:UnregisterAllEvents()
				combopointframe.Show = function() end
			end
		end
	else
		if (class == "ROGUE") or (class == "DRUID") then
			for i = 1, MAX_COMBO_POINTS do
				local combopointframe = _G["ComboPoint"..i]
				combopointframe.Show = nil
				combopointframe:Show()
				combopointframe:RegisterEvent("PLAYER_FOCUS_CHANGED")
				combopointframe:RegisterEvent("PLAYER_TARGET_CHANGED")
				combopointframe:RegisterEvent("PLAYER_COMBO_POINTS")
			end
		end
	end

	if db.focusframe == true then
		FocusFrame:Hide()
		FocusFrame:UnregisterAllEvents()
		FocusFrameHealthBar:UnregisterAllEvents()
		FocusFrameManaBar:UnregisterAllEvents()
		FocusFrameSpellBar:UnregisterAllEvents()
	else
		if UnitExists("focus") then
			FocusFrame:Show()
		end
		FocusFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
		FocusFrame:RegisterEvent("PLAYER_FOCUS_CHANGED")
		FocusFrame:RegisterEvent("UNIT_HEALTH")
		FocusFrame:RegisterEvent("UNIT_LEVEL")
		FocusFrame:RegisterEvent("UNIT_FACTION")
		FocusFrame:RegisterEvent("UNIT_CLASSIFICATION_CHANGED")
		FocusFrame:RegisterEvent("UNIT_AURA")
		FocusFrame:RegisterEvent("PLAYER_FLAGS_CHANGED")
		FocusFrame:RegisterEvent("PARTY_MEMBERS_CHANGED")
	end

	if db.targetunitframe == true then
		TargetFrame:UnregisterAllEvents()
		TargetFrame:Hide()
	else
		if UnitExists("target") then
			TargetFrame:Show()
		end
		TargetFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
		TargetFrame:RegisterEvent("PLAYER_FOCUS_CHANGED")
		TargetFrame:RegisterEvent("UNIT_HEALTH")
		TargetFrame:RegisterEvent("UNIT_LEVEL")
		TargetFrame:RegisterEvent("UNIT_FACTION")
		TargetFrame:RegisterEvent("UNIT_CLASSIFICATION_CHANGED")
		TargetFrame:RegisterEvent("UNIT_AURA")
		TargetFrame:RegisterEvent("PLAYER_FLAGS_CHANGED")
		TargetFrame:RegisterEvent("PARTY_MEMBERS_CHANGED")
		TargetFrame:RegisterEvent("RAID_TARGET_UPDATE")
		TargetFrame:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")
	end
end
