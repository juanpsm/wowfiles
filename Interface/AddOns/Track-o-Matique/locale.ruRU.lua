-- vim: ts=2 sw=2 ai et enc=utf8 fenc=utf8

if GetLocale () ~= "ruRU" then return end

local tex = ToMLoc.Textures

ToMLoc.type2texture = {
  ["Животное"] = tex.Beast,
  ["Демон"] = tex.Demon,
  ["Дракон"] = tex.Dragonkin,
  ["Элементаль"] = tex.Elemental,
  ["Великан"] = tex.Giant,
  ["Гуманоид"] = tex.Humanoid,
  ["Нежить"] = tex.Undead
} 

ToMLoc.strings = setmetatable ({
  ["Automatic tracking"] = "Авто выслеживание",
  ["Automatically change tracking based on current target. When not using automatic tracking, use /tom in your attack macro."] = "Автоматическая смена типа выслеживания, основывается на типе текущей цели. Если не используете авто выслеживание, тогда для смены типа выслеживания используйте макрос /tom.",
  ["Automatic tracking options"] = "Опции авто выслеживания",
  ["Options applicable only when automatic tracking is enabled"] = "Опции действительны только если включена опция авто выслеживания",
  ["Only in Raid/Party"] = "Только в рейде/группе",
  ["Only while in a Raid or Party"] = "Только когда вы находитесь в группе/рейде",
  ["Only with Imp. Tracking"] = "Только с Маст.Выслеж",
  ["Only when talented for Improved Tracking"] = "Только если взят талант мастерское выслеживание",
  ["Only in Combat"] = "Только в бою",
  ["Only while in combat"] = "Только если вы вступаете в бой" ,
  ["Restore tracking"] = "Вост. выслеживание",
  ["Restore the tracking type to what it was before entering combat"] = "Востонавливать тип выслеживание на тот который был перед боем",
  ["Ignore Druids"] = "Игнор друидов",
  ["Don't waste time tracking Druid shapeshifting"] = "Не тратить время на выслеживание друидских форм",
  ["Quiet login"] = "Тихий вход",
  ['Supress the "automatic tracking is ON/OFF" message on login'] = "Подавляет сообщение \"авто выслеживание ВКЛ/ВЫКЛ\" при входе в игру",
  ["Debugging"] = "Отлаживание",
  ["Enable printing of debugging information. This is very irritating. You probably don't want this."] = "Включает вывод отладочной информации. Это очень раздражает. Вам это не нужно.",
  ["Automatic tracking now ON"] = "Авто выслеживание теперь ВКЛ",
  ["Automatic tracking now OFF (use /tom for manual tracking)"] = "Авто выслеживание теперь ВЫКЛ (используйте /tom для ручной смены типа выслеживания)",
  ["not loaded - this is a hunter-only add-on"] = "не загружен - данный аддон только для охотников",
  ["miscellaneous"] = "разное",
  ["Giving up on tracking "] = "Giving up on tracking ",
  ["None"] = "Отсутствует",
  ["Number of seconds to delay restoring tracking after exiting combat."] = "Число секунд задержки востоновление отслеживания после выхода из боя.",
  ["Automatic tracking"] = "Авто выслеживание",
  ["Automatically change tracking based on current target. When not using automatic tracking, use /tom in your attack macro."] = "Автоматическая смена типа выслеживания, основывается на типе текущей цели. Если не используете авто выслеживание, тогда для смены типа выслеживания используйте макрос /tom.",
  ["Automatic tracking options"] = "Опции авто выслеживания",
  ["Options applicable only when automatic tracking is enabled"] = "Опции действительны только если включена опция авто выслеживания",
  ["Only in Raid/Party"] = "Только в рейде/группе",
  ["Only while in a Raid or Party"] = "Только когда вы находитесь в группе/рейде",
  ["Only with Imp. Tracking"] = "Только с Маст.Выслеж",
  ["Only when talented for Improved Tracking"] = "Только если взят талант мастерское выслеживание",
  ["Only in Combat"] = "Только в бою",
  ["Only while in combat"] = "Только если вы вступаете в бой",
  ["Restore tracking"] = "Вост. выслеживание",
  ["Restore the tracking type to what it was before entering combat"] = "Востонавливать тип выслеживание на тот который был перед боем",
  ["Ignore Druids"] = "Игнор друидов",
  ["Don't waste time tracking Druid shapeshifting"] = "Не тратить время на выслеживание друидских форм",
  ["Quiet login"] = "Тихий вход",
  ['Supress the "automatic tracking is ON/OFF" message on login'] = "Подавляет сообщение \"авто выслеживание ВКЛ/ВЫКЛ\" при входе в игру",
  ["Debugging"] = "Отлаживание",
  ["Enable printing of debugging information. This is very irritating. You probably don't want this."] = "Включает вывод отладочной информации. Это очень раздражает. Вам это не нужно.",
  ["Automatic tracking now ON"] = "Авто выслеживание теперь ВКЛ",
  ["Automatic tracking now OFF (use /tom for manual tracking)"] = "Авто выслеживание теперь ВЫКЛ (используйте /tom для ручной смены типа выслеживания)",
  ["not loaded - this is a hunter-only add-on"] = "не загружен - данный аддон только для охотников",
  ["miscellaneous"] = "разное",
  ["Giving up on tracking "] = "Giving up on tracking ",
  ["None"] = "Отсутствует",
  ["Restore delay"] = "Задержка востоновления",
  ["Number of seconds to delay restoring tracking after exiting combat."] = "Число секунд задержки востоновление отслеживания после выхода из боя.",
  ["Lazy tracking"] = "Ленивая слежка",
  ["Only change tracking if not already tracking something that gives the Imp. Tracking bonus (3.0.8 mechanics)"] = "Смена отслеживания только если не отслеживатся то, что дает бонус от Маст.Выслежывания (3.0.8 Механизм)"
}, { __index = ToMLoc.DefaultStrings })

