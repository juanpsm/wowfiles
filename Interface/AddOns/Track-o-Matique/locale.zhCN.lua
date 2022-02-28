if GetLocale () ~= "zhCN" then return end

local tex = ToMLoc.Textures

ToMLoc.type2texture = {
  ["野兽"] = tex.Beast,
  ["恶魔"] = tex.Demon,
  ["龙类"] = tex.Dragonkin,
  ["元素生物"] = tex.Elemental,
  ["巨人"] = tex.Giant,
  ["亡灵"] = tex.Humanoid,
  ["人型生物"] = tex.Undead
}



ToMLoc.strings = setmetatable ({
  ["Automatic tracking"] = "自动追踪",
  ["Automatically change tracking based on current target. When not using automatic tracking, use /tom in your attack macro."] = "自动追踪当前目标,当你没有打开自动追踪时.可用使用 /tom 宏追踪当前目标.",
  ["Automatic tracking options"] = "自动追踪设置",
  ["Options applicable only when automatic tracking is enabled"] = "只有在自动追踪打开时才能进行设置.",
  ["Only in Raid/Party"] = "仅在团队/队伍状态使用",
  ["Only while in a Raid or Party"] = "只在团队或队伍中打开自动追踪.",
  ["Only with Imp. Tracking"] = "仅在天赋中强化追踪时使用",
  ["Only when talented for Improved Tracking"] = "当你天赋中有强化追踪时使用自动追踪.",
  ["Only in Combat"] = "仅在战斗时使用",
  ["Only while in combat"] = "仅在战斗中使用自动追踪." ,
  ["Restore tracking"] = "恢复追踪",
  ["Restore the tracking type to what it was before entering combat"] = "恢复进入战斗前的追踪状态.",
  ["Ignore Druids"] = "忽略德鲁伊",
  ["Don't waste time tracking Druid shapeshifting"] = "不浪费时间追踪德鲁伊形态.",
  ["Quiet login"] = "登录时不提示",
  ['Supress the "automatic tracking is ON/OFF" message on login'] = "在登入时不显示自动追踪的开启或关闭信息.",
  ["Debugging"] = "除错模式",
  ["Enable printing of debugging information. This is very irritating. You probably don't want this."] = "打开除错提示信息.这是非常麻烦的,你多半不会打开此功能",
  ["Automatic tracking now ON"] = "自动追踪状态已打开",
  ["Automatic tracking now OFF (use /tom for manual tracking)"] = "自动追踪 (使用 /tom 手动追踪目标)",
  ["not loaded - this is a hunter-only add-on"] = "仅职业为猎人时加载."
}, { __index = ToMLoc.DefaultStrings })
