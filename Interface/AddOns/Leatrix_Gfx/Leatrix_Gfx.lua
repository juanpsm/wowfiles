-----------------------------------------------------------------------------------------------
--                                                                                           --
--                                       Leatrix Gfx 2.14                                    --
--                                Last updated 16th October 2009                             --
--                                                                                           --
-----------------------------------------------------------------------------------------------

-- Create globals and locals
   if not LeaGfxDB then LeaGfxDB={} end

   local r = 1.0 ; local g = 0.85 ; local b = 0.0   
   local LeaGfxLC = {} -- Local table to store values to be saved

   -- Show warning
   local function Warning(msgtype)
   if msgtype == 1 then LeaGfxText = "LEATRIX GFX\n\nClick Ok to configure your display."; end;
     StaticPopupDialogs["LeaGfxRestartCheck"] = {
     text = LeaGfxText,
     button1 = "Ok",
     OnAccept = function()
       RestartGx();
     end,
     timeout = 0,
     hideOnEscape = false,
     whileDead = 1
     };
     StaticPopup_Show ("LeaGfxRestartCheck");
   end

-- Combat Log
   function CombatLog()
     if LeaGfxLC["combatlog"] == "On" then
       COMBATLOG:UnregisterEvent("COMBAT_LOG_EVENT")
       COMBATLOG:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
       COMBATLOG:UnregisterAllEvents() 
     elseif LeaGfxLC["combatlog"] == "Off" then 
       COMBATLOG:RegisterEvent("COMBAT_LOG_EVENT")
       COMBATLOG:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
       COMBATLOG:RegisterAllEvents() 
     end
   end

-- Do It Now!
   local function DoItNow()

     if LeaGfxLC["gxcolorbits"] == "On" then
       SetCVar("gxcolorbits","16")
       SetCVar("gxdepthbits","16")
     elseif LeaGfxLC["gxcolorbits"] == "Off" then
       SetCVar("gxcolorbits","24")
       SetCVar("gxdepthbits","24")
     end

     if LeaGfxLC["shadowprints"] == "On" then
       SetCVar("mapShadows","0")
       SetCVar("shadowLOD","0")
       SetCVar("showfootprints","0")
       SetCVar("extShadowQuality","0")
     elseif LeaGfxLC["shadowprints"] == "Off" then
       SetCVar("mapShadows","1")
       SetCVar("shadowLOD","1")
       SetCVar("showfootprints","1")
     end

     if LeaGfxLC["shaders"] == "On" then
       SetCVar("ffxGlow","0")
       SetCVar("ffxDeath","0")
       SetCVar("ffxNetherworld","0")
       SetCVar("ffxRectangle","0")
       SetCVar("ffxSpecial","0")
       SetCVar("useWeatherShaders","0")
     elseif LeaGfxLC["shaders"] == "Off" then
       SetCVar("ffxNetherworld","1")
       SetCVar("ffxRectangle","1")
       SetCVar("ffxSpecial","1")
       SetCVar("useWeatherShaders","1")
     end

     if LeaGfxLC["groundEffects"] == "On" then
       SetCVar("groundEffectDist","0")
       SetCVar("groundEffectDensity","16")
     elseif LeaGfxLC["groundEffects"] == "Off" then
       if GetCVar("groundEffectDist") == "0" then SetCVar("groundEffectDist","70") end
     end

     if LeaGfxLC["maxfps"] == "On" then
       SetCVar("maxfps",LeaGfxLC["fpscap"]) 
     elseif LeaGfxLC["maxfps"] == "Off" then
       SetCVar("maxfps","0")
     end

     if LeaGfxLC["maxfpsbk"] == "On" then
       SetCVar("maxfpsbk","5")
     elseif LeaGfxLC["maxfpsbk"] == "Off" then
       SetCVar("maxfpsbk","999")
     end

  end

