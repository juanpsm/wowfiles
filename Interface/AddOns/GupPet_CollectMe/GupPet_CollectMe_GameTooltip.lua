GUPPET_CM_GT_DATA = {} ;


function GupPet_CM_GT_Boot()

	GupPet_CM_GT_CreateNameTable() ;
	GameTooltip:HookScript("OnTooltipSetUnit", GupPet_CM_GT_OnTooltipSetUnit) ;

end

function GupPet_CM_GT_OnTooltipSetUnit(tooltip)

	if GUPPET_CM_OPTIONS.GameTooltip.Show then
		local name, unit = tooltip:GetUnit() ;
		
		if (not unit) then  
			return;  
		end
		
		if not(UnitPlayerControlled(unit)) then
			GupPet_CM_GT_FindName( name ) ;
		end

	end
end


function GupPet_CM_GT_FindName( name )
 
	local SpellName = "";
	local icon = "";
	local From = "";
  
	if not GUPPET_CM_GT_DATA[name] then
		return ;
	end
 		GameTooltip:AddLine( "--", 0, 0, 0 , 1   ) ;
		
		for i = 1 , #GUPPET_CM_GT_DATA[name] do
						
			if i > 4 then
				GameTooltip:AddLine( "..........", 1, 1, 1    ) ;
				return;
			else
				SpellName, _, icon = GetSpellInfo( GUPPET_CM_GT_DATA[name][i]  ) ;
		 
			
				GameTooltip:AddLine( SpellName, 1, 1, 1    ) ;
				GameTooltip:AddTexture(icon);
			end
		end
end
 


function GupPet_CM_GT_CreateNameTable()

	local GUPPET_CM_GT_TEMPDATA = {}
	
	local MyId , MyClassId , MyFactionId = GupPet_CollectMe_GetPlayerInfo()
	local Type = {"Mounts", "Companions"} ;
	
	for o = 1 , #Type do 
		for k,v in pairs(GUPPET_CM_SAVEDDATA[ Type[o] ]) do
			 
			if GUPPET_CM_DATA[ Type[o] ][k] then 
				-- Faction
				if ( GUPPET_CM_DATA[ Type[o] ][k]["Faction"] == nil or GUPPET_CM_DATA[ Type[o] ][k]["Faction"] == MyFactionId ) 
					and ( GUPPET_CM_DATA[ Type[o] ][k]["Class"] == nil or GUPPET_CM_DATA[ Type[o] ][k]["Class"] == MyClassId ) 
					and not GUPPET_CM_SAVEDDATA[ Type[o] ][ k ]["Ignore_"..MyId] 
					and not v[MyId] 
				then
						
							if GUPPET_CM_DATA[ Type[o] ][k]["get"] then
								for z = 1 , #GUPPET_CM_DATA[ Type[o] ][k]["get"] do
								
									if not GUPPET_CM_GT_TEMPDATA[  GUPPET_CM_DATA[ Type[o] ][k]["get"][z]   ] then
										GUPPET_CM_GT_TEMPDATA[  GUPPET_CM_DATA[ Type[o] ][k]["get"][z]   ] = {} ;
									end
									
									table.insert( GUPPET_CM_GT_TEMPDATA[  GUPPET_CM_DATA[ Type[o] ][k]["get"][z]  ] ,    k   )
								
								end						
							end
						
					
				end
			end
		end
	end
	
	GUPPET_CM_GT_DATA = GUPPET_CM_GT_TEMPDATA ;
end 
 
  