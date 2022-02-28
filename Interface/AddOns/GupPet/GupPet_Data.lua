--[[ 	GupPet by Gup 	]]--

-- typeMount --> 1 = 60%
			 --> 2 = 100%
			 --> 11 = 150% (fly)
			 --> 12 = 280% (fly) 
			 --> 13 = 310% (fly)
			 
			 --> 21 = 60% (Swimming) 
			 
			 -->  30 = Snowball needed
			 
			
GUPPET_CLASSDATA = { 	DRUID  = { Travel = 783 , SlowFly = 33943 , FastFly = 40120 , Aquatic = 1066 , Bear = 5487 , Cat = 768 } , 
						SHAMAN = { Ghost = 2645 , WaterWalking = 546 },
						HUNTER = { Pack = 13159 , Cheetah = 5118 , FeignDeath = 5384 }, 
						MAGE   = { SlowFall = 130,  Invisibility = 66},
						PRIEST = { SpiritOfRedemption = 20711},
						DEATHKNIGHT = { PathOfFrost = 3714} 
					}

GUPPET_ITEMDATA = { Food = 64355 ,
					Drink = 57073,
					
					Quest = { 
						[18597] = {}, -- Orcish Orphan Whistle
						[18598] = {}, -- Human Orphan Whistle
						[30803] = {"Hellfire"}, -- Felhound Whistle
						[31815] = {"Netherstorm"}, -- Zeppit's Crystal 						
						[31880] = {}, -- Blood Elf Orphan Whistle
						[31881] = {}, -- Draenei Orphan Whistle
						[34253] = {"Hellfire"}, -- Sizzling Ember		
						[34971] = {"BoreanTundra"}, -- Warsong Flare Gun 
						[36936] = {"GrizzlyHills"}, -- Golem Control Unit 	 
						[39319] = {"ZulDrak"}, -- Scepter of Domination 
						[46362] = {"UngoroCrater", "Tanaris", "Silithus"}, -- Venomhide Hatchling
						[46396] = {}, -- Wolvar Orphan Whistle
						[46397] = {} -- Oracle Orphan Whistle
						}
			 		}
 

