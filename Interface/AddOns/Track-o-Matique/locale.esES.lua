-- vim: ts=2 sw=2 ai et enc=utf8 fenc=utf8

if GetLocale () ~= "esES" then return end

local tex = ToMLoc.Textures

ToMLoc.type2texture = {
  Bestia = tex.Beast,
  Demonio = tex.Demon,
  Dragonante = tex.Dragonkin,
  Elemental = tex.Elemental,
  Gigante = tex.Giant,
  Humanoide = tex.Humanoid,
  ["No-muerto"] = tex.Undead
}

ToMLoc.strings = setmetatable ({
  ["Automatic tracking"] = "Rastreo automático",
  ["Automatically change tracking based on current target. When not using automatic tracking, use /tom in your attack macro."] = "Cambia automáticamente el rastreo basado en el objetivo actual. Cuando no se use el rastreo automático, usa /tom en tu macro de ataque.",
  ["Automatic tracking options"] = "Opciones rastreo automático",
  ["Options applicable only when automatic tracking is enabled"] = "Opciones aplicables sólo cuando el rastreo automático está activo.",
  ["Only in Raid/Party"] = "Sólo en Bandas/Grupos",
  ["Only while in a Raid or Party"] = "Sólo cuando se está en Banda o Grupo",
  ["Only with Imp. Tracking"] = "Sólo con Rastreo Mejorado",
  ["Only when talented for Improved Tracking"] = "Sólo cuando se tiene el talento de Rastreo Mejorado",
  ["Only in Combat"] = "Sólo en combate",
  ["Only while in combat"] = "Sólo mientras se está en combate" ,
  ["Restore tracking"] = "Restaurar rastreo",
  ["Restore the tracking type to what it was before entering combat"] = "Restaurar el tipo de rastreo que estaba antes de entrar en combate",
  ["Ignore Druids"] = "Ignorar Druidas",
  ["Don't waste time tracking Druid shapeshifting"] = "No perder el tiempo rastreando Druidas transformados",
  ["Quiet login"] = "Login silencioso",
  ['Supress the "automatic tracking is ON/OFF" message on login'] = "Eliminar el mensaje de rastreo automático es ACTIVO/PARADO al hacer login",
  ["Debugging"] = "Debugging",
  ["Enable printing of debugging information. This is very irritating. You probably don't want this."] = "Habilitar la impresión de información de debug. Es muy irritante. Probablemente no quieres esto.",
  ["Automatic tracking now ON"] = "Rastreo automático está ACTIVO",
  ["Automatic tracking now OFF (use /tom for manual tracking)"] = "Rastreo automático está PARADO (usa /tom para rastreo manual)",
  ["not loaded - this is a hunter-only add-on"] = "No cargado - este es un add-on sólo para cazadores",
  ["miscellaneous"] = "miscelánea",
  ["Giving up on tracking"] = "Dejar de rastrear",
  ["none"] = "ninguno",
  ["Lazy tracking"] = "Rastreo perezoso",
  ["Only change tracking if not already tracking something that gives the Imp. Tracking bonus (3.0.8 mechanics)"] = "Sólo cambiar rastreo si no se está ya rastreando algo que da el bonus de Rastreo Mejorado (mecanismo v. 3.0.8)"
}, { __index = ToMLoc.DefaultStrings })

