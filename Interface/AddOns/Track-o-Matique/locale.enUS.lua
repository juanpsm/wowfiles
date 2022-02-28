-- vim: ts=2 sw=2 ai et enc=utf8 fenc=utf8

-- This can/should be overridden for each locale
BINDING_NAME_TRACK_O_MATIQUE_ON_OFF = "Toggle automatic tracking on/off"
BINDING_NAME_TRACK_O_MATIQUE_COMBAT_ON_OFF = "Toggle 'only in combat' option on/off"

local tex = ToMLoc.Textures

-- Lookup table from creature type to texture
ToMLoc.type2texture = {
  Beast = tex.Beast,
  Demon = tex.Demon,
  Dragonkin = tex.Dragonkin,
  Elemental = tex.Elemental,
  Giant = tex.Giant,
  Humanoid = tex.Humanoid,
  Undead = tex.Undead
}

-- Localized string table, in this case simply a fall-through to the default
-- strings. See the locale.deDE.lua file for a better example on how to use
-- this.
ToMLoc.strings = setmetatable ({}, { __index = ToMLoc.DefaultStrings })

