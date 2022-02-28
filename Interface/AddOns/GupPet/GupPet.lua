--[[ 	GupPet by Gup 	]]--

-- SAVED VARS
GUPPET_SAVEDDATA = { SlowGround = { Total=0  } , SlowFly = { Total=0} , FastGround = { Total=0} , FastFly = { Total=0}, Aquatic = { Total=0} , Unknown= { Total=0}, Companion = { Total=0}  } ;
GUPPET_SAVEDLOCATIONS = { [GUPPET_C["M_GLOBALWORLD"]] = 0 , [GUPPET_C["M_CITIES"]] = 10 , [GUPPET_C["M_INSTANCES"]] = 20 , [GUPPET_C["M_ARENAS"]] =30 , [GUPPET_C["M_BATTLEGROUNDS"]] = 40  };

GUPPET_OPTIONS = { Debug = false , Mode = "Expert_", NewVersion = 0 , PreviewFrameSpeed = 1, PreviewFrameStartPos = 0,
						AutoCompanion 	= { Enabled = false, Delay = 2, City = true , Arena = true , BattleGround = true , Outside = true , Party = true , Raid = true, DismissMounted = false }, 
						IngameButton 	= { RelativePoint = "CENTER" , xOffset = 0 , yOffset = 0, Scale = 1 , Show = true , Lock = false , MountButton = "Auto" , Alignment = "H" , CompanionButton = true, Icons = { Ground = "Interface\\Icons\\Ability_Mount_Mammoth_Black.blp" , Fly = "Interface\\Icons\\Ability_Mount_Drake_Bronze.blp" , Auto = "Interface\\Icons\\Ability_Mount_Drake_Azure.blp" , Companion = "Interface\\Icons\\INV_Box_PetCarrier_01.blp" }}, 
						Class 			= { FlyForm = true , AquaticForm = true  }  
					} ;

GUPPET_SAVEDZONEVARS = { CANFLYDALARAN = false , CANFLYCONTINENT = false , NEW_ZONE = "" , NEW_SUBZONE = "" , OLD_ZONE = "" , OLD_SUBZONE = "" } ;

-- TEMP VARS
GUPPET_AUTOCOMPANION = {} ;
GUPPET_TEMPCLASSDATA = { Type = ""} ; --  "MAGE", "WARRIOR", "HUNTER", "PALADIN", "DRUID", "SHAMAN", "DK", "PRIEST" 

