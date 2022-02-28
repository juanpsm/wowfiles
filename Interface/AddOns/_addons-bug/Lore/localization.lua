--[[

	File containing localized strings
	for English, German and French, defaults to English

]]

if ( GetLocale() == "deDE" ) then
	-- German localized variables (default)
	ALLIANCE_COMMON = "Gemeinsprache"
	ALLIANCE_DWARF = "Zwergisch"
	ALLIANCE_GNOM = "Gnomisch"
	ALLIANCE_ELF = "Darnassisch"
	ALLIANCE_DRAENEI = "Draeneiisch"
	HORDE_COMMON = "Orcisch"
	HORDE_TAURE = "Taurisch"
	HORDE_TROLL = "Trollisch"
	HORDE_FORSAKEN = "Gossensprache"
	HORDE_ELF = "Thalassisch"

elseif ( GetLocale() == "frFR" ) then
	-- French localized variables (default)
	ALLIANCE_COMMON = "Commun"
	ALLIANCE_DWARF = "Nain"
	ALLIANCE_GNOM = "Gnome"
	ALLIANCE_ELF = "Darnassien"
	ALLIANCE_DRAENEI = "Draenei"
	HORDE_COMMON = "Orc"
	HORDE_TAURE = "Taurahe"
	HORDE_TROLL = "Troll"
	HORDE_FORSAKEN = "Bas-parler"
	HORDE_ELF = "Thalassian"

else
	-- English localized variables (default)
	ALLIANCE_COMMON = "Common"
	ALLIANCE_DWARF = "Dwarvish"
	ALLIANCE_GNOM = "Gnomish"
	ALLIANCE_ELF = "Darnassian"
	ALLIANCE_DRAENEI = "Draenei"
	HORDE_COMMON = "Orcish"
	HORDE_TAURE = "Taurahe"
 HORDE_TROLL = "Troll"
 HORDE_FORSAKEN = "Gutterspeak"
	HORDE_ELF = "Thalassian"
end
