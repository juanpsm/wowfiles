GUPPET_CM_DATA = {} ;

--[[

	Mo --> id for preview screen
	lb --> Learned by item
	pvp --> Collected by pvp things
	nlo --> Not longer obtainable 
	tcg --> Trade Card Game
	Faction --> 1 for Allience , 2 for Horde
	Class --> 1 for PALADIN , 2 for DEATHKNIGHT , 3 for WARLOCK 
	chi --> promotional pets
	col --> Collectors 
]] 

GUPPET_CM_DATA["Mounts"] = {
  [60025]={ Mo =32158 ,lb =44178 },  -- Albino Drake			 
  [40192]={ Mo =24674 ,lb =32458 , get = {"Kael'thas Sunstrider"} },  -- Ashes of Al'ar
  [41514]={ Mo =23456 ,lb =32858 , get = {"Drake Dealer Hurlunk"} },  -- Azure Netherwing Drake
  [59567]={ Mo =31694 ,lb =43952 },  -- Azure Drake 
  [59650]={ Mo =31778 ,lb =43986 , get = {"Sartharion"} },  -- Black Drake
  [59996]={ Mo =32151 ,lb =44151 , get = {"Skadi the Ruthless"} },  -- Blue Proto-Drake
  [25953]={ Mo =15666 ,lb =21218 , get = {"Anubisath Sentinel","Obsidian Eradicator","Qiraji Brainwasher","Qiraji Lasher","Anubisath Defender","Obsidian Nullifier","Qiraji Slayer","Qiraji Mindslayer","Anubisath Warder","Qiraji Champion"} },  -- Blue Qiraji Battle Tank
  [39803]={ Mo =22978 ,lb =32319 , get = {"Grella"} },  -- Blue Riding Nether Ray
  [59569]={ Mo =31717 ,lb =43951 , get = {"Infinite Corruptor"} },  -- Bronze Drake
  [43927]={ Mo =24488 ,lb =33999 , get = {"Fedryen Swiftspear"} },  -- Cenarion War Hippogryph
  [41515]={ Mo =23460 ,lb =32859 , get = {"Drake Dealer Hurlunk"} },  -- Cobalt Netherwing Drake
  [39315]={ Mo =22510 ,lb =31829 , get = {"Provisioner Nasela", "Trader Narasu"} },  -- Cobalt Riding Talbuk		-- lb 31830 A / 31829 H
  [34896]={ Mo =20072 ,lb =29102 , get = {"Provisioner Nasela", "Trader Narasu"} },  -- Cobalt War Talbuk			-- lb 29227 A / 29102 H
  [36702]={ Mo =21354 ,lb =30480 , get = {"Attumen the Huntsman"} },  -- Fiery Warhorse
  [49379]={ Mo =27707 ,lb =37828 , get = {"Coren Direbrew"} },  -- Great Brewfest Kodo
  [61294]={ Mo =32562 ,lb =44707 },  -- Green Proto-Drake
  [26056]={ Mo =15715 ,lb =21323 , get = {"Anubisath Sentinel","Obsidian Eradicator","Qiraji Brainwasher","Qiraji Lasher","Anubisath Defender","Obsidian Nullifier","Qiraji Slayer","Qiraji Mindslayer","Anubisath Warder","Qiraji Champion"} },  -- Green Qiraji Battle Tank
  [39798]={ Mo =22958 ,lb =32314 , get = {"Grella"} },  -- Green Riding Nether Ray 
  [48025]={ Mo =24814 ,lb =37012 , get = {"Headless Horseman"} },  -- Headless Horseman's Mount
  [41513]={ Mo =23455 ,lb =32857 , get = {"Drake Dealer Hurlunk"} },  -- Onyx Netherwing Drake
  [41516]={ Mo =23458 ,lb =32860 , get = {"Drake Dealer Hurlunk"} },  -- Purple Netherwing Drake
  [39801]={ Mo =22975 ,lb =32316 , get = {"Grella"} },  -- Purple Riding Nether Ray
  [41252]={ Mo =23408 ,lb =32768 , get = {"Anzu"} },  -- Raven Lord
  [59570]={ Mo =31697 ,lb =43955 , get = {"Cielstrasza"} },  -- Red Drake
  [59961]={ Mo =31902 ,lb =44160  },  -- Red Proto-Drake
  [26054]={ Mo =15716 ,lb =21321 , get = {"Anubisath Sentinel","Obsidian Eradicator","Qiraji Brainwasher","Qiraji Lasher","Anubisath Defender","Obsidian Nullifier","Qiraji Slayer","Qiraji Mindslayer","Anubisath Warder","Qiraji Champion"} },  -- Red Qiraji Battle Tank
  [39800]={ Mo =22976 ,lb =32317 , get = {"Grella"} },  -- Red Riding Nether Ray
  [17481]={ Mo =30542 ,lb =13335 , get = {"Baron Rivendare"} },  -- Rivendare's Deathcharger
  [39802]={ Mo =22977 ,lb =32318 , get = {"Grella"} },  -- Silver Riding Nether Ray
  [39317]={ Mo =22512 ,lb =31831 , get = {"Provisioner Nasela", "Trader Narasu"} },  -- Silver Riding Talbuk 
  [34898]={ Mo =20152 ,lb =29229 , get = {"Provisioner Nasela", "Trader Narasu"} },  -- Silver War Talbuk			--lb 29229 / 29104
  [43900]={ Mo =24368 ,lb =33977 , get = {"Coren Direbrew","Driz Tumblequick","Pol Amberstill"} },  -- Swift Brewfest Ram
  [24242]={ Mo =15090 ,lb =19872 , get = {"Bloodlord Mandokir"} },  -- Swift Razzashi Raptor
  [46628]={ Mo =26131 ,lb =35513 , get = {"Kael'thas Sunstrider"} },  -- Swift White Hawkstrider
  [24252]={ Mo =15104 ,lb =19902 , get = {"High Priest Thekal"} },  -- Swift Zulian Tiger
  [39318]={ Mo =22513 ,lb =31834 , get = {"Provisioner Nasela", "Trader Narasu"} },  -- Tan Riding Talbuk			-- lb 31834 / 31833
  [34899]={ Mo =20150 ,lb =29230 , get = {"Provisioner Nasela", "Trader Narasu"} },  -- Tan War Talbuk				-- lb 29230 / 29105
  [60002]={ Mo =32491 ,lb =44168 , get = {"Time-Lost Proto Drake"} },  -- Time-Lost Proto-Drake
  [59571]={ Mo =31698 ,lb =43954 , get = {"Sartharion"} },  -- Twilight Drake
  [41517]={ Mo =23457 ,lb =32861 , get = {"Drake Dealer Hurlunk"} },  -- Veridian Netherwing Drake
  [41518]={ Mo =23459 ,lb =32862 , get = {"Drake Dealer Hurlunk"} },  -- Violet Netherwing Drake
  [60024]={ Mo =32157 ,lb =60024  },  -- Violet Proto-Drake
  [54753]={ Mo =29596 ,lb =43962  },  -- White Polar Bear Mount
  [39319]={ Mo =22514 ,lb =31836 , get = {"Provisioner Nasela", "Trader Narasu"} },  -- White Riding Talbuk			--lb 31836 / 31835
  [34897]={ Mo =20151 ,lb =29231 , get = {"Provisioner Nasela", "Trader Narasu"} },  -- White War Talbuk			--lb 29231 / 29103
  [26055]={ Mo =15714 ,lb =21324 , get = {"Anubisath Sentinel","Obsidian Eradicator","Qiraji Brainwasher","Qiraji Lasher","Anubisath Defender","Obsidian Nullifier","Qiraji Slayer","Qiraji Mindslayer","Anubisath Warder","Qiraji Champion"} },  -- Yellow Qiraji Battle Tank
  [49322]={ Mo =27684 ,lb =37719 , nlo = true },  -- Swift Zhevra
  [26656]={ Mo =15711 ,lb =21176 , nlo = true  },  -- Black Qiraji Battle Tank
  [43899]={ Mo =23588 ,lb =33976 , get = {"Driz Tumblequick","Pol Amberstill"} },  -- Brewfest Ram
  [63956]={ Mo =33892 ,lb =45801  },  -- Ironbound Proto-Drake
  [63963]={ Mo =33904 ,lb =45802  },  -- Rusted Proto-Drake
  [63796]={ Mo =33848 ,lb =45693  },  -- Mimiron's Head
  [64731]={ Mo =34187 ,lb =46109  },  -- Sea Turtle
  [63844]={ Mo =33857 ,lb =45725 , get = {"Trellis Morningsun","Samamba","Rook Hawkfist","Rillie Spindlenut","Irisee","Freka Bloodaxe","Eliza Killian","Doru Thunderhorn","Corporal Arthur Flew","Derrick Brindlebeard"} },  -- Argent Hippogryph
  [59568]={ Mo =31695 ,lb =43953  }, --Reins of the Blue Drake
  [71342]={ Mo =38204 ,lb =50250 , get = {"Apothecary Hummel"} }, --Big Love Rocket
  [67466]={ Mo =35445 ,lb =47180 , get = {"Dame Evniki Kapsalis"} },  -- Argent Warhorse
  [69395]={ Mo =36837 ,lb =49636 , get = {"Onyxia"} }, -- Onyxian Drake
  [72807]={ Mo =38695 ,lb =0 },-- Icebound Frostbrood Vanquisher
  [72808]={ Mo =38778 ,lb =0 },-- Bloodbathed Frostbrood Vanquisher
  [75596]={ Mo =40533 ,lb =0}, -- Frosty Flying Carpet
  [75614]={ Mo =40625 ,lb =54811}, -- Celestial Steed
  [75973]={ Mo =40725 ,lb =54860}, -- X-53 Touring Rocket
  [72286]={ Mo =38545 ,lb =0}, -- Invincible
  [73313]={ Mo =39046 ,lb =0}, -- Crimson Deathcharger
  [74856]={ Mo =40165 ,lb =0}, -- Blazing Hippogryph 
 
 
  [30174]={ Mo =17266 ,lb =23720 , tcg = true },  -- Riding Turtle
  [42776]={ Mo =24003 ,lb =33224 , tcg = true },  -- Spectral Tiger
  [42777]={ Mo =24004 ,lb =33225 , tcg = true },  -- Swift Spectral Tiger
  [51412]={ Mo =28363 ,lb =38576 , tcg = true },  -- Big Battle Bear
  [46197]={ Mo =26192 ,lb =35225 , tcg = true },  -- X-51 Nether-Rocket
  [46199]={ Mo =26164 ,lb =35226 , tcg = true },  -- X-51 Nether-Rocket X-TREME
  [65917]={ Mo =34655 ,lb =49290 , tcg = true },  -- Magic Rooster
 
  [59976]={ Mo =31912 ,lb =44164 , nlo = true },  -- Black Proto-Drake
  [60021]={ Mo =32156 ,lb =44175 , nlo = true },  -- Plagued Proto-Drake
  [43688]={ Mo =24379 ,lb =33809 , nlo = true },  -- Amani War Bear
  [58983]={ Mo =31319 ,lb =43599 , nlo = true },  -- Big Blizzard Bear
  [49193]={ Mo =27637 ,lb =37676 , nlo = true },  -- Vengeful Nether Drake
  [44744]={ Mo =24743 ,lb =34092 , pvp = true , nlo = true },  -- Merciless Nether Drake
  [37015]={ Mo =21510 ,lb =30609 , pvp = true , nlo = true },  -- Swift Nether Drake
  [64927]={ Mo =34225 ,lb =46171 , pvp = true },  -- Deadly Gladiator's Frostwyrm  
  [39316]={ Mo =22511 ,lb =28915 , pvp = true , get = {"Aldraan","Coreiel"} },  -- Dark Riding Talbuk
  [34790]={ Mo =20149 ,lb =29228 , pvp = true , get = {"Aldraan","Coreiel"} },  -- Dark War Talbuk
  
  [67336]={ Mo =24743 ,lb =0 , pvp = true , nlo = true }, -- Relentless Gladiator's Frost Wyrm
  [65439]={ Mo =24743 ,lb =0 , pvp = true , nlo = true }, -- Furious Gladiator's Frost Wyrm
  [58615]={ Mo =24743 ,lb =0 , pvp = true , nlo = true }, -- Brutal Nether Drake
  
  
  [60114]={ Mo =32206 ,lb =44225 , Faction = 1 , get = {"Mei Francis"} },  -- Armored Brown Bear	 
  [61229]={ Mo =32335 ,lb =44689 , Faction = 1 , get = {"Mei Francis"} },  -- Armored Snowy Gryphon
    [470]={ Mo = 5404 ,lb =2411  , Faction = 1 , get = {"Unger Statforth"} },  -- Black Stallion Bridle
  [60118]={ Mo =32205 ,lb =44223 , Faction = 1 },  -- Black War Bear
  [59785]={ Mo =31849 ,lb =43956 , Faction = 1 , get = {"Knight Dameron"} },  -- Black War Mammoth 	--lb 43956 / 44077
  [61996]={ Mo =31239 ,lb =44843 , Faction = 1  },  -- Blue Dragonhawk
  [10969]={ Mo =8595  ,lb =8595  , Faction = 1 , get = {"Milli Featherwhistle"} },  -- Blue Mechanostrider
  [34406]={ Mo =19658 ,lb =28481 , Faction = 1 , get = {"Torallius the Pack Handler"} },  -- Brown Elekk
    [458]={ Mo =  284 ,lb =5656  , Faction = 1 , get = {"Gregor MacVince", "Katie Hunter", "Merideth Carlson", "Unger Statforth"} },  -- Brown Horse Bridle
   [6899]={ Mo = 5872 ,lb =5872  , Faction = 1 , get = {"Veron Amberstill"} },  -- Brown Ram
   [6648]={ Mo =12375 ,lb =5655  , Faction = 1 , get = {"Gregor MacVince", "Katie Hunter", "Merideth Carlson", "Unger Statforth"} },  -- Chestnut Mare
  [32239]={ Mo =20503 ,lb =25471 , Faction = 1 , get = {"Brunn Flamebeard","Durgan Thunderbeak","Grunda Bronzewing","Mei Francis"} },  -- Ebon Gryphon
  [32235]={ Mo =18360 ,lb =25470 , Faction = 1 , get = {"Brunn Flamebeard","Durgan Thunderbeak","Grunda Bronzewing","Mei Francis"} },  -- Golden Gryphon
  [61470]={ Mo =31858 ,lb =43961 , Faction = 1 , get = {"Lillehoff"} },  -- Grand Ice Mammoth	 
  [35710]={ Mo =20846 ,lb =29744 , Faction = 1 , get = {"Torallius the Pack Handler"} },  -- Gray Elekk
   [6777]={ Mo =12373 ,lb =5864  , Faction = 1 , get = {"Veron Amberstill"} },  -- Gray Ram
  [35713]={ Mo =20848 ,lb =29745 , Faction = 1 , get = {"Torallius the Pack Handler"} },  -- Great Blue Elekk
  [35712]={ Mo =20849 ,lb =29746 , Faction = 1 , get = {"Torallius the Pack Handler"} },  -- Great Green Elekk
  [35714]={ Mo =20850 ,lb =29747 , Faction = 1 , get = {"Torallius the Pack Handler"} },  -- Great Purple Elekk
  [17453]={ Mo =13321 ,lb =13321 , Faction = 1 , get = {"Milli Featherwhistle"} },  -- Green Mechanostrider
  [59799]={ Mo =31855 ,lb =43958 , Faction = 1 , get = {"Lillehoff"} },  -- Ice Mammoth			--lb 43958 / 44080
  [60424]={ Mo =32286 ,lb =44413 , Faction = 1   },  -- Mekgineer's Chopper
    [472]={ Mo = 5405 ,lb =2414  , Faction = 1 , get = {"Gregor MacVince", "Katie Hunter", "Merideth Carlson", "Unger Statforth"} },  -- Pinto
  [35711]={ Mo =20847 ,lb =29743 , Faction = 1 , get = {"Torallius the Pack Handler"} },  -- Purple Elekk
  [10873]={ Mo = 8563 ,lb =8563  , Faction = 1 , get = {"Milli Featherwhistle"} },  -- Red Mechanostrider
  [32240]={ Mo =20505 ,lb =25472 , Faction = 1 , get = {"Brunn Flamebeard","Durgan Thunderbeak","Grunda Bronzewing","Mei Francis"} },  -- Snowy Gryphon
  [10789]={ Mo = 7687 ,lb =8632  , Faction = 1 , get = {"Lelanai"} },  -- Spotted Frostsaber
   [8394]={ Mo = 6074 ,lb =8631  , Faction = 1 , get = {"Lelanai"} },  -- Striped Frostsaber
  [10793]={ Mo = 7690 ,lb =8629  , Faction = 1 , get = {"Lelanai"} },  -- Striped Nightsaber
  [32242]={ Mo =18406 ,lb =25473 , Faction = 1 , get = {"Brunn Flamebeard","Durgan Thunderbeak","Grunda Bronzewing","Mei Francis"} },  -- Swift Blue Gryphon
  [23238]={ Mo =14546 ,lb =18786 , Faction = 1 , get = {"Veron Amberstill"} },  -- Swift Brown Ram
  [23229]={ Mo =14561 ,lb =18777 , Faction = 1 , get = {"Gregor MacVince","Katie Hunter","Merideth Carlson"} },  -- Swift Brown Steed
  [23221]={ Mo =14556 ,lb =18766 , Faction = 1 , get = {"Lelanai"} },  -- Swift Frostsaber
  [23239]={ Mo =14548 ,lb =5864	 , Faction = 1 , get = {"Veron Amberstill"} },  -- Swift Gray Ram
  [32290]={ Mo =20506 ,lb =25528 , Faction = 1 , get = {"Brunn Flamebeard","Durgan Thunderbeak","Grunda Bronzewing","Mei Francis"} },  -- Swift Green Gryphon
  [23225]={ Mo =18772 ,lb =18772 , Faction = 1 , get = {"Milli Featherwhistle"} },  -- Swift Green Mechanostrider
  [23219]={ Mo =14555 ,lb =18767 , Faction = 1 , get = {"Lelanai"} },  -- Swift Mistsaber
  [23227]={ Mo =14559 ,lb =18776 , Faction = 1 , get = {"Gregor MacVince","Katie Hunter","Merideth Carlson"} },  -- Swift Palomino
  [32292]={ Mo =20507 ,lb =25529 , Faction = 1 , get = {"Brunn Flamebeard","Durgan Thunderbeak","Grunda Bronzewing","Mei Francis"} },  -- Swift Purple Gryphon
  [32289]={ Mo =20508 ,lb =25527 , Faction = 1 , get = {"Brunn Flamebeard","Durgan Thunderbeak","Grunda Bronzewing","Mei Francis"} },  -- Swift Red Gryphon
  [23338]={ Mo =14602 ,lb =18902 , Faction = 1 , get = {"Lelanai"} },  -- Swift Stormsaber
  [23223]={ Mo =18773 ,lb =18773 , Faction = 1 , get = {"Milli Featherwhistle"} },  -- Swift White Mechanostrider
  [23240]={ Mo =14547 ,lb =18785 , Faction = 1 , get = {"Veron Amberstill"} },  -- Swift White Ram
  [23228]={ Mo =14560 ,lb =18778 , Faction = 1 , get = {"Gregor MacVince","Katie Hunter","Merideth Carlson"} },  -- Swift White Steed
  [23222]={ Mo =18774 ,lb =18774 , Faction = 1 , get = {"Milli Featherwhistle"} },  -- Swift Yellow Mechanostrider
  [61425]={ Mo =32640 ,lb =44235 , Faction = 1 , get = {"Mei Francis"} },  -- Traveler's Tundra Mammoth 	 
  [17454]={ Mo =13322 ,lb =13322 , Faction = 1 , get = {"Milli Featherwhistle"} },  -- Unpainted Mechanostrider
   [6898]={ Mo = 4777 ,lb =5873  , Faction = 1 , get = {"Veron Amberstill"} },  -- White Ram
  [17229]={ Mo =11021 ,lb =13086 , Faction = 1 , get = {"Rivern Frostwind"} },  -- Winterspring Frostsaber
  [59791]={ Mo =31851 ,lb =44230 , Faction = 1 , get = {"Mei Francis"} },  -- Wooly Mammoth     
  [61465]={ Mo =31862 ,lb =43959 , Faction = 1 , get = {"Koralon the Flame Watcher","Emalon the Storm Watcher","Archavon the Stone Watcher"} },  -- Grand Black War Mammoth 		--lb 43959 / 44083
  [63639]={ Mo =33416 ,lb =45590 , Faction = 1 , get = {"Irisee"} },  -- Exodar Elekk
  [63637]={ Mo =33298 ,lb =45591 , Faction = 1 , get = {"Rook Hawkfist"} },  -- Darnassian Nightsaber
  [63232]={ Mo =33297 ,lb =45125 , Faction = 1 , get = {"Corporal Arthur Flew"} },  -- Stormwind Steed
  [63636]={ Mo =33408 ,lb =45586 , Faction = 1 , get = {"Derrick Brindlebeard "} },  -- Ironforge Ram
  [63638]={ Mo =33301 ,lb =45589 , Faction = 1 , get = {"Rillie Spindlenut"} },  -- Gnomeregan Mechanostrider
  [65637]={ Mo =34551 ,lb =46745 , Faction = 1 , get = {"Irisee"} },  -- Great Red Elekk
  [65640]={ Mo =34557 ,lb =46752 , Faction = 1 , get = {"Swift Gray Steed"} },  -- Swift Gray Steed
  [65643]={ Mo =34554 ,lb =46748 , Faction = 1 , get = {"Derrick Brindlebeard"} },  -- Swift Violet Ram
  [65638]={ Mo =34550 ,lb =46744 , Faction = 1 , get = {"Rook Hawkfist"} },  -- Swift Moonsaber
  [65642]={ Mo =34553 ,lb =45589 , Faction = 1 , get = {"Rillie Spindlenut"} },  -- Turbostrider
  [23510]={ Mo =14745 ,lb =19030 , Faction = 1 , pvp = true , get = {"Gaelden Hammersmith","Thanthaldis Snowgleam"} },  -- Stormpike Battle Charger
  [22720]={ Mo =14335 ,lb =29467 , Faction = 1 , pvp = true , get = {"Lieutenant Karter"} },  -- Black War Ram
  [22717]={ Mo =14332 ,lb =29468 , Faction = 1 , pvp = true , get = {"Lieutenant Karter"} },  -- Black War Steed
  [22723]={ Mo =14336 ,lb =29471 , Faction = 1 , pvp = true , get = {"Lieutenant Karter"} },  -- Black War Tiger 
  [48027]={ Mo =26439 ,lb =35906 , Faction = 1 , pvp = true , get = {"Lieutenant Karter"} },  -- Black War Elekk
  [22719]={ Mo =14334 ,lb =29465 , Faction = 1 , pvp = true , get = {"Lieutenant Karter"} },  -- Black Battlestrider
  [66090]={ Mo =33840 ,lb =46815 , Faction = 1 , get = {"Hiren Loresong"} },  -- Quel'dorei Steed
  [66847]={ Mo =35168 ,lb =47100 , Faction = 1 , get = {"Lelanai"} },  -- Striped Dawnsaber
  [66087]={ Mo =35147 ,lb =46813 , Faction = 1 , get = {"Hiren Loresong"} },  -- Silver Covenant Hippogryph 
  [68057]={ Mo =35808 ,lb =49044  , Faction = 1   }, -- Swift Alliance Steed 
  [68187]={ Mo =35876 ,lb =0 , Faction = 1}, -- Crusader's White Warhorse
  [16056]={ Mo =10322 ,lb =0 , Faction = 1 , nlo = true}, -- Ancient Frostsaber
  [17461]={ Mo =4780  ,lb =0 , Faction = 1 , nlo = true}, -- Black Ram
  [17460]={ Mo =4778  ,lb =0 , Faction = 1 , nlo = true}, -- Frost Ram
  [17459]={ Mo =11150 ,lb =0 , Faction = 1 , nlo = true}, --  Icy Blue Mechanostrider Mod A
  [16055]={ Mo =7322  ,lb =0 , Faction = 1 , nlo = true}, -- Nightsaber
  [16082]={ Mo =306   ,lb =0 , Faction = 1 , nlo = true}, -- Palomino
  [15779]={ Mo =10179 ,lb =0 , Faction = 1 , nlo = true}, -- White Mechanostrider Mod B
  [16083]={ Mo =305   ,lb =0 , Faction = 1 , nlo = true}, -- White Stallion
   
  [61230]={ Mo =32336 ,lb =44690 , Faction = 2 , get = {"Mei Francis"} },  -- Armored Blue Wind Rider
  [60116]={ Mo =32207 ,lb =44225 , Faction = 2 , get = {"Mei Francis"} },  -- Armored Brown Bear 		--lb 44225 / 44226
  [35022]={ Mo =20222 ,lb =29221 , Faction = 2 , get = {"Winaestra"} },  -- Black Hawkstrider
  [60119]={ Mo =32203 ,lb =44224 , Faction = 2 , get = {} },  -- Black War Bear  
  [59788]={ Mo =31849 ,lb =44077 , Faction = 2 , get = {"Stone Guard Mukar"} },  -- Black War Mammoth 	
  [35020]={ Mo =20220 ,lb =29220 , Faction = 2 , get = {"Winaestra"} },  -- Blue Hawkstrider
  [17463]={ Mo =12341 ,lb =13332 , Faction = 2 , get = {"Zachariah Post"} },  -- Blue Skeletal Horse
  [32244]={ Mo =20486 ,lb =25475 , Faction = 2 , get = {"Bana Wildmane","Dama Wildmane","Mei Francis","Tohfo Skyhoof"} },  -- Blue Wind Rider
  [18990]={ Mo =12354 ,lb =15290 , Faction = 2 , get = {"Harb Clawhoof"} },  -- Brown Kodo
  [17464]={ Mo =12342 ,lb =13333 , Faction = 2 , get = {"Zachariah Post"} },  -- Brown Skeletal Horse
   [6654]={ Mo = 5195 ,lb =5668  , Faction = 2 , get = {"Ogunaro Wolfrunner"} },  -- Brown Wolf
   [6653]={ Mo =12351 ,lb =5665  , Faction = 2 , get = {"Ogunaro Wolfrunner"} },  -- Dire Wolf
   [8395]={ Mo = 6075 ,lb =8588  , Faction = 2 , get = {"Zjolnir"} },  -- Emerald Raptor
  [61469]={ Mo =31858 ,lb =44086 , Faction = 2 , get = {"Lillehoff"} },  -- Grand Ice Mammoth 	
  [18989]={ Mo =12355 ,lb =15277 , Faction = 2 , get = {"Harb Clawhoof"} },  -- Gray Kodo
  [23249]={ Mo =14549 ,lb =18794 , Faction = 2 , get = {"Harb Clawhoof"} },  -- Great Brown Kodo
  [23248]={ Mo =14550 ,lb =18795 , Faction = 2 , get = {"Harb Clawhoof"} },  -- Great Gray Kodo
  [23247]={ Mo =14542 ,lb =18793 , Faction = 2 , get = {"Harb Clawhoof"} },  -- Great White Kodo
  [17465]={ Mo =11156 ,lb =13334 , Faction = 2 , get = {"Zachariah Post"} },  -- Green Skeletal Warhorse
  [32245]={ Mo =20493 ,lb =25476 , Faction = 2 , get = {"Bana Wildmane","Dama Wildmane","Mei Francis","Tohfo Skyhoof"} },  -- Green Wind Rider
  [59797]={ Mo =31855 ,lb =44080 , Faction = 2 , get = {"Lillehoff"} },  -- Ice Mammoth 		 
  [55531]={ Mo =29929 ,lb =41508 , Faction = 2 , get = {} },  -- Mechano-Hog
  [35018]={ Mo =20217 ,lb =29222 , Faction = 2 , get = {"Winaestra"} },  -- Purple Hawkstrider
  [23246]={ Mo =14558 ,lb =18791 , Faction = 2 , get = {"Zachariah Post"} },  -- Purple Skeletal Warhorse
  [61997]={ Mo =32944 ,lb =44842 , Faction = 2 , get = {} },  -- Red Dragonhawk
  [34795]={ Mo =19280 ,lb =28927 , Faction = 2 , get = {"Winaestra"} },  -- Red Hawkstrider
  [17462]={ Mo =12343 ,lb =13331 , Faction = 2 , get = {"Zachariah Post"} },  -- Red Skeletal Horse
  [23241]={ Mo =14545 ,lb =18788 , Faction = 2 , get = {"Zjolnir"} },  -- Swift Blue Raptor
  [23250]={ Mo =14540 ,lb =18796 , Faction = 2 , get = {"Ogunaro Wolfrunner"} },  -- Swift Brown Wolf
  [23252]={ Mo =14541 ,lb =18798 , Faction = 2 , get = {"Ogunaro Wolfrunner"} },  -- Swift Gray Wolf
  [35025]={ Mo =20224 ,lb =29223 , Faction = 2 , get = {"Winaestra"} },  -- Swift Green Hawkstrider
  [32295]={ Mo =20489 ,lb =25531 , Faction = 2 , get = {"Bana Wildmane","Dama Wildmane","Mei Francis","Tohfo Skyhoof"} },  -- Swift Green Wind Rider
  [23242]={ Mo =14543 ,lb =18789 , Faction = 2 , get = {"Zjolnir"} },  -- Swift Olive Raptor
  [23243]={ Mo =14544 ,lb =18790 , Faction = 2 , get = {"Zjolnir"} },  -- Swift Orange Raptor
  [33660]={ Mo =19281 ,lb =28936 , Faction = 2 , get = {"Winaestra"} },  -- Swift Pink Hawkstrider
  [35027]={ Mo =20223 ,lb =29224 , Faction = 2 , get = {"Winaestra"} },  -- Swift Purple Hawkstrider
  [32297]={ Mo =20490 ,lb =25533 , Faction = 2 , get = {"Bana Wildmane","Dama Wildmane","Mei Francis","Tohfo Skyhoof"} },  -- Swift Purple Wind Rider
  [32246]={ Mo =20491 ,lb =25477 , Faction = 2 , get = {"Bana Wildmane","Dama Wildmane","Mei Francis","Tohfo Skyhoof"} },  -- Swift Red Wind Rider
  [23251]={ Mo =20492 ,lb =18797 , Faction = 2 , get = {"Ogunaro Wolfrunner"} },  -- Swift Timber Wolf
  [32296]={ Mo =25532 ,lb =25532 , Faction = 2 , get = {"Bana Wildmane","Dama Wildmane","Mei Francis","Tohfo Skyhoof"} },  -- Swift Yellow Wind Rider
  [32243]={ Mo =20488 ,lb =25474 , Faction = 2 , get = {"Bana Wildmane","Dama Wildmane","Mei Francis","Tohfo Skyhoof"} },  -- Tawny Wind Rider
    [580]={ Mo =12353 ,lb =1132  , Faction = 2 , get = {"Ogunaro Wolfrunner"} },  -- Timber Wolf
  [61447]={ Mo =32640 ,lb =44234 , Faction = 2 , get = {"Mei Francis"} },  -- Traveler's Tundra Mammoth 	 
  [10796]={ Mo =12349 ,lb =8591  , Faction = 2 , get = {"Zjolnir"} },  -- Turquoise Raptor
  [10799]={ Mo =12350 ,lb =8592  , Faction = 2 , get = {"Zjolnir"} },  -- Violet Raptor
  [59793]={ Mo =31851 ,lb =44231 , Faction = 2 , get = {"Mei Francis"} },  -- Wooly Mammoth 				 
  [61467]={ Mo =31862 ,lb =44083 , Faction = 2 , get = {"Koralon the Flame Watcher","Emalon the Storm Watcher","Archavon the Stone Watcher"} },  -- Grand Black War Mammoth 
  [64977]={ Mo =34238 ,lb =46308 , Faction = 2 , get = {"Zachariah Post"} },  -- Black Skeletal Horse
  [64658]={ Mo = 5194 ,lb =46099 , Faction = 2 , get = {"Ogunaro Wolfrunner"} },  -- Black Wolf
  [64657]={ Mo =34155 ,lb =46100 , Faction = 2 , get = {"Harb Clawhoof"} },  -- White Kodo
  [63641]={ Mo =33300 ,lb =45592 , Faction = 2 , get = {"Doru Thunderhorn"} },  -- Thunder Bluff Kodo
  [63643]={ Mo =33414 ,lb =45597 , Faction = 2 , get = {"Eliza Killian"} },  -- Forsaken Warhorse
  [63635]={ Mo =33299 ,lb =45593 , Faction = 2 , get = {"Samamba"} },  -- Darkspear Raptor
  [63640]={ Mo =33409 ,lb =45595 , Faction = 2 , get = {"Freka Bloodaxe"} },  -- Orgrimmar Wolf
  [63642]={ Mo =33418 ,lb =45596 , Faction = 2 , get = {"Trellis Morningsun"} },  -- Silvermoon Hawkstrider
  [65645]={ Mo =34552 ,lb =46746 , Faction = 2 , get = {"Eliza Killian"} },  -- White Skeletal Warhorse
  [65644]={ Mo =34549 ,lb =46743 , Faction = 2 , get = {"Samamba"} },  -- Swift Purple Raptor
  [65641]={ Mo =34558 ,lb =46750 , Faction = 2 , get = {"Doru Thunderhorn"} },  -- Great Golden Kodo
  [65646]={ Mo =34555 ,lb =46749 , Faction = 2 , get = {"Freka Bloodaxe"} },  -- Swift Burgundy Wolf
  [65639]={ Mo =34556 ,lb =46751 , Faction = 2 , get = {"Trellis Morningsun"} },  -- Swift Red Hawkstrider
  [22718]={ Mo =14333 ,lb =29466 , Faction = 2 , pvp = true , get = {"Raider Bork"} },  -- Black War Kodo
  [35028]={ Mo =34129 ,lb =34129 , Faction = 2 , pvp = true , get = {"Raider Bork"} },  -- Swift Warstrider
  [22722]={ Mo =14331 ,lb =29470 , Faction = 2 , pvp = true , get = {"Raider Bork"} },  -- Red Skeletal Warhorse
  [23509]={ Mo =14744 ,lb =19029 , Faction = 2 , pvp = true , get = {"Grunnda Wolfheart","Jekyll Flandring"} },  -- Frostwolf Howler
  [22721]={ Mo =14330 ,lb =29472 , Faction = 2 , pvp = true , get = {"Raider Bork"} },  -- Black War Raptor
  [22724]={ Mo =14329 ,lb =29469 , Faction = 2 , pvp = true , get = {"Raider Bork"} },  -- Black War Wolf
  [66091]={ Mo =33841 ,lb =46816 , Faction = 2 , get = {"Vasarin Redmorn"} },  -- Sunreaver Hawkstrider
  [66846]={ Mo =35169 ,lb =47101 , Faction = 2 , get = {"Zachariah Post"} },  -- Ochre Skeletal Warhorse
  [66088]={ Mo =35148 ,lb =46814 , Faction = 2 , get = {"Vasarin Redmorn"} },  -- Sunreaver Dragonhawk
  [64659]={ Mo =34156 ,lb =46102 , Faction = 2 },  -- Venomhide Ravasaur
  [68056]={ Mo =35809 ,lb =49046 , Faction = 2 }, -- Swift Horde Wolf
  [68188]={ Mo =35878 ,lb =0 , Faction = 2}, -- Crusader's Black Warhorse
  [16081]={ Mo =359 ,lb =0 , Faction = 2 , nlo = true}, -- Arctic Wolf
  [16080]={ Mo =4270,lb =0 , Faction = 2 , nlo = true}, -- Red Wolf
  [18991]={ Mo =12151 ,lb =0 , Faction = 2 , nlo = true}, -- Green Kodo
  [18992]={ Mo =12148 ,lb =0 , Faction = 2 , nlo = true}, -- Teal Kodo
  [17450]={ Mo =7706 ,lb =0 , Faction = 2 , nlo = true}, -- Ivory Raptor 
  [16084]={ Mo =7704 ,lb =0 , Faction = 2 , nlo = true}, -- Mottled Red Raptor   
  
  [23214]={ Mo =14565 ,lb =0 , Faction = 1 , Class = 1 },  -- Charger
  [13819]={ Mo = 9158 ,lb =0 , Faction = 1 , Class = 1 },  -- Warhorse
  [66906]={ Mo =35179 ,lb =47179 , Class = 1 , get = {"Dame Evniki Kapsalis"}  }, -- Argent Charger
    
  [34767]={ Mo =25049 ,lb =0 , Faction = 2 , Class = 1 },  -- Horde Charger
  [34769]={ Mo = 9158 ,lb =0 , Faction = 2 , Class = 1 },  -- Horde Warhorse

  [23161]={ Mo =14505 ,lb =0 , Class = 3 },  -- Dreadsteed
   [5784]={ Mo =304   ,lb =0 , Class = 3 },  -- Felsteed

  [54729]={ Mo =29582 ,lb =0 , Class = 2 },  -- Winged Steed of the Ebon Blade
  [48778]={ Mo =28901 ,lb =0 , Class = 2 },  -- Acherus Deathcharger

  [44153]={ Mo =24653 ,lb =34060 },  -- Flying Machine
  [44151]={ Mo =24654 ,lb =34061 },  -- Turbo-Charged Flying Machine

  [61451]={ Mo =33029 ,lb =44554 },  -- Flying Carpet
  [61309]={ Mo =33030 ,lb =44558 },  -- Magnificent Flying Carpet
};