-- ADD it to the frames so you can Escape it away ;)
tinsert(UIMenus, "GupPet_InterfaceOptionsFrame");
tinsert(UIMenus, "GupPet_IconPopupFrame");

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_SlashCommand			 																		]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_SlashCommand(msg)
	
	msg = string.lower( msg ) ;
		
	if msg == GUPPET_S["SLOWGROUNDMOUNT"][1] or msg == GUPPET_S["SLOWGROUNDMOUNT"][2] then		GupPet_PreMounten( "SlowGround" )
	elseif msg == GUPPET_S["FASTGROUNDMOUNT"][1] or msg == GUPPET_S["FASTGROUNDMOUNT"][2] then	GupPet_PreMounten( "FastGround" )
	elseif msg == GUPPET_S["MULTIGROUNDMOUNT"][1] or msg == GUPPET_S["MULTIGROUNDMOUNT"][2] then	GupPet_PreMounten( "MultiGround" )
	elseif msg == GUPPET_S["SLOWFLYMOUNT"][1] or msg == GUPPET_S["SLOWFLYMOUNT"][2] then		GupPet_PreMounten( "SlowFly" )
	elseif msg == GUPPET_S["FASTFLYMOUNT"][1] or msg == GUPPET_S["FASTFLYMOUNT"][2] then		GupPet_PreMounten( "FastFly" )
	elseif msg == GUPPET_S["AQUATICMOUNT"][1] or msg == GUPPET_S["AQUATICMOUNT"][2] then		GupPet_PreMounten( "Aquatic" )
	elseif msg == GUPPET_S["AUTOMOUNT"][1] or msg == GUPPET_S["AUTOMOUNT"][2] then				GupPet_AutoMounten()
	elseif msg == GUPPET_S["CALLCOMPANION"][1] or msg == GUPPET_S["CALLCOMPANION"][2] then		GupPet_PreCallCompanion()
	elseif msg == GUPPET_S["AUTOGROUNDMOUNT"][1] or msg == GUPPET_S["AUTOGROUNDMOUNT"][2] then	GupPet_AutoGround()
	elseif msg == GUPPET_S["AUTOFLYMOUNT"][1] or msg == GUPPET_S["AUTOFLYMOUNT"][2] then		GupPet_AutoFly()
	elseif msg == GUPPET_S["DEBUG"][1] or msg == GUPPET_S["DEBUG"][2] then
	
		if GUPPET_OPTIONS.Debug == false then
		
			GUPPET_OPTIONS.Debug = true ;
			GupPet_Text( GUPPET_T["DEBUGMODEON"] );
		else
			GUPPET_OPTIONS.Debug = false ;
			GupPet_Text( GUPPET_T["DEBUGMODEOFF"] );		
		end		
	
	elseif msg == GUPPET_S["OPTIONMENU"][1] or msg == GUPPET_S["OPTIONMENU"][2] then
	
		GupPet_InterfaceOptionsFrame:Show() ;

	elseif msg == GUPPET_S["TOGGLEINCONSIS"][1] or msg == GUPPET_S["TOGGLEINCONSIS"][2] then
	
		if GUPPET_OPTIONS.Class.Inconsistent then
			GUPPET_OPTIONS.Class.Inconsistent = false ;
		else
			GUPPET_OPTIONS.Class.Inconsistent = true ;
		end
	
 	else
		GupPet_Text( GUPPET_T["UNKNOWNSLASHCOMMAND"] );
	end
		
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_OnLoad				 																		]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_OnLoad(self)

	SLASH_GUPPET1 = "/GupPet" 
	
	if (GetLocale() ~= "esES") then
		SLASH_GUPPET2 = "/GP" ;
	end
	
 	SlashCmdList["GUPPET"] = GupPet_SlashCommand;
	
	self:RegisterEvent("VARIABLES_LOADED");
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("COMPANION_LEARNED");	
	self:RegisterEvent("COMPANION_UPDATE");
	self:RegisterEvent("UPDATE_BINDINGS");
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA"); 	-- For update fly
	self:RegisterEvent("LEARNED_SPELL_IN_TAB");  	-- For update fly

	self:RegisterEvent("CHAT_MSG_ADDON");			-- Listen for a Update spam message
	
	self:RegisterEvent("PLAYER_REGEN_DISABLED");
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_OnEvent				 																		]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_OnEvent(self, event) --self, event, ...

	if event == "PLAYER_ENTERING_WORLD" then
		self:UnregisterEvent("PLAYER_ENTERING_WORLD");
		
		if not GUPPET_OPTIONS.HideLoaded then
			GupPet_Text( GUPPET_T["LOADED"] );
		end
		
		if GUPPET_Z["SUPPORT"] == false then  GupPet_Text( GUPPET_T["NOTSUPPORTED"] ) ; end
				
		GupPet_UpdateDataList() ;
		GupPet_UpdateClassDataList() ; -- CLASS 
		
		GupPet_Interface_UpdateLocationFrame() ;
			
		GupPet_AutoCompanionBoot() ;
		
		GupPet_Interface_Option() ;
		GupPet_Interface_IngameButtons();
		GupPet_Interface_IngameButtons_UpdateIcons();
		
		GupPet_AutoDismount( GUPPET_OPTIONS["AutoDismount"] ) ;
		
		-- for buttons to the optionmenu
		GupPet_Interface_MakeButtons() ;
		GupPet_Interface_MinimapButton_Init() ;
		
		if IsInGuild() then
			GupPet_SendMyVersion( "GUILD" ) ;
		end
				
		
	elseif event == "VARIABLES_LOADED" then
	
		-- SET to Default from versions lower then 1.00 
		if GUPPET_OPTIONS.IngameButton == nil then
			GUPPET_OPTIONS = { Debug = false , Mode = "Expert_", 
								AutoCompanion 	= { Enabled = false, Delay = 2, City = true , Arena = true , BattleGround = true , Outside = true , Party = true , Raid = true  }, 
								IngameButton 	= { RelativePoint = "CENTER" , xOffset = 0 , yOffset = 0, Scale = 1 , Show = true , Lock = false , MountButton = "Auto" , CompanionButton = true}, 
								Class 			= { FlyForm = true , AquaticForm = true  }  
							} ;
		end
				
		if not GUPPET_OPTIONS.NewVersion then GUPPET_OPTIONS.NewVersion = 0 ; end
		if not GUPPET_OPTIONS.PreviewFrameSpeed then GUPPET_OPTIONS.PreviewFrameSpeed = 1; end
		if not GUPPET_OPTIONS.PreviewFrameStartPos then GUPPET_OPTIONS.PreviewFrameStartPos = 0; end
			
		if not GUPPET_OPTIONS.IngameButton.Icons then	
			GUPPET_OPTIONS.IngameButton.Icons = { 	Ground = "Interface\\Icons\\Ability_Mount_Mammoth_Black" , 
													Fly = "Interface\\Icons\\Ability_Mount_Drake_Bronze" , 
													Auto = "Interface\\Icons\\Ability_Mount_Drake_Azure" , 
													Companion = "Interface\\Icons\\INV_Box_PetCarrier_01" }
		end 
		
		if not GUPPET_OPTIONS.AutoCompanion.DismissMounted then GUPPET_OPTIONS.AutoCompanion.DismissMounted = false; end
		
		if not GUPPET_OPTIONS.IngameButton.Alignment then GUPPET_OPTIONS.IngameButton.Alignment = "H" ; end 
		
		if not ( GUPPET_OPTIONS.AutoCompanion.Party or GUPPET_OPTIONS.AutoCompanion.Raid ) and GUPPET_OPTIONS.AutoCompanion.Instance then 
			GUPPET_OPTIONS.AutoCompanion.Party = GUPPET_OPTIONS.AutoCompanion.Instance ;
			GUPPET_OPTIONS.AutoCompanion.Raid = GUPPET_OPTIONS.AutoCompanion.Instance ;
			GUPPET_OPTIONS.AutoCompanion.Instance = nil ;
		end
		
		if not GUPPET_OPTIONS.AutoCompanion.Resummon then GUPPET_OPTIONS.AutoCompanion.Resummon = 0 end
		
		if not GUPPET_OPTIONS.AutoCompanion.ResummonEveryWhere == nil then GUPPET_OPTIONS.AutoCompanion.ResummonEveryWhere = false; end 
		
		if not GUPPET_OPTIONS.MinimapButton then 
			GUPPET_OPTIONS.MinimapButton = { Show = false , Radius = 78 , Position = 355 , xOffset = 0 , yOffset = 0 , Lock = true , RelativePoint = ""  } ;
		end
	 
		if not GUPPET_SAVEDDATA.MultiGround then  GUPPET_SAVEDDATA.MultiGround = { Total=0} ; end
	 
		if not GUPPET_OPTIONS.AutoCompanion.PetOfTheDay then
			GUPPET_OPTIONS.AutoCompanion.PetOfTheDay = { Enabled = false , Month = 0 , Day = 0, Year = 0 , PetId = 0 } ;
		end
	 
		
	elseif event == "COMPANION_LEARNED" then

		GupPet_Debug( "New Pet/Mount" );
		GupPet_UpdateDataList() ;
		GupPet_Interface_UpdateLocationFrame() ;
	
	elseif event == "UI_ERROR_MESSAGE" then
	
		if UnitOnTaxi("player") then 
		elseif ( arg1 == ERR_NOT_WHILE_MOUNTED 
			or arg1 == SPELL_FAILED_NOT_MOUNTED 
			or arg1 == ERR_ATTACK_MOUNTED 
			or arg1 == ERR_TAXIPLAYERALREADYMOUNTED 
			or arg1 == SPELL_FAILED_NOT_ON_MOUNTED ) 
			and not IsFlying() then
			
			GupPet_Debug( "Dismount" ) ; 
			Dismount() ;
		end
		
		return ;

	elseif 	event == "UPDATE_BINDINGS" or event == "PLAYER_REGEN_ENABLED" then
		
		if InCombatLockdown() then
			self:RegisterEvent("PLAYER_REGEN_ENABLED") ;
		else
			self:UnregisterEvent("PLAYER_REGEN_ENABLED") ;
		
			GupPet_Interface_IngameButtons() ;
					
			GupPet_UpdateBindings( "GUPPET_AUTO" 			, GupPet_IngameFrameTemplateAuto );
			GupPet_UpdateBindings( "GUPPET_AUTOGROUND"		, GupPet_IngameFrameTemplateGround );
			GupPet_UpdateBindings( "GUPPET_AUTOFLY" 		, GupPet_IngameFrameTemplateFly );
			GupPet_UpdateBindings( "GUPPET_CALLCOMPANION" 	, GupPet_IngameFrameTemplateCompanion );
		end
		
	elseif event == "COMPANION_UPDATE" then	
		if arg1 == nil then 
		
			GupPet_UpdateDataList() ;
			GupPet_Interface_UpdateLocationFrame() ;
			self:UnregisterEvent("COMPANION_UPDATE");
		end
	
	elseif event == "LEARNED_SPELL_IN_TAB" then 
		
		GupPet_UpdateClassDataList() ;
	
	elseif event == "CHAT_MSG_ADDON" then
	
		if arg1 == "GupPetVersion" then -- Listen for new versions
	
			n_arg2 = tonumber( arg2 ) ;
			
			if n_arg2 > tonumber(GetAddOnMetadata("GupPet", "Version")) and n_arg2 > GUPPET_OPTIONS.NewVersion   then	 
				GupPet_Text( "|cffee4400".. GUPPET_T["NEWVERSIONFOUND"] .. arg2) ;
				GUPPET_OPTIONS.NewVersion = n_arg2 ;
			end
			
		elseif 	arg1 == "GupPet_GVer" then -- GupPet_GetVersion
			GupPet_SendMyVersion( "WHISPER" , arg4 ) ;
		elseif 	arg1 == "GupPet_RVer" then -- GupPet_ReturnVersion
			GupPet_Text( arg4 .. " uses ".. arg2);
		end
 
	end
	
	if event == "PLAYER_ENTERING_WORLD" or event == "ZONE_CHANGED_NEW_AREA" or event == "LEARNED_SPELL_IN_TAB" then
		
		GupPet_CanFlyContinent() ;	
	end
 
	if event == "PLAYER_REGEN_DISABLED" then
	 
		if GUPPET_TEMPCLASSDATA.Type == "DRUID" then
				
				local BuildMacro = "/use "

				if GUPPET_TEMPCLASSDATA["Aquatic"]["Usable"] then
					BuildMacro = BuildMacro .."[swimming,nomounted] "..GUPPET_TEMPCLASSDATA["Aquatic"]["Name"] ..";"
				end
				
				if GUPPET_TEMPCLASSDATA["Travel"]["Usable"] then
					BuildMacro = BuildMacro .."[outdoors,nomounted] "..GUPPET_TEMPCLASSDATA["Travel"]["Name"] ..";"
				end
				
				if GUPPET_TEMPCLASSDATA["Cat"]["Usable"] and GUPPET_OPTIONS["Class"]["CatOnIndoors"] then
					BuildMacro = BuildMacro .."[indoors,nomounted] "..GUPPET_TEMPCLASSDATA["Cat"]["Name"] ..";"
				end
				
				BuildMacro = BuildMacro .."\n/script GupPet_Exit()" ;
				
				_G["GupPet_IngameFrameTemplateAuto"]:SetAttribute("macrotext", BuildMacro );
				_G["GupPet_IngameFrameTemplateAuto"]:SetAttribute("shift-macrotext1", BuildMacro );
				_G["GupPet_IngameFrameTemplateGround"]:SetAttribute("macrotext", BuildMacro );
				_G["GupPet_IngameFrameTemplateGround"]:SetAttribute("shift-macrotext1", BuildMacro );

		elseif GUPPET_TEMPCLASSDATA.Type == "SHAMAN" then
		
			if GUPPET_TEMPCLASSDATA["Ghost"]["Usable"] then
				_G["GupPet_IngameFrameTemplateAuto"]:SetAttribute("macrotext", "/use [nomounted] "..GUPPET_TEMPCLASSDATA["Ghost"]["Name"] .."\n/script GupPet_Exit()")
				_G["GupPet_IngameFrameTemplateGround"]:SetAttribute("macrotext", "/use [nomounted] "..GUPPET_TEMPCLASSDATA["Ghost"]["Name"] .."\n/script GupPet_Exit()")
			end

		elseif GUPPET_TEMPCLASSDATA.Type == "MAGE" then
		
			if GUPPET_OPTIONS["Class"]["SlowFallOnFalling"] and GUPPET_TEMPCLASSDATA["SlowFall"]["Usable"] then
				_G["GupPet_IngameFrameTemplateAuto"]:SetAttribute("macrotext", "/use [nomounted] "..GUPPET_TEMPCLASSDATA["SlowFall"]["Name"] .."\n/script GupPet_Exit()")
				_G["GupPet_IngameFrameTemplateGround"]:SetAttribute("macrotext", "/use [nomounted] "..GUPPET_TEMPCLASSDATA["SlowFall"]["Name"] .."\n/script GupPet_Exit()")
			end
		end
	end
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_SendMyVersion				 																]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_SendMyVersion( To , Target )	--GUILD , WHISPER

	local MyVersion = tonumber( GetAddOnMetadata("GupPet", "Version")) ;
	
	if To == "GUILD" then --Send latest know version of the addon.
		if MyVersion < GUPPET_OPTIONS.NewVersion then
			SendAddonMessage("GupPetVersion", GUPPET_OPTIONS.NewVersion , To ) ;
		else
			SendAddonMessage("GupPetVersion", MyVersion , To ) ;
		end
	
	elseif To == "WHISPER" and Target then
		SendAddonMessage( "GupPet_RVer" , MyVersion , "WHISPER" , Target ) ;

	end
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_UpdateBindings				 																]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_UpdateBindings( binding , button )

	ClearOverrideBindings(button) ;
	local key1, key2 = GetBindingKey(binding) ;
	if key1 then
		SetOverrideBindingClick( button, true, key1, button:GetName() ) ;
	end 
	if key2 then
		SetOverrideBindingClick( button, true, key2, button:GetName() ) ;
	end 
end 

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_IsInBook				 																		]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_IsInBook( spell )
	
	local tempvar = { Usable = false }
	
	tempvar.Name = GetSpellInfo(spell) ;
	tempvar.Spell = spell ;
	local slot = 1 ;
	
	while GetSpellName(slot, "spell") do
		local name = GetSpellName(slot, "spell") ;
		if name == tempvar.Name then
			
			tempvar.Usable = true
			return tempvar
		end 
		slot = slot + 1 ;
	end 

	return tempvar
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_UpdateClassDataList				 															]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_UpdateClassDataList()

	_, GUPPET_TEMPCLASSDATA.Type = UnitClass("player") ;

	if GUPPET_TEMPCLASSDATA.Type == "HUNTER" then
		
		GUPPET_TEMPCLASSDATA["Pack"]  	= GupPet_IsInBook( GUPPET_CLASSDATA.HUNTER.Pack ) ;
		GUPPET_TEMPCLASSDATA["Cheetah"] = GupPet_IsInBook( GUPPET_CLASSDATA.HUNTER.Cheetah ) ;
	
	elseif GUPPET_TEMPCLASSDATA.Type == "DRUID" then
	
		GUPPET_TEMPCLASSDATA["Travel"]  = GupPet_IsInBook( GUPPET_CLASSDATA.DRUID.Travel ) ;
		GUPPET_TEMPCLASSDATA["SlowFly"] = GupPet_IsInBook( GUPPET_CLASSDATA.DRUID.SlowFly ) ;
		GUPPET_TEMPCLASSDATA["FastFly"] = GupPet_IsInBook( GUPPET_CLASSDATA.DRUID.FastFly ) ;
		GUPPET_TEMPCLASSDATA["Aquatic"] = GupPet_IsInBook( GUPPET_CLASSDATA.DRUID.Aquatic ) ;
		GUPPET_TEMPCLASSDATA["Cat"]  	= GupPet_IsInBook( GUPPET_CLASSDATA.DRUID.Cat ) ;
	
	elseif GUPPET_TEMPCLASSDATA.Type == "SHAMAN" then
		
		GUPPET_TEMPCLASSDATA["Ghost"] = GupPet_IsInBook( GUPPET_CLASSDATA.SHAMAN.Ghost ) ;
		GUPPET_TEMPCLASSDATA["WaterWalking"] = GupPet_IsInBook( GUPPET_CLASSDATA.SHAMAN.WaterWalking ) ;
		
	elseif GUPPET_TEMPCLASSDATA.Type == "MAGE" then
	
		GUPPET_TEMPCLASSDATA["SlowFall"]  = GupPet_IsInBook( GUPPET_CLASSDATA.MAGE.SlowFall ) ;
		
	elseif GUPPET_TEMPCLASSDATA.Type == "DEATHKNIGHT" then
	
		GUPPET_TEMPCLASSDATA["PathOfFrost"]  = GupPet_IsInBook( GUPPET_CLASSDATA.DEATHKNIGHT.PathOfFrost ) ;
	
	end
	
	------ 
	GUPPET_TEMPCLASSDATA["SpiritOfRedemption"] = {} ;
	GUPPET_TEMPCLASSDATA["FeignDeath"] = {} ;
	GUPPET_TEMPCLASSDATA["Invisibility"] = {} ;
	GUPPET_TEMPCLASSDATA["SpiritOfRedemption"]["Name"]  = GetSpellInfo( GUPPET_CLASSDATA.PRIEST.SpiritOfRedemption ) ;
	GUPPET_TEMPCLASSDATA["FeignDeath"]["Name"]  = GetSpellInfo( GUPPET_CLASSDATA.HUNTER.FeignDeath ) ;
	GUPPET_TEMPCLASSDATA["Invisibility"]["Name"]  = GetSpellInfo( GUPPET_CLASSDATA.MAGE.Invisibility ) ;
	------
	
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_AutoDismount						 															]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_AutoDismount( dismount ) 
	if dismount then
		GupPetFrame:RegisterEvent("UI_ERROR_MESSAGE");
		GUPPET_OPTIONS["AutoDismount"] = true ;
	else
		GupPetFrame:UnregisterEvent("UI_ERROR_MESSAGE")
		GUPPET_OPTIONS["AutoDismount"] = false ;
	end
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_CanFlyContinent					 															]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_CanFlyContinent()

	local zoneNames = { GetMapZones(4) } ;	-- Get all zones in northerend
	local zoneName = GetZoneText();			-- Get current zone
	local whereAmI = false ;				-- If false not in northerend 
				
	for i = 1 , 11 do
		if zoneName ==  zoneNames[i] then
		
			whereAmI = true ;
		end
	end

	if whereAmI == false then
	
		GupPet_Debug( "GupPet_CanFly Return I'm NOT Northrend " );
		GUPPET_SAVEDZONEVARS["CANFLYCONTINENT"] = true ;
		return ;
	end

	local spellname = GetSpellInfo( 54197 ) ;
	local usable  = IsUsableSpell(spellname);

	if usable then
		GupPet_Debug( "GupPet_CanFly Return SpellFound" );
		GUPPET_SAVEDZONEVARS["CANFLYCONTINENT"] = true ;
		return  ;
	end 

	GupPet_Debug( "GupPet_CanFly Return Spell NOT Found" );
	GUPPET_SAVEDZONEVARS["CANFLYCONTINENT"] = false;
	return ;
  
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_CanFly							 															]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_CanFly()


	if  not(IsFlyableArea()) or IsSwimming() or (GetZoneText() == GUPPET_Z["WINTERGRASP"] and GetWintergraspWaitTime() == nil )   then
		return false ;
 	elseif GUPPET_SAVEDZONEVARS["CANFLYCONTINENT"] == false  then
		return false ;
	else
		return true ;
	end
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_ExitVehicle						 															]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_ExitVehicle()
	if UnitInVehicle("player")  then
		VehicleExit() ;
	end
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_Exit								 															]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_Exit()

	if IsMounted() then
	
		Dismount() ;
		return true ;
	
	elseif UnitInVehicle("player")  then
	
		VehicleExit() ;
		return true ;
	else
		return false ;
	end
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_AutoMultiGround						 															]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_AutoMultiGround()
	
	if GupPet_PreMounten( "MultiGround" ) then return end -- If you can mount return

end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_AutoMounten						 															]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_AutoMounten()
	
	if GupPet_Exit() then return end	-- If you exit something return

	if GupPet_CanFly() then 	
		if GupPet_AutoFly() then return end -- If you can fly return
	end

	if GupPet_AutoGround() then return end -- If you can mount return

end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_AutoGround						 															]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_AutoGround()
	if GupPet_Exit() then return end ;	-- If you exit something return
	if IsSwimming() then  if GupPet_PreMounten( "Aquatic" ) then return end end -- If you can swim then swim ;p
	
	if GupPet_PreMounten( "FastGround" ) then	return true end ;
	if GupPet_PreMounten( "SlowGround" ) then	return true end ;
	
	return false;
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_AutoFly						 																]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_AutoFly()
	if GupPet_Exit() then return end ;	-- If you exit something return

	if GupPet_PreMounten( "FastFly" ) then	return true end ;
	if GupPet_PreMounten( "SlowFly" ) then	return true end ;

	return false;
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_PreCallCompanion				 																]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_PreCallCompanion()
	
	local Location = GetRealZoneText() ;

	-- First check if you got something enabled for this Location 
	if GUPPET_SAVEDLOCATIONS[ Location ] then
	
		if GUPPET_SAVEDDATA["Companion"]["TotalWeight"][ Location ] > 0 then	
			GupPet_CallCompanion( Location ) ; 
			return true ;
		end
	end
	
	_, instanceType = IsInInstance() ;
	
	if ( IsResting() ) then
		Location = GUPPET_C["M_CITIES"]
	elseif ( instanceType == "pvp" ) then
		Location = GUPPET_C["M_BATTLEGROUNDS"]
	elseif ( instanceType == "arena" ) then
		Location = GUPPET_C["M_ARENAS"] ;
	elseif ( instanceType == "party" or instanceType == "raid" ) then
		Location = GUPPET_C["M_INSTANCES"] ;
	else
		Location = GUPPET_C["M_GLOBALWORLD"] ;
	end
		
	if GUPPET_SAVEDDATA["Companion"]["TotalWeight"][ Location ] > 0 then	
		GupPet_CallCompanion( Location ) ; 
		return true ;
	end
	
	if GUPPET_SAVEDDATA["Companion"]["TotalWeight"][ GUPPET_C["M_GLOBALWORLD"] ] > 0 then	
		GupPet_CallCompanion( GUPPET_C["M_GLOBALWORLD"] ) ; 
		return true ;
	end
		
	return false;
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_CallCompanion				 																]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_CallCompanion( Location ) 

	GupPet_Debug( Location );

	local CompanionSlots = { Total=0} ;
	local NumSnowBals =  GetItemCount( 17202 ); -- Snowball -> Itemid 17202
	local IsSummoned = false ;

	for i = 1 , GUPPET_SAVEDDATA[ "Companion" ]["Total"] do 

		if GUPPET_SAVEDDATA[ "Companion" ][i]["Weight"][ Location ] > 0 and not( GUPPET_SAVEDDATA[ "Companion" ][i]["UseSnowball"] == 1 and NumSnowBals == 0 )  then

			_, _, _, _, IsSummoned = GetCompanionInfo("CRITTER", GUPPET_SAVEDDATA[ "Companion" ][i]["Slot"] );
			
			if not(IsSummoned) then
			
				for q = 1 , GUPPET_SAVEDDATA[ "Companion" ][i]["Weight"][ Location ] do
									
					CompanionSlots.Total = CompanionSlots.Total + 1;
					CompanionSlots[CompanionSlots.Total] = GUPPET_SAVEDDATA[ "Companion" ][i]["Slot"] ;
				end
			end
		end
	end

	if CompanionSlots.Total > 0 then
	
		local randomMount =  math.random( CompanionSlots.Total  ) ;
		
		CallCompanion("CRITTER", CompanionSlots[randomMount] ) ;
		
		-- Save the new pet ID 
		GUPPET_OPTIONS.AutoCompanion.PetOfTheDay.PetId = GetCompanionInfo("CRITTER", CompanionSlots[randomMount] ) ; 
	
	elseif IsSummoned then
	
		GupPet_Text( GUPPET_T["CANTCALLCOMPANIONONEINTHETABLE"] );	
	
	elseif GUPPET_SAVEDDATA[ "Companion" ]["TotalWeight"][ Location ] > 0 then
	
		GupPet_Text( GUPPET_T["CANTCALLCOMPANIONNOSNOWBALL"] );	
	else
		GupPet_Text( GUPPET_T["CANTCALLCOMPANION"] );	
	end
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_PreMounten					 																]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_PreMounten( MountType )
	
	local Location = GetRealZoneText() ;

	-- First check if you got something enabled for this Location 
	if GUPPET_SAVEDLOCATIONS[ Location ] then
	
		if GUPPET_SAVEDDATA[MountType]["TotalWeight"][ Location ] > 0 then	
			GupPet_Mounten( MountType , Location ) ; 
			return true ;
		end
	end
	
	_, instanceType = IsInInstance() ;
	
	if ( IsResting() ) then
		Location = GUPPET_C["M_CITIES"]
	elseif ( instanceType == "pvp" ) then
		Location = GUPPET_C["M_BATTLEGROUNDS"]
	elseif ( instanceType == "arena" ) then
		Location = GUPPET_C["M_ARENAS"] ;
	elseif ( instanceType == "party" or instanceType == "raid" ) then
		Location = GUPPET_C["M_INSTANCES"] ;
	else
		Location = GUPPET_C["M_GLOBALWORLD"] ;
	end
		
	if GUPPET_SAVEDDATA[MountType]["TotalWeight"][ Location ] > 0 then	
		GupPet_Mounten( MountType , Location ) ; 
		return true ;
	end
	
	if GUPPET_SAVEDDATA[MountType]["TotalWeight"][ GUPPET_C["M_GLOBALWORLD"] ] > 0 then	
		GupPet_Mounten( MountType , GUPPET_C["M_GLOBALWORLD"] ) ; 
		return true ;
	end
	
	return false;
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_Mounten						 																]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_Mounten( MountType , Location   ) 

	local MountSlots = { Total=0} ;

	for i = 1 , GUPPET_SAVEDDATA[ MountType ]["Total"] do 

		if GUPPET_SAVEDDATA[ MountType ][i]["Weight"][ Location ] > 0 then
		
			for q = 1 , GUPPET_SAVEDDATA[ MountType ][i]["Weight"][ Location ] do
		
				MountSlots.Total = MountSlots.Total + 1;
				MountSlots[MountSlots.Total] = GUPPET_SAVEDDATA[ MountType ][i]["Slot"] ;
			end
		end
	end

	if MountSlots.Total > 0 then
	
		local randomMount =  math.random( MountSlots.Total  ) ;
		
		CallCompanion("MOUNT", MountSlots[randomMount] ) ;
	end
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_Location						 																]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_Location( Option , location , Type )
-- Option  = Add , Remove

	if Option == "Add" then
	
	-- First check if it is not already there ;) 
		for SavedLocation in pairs(GUPPET_SAVEDLOCATIONS) do
	
			if location == SavedLocation then
				return -1 ; -- Error .. Location Already here 
			end
		end
		
		GUPPET_SAVEDLOCATIONS[ location ] = Type ;
		
		GupPet_UpdateDataList() 
		return 1 ; -- OK .. Location Added
		
	elseif Option == "Remove" then
	
		Type = GUPPET_SAVEDLOCATIONS[location] ;
	
		if Type == 0 or  Type == 10 or  Type == 20 or  Type == 30 or  Type == 40 then
			return -2 ; -- Location is protected 
		end
		
		local GUPPET_SAVEDLOCATIONS_TEMP = {} ;
		
		for SavedLocation , Type in pairs(GUPPET_SAVEDLOCATIONS) do
			
			if SavedLocation == location then
			else
				GUPPET_SAVEDLOCATIONS_TEMP[SavedLocation] = Type ;
			end
		
		end
		
		GUPPET_SAVEDLOCATIONS = GUPPET_SAVEDLOCATIONS_TEMP ;
		return 2 ; -- OK .. Location Deleted
	end
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_UpdateDataList				 																]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_UpdateDataList()

	GupPet_Debug( "GupPet_UpdateDataList Start" );	

	local	GUPPET_SAVEDDATA_TEMP = { SlowGround = { Total=0  } , SlowFly = { Total=0} , FastGround = { Total=0} , MultiGround = { Total=0}, FastFly = { Total=0}, Aquatic = { Total=0} , Unknown= { Total=0} , Companion = { Total=0}  } ;
		
	for slot = 1, GetNumCompanions("MOUNT") do
		local creatureID, creatureName, creatureSpellID , creatureIcon = GetCompanionInfo("MOUNT", slot) ;
		local detected = false ;
	
		for DBMountID, DBMountData in pairs(GUPPET_DATA) do
		
			if DBMountID == creatureSpellID then
			
				if DBMountData[1] then
					detected = true ;
					GUPPET_SAVEDDATA_TEMP["SlowGround"]["Total"] = GUPPET_SAVEDDATA_TEMP["SlowGround"]["Total"] + 1 ;
					GUPPET_SAVEDDATA_TEMP["SlowGround"][ GUPPET_SAVEDDATA_TEMP["SlowGround"]["Total"] ] =  { Name = creatureName , Id = creatureSpellID, CreatureID = creatureID ,Slot = slot , Weight = GupPet_CheckWeightData( "SlowGround" , creatureSpellID )  }
				end
				
				if DBMountData[2] then
					detected = true ;
					GUPPET_SAVEDDATA_TEMP["FastGround"]["Total"] = GUPPET_SAVEDDATA_TEMP["FastGround"]["Total"] + 1 ;
					GUPPET_SAVEDDATA_TEMP["FastGround"][ GUPPET_SAVEDDATA_TEMP["FastGround"]["Total"] ] =  { Name = creatureName , Id = creatureSpellID, CreatureID = creatureID ,Slot = slot , Weight = GupPet_CheckWeightData( "FastGround" , creatureSpellID )  }
				end
				
				if DBMountData[5] then
					detected = true ;
					GUPPET_SAVEDDATA_TEMP["MultiGround"]["Total"] = GUPPET_SAVEDDATA_TEMP["MultiGround"]["Total"] + 1 ;
					GUPPET_SAVEDDATA_TEMP["MultiGround"][ GUPPET_SAVEDDATA_TEMP["MultiGround"]["Total"] ] =  { Name = creatureName , Id = creatureSpellID, CreatureID = creatureID ,Slot = slot , Weight = GupPet_CheckWeightData( "MultiGround" , creatureSpellID )  }
				end
			
				if DBMountData[11] then
					detected = true ;
					GUPPET_SAVEDDATA_TEMP["SlowFly"]["Total"] = GUPPET_SAVEDDATA_TEMP["SlowFly"]["Total"] + 1 ;
					GUPPET_SAVEDDATA_TEMP["SlowFly"][ GUPPET_SAVEDDATA_TEMP["SlowFly"]["Total"] ] =  { Name = creatureName , Id = creatureSpellID, CreatureID = creatureID ,Slot = slot , Weight = GupPet_CheckWeightData( "SlowFly" , creatureSpellID )  }
				end
			
				if DBMountData[12] then
					detected = true ;
					GUPPET_SAVEDDATA_TEMP["FastFly"]["Total"] = GUPPET_SAVEDDATA_TEMP["FastFly"]["Total"] + 1 ;
					GUPPET_SAVEDDATA_TEMP["FastFly"][ GUPPET_SAVEDDATA_TEMP["FastFly"]["Total"] ] =  { Name = creatureName , Id = creatureSpellID, CreatureID = creatureID ,Slot = slot , Weight = GupPet_CheckWeightData( "FastFly" , creatureSpellID )  }
				end
			
				if DBMountData[21] then
					detected = true ;
					GUPPET_SAVEDDATA_TEMP["Aquatic"]["Total"] = GUPPET_SAVEDDATA_TEMP["Aquatic"]["Total"] + 1 ;
					GUPPET_SAVEDDATA_TEMP["Aquatic"][ GUPPET_SAVEDDATA_TEMP["Aquatic"]["Total"] ] =  { Name = creatureName , Id = creatureSpellID, CreatureID = creatureID ,Slot = slot , Weight = GupPet_CheckWeightData( "Aquatic" , creatureSpellID )  }
				end
				
				break; -- SpeedUp
				
			end
		end
		
		if detected == false then
			GUPPET_SAVEDDATA_TEMP["Unknown"]["Total"] = GUPPET_SAVEDDATA_TEMP["Unknown"]["Total"] + 1 ;
			GUPPET_SAVEDDATA_TEMP["Unknown"][ GUPPET_SAVEDDATA_TEMP["Unknown"]["Total"] ] =  { Name = creatureName , Id = creatureSpellID, CreatureID = creatureID ,Slot = slot , Weight = {}  }
		end
		
	end
	
	--Companions
	for slot = 1, GetNumCompanions("CRITTER") do
		local creatureID, creatureName, creatureSpellID = GetCompanionInfo("CRITTER", slot) ;
		
		useSnowball = 0 ;
		
		for DBID, DBMountData in pairs(GUPPET_DATA) do
			
			if ((DBID == creatureSpellID) and DBMountData[30]) then
		
				useSnowball = 1 ;
			
			end
		end
		
						
		GUPPET_SAVEDDATA_TEMP["Companion"]["Total"] = GUPPET_SAVEDDATA_TEMP["Companion"]["Total"] + 1 ;
		GUPPET_SAVEDDATA_TEMP["Companion"][ GUPPET_SAVEDDATA_TEMP["Companion"]["Total"] ] = { Name = creatureName , Id = creatureSpellID, CreatureID = creatureID, Slot = slot , UseSnowball = useSnowball  , Weight = GupPet_CheckWeightData( "Companion" , creatureSpellID ) } ;
	end 
	 
	GUPPET_SAVEDDATA = GUPPET_SAVEDDATA_TEMP ;
	
	GUPPET_SAVEDDATA["SlowGround"]["TotalWeight"] = GupPet_CheckWeightDataTotal( "SlowGround" ) ;
	GUPPET_SAVEDDATA["FastGround"]["TotalWeight"] = GupPet_CheckWeightDataTotal( "FastGround" ) ;
	GUPPET_SAVEDDATA["MultiGround"]["TotalWeight"] = GupPet_CheckWeightDataTotal( "MultiGround" ) ;
	GUPPET_SAVEDDATA["SlowFly"]["TotalWeight"] = GupPet_CheckWeightDataTotal( "SlowFly" ) ;
	GUPPET_SAVEDDATA["FastFly"]["TotalWeight"] = GupPet_CheckWeightDataTotal( "FastFly" ) ;
	GUPPET_SAVEDDATA["Aquatic"]["TotalWeight"] = GupPet_CheckWeightDataTotal( "Aquatic" ) ;
	GUPPET_SAVEDDATA["Companion"]["TotalWeight"] = GupPet_CheckWeightDataTotal( "Companion" ) ;
	
	GupPet_Debug( "GupPet_UpdateDataList End" );

	if GUPPET_SAVEDDATA["Unknown"]["Total"]> 0 then
		GupPet_Text( "|cffee4400".. GUPPET_T["UNKNOWNMOUNTFOUND"]   ) ;
	
		for nr = 1 , GUPPET_SAVEDDATA["Unknown"]["Total"] do
				GupPet_Text( "|cffee4400 "..  GUPPET_SAVEDDATA["Unknown"][nr]["Name"] .. " , "..  GUPPET_SAVEDDATA["Unknown"][nr]["Id"] ) ;
		end
	end
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_SetWeight					 																]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_SetWeight( Type , Id , Weight , Location )

	if Weight == nil or Weight == false then
		Weight = 0 ;
	elseif Weight == 1000 then
		
		for i=1 , GUPPET_SAVEDDATA[ Type ]["Total"] do
			GupPet_SetWeight( Type , i , 0 , Location )
		end
		return ;
		
	elseif Weight == 1001 then
		
		for i=1 , GUPPET_SAVEDDATA[ Type ]["Total"] do
			if GUPPET_SAVEDDATA[ Type ][ i ]["Weight"][ Location ] == 0 then
				GupPet_SetWeight( Type , i , 1 , Location )
			end
		end		
		return ;
	end
	
	local deltaWeight =	Weight - GUPPET_SAVEDDATA[ Type ][ Id ]["Weight"][ Location ] ;

	GUPPET_SAVEDDATA[ Type ][ Id ]["Weight"][ Location ] = Weight ;
	
	GUPPET_SAVEDDATA[ Type ]["TotalWeight"][ Location ] = GUPPET_SAVEDDATA[ Type ]["TotalWeight"][ Location ] + deltaWeight ;
	
	GupPet_Debug( "deltaWeight: "..deltaWeight .."   Weight: ".. Weight ) ;

end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_CheckWeightDataTotal			 																]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_CheckWeightDataTotal( MountType )

	local GUPPET_SAVEDLOCATIONS_TEMP = {} ;

	for Location in pairs(GUPPET_SAVEDLOCATIONS) do

		GUPPET_SAVEDLOCATIONS_TEMP[Location] = 0 ;
		
		for i = 1 , GUPPET_SAVEDDATA[ MountType ]["Total"] do
	
			GUPPET_SAVEDLOCATIONS_TEMP[Location] = GUPPET_SAVEDLOCATIONS_TEMP[Location] + GUPPET_SAVEDDATA[ MountType ][i]["Weight"][Location] ;
	
		end
	end
	
	return GUPPET_SAVEDLOCATIONS_TEMP ;
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_CheckWeightData				 																]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_CheckWeightData( MountType , MountSpellID )

	local GUPPET_SAVEDLOCATIONS_TEMP = {} ;
	local NewMount = true ;
	
	for i = 1 , GUPPET_SAVEDDATA[ MountType ]["Total"] do
		if GUPPET_SAVEDDATA[ MountType ][i]["Id"] == MountSpellID then
			NewMount = false ;
			
			for Location in pairs(GUPPET_SAVEDLOCATIONS) do
			
				if GUPPET_SAVEDDATA[ MountType ][i]["Weight"][ Location ] then
					
					GUPPET_SAVEDLOCATIONS_TEMP[Location] = GUPPET_SAVEDDATA[ MountType ][i]["Weight"][ Location ] ;
				else
					GUPPET_SAVEDLOCATIONS_TEMP[Location] = 0 ;
				end
			end
		end
	end

	if NewMount == true then
	
		for  Location in pairs(GUPPET_SAVEDLOCATIONS) do
			
			if Location == GUPPET_C["M_GLOBALWORLD"] then
				GUPPET_SAVEDLOCATIONS_TEMP[Location] = 1 ;				
			else
				GUPPET_SAVEDLOCATIONS_TEMP[Location] = 0 ;				
			end
		end
	end
		
	return GUPPET_SAVEDLOCATIONS_TEMP ;
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_Debug						 																]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_Debug( text )

	if GUPPET_OPTIONS.Debug then
		DEFAULT_CHAT_FRAME:AddMessage( text );
	end
end

----------------------------------------------------------------------------------------------------------------
--[[	GupPet_Text						 																	]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function GupPet_Text( text )
	
	DEFAULT_CHAT_FRAME:AddMessage( "GupPet: ".. text ) ;
end
	