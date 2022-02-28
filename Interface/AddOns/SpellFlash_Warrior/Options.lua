
local OptionsFrameTemplate = "SpellFlashAddon_OptionsFrameTemplate1"


local AddonName, Table = ...
local OptionsFrameName = AddonName.."_SpellFlashAddonOptionsFrame"

SpellFlashAddon[OptionsFrameName.."_UpdateScriptSliderText"] = function(self)
	if self and self:IsVisible() then
		local Value = self:GetValue()
		if type(SpellFlashAddon.Spam[AddonName][Value]) ~= "table" or type(SpellFlashAddon.Spam[AddonName][Value].Function) ~= "function" then
			Value = 1
		end
		getglobal(OptionsFrameName.."_ScriptSliderTitleLabel"):SetText(SpellFlashAddon.Spam[AddonName][Value].Title or "")
		getglobal(OptionsFrameName.."_ScriptSliderDescriptionLabel"):SetText(SpellFlashAddon.Spam[AddonName][Value].Description or "")
		getglobal(OptionsFrameName.."_ScriptSliderValueLabel"):SetText(""..Value)
	end
end

local OptionsFrame = CreateFrame("Frame", OptionsFrameName, nil, OptionsFrameTemplate)

Table.Localize["Spell Flashing"] = SpellFlashAddonOptionsFrame_SpellFlashingText:GetText()
for _, Frame in next,{OptionsFrame:GetChildren()} do
	if Frame:GetObjectType() == "FontString" then
		local text = Frame:GetText()
		if text and text ~= "" then
			Frame:SetText(Table.Localize[text])
		end
	else
		for _, Frame in next,{Frame:GetRegions()} do
			if Frame:GetObjectType() == "FontString" then
				local text = Frame:GetText()
				if text and text ~= "" then
					Frame:SetText(Table.Localize[text])
				end
			end
		end
	end
end
getglobal(OptionsFrameName.."TitleString"):SetText(GetAddOnMetadata(AddonName, "Title").." "..GetAddOnMetadata(AddonName, "Version"))

OptionsFrame.okay = function()
	if getglobal(OptionsFrameName.."_SpellFlashing"):GetChecked() then
		SpellFlashAddon.SetPlayerConfig(AddonName..".spell_flashing_off", nil)
	else
		SpellFlashAddon.SetPlayerConfig(AddonName..".spell_flashing_off", true)
	end
	if type(SpellFlashAddon.Spam[AddonName]) == "table" and type(SpellFlashAddon.Spam[AddonName][1]) == "table" and type(SpellFlashAddon.Spam[AddonName][1].Function) == "function" then
		local Value = getglobal(OptionsFrameName.."_ScriptSlider"):GetValue()
		if Value == 1 or type(SpellFlashAddon.Spam[AddonName][Value]) ~= "table" or type(SpellFlashAddon.Spam[AddonName][Value].Function) ~= "function" then
			Value = nil
		end
		SpellFlashAddon.SetPlayerConfig(AddonName..".script_number", Value)
	end
end

OptionsFrame.default = function()
	SpellFlashAddon.SetPlayerConfig(AddonName..".spell_flashing_off", nil)
	SpellFlashAddon.SetPlayerConfig(AddonName..".script_number", nil)
end

OptionsFrame.refresh = function()
	getglobal(OptionsFrameName.."_SpellFlashing"):SetChecked(not SpellFlashAddon.GetPlayerConfig(AddonName..".spell_flashing_off"))
	if type(SpellFlashAddon.Spam[AddonName]) == "table" and type(SpellFlashAddon.Spam[AddonName][1]) == "table" and type(SpellFlashAddon.Spam[AddonName][1].Function) == "function" then
		getglobal(OptionsFrameName.."_ScriptSlider"):Show()
		getglobal(OptionsFrameName.."_ScriptSliderTitle"):Show()
		getglobal(OptionsFrameName.."_ScriptSliderDescription"):Show()
		getglobal(OptionsFrameName.."_ScriptSliderMinValue"):Show()
		getglobal(OptionsFrameName.."_ScriptSliderMaxValue"):Show()
		getglobal(OptionsFrameName.."_ScriptSliderValue"):Show()
		local MaxValue = getn(SpellFlashAddon.Spam[AddonName])
		getglobal(OptionsFrameName.."_ScriptSlider"):SetMinMaxValues(1, MaxValue)
		getglobal(OptionsFrameName.."_ScriptSliderMinValueLabel"):SetText("1")
		getglobal(OptionsFrameName.."_ScriptSliderMaxValueLabel"):SetText(""..MaxValue)
		local Value = SpellFlashAddon.GetPlayerConfig(AddonName..".script_number") or 1
		if type(SpellFlashAddon.Spam[AddonName][Value]) ~= "table" or type(SpellFlashAddon.Spam[AddonName][Value].Function) ~= "function" then
			Value = 1
		end
		getglobal(OptionsFrameName.."_ScriptSlider"):SetValue(Value)
		getglobal(OptionsFrameName.."_ScriptSliderTitleLabel"):SetText(SpellFlashAddon.Spam[AddonName][Value].Title or "")
		getglobal(OptionsFrameName.."_ScriptSliderDescriptionLabel"):SetText(SpellFlashAddon.Spam[AddonName][Value].Description or "")
		getglobal(OptionsFrameName.."_ScriptSliderValueLabel"):SetText(""..Value)
	end
end

if string.find(string.lower(AddonName), "^spellflash_.") then
	OptionsFrame.name = gsub(AddonName, "^.........._", "")
	OptionsFrame.parent = GetAddOnMetadata("SpellFlash", "Title")
else
	OptionsFrame.name = AddonName
end

InterfaceOptions_AddCategory(OptionsFrame)
