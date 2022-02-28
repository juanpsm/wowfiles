-- vim: ts=2 sw=2 ai et enc=utf8 fenc=utf8

if GetLocale () ~= "deDE" then return end

local tex = ToMLoc.Textures

ToMLoc.type2texture = {
  Wildtier = tex.Beast,
  ["Dämon"] = tex.Demon,
  Drachkin = tex.Dragonkin,
  Elementar = tex.Elemental,
  Riese = tex.Giant,
  Humanoid = tex.Humanoid,
  Untoter = tex.Undead
}


ToMLoc.strings = setmetatable ({
  ["Automatic tracking"] = "Automatisches Aufspüren",
  ["Automatically change tracking based on current target. When not using automatic tracking, use /tom in your attack macro."] = "Wechselt automatisch das Tracking auf das aktuelle target. Ohne die automatik kann mittels /tom im Makro gewechselt werden.",
  ["Automatic tracking options"] = "Optionen für Automatisches Aufspüren",
  ["Options applicable only when automatic tracking is enabled"] = "Optionen sind nur benutzbar, wenn automatisches Aufspüren Aktiviert ist.",
  ["Only in Raid/Party"] = "Nur im Raid/Gruppe",
  ["Only while in a Raid or Party"] = "Nur im Raid/Gruppe aktivieren.",
  ["Only with Imp. Tracking"] = "Nur mit verbessertem Fährtenlesen",
  ["Only when talented for Improved Tracking"] = "Nur wenn verbessertes Fährtenlesen geskillt ist aktivieren.",
  ["Only in Combat"] = "Nur im Kampf",
  ["Only while in combat"] = "Nur während des Kampfes aktivieren." ,
  ["Restore tracking"] = "Aufspüren wiederherstellen",
  ["Restore the tracking type to what it was before entering combat"] = "Nach dem Kampf wieder auf den ursprünglichen Aufspüren-Typ stellen.",
  ["Ignore Druids"] = "Ignoriere Druiden",
  ["Don't waste time tracking Druid shapeshifting"] = "Verschwende keine Zeit für gestaltwechselnde Druiden.",
  ["Quiet login"] = "Keine Loginanzeige",
  ['Supress the "automatic tracking is ON/OFF" message on login'] = "Verstecke die Aufspüren AN/AUS Meldung beim Login.",
  ["Debugging"] = "Debugging",
  ["Enable printing of debugging information. This is very irritating. You probably don't want this."] = "Ermöglicht die Ausgabe von Debugging/Fehlerinformationen im Chat. Hilfreich zur Fehlersuche.",
  ["Automatic tracking now ON"] = "Automatisches Aufspüren ist jetzt AN",
  ["Automatic tracking now OFF (use /tom for manual tracking)"] = "Automatisches Aufspüren ist jetzt AUS (benutze /tom für manuelles Tracking)",
  ["not loaded - this is a hunter-only add-on"] = "nicht geladen - Dies ist ein Jäger Mod."
}, { __index = ToMLoc.DefaultStrings })

