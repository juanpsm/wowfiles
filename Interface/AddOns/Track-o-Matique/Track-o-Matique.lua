-- vim: ts=2 sw=2 ai et enc=utf8 fenc=utf8

-- Key bind section header
BINDING_HEADER_TRACK_O_MATIQUE = "Track-o-Matique"

local NAME = "Track-o-Matique"
local L = ToMLoc.strings
local NONE_TEX = "Interface\\Minimap\\Tracking\\None"
-- Get the localized spell names for Feign Death and Shadowmeld
local FEIGN_DEATH = GetSpellInfo (5384)
local SHADOWMELD = GetSpellInfo (58984)

ToM = LibStub ("AceAddon-3.0"):NewAddon (NAME, "AceConsole-3.0", "AceEvent-3.0")

local function mktoggle (ord, nam, des, extrafields)
  local t = { type = 'toggle', order = ord, name = nam, desc = des }
  if extrafields and type(extrafields) == "table" then
    for k, v in pairs (extrafields) do t[k] = v end
  end
  return t
end

local function mkrange (ord, nam, des, mn, mx, stp, extrafields)
  local t = { type = 'range', order = ord, name = nam, desc = des, min = mn, max = mx, step = stp }
  if extrafields and type(extrafields) == "table" then
    for k, v in pairs (extrafields) do t[k] = v end
  end
  return t
end

local function mkblank (ord)
  local t = { type = 'description', order = ord, name = " " }
  return t
end

local options = {
  type = 'group',
  handler = ToM,
  childGroups = 'tab',
  get = "GetVal", set = "SetVal",
  args = {
    options = {
      type = 'group', name = "Options", desc = NAME.." Options", order = 1,
      args = {
        automatic = mktoggle (1, L["Automatic tracking"], L["Automatically change tracking based on current target. When not using automatic tracking, use /tom in your attack macro."]),
        conditions = {
          type = 'group',
          name = L["Automatic tracking options"],
          desc = L["Options applicable only when automatic tracking is enabled"],
          order = 3,
          guiInline = true,
          disabled = function() return not ToM.db.profile.automatic end,
          args = {
            lazy    = mktoggle (5,  L["Lazy tracking"], L["Only change tracking if not already tracking something that gives the Imp. Tracking bonus (3.0.8 mechanics)"]),
            raid    = mktoggle (10, L["Only in instances"], L["Only while inside an instance"]),
            it      = mktoggle (20, L["Only with Imp. Tracking"],  L["Only when talented for Improved Tracking"]),
            combat  = mktoggle (30, L["Only in Combat"],     L["Only while in combat"]),
            restore = mktoggle (80, L["Restore tracking"],   L["Restore the tracking type to what it was before entering combat"],
              { disabled = function() return not ToM.db.profile.automatic or not ToM.db.profile.combat end }),
            _       = mkblank (90),
            nodruid = mktoggle (91, L["Ignore Druids"], L["Don't waste time tracking Druid shapeshifting"])
          }
        },
        quiet =       mktoggle (89, L["Quiet login"],        L['Supress the "automatic tracking is ON/OFF" message on login']),
        _ =           mkblank  (99),
        debug =       mktoggle (-1, L["Debugging"],          L["Enable printing of debugging information. This is very irritating. You probably don't want this."])
      }
    },
    about = {
      type = 'group', name = "About", desc = "About "..NAME, order = -1,
      args = {
        __ = { type = 'header',      order = 1,  name = NAME.." "..GetAddOnMetadata (NAME,"Version") },
        _1 = { type = 'description', order = 10, name = GetAddOnMetadata (NAME, "Notes") },
        _2 = { type = 'description', order = 20, name = " " },
        _3 = { type = 'description', order = 20, name = "By "..GetAddOnMetadata (NAME, "Author") },
        _31= { type = 'description', order = 21, name = "" },
        _4 = { type = 'description', order = 25, name = "With thanks to Dridzt for suggestions and ideas" },
        _41= { type = 'description', order = 26, name = "German and French support contributed by Fyrgloth EU(Blackrock)" },
        _42= { type = 'description', order = 27, name = "Russian support contributed by Депп and StingerSoft" },
        _43= { type = 'description', order = 28, name = "Spanish support contributed by netoak" },
        _44= { type = 'description', order = 29, name = "Chinese support contributed by jjooeeyy" },
        _45= { type = 'description', order = 29, name = "Korean support contributed by shwy72" },
        _5 = { type = 'description', order = 30, name = " " },
        _6 = { type = 'description', order = 40, name = "Copyright(C) 2008-2009 Johny Mattsson" },
        _7 = { type = 'description', order = 50, name = " " },
        _8 = { type = 'description', order = 60, name = "Build ".. (GetAddOnMetadata (NAME,"X-Build"):match ("%d+") or "<local>") }
      }
    }
  }
}

