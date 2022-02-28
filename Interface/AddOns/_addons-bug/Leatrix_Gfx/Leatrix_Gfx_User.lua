-----------------------------------------------------------------------------------------------
--                                                                                           --
--                             Leatrix Gfx User Defined Settings                             --
--                                                                                           --
-----------------------------------------------------------------------------------------------

   function LeaGfxUserSettings()

     local EnableTheseSettings = 0 ; -- Set to 1 to enable the settings below, 0 to disable
 
-----------------------------------------------------------------------------------------------
--                                          Settings                                         --
-----------------------------------------------------------------------------------------------

     if EnableTheseSettings == 1 then

     -- Video
     SetCVar("gxRefresh","75")                       ; -- Sets the refresh rate
     SetCVar("gxMultisample", "1")                   ; -- Disables multisampling
     SetCVar("gxresolution","800x600")               ; -- Sets game resolution
     SetCVar("gxVSync","0")                          ; -- Disables vertical sync
     SetCVar("gxTripleBuffer","0")                   ; -- Disables triple buffering
     SetCVar("gxFixLag","0")                         ; -- Disable reduce input lag
     SetCVar("gxCursor","1")                         ; -- Enable hardware cursor
     SetCVar("ffxDeath", "0")                        ; -- Disable death effect
     SetCVar("ffxGlow", "0")                         ; -- Disable screen glow effect
     SetCVar("specular", "0")                        ; -- Disable specular lighting
     SetCVar("projectedtextures","0")                ; -- Disable projected textures

     -- Sound
     SetCVar("Sound_EnableSoundWhenGameIsInBG", "1") ; -- Enable sound in background
     SetCVar("Sound_EnableAmbience", "0")            ; -- Disable ambient sounds
     SetCVar("Sound_EnablePetSounds", "0")           ; -- Disable pet sounds
     SetCVar("Sound_EnableMusic", "0")               ; -- Disable music
     SetCVar("Sound_OutputQuality", "0")             ; -- Use low sound quality
     SetCVar("Sound_EnableErrorSpeech", "0")         ; -- Disable error speech
     SetCVar("Sound_EnableDSPEffects", "0")          ; -- Disable voice modulation effects

     -- Controls
     SetCVar("deselectOnClick", "0")                 ; -- Enable sticky targeting
     SetCVar("autoLootDefault", "1")                 ; -- Enable autoloot

     -- Combat
     SetCVar("showTargetOfTarget", "1")              ; -- Always show target of target

     -- Display
     SetCVar("displayWorldPVPObjectives", "1")       ; -- Always display world PVP objectives
     SetCVar("threatWarning", "3")                   ; -- Always show aggro warning

     SetCVar("threatShowNumeric", "1")               ; -- Show aggro as percentage
     SetCVar("showItemLevel", "1")                   ; -- Show item level

     -- Objectives
     SetCVar("questFadingDisable", "1")              ; -- Enable instant quest text
     SetCVar("autoQuestWatch", "0")                  ; -- Disable automatic quest tracking

     -- Social
     SetCVar("profanityFilter", "0")                 ; -- Disable mature language filter
     SetCVar("chatBubbles", "0")                     ; -- Disable chat bubbles
     SetCVar("chatBubblesParty", "0")                ; -- Disable party chat bubbles
     SetCVar("spamFilter", "0")                      ; -- Disable spam filter
     SetCVar("guildMemberNotify", "1")               ; -- Enable guild member alert
     SetCVar("guildRecruitmentChannel", "0")         ; -- Disable guild recruitment channel

     -- Actionbars
     SetCVar("lockActionBars", "1")                  ; -- Lock Action bars
     SetCVar("secureAbilityToggle", "1")             ; -- Enable secure ability toggle

     -- Names
     SetCVar("UnitNameOwn", "0")                     ; -- Don't show player name
     SetCVar("UnitNameNPC", "0")                     ; -- Don't show NPC names
     SetCVar("UnitNameCompanionName", "0")           ; -- Don't show companion names  
     SetCVar("UnitNamePlayerGuild", "0")             ; -- Don't show guild names
     SetCVar("UnitNamePlayerPVPTitle", "0")          ; -- Don't show titles
     SetCVar("UnitNameFriendlyPlayerName", "0")      ; -- Don't show friendly player names
     SetCVar("UnitNameFriendlyPetName", "0")         ; -- Don't show friendly pet names
     SetCVar("UnitNameFriendlyCreationName", "0")    ; -- Don't show friendly creation names
     SetCVar("UnitNameEnemyPlayerName", "0")         ; -- Don't show enemy player names
     SetCVar("UnitNameEnemyPetName", "0")            ; -- Don't show enemy pet names
     SetCVar("UnitNameEnemyCreationName", "0")       ; -- Don't show enemy companion names

     -- Status Text
     SetCVar("playerStatusText", "1")                ; -- Show player status text
     SetCVar("petStatusText", "0")                   ; -- Don't show pet status text
     SetCVar("partyStatusText", "0")                 ; -- Don't show party status text
     SetCVar("targetStatusText", "1")                ; -- Show target status text
     SetCVar("statusTextPercentage", "1")            ; -- Show status text as percentage

     -- Unit Frames
     SetCVar("showPartyBackground", "1")             ; -- Show party background
     SetCVar("hidePartyInRaid", "1")                 ; -- Hide party interface in raid
     SetCVar("partyBackgroundOpacity", "0.0")        ; -- Party background opacity
 
     -- Features
     SetCVar("previewTalents", "1")                  ; -- Enable preview talent changes

     -- Help
     SetCVar("gameTip", "0")                         ; -- Disable tutorials
     SetCVar("showGameTips", "0")                    ; -- Hide loading screen tips
     SetCVar("showNewbieTips", "0")                  ; -- Hide beginner tooltips
     SetCVar("UberTooltips", "1")                    ; -- Show enhanced tooltips

-----------------------------------------------------------------------------------------------
--                                         Confirmation                                      --
-----------------------------------------------------------------------------------------------

     -- Display confirmation message
     DEFAULT_CHAT_FRAME:AddMessage("Leatrix Gfx user settings loaded successfully.", 1.0,0.85,0.0)
     end
   end

-----------------------------------------------------------------------------------------------
-- Help
--                                                                                           --
-- This is provided for users who want to retain script functionality from Leatrix Gfx 1.xx.
                                                                                 --
-- You can use this space to enter your own console variables.  They will not be shown in
-- the GUI but they will be loaded with the addon.  If they are loaded successfully, you
-- will see a confirmation message every time you login to Wow.

-- I've entered my personal settings to start off with.  They're all disabled by default.
-- To enable all the settings, change "EnableTheseSettings" to 1, or 0 to disable.

-- These settings are stored in the Config.wtf file (in your WTF folder), not in the addon.
-- If you wish to disable these settings after enabling them, you need to quit Wow then
-- remove the entries from Config.wtf (or just delete the whole config.wtf file).

-- You can change these settings while Wow is running in the background, but some settings
-- require a UI reload and/or graphics reload.  You can do both from within Wow by typing
-- "/gfx reload".