-- Define the options panel
   local Options = CreateFrame('Frame', 'Leatrix_Options', UIParent)

   function Options:OptionsPanel()
     self.name = "Leatrix Gfx"

     local function OptionsTitle(title,subtitle)
       local text = self:CreateFontString(nil, 'ARTWORK', 'GameFontNormalLarge')
             text:SetPoint('TOPLEFT', 16, -16)
             text:SetText(title)

       local subtext = self:CreateFontString(nil, 'ARTWORK', 'GameFontHighlightSmall')
             subtext:SetHeight(32)
             subtext:SetPoint('TOPLEFT', text, 'BOTTOMLEFT', 0, -8)
             subtext:SetPoint('RIGHT', self, -32, 0)
             subtext:SetNonSpaceWrap(true)
             subtext:SetJustifyH('LEFT')
             subtext:SetJustifyV('TOP')
             subtext:SetText(subtitle)
     end

     local function OptionsHeading(title,x,y)
       local text = self:CreateFontString(nil, 'ARTWORK', 'GameFontNormalLarge')
             text:SetPoint("TOPLEFT",x,y)
             text:SetText(title)
     end
 
     local function OptionsText(title,x,y)
       local text = self:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
             text:SetPoint("TOPLEFT",x,y)
             text:SetText(title)
     end

     -- Define slider control
     local function slider(field,caption,low, high, step, x,y)
       local function slider_OnMouseWheel(self, arg1)
         local step = self:GetValueStep() * arg1
         local value = self:GetValue()
         local minVal, maxVal = self:GetMinMaxValues()
         if step > 0 then
           self:SetValue(min(value+step, maxVal))
         else
           self:SetValue(max(value+step, minVal))
         end
       end

       local slider = CreateFrame('slider', field, self, 'OptionssliderTemplate')
       getglobal(slider:GetName() .. 'Text'):SetText(caption)

       slider:SetScript('OnShow', function(self)
         self.onShow = true
         self:SetValue(LeaGfxLC[field])
         self.onShow = nil
       end)

	slider:SetScript('OnValueChanged', function(self, value)
          self.valText:SetText(format('%.0f', value))
          if not self.onShow then
            LeaGfxLC[field] = value
            if LeaGfxLC["maxfps"] == "On" then SetCVar("maxfps",LeaGfxLC["fpscap"]) elseif LeaGfxLC["maxfps"] == "Off" then SetCVar("maxfps","0") end
          end
        end)

        slider:SetMinMaxValues(low, high)
        slider:SetValueStep(step)
        slider:EnableMouseWheel(true)
        slider:SetScript('OnMouseWheel', slider_OnMouseWheel)
        BlizzardOptionsPanel_Slider_Enable(slider)
        slider:SetPoint('TOPLEFT', x,y)
        local text = slider:CreateFontString(nil, 'BACKGROUND')
              text:SetFontObject('GameFontHighlight')
              text:SetPoint('LEFT', slider, 'RIGHT', 7, 0)
              slider.valText = text
              return slider
      end

     -- Define Checkbox control
     local function LeaAction(LeaGfxType,LeaGfxAction)
       if LeaGfxAction == nil then
         LeaGfxLC[LeaGfxType] = "Off"
       elseif LeaGfxAction == 1 then 
         LeaGfxLC[LeaGfxType] = "On"
       end
       DoItNow();
       CombatLog();
       if LeaGfxType == "gxcolorbits" then RestartGx(); end
     end

     local function CheckBox(field,caption,x,y)
       local checkbox = CreateFrame('CheckButton', field, self, 'InterfaceOptionsCheckButtonTemplate')
       getglobal(checkbox:GetName() .. 'Text'):SetText(caption)
       checkbox:SetScript('OnShow', 
         function(self) 
           if (field == "gxcolorbits") then
             if GetCVar("gxcolorbits") == "16" then
               LeaGfxLC["gxcolorbits"] = "On"
             elseif GetCVar("gxcolorbits") == "24" then 
               LeaGfxLC["gxcolorbits"] = "Off"
             end
           end
           if (field == "shadowprints" and GetCVar("extShadowQuality") ~= "0") then 
             LeaGfxLC["shadowprints"] = "Off" 
           end
           if (field == "groundEffects") then
             if GetCVar("groundEffectDist") ~= "0"then 
               LeaGfxLC["groundEffects"] = "Off"
             elseif GetCVar("groundEffectDist") == "0" then
               LeaGfxLC["groundEffects"] = "On"
             end
           end
           if (field == "shaders" and (GetCVar("ffxGlow") ~= "0" or GetCVar("ffxDeath") ~= "0")) then 
             LeaGfxLC["shaders"] = "Off"
           end
           self:SetChecked(LeaGfxLC[field])
         end)
       checkbox:SetScript('OnClick', function(self) LeaAction(field,checkbox:GetChecked()) end)
       checkbox:SetPoint("TOPLEFT",x, y)
     end

-- Populate the options panel
   OptionsTitle("Leatrix Gfx",(select(3, GetAddOnInfo("Leatrix_Gfx"))));
   OptionsText("Checking these options will increase performance.",16,-72);
  
   CheckBox("gxcolorbits", "Reduce colors (changing this will refresh your display)", 16, -97)
   CheckBox("shadowprints", "Disable shadows and footprints", 16, -127)
   CheckBox("shaders", "Disable shaders", 16, -157)
   CheckBox("groundEffects", "Disable ground objects", 16, -187)
   CheckBox("combatlog", "Throttle combat log output", 16, -217)

   OptionsText("Checking these options will cool your computer.",16,-252);
   CheckBox("maxfps", "Limit framerate while playing to the value below", 16, -277)
   slider("fpscap","",5, 120, 5, 46,-312)
   CheckBox("maxfpsbk", "Limit framerate to 5 when Wow is not in the foreground", 16, -347)
   CheckBox("userdef", "Load user defined settings file (requires reload)", 16, -377)

   Options.okay = function (self)
     --
   end

   Options.cancel = function (self) 
     --
   end;

   -- Add panel to interface options    
   InterfaceOptions_AddCategory(self) 
   end

