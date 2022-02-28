-- vim: ts=2 sw=2 ai et enc=utf8 fenc=utf8

-- To avoid namespace pollution we keep all our localization stuff under this
-- table.
ToMLoc = {}

-- This table contains the "master" textures, which can be referenced by each of
-- the locale-specific tables. Should NOT be overridden by any other locale.
ToMLoc.Textures = {
  Beast = "Interface\\Icons\\Ability_Tracking",
  Demon = "Interface\\Icons\\Spell_Shadow_SummonFelHunter",
  Dragonkin = "Interface\\Icons\\INV_Misc_Head_Dragon_01",
  Elemental = "Interface\\Icons\\Spell_Frost_SummonWaterElemental",
  Giant = "Interface\\Icons\\Ability_Racial_Avatar",
  Humanoid = "Interface\\Icons\\Spell_Holy_PrayerOfHealing",
  Undead = "Interface\\Icons\\Spell_Shadow_DarkSummoning"
}

-- Master strings table
ToMLoc.DefaultStrings = setmetatable (
  {},
  { __index = function (self, key)
      if ToM.db.profile.debug then ToM:Print ("Unlocalized: "..tostring(key)) end
      rawset (self, key, key)
      return key
    end
  }
)

local function mkstr (str) ToMLoc.DefaultStrings[str] = str end
-- These are the strings that should be localized.
-- This excludes the debugging output, since I need to be able to read that... :)
mkstr ("Automatic tracking")
mkstr ("Automatically change tracking based on current target. When not using automatic tracking, use /tom in your attack macro.")
mkstr ("Automatic tracking options")
mkstr ("Options applicable only when automatic tracking is enabled")
mkstr ("Only in instances")
mkstr ("Only while inside an instance")
mkstr ("Only with Imp. Tracking")
mkstr ("Only when talented for Improved Tracking")
mkstr ("Only in Combat")
mkstr ("Only while in combat")
mkstr ("Restore tracking")
mkstr ("Restore the tracking type to what it was before entering combat")
mkstr ("Ignore Druids")
mkstr ("Don't waste time tracking Druid shapeshifting")
mkstr ("Quiet login")
mkstr ('Supress the "automatic tracking is ON/OFF" message on login')
mkstr ("Debugging")
mkstr ("Enable printing of debugging information. This is very irritating. You probably don't want this.")
mkstr ("Automatic tracking now ON")
mkstr ("Automatic tracking now OFF (use /tom for manual tracking)")
mkstr ("not loaded - this is a hunter-only add-on")
mkstr ("miscellaneous")
mkstr ("Giving up on tracking ")
mkstr ("None")
mkstr ("Restore delay")
mkstr ("Number of seconds to delay restoring tracking after exiting combat.")
mkstr ("Lazy tracking")
mkstr ("Only change tracking if not already tracking something that gives the Imp. Tracking bonus (3.0.8 mechanics)")

-- Deprecated strings
--mkstr ("Only in Raid/Party")  -- Replaced with "Only in instances"
--mkstr ("Only while in a Raid or Party") -- Replaced with "Only while inside an instance"
