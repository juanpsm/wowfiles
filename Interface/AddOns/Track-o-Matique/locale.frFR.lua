-- vim: ts=2 sw=2 ai et enc=utf8 fenc=utf8

if GetLocale () ~= "frFR" then return end

local tex = ToMLoc.Textures

ToMLoc.type2texture = {
  ["Bête"] = tex.Beast,
  ["Démon"] = tex.Demon,
  Draconien = tex.Dragonkin,
  ["Elémentaire"] = tex.Elemental,
  ["Géant"] = tex.Giant,
  ["Humanoïde"] = tex.Humanoid,
  ["Mort-vivant"] = tex.Undead
}

ToMLoc.strings = setmetatable ({
  -- Localized strings should go here...
}, { __index = ToMLoc.DefaultStrings })
