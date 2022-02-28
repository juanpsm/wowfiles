-- vim: ts=2 sw=2 ai et enc=utf8 fenc=utf8

if GetLocale () ~= "zhTW" then return end

local tex = ToMLoc.Textures

ToMLoc.type2texture = {
  ["野獸"] = tex.Beast,
  ["惡魔"] = tex.Demon,
  ["龍類"] = tex.Dragonkin,
  ["元素生物"] = tex.Elemental,
  ["巨人"] = tex.Giant,
  ["人型生物"] = tex.Humanoid,
  ["不死族"] = tex.Undead
} 


ToMLoc.strings = setmetatable ({
  ["Automatic tracking"] = "自動追蹤",
  ["Automatically change tracking based on current target. When not using automatic tracking, use /tom in your attack macro."] = "自動切換追蹤當前目標。當你沒使用自動追蹤時，可使用/tom指令切換追蹤。",
  ["Automatic tracking options"] = "自動追蹤設定選項",
  ["Options applicable only when automatic tracking is enabled"] = "只有在自動追蹤功能開啟時才可修改設定",
  ["Only in Raid/Party"] = "只使用在團隊/隊伍",
  ["Only while in a Raid or Party"] = "當你在團隊或是隊伍中才啟用自動追蹤",
  ["Only with Imp. Tracking"] = "只使用在有強化追蹤",
  ["Only when talented for Improved Tracking"] = "當你天賦有點強化追蹤時才啟用自動追蹤",
  ["Only in Combat"] = "只使用在戰鬥時",
  ["Only while in combat"] = "當你在戰鬥中才啟用自動追蹤" ,
  ["Restore tracking"] = "恢復追蹤種類",
  ["Restore the tracking type to what it was before entering combat"] = "恢復進入戰鬥前的追蹤種類",
  ["Ignore Druids"] = "忽視德魯伊",
  ["Don't waste time tracking Druid shapeshifting"] = "不浪費時間追蹤德魯伊的型態",
  ["Quiet login"] = "登入不提示",
  ['Supress the "automatic tracking is ON/OFF" message on login'] = "在登入時隱藏自動追蹤開啟/關閉的訊息",
  ["Debugging"] = "除錯模式",
  ["Enable printing of debugging information. This is very irritating. You probably don't want this."] = "開啟顯示除錯訊息。這是非常煩厭的，你多半不會想要使用這個。",
  ["Automatic tracking now ON"] = "自動追蹤功能已打開",
  ["Automatic tracking now OFF (use /tom for manual tracking)"] = "自動追蹤功能已關閉 (可使用/tom追蹤目標))",
  ["not loaded - this is a hunter-only add-on"] = "已停止讀取 - 這是獵人專用插件"
}, { __index = ToMLoc.DefaultStrings })