GUPPET_CM_DATA["Companions"] = {
[10685]={ Mo =7394  ,lb =11023 , get = {"Magus Tirth"} },  -- Ancona Chicken
[10696]={ Mo =7547  ,lb =34535 , get = {"Draconic Magelord","Blue Scalebane","Draconic Mageweaver","Blue Dragonspawn"} },  -- Azure Whelpling
[10714]={ Mo =7565  ,lb =10360 , get = {"Xan'tish"} },  -- Black Kingsnake
[10675]={ Mo =7383  ,lb =8487  , get = {"Dalaran Spellscribe","Dalaran Summoner","Dalaran Theurgist","Dalaran Shield Guard"} },  -- Black Tabby Cat
[36031]={ Mo =21056 ,lb =29958 , get = {"Dealer Rashaad"} },  -- Blue Dragonhawk Hatchling
[35907]={ Mo =21010 ,lb =29901 , get = {"Sixx"} },  -- Blue Moth
[10673]={ Mo =7385  ,lb =8485  , get = {"Donni Anthania"} },  -- Bombay Cat
[10709]={ Mo =14421 ,lb =10394 , get = {"Halpa"} },  -- Brown Prairie Dog
[35239]={ Mo =20472 ,lb =29364 , get = {"Dealer Rashaad"} },  -- Brown Rabbit
[10716]={ Mo =7562  ,lb =10361 , get = {"Xan'tish"} },  -- Brown Snake
[46426]={ Mo =26056 ,lb =35350  },  -- Chuck
[61351]={ Mo =32591 ,lb =39898  },  -- Cobra Hatchling
[10680]={ Mo =7390  ,lb =8496  , get = {"Narkk"} },  -- Cockatiel
[10688]={ Mo =7395  ,lb =10393 , get = {"Dealer Rashaad","Jeremiah Payson"} },  -- Cockroach
[10674]={ Mo =7384  ,lb =8486  , get = {"Donni Anthania"} },  -- Cornish Rex Cat
[10717]={ Mo =7567  ,lb =10392 , get = {"Xan'tish"} },  -- Crimson Snake
[10697]={ Mo =7544  ,lb =8499  , get = {"Flamesnorting Whelp","Crimson Whelp","Red Whelp"} },  -- Crimson Whelpling
[10695]={ Mo =7543  ,lb =10822 , get = {"Searing Whelp","Scalding Whelp"} },  -- Dark Whelpling
[25162]={ Mo =15429 ,lb =20769 , get = {"Primal Ooze","Tainted Ooze","Glutinous Ooze","Vile Ooze","Cloned Ooze","Gargantuan Ooze","Vile Slime","Devouring Ooze","Rotting Sludge","The Ongar","Flesh Hunter","Living Decay","Large Vile Slime"} },  -- Disgusting Oozeling
[40614]={ Mo =23258 ,lb =32616  },  -- Egbert
[10698]={ Mo =7545  ,lb =8498  , get = {"Adolescent Whelp","Dreaming Whelp"} },  -- Emerald Whelpling
[26533]={ Mo =15698 ,lb =21301  },  -- Father Winter's Helper
[36034]={ Mo =21076 ,lb =29960 , get = {"Bogflare Needler"} },  -- Firefly
[53316]={ Mo =29147 ,lb =39973 , get = {"Darahir"} },  -- Ghostly Skull
[59250]={ Mo =31575 ,lb =43698   },  -- Giant Sewer Rat
[36027]={ Mo =21055 ,lb =29953 , get = {"Jilanne"} },  -- Golden Dragonhawk Hatchling
[10707]={ Mo =7553  ,lb =8500  , get = {"Shylenai"} },  -- Great Horned Owl
[10683]={ Mo =7387  ,lb =8492  , get = {"Defias Pirate"} },  -- Green Wing Macaw
[10706]={ Mo =7555  ,lb =8501  , get = {"Shylenai"} },  -- Hawk Owl
[10682]={ Mo =7391  ,lb =8494  , get = {"Bloodsail Elder Magus","Bloodsail Sea Dog","Bloodsail Swabby","Bloodsail Warlock","Bloodsail Swashbuckler","Bloodsail Deckhand","Bloodsail Mage","Bloodsail Raider","\"Pretty Boy\" Duncan"} },  -- Hyacinth Macaw
[23811]={ Mo =14878 ,lb =19450 },  -- Jubling
[61472]={ Mo =32643 ,lb =44738 },  -- Kirin Tor Familiar
[19772]={ Mo =12419 ,lb =15996 },  -- Lifelike Toad
[61991]={ Mo =32939 ,lb =44841 },  -- Little Fawn
[33050]={ Mo =18839 ,lb =27445 },  -- Magical Crawdad
[35156]={ Mo =20408 ,lb =29363 , get = {"Dealer Rashaad"} },  -- Mana Wyrmling
[12243]={ Mo =8376  ,lb =10398 },  -- Mechanical Chicken
 [4055]={ Mo =2671  ,lb =4401  },  -- Mechanical Squirrel
[39181]={ Mo =22445 ,lb =31760 },  -- Miniwing
[43918]={ Mo =24480 ,lb =33993 , get = {} },  -- Mojo
[28739]={ Mo =16548 ,lb =23007  },  -- Mr. Wiggles
[43698]={ Mo =24389 ,lb =33818  },  -- Muckbreath
[51716]={ Mo =28470 ,lb =38628 , get = {"Grella"} },  -- Nether Ray Fry
[10676]={ Mo =7382  ,lb =8487  , get = {"Donni Anthania"} },  -- Orange Tabby Cat
[40634]={ Mo =23266 ,lb =32622  },  -- Peanut
[27570]={ Mo =16085 ,lb =22235  },  -- Peddlefeet
[61357]={ Mo =32595 ,lb =44723 , get = {"Sairuk","Tanaika"} },  -- Pengu
[46599]={ Mo =26119 ,lb =35504 , get = {"Kael'thas Sunstrider"} },  -- Phoenix Hatchling
[61350]={ Mo =32592 ,lb =44721  },  -- Proto-Drake Whelp
[36028]={ Mo =21064 ,lb =29956 , get = {"Jilanne"} },  -- Red Dragonhawk Hatchling
[35909]={ Mo =21009 ,lb =29902 , get = {"Dealer Rashaad"} },  -- Red Moth
[10684]={ Mo =7389  ,lb =8495  , get = {"Dealer Rashaad","Narkk"} },  -- Senegal
[10677]={ Mo =7380  ,lb =8490  , get = {"Cookie","Dealer Rashaad"} },  -- Siamese Cat
[36029]={ Mo =21063 ,lb =29957 , get = {"Jilanne"} },  -- Silver Dragonhawk Hatchling
[10678]={ Mo =7381  ,lb =8488  , get = {"Donni Anthania"} },  -- Silver Tabby Cat
[42609]={ Mo =23909 ,lb =33154 , get = {"Headless Horseman"} },  -- Sinister Squashling
[16450]={ Mo =10598 ,lb =12529  },  -- Smolderweb Hatchling
[46425]={ Mo =26050 ,lb =35349  },  -- Snarly
[10711]={ Mo =7560  ,lb =8497  , get = {"Yarlyn Amberstill"} },  -- Snowshoe Rabbit
[28738]={ Mo =16547 ,lb =0 },  -- Speedy
[28871]={ Mo =16701 ,lb =0     , get = {"Midsummer Merchant", "Midsummer Supplier"} },  -- Spirit of Summer
[40990]={ Mo =23274 ,lb =0  },  -- Stinker
[61348]={ Mo =32589 ,lb =39896  },  -- Tickbird Hatchling
[45082]={ Mo =25062 ,lb =34478 , get = {"Mycah"} },  -- Tiny Sporebat
[26045]={ Mo =15710 ,lb =21309  },  -- Tiny Snowman
[43697]={ Mo =24388 ,lb =33816 },  -- Toothy
[26010]={ Mo =15699 ,lb =21277 },  -- Tranquil Mechanical Yeti
[10704]={ Mo =7549  ,lb =11026 , get = {"Flik"} },  -- Tree Frog
[13548]={ Mo =30379 ,lb =11110  },  -- Westfall Chicken
[28740]={ Mo =16549 ,lb =0  },  -- Whiskers the Rat
[10679]={ Mo =7386  ,lb =8489  , get = {"Lil Timmy"} },  -- White Kitten
[35911]={ Mo =21018 ,lb =29904 , get = {"Sixx"} },  -- White Moth
[61349]={ Mo =32590 ,lb =39899   },  -- White Tickbird Hatchling
[40613]={ Mo =23231 ,lb =32617   },  -- Willy
[26529]={ Mo =15706 ,lb =0   },  -- Winter Reindeer
[26541]={ Mo =15705 ,lb =0   },  -- Winter's Little Helper
[39709]={ Mo =22943 ,lb =32233 , get = {"Belbi Quikswitch","Blix Fixwidget","Larkin Thunderbrew","Ray'ma"} },  -- Wolpertinger
[10703]={ Mo =7550  ,lb =11027 , get = {"Flik"} },  -- Wood Frog
[15999]={ Mo =10259 ,lb =12264   },  -- Worg Pup
[35910]={ Mo =21008 ,lb =29903 , get = {"Sixx"} },  -- Yellow Moth
[54187]={ Mo =24968 ,lb =34425   },  -- Clockwork Rocket Bot
[15067]={ Mo =9662  ,lb =0     , get = {"Sprite Darter"} },  -- Sprite Darter Hatchling
[62562]={ Mo =33205 ,lb =44984 , get = {"Irisee"} },  -- Ammen Vale Lashling
[62508]={ Mo =33194 ,lb =44970 , get = {"Derrick Brindlebeard"} },  -- Dun Morogh Cub
[62513]={ Mo =33198 ,lb =44973 , get = {"Freka Bloodaxe"} },  -- Durotar Scorpion
[62516]={ Mo =33200 ,lb =44974 , get = {"Corporal Arthur Flew"} },  -- Elwyn Lamb
[62564]={ Mo =33227 ,lb =44982 , get = {"Trellis Morningsun"} },  -- Enchanted Broom
[62491]={ Mo =33188 ,lb =44965 , get = {"Rook Hawkfist"} },  -- Teldrassid Sproutling
[62510]={ Mo =33197 ,lb =44971 , get = {"Eliza Killian"} },  -- Tirisfal Batling
[62674]={ Mo =33274 ,lb =45002 , get = {"Rillie Spindlenut"} },  -- Mechanopeep
[62542]={ Mo =33219 ,lb =44980 , get = {"Doru Thunderhorn"} },  -- Mulgore Hatchling
[63712]={ Mo =33810 ,lb =45606 , get = {"Samamba"} },  -- Sen'Jin Fetish
[62561]={ Mo =33226 ,lb =44983  },  -- Strand Crawler
[61725]={ Mo =32791 ,lb =44794 , get = {"Noblegarden Merchant","Noblegarden Vendor"} },  -- Spring Rabbit
[61773]={ Mo =32818 ,lb =0 },  -- Plump Turkey
[65382]={ Mo =33529 ,lb =46544 }, -- Curious Wolvar Pup
[65381]={ Mo =33530 ,lb =46545 }, -- Curious Oracle Hatchling
[66096]={ Mo =34724 ,lb =0     , get = {"Vasarin Redmorn","Hiren Loresong"} },  -- Shimmering Wyrmling
[67413]={ Mo =35396 ,lb =0 },  -- Darting Hatchling 
[67414]={ Mo =35395 ,lb =0     , get = {"Deviate Guardian","Deviate Ravager"} },  -- Deviate Hatchling
[67415]={ Mo =35400 ,lb =0     , get = {"Gundrak Raptor"} },  -- Gundrak Hatchling
[67416]={ Mo =35387 ,lb =0 },  -- Leaping Hatching
[67417]={ Mo =35399 ,lb =0 , get = {"Breanni"} },  -- Obsidian Hatchling
[67418]={ Mo =35397 ,lb =0 },  -- Ravasaur Hatchling
[67419]={ Mo =35398 ,lb =0 },  -- Razormaw Hatchling
[67420]={ Mo =35394 ,lb =0 , get = {"Razzashi Raptor"} },  -- Razzashi Hatchling 
[44369]={ Mo =24753 ,lb =46707    },	--Pint-Sized Pink Elekk
[69452]={ Mo =36871 ,lb =0 },	--Core Hound Pup
[69535]={ Mo =36908 ,lb =0 },	--Gryphon Hatchling
[69536]={ Mo =36909 ,lb =0 },	--Wind Rider Cub
[69539]={ Mo =36910 ,lb =0 },	--Zipao Tiger
[69002]={ Mo =36607 ,lb =0 }, --Onyxian Whelpling
[55068]={ Mo =29726 ,lb =41133  }, -- Mr. Chilly
[10713]={ Mo =7561  ,lb =0 , get = {"Breanni"} }, --Albino Snake
[65358]={ Mo =34364 ,lb =0 , get = {"Breanni"} }, --Calico Cat
[70613]={ Mo =37865 ,lb =49912   }, --Perky Pug
[71840]={ Mo =38374 ,lb =50446 , get = {"Apothecary Hummel"} }, --Toxic Wasteling
[75134]={ Mo =40295 ,lb =0 , get = {"Jepetto Joybuzz", "Clockwork Assistant"} }, --Blue Clockwork Rocket Bot  
[15049]={ Mo =9657  ,lb =0 },  -- Lil' Smoky
[15048]={ Mo =9656  ,lb =11825 },  -- Pet Bombling
[75906]={ Mo =40703 ,lb =0 }, --Lil' XT
[74932]={ Mo =40198 ,lb =0 }, -- Frigid Frostling
  
[45125]={ Mo =25109 ,lb =34492 , tcg = true},  -- Rocket Chicken
[30156]={ Mo =17255 ,lb =23713 , tcg = true},  -- Hippogryph Hatchling
[49964]={ Mo =27914 ,lb =38050 , tcg = true},  -- Ethereal Soul-Trader
[40549]={ Mo =23234 ,lb =32588 , tcg = true},  -- Bananas
[45127]={ Mo =25110 ,lb =34493 , tcg = true},  -- Dragon Kite
[68810]={ Mo =36511 ,lb =49343 , tcg = true  }, --Spectral Tiger Cub
[68767]={ Mo =36482 ,lb =49287 , tcg = true }, --Tuskarr Kite
  
[23531]={ Mo =14755 ,lb =0 , chi = true},  -- Tiny Green Dragon
[23530]={ Mo =14756 ,lb =0 , chi = true},  -- Tiny Red Dragon
[45174]={ Mo =25146 ,lb =0 , chi = true},  -- Golden Pig
[27241]={ Mo =16069 ,lb =0 , chi = true},  -- Gurky
[40405]={ Mo =23198 ,lb =0 , chi = true},  -- Lucky
[53082]={ Mo =29089 ,lb =0 , chi = true},  -- Mini Tyrael
[24696]={ Mo =15186 ,lb =0 , chi = true},  -- Murky
[28505]={ Mo =16456 ,lb =0 , chi = true},  -- Poley
[45175]={ Mo =25147 ,lb =0 , chi = true},  -- Silver Pig
[65682]={ Mo =34587 ,lb =0 , chi = true , nlo = true},  -- Battle-Bot 

  
[17709]={ Mo =11327 ,lb =13582 , col = true},  -- Zergling
[32298]={ Mo =18381 ,lb =25535 , col = true},  -- Netherwhelp
[17707]={ Mo =11325 ,lb =13583 , col = true},  -- Panda Cub
[24988]={ Mo =15358 ,lb =30360 , col = true},  -- Lurky
[17708]={ Mo =11326 ,lb =13584 , col = true},  -- Mini Diablo
[52615]={ Mo =28883 ,lb =39286 , col = true},  -- Frosty
[69677]={ Mo =36979 ,lb =0 , col = true  },	--Lil' K.T.
[69541]={ Mo =36911 ,lb =0 , col = true  },	--Pandaren Monk
[78381]={ Mo =42078 ,lb =0 , col = true   }, -- Mini Thor
  
[63318]={ Mo =33578 ,lb =0 , pvp = true},  -- Murkimus the Gladiator
  
[51851]={ Mo =28513 ,lb =38658 , nlo = true},  -- Vampiric Batling
[61855]={ Mo =32841 ,lb =44819 , nlo = true},  -- Baby Blizzard Bear
[48406]={ Mo =27217 ,lb =0 , nlo = true},  -- Spirit of Competition
[48408]={ Mo =27346 ,lb =0 , nlo = true},  -- Essence of Competition
[66030]={ Mo =34694 ,lb =0 , nlo = true},  -- Grunty
[45890]={ Mo =25706 ,lb =0 , nlo = true },  -- Scorchling
  
[62609]={ Mo =33238 ,lb =44998 , Faction = 1  },  -- Argent Squire
[62746]={ Mo =33239 ,lb =45022 , Faction = 2  },  -- Argent Gruntling
 



};
 