GUPPET_DATA = {

	[30174] = {[1] = true},  -- Riding Turtle	<-- less then 60% ??
	
	---------------------------------------------------------------------------
	
	  [580] = {[1] = true},  -- Timber Wolf
	  [458] = {[1] = true},  -- Brown Horse
	  [470] = {[1] = true},  -- Black Stallion
	  [472] = {[1] = true},  -- Pinto
	 [6653] = {[1] = true},  -- Dire Wolf
	 [6654] = {[1] = true},  -- Brown Wolf
	 [8395] = {[1] = true},  -- Emerald Raptor
	 [6777] = {[1] = true},  -- Gray Ram	
	 [5784] = {[1] = true},  -- Felsteed
	 [6648] = {[1] = true},  -- Chestnut Mare
	 [6898] = {[1] = true},  -- White Ram
	 [6899] = {[1] = true},  -- Brown Ram
	 [8394] = {[1] = true},  -- Striped Frostsaber
	[10873] = {[1] = true},  -- Red Mechanostrider
	[10969] = {[1] = true},  -- Blue Mechanostrider
	[15780] = {[1] = true},  -- Green Mechanostrider
	[15781] = {[1] = true},  -- Steel Mechanostrider
	[17453] = {[1] = true},  -- Green Mechanostrider
	[17454] = {[1] = true},  -- Unpainted Mechanostrider
	[17455] = {[1] = true},  -- Purple Mechanostrider
	[17456] = {[1] = true},  -- Red and Blue Mechanostrider
	[17458] = {[1] = true},  -- Fluorescent Green Mechanostrider
	[10789] = {[1] = true},  -- Spotted Frostsaber
	[10793] = {[1] = true},  -- Striped Nightsaber
	[16058] = {[1] = true},  -- Primal Leopard
	[16059] = {[1] = true},  -- Tawny Sabercat
	[16060] = {[1] = true},  -- Golden Sabercat
	[10795] = {[1] = true},  -- Ivory Raptor
	[10796] = {[1] = true},  -- Turquoise Raptor
	[10799] = {[1] = true},  -- Violet Raptor
	[13819] = {[1] = true},  -- Warhorse
	[17462] = {[1] = true},  -- Red Skeletal Horse
	[17463] = {[1] = true},  -- Blue Skeletal Horse
	[17464] = {[1] = true},  -- Brown Skeletal Horse
	[18363] = {[1] = true},  -- Riding Kodo
	[18989] = {[1] = true},  -- Gray Kodo
	[18990] = {[1] = true},  -- Brown Kodo
	[34769] = {[1] = true},  -- Summon Warhorse
	[34406] = {[1] = true},  -- Brown Elekk	
	[35710] = {[1] = true},  -- Gray Elekk
	[35711] = {[1] = true},  -- Purple Elekk
	[34795] = {[1] = true},  -- Red Hawkstrider
	[35018] = {[1] = true},  -- Purple Hawkstrider
	[35020] = {[1] = true},  -- Blue Hawkstrider
	[35022] = {[1] = true},  -- Black Hawkstrider
	[33630] = {[1] = true},  -- Blue Mechanostrider
	[49378] = {[1] = true},  -- Brewfest Riding Kodo
	[43899] = {[1] = true},  -- Brewfest Ram
	[42776] = {[1] = true},  -- Spectral Tiger
	[50869] = {[1] = true},  -- Brewfest Kodo
	[64657] = {[1] = true},  -- White Kodo 
	[64658] = {[1] = true},  -- Horn of the Black Wolf
	[64977] = {[1] = true},  -- Black Skeletal Horse
	[66847] = {[1] = true},  -- Striped Dawnsaber

	---------------------------------------------------------------------------
	
	  [579] = {[2] = true}, -- Red Wolf
	[15779] = {[2] = true}, -- White Mechanostrider Mod B
	[16055] = {[2] = true}, -- Black Nightsaber
	[16056] = {[2] = true}, -- Ancient Frostsaber
	[16080] = {[2] = true}, -- Red Wolf
	[16081] = {[2] = true}, -- Winter Wolf
	[16082] = {[2] = true}, -- Palomino
	[16083] = {[2] = true}, -- White Stallion
	[16084] = {[2] = true}, -- Mottled Red Raptor
	[17229] = {[2] = true}, -- Winterspring Frostsaber
	[17450] = {[2] = true}, -- Ivory Raptor
	[17459] = {[2] = true}, -- Icy Blue Mechanostrider Mod A
	[17460] = {[2] = true}, -- Frost Ram
	[17461] = {[2] = true}, -- Black Ram
	[17465] = {[2] = true}, -- Green Skeletal Warhorse
	[17481] = {[2] = true}, -- Rivendare's Deathcharger
	[18991] = {[2] = true}, -- Green Kodo
	[18992] = {[2] = true}, -- Teal Kodo
	[22717] = {[2] = true}, -- Black War Steed
	[22722] = {[2] = true}, -- Red Skeletal Warhorse
	[23246] = {[2] = true}, -- Purple Skeletal Warhorse
	[22719] = {[2] = true}, -- Black Battlestrider
	[22720] = {[2] = true}, -- Black War Ram
	[22721] = {[2] = true}, -- Black War Raptor
	[22723] = {[2] = true}, -- Black War Tiger
	[23161] = {[2] = true}, -- Dreadsteed
	[23214] = {[2] = true}, -- Charger
	[23219] = {[2] = true}, -- Swift Mistsaber
	[23220] = {[2] = true}, -- Swift Dawnsaber
	[23221] = {[2] = true}, -- Swift Frostsaber
	[23222] = {[2] = true}, -- Swift Yellow Mechanostrider
	[23223] = {[2] = true}, -- Swift White Mechanostrider
	[23225] = {[2] = true}, -- Swift Green Mechanostrider	
	[23227] = {[2] = true}, -- Swift Palomino
	[23228] = {[2] = true}, -- Swift White Steed
	[23229] = {[2] = true}, -- Swift Brown Steed
	[23338] = {[2] = true}, -- Swift Stormsaber
	[23510] = {[2] = true}, -- Stormpike Battle Charger
	[24252] = {[2] = true}, -- Swift Zulian Tiger
	[22718] = {[2] = true}, -- Black War Kodo
	[23247] = {[2] = true}, -- Great White Kodo
	[23248] = {[2] = true}, -- Great Gray Kodo
	[23249] = {[2] = true}, -- Great Brown Kodo
	[23509] = {[2] = true}, -- Frostwolf Howler
	[22724] = {[2] = true}, -- Black War Wolf
	[23238] = {[2] = true}, -- Swift Brown Ram
	[23239] = {[2] = true}, -- Swift Gray Ram
	[23240] = {[2] = true}, -- Swift White Ram
	[23241] = {[2] = true}, -- Swift Blue Raptor
	[23242] = {[2] = true}, -- Swift Olive Raptor
	[23243] = {[2] = true}, -- Swift Orange Raptor
	[24242] = {[2] = true}, -- Swift Razzashi Raptor	
	[25953] = {[2] = true}, -- Blue Qiraji Battle Tank
	[26055] = {[2] = true}, -- Yellow Qiraji Battle Tank
	[26054] = {[2] = true}, -- Red Qiraji Battle Tank
	[26056] = {[2] = true}, -- Green Qiraji Battle Tank
	[26656] = {[2] = true}, -- Black Qiraji Battle Tank
	[23250] = {[2] = true}, -- Swift Brown Wolf
	[23251] = {[2] = true}, -- Swift Timber Wolf
	[23252] = {[2] = true}, -- Swift Gray Wolf	
	[34407] = {[2] = true}, -- Great Elite Elekk
	[34767] = {[2] = true}, -- Summon Charger		
	[35712] = {[2] = true}, -- Great Green Elekk
	[35713] = {[2] = true}, -- Great Blue Elekk
	[35714] = {[2] = true}, -- Great Purple Elekk
	[36702] = {[2] = true}, -- Fiery Warhorse
	[33660] = {[2] = true}, -- Swift Pink Hawkstrider
	[35025] = {[2] = true}, -- Swift Green Hawkstrider
	[35027] = {[2] = true}, -- Swift Purple Hawkstrider
	[35028] = {[2] = true}, -- Swift Warstrider
	[34790] = {[2] = true}, -- Dark War Talbuk
	[34896] = {[2] = true}, -- Cobalt War Talbuk
	[34897] = {[2] = true}, -- White War Talbuk
	[34898] = {[2] = true}, -- Silver War Talbuk
	[34899] = {[2] = true}, -- Tan War Talbuk
	[39315] = {[2] = true}, -- Cobalt Riding Talbuk
	[39316] = {[2] = true}, -- Dark Riding Talbuk
	[39317] = {[2] = true}, -- Silver Riding Talbuk
	[39318] = {[2] = true}, -- Tan Riding Talbuk
	[39319] = {[2] = true}, -- White Riding Talbuk
	[41252] = {[2] = true}, -- Raven Lord
	[43688] = {[2] = true}, -- Amani War Bear
	[42777] = {[2] = true}, -- Swift Spectral Tiger
	[47037] = {[2] = true}, -- Swift War Elekk
	[48027] = {[2] = true}, -- Black War Elekk
	[48778] = {[2] = true}, -- Acherus Deathcharger
	[48954] = {[2] = true}, -- Swift Zhevra
	[49322] = {[2] = true}, -- Swift Zhevra
	[46628] = {[2] = true}, -- Swift White Hawkstrider
	[49379] = {[2] = true}, -- Great Brewfest Kodo
	[43900] = {[2] = true}, -- Swift Brewfest Ram	
	[50281] = {[2] = true}, -- Black Warp Stalker
	[51412] = {[2] = true}, -- Big Battle Bear
	[54753] = {[2] = true}, -- White Polar Bear Mount
	[55531] = {[2] = true, [5] = true}, -- Mechano-hog
	[59785] = {[2] = true}, -- Black War Mammoth
	[59788] = {[2] = true}, -- Black War Mammoth
	[59791] = {[2] = true}, -- Wooly Mammoth
	[59793] = {[2] = true}, -- Wooly Mammoth
	[59797] = {[2] = true}, -- Ice Mammoth
	[59799] = {[2] = true}, -- Ice Mammoth
	[59802] = {[2] = true, [5] = true}, -- Grand Ice Mammoth
	[59804] = {[2] = true, [5] = true}, -- Grand Ice Mammoth
	[59810] = {[2] = true, [5] = true}, -- Grand Black War Mammoth
	[59811] = {[2] = true, [5] = true}, -- Grand Black War Mammoth
	[59572] = {[2] = true}, -- Black Polar Bear
	[59573] = {[2] = true}, -- Brown Polar Bear
	[60114] = {[2] = true}, -- Armored Brown Bear
	[60116] = {[2] = true}, -- Armored Brown Bear
	[60118] = {[2] = true}, -- Black War Bear
	[60119] = {[2] = true}, -- Black War Bear
	[60136] = {[2] = true, [5] = true}, -- Grand Caravan Mammoth
	[60140] = {[2] = true, [5] = true}, -- Grand Caravan Mammoth
	[60424] = {[2] = true, [5] = true}, -- Mekgineer's Chopper		
	[61425] = {[2] = true, [5] = true}, -- Traveler's Tundra Mammoth
	[61447] = {[2] = true, [5] = true}, -- Traveler's Tundra Mammoth
	[61465] = {[2] = true, [5] = true}, -- Grand Black War Mammoth
	[61466] = {[2] = true, [5] = true}, -- Grand Black War Mammoth
	[61467] = {[2] = true, [5] = true}, -- Grand Black War Mammoth
	[61469] = {[2] = true, [5] = true}, -- Grand Ice Mammoth
	[61470] = {[2] = true, [5] = true}, -- Grand Ice Mammoth
	[63232] = {[2] = true},	-- Swift Elwynn Steed
	[63234]	= {[2] = true}, -- Trusty Stormwind Charger
	[63635] = {[2] = true}, -- Swift Darkspear Raptor
	[63636] = {[2] = true}, -- Swift Ironforge Ram
	[63637] = {[2] = true}, -- Swift Darnassian Mistsaber
	[63638] = {[2] = true}, -- Turbostrider
	[63639] = {[2] = true}, -- Great Azuremyst Elekk
	[63640] = {[2] = true}, -- Swift Orgrimmar Wolf
	[63641] = {[2] = true}, -- Great Mulgore Kodo
	[63642] = {[2] = true}, -- Swift Silvermoon Hawkstrider
	[63643] = {[2] = true}, -- Swift Forsaken Warhorse
	[65637] = {[2] = true}, -- Great Azuremyst Elekk
	[65638] = {[2] = true}, -- Swift Moonsaber
	[65639] = {[2] = true},	-- Swift Red Hawkstrider
	[65640] = {[2] = true},	-- Swift Gray Steed
	[65641] = {[2] = true}, -- Great Golden Kodo
	[65642] = {[2] = true}, -- Turbostrider
	[65643] = {[2] = true}, -- Swift Violet Ram
	[65644] = {[2] = true}, -- Swift Purple Raptor
	[65645] = {[2] = true}, -- White Skeletal Warhorse
	[65646] = {[2] = true}, -- Swift Burgundy Wolf
	[65917] = {[2] = true}, -- Magic Rooster 
	[64659] = {[2] = true}, -- Venomhide Ravasaur
	[66090] = {[2] = true}, -- Quel'dorei Steed
	[66846] = {[2] = true}, -- Ochre Skeletal Warhorse
	[66906] = {[2] = true}, -- Argent Charger
	[66091] = {[2] = true}, -- Sunreaver Hawkstrider
	[67466] = {[2] = true}, -- Argent Warhorse
	[68056] = {[2] = true}, -- Swift Horde Wolf
	[68057] = {[2] = true}, -- Swift Alliance Steed
	
	[68187]	= {[2] = true},	-- Crusader's White Warhorse
	[68188]	= {[2] = true},	-- Crusader's Black Warhorse
	[73313]	= {[2] = true},	-- Crimson Deathcharger
	---------------------------------------------------------------------------
	
	[32235] = {[11] = true},  -- Golden Gryphon
	[32239] = {[11] = true},  -- Ebon Gryphon
	[32240] = {[11] = true},  -- Snowy Gryphon			
	[32243] = {[11] = true},  -- Tawny Wind Rider
	[32244] = {[11] = true},  -- Blue Wind Rider
	[32245] = {[11] = true},  -- Green Wind Rider	
	[44153] = {[11] = true},  -- Flying Machine
	[44221] = {[11] = true},  -- Loaned Gryphon Reins
	[46197] = {[11] = true},  -- X-51 Nether-Rocket
	[61451] = {[11] = true},  -- Flying Carpet

	---------------------------------------------------------------------------	
	
	 [3363] = {[12] = true},  -- Nether Drake
	[39798] = {[12] = true},  -- Green Riding Nether Ray
	[39800] = {[12] = true},  -- Red Riding Nether Ray
	[39801] = {[12] = true},  -- Purple Riding Nether Ray
	[39802] = {[12] = true},  -- Silver Riding Nether Ray
	[39803] = {[12] = true},  -- Blue Riding Nether Ray	
	[61442] = {[12] = true},  -- Swift Mooncloth Carpet
	[61444] = {[12] = true},  -- Swift Shadoweave Carpet
	[61446] = {[12] = true},  -- Swift Spellfire Carpet		
	[32246] = {[12] = true},  -- Swift Red Wind Rider
	[32295] = {[12] = true},  -- Swift Green Wind Rider
	[32296] = {[12] = true},  -- Swift Yellow Wind Rider
	[32297] = {[12] = true},  -- Swift Purple Wind Rider
	[44229] = {[12] = true},  -- Loaned Wind Rider Reins
	[61230] = {[12] = true},  -- Armored Blue Wind Rider
	[37015] = {[12] = true},  -- Swift Nether Drake
	[41513] = {[12] = true},  -- Onyx Netherwing Drake
	[41514] = {[12] = true},  -- Azure Netherwing Drake
	[41515] = {[12] = true},  -- Cobalt Netherwing Drake
	[41516] = {[12] = true},  -- Purple Netherwing Drake
	[41517] = {[12] = true},  -- Veridian Netherwing Drake
	[41518] = {[12] = true},  -- Violet Netherwing Drake
	[44317] = {[12] = true},  -- Merciless Nether Drake
	[44744] = {[12] = true},  -- Merciless Nether Drake
	[49193] = {[12] = true},  -- Vengeful Nether Drake
	[58615] = {[12] = true},  -- Brutal Nether Drake
	[43927] = {[12] = true},  -- Cenarion War Hippogryph
	[43810] = {[12] = true},  -- Frost Wyrm
	[51960] = {[12] = true},  -- Frostwyrm Mount
	[28828] = {[12] = true},  -- Nether Drake
	[59567] = {[12] = true},  -- Azure Drake
	[59568] = {[12] = true},  -- Blue Drake
	[59569] = {[12] = true},  -- Bronze Drake
	[59570] = {[12] = true},  -- Red Drake
	[59571] = {[12] = true},  -- Twilight Drake
	[59650] = {[12] = true},  -- Black Drake
	[60025] = {[12] = true},  -- Albino Drake
	[59961] = {[12] = true},  -- Red Proto-Drake
	[59976] = {[12] = true},  -- Black Proto-Drake
	[59996] = {[12] = true},  -- Blue Proto-Drake
	[60002] = {[12] = true},  -- Time-Lost Proto-Drake
	[60021] = {[12] = true},  -- Plagued Proto-Drake
	[60024] = {[12] = true},  -- Violet Proto-Drake
	[61294] = {[12] = true},  -- Green Proto-Drake
	[55164] = {[12] = true},  -- Swift Spectral Gryphon
	[61229] = {[12] = true},  -- Armored Snowy Gryphon
	[44151] = {[12] = true},  -- Turbo-Charged Flying Machine
	[61309] = {[12] = true},  -- Magnificent Flying Carpet
	[61997] = {[12] = true},  -- Red Dragonhawk
	[61996] = {[12] = true},  -- Blue Dragonhawk
	[62048] = {[12] = true},  -- Black Dragonhawk Mount
	[32242] = {[12] = true},  -- Swift Blue Gryphon
	[32289] = {[12] = true},  -- Swift Red Gryphon
	[32290] = {[12] = true},  -- Swift Green Gryphon
	[32292] = {[12] = true},  -- Swift Purple Gryphon
	[46199] = {[12] = true},  -- X-51 Nether-Rocket X-TREME
	[63844] = {[12] = true},  -- Argent Hippogryph
	[66087] = {[12] = true},  -- Silver Covenant Hippogryph
	[66088] = {[12] = true},  -- Sunreaver Dragonhawk
	
	[75596]  = {[12] = true},  -- Frosty Flying Carpet
	
	[32345] = {[12] = true, [13] = true}, -- Peep the Phoenix Mount
	[40192] = {[12] = true, [13] = true}, -- Ashes of Al'ar  
	[63963] = {[12] = true, [13] = true}, -- Rusted Proto-Drake
	[63956] = {[12] = true, [13] = true}, -- Ironbound Proto-Drake
	[72807] = {[12] = true, [13] = true}, -- Icebound Frostbrood Vanquisher
	[72808] = {[12] = true, [13] = true}, -- Bloodbathed Frostbrood Vanquisher
	[69395] = {[12] = true, [13] = true}, -- Onyxian Drake	
	[67336] = {[12] = true, [13] = true}, -- Relentless Gladiator's Frost Wyrm
	[65439] = {[12] = true, [13] = true}, -- Furious Gladiator's Frost Wyrm
	[75973] = {[12] = true, [13] = true, [5] = true}, -- X-53 Touring Rocket
	[63796] = {[12] = true, [13] = true},-- Mimiron's Head
	[74856] = {[12] = true, [13] = true},-- Blazing Hippogryph
	---------------------------------------------------------------------------	
	
	[64731] = {[21] = true},  -- Sea Turtle

	---------------------------------------------------------------------------	
	[72286] = {[1] = true, [2] = true, [11] = true, [12] = true, [13] = true},  -- Invincible
	[75614] = {[1] = true, [2] = true, [11] = true, [12] = true, [13] = true},  -- Celestial Steed
	[48025] = {[1] = true, [2] = true, [11] = true, [12] = true},  -- Headless Horseman's Mount	
	[71342] = {[1] = true, [2] = true, [11] = true, [12] = true},  -- Big Love Rocket
	[54729] = {[11] = true, [12] = true},  -- Winged Steed of the Ebon Blade
	 
	[58983] = {[1] = true, [2] = true},  -- Big Blizzard Bear	

	---------------------------------------------------------------------------
	[26533] = {[30] = true},		-- Father Winter's Helper
	[26529]	= {[30] = true},		-- Winter Reindeer
	[26541] = {[30] = true},		-- Winter's Little Helper
	[26045] = {[30] = true},		-- Tiny Snowman

----------------------------------------------------------------------------------------------------------------
--[[	Cataclysm		 																		]]--
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
--[[

------------
-- MOUNTS --
------------

[87090] = {[1] = true}, -- Goblin Trike 
[87091] = {[2] = true}, -- Goblin Turbo-Trike 

[88331] = {[12] = true}, -- Volcanic Stone Drake
[88335] = {[12] = true}, -- Drake of the East Wind

[75207] = {[22] = true}, -- Abyssal Manta
[39208] = {[1] = true}, -- Exarch's Elekk
[39209] = {[2] = true}, -- Great Exarch's Elekk
[69820] = {[1] = true}, -- Sunwalker Kodo
[69826] = {[2] = true}, -- Great Sunwalker Kodo

-- Horde Guild Mount - Thunder Lizzard
-- Alliance Guild Mount - Lion
-- Flying Guild Mount - Dark Phoenix

----------
-- PETS --
----------
 [Baby Dark Phoenix] 
 [Snail Pet]


]]	
	
	
}	;




