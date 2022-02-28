-- File containing localized strings
-- Translation : eerieN (20051217)

if GetLocale() == "koKR" then

	GroupCalendar_cTitle = "GroupCalendar v%s"

	GroupCalendar_cSun = "일"
	GroupCalendar_cMon = "월"
	GroupCalendar_cTue = "화"
	GroupCalendar_cWed = "수"
	GroupCalendar_cThu = "목"
	GroupCalendar_cFri = "금"
	GroupCalendar_cSat = "토"

	GroupCalendar_cSunday = "일요일"
	GroupCalendar_cMonday = "월요일"
	GroupCalendar_cTuesday = "화요일"
	GroupCalendar_cWednesday = "수요일"
	GroupCalendar_cThursday = "목요일"
	GroupCalendar_cFriday = "금요일"
	GroupCalendar_cSaturday = "토요일"

	GroupCalendar_cSelfWillAttend = "%s 출석에 포함"

	GroupCalendar_cMonthNames = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"}
	GroupCalendar_cDayOfWeekNames = {GroupCalendar_cSunday, GroupCalendar_cMonday, GroupCalendar_cTuesday, GroupCalendar_cWednesday, GroupCalendar_cThursday, GroupCalendar_cFriday, GroupCalendar_cSaturday}

	GroupCalendar_cLoadMessage = "GroupCalendar 로드 완료. '/cal show' 명령어로 달력을 볼수 있습니다."
	GroupCalendar_cInitializingGuilded = "GroupCalendar: 길드에 가입되어 있는 사용자의 초기값 설정"
	GroupCalendar_cInitializingUnguilded = "GroupCalendar: 길드에 가입되어 있지 않은 사용자의 초기값 설정"
	GroupCalendar_cLocalTimeNote = "(%s local)"

	GroupCalendar_cOptions = "설정..."

	GroupCalendar_cCalendar = "달력"
	GroupCalendar_cSetup = "Setup"
	GroupCalendar_cBackup = "Backup"
	GroupCalendar_cAbout = "About"

	GroupCalendar_cChannelConfigTitle = "데이터 채널 설정"
	GroupCalendar_cChannelConfigDescription = "달력 데이터 채널은 사용자들간의 이벤트 정보를 공유하는데 사용됩니다. 같은 채널에 참여할 수 있는 사용자는 원하면 당신의 이벤트 데이터를 볼 수 있을 것입니다. 당신의 달력을 공개하고 싶지 않다면 비밀번호를 사용하세요."
	GroupCalendar_cAutoChannelConfig = "자동 채널 구성"
	GroupCalendar_cManualChannelConfig = "수동 채널 구성"
	GroupCalendar_cStoreAutoConfig = "길드 채널 구성 정보를 이용하여 자동 채널 구성"
	GroupCalendar_cAutoConfigPlayer = "길드 관리자 이름:"
	GroupCalendar_cApplyChannelChanges = "적용"
	GroupCalendar_cAutoConfigTipTitle = "자동 채널 구성"
	GroupCalendar_cAutoConfigTipDescription = "길드 관리자의 채널 구성 데이터를 이용하여 자동으로 채널을 구성합니다. 이 기능을 사용하기 위해서는 길드에 가입되어 있어야 하며 길드 관리자는 채널 데이터를 작성해 두어야 합니다."
	GroupCalendar_cManualConfigTipDescription = "수동으로 채널이름과 비밀번호를 설정할 수 있습니다."
	GroupCalendar_cStoreAutoConfigTipDescription = "길드 관리자가 채널 정보를 구성하고 길드원들이 자동 채널 구성을 통해 길드 채널 정보를 공유할 수 있도록 설정합니다."
	GroupCalendar_cAutoConfigPlayerTipDescription = "채널 구성 데이터를 작성하는 길드 관리자 이름."
	GroupCalendar_cChannelNameTipTitle = "채널이름"
	GroupCalendar_cChannelNameTipDescription = "다른 사용자들과 이벤트 내용을 주고받을 수 있는 채널 이름"
	GroupCalendar_cConnectChannel = "연결"
	GroupCalendar_cDisconnectChannel = "연결해제"
	GroupCalendar_cChannelStatus =
	{
		Starting = {mText = "상태: 시동중...", mColor = {r = 1, g = 1, b = 0.3}},
		Synching = {mText = "상태: Synchronizing with network %s", mColor = {r = 0.3, g = 1, b = 0.3}},
		Suspended = {mText = "Status: Suspended (logging out)", mColor = {r = 1, g = 1, b = 0.3}},
		Connected = {mText = "상태: 데이터 채널에 연결되었습니다", mColor = {r = 0.3, g = 1, b = 0.3}},
		Disconnected = {mText = "상태: 데이터 채널에 연결되지 않았습니다", mColor = {r = 1, g = 0.5, b = 0.2}},
		Initializing = {mText = "상태: 데이터 채널을 초기화하고 있습니다", mColor = {r = 1, g = 1, b = 0.3}},
		Error = {mText = "오류: %s", mColor = {r = 1, g = 0.2, b = 0.4}},
	}

	GroupCalendar_cConnected = "연결됨"
	GroupCalendar_cDisconnected = "연결해제됨"
	GroupCalendar_cTooManyChannels = "최대 10개의 채널에만 입장할 수 있습니다"
	GroupCalendar_cJoinChannelFailed = "알수없는 이유로 채널참가에 실패했습니다"
	GroupCalendar_cWrongPassword = "비밀번호가 틀렸습니다"
	GroupCalendar_cAutoConfigNotFound = "채널 설정 데이터를 가진 길드원을 찾을 수 없습니다."
	GroupCalendar_cErrorAccessingNote = "채널 설정 데이터를 로드할 수 없습니다"

	GroupCalendar_cTrustConfigTitle = "공유 설정"
	GroupCalendar_cTrustConfigDescription = "당신의 이벤트 정보를 제공할 사람들의 명단입니다. 이벤트 정보를 보는 것을 제한하는 것이 아닙니다. 만약 당신의 달력의 정보를 보는것을 제한하려면 데이터 채널에 비밀번호를 설정하십시오."
	GroupCalendar_cTrustGroupLabel = "공유:"
	GroupCalendar_cEvent = "이벤트"
	GroupCalendar_cEdit = "Edit"
	GroupCalendar_cAttendance = "출석"

	GroupCalendar_cAboutTitle = "About Group Calendar"
	GroupCalendar_cTitleVersion = "Group Calendar v"..GroupCalendar.VersionString
	
	GroupCalendar.cAuthor = "Designed and written by John Stephen with contributions by %s"
	GroupCalendar_cTestersTitle = "Testers for 4.3"
	GroupCalendar_cSpecialThanksTitle = "Special thanks to"
	GroupCalendar.cTranslationCredit = "Translations by 기괴한황혼 (KR), %s"
	GroupCalendar_cGuildURL = "In memory of David Ramirez - 2009\r\rwobbleworks.com"
	
	GroupCalendar_cRebuildDatabase = "데이터베이스 재구성"
	GroupCalendar_cRebuildDatabaseDescription = "사용자의 이벤트 데이터베이스를 재구성합니다. 당신의 이벤트를 다른 사람들이 모두 볼 수 없을 때 해결 방법입니다. 그러나 이벤트 출석 여부에 대한 정보가 삭제될 수 있습니다."

	GroupCalendar_cTrustGroups =
	{
		"같은 데이터 채널을 사용하는 모든 사용자",
		"길드원",
		"아래 목록에 설정되어 있는 사용자"
	}

	GroupCalendar_cTrustAnyone = "같은 데이터 채널을 사용하는 모든 사용자."
	GroupCalendar_cTrustGuildies = "공유 목록에 추가된 길드원"
	GroupCalendar_cTrustMinRank = "최소 등급:"
	GroupCalendar_cTrustNobody = "아래 목록에 설정되어 있는 사용자"
	GroupCalendar_cTrustedPlayers = "추가 플레이어"
	GroupCalendar_cExcludedPlayers = "차단 플레이어"
	GroupCalendar_cPlayerName = "플레이어 이름:"
	GroupCalendar_cAddTrusted = "공유"
	GroupCalendar_cRemoveTrusted = "삭제"
	GroupCalendar_cAddExcluded = "차단"

	CalendarEventViewer_cTitle = "이벤트 보기"
	CalendarEventViewer_cDone = "확인"

	CalendarEventViewer_cLevelRangeFormat = "%i 레벨 부터 %i 레벨"
	CalendarEventViewer_cMinLevelFormat = "%i 레벨 이상"
	CalendarEventViewer_cMaxLevelFormat = "최대 %i 레벨"
	CalendarEventViewer_cAllLevels = "모든 레벨"
	CalendarEventViewer_cSingleLevel = "%i 레벨"

	CalendarEventViewer_cYes = "예. 이벤트에 참가하겠습니다."
	CalendarEventViewer_cNo = "아니오. 이벤트에 참가하지 않습니다."

	CalendarEventViewer_cResponseMessage =
	{
		"상태: 응답없음",
		"상태: 승인을 기다리는중",
		"상태: 승인됨 - 인증되었습니다.",
		"상태: 승인됨 - 가동합니다.",
		"상태: 승인됨 - 거부되었습니다.",
		"상태: Banned from event",
		"상태: 승인됨 - Maybe attending",
		"상태: 승인됨 - Pending approval",
	}

	CalendarEventEditorFrame_cTitle = "이벤트 추가/편집"
	CalendarEvent_cDone = "확인"
	CalendarEvent_cDelete = "삭제"

	CalendarEvent_cConfirmDeleteMsg = "\"%s\"을 삭제하시겠습니까?"

	-- Event names

	GroupCalendar_cGeneralEventGroup = "일반"
	GroupCalendar_cPersonalEventGroup = "Personal (not shared)"
	GroupCalendar_cRaidEventGroup = "Raids"
	GroupCalendar_cDungeonEventGroup = "던전"
	GroupCalendar_cBattlegroundEventGroup = "전장"

	GroupCalendar_cMeetingEventName = "만남"
	GroupCalendar_cBirthdayEventName = "생일"
	GroupCalendar_cRoleplayEventName = "Roleplaying"
	GroupCalendar_cHolidayEventName = "Holiday"
	GroupCalendar_cDentistEventName = "Dentist"
	GroupCalendar_cDoctorEventName = "Doctor"
	GroupCalendar_cVacationEventName = "Vacation"
	GroupCalendar_cOtherEventName = "Other"

	GroupCalendar_cAQREventName = "안퀴라즈 (폐허)"
	GroupCalendar_cAQTEventName = "안퀴라즈 (신전)"
	GroupCalendar_cBFDEventName = "검은 심연의 나락"
	GroupCalendar_cBRDEventName = "검은바위 나락"
	GroupCalendar_cUBRSEventName = "검은바위 첨탑 (상층)"
	GroupCalendar_cLBRSEventName = "검은바위 첨탑 (하층)"
	GroupCalendar_cBWLEventName = "검은날개 둥지"
	GroupCalendar_cDeadminesEventName = "죽음의 폐광"
	GroupCalendar_cDMEventName = "혈투의 전장"
	GroupCalendar_cGnomerEventName = "놈리건"
	GroupCalendar_cMaraEventName = "마라우돈"
	GroupCalendar_cMCEventName = "화산 심장부"
	GroupCalendar_cOnyxiaEventName = "오닉시아의 둥지"
	GroupCalendar_cRFCEventName = "성난불길 협곡"
	GroupCalendar_cRFDEventName = "가시덩굴 구릉"
	GroupCalendar_cRFKEventName = "가시덩굴 우리"
	GroupCalendar_cSMEventName = "붉은십자군 수도원"
	GroupCalendar_cScholoEventName = "스칼로맨스"
	GroupCalendar_cSFKEventName = "그림자송곳니 성채"
	GroupCalendar_cStockadesEventName = "스톰윈드 지하감옥"
	GroupCalendar_cStrathEventName = "스트라솔룸"
	GroupCalendar_cSTEventName = "아탈학카르 신전"
	GroupCalendar_cUldEventName = "울다만"
	GroupCalendar_cWCEventName = "통곡의 동굴"
	GroupCalendar_cZFEventName = "줄파락"
	GroupCalendar_cZGEventName = "줄구룹"
	GroupCalendar_cNaxxEventName = "낙스라마스"

	GroupCalendar_cMagistersEventName = "마법학자의 정원"
	GroupCalendar_cMagistersHEventName = "마법학자의 정원 (Heroic)"
	GroupCalendar_cSunwellEventName = "태양샘 고원"
	
	GroupCalendar_cPvPEventName = "General PvP"
	GroupCalendar_cABEventName = "아라시 분지"
	GroupCalendar_cAVEventName = "알터랙 계곡"
	GroupCalendar_cWSGEventName = "전쟁노래 협곡"

	-- WotLK dungeons

	GroupCalendar_cAhnkaletEventName = "Ahn'kahet: The Old Kingdom"
	GroupCalendar_cAzjolNerubEventName = "Azjol-Nerub"
	GroupCalendar_cCullingEventName = "CoT: The Culling of Stratholme"
	GroupCalendar_cDrakTharonEventName = "Drak'Tharon Keep"
	GroupCalendar_cGundrakEventName = "Gun'Drak"
	GroupCalendar_cTheNexusEventName = "The Nexus"
	GroupCalendar_cTheOculusEventName = "The Oculus"
	GroupCalendar_cHallsofLightningEventName = "Ulduar: Halls of Lightning"
	GroupCalendar_cHallsofStoneEventName = "Ulduar: Halls of Stone"
	GroupCalendar_cUtgardeEventName = "Utgarde Keep"
	GroupCalendar_cSUtgardePinnacleEventName = "Utgarde Pinnacle"
	GroupCalendar_cTheVioletHoldEventName = "Violet Hold"

	GroupCalendar_cAhnkaletHEventName = "Ahn'kahet: The Old Kingdom (Heroic)"
	GroupCalendar_cAzjolNerubHEventName = "Azjol-Nerub (Heroic)"
	GroupCalendar_cCullingHEventName = "CoT: The Culling of Stratholme (Heroic)"
	GroupCalendar_cDrakTharonHEventName = "Drak'Tharon Keep (Heroic)"
	GroupCalendar_cGundrakHEventName = "Gun'Drak (Heroic)"
	GroupCalendar_cTheNexusHEventName = "The Nexus (Heroic)"
	GroupCalendar_cTheOculusHEventName = "The Oculus (Heroic)"
	GroupCalendar_cHallsofLightningHEventName = "Ulduar: Halls of Lightning (Heroic)"
	GroupCalendar_cHallsofStoneHEventName = "Ulduar: Halls of Stone (Heroic)"
	GroupCalendar_cUtgardeHEventName = "Utgarde Keep (Heroic)"
	GroupCalendar_cUtgardePinnacleHEventName = "Utgarde Pinnacle (Heroic)"
	GroupCalendar_cTheVioletHoldHEventName = "Violet Hold (Heroic)"

	-- WotLK raids

	GroupCalendar_cNaxxHEventName = "Naxxramas (Heroic)"
	GroupCalendar_cEternityEventName = "The Eye of Eternity"
	GroupCalendar_cEternityHEventName = "The Eye of Eternity (Heroic)"
	GroupCalendar_cObsidianEventName = "The Obsidian Sanctum"
	GroupCalendar_cObsidianHEventName = "The Obsidian Sanctum (Heroic)"
	GroupCalendar_cArchavonEventName = "Vault of Archavon"
	GroupCalendar_cArchavonHEventName = "Vault of Archavon (Heroic)"
	GroupCalendar_cUlduarEventName = "Ulduar"
	GroupCalendar_cUlduarHEventName = "Ulduar (Heroic)"

	-- Resets
	
	GroupCalendar_cZGResetEventName = "Zul'Gurub Resets"
	GroupCalendar_cMCResetEventName = "Molten Core Resets"
	GroupCalendar_cOnyxiaResetEventName = "Onyxia Resets"
	GroupCalendar_cBWLResetEventName = "Blackwing Lair Resets"
	GroupCalendar_cAQRResetEventName = "Ahn'Qiraj Ruins Resets"
	GroupCalendar_cAQTResetEventName = "Ahn'Qiraj Temple Resets"
	GroupCalendar_cNaxxResetEventName = "Naxxramas Resets"

	GroupCalendar_cTransmuteCooldownEventName = "Transmute Available"
	GroupCalendar_cAlchemyResearchCooldownEventName = "Alchemy Research Available"
	GroupCalendar_cSaltShakerCooldownEventName = "Salt Shaker Available"
	GroupCalendar_cMoonclothCooldownEventName = "Mooncloth Available"
	GroupCalendar_cSnowmasterCooldownEventName = "SnowMaster 9000 Available"
	GroupCalendar_cBrilliantGlassCooldownEventName = "Brilliant Glass Available"
	GroupCalendar_cVoidShatterCooldownEventName = "Void Shatter Available"
	GroupCalendar_cVoidSphereCooldownEventName = "Void Sphere Available"
	GroupCalendar_cInscriptionCooldownEventName = "Inscription Research Available"
	GroupCalendar_cInscription2CooldownEventName = "Northrend Inscription Research Available"
	GroupCalendar_cTitansteelCooldownEventName = "Smelt Titansteel Available"

	GroupCalendar_cPersonalEventOwner = "Private"

	GroupCalendar_cRaidInfoMCName = GroupCalendar_cMCEventName
	GroupCalendar_cRaidInfoOnyxiaName = GroupCalendar_cOnyxiaEventName
	GroupCalendar_cRaidInfoZGName = GroupCalendar_cZGEventName
	GroupCalendar_cRaidInfoBWLName = GroupCalendar_cBWLEventName
	GroupCalendar_cRaidInfoAQRName = "안퀴라즈"
	GroupCalendar_cRaidInfoAQTName = GroupCalendar_cAQTEventName
	GroupCalendar_cRaidInfoNaxxName = GroupCalendar_cNaxxEventName
	
	-- Race names

	GroupCalendar_cDwarfRaceName = "드워프"
	GroupCalendar_cGnomeRaceName = "노움"
	GroupCalendar_cHumanRaceName = "인간"
	GroupCalendar_cNightElfRaceName = "나이트 엘프"
	GroupCalendar_cOrcRaceName = "오크"
	GroupCalendar_cTaurenRaceName = "타우렌"
	GroupCalendar_cTrollRaceName = "트롤"
	GroupCalendar_cUndeadRaceName = "언데드"
	GroupCalendar_cBloodElfRaceName = "블러드 엘프"
	GroupCalendar_cDraeneiRaceName = "드레나이"

	-- Class names

	GroupCalendar_cFemaleDruidClassName = "드루이드"
	GroupCalendar_cMaleDruidClassName = "드루이드"
	GroupCalendar_cFemaleHunterClassName = "사냥꾼"
	GroupCalendar_cMaleHunterClassName = "사냥꾼"
	GroupCalendar_cFemaleMageClassName = "마법사"
	GroupCalendar_cMaleMageClassName = "마법사"
	GroupCalendar_cFemalePaladinClassName = "성기사"
	GroupCalendar_cMalePaladinClassName = "성기사"
	GroupCalendar_cFemalePriestClassName = "사제"
	GroupCalendar_cMalePriestClassName = "사제"
	GroupCalendar_cFemaleRogueClassName = "도적"
	GroupCalendar_cMaleRogueClassName = "도적"
	GroupCalendar_cFemaleShamanClassName = "주술사"
	GroupCalendar_cMaleShamanClassName = "주술사"
	GroupCalendar_cFemaleWarlockClassName = "흑마법사"
	GroupCalendar_cMaleWarlockClassName = "흑마법사"
	GroupCalendar_cFemaleWarriorClassName = "전사"
	GroupCalendar_cMaleWarriorClassName = "전사"
	
	-- Plural forms of class names

	GroupCalendar_cDruidsClassName = "드루이드"
	GroupCalendar_cHuntersClassName = "사냥꾼"
	GroupCalendar_cMagesClassName = "마법사"
	GroupCalendar_cPaladinsClassName = "성기사"
	GroupCalendar_cPriestsClassName = "사제"
	GroupCalendar_cRoguesClassName = "도적"
	GroupCalendar_cShamansClassName = "주술사"
	GroupCalendar_cWarlocksClassName = "흑마법사"
	GroupCalendar_cWarriorsClassName = "전사"

	-- ClassColorNames are the indices for the RAID_CLASS_COLORS array found in FrameXML\Fonts.xml
	-- in the English version of WoW these are simply the class names in caps, I don't know if that's
	-- true of other languages so I'm putting them here in case they need to be localized

	GroupCalendar_cDruidClassColorName = "DRUID"
	GroupCalendar_cHunterClassColorName = "HUNTER"
	GroupCalendar_cMageClassColorName = "MAGE"
	GroupCalendar_cPaladinClassColorName = "PALADIN"
	GroupCalendar_cPriestClassColorName = "PRIEST"
	GroupCalendar_cRogueClassColorName = "ROGUE"
	GroupCalendar_cShamanClassColorName = "SHAMAN"
	GroupCalendar_cWarlockClassColorName = "WARLOCK"
	GroupCalendar_cWarriorClassColorName = "WARRIOR"

	-- Label forms of the class names for the attendance panel.  Usually just the plural
	-- form of the name followed by a colon

	GroupCalendar_cDruidsLabel = GroupCalendar_cDruidsClassName..":"
	GroupCalendar_cHuntersLabel = GroupCalendar_cHuntersClassName..":"
	GroupCalendar_cMagesLabel = GroupCalendar_cMagesClassName..":"
	GroupCalendar_cPaladinsLabel = GroupCalendar_cPaladinsClassName..":"
	GroupCalendar_cPriestsLabel = GroupCalendar_cPriestsClassName..":"
	GroupCalendar_cRoguesLabel = GroupCalendar_cRoguesClassName..":"
	GroupCalendar_cShamansLabel = GroupCalendar_cShamansClassName..":"
	GroupCalendar_cWarlocksLabel = GroupCalendar_cWarlocksClassName..":"
	GroupCalendar_cWarriorsLabel = GroupCalendar_cWarriorsClassName..":"

	GroupCalendar_cTimeLabel = "시간:"
	GroupCalendar_cDurationLabel = "소요시간:"
	GroupCalendar_cEventLabel = "이벤트:"
	GroupCalendar_cTitleLabel = "타이틀:"
	GroupCalendar_cLevelsLabel = "레벨:"
	GroupCalendar_cLevelRangeSeparator = "-"
	GroupCalendar_cDescriptionLabel = "설명"
	GroupCalendar_cCommentLabel = "남길말:"

	CalendarEditor_cNewEvent = "새로운 이벤트..."
	CalendarEditor_cEventsTitle = "이벤트"

	CalendarEvent_cNotAttending = "참석하지 않음"
	CalendarEvent_cConfirmed = "승인"
	CalendarEvent_cDeclined = "거부"
	CalendarEvent_cStandby = "대기자"
	CalendarEvent_cPending = "미결정"
	CalendarEvent_cUnknownStatus = "알수없는 %s"

	GroupCalendar_cChannelNameLabel = "채널이름:"
	GroupCalendar_cPasswordLabel = "비밀번호:"

	GroupCalendar_cSingleTimeDateFormat = "%s  %s"
	GroupCalendar_cTimeDateRangeFormat = "%s  %s 에서 %s"

	GroupCalendar_cPluralMinutesFormat = "%d 분"
	GroupCalendar_cSingularHourFormat = "%d 시간"
	GroupCalendar_cPluralHourFormat = "%d 시간"
	GroupCalendar_cSingularHourPluralMinutes = "%d 시간 %d 분"
	GroupCalendar_cPluralHourPluralMinutes = "%d 시간 %d 분"

	GroupCalendar_cLongDateFormat = "$year년 $month월 $day일"
	GroupCalendar_cLongDateFormatWithDayOfWeek = "$year년 $month월 $day일 $dow"

	GroupCalendar_cNotAttendingCategory = "참석하지 않음"
	GroupCalendar_cAttendingCategory = "참석"
	GroupCalendar_cPendingApprovalCategory = "참석 연기"

	GroupCalendar_cClassAttendanceNameFormat = "$name ($level $class)"
	GroupCalendar_cStatusAttendanceNameFormat = "$name ($status)"
	GroupCalendar_cRoleAttendanceNameFormat = "$name ($level $role)"

	GroupCalendar_cNumAttendeesFormat = "%d명 출석"

	BINDING_HEADER_GROUPCALENDAR_TITLE = "Group Calendar"
	BINDING_NAME_GROUPCALENDAR_TOGGLE = "GroupCalendar 열기/닫기"

	GroupCalendar_cTooltipScheduleItemFormat = "%s (%s)"

	GroupCalendar_cAvailableMinutesFormat = "%s in %d minutes"
	GroupCalendar_cStartsMinutesFormat = "%s starts in %d minutes"
	GroupCalendar_cStartingNowFormat = "%s is starting now"
	GroupCalendar_cAlreadyStartedFormat = "%s has already started"
	GroupCalendar_cHappyBirthdayFormat = "Happy birthday %s!"

	GroupCalendar_cTimeRemainingFormat = "(%d:%02d remaining)"

	GroupCalendar.cNetworkSyncComplete = "Network synchronization completed"

	GroupCalendar.cMinimapButtonHint = "Left-click to show Group Calendar."
	GroupCalendar.cMinimapButtonHint2 = "Right-click to show the WoW calendar."

	GroupCalendar.cDoubleOwnerError = "$SenderName is claiming to be the owner of the database for $DatabaseOwner, but your copy of Group Calendar thinks that you're the owner.  Use the command '/cal disown $DatabaseOwner' if you are not the owner of $DatabaseOwner's events."
	GroupCalendar.cDontHaveDatabaseError = "You don't have a database for %s"
	GroupCalendar.cDontOwnDatabaseError = "You don't own the database for %s"
	GroupCalendar.cDatabaseDisownedMessage = "Database for %s is no longer considered to be part of your account"

	GroupCalendar.cBlizzardOwner = "Blizzard"
	GroupCalendar.cAllDay = "All day"

	GroupCalendar.cName = "Name"
	GroupCalendar.cVersion = "Version"

	GroupCalendar.cResetVersions = "Reset"
	GroupCalendar.cResetVersionsDescription = "Clear this list so that only versions seen online after clicking this button will be displayed"

	GroupCalendar.cRSVPConfirmMessage =
	{
		Y = "$name is confirmed to attend $event on $date",
		S = "$name is on standby for $event on $date",
	}
end
