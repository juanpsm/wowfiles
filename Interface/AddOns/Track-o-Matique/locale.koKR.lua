-- vim: ts=2 sw=2 ai et enc=utf8 fenc=utf8

if GetLocale () ~= "koKR" then return end

local tex = ToMLoc.Textures

ToMLoc.type2texture = {
  ["야수"] = tex.Beast,
  ["악마"] = tex.Demon,
  ["용족"] = tex.Dragonkin,
  ["정령"] = tex.Elemental,
  ["거인"] = tex.Giant,
  ["인간형"] = tex.Humanoid,
  ["언데드"] = tex.Undead
} 


ToMLoc.strings = setmetatable ({
  ["Automatic tracking"] = "자동 추적",
  ["Automatically change tracking based on current target. When not using automatic tracking, use /tom in your attack macro."] = "현재 목표물에 맞게 자동으로 추적을 변경 합니다.",
  ["Automatic tracking options"] = "자동 추적 옵션",  
  ["Options applicable only when automatic tracking is enabled"] = "자동 추적 옵션이 켜져 있을때 추적 합니다.",
  ["Only in Raid/Party"] = "레이드/파티 때만 사용",
  ["Only while in a Raid or Party"] = "레이드/파티 동안만 사용합니다.",
  ["Only with Imp. Tracking"] = "특성이 있을때 사용",
  ["Only when talented for Improved Tracking"] = "추적연마가 있을때 사용 합니다.",
  ["Only in Combat"] = "전투중 사용",
  ["Only while in combat"] = "전투중에만 사용 합니다.",
  ["Restore tracking"] = "추적 복원",
  ["Restore the tracking type to what it was before entering combat"] = "전투전의 추적으로 되돌립니다.",
  ["Ignore Druids"] = "드루이드 무시",
  ["Don't waste time tracking Druid shapeshifting"] = "드루이드의 변신을 추적하지 않습니다.",
  ["Quiet login"] = "접속 메세지 숨기기",
  ['Supress the "automatic tracking is ON/OFF" message on login'] = "접속시 자동추적 ON/OFF 메세지를 숨깁니다.",
  ["Debugging"] = "디버깅",
  ["Enable printing of debugging information. This is very irritating. You probably don't want this."] = "디버깅 메세지를 활성화 합니다.(비추천)",
  ["Automatic tracking now ON"] = "자동 추적 켜기",
  ["Automatic tracking now OFF (use /tom for manual tracking)"] = "자동추적 끄기(/tom 명령어로 추적 메뉴를 볼수 있습니다.)",
  ["not loaded - this is a hunter-only add-on"] = "사냥꾼 캐릭터만 로드 됩니다.",
  ["miscellaneous"] = "기타",
  ["Giving up on tracking "] = "더이상 추적 않음",
  ["None"] = "없음",
  ["Restore delay"] = "복원시간 지연",
  ["Number of seconds to delay restoring tracking after exiting combat."] = "전투 종료후 몇초 후에 추적 복원을 시킬지 결정합니다.",
  ["Lazy tracking"] = "느린 추적",
  ["Only change tracking if not already tracking something that gives the Imp. Tracking bonus (3.0.8 mechanics)"] = "Only change tracking if not already tracking something that gives the Imp. Tracking bonus"
}, { __index = ToMLoc.DefaultStrings })