-- Default profile options
local defaults = {
  profile = {
    automatic = true,
    lazy = true,
    raid = false,
    it = true,
    combat = false,
    restore = false,
    nodruid = false,
    quiet = false,
    debug = false,
  }
}


function ToM:GetVal (info)
  return self.db.profile[info[#info]]
end

function ToM:SetVal (info, v)
  self.db.profile[info[#info]] = v
end

-- Main lookup table, localized
ToM.type2texture = ToMLoc.type2texture
-- Reverse look up table
ToM.texture2type = {}

-- Helper functions
local function dprint (msg)
  if ToM.db.profile.debug then
    ToM:Print (msg)
  end
end

local function tex2typ_safe (tex)
  if tex == NONE_TEX then return L["None"] end
  return ToM.texture2type[tex] or L["miscellaneous"]
end

local function insist_on ()
  if ToM.frame:GetScript ("OnUpdate") then return end
  dprint ("Insisting on tracking "..tex2typ_safe(ToM.expected_track_texture))
  ToM.insistAttempts = 0
  ToM.frame:SetScript ("OnUpdate", function (_, t) ToM:InsistOnTracking (t) end)
end

local function insist_off ()
  if ToM.frame:GetScript ("OnUpdate") then
    dprint ("Not insisting any longer")
    ToM.frame:SetScript ("OnUpdate", nil)
  end
end

local function RetrackForBonus (typ)
  local currentTexture = GetTrackingTexture ()
  if ToM.db.profile.lazy then
    -- If the target type is trackable, and not currently tracking something useful
    return (ToM.type2texture[typ] and not ToM.texture2type[currentTexture])
  else
    -- If the target type is trackable, and we're not currently tracking it
    local wantedTexture = ToM.type2texture[typ]
    return (wantedTexture and wantedTexture ~= currentTexture)
  end
end

-- Cache whether we have Improved Tracking or not
function ToM:UpdateTalentCache ()
  local name, _, _, _, rank = GetTalentInfo (3, 1)
  self.have_it = rank > 0
  dprint ((name or "unknown").." talent points: "..rank)
end

-- For some reason the API function UnitIsFeignDeath() doesn't seem to work, so use our own
local function IsFeigning ()
  local v = UnitAura ("player", FEIGN_DEATH)
  return v == FEIGN_DEATH
end

-- Bah. Alliance junk. ;-P
local function IsShadowmelding ()
  local v = UnitAura ("player", SHADOWMELD)
  return v == SHADOWMELD
end

-- Store our expectation of tracking texture, attempt to track it, and register the "insisting" function
function ToM:SetTracking (index)
  if not index then return end

  self.expected_track_texture = self.index2texture[index]
  if not self.expected_track_texture then return end

  if self.expected_track_texture == NONE_TEX then
    -- The SetTracking() call needs nil instead of -1
    index = nil
  end

  local name = GetTrackingInfo (index)
  local cd = -1
  if name then cd = GetSpellCooldown (name) or 0 end

  local channeling = UnitChannelInfo ("player")
  if not channeling and not IsFeigning () and not IsShadowmelding () and cd == 0 then 
    SetTracking (index)
    insist_off ()
  else
    dprint ("On cooldown or feigned/shadowmelded, holding off with tracking update...")
    insist_on ()
  end
end

-- Periodic function to ensure we successfully track what we wanted
function ToM:InsistOnTracking (elapsed)
  local interval = 0.2
  self.tick = self.tick + elapsed
  if (self.tick < interval) then return end
  self.tick = self.tick - interval

  -- Don't even attempt to set tracking if we know feign/shadowmeld is active
  if IsFeigning () or IsShadowmelding () then return end

  -- Count our actual tracking attempts to give us a safe exit route in case things go bad
  self.insistAttempts = self.insistAttempts + 1
  if self.insistAttempts == 10 then -- 2sec
    -- This is taking too long, maybe we've lost tracking types?
    self:UpdateLookupTables ()
  end
  if self.insistAttempts == 25 then -- 5sec
    self:Print (L["Giving up on tracking "]..tex2typ_safe(self.expected_track_texture))
    insist_off ()
    return
  end

  local tex = self.expected_track_texture
  if not tex then
    insist_off ()
    return
  end

  if tex ~= GetTrackingTexture () then
    self:SetTracking (self.texture2index[tex])
  else
    insist_off ()
  end
end

-- Attempt to auto-track the current target.
-- Note that we keep the dead/unattackable checks here, since this is what /tom calls
function ToM:AutoTrack ()
  local dead = UnitIsDead ("target")
  local attackable = UnitCanAttack ("player", "target")
  local targetType = UnitCreatureType ("target")
  if dead or not attackable or not targetType then
    -- No point in updating tracking
    dprint ("Ignoring target type "..(targetType or "<none>").." - dead: "..(dead or 0)..", attackable:"..(attackable or 0))
    return
  end

  local currentTexture = GetTrackingTexture ()
  if RetrackForBonus (targetType) then
    local index = self.type2index[targetType]
    dprint ("Activating "..(self.type2name[targetType] or "<unknown>"))
    self:SetTracking (index)
    return 1
  end
end

-- Reload the tracking types and set up the lookup tables
function ToM:UpdateLookupTables ()
  local count = 0
  self.type2index = {}
  self.type2name = {}
  self.texture2index = {} -- The "full" table, not just hunter tracking
  self.index2texture = {} -- The "full" table, not just hunter tracking
  self.texture2index[NONE_TEX] = -1
  self.index2texture[-1] = NONE_TEX
  for i = 1, GetNumTrackingTypes () do
    local name, texture, active, category = GetTrackingInfo (i)
    local typ = self.texture2type[texture]
    if typ then
      -- Unit type we can and want to track
      self.type2index[typ] = i
      self.type2name[typ] = name
      count = count + 1
    end
    self.texture2index[texture] = i
    self.index2texture[i] = texture
  end
  dprint ("Now have "..count.." tracking types enabled")

  -- Make sure we stop insisting if we can't track the desired type any longer
  local tex = self.expected_track_texture
  if tex and not self.texture2index[tex] then
    dprint ("Lost the ability to track "..tex2typ_safe(tex))
    insist_off ()
  end
  self.typeCount = count;
end

-- Verify all the conditional options against current conditions, and if they're
-- met, chain through to AutoTrack()
function ToM:MaybeUpdateTracking ()
  local db = self.db.profile
  if not db.automatic then return end
  if db.raid and not IsInInstance () then
    return
  end
  if db.it and not self.have_it then return end
  if db.combat and not UnitAffectingCombat ("player") then return end
  local _, class = UnitClass ("target")
  if db.nodruid and class and class == "DRUID" then return end
  return self:AutoTrack ()
end

-- For /rl convenience, not otherwise needed
function ToM:PLAYER_ENTERING_WORLD ()
  self:UpdateLookupTables ()
  self:UpdateTalentCache ()
end
-- Might have learned a new tracking type
function ToM:LEARNED_SPELL_IN_TAB (tabId)
  self:UpdateLookupTables ()
end
-- Might have lost tracking types (e.g zombified/gorefiended)
-- This also updates on gear/weapon changes, which is a bit overkill for us
function ToM:UNIT_MODEL_CHANGED (event, targetID)
  if targetID == "player" then
    self:UpdateLookupTables ()
  end
end
-- Might have gotten tracking types back (in case we don't get UNIT_MODEL_CHANGED due to death)
-- GetTrackingInfo doesn't work until the character info is loaded, and neither does GetTalentInfo
function ToM:PLAYER_ALIVE ()
  self:UpdateLookupTables ()
  self:UpdateTalentCache ()
end
-- Update tracking, maybe
function ToM:PLAYER_TARGET_CHANGED ()
  if not UnitExists ("target") then return end
  self:MaybeUpdateTracking ()
end

-- Store current tracking type for possible later restoration
-- If we already have a saved tracking index, we do NOT overwrite - this way we work nicely with the FD support
function ToM:PLAYER_REGEN_DISABLED ()
  local db = self.db.profile
  if db.it and not self.have_it then return end

  local tex = GetTrackingTexture ()
  if db.automatic and db.combat and db.restore and tex then
    if self.ooc_tracking_index then
      dprint ("Avoiding overwriting already saved tracking index")
    else
      -- Preserve the current tracking index
      self.ooc_tracking_index = self.texture2index[tex]
      dprint ("Saving current tracking index "..(self.ooc_tracking_index or "nil"))
    end
  end

  self:MaybeUpdateTracking ()
end

-- Schedule a check whether we need to restore the previous tracking type
function ToM:PLAYER_REGEN_ENABLED ()
  ToM:RestoreTracking ()
end

-- Check whether it's desired and safe to restore the saved tracking type
function ToM:RestoreTracking ()
  local db = self.db.profile
  if UnitAffectingCombat ("player") then return end
  if db.automatic and db.combat and db.restore and self.ooc_tracking_index then
    if self.ooc_tracking_index ~= self.texture2index[GetTrackingTexture ()] then
      dprint ("Restoring tracking index "..self.ooc_tracking_index)
      self:SetTracking (self.ooc_tracking_index)
    end
    self.ooc_tracking_index = nil
  end
end

-- Update our idea about whether we have Improved Tracking or not
function ToM:CHARACTER_POINTS_CHANGED ()
  self:UpdateTalentCache ()
end

-- Initialize stuff. Surprise surprise :)
function ToM:OnInitialize ()
  local _,playerClass = UnitClass("player")
  if (playerClass ~= "HUNTER") then
    self.noload = true
    return
  end

  LibStub ("AceConfigRegistry-3.0"):RegisterOptionsTable (NAME, options)
  local ACD = LibStub ("AceConfigDialog-3.0")
  ACD:AddToBlizOptions (NAME, GetAddOnMetadata (NAME, "Title"))
  --ACD:AddToBlizOptions (NAME, nil, nil, "options")
  --ACD:AddToBlizOptions (NAME, "About", NAME, "about")

  -- Bring up GUI config screen
  self:RegisterChatCommand ("track-o-matique", function ()
    InterfaceOptionsFrame_OpenToCategory (NAME) end)

  -- Run auto-track command
  self:RegisterChatCommand ("tom", function() ToM:AutoTrack () end)

  -- Profile db
  self.db = LibStub ("AceDB-3.0"):New ("Track_o_MatiqueDB", defaults)

  -- Build reverse table
  for typ, tex in pairs(self.type2texture) do
    self.texture2type[tex] = typ
  end

  -- Frame for hooking into OnUpdate
  self.frame = CreateFrame ("Frame", nil)
  self.tick = 0
end

function ToM:AnnounceState ()
  -- Only print our status if we're not told to be quiet
  if self.db.profile.quiet then return end
  if self.db.profile.automatic then
    self:Print (L["Automatic tracking now ON"])
  else
    self:Print (L["Automatic tracking now OFF (use /tom for manual tracking)"])
  end
end

function ToM:OnEnable ()
  if self.noload then
    self:Print(L["not loaded - this is a hunter-only add-on"])
    return
  end
  self:RegisterEvent("LEARNED_SPELL_IN_TAB")
  self:RegisterEvent("PLAYER_ENTERING_WORLD")
  self:RegisterEvent("PLAYER_TARGET_CHANGED")
  self:RegisterEvent("PLAYER_REGEN_DISABLED")
  self:RegisterEvent("PLAYER_REGEN_ENABLED")
  self:RegisterEvent("CHARACTER_POINTS_CHANGED")
  self:RegisterEvent("UNIT_MODEL_CHANGED")
  self:RegisterEvent("PLAYER_ALIVE")

  ToM:AnnounceState ()
end