-- Show panel
   Options:OptionsPanel();

-- Slash command handler
   local function slashCommand(str)
     if str == ''       then InterfaceOptionsFrame_OpenToCategory("Leatrix Gfx"); end 
     if str == 'reload' then ReloadUI(); RestartGx(); end
   end

-- Create frames so we can watch events
   local frame = CreateFrame("FRAME", "Leatrix_Gfx");
   frame:RegisterEvent("ADDON_LOADED");
   frame:RegisterEvent("PLAYER_LOGIN");
   frame:RegisterEvent("PLAYER_LOGOUT");

-- Handle events
   local function eventHandler(self, event, arg1, ...)
     -- Load saved variables or set to default if none exist
     if (event == "ADDON_LOADED" and arg1 == "Leatrix_Gfx") then

       if LeaGfxDB["gxcolorbits"] == nil   then LeaGfxLC["gxcolorbits"]   = "On" Warning(1) else LeaGfxLC["gxcolorbits"] = LeaGfxDB["gxcolorbits"] end 
       if LeaGfxDB["shadowprints"] == nil  then LeaGfxLC["shadowprints"]  = "On"  else LeaGfxLC["shadowprints"]  = LeaGfxDB["shadowprints"]  end 
       if LeaGfxDB["shaders"] == nil       then LeaGfxLC["shaders"]       = "On"  else LeaGfxLC["shaders"]       = LeaGfxDB["shaders"]       end 
       if LeaGfxDB["groundEffects"] == nil then LeaGfxLC["groundEffects"] = "On"  else LeaGfxLC["groundEffects"] = LeaGfxDB["groundEffects"] end 
       if LeaGfxDB["combatlog"] == nil     then LeaGfxLC["combatlog"]     = "On"  else LeaGfxLC["combatlog"]     = LeaGfxDB["combatlog"]     end 
       if LeaGfxDB["maxfps"] == nil        then LeaGfxLC["maxfps"]        = "Off" else LeaGfxLC["maxfps"]        = LeaGfxDB["maxfps"]        end 
       if LeaGfxDB["maxfpsbk"] == nil      then LeaGfxLC["maxfpsbk"]      = "On"  else LeaGfxLC["maxfpsbk"]      = LeaGfxDB["maxfpsbk"]      end 
       if LeaGfxDB["fpscap"] == nil        then LeaGfxLC["fpscap"]        = "120"  else LeaGfxLC["fpscap"]        = LeaGfxDB["fpscap"]        end 
       if LeaGfxDB["userdef"] == nil       then LeaGfxLC["userdef"]       = "Off" else LeaGfxLC["userdef"]       = LeaGfxDB["userdef"]       end 
 
       DEFAULT_CHAT_FRAME:AddMessage("Leatrix Gfx loaded successfully.", r,g,b)
       wipe(LeaGfxDB)
       DoItNow();
     end

     if (event == "PLAYER_LOGIN") then
       if LeaGfxLC["userdef"] == "On" then
         LeaGfxUserSettings();
       end
       if LeaGfxLC["combatlog"] == "On" then
         CombatLog();
       end
     end

     -- Save locals back to globals on logout
     if (event == "PLAYER_LOGOUT") then

       LeaGfxDB["gxcolorbits"]   = LeaGfxLC["gxcolorbits"]
       LeaGfxDB["shadowprints"]  = LeaGfxLC["shadowprints"]
       LeaGfxDB["shaders"]       = LeaGfxLC["shaders"]
       LeaGfxDB["groundEffects"] = LeaGfxLC["groundEffects"]
       LeaGfxDB["combatlog"]     = LeaGfxLC["combatlog"]
       LeaGfxDB["maxfps"]        = LeaGfxLC["maxfps"]
       LeaGfxDB["maxfpsbk"]      = LeaGfxLC["maxfpsbk"]
       LeaGfxDB["fpscap"]        = LeaGfxLC["fpscap"]
       LeaGfxDB["userdef"]       = LeaGfxLC["userdef"]

     end
   end

   frame:SetScript("OnEvent", eventHandler);

   SLASH_Leatrix_Gfx1 = '/gfx'
   SlashCmdList["Leatrix_Gfx"] = function(str) slashCommand(string.lower(str)) end