--[[ 	GupPet by Gup 	]]--

-- CONSTANT

-- SAVED VARS
GUPPET_CM_SAVEDDATA = { Mounts = {} , Companions = {} , PlayerInfo = {} } ;
GUPPET_CM_OPTIONS = { Filters = { pvp = true , AlreadyKnow = false , tcg = true , nlo = false , chi = false , col = false } } ;


-- // At Loading // --
function GupPet_CollectMe_OnLoad(self)

	self:RegisterEvent("VARIABLES_LOADED");
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("COMPANION_LEARNED");
	
	
end

-- // Event Handlers. // --
function GupPet_CollectMe_OnEvent(self, event) --self, event, ...

	if event == "PLAYER_ENTERING_WORLD" then
		self:UnregisterEvent("PLAYER_ENTERING_WORLD");
			 	
		GupPet_CollectMe_PlayerInfo();
		GupPet_CollectMe_UpdateData() ;
		GupPet_CollectMe_UpdatePlayerData();

		GupPet_CM_GT_Boot();
		
	elseif event == "VARIABLES_LOADED" then
			 
		if not GUPPET_CM_OPTIONS.Filters then GUPPET_CM_OPTIONS = { Filters = { pvp = true , AlreadyKnow = false , tcg = true , nlo = false , chi = false , col = false } } ; end
		if not GUPPET_CM_OPTIONS.GameTooltip then GUPPET_CM_OPTIONS.GameTooltip = { Show = true} ; end
		
		
	elseif event == "COMPANION_LEARNED" then

		GupPet_CollectMe_UpdatePlayerData();
		GupPet_CM_GT_CreateNameTable();
		
		if GUPPET_CN_INTERFACE_MAINFRAME.Init == 1 then 
			GupPet_CollectMe_Interface(); 
		end
		
	end
	
end


function GupPet_CollectMe_PlayerInfo()

	local AlreadyInserted = false ;
	local _, Class = UnitClass("player");
	local Name 	= UnitName("player") ;
	local Realm = GetRealmName() ;
	local Faction = UnitFactionGroup("player") ;
	
	-- First check if its not already inserted
	for i = 1 , #GUPPET_CM_SAVEDDATA.PlayerInfo do
		if GUPPET_CM_SAVEDDATA["PlayerInfo"][i]["Name"] == Name and GUPPET_CM_SAVEDDATA["PlayerInfo"][i]["Realm"] == Realm then
			AlreadyInserted = true ; 
		end
	end
	
	local FactionId = 0 ;
	local ClassId = 0 ;
	
	-- Insert it if its not in 
	if AlreadyInserted == false then
	
		if Faction == "Horde" then 
			FactionId = 2 ;
		else 
			FactionId = 1 ;
		end
			
		if 	   Class == "PALADIN" then 			ClassId = 1 ;
		elseif Class == "DEATHKNIGHT" then 		ClassId = 2 ;
		elseif Class == "WARLOCK" then 			ClassId = 3 ;
		elseif Class == "MAGE" then 			ClassId = 4 ;
		elseif Class == "WARRIOR" then 			ClassId = 5 ;
		elseif Class == "HUNTER" then 			ClassId = 6 ;
		elseif Class == "DRUID" then 			ClassId = 7 ;
		elseif Class == "SHAMAN" then 			ClassId = 8 ;
		elseif Class == "PRIEST" then 			ClassId = 9 ;
		else 									ClassId = 0 ;
		end
		
		table.insert( GUPPET_CM_SAVEDDATA["PlayerInfo"] , { Name = Name , Realm = Realm , Class = Class , ClassId = ClassId , Faction = Faction , FactionId = FactionId    } );
	end

end



function GupPet_CollectMe_GetPlayerInfo()
	local Name = UnitName("player") ;
	local Realm = GetRealmName() ;

	for i = 1 , #GUPPET_CM_SAVEDDATA.PlayerInfo do
		if GUPPET_CM_SAVEDDATA["PlayerInfo"][i]["Name"] == Name and GUPPET_CM_SAVEDDATA["PlayerInfo"][i]["Realm"] == Realm then
		
			return i , GUPPET_CM_SAVEDDATA["PlayerInfo"][i]["ClassId"] , GUPPET_CM_SAVEDDATA["PlayerInfo"][i]["FactionId"]
		end
	end
end

function GupPet_CollectMe_UpdateData()

	if #GUPPET_CM_SAVEDDATA.Mounts <= #GUPPET_CM_DATA.Mounts then
		for k,v in pairs(GUPPET_CM_DATA["Mounts"]) do
		
			if not GUPPET_CM_SAVEDDATA["Mounts"][k] then	
			
				GUPPET_CM_SAVEDDATA["Mounts"][k] = {} ;
 				
			end
		end
	end
		
	if #GUPPET_CM_SAVEDDATA.Companions <= #GUPPET_CM_DATA.Companions then
		for k,v in pairs(GUPPET_CM_DATA["Companions"]) do
		
			if not GUPPET_CM_SAVEDDATA["Companions"][k] then	
			
				GUPPET_CM_SAVEDDATA["Companions"][k] = {} ;

			end
		end
	end
end


function GupPet_CollectMe_UpdatePlayerData()

	local KnownMounts = {} ;
	local KnownCompanions = {} ;
	local PlayerId = GupPet_CollectMe_GetPlayerInfo() ;
	
	for i=1, GetNumCompanions("MOUNT") do
    	local creatureID, name, spellID, icon, active = GetCompanionInfo("MOUNT", i) ;
		KnownMounts[spellID] = true ;
    end
	
	for i=1, GetNumCompanions("CRITTER") do
    	local creatureID, name, spellID, icon, active = GetCompanionInfo("CRITTER", i) ;
		KnownCompanions[spellID] = true ;
    end
	
	for k,v in pairs(GUPPET_CM_SAVEDDATA["Mounts"]) do
  		if KnownMounts[k] then
 			GUPPET_CM_SAVEDDATA["Mounts"][k][PlayerId] = true ;
		end
	end
	
	for k,v in pairs(GUPPET_CM_SAVEDDATA["Companions"]) do
  		if KnownCompanions[k] then
 			GUPPET_CM_SAVEDDATA["Companions"][k][PlayerId] = true ;
		end
	end	

end


function GupPet_CollectMe_CreateExport( Type )

	local MyId , MyClassId , MyFactionId = GupPet_CollectMe_GetPlayerInfo();
	local returnExport = {} ;
	local nrOfCharData = #GUPPET_CM_SAVEDDATA.PlayerInfo ;
	
	for k,v in pairs(GUPPET_CM_SAVEDDATA[ Type ]) do
		
		-- k = ID
		if  GUPPET_CM_OPTIONS.ExportAllChars then
			
			for i = 1 , nrOfCharData do
			
				if v[i] then
				
					table.insert( returnExport , k ) ;
					break ;
				end
			end
		
		else
			if v[MyId] then
				table.insert( returnExport , k ) ;	
			end
		end
	end
		
	return returnExport ;
end


-- Type == Mounts / Companions
function GupPet_CollectMe_CreateCollectedData( Type )


	local CollectedData = { Known = 0 , Unknown = 0 }
	local MyId , MyClassId , MyFactionId = GupPet_CollectMe_GetPlayerInfo()
 
	for k,v in pairs(GUPPET_CM_SAVEDDATA[ Type ]) do
  		 
		 
		if GUPPET_CM_DATA[ Type ][k] then 
			-- Faction
			if GUPPET_CM_DATA[ Type ][k]["Faction"] == nil or GUPPET_CM_DATA[ Type ][k]["Faction"] == MyFactionId then
				-- Class
				if  GUPPET_CM_DATA[ Type ][k]["Class"] == nil or GUPPET_CM_DATA[ Type ][k]["Class"] == MyClassId  then
					
					-- Filters
					if 	(
						    ( GUPPET_CM_OPTIONS.Filters.pvp or not GUPPET_CM_DATA[ Type ][k]["pvp"] ) 
						and ( GUPPET_CM_OPTIONS.Filters.nlo or not GUPPET_CM_DATA[ Type ][k]["nlo"] ) 
						and ( GUPPET_CM_OPTIONS.Filters.chi or not GUPPET_CM_DATA[ Type ][k]["chi"] ) 
						and ( GUPPET_CM_OPTIONS.Filters.col or not GUPPET_CM_DATA[ Type ][k]["col"] ) 
						and ( GUPPET_CM_OPTIONS.Filters.tcg or not GUPPET_CM_DATA[ Type ][k]["tcg"] ) 
						and ( GUPPET_CM_OPTIONS.Filters.ignore or not GUPPET_CM_SAVEDDATA[ Type ][ k ]["Ignore_"..MyId] )
						)
						or v[MyId]
					then
						
						-- AlreadyKnow 
						if  ( GUPPET_CM_OPTIONS.Filters.AlreadyKnow or not v[MyId] ) then

							local color = {1,1,1} ;
						
							
							if GUPPET_CM_SAVEDDATA[ Type ][ k ]["Ignore_"..MyId] and v[MyId]  then
								color = {1,1,0.5} ;
							elseif v[MyId] then 
								color = {0.5,1,0.5} ;
							elseif GUPPET_CM_SAVEDDATA[ Type ][ k ]["Ignore_"..MyId] then
								color = {1,0,0} ;
							end
						
						
							local name, _, icon = GetSpellInfo(k); 
							table.insert( CollectedData , { Id = k , Name = name , Icon = icon , Color = color }     );
						end
						
								
						-- Counter
						if v[MyId] then
							CollectedData["Known"] = CollectedData["Known"] + 1 ;
						else
							CollectedData["Unknown"] = CollectedData["Unknown"] + 1 ;
						end
						
					end
				end
			end
		end
	end
 
 
	table.sort( CollectedData , GupPet_CollectMe_SortTableByName);
	
	return CollectedData ;
end





function GupPet_CollectMe_SortTableByName(a, b)
    return (a.Name < b.Name);
end




 