
gGroupCalendar_Settings = {
	["ShowEventsInLocalTime"] = false,
	["TwentyFourHourTime"] = false,
	["Debug"] = false,
	["PlayerSettings"] = {
		["WoWArg_Nigthcrow"] = {
			["UI"] = {
				["LockWindow"] = false,
			},
			["Channel"] = {
			},
			["SavedTemplates"] = {
			},
			["Security"] = {
				["Player"] = {
				},
				["MinTrustedRank"] = 1,
			},
		},
		["WoWArg_Gilraenloss"] = {
			["AutoSelectPriorityOrder"] = "Date",
			["Channel"] = {
				["Password"] = "mono",
				["AutoConfig"] = false,
				["Name"] = "fenix",
				["GuildAdmin"] = false,
			},
			["UI"] = {
				["LockWindow"] = false,
			},
			["SavedTemplates"] = {
				{
					["mTitle"] = "Prueba",
					["mType"] = "Holiday",
					["mGuild"] = "Orden Fenix",
				}, -- [1]
				{
					["mTitle"] = "Prueva",
					["mType"] = "Holiday",
					["mGuild"] = "Orden Fenix",
				}, -- [2]
				{
					["mDuration"] = 120,
					["mTime"] = 1140,
					["mLimits"] = {
						["mClassLimits"] = {
							["P"] = {
								["mMax"] = 1,
							},
							["S"] = {
								["mMax"] = 1,
							},
							["R"] = {
								["mMax"] = 1,
							},
							["D"] = {
								["mMax"] = 1,
							},
							["W"] = {
								["mMax"] = 1,
							},
							["H"] = {
								["mMax"] = 1,
							},
							["K"] = {
								["mMax"] = 1,
							},
							["M"] = {
								["mMax"] = 1,
							},
							["L"] = {
								["mMax"] = 1,
							},
						},
						["mRoleLimits"] = {
							["MT"] = {
								["mMax"] = 1,
								["mMin"] = 1,
							},
							["MH"] = {
								["mMax"] = 1,
								["mMin"] = 1,
							},
							["MD"] = {
								["mMax"] = 2,
								["mMin"] = 1,
							},
							["RD"] = {
								["mMax"] = 2,
								["mMin"] = 1,
							},
						},
						["mMaxAttendance"] = 5,
					},
					["mType"] = "AzjolNerub",
					["mRoleConfirm"] = true,
				}, -- [3]
			},
			["Security"] = {
				["Player"] = {
				},
				["MinTrustedRank"] = 1,
			},
		},
		["WoWArg_Athari"] = {
			["UI"] = {
				["LockWindow"] = false,
			},
			["Channel"] = {
			},
			["SavedTemplates"] = {
			},
			["Security"] = {
				["Player"] = {
				},
				["MinTrustedRank"] = 1,
			},
		},
		["WoWArg_Acrux"] = {
			["UI"] = {
				["LockWindow"] = false,
			},
			["Security"] = {
				["MinTrustedRank"] = 1,
				["Player"] = {
				},
			},
			["SavedTemplates"] = {
			},
			["Channel"] = {
			},
		},
		["WoWArg_Finweloss"] = {
			["UI"] = {
				["LockWindow"] = false,
			},
			["Security"] = {
				["MinTrustedRank"] = 1,
				["Player"] = {
				},
			},
			["SavedTemplates"] = {
			},
			["Channel"] = {
			},
		},
	},
	["RealmSettings"] = {
		["WoWArg"] = {
			["GuildRanks"] = {
				["The Knights Of The Death"] = {
					"Epico", -- [1]
					"Veterano", -- [2]
					"Miembro", -- [3]
					"Iniciante", -- [4]
					[0] = "Guild Master",
				},
				["Orden Fenix"] = {
					"Consul", -- [1]
					"Maestro", -- [2]
					"Héroe", -- [3]
					"Alt-Senado", -- [4]
					"Campeón", -- [5]
					"Caballero", -- [6]
					"Soldado", -- [7]
					"Alt Aspirante", -- [8]
					"Aspirante", -- [9]
					[0] = "Guild Master",
				},
				["los indigentes"] = {
					" Indi Max.Level", -- [1]
					" Indi.Revered", -- [2]
					" Indi.Exaltado", -- [3]
					" Indi.Honored", -- [4]
					"Indi.Friendly", -- [5]
					"Indi.vicioso", -- [6]
					"Indigente", -- [7]
					"Callejero", -- [8]
					[0] = "Indi.Master",
				},
				["Lobos de Acero"] = {
					"Wolf Master", -- [1]
					"Garra de Acero", -- [2]
					"Garra de Oro", -- [3]
					"Garra de Plata", -- [4]
					"Garra de Bronce", -- [5]
					[0] = "GM",
				},
			},
		},
	},
	["Format"] = 3,
	["DebugSettings"] = {
	},
	["StartOnMonday"] = false,
}
gGroupCalendar_Database = {
	["Format"] = 19,
	["Backups"] = {
		["WoWArg_Gilraenloss"] = {
			{
				["Database"] = {
					["PlayerClassCode"] = "H",
					["Guild"] = "Orden Fenix",
					["PlayerLevel"] = 80,
					["IsPlayerOwned"] = true,
					["UserName"] = "Gilraenloss",
					["LocalUsers"] = {
					},
					["Events"] = {
					},
					["Faction"] = "Alliance",
					["PlayerRaceCode"] = "N",
					["Realm"] = "WoWArg",
					["CurrentEventID"] = 0,
				},
				["DateTimeStamp"] = 357318755,
			}, -- [1]
			{
				["Database"] = {
					["Realm"] = "WoWArg",
					["PlayerClassCode"] = "H",
					["Guild"] = "Orden Fenix",
					["CurrentEventID"] = 0,
					["PlayerLevel"] = 80,
					["PlayerRaceCode"] = "N",
					["Changes"] = {
						["ID"] = 375672043,
						["Revision"] = 0,
						["AuthRevision"] = 0,
						["ChangeList"] = {
						},
					},
					["IsPlayerOwned"] = true,
					["UserName"] = "Gilraenloss",
					["LocalUsers"] = {
					},
					["Events"] = {
					},
					["HighestKnownDatabaseID"] = 375672043,
					["HighestKnownRSVPID"] = 375672044,
					["DefaultRole"] = "RD",
					["Faction"] = "Alliance",
					["RSVPs"] = {
						["ID"] = 375672044,
						["Revision"] = 0,
						["AuthRevision"] = 0,
						["ChangeList"] = {
						},
					},
				},
				["DateTimeStamp"] = 375661438,
			}, -- [2]
		},
	},
	["Databases"] = {
		["WoWArg_Powerpetaca"] = {
			["Guild"] = "Orden Fenix",
			["Changes"] = {
				["ID"] = 362198000,
				["Revision"] = 4,
				["AuthRevision"] = 0,
				["ChangeList"] = {
					{
						"EVT:1/NEW:,4192,1320,120,,", -- [1]
						"EVT:1/TIT:Dia del Freemako", -- [2]
						"EVT:1/DSC:diganle manco a freemansmou!!", -- [3]
						"EVT:1/GLD:Orden Fenix", -- [4]
						"EVT:1/END", -- [5]
					}, -- [1]
					{
						"EVT:1/TIT:Dia del Freemanko", -- [1]
					}, -- [2]
					{
						"EVT:1/ATT:Hellfireorc,4192,13447,S,NR80,,Orden Fenix,3,,,MD", -- [1]
					}, -- [3]
					{
						"EVT:1/DEL", -- [1]
					}, -- [4]
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Powerpetaca",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["Realm"] = "WoWArg",
			["CurrentEventID"] = 0,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 366268679,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Duendee"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365314800,
			["Realm"] = "WoWArg",
			["Changes"] = {
				["ID"] = 364868315,
				["Revision"] = 10,
				["AuthRevision"] = 0,
				["ChangeList"] = {
					{
						"EVT:11/NEW:NaxxH,4214,1380,120,80,", -- [1]
						"EVT:11/TIT:Naxxramas 25", -- [2]
						"EVT:11/GLD:Orden Fenix", -- [3]
						"EVT:11/CNF:ROLE/MAX:25/MT:4,6/MH:4,6/MD:4,14/RD:4,14", -- [4]
						"EVT:11/ATT:Kynky,4214,18943,M,HK80,,Orden Fenix,8,,,RD", -- [5]
						"EVT:11/ATT:Molten,4212,64067,M,AT80,,Orden Fenix,8,,,MD", -- [6]
						"EVT:11/ATT:Felli,4214,68517,M,ND80,,Orden Fenix,7,,,MH", -- [7]
						"EVT:11/END", -- [8]
						"EVT:1/NEW:Birth,4271,,,,", -- [9]
						"EVT:1/TIT:Duendee ", -- [10]
						"EVT:1/END", -- [11]
					}, -- [1]
					{
						"EVT:15/NEW:UlduarH,4228,1380,120,80,", -- [1]
						"EVT:15/GLD:Orden Fenix", -- [2]
						"EVT:15/CNF:ROLE/MAX:25/MT:4,6/MH:4,6/MD:4,14/RD:4,14", -- [3]
						"EVT:15/END", -- [4]
					}, -- [2]
					{
						"EVT:15/ATT:Duendee,4223,69822,Y,DW80,,Orden Fenix,6,,,MD", -- [1]
					}, -- [3]
					{
						"EVT:15/ATT:Felli,4223,71049,Y,ND80,,Orden Fenix,7,,,MH", -- [1]
					}, -- [4]
					{
						"EVT:15/ATT:Ahm,4223,71548,Y,ND80,,Orden Fenix,9,,,MH", -- [1]
					}, -- [5]
					{
						"EVT:15/ATT:Morpheos,4226,70626,M,ND80,,Orden Fenix,9,,,MH", -- [1]
					}, -- [6]
					{
						"EVT:15/DEL", -- [1]
					}, -- [7]
					[9] = {
						"EVT:18/DEL", -- [1]
					},
					[10] = {
						"EVT:19/NEW:,4228,1140,120,,", -- [1]
						"EVT:19/TIT:Ulduar no anda perdon recien me entero &c;!", -- [2]
						"EVT:19/END", -- [3]
					},
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Duendee",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
				[4228] = {
					{
						["mDuration"] = 120,
						["mTime"] = 1140,
						["mTitle"] = "Ulduar no anda perdon recien me entero &c;!",
						["mType"] = "",
						["mDate"] = 4228,
						["mID"] = 19,
					}, -- [1]
				},
				[4271] = {
					{
						["mTitle"] = "Duendee ",
						["mType"] = "Birth",
						["mDate"] = 4271,
						["mID"] = 1,
					}, -- [1]
				},
				[4214] = {
					{
						["mDuration"] = 120,
						["mMinLevel"] = 80,
						["mTime"] = 1380,
						["mType"] = "NaxxH",
						["mAttendance"] = {
							["Kynky"] = "4214,18943,M,HK80,,Orden Fenix,8,,,RD",
							["Molten"] = "4212,64067,M,AT80,,Orden Fenix,8,,,MD",
							["Felli"] = "4214,68517,M,ND80,,Orden Fenix,7,,,MH",
						},
						["mRoleConfirm"] = true,
						["mLimits"] = {
							["mRoleLimits"] = {
								["MT"] = {
									["mMax"] = 6,
									["mMin"] = 4,
								},
								["MH"] = {
									["mMax"] = 6,
									["mMin"] = 4,
								},
								["MD"] = {
									["mMax"] = 14,
									["mMin"] = 4,
								},
								["RD"] = {
									["mMax"] = 14,
									["mMin"] = 4,
								},
							},
							["mMaxAttendance"] = 25,
						},
						["mGuild"] = "Orden Fenix",
						["mTitle"] = "Naxxramas 25",
						["mDate"] = 4214,
						["mID"] = 11,
					}, -- [1]
				},
			},
			["Faction"] = "Alliance",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 19,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 365049030,
				["Revision"] = 0,
				["ChangeList"] = {
				},
				["AuthRevision"] = 0,
			},
		},
		["WoWArg_Rhebekka"] = {
			["Guild"] = "Orden Fenix",
			["Changes"] = {
				["ID"] = 362417911,
				["Revision"] = 2,
				["AuthRevision"] = 0,
				["ChangeList"] = {
					[2] = {
						"EVT:1/DEL", -- [1]
					},
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Rhebekka",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["Realm"] = "WoWArg",
			["CurrentEventID"] = 0,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 366432214,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Dayron"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 364835400,
			["Realm"] = "WoWArg",
			["Changes"] = {
				["ID"] = 362687589,
				["Revision"] = 2,
				["AuthRevision"] = 2,
				["ChangeList"] = {
					[2] = {
						"EVT:63/DEL", -- [1]
					},
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Dayron",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["CurrentEventID"] = 0,
			["HighestKnownRSVPID"] = 364298733,
			["AddonVersion"] = "4.6.1",
			["RSVPs"] = {
				["ID"] = 366742559,
				["Revision"] = 0,
				["ChangeList"] = {
				},
				["AuthRevision"] = 0,
			},
		},
		["WoWArg_Vibeke"] = {
			["Guild"] = "Orden Fenix",
			["Changes"] = {
				["ID"] = 357350736,
				["Revision"] = 10,
				["AuthRevision"] = 0,
				["ChangeList"] = {
					[10] = {
						"EVT:1/DEL", -- [1]
					},
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Vibeke",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["Realm"] = "WoWArg",
			["CurrentEventID"] = 0,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 365137164,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Zoejane"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365186580,
			["IsPlayerOwned"] = false,
			["UserName"] = "Zoejane",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["CurrentEventID"] = 0,
			["AddonVersion"] = "4.6.1",
			["Realm"] = "WoWArg",
		},
		["WoWArg_Gilraenloss"] = {
			["RSVPs"] = {
				["ID"] = 375672044,
				["Revision"] = 0,
				["ChangeList"] = {
				},
				["AuthRevision"] = 0,
			},
			["PlayerClassCode"] = "H",
			["Guild"] = "Orden Fenix",
			["HighestKnownDatabaseID"] = 375672043,
			["PlayerLevel"] = 80,
			["DefaultRole"] = "RD",
			["Changes"] = {
				["ID"] = 375672043,
				["Revision"] = 0,
				["ChangeList"] = {
				},
				["AuthRevision"] = 0,
			},
			["IsPlayerOwned"] = true,
			["UserName"] = "Gilraenloss",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["HighestKnownRSVPID"] = 375672044,
			["PlayerRaceCode"] = "N",
			["CurrentEventID"] = 3,
			["Realm"] = "WoWArg",
		},
		["WoWArg_Snoops"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365185020,
			["Realm"] = "WoWArg",
			["Changes"] = {
				["ID"] = 357711148,
				["Revision"] = 27,
				["AuthRevision"] = 16,
				["ChangeList"] = {
					nil, -- [1]
					nil, -- [2]
					nil, -- [3]
					nil, -- [4]
					{
						"EVT:2/DEL", -- [1]
					}, -- [5]
					{
						"EVT:22/NEW:Ulduar,4217,1380,180,80,", -- [1]
						"EVT:22/TIT:Ulduar 10", -- [2]
						"EVT:22/GLD:Orden Fenix", -- [3]
						"EVT:22/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/MD:2,3/RD:2,3", -- [4]
						"EVT:22/END", -- [5]
					}, -- [6]
					{
						"EVT:22/ATT:Eyeeagle,4217,72386,Y,NH80,,Orden Fenix,8,,,RD", -- [1]
					}, -- [7]
					{
						"EVT:22/ATT:Snops,4217,72439,Y,HL80,,Orden Fenix,8,,,MT", -- [1]
					}, -- [8]
					{
						"EVT:22/ATT:Guze,4217,73344,M,HL80,,Orden Fenix,7,,,MT", -- [1]
					}, -- [9]
					nil, -- [10]
					{
						"EVT:25/NEW:Ulduar,4223,1380,180,80,", -- [1]
						"EVT:25/TIT:Ulduar 10", -- [2]
						"EVT:25/DSC:lo mas completa posible", -- [3]
						"EVT:25/GLD:Orden Fenix", -- [4]
						"EVT:25/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/MD:2,3/RD:2,3", -- [5]
						"EVT:25/END", -- [6]
					}, -- [11]
					{
						"EVT:25/ATT:Noxfeld,4223,63074,M,AT80,,Orden Fenix,8,,,MD", -- [1]
					}, -- [12]
					{
						"EVT:26/NEW:Obsidian,4225,720,180,80,", -- [1]
						"EVT:26/TIT:Obsi y Malygos 25", -- [2]
						"EVT:26/DSC:con 3 drakos para recordar los viejos tiempos &cn;D", -- [3]
						"EVT:26/GLD:Orden Fenix", -- [4]
						"EVT:26/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/MD:2,3/RD:2,3", -- [5]
						"EVT:26/END", -- [6]
					}, -- [13]
					{
						"EVT:26/ATT:Lamagablanca,4225,62631,N,HP80,,Orden Fenix,6,,,RD", -- [1]
					}, -- [14]
					{
						"EVT:26/ATT:Antaryus,4225,86349,Y,NW80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [15]
					{
						"EVT:26/ATT:Molten,4225,62614,Y,AT80,,Orden Fenix,6,,,MD", -- [1]
					}, -- [16]
					{
						"EVT:22/DEL", -- [1]
					}, -- [17]
					[26] = {
						"EVT:34/ATT:Snoops,4257,61272,Y,ND80,,Orden Fenix,8,,,MH", -- [1]
					},
					[23] = {
						"EVT:26/DEL", -- [1]
					},
					[27] = {
						"EVT:34/DEL", -- [1]
					},
					[24] = {
						"EVT:29/DEL", -- [1]
					},
					[25] = {
						"EVT:34/NEW:Ulduar,4257,1380,120,80,", -- [1]
						"EVT:34/DSC:hard", -- [2]
						"EVT:34/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/MD:2,3/RD:2,3", -- [3]
						"EVT:34/END", -- [4]
					},
					[22] = {
						"EVT:25/DEL", -- [1]
					},
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Snoops",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["CurrentEventID"] = 26,
			["HighestKnownRSVPID"] = 364298733,
			["AddonVersion"] = "4.6.1",
			["RSVPs"] = {
				["ID"] = 366268679,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Danrru"] = {
			["Guild"] = "Orden Fenix",
			["Changes"] = {
				["ID"] = 365977179,
				["Revision"] = 9,
				["ChangeList"] = {
					[5] = {
						"EVT:4/DEL", -- [1]
					},
					[9] = {
						"EVT:3/DEL", -- [1]
					},
				},
				["AuthRevision"] = 0,
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Danrru",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["CurrentEventID"] = 0,
			["Realm"] = "WoWArg",
		},
		["WoWArg_Finweloss"] = {
			["PlayerClassCode"] = "R",
			["Guild"] = "los indigentes",
			["PlayerLevel"] = 10,
			["RSVPs"] = {
				["ID"] = 364446490,
				["Revision"] = 0,
				["ChangeList"] = {
				},
				["AuthRevision"] = 0,
			},
			["IsPlayerOwned"] = true,
			["UserName"] = "Finweloss",
			["LocalUsers"] = {
				["Finweloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["HighestKnownRSVPID"] = 364446490,
			["PlayerRaceCode"] = "N",
			["Realm"] = "WoWArg",
			["CurrentEventID"] = 0,
		},
		["WoWArg_Zomb"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 364437780,
			["CurrentEventID"] = 0,
			["IsPlayerOwned"] = false,
			["UserName"] = "Zomb",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["AddonVersion"] = "4.6.1",
			["Realm"] = "WoWArg",
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 364618639,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Rize"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 364780620,
			["IsPlayerOwned"] = false,
			["UserName"] = "Rize",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["CurrentEventID"] = 0,
			["AddonVersion"] = "4.6.1",
			["Realm"] = "WoWArg",
		},
		["WoWArg_Uzu"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365194140,
			["IsPlayerOwned"] = false,
			["UserName"] = "Uzu",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["CurrentEventID"] = 0,
			["AddonVersion"] = "4.6.1",
			["Realm"] = "WoWArg",
		},
		["WoWArg_Tartanarmy"] = {
			["Guild"] = "Orden Fenix",
			["Changes"] = {
				["ID"] = 357592003,
				["Revision"] = 69,
				["AuthRevision"] = 0,
				["ChangeList"] = {
					nil, -- [1]
					nil, -- [2]
					{
						"EVT:1/DEL", -- [1]
					}, -- [3]
					{
						"EVT:10/NEW:Naxx,4155,1140,120,80,", -- [1]
						"EVT:10/TIT:Naxxramas 10", -- [2]
						"EVT:10/DSC:COMPLETITA", -- [3]
						"EVT:10/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/MD:2,3/RD:2,3", -- [4]
						"EVT:10/END", -- [5]
					}, -- [4]
					{
						"EVT:17/NEW:,4165,1260,360,,", -- [1]
						"EVT:17/TIT:Naxx 25 COMPLETILLA", -- [2]
						"EVT:17/DSC:con tiempo&c; el qeu se va es puto....", -- [3]
						"EVT:17/GLD:Orden Fenix", -- [4]
						"EVT:17/END", -- [5]
					}, -- [5]
					{
						"EVT:17/ATT:Khiva,4162,60968,S,AH80,,Orden Fenix,8,,,RD", -- [1]
					}, -- [6]
					{
						"EVT:17/ATT:Papashango,4162,19421,M,HW80,,Orden Fenix,4,,,MT", -- [1]
					}, -- [7]
					{
						"EVT:17/ATT:Freemansmou,4163,14430,S,HL80,,Orden Fenix,2,,,MT", -- [1]
					}, -- [8]
					{
						"EVT:17/ATT:Apolex,4163,50410,M,HM80,,Orden Fenix,3,,,RD", -- [1]
					}, -- [9]
					{
						"EVT:17/ATT:Kynky,4164,55526,M,HK80,,Orden Fenix,8,,,RD", -- [1]
					}, -- [10]
					{
						"EVT:17/ATT:Zeleuz,4165,76676,M,DL80,,Orden Fenix,4,,,RD", -- [1]
					}, -- [11]
					{
						"EVT:23/NEW:Ulduar,4170,1380,120,80,", -- [1]
						"EVT:23/TIT:Ulduar CONCIENTE (10)", -- [2]
						"EVT:23/DSC:nos  eanoten por anotar&c; no ocupen slots que ya estan&c; un solo verde va por uldu.", -- [3]
						"EVT:23/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/MD:2,3/RD:2,3", -- [4]
						"EVT:23/END", -- [5]
					}, -- [12]
					{
						"EVT:23/DSC:no se anoten por anotar&c; no ocupen slots que ya estan&c; un solo verde va por uldu.", -- [1]
					}, -- [13]
					{
						"EVT:23/ATT:Freemansmou,4166,16697,Y,HL80,,Orden Fenix,2,,,MT", -- [1]
					}, -- [14]
					{
						"EVT:24/NEW:Ulduar,4171,1380,120,80,", -- [1]
						"EVT:24/TIT:Ulduar HARD (intentos) 10", -- [2]
						"EVT:24/DSC:solo para pjs pijudos que tan re armados", -- [3]
						"EVT:24/GLD:Orden Fenix", -- [4]
						"EVT:24/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/MD:2,3/RD:2,3", -- [5]
						"EVT:24/END", -- [6]
					}, -- [15]
					{
						"EVT:24/ATT:Elsinguild,4166,64840,Y,HP80,,Orden Fenix,8,,,RD", -- [1]
					}, -- [16]
					{
						"EVT:23/ATT:Khiva,4166,70740,M,AH80,,Orden Fenix,1,,,RD", -- [1]
					}, -- [17]
					{
						"EVT:23/ATT:Darkcaster,4166,72748,Y,AM80,,Orden Fenix,1,,,RD", -- [1]
					}, -- [18]
					{
						"EVT:23/ATT:Khiva,4166,70740,Y,AH80,,Orden Fenix,1,,,RD", -- [1]
					}, -- [19]
					{
						"EVT:23/ATT:Freemansmou,4166,16697,Y,HL80,,Orden Fenix,2,,,MT", -- [1]
					}, -- [20]
					{
						"EVT:23/ATT:Khiva,4166,73206,M,AH80,,Orden Fenix,1,,,RD", -- [1]
					}, -- [21]
					{
						"EVT:23/ATT:Tartanarmy,4166,73224,Y,AL80,,Orden Fenix,8,,,MT", -- [1]
					}, -- [22]
					{
						"EVT:23/ATT:Khiva,4166,73206,Y,AH80,,Orden Fenix,1,,,RD", -- [1]
					}, -- [23]
					{
						"EVT:24/ATT:Apolex,4166,74045,N,HM80,Los viernes son jodidos&c; chau,Orden Fenix,8,,,RD", -- [1]
					}, -- [24]
					{
						"EVT:23/ATT:Apolex,4166,74073,Y,HM80,Presente,Orden Fenix,8,,,RD", -- [1]
					}, -- [25]
					{
						"EVT:23/ATT:Khiva,4166,74050,M,AH80,,Orden Fenix,1,,,RD", -- [1]
					}, -- [26]
					{
						"EVT:23/ATT:Freemansmou,4166,16697,Y,HL80,,Orden Fenix,2,4166,16697,MT", -- [1]
					}, -- [27]
					{
						"EVT:24/ATT:Tailung,4167,130,Y,NW80,,Orden Fenix,8,,,MT", -- [1]
					}, -- [28]
					{
						"EVT:23/ATT:Kinki,4167,165,Y,GT80,,Orden Fenix,8,,,MD", -- [1]
					}, -- [29]
					{
						"EVT:24/ATT:Apolex,4166,74045,Y,HM80,Los viernes son jodidos&c; chau,Orden Fenix,8,,,RD", -- [1]
					}, -- [30]
					{
						"EVT:24/ATT:Apolex,4166,74045,M,HM80,Los viernes son jodidos&c; chau,Orden Fenix,8,,,RD", -- [1]
					}, -- [31]
					{
						"EVT:23/ATT:Antare,4167,8890,Y,AS80,,Orden Fenix,2,,,MH", -- [1]
					}, -- [32]
					{
						"EVT:24/ATT:Uzumakinarut,4167,9327,M,NP80,puede q si,Orden Fenix,4,,,RD", -- [1]
					}, -- [33]
					{
						"EVT:24/ATT:Antaryus,4167,63636,Y,NW80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [34]
					{
						"EVT:24/ATT:Apolex,4167,52270,N,HM80,Los viernes son jodidos&c; chau,Orden Fenix,8,,,RD", -- [1]
					}, -- [35]
					{
						"EVT:23/ATT:Dayron,4167,83204,Y,HL80,,Orden Fenix,6,,,MD", -- [1]
					}, -- [36]
					{
						"EVT:23/ATT:Uzumakinarut,4168,6405,M,NP80,,Orden Fenix,4,,,RD", -- [1]
					}, -- [37]
					{
						"EVT:23/ATT:Freemansmou,4169,67979,C,HL80,,Orden Fenix,2,,,MT", -- [1]
					}, -- [38]
					{
						"EVT:24/ATT:Freemansmou,4169,67989,Y,HL80,,Orden Fenix,2,,,MT", -- [1]
					}, -- [39]
					{
						"EVT:10/DEL", -- [1]
					}, -- [40]
					{
						"EVT:23/ATT:Apolex,4170,50393,N,HM80,,Orden Fenix,3,,,RD", -- [1]
					}, -- [41]
					{
						"EVT:23/ATT:Hellfireorc,4170,73399,Y,NR80,,Orden Fenix,3,,,MD", -- [1]
					}, -- [42]
					{
						"EVT:23/ATT:Papashango,4169,15571,Y,HW80,,Orden Fenix,4,,,MT", -- [1]
					}, -- [43]
					{
						"EVT:24/ATT:Papashango,4170,11578,S,HW80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [44]
					{
						"EVT:23/ATT:Papashango,4169,15571,S,HW80,,Orden Fenix,4,,,MT", -- [1]
					}, -- [45]
					{
						"EVT:24/ATT:Uzumakinarut,4167,9327,N,NP80,puede q si,Orden Fenix,4,,,RD", -- [1]
					}, -- [46]
					{
						"EVT:24/ATT:Khiva,4171,72629,Y,AH80,,Orden Fenix,1,,,RD", -- [1]
					}, -- [47]
					{
						"EVT:24/ATT:Pegason,4171,80321,Y,HM80,,Orden Fenix,4,,,RD", -- [1]
					}, -- [48]
					{
						"EVT:17/DEL", -- [1]
					}, -- [49]
					nil, -- [50]
					{
						"EVT:35/DEL", -- [1]
					}, -- [51]
					{
						"EVT:36/NEW:Ulduar,4186,1320,240,80,", -- [1]
						"EVT:36/TIT:Ulduar CON HARDS INCLUIDOS", -- [2]
						"EVT:36/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/MD:2,3/RD:2,3", -- [3]
						"EVT:36/END", -- [4]
					}, -- [52]
					{
						"EVT:36/ATT:Tailung,4183,15567,Y,NW80,,Orden Fenix,8,,,MT", -- [1]
					}, -- [53]
					{
						"EVT:36/ATT:Elsinguild,4183,15615,Y,HP80,,Orden Fenix,8,,,RD", -- [1]
					}, -- [54]
					{
						"EVT:36/ATT:Kinki,4183,15622,M,GT80,,Orden Fenix,8,,,MD", -- [1]
					}, -- [55]
					{
						"EVT:36/ATT:Freemansmou,4183,15549,Y,HL80,,Orden Fenix,2,,,MT", -- [1]
					}, -- [56]
					{
						"EVT:36/ATT:Hellfireorc,4183,74064,Y,NR80,Fasooo para Helffiiii,Orden Fenix,8,,,MD", -- [1]
					}, -- [57]
					{
						"EVT:36/ATT:Edanor,4183,69967,Y,AS80,,Orden Fenix,0,,,MH", -- [1]
					}, -- [58]
					{
						"EVT:36/ATT:Antaryus,4184,5343,Y,NW80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [59]
					{
						"EVT:36/ATT:Sledgehammer,4183,75825,S,HL80,,Orden Fenix,2,,,MT", -- [1]
					}, -- [60]
					nil, -- [61]
					{
						"EVT:36/ATT:Tailung,4184,83933,N,NW80,,Orden Fenix,1,,,MT", -- [1]
					}, -- [62]
					{
						"EVT:23/DEL", -- [1]
					}, -- [63]
					{
						"EVT:24/DEL", -- [1]
					}, -- [64]
					{
						"EVT:36/ATT:Antare,4186,52203,Y,AS80,,Orden Fenix,8,,,MH", -- [1]
					}, -- [65]
					{
						"EVT:36/ATT:Pegason,4186,69282,Y,HM80,asdasd,Orden Fenix,4,,,RD", -- [1]
					}, -- [66]
					{
						"EVT:36/ATT:Shiffu,4186,52210,Y,NP80,,Orden Fenix,8,,,MH", -- [1]
					}, -- [67]
					{
						"EVT:36/ATT:Antare,4186,52203,N,AS80,,Orden Fenix,8,,,MH", -- [1]
					}, -- [68]
					{
						"EVT:36/DEL", -- [1]
					}, -- [69]
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Tartanarmy",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["Realm"] = "WoWArg",
			["CurrentEventID"] = 0,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 365140484,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Eyeeagle"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365314800,
			["Realm"] = "WoWArg",
			["Changes"] = {
				["ID"] = 366176632,
				["Revision"] = 5,
				["AuthRevision"] = 0,
				["ChangeList"] = {
					nil, -- [1]
					nil, -- [2]
					nil, -- [3]
					nil, -- [4]
					{
						"EVT:2/DEL", -- [1]
					}, -- [5]
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Eyeeagle",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["CurrentEventID"] = 6,
			["HighestKnownRSVPID"] = 364298733,
			["AddonVersion"] = "4.6.1",
			["RSVPs"] = {
				["ID"] = 369023554,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Lamagablanca"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365192700,
			["IsPlayerOwned"] = false,
			["UserName"] = "Lamagablanca",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["CurrentEventID"] = 0,
			["AddonVersion"] = "4.6.1",
			["Realm"] = "WoWArg",
			["RSVPs"] = {
				["ID"] = 366233376,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Revenant"] = {
			["Guild"] = "Orden Fenix",
			["IsPlayerOwned"] = false,
			["UserName"] = "Revenant",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["RSVPs"] = {
				["ID"] = 357711958,
				["Revision"] = 1,
				["ChangeList"] = {
					{
						"EVT:Snops,3,4140,6448,N,HM80,,Orden Fenix,3,RD", -- [1]
					}, -- [1]
				},
				["AuthRevision"] = 0,
			},
			["CurrentEventID"] = 0,
			["Realm"] = "WoWArg",
		},
		["WoWArg_Plumber"] = {
			["Guild"] = "Orden Fenix",
			["Changes"] = {
				["ID"] = 371353567,
				["Revision"] = 3,
				["ChangeList"] = {
					{
						"EVT:59/NEW:Naxx,4298,1140,120,80,", -- [1]
						"EVT:59/DSC:Los que se puedan copar&c; por favor sumense.", -- [2]
						"EVT:59/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/MD:2,3/RD:2,3", -- [3]
						"EVT:59/END", -- [4]
					}, -- [1]
					{
						"EVT:59/ATT:Plumber,4297,82114,Y,NT80,,Orden Fenix,8,,,MT", -- [1]
					}, -- [2]
					{
						"EVT:59/DEL", -- [1]
					}, -- [3]
				},
				["AuthRevision"] = 0,
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Plumber",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["CurrentEventID"] = 0,
			["Realm"] = "WoWArg",
		},
		["WoWArg_Glistair"] = {
			["Guild"] = "Orden Fenix",
			["Changes"] = {
				["ID"] = 357323715,
				["Revision"] = 19,
				["AuthRevision"] = 0,
				["ChangeList"] = {
					[18] = {
						"EVT:2/DEL", -- [1]
					},
					[19] = {
						"EVT:3/DEL", -- [1]
					},
					[12] = {
						"EVT:1/DEL", -- [1]
					},
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Glistair",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["Realm"] = "WoWArg",
			["CurrentEventID"] = 0,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 365307959,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Kynky"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 364780440,
			["Realm"] = "WoWArg",
			["Changes"] = {
				["ID"] = 359012604,
				["Revision"] = 26,
				["AuthRevision"] = 26,
				["ChangeList"] = {
					[26] = {
						"EVT:3/DEL", -- [1]
					},
					[25] = {
						"EVT:28/DEL", -- [1]
					},
					[10] = {
						"EVT:2/DEL", -- [1]
					},
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Kynky",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["CurrentEventID"] = 0,
			["HighestKnownRSVPID"] = 364298733,
			["AddonVersion"] = "4.6.1",
			["RSVPs"] = {
				["ID"] = 366351549,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Tailung"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365185020,
			["CurrentEventID"] = 0,
			["Changes"] = {
				["ID"] = 357444043,
				["Revision"] = 72,
				["ChangeList"] = {
					nil, -- [1]
					nil, -- [2]
					{
						"EVT:1/DEL", -- [1]
					}, -- [3]
					nil, -- [4]
					nil, -- [5]
					nil, -- [6]
					nil, -- [7]
					{
						"EVT:3/NEW:DoomWalker,4140,1140,120,,", -- [1]
						"EVT:3/END", -- [2]
					}, -- [8]
					{
						"EVT:3/UPD:DoomWalker,4140,120,120,1,80", -- [1]
						"EVT:3/END", -- [2]
					}, -- [9]
					{
						"EVT:3/ATT:Tailung,4140,4397,S,NW80,,Orden Fenix,2,,,MT", -- [1]
					}, -- [10]
					{
						"EVT:3/ATT:Pegason,4140,4488,S,HM80,,Orden Fenix,4,,,RD", -- [1]
					}, -- [11]
					{
						"EVT:3/ATT:Shiffu,4140,4487,S,NP80,,Orden Fenix,3,,,MH", -- [1]
					}, -- [12]
					{
						"EVT:3/ATT:Elsinguild,4140,4598,S,HP80,voy&c; pero no mankeen,Orden Fenix,4,,,MH", -- [1]
					}, -- [13]
					{
						"EVT:3/ATT:Zerathon,4140,4557,S,HM80,,Orden Fenix,4,,,RD", -- [1]
					}, -- [14]
					{
						"EVT:3/ATT:Zerathon,4140,4594,S,HM80,lees el comentario tai?,Orden Fenix,4,4140,4557,RD", -- [1]
					}, -- [15]
					{
						"EVT:3/ATT:Revenant,4140,4728,S,HM80,LTA!!!!!! WTF???,Orden Fenix,3,,,RD", -- [1]
					}, -- [16]
					{
						"EVT:3/ATT:Bolt,4140,4715,S,GM80,,Orden Fenix,8,,,RD", -- [1]
					}, -- [17]
					{
						"EVT:3/ATT:Shiffu,4140,4487,Y,NP80,,Orden Fenix,3,,,MH", -- [1]
					}, -- [18]
					{
						"EVT:3/ATT:Pegason,4140,4488,Y,HM80,,Orden Fenix,4,,,RD", -- [1]
					}, -- [19]
					{
						"EVT:3/ATT:Zerathon,4140,4594,Y,HM80,lees el comentario tai?,Orden Fenix,4,4140,4557,RD", -- [1]
					}, -- [20]
					{
						"EVT:3/ATT:Tailung,4140,4397,Y,NW80,,Orden Fenix,2,,,MT", -- [1]
					}, -- [21]
					{
						"EVT:3/ATT:Elsinguild,4140,4598,Y,HP80,voy&c; pero no mankeen,Orden Fenix,4,,,MH", -- [1]
					}, -- [22]
					{
						"EVT:3/ATT:Revenant,4140,4728,Y,HM80,LTA!!!!!! WTF???,Orden Fenix,3,,,RD", -- [1]
					}, -- [23]
					{
						"EVT:3/ATT:Bolt,4140,4715,Y,GM80,,Orden Fenix,8,,,RD", -- [1]
					}, -- [24]
					{
						"EVT:3/ATT:Snops,4140,4680,M,HL80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [25]
					{
						"EVT:3/ATT:Snoops,4140,5159,M,ND80,,Orden Fenix,3,,,MH", -- [1]
					}, -- [26]
					{
						"EVT:3/ATT:Snoops,4140,6377,M,ND80,,Orden Fenix,3,,,MH", -- [1]
					}, -- [27]
					{
						"EVT:3/DEL", -- [1]
					}, -- [28]
					[72] = {
						"EVT:6/DEL", -- [1]
					},
					[35] = {
						"EVT:4/DEL", -- [1]
					},
					[34] = {
						"EVT:2/DEL", -- [1]
					},
					[71] = {
						"EVT:5/DEL", -- [1]
					},
				},
				["AuthRevision"] = 72,
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Tailung",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["Realm"] = "WoWArg",
			["HighestKnownRSVPID"] = 364298733,
			["AddonVersion"] = "4.6.1",
			["RSVPs"] = {
				["ID"] = 371355549,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Antare"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365314800,
			["Realm"] = "WoWArg",
			["Changes"] = {
				["ID"] = 358360732,
				["Revision"] = 24,
				["AuthRevision"] = 24,
				["ChangeList"] = {
					[12] = {
						"EVT:1/DEL", -- [1]
					},
					[24] = {
						"EVT:2/DEL", -- [1]
					},
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Antare",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 0,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 365137164,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Athari"] = {
			["PlayerClassCode"] = "K",
			["Guild"] = "Lobos de Acero",
			["PlayerLevel"] = 1,
			["RSVPs"] = {
				["ID"] = 364446490,
				["Revision"] = 0,
				["ChangeList"] = {
				},
				["AuthRevision"] = 0,
			},
			["IsPlayerOwned"] = true,
			["UserName"] = "Athari",
			["LocalUsers"] = {
				["Athari"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["HighestKnownRSVPID"] = 364446490,
			["PlayerRaceCode"] = "H",
			["CurrentEventID"] = 0,
			["Realm"] = "WoWArg",
		},
		["WoWArg_Apolex"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365194140,
			["IsPlayerOwned"] = false,
			["UserName"] = "Apolex",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["Realm"] = "WoWArg",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 0,
		},
		["WoWArg_Guze"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 364833960,
			["IsPlayerOwned"] = false,
			["UserName"] = "Guze",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["Realm"] = "WoWArg",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 0,
		},
		["WoWArg_Hellfireorc"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365307300,
			["Realm"] = "WoWArg",
			["Changes"] = {
				["ID"] = 360909734,
				["Revision"] = 64,
				["AuthRevision"] = 63,
				["ChangeList"] = {
					[57] = {
						"EVT:190/ATT:Uzumakinarut,4226,3143,Y,NP80,,Orden Fenix,4,,,MH", -- [1]
					},
					[58] = {
						"EVT:190/ATT:Apolex,4226,3792,M,HM80,,Orden Fenix,3,,,RD", -- [1]
					},
					[59] = {
						"EVT:190/ATT:Senarion,4226,46317,Y,ND80,,Orden Fenix,7,,,MT", -- [1]
					},
					[60] = {
						"EVT:190/ATT:Apolex,4226,56505,Y,HM80,Veo en el momento con qué pj&c; quisiera dk &cn;D,Orden Fenix,3,,,RD", -- [1]
					},
					[61] = {
						"EVT:190/ATT:Snoops,4226,59548,M,ND80,,Orden Fenix,3,,,MH", -- [1]
					},
					[62] = {
						"EVT:190/ATT:Morpheos,4226,70608,M,ND80,,Orden Fenix,9,,,MH", -- [1]
					},
					[16] = {
						"EVT:55/DEL", -- [1]
					},
					[41] = {
						"EVT:71/DEL", -- [1]
					},
					[22] = {
						"EVT:97/DEL", -- [1]
					},
					[64] = {
						"EVT:190/DEL", -- [1]
					},
					[49] = {
						"EVT:171/DEL", -- [1]
					},
					[50] = {
						"EVT:172/DEL", -- [1]
					},
					[51] = {
						"EVT:190/NEW:Ulduar,4226,1320,120,80,", -- [1]
						"EVT:190/TIT:Ulduar HARD mode", -- [2]
						"EVT:190/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/MD:2,3/RD:2,3", -- [3]
						"EVT:190/END", -- [4]
					},
					[52] = {
						"EVT:190/ATT:Rhebekka,4225,73445,Y,HM80,,Orden Fenix,6,,,RD", -- [1]
					},
					[53] = {
						"EVT:190/ATT:Dayron,4225,79276,Y,HL80,,Orden Fenix,3,,,MD", -- [1]
					},
					[54] = {
						"EVT:190/ATT:Dayron,4225,79293,C,HL80,,Orden Fenix,3,,,MD", -- [1]
					},
					[55] = {
						"EVT:190/ATT:Antaryus,4225,86338,Y,NW80,,Orden Fenix,3,,,MT", -- [1]
					},
					[56] = {
						"EVT:190/ATT:Tartanarmy,4226,3118,Y,AL80,,Orden Fenix,3,,,MT", -- [1]
					},
					[63] = {
						"EVT:190/ATT:Morpheos,4226,70608,C,ND80,,Orden Fenix,9,,,MH", -- [1]
					},
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Hellfireorc",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 190,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 366268679,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Stganimrod"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365311980,
			["CurrentEventID"] = 19,
			["Changes"] = {
				["ID"] = 358673632,
				["Revision"] = 12,
				["AuthRevision"] = 12,
				["ChangeList"] = {
					nil, -- [1]
					{
						"EVT:1/DEL", -- [1]
					}, -- [2]
					{
						"EVT:6/NEW:,4167,1380,120,,", -- [1]
						"EVT:6/TIT:Arenas 5v5 TROLOS", -- [2]
						"EVT:6/DSC:A ver is se prender para las arenas 5v5 los que estan en los teams", -- [3]
						"EVT:6/END", -- [4]
					}, -- [3]
					{
						"EVT:6/ATT:Antaryus,4167,61060,S,NW80,no tengo si me meten a uno voy,Orden Fenix,3,,,MT", -- [1]
					}, -- [4]
					{
						"EVT:6/ATT:Antaryus,4167,61123,S,NW80,no tengo si me meten a uno voy,Orden Fenix,3,4167,61060,MT", -- [1]
					}, -- [5]
					{
						"EVT:6/DEL", -- [1]
					}, -- [6]
					{
						"EVT:18/NEW:Meet,4203,1140,120,,", -- [1]
						"EVT:18/TIT:Sobenla giles", -- [2]
						"EVT:18/DSC:cito a todos los mancos a que me la soben todo el dia", -- [3]
						"EVT:18/END", -- [4]
					}, -- [7]
					{
						"EVT:18/ATT:Sticky,4199,42559,Y,AL80,,Orden Fenix,9,,,MD", -- [1]
					}, -- [8]
					{
						"EVT:18/ATT:Sticky,4199,42659,Y,AL80,,Orden Fenix,9,,,MH", -- [1]
					}, -- [9]
					{
						"EVT:18/UPD:Birth,4203,,,,", -- [1]
						"EVT:18/TIT:Soplen la vela putos", -- [2]
						"EVT:18/END", -- [3]
					}, -- [10]
					{
						"EVT:19/NEW:Birth,4569,,,,", -- [1]
						"EVT:19/TIT:Soplen la vela putos", -- [2]
						"EVT:19/DSC:cito a todos los mancos a que me la soben todo el dia", -- [3]
						"EVT:19/ATT:Sticky,4199,42659,Y,AL80,,Orden Fenix,9,,,MH", -- [4]
						"EVT:19/END", -- [5]
					}, -- [11]
					{
						"EVT:18/DEL", -- [1]
					}, -- [12]
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Stganimrod",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
				[4569] = {
					{
						["mTitle"] = "Soplen la vela putos",
						["mAttendance"] = {
							["Sticky"] = "4199,42659,Y,AL80,,Orden Fenix,9,,,MH",
						},
						["mDescription"] = "cito a todos los mancos a que me la soben todo el dia",
						["mDate"] = 4569,
						["mType"] = "Birth",
						["mID"] = 19,
					}, -- [1]
				},
			},
			["Faction"] = "Alliance",
			["AddonVersion"] = "4.6.1",
			["Realm"] = "WoWArg",
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 366432214,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Bolt"] = {
			["Guild"] = "Orden Fenix",
			["Changes"] = {
				["ID"] = 357711344,
				["Revision"] = 8,
				["AuthRevision"] = 0,
				["ChangeList"] = {
					{
						"EVT:1/NEW:,4143,1380,240,80,", -- [1]
						"EVT:1/TIT:Ulduar(10)", -- [2]
						"EVT:1/END", -- [3]
					}, -- [1]
					{
						"EVT:1/ATT:Bolt,4140,4601,S,GM80,,Orden Fenix,8,,,RD", -- [1]
					}, -- [2]
					{
						"EVT:1/ATT:Revenant,4140,5081,S,HM80,Fireballin' M.A.G.E.,Orden Fenix,3,,,RD", -- [1]
					}, -- [3]
					{
						"EVT:1/ATT:Zerathon,4140,5359,S,HM80,,Orden Fenix,4,,,RD", -- [1]
					}, -- [4]
					{
						"EVT:1/ATT:Zerathon,4140,6485,S,HM80,Llevo Brounis de marihuana,Orden Fenix,4,4140,5359,RD", -- [1]
					}, -- [5]
					{
						"EVT:1/ATT:Tailung,4142,59289,N,NW80,,Orden Fenix,8,,,MT", -- [1]
					}, -- [6]
					{
						"EVT:1/ATT:Snops,4143,85182,M,HL80,con el pala,Orden Fenix,3,,,MT", -- [1]
					}, -- [7]
					{
						"EVT:1/DEL", -- [1]
					}, -- [8]
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Bolt",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["Realm"] = "WoWArg",
			["CurrentEventID"] = 0,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 365307959,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Nigthcrow"] = {
			["PlayerClassCode"] = "D",
			["Guild"] = "The Knights Of The Death",
			["PlayerLevel"] = 19,
			["RSVPs"] = {
				["ID"] = 364446490,
				["Revision"] = 0,
				["ChangeList"] = {
				},
				["AuthRevision"] = 0,
			},
			["IsPlayerOwned"] = true,
			["UserName"] = "Nigthcrow",
			["LocalUsers"] = {
				["Nigthcrow"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["HighestKnownRSVPID"] = 364446490,
			["PlayerRaceCode"] = "N",
			["CurrentEventID"] = 0,
			["Realm"] = "WoWArg",
		},
		["WoWArg_Felli"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365309460,
			["IsPlayerOwned"] = false,
			["UserName"] = "Felli",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["RSVPs"] = {
				["ID"] = 372472460,
				["Revision"] = 0,
				["ChangeList"] = {
				},
				["AuthRevision"] = 0,
			},
			["Realm"] = "WoWArg",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 0,
		},
		["WoWArg_Shiffu"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 364439340,
			["Realm"] = "WoWArg",
			["Changes"] = {
				["ID"] = 358322006,
				["Revision"] = 2,
				["AuthRevision"] = 2,
				["ChangeList"] = {
					[2] = {
						"EVT:1/DEL", -- [1]
					},
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Shiffu",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 0,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 365307959,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Morpheos"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 364437900,
			["IsPlayerOwned"] = false,
			["UserName"] = "Morpheos",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["Realm"] = "WoWArg",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 0,
			["RSVPs"] = {
				["ID"] = 366165093,
				["Revision"] = 1,
				["ChangeList"] = {
					{
						"EVT:Duendee,14,4237,77493,M,ND80,,Orden Fenix,9,MH", -- [1]
					}, -- [1]
				},
				["AuthRevision"] = 0,
			},
		},
		["WoWArg_Ollivander"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365314800,
			["IsPlayerOwned"] = false,
			["UserName"] = "Ollivander",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["Realm"] = "WoWArg",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 0,
		},
		["WoWArg_Acrux"] = {
			["PlayerClassCode"] = "S",
			["PlayerLevel"] = 10,
			["RSVPs"] = {
				["ID"] = 364446490,
				["Revision"] = 0,
				["ChangeList"] = {
				},
				["AuthRevision"] = 0,
			},
			["IsPlayerOwned"] = true,
			["UserName"] = "Acrux",
			["LocalUsers"] = {
				["Acrux"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["HighestKnownRSVPID"] = 364446490,
			["PlayerRaceCode"] = "A",
			["Realm"] = "WoWArg",
			["CurrentEventID"] = 0,
		},
		["WoWArg_Kinki"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 364560600,
			["Realm"] = "WoWArg",
			["Changes"] = {
				["ID"] = 357338468,
				["Revision"] = 8,
				["AuthRevision"] = 8,
				["ChangeList"] = {
					[4] = {
						"EVT:1/DEL", -- [1]
					},
					[8] = {
						"EVT:5/DEL", -- [1]
					},
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Kinki",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 0,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 366432214,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Natsume"] = {
			["Guild"] = "Orden Fenix",
			["Changes"] = {
				["ID"] = 363164362,
				["Revision"] = 17,
				["AuthRevision"] = 0,
				["ChangeList"] = {
					{
						"EVT:7/NEW:Ulduar,4212,1410,360,80,", -- [1]
						"EVT:7/DSC:me pueden sobar la verga", -- [2]
						"EVT:7/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/MD:2,3/RD:2,3", -- [3]
						"EVT:7/END", -- [4]
					}, -- [1]
					{
						"EVT:7/ATT:Natsume,4203,14414,Y,?S80,,Orden Fenix,8,,,RD", -- [1]
					}, -- [2]
					{
						"EVT:7/ATT:Natsume,4203,14416,C,AS80,,Orden Fenix,8,,,RD", -- [1]
					}, -- [3]
					{
						"EVT:7/ATT:Duendee,4203,44054,Y,DW80,,Orden Fenix,7,,,MD", -- [1]
					}, -- [4]
					{
						"EVT:7/ATT:Tartanarmy,4203,80275,Y,AL80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [5]
					{
						"EVT:7/ATT:Antaryus,4205,86070,Y,NW80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [6]
					{
						"EVT:7/ATT:Pegason,4206,85819,Y,HM80,,Orden Fenix,3,,,RD", -- [1]
					}, -- [7]
					{
						"EVT:7/ATT:Snoops,4207,63527,M,ND80,,Orden Fenix,8,,,MH", -- [1]
					}, -- [8]
					{
						"EVT:7/ATT:Felli,4208,79197,M,ND80,,Orden Fenix,7,,,MH", -- [1]
					}, -- [9]
					{
						"EVT:7/ATT:Ollivander,4210,82714,Y,ND80,,Orden Fenix,6,,,MH", -- [1]
					}, -- [10]
					{
						"EVT:7/ATT:Dayron,4211,35804,Y,HL80,,Orden Fenix,3,,,MD", -- [1]
					}, -- [11]
					{
						"EVT:7/ATT:Freemansmou,4211,86084,M,HL80,,Orden Fenix,2,,,MT", -- [1]
					}, -- [12]
					{
						"EVT:7/ATT:Freemansmou,4211,86109,M,HL80,Si falta alguno me prendo que se yo.,Orden Fenix,2,,,MT", -- [1]
					}, -- [13]
					{
						"EVT:7/ATT:Natsume,4212,44583,Y,AS80,,Orden Fenix,8,,,RD", -- [1]
					}, -- [14]
					{
						"EVT:7/ATT:Sticky,4212,45305,M,AL80,,Orden Fenix,9,,,?", -- [1]
					}, -- [15]
					{
						"EVT:7/ATT:Sticky,4212,45328,M,AL80,,Orden Fenix,9,,,MH", -- [1]
					}, -- [16]
					{
						"EVT:7/DEL", -- [1]
					}, -- [17]
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Natsume",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["Realm"] = "WoWArg",
			["CurrentEventID"] = 7,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 366268679,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Tekabe"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 374708940,
			["IsPlayerOwned"] = false,
			["UserName"] = "Tekabe",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["CurrentEventID"] = 0,
			["AddonVersion"] = "4.6.1",
			["Realm"] = "WoWArg",
		},
		["WoWArg_Hellbeast"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365194140,
			["Realm"] = "WoWArg",
			["Changes"] = {
				["ID"] = 360909734,
				["Revision"] = 34,
				["AuthRevision"] = 34,
				["ChangeList"] = {
					[33] = {
						"EVT:6/DEL", -- [1]
					},
					[32] = {
						"EVT:4/DEL", -- [1]
					},
					[34] = {
						"EVT:5/DEL", -- [1]
					},
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Hellbeast",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 0,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 366432214,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Zerathon"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 374708880,
			["Realm"] = "WoWArg",
			["Changes"] = {
				["ID"] = 357437451,
				["Revision"] = 19,
				["AuthRevision"] = 19,
				["ChangeList"] = {
					[19] = {
						"EVT:70/DEL", -- [1]
					},
					[7] = {
						"EVT:5/DEL", -- [1]
					},
					[3] = {
						"EVT:3/DEL", -- [1]
					},
					[8] = {
						"EVT:17/DEL", -- [1]
					},
					[18] = {
						"EVT:69/DEL", -- [1]
					},
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Zerathon",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 0,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 363373656,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Uzumakinarut"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 364835400,
			["CurrentEventID"] = 0,
			["IsPlayerOwned"] = false,
			["UserName"] = "Uzumakinarut",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["AddonVersion"] = "4.6.1",
			["Realm"] = "WoWArg",
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 366432214,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Molten"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365309460,
			["IsPlayerOwned"] = false,
			["UserName"] = "Molten",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["CurrentEventID"] = 0,
			["AddonVersion"] = "4.6.1",
			["Realm"] = "WoWArg",
			["RSVPs"] = {
				["ID"] = 365203312,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Kokuch"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 364438920,
			["IsPlayerOwned"] = false,
			["UserName"] = "Kokuch",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["CurrentEventID"] = 0,
			["AddonVersion"] = "4.6.1",
			["Realm"] = "WoWArg",
		},
		["WoWArg_Senarion"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365194140,
			["Realm"] = "WoWArg",
			["Changes"] = {
				["ID"] = 362972522,
				["Revision"] = 10,
				["AuthRevision"] = 3,
				["ChangeList"] = {
					{
						"EVT:17/NEW:Ulduar,4200,1380,240,80,", -- [1]
						"EVT:17/DSC:Ulduar 10 completa con Desarmador Heroic y en lo posible Vezax heroic ", -- [2]
						"EVT:17/GLD:Orden Fenix", -- [3]
						"EVT:17/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/RD:2,3/MD:2,3", -- [4]
						"EVT:17/ATT:Zerathon,4199,85596,N,HM80,,Orden Fenix,9,,,RD", -- [5]
						"EVT:17/ATT:Dayron,4199,67585,Y,HL80,voy con yken,Orden Fenix,3,,,MD", -- [6]
						"EVT:17/ATT:Duendee,4200,48211,M,DW80,,Orden Fenix,7,,,MD", -- [7]
						"EVT:17/ATT:Pegason,4200,61687,Y,HM80,,Orden Fenix,8,,,RD", -- [8]
						"EVT:17/ATT:Natsume,4199,42149,Y,AS80,me la soban,Orden Fenix,2,,,MH", -- [9]
						"EVT:17/ATT:Antaryus,4199,85729,M,NW80,,Orden Fenix,3,,,MT", -- [10]
						"EVT:17/ATT:Senarion,4199,2112,Y,ND80,,Orden Fenix,9,,,MT", -- [11]
						"EVT:17/ATT:Edanor,4199,69931,Y,AS80,,Orden Fenix,1,,,RD", -- [12]
						"EVT:17/ATT:Felli,4200,68034,M,ND80,,Orden Fenix,9,,,MH", -- [13]
						"EVT:17/END", -- [14]
						"EVT:1/NEW:Naxx,4199,1020,240,80,", -- [15]
						"EVT:1/TIT:Naxxramas 10", -- [16]
						"EVT:1/DSC:Naxx 10 voy a usar a mi cazador&c; Shadowsongs", -- [17]
						"EVT:1/GLD:Orden Fenix", -- [18]
						"EVT:1/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/RD:2,3/MD:2,3", -- [19]
						"EVT:1/ATT:Snoops,4197,78283,M,ND80,,Orden Fenix,8,,,MH", -- [20]
						"EVT:1/ATT:Molten,4199,75838,M,AT80,Me baje el addon ! WIIII,Orden Fenix,8,,,MD", -- [21]
						"EVT:1/ATT:Dayron,4199,47633,M,HL80,,Orden Fenix,3,,,MD", -- [22]
						"EVT:1/ATT:Elsinguild,4199,75514,Y,HP80,,Orden Fenix,8,,,RD", -- [23]
						"EVT:1/ATT:Kynky,4198,57444,M,HK80,,Orden Fenix,8,,,RD", -- [24]
						"EVT:1/ATT:Snops,4197,78293,M,HL80,,Orden Fenix,8,,,MT", -- [25]
						"EVT:1/ATT:Antaryus,4198,2614,Y,NW80,,Orden Fenix,3,,,MT", -- [26]
						"EVT:1/ATT:Senarion,4197,56605,Y,ND80,Entro con el Caza,Orden Fenix,9,,,RD", -- [27]
						"EVT:1/ATT:Duendee,4199,86112,Y,DW80,,Orden Fenix,7,,,MD", -- [28]
						"EVT:1/ATT:Felli,4197,79491,M,ND80,,Orden Fenix,9,,,MH", -- [29]
						"EVT:1/END", -- [30]
					}, -- [1]
					{
						"EVT:17/ATT:Antaryus,4200,82597,Y,NW80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [2]
					{
						"EVT:17/ATT:Felli,4200,84694,M,ND80,,Orden Fenix,9,,,MH", -- [1]
					}, -- [3]
					{
						"EVT:4/NEW:UlduarH,4237,1320,120,80,", -- [1]
						"EVT:4/TIT:Asamblea Hard", -- [2]
						"EVT:4/DSC:Asamblea Hard rearme del jueves y pruebas de yogg saron", -- [3]
						"EVT:4/GLD:Orden Fenix", -- [4]
						"EVT:4/CNF:ROLE/MAX:25/MT:4,6/MH:4,6/MD:4,14/RD:4,14", -- [5]
						"EVT:4/END", -- [6]
					}, -- [4]
					{
						"EVT:4/ATT:Morpheos,4237,77402,M,ND80,,Orden Fenix,9,,,MH", -- [1]
					}, -- [5]
					{
						"EVT:4/DEL", -- [1]
					}, -- [6]
					{
						"EVT:11/NEW:UlduarH,4297,1410,300,80,", -- [1]
						"EVT:11/TIT:Ulduar 25", -- [2]
						"EVT:11/GLD:Orden Fenix", -- [3]
						"EVT:11/CNF:ROLE/MAX:25/MT:4,6/MH:4,6/MD:4,14/RD:4,14", -- [4]
						"EVT:11/END", -- [5]
					}, -- [7]
					{
						"EVT:11/ATT:Tailung,4297,83948,Y,NW80,,Orden Fenix,1,,,MT", -- [1]
					}, -- [8]
					{
						"EVT:11/ATT:Felli,4303,60564,Y,ND80,,Orden Fenix,3,,,MH", -- [1]
					}, -- [9]
					{
						"EVT:11/DEL", -- [1]
					}, -- [10]
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Senarion",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 0,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 366268679,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Odinbas"] = {
			["Guild"] = "Orden Fenix",
			["Changes"] = {
				["ID"] = 360909784,
				["Revision"] = 3,
				["AuthRevision"] = 0,
				["ChangeList"] = {
					{
						"EVT:1/NEW:,4177,1140,120,,", -- [1]
						"EVT:1/TIT:Dd", -- [2]
						"EVT:1/END", -- [3]
					}, -- [1]
					{
						"EVT:1/TIT:Ahn'kahet&cn; The Old Kingdom (Heroic)", -- [1]
					}, -- [2]
					{
						"EVT:1/DEL", -- [1]
					}, -- [3]
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Odinbas",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["Realm"] = "WoWArg",
			["CurrentEventID"] = 0,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 365307959,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Freemansmou"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 364833960,
			["IsPlayerOwned"] = false,
			["UserName"] = "Freemansmou",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["CurrentEventID"] = 0,
			["AddonVersion"] = "4.6.1",
			["Realm"] = "WoWArg",
		},
		["WoWArg_Khiva"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365307300,
			["IsPlayerOwned"] = false,
			["UserName"] = "Khiva",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["Realm"] = "WoWArg",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 0,
		},
		["WoWArg_Pegason"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365309400,
			["Realm"] = "WoWArg",
			["Changes"] = {
				["ID"] = 357349684,
				["Revision"] = 6,
				["AuthRevision"] = 6,
				["ChangeList"] = {
					[4] = {
						"EVT:5/DEL", -- [1]
					},
					[6] = {
						"EVT:6/DEL", -- [1]
					},
					[2] = {
						"EVT:1/DEL", -- [1]
					},
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Pegason",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 0,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 366432214,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Cici"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365186520,
			["IsPlayerOwned"] = false,
			["UserName"] = "Cici",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["Realm"] = "WoWArg",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 0,
		},
		["WoWArg_Noxfeld"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365192820,
			["IsPlayerOwned"] = false,
			["UserName"] = "Noxfeld",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["RSVPs"] = {
				["ID"] = 366233376,
				["Revision"] = 0,
				["ChangeList"] = {
				},
				["AuthRevision"] = 0,
			},
			["CurrentEventID"] = 0,
			["AddonVersion"] = "4.6.1",
			["Realm"] = "WoWArg",
		},
		["WoWArg_Gildo"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 357318180,
			["RSVPs"] = {
				["ID"] = 365207802,
				["Revision"] = 0,
				["ChangeList"] = {
				},
				["AuthRevision"] = 0,
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Gildo",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["HighestKnownRSVPID"] = 357329688,
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 0,
			["Realm"] = "WoWArg",
		},
		["WoWArg_Snops"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365186400,
			["Realm"] = "WoWArg",
			["Changes"] = {
				["ID"] = 357711148,
				["Revision"] = 14,
				["AuthRevision"] = 14,
				["ChangeList"] = {
					[10] = {
						"EVT:5/DSC:25 y despues 10", -- [1]
						"EVT:5/GLD:Orden Fenix", -- [2]
					},
					[12] = {
						"EVT:5/ATT:Antaryus,4211,86160,Y,NW80,,Orden Fenix,3,,,MT", -- [1]
					},
					[14] = {
						"EVT:5/DEL", -- [1]
					},
					[9] = {
						"EVT:5/NEW:Obsidian,4211,780,60,80,", -- [1]
						"EVT:5/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/MD:2,3/RD:2,3", -- [2]
						"EVT:5/END", -- [3]
					},
					[11] = {
						"EVT:5/ATT:Tartanarmy,4211,76949,Y,AL80,,Orden Fenix,3,,,MT", -- [1]
					},
					[13] = {
						"EVT:5/ATT:Freemansmou,4211,86251,M,HL80,Capas&c; depende q falte y si hay gente para armar.,Orden Fenix,2,,,MT", -- [1]
					},
					[8] = {
						"EVT:3/DEL", -- [1]
					},
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Snops",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["CurrentEventID"] = 5,
			["HighestKnownRSVPID"] = 364298733,
			["AddonVersion"] = "4.6.1",
			["RSVPs"] = {
				["ID"] = 366432214,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Antaryus"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 364782000,
			["Changes"] = {
				["ID"] = 363413229,
				["Revision"] = 9,
				["AuthRevision"] = 8,
				["ChangeList"] = {
					{
						"EVT:1/NEW:Naxx,4208,1380,180,80,", -- [1]
						"EVT:1/TIT:Naxxramas 25", -- [2]
						"EVT:1/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/MD:2,3/RD:2,3", -- [3]
						"EVT:1/END", -- [4]
					}, -- [1]
					{
						"EVT:1/ATT:Antaryus,4206,4035,Y,NW80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [2]
					{
						"EVT:1/ATT:Tartanarmy,4207,72014,Y,AL80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [3]
					{
						"EVT:1/ATT:Snops,4207,72070,M,HL80,,Orden Fenix,8,,,MT", -- [1]
					}, -- [4]
					{
						"EVT:1/ATT:Duendee,4207,49647,M,DW80,,Orden Fenix,6,,,MD", -- [1]
					}, -- [5]
					{
						"EVT:1/ATT:Kynky,4207,58943,Y,HK80,,Orden Fenix,8,,,RD", -- [1]
					}, -- [6]
					{
						"EVT:1/ATT:Snoops,4207,70706,M,ND80,,Orden Fenix,8,,,MH", -- [1]
					}, -- [7]
					{
						"EVT:1/ATT:Molten,4206,79457,M,AT80,,Orden Fenix,8,,,MD", -- [1]
					}, -- [8]
					{
						"EVT:1/DEL", -- [1]
					}, -- [9]
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Antaryus",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["RSVPs"] = {
				["ID"] = 365977173,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 1,
			["Realm"] = "WoWArg",
		},
		["WoWArg_Elsinguild"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 364431540,
			["Realm"] = "WoWArg",
			["Changes"] = {
				["ID"] = 357436855,
				["Revision"] = 133,
				["AuthRevision"] = 122,
				["ChangeList"] = {
					nil, -- [1]
					nil, -- [2]
					nil, -- [3]
					nil, -- [4]
					{
						"EVT:2/DEL", -- [1]
					}, -- [5]
					nil, -- [6]
					nil, -- [7]
					nil, -- [8]
					nil, -- [9]
					nil, -- [10]
					nil, -- [11]
					nil, -- [12]
					nil, -- [13]
					nil, -- [14]
					{
						"EVT:3/DEL", -- [1]
					}, -- [15]
					{
						"EVT:4/NEW:Obsidian,4141,1410,60,80,", -- [1]
						"EVT:4/TIT:OBSI 25", -- [2]
						"EVT:4/GLD:Orden Fenix", -- [3]
						"EVT:4/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/MD:2,3/RD:2,3", -- [4]
						"EVT:4/END", -- [5]
					}, -- [16]
					{
						"EVT:4/ATT:Pegason,4140,5124,Y,HM80,,Orden Fenix,4,,,RD", -- [1]
					}, -- [17]
					{
						"EVT:4/ATT:Pegason,4140,5124,Y,HM80,,Orden Fenix,4,,,RD", -- [1]
					}, -- [18]
					{
						"EVT:4/ATT:Zerathon,4140,5117,N,HM80,Tengo Diskete en esa raid,Orden Fenix,4,,,RD", -- [1]
					}, -- [19]
					{
						"EVT:4/ATT:Tailung,4140,5139,Y,NW80,nacho maraca,Orden Fenix,2,,,MT", -- [1]
					}, -- [20]
					{
						"EVT:4/ATT:Revenant,4140,5157,Y,HM80,,Orden Fenix,3,,,RD", -- [1]
					}, -- [21]
					{
						"EVT:4/ATT:Shiffu,4140,5137,Y,NP80,lta nacho,Orden Fenix,3,,,MH", -- [1]
					}, -- [22]
					{
						"EVT:4/CNF:ROLE/MAX:25/MT:2,3/MH:2,3/MD:2,3/RD:2,3", -- [1]
					}, -- [23]
					{
						"EVT:4/ATT:Shiffu,4140,5137,Y,NP80,lta nacho,Orden Fenix,3,,,MH", -- [1]
					}, -- [24]
					{
						"EVT:4/ATT:Tailung,4140,5139,Y,NW80,nacho maraca,Orden Fenix,2,,,MT", -- [1]
					}, -- [25]
					{
						"EVT:4/ATT:Pegason,4140,5124,Y,HM80,,Orden Fenix,4,,,RD", -- [1]
					}, -- [26]
					{
						"EVT:4/ATT:Revenant,4140,5157,Y,HM80,,Orden Fenix,3,,,RD", -- [1]
					}, -- [27]
					{
						"EVT:4/ATT:Zerathon,4140,5117,Y,HM80,Tengo Diskete en esa raid,Orden Fenix,4,,,RD", -- [1]
					}, -- [28]
					{
						"EVT:4/ATT:Revenant,4140,5157,Y,HM80,,Orden Fenix,3,,,RD", -- [1]
					}, -- [29]
					{
						"EVT:4/ATT:Pegason,4140,5124,Y,HM80,,Orden Fenix,4,,,RD", -- [1]
					}, -- [30]
					{
						"EVT:4/ATT:Zerathon,4140,5117,Y,HM80,Tengo Diskete en esa raid,Orden Fenix,4,,,RD", -- [1]
					}, -- [31]
					{
						"EVT:4/ATT:Tailung,4140,5139,Y,NW80,nacho maraca,Orden Fenix,2,,,MT", -- [1]
					}, -- [32]
					{
						"EVT:4/ATT:Shiffu,4140,5137,Y,NP80,lta nacho,Orden Fenix,3,,,MH", -- [1]
					}, -- [33]
					{
						"EVT:4/ATT:Snoops,4140,5186,M,ND80,lalala,Orden Fenix,3,,,MH", -- [1]
					}, -- [34]
					{
						"EVT:4/ATT:Zerathon,4140,63036,N,HM80,Tengo Diskete en esa raid,Orden Fenix,4,,,RD", -- [1]
					}, -- [35]
					{
						"EVT:4/ATT:Kinki,4140,57685,S,GT80,,Orden Fenix,8,,,?", -- [1]
					}, -- [36]
					{
						"EVT:4/ATT:Snops,4140,77549,M,HL80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [37]
					{
						"EVT:4/ATT:Snoops,4140,5186,Y,ND80,lalala,Orden Fenix,3,,,MH", -- [1]
					}, -- [38]
					{
						"EVT:4/ATT:Snops,4140,77549,Y,HL80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [39]
					{
						"EVT:4/ATT:Kinki,4140,57685,Y,GT80,,Orden Fenix,8,,,?", -- [1]
					}, -- [40]
					{
						"EVT:4/ATT:Zerathon,4140,63036,Y,HM80,Tengo Diskete en esa raid,Orden Fenix,4,,,RD", -- [1]
					}, -- [41]
					{
						"EVT:4/DEL", -- [1]
					}, -- [42]
					{
						"EVT:27/NEW:,4205,1140,120,,", -- [1]
						"EVT:27/TIT:Ulduar 10 + HARDS", -- [2]
						"EVT:27/END", -- [3]
					}, -- [43]
					{
						"EVT:27/ATT:Tartanarmy,4203,1743,S,AL80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [44]
					{
						"EVT:28/NEW:,4207,1140,120,,", -- [1]
						"EVT:28/TIT:Ulduar 10 + HARDS", -- [2]
						"EVT:28/END", -- [3]
					}, -- [45]
					{
						"EVT:28/ATT:Elsinguild,4203,1782,S,HP80,,Orden Fenix,3,,,MD", -- [1]
					}, -- [46]
					{
						"EVT:27/ATT:Tartanarmy,4203,1743,Y,AL80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [47]
					{
						"EVT:28/ATT:Elsinguild,4203,1782,Y,HP80,,Orden Fenix,3,,,MD", -- [1]
					}, -- [48]
					{
						"EVT:27/ATT:Natsume,4203,14277,S,AS80,,Orden Fenix,8,,,RD", -- [1]
					}, -- [49]
					{
						"EVT:27/ATT:Natsume,4203,14277,Y,AS80,,Orden Fenix,8,,,RD", -- [1]
					}, -- [50]
					{
						"EVT:27/UPD:,4205,1380,120,,", -- [1]
						"EVT:27/END", -- [2]
					}, -- [51]
					{
						"EVT:28/UPD:,4207,1380,120,,", -- [1]
						"EVT:28/END", -- [2]
					}, -- [52]
					{
						"EVT:27/ATT:Snoops,4203,71893,M,ND80,,Orden Fenix,8,,,MH", -- [1]
					}, -- [53]
					{
						"EVT:27/ATT:Khiva,4203,77936,S,AH80,,Orden Fenix,1,,,RD", -- [1]
					}, -- [54]
					{
						"EVT:28/ATT:Duendee,4203,65212,S,DW80,,Orden Fenix,7,,,MD", -- [1]
					}, -- [55]
					{
						"EVT:27/ATT:Dayron,4203,58072,S,HL80,,Orden Fenix,3,,,MD", -- [1]
					}, -- [56]
					{
						"EVT:27/UPD:AQT,4205,1380,120,,", -- [1]
						"EVT:27/END", -- [2]
					}, -- [57]
					{
						"EVT:28/UPD:ZG,4207,1380,120,,", -- [1]
						"EVT:28/END", -- [2]
					}, -- [58]
					{
						"EVT:27/ATT:Shiffu,4203,80290,M,NP80,,Orden Fenix,3,,,MH", -- [1]
					}, -- [59]
					{
						"EVT:27/ATT:Dayron,4203,58072,Y,HL80,,Orden Fenix,3,,,MD", -- [1]
					}, -- [60]
					{
						"EVT:27/ATT:Khiva,4203,77936,Y,AH80,,Orden Fenix,1,,,RD", -- [1]
					}, -- [61]
					{
						"EVT:28/ATT:Duendee,4203,83478,N,DW80,,Orden Fenix,7,,,MD", -- [1]
					}, -- [62]
					{
						"EVT:27/ATT:Ollivander,4204,252,S,ND80,,Orden Fenix,6,,,MH", -- [1]
					}, -- [63]
					{
						"EVT:27/ATT:Ollivander,4204,252,Y,ND80,,Orden Fenix,6,,,MH", -- [1]
					}, -- [64]
					{
						"EVT:27/ATT:Snoops,4203,71893,Y,ND80,,Orden Fenix,8,,,MH", -- [1]
					}, -- [65]
					{
						"EVT:27/ATT:Shiffu,4203,80290,Y,NP80,,Orden Fenix,3,,,MH", -- [1]
					}, -- [66]
					{
						"EVT:28/ATT:Felli,4204,54486,M,ND80,,Orden Fenix,7,,,MH", -- [1]
					}, -- [67]
					{
						"EVT:27/ATT:Felli,4204,54486,M,ND80,Copados los iconitos! JAJJAA,Orden Fenix,7,,,MH", -- [1]
					}, -- [68]
					{
						"EVT:27/ATT:Khiva,4204,29,Y,AH80,,Orden Fenix,1,4203,77936,RD", -- [1]
					}, -- [69]
					{
						"EVT:27/ATT:Freemansmou,4203,86339,S,HL80,,Orden Fenix,2,,,MT", -- [1]
					}, -- [70]
					{
						"EVT:28/ATT:Antaryus,4204,85106,M,NW80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [71]
					{
						"EVT:27/ATT:Antaryus,4204,85124,S,NW80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [72]
					{
						"EVT:27/ATT:Felli,4204,54486,Y,ND80,Copados los iconitos! JAJJAA,Orden Fenix,7,,,MH", -- [1]
					}, -- [73]
					{
						"EVT:27/ATT:Freemansmou,4203,86339,Y,HL80,,Orden Fenix,2,,,MT", -- [1]
					}, -- [74]
					{
						"EVT:27/ATT:Antaryus,4204,85124,Y,NW80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [75]
					{
						"EVT:27/ATT:Pegason,4205,72378,S,HM80,,Orden Fenix,3,,,RD", -- [1]
					}, -- [76]
					{
						"EVT:27/ATT:Hellfireorc,4205,73716,S,NR80,,Orden Fenix,3,,,MD", -- [1]
					}, -- [77]
					{
						"EVT:27/ATT:Khiva,4204,64511,Y,AH80,,Orden Fenix,1,4203,77936,RD", -- [1]
					}, -- [78]
					{
						"EVT:27/ATT:Apolex,4205,59760,S,HM80,Ya son 10&c; pero estaré ON por si hace falta!,Orden Fenix,3,,,RD", -- [1]
					}, -- [79]
					{
						"EVT:28/ATT:Senarion,4206,11942,M,ND80,,Orden Fenix,9,,,MT", -- [1]
					}, -- [80]
					{
						"EVT:28/ATT:Pegason,4206,83039,S,HM80,,Orden Fenix,3,,,RD", -- [1]
					}, -- [81]
					{
						"EVT:28/ATT:Dayron,4206,46315,S,HL80,voy con yken ,Orden Fenix,3,,,MD", -- [1]
					}, -- [82]
					{
						"EVT:28/ATT:Ollivander,4206,84071,S,ND80,,Orden Fenix,6,,,MH", -- [1]
					}, -- [83]
					{
						"EVT:28/ATT:Antaryus,4204,85106,Y,NW80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [84]
					{
						"EVT:28/ATT:Antaryus,4207,924,M,NW80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [85]
					{
						"EVT:28/ATT:Snops,4207,63469,M,HL80,,Orden Fenix,8,,,MT", -- [1]
					}, -- [86]
					{
						"EVT:28/ATT:Snops,4207,63469,Y,HL80,,Orden Fenix,8,,,MT", -- [1]
					}, -- [87]
					{
						"EVT:28/ATT:Antaryus,4207,924,Y,NW80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [88]
					{
						"EVT:28/ATT:Senarion,4206,11942,Y,ND80,,Orden Fenix,9,,,MT", -- [1]
					}, -- [89]
					{
						"EVT:28/ATT:Felli,4204,54486,Y,ND80,,Orden Fenix,7,,,MH", -- [1]
					}, -- [90]
					{
						"EVT:28/ATT:Pegason,4206,83039,Y,HM80,,Orden Fenix,3,,,RD", -- [1]
					}, -- [91]
					{
						"EVT:28/ATT:Dayron,4206,46315,Y,HL80,voy con yken ,Orden Fenix,3,,,MD", -- [1]
					}, -- [92]
					{
						"EVT:28/ATT:Ollivander,4206,84071,Y,ND80,,Orden Fenix,6,,,MH", -- [1]
					}, -- [93]
					{
						"EVT:28/ATT:Natsume,4207,74022,S,AS80,,Orden Fenix,8,,,RD", -- [1]
					}, -- [94]
					{
						"EVT:28/ATT:Natsume,4207,74022,Y,AS80,,Orden Fenix,8,,,RD", -- [1]
					}, -- [95]
					{
						"EVT:1/NEW:Ulduar,4215,1355,240,80,", -- [1]
						"EVT:1/DSC:SOLO ANOTENSE LOS QUE VANA  ESTAR&c; LOS QUE TIENEN DUDAS PONGAN QUIZAS Y NO SI LO SLOGARES DE TANK ESTAN LLENOS NO SE ANOTEN DE TANK ( A MODO DE EJEMPLO)", -- [2]
						"EVT:1/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/MD:2,3/RD:2,3", -- [3]
						"EVT:1/END", -- [4]
					}, -- [96]
					{
						"EVT:1/TIT:Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", -- [1]
					}, -- [97]
					{
						"EVT:1/TIT:Ulduar 10 + HARDS", -- [1]
					}, -- [98]
					{
						"EVT:1/ATT:Elsinguild,4215,12923,Y,HP80,,Orden Fenix,3,,,RD", -- [1]
					}, -- [99]
					{
						"EVT:1/ATT:Pegason,4215,72169,Y,HM80,,Orden Fenix,3,,,RD", -- [1]
					}, -- [100]
					{
						"EVT:1/ATT:Felli,4215,47222,M,ND80,,Orden Fenix,7,,,MH", -- [1]
					}, -- [101]
					{
						"EVT:1/ATT:Snops,4215,71795,M,HL80,,Orden Fenix,8,,,MT", -- [1]
					}, -- [102]
					{
						"EVT:1/ATT:Tailung,4215,72496,Y,NW80,,Orden Fenix,8,,,MT", -- [1]
					}, -- [103]
					{
						"EVT:1/ATT:Freemansmou,4215,52825,Y,HL80,,Orden Fenix,2,,,MT", -- [1]
					}, -- [104]
					{
						"EVT:1/ATT:Dayron,4215,48657,Y,HL80,voy con Yken.,Orden Fenix,3,,,MD", -- [1]
					}, -- [105]
					{
						"EVT:29/NEW:Ulduar,4219,1380,240,80,", -- [1]
						"EVT:29/DSC:SOLO ANOTENSE LOS QUE VANA  ESTAR&c; LOS QUE TIENEN DUDAS PONGAN QUIZAS Y NO SI LO SLOGARES DE TANK ESTAN LLENOS NO SE ANOTEN DE TANK ( A MODO DE EJEMPLO)", -- [2]
						"EVT:29/GLD:Orden Fenix", -- [3]
						"EVT:29/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/RD:2,3/MD:2,3", -- [4]
						"EVT:29/END", -- [5]
					}, -- [106]
					{
						"EVT:29/ATT:Tartanarmy,4216,15176,Y,AL80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [107]
					{
						"EVT:30/NEW:Ulduar,4220,1320,240,80,", -- [1]
						"EVT:30/TIT:Ulduar 10 + HARDS + NEW HARDS", -- [2]
						"EVT:30/DSC:SOLO ANOTENSE LOS QUE VANA  ESTAR&c; LOS QUE TIENEN DUDAS PONGAN QUIZAS Y NO SI LO SLOGARES DE TANK ESTAN LLENOS NO SE ANOTEN DE TANK ( A MODO DE EJEMPLO) PROBAMOS LOS HARDS DE SIEMPRE + OTROS", -- [3]
						"EVT:30/GLD:Orden Fenix", -- [4]
						"EVT:30/CNF:ROLE/MAX:10/MT:2,3/MH:2,3/RD:2,3/MD:2,3", -- [5]
						"EVT:30/END", -- [6]
					}, -- [108]
					{
						"EVT:30/ATT:Felli,4216,15280,Y,ND80,,Orden Fenix,7,,,MH", -- [1]
					}, -- [109]
					{
						"EVT:30/ATT:Shiffu,4216,15272,Y,NP80,,Orden Fenix,3,,,MH", -- [1]
					}, -- [110]
					{
						"EVT:30/ATT:Pegason,4216,15380,Y,HM80,,Orden Fenix,3,,,RD", -- [1]
					}, -- [111]
					{
						"EVT:29/ATT:Stganimrod,4216,29263,N,ND80,,Orden Fenix,2,,,MH", -- [1]
					}, -- [112]
					{
						"EVT:29/ATT:Gilraenloss,4216,25569,M,NH80,,Orden Fenix,5,,,RD", -- [1]
					}, -- [113]
					{
						"EVT:30/ATT:Gilraenloss,4216,25585,M,NH80,,Orden Fenix,5,,,RD", -- [1]
					}, -- [114]
					{
						"EVT:30/ATT:Morpheos,4216,75219,M,ND80,voy con l lock (pasado),Orden Fenix,9,,,RD", -- [1]
					}, -- [115]
					{
						"EVT:30/TIT:Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", -- [1]
					}, -- [116]
					{
						"EVT:30/ATT:Elsinguild,4216,76124,Y,HP80,,Orden Fenix,3,,,RD", -- [1]
					}, -- [117]
					{
						"EVT:30/ATT:Antaryus,4216,86289,Y,NW80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [118]
					{
						"EVT:30/ATT:Antaryus,4216,86301,C,NW80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [119]
					{
						"EVT:30/ATT:Antaryus,4216,86311,Y,NW80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [120]
					{
						"EVT:29/ATT:Antaryus,4216,86335,M,NW80,,Orden Fenix,3,,,MT", -- [1]
					}, -- [121]
					{
						"EVT:29/ATT:Duendee,4217,51046,Y,DW80,,Orden Fenix,6,,,MD", -- [1]
					}, -- [122]
					{
						"EVT:29/ATT:Snoops,4219,79357,M,ND80,,Orden Fenix,8,,,MH", -- [1]
					}, -- [123]
					{
						"EVT:29/ATT:Dayron,4216,60064,Y,HL80,,Orden Fenix,3,,,MD", -- [1]
					}, -- [124]
					{
						"EVT:30/ATT:Dayron,4219,39400,Y,HL80,,Orden Fenix,3,,,MD", -- [1]
					}, -- [125]
					{
						"EVT:29/ATT:Kynky,4219,66105,Y,HK80,,Orden Fenix,8,,,RD", -- [1]
					}, -- [126]
					{
						"EVT:29/ATT:Kokuch,4219,82015,Y,GK80,,Orden Fenix,3,,,RD", -- [1]
					}, -- [127]
					{
						"EVT:29/ATT:Morpheos,4218,31001,M,ND80,,Orden Fenix,9,,,MH", -- [1]
					}, -- [128]
					{
						"EVT:27/DEL", -- [1]
					}, -- [129]
					{
						"EVT:30/ATT:Apolex,4220,53420,M,HM80,,Orden Fenix,3,,,RD", -- [1]
					}, -- [130]
					{
						"EVT:30/ATT:Ahm,4220,75875,Y,ND80,of spec tanke (medio devil),Orden Fenix,9,,,MH", -- [1]
					}, -- [131]
					{
						"EVT:30/ATT:Uzumakinarut,4220,78816,S,NP80,,Orden Fenix,8,,,MH", -- [1]
					}, -- [132]
					{
						"EVT:28/DEL", -- [1]
					}, -- [133]
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Elsinguild",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
				[4215] = {
					{
						["mDuration"] = 240,
						["mMinLevel"] = 80,
						["mTime"] = 1355,
						["mType"] = "Ulduar",
						["mAttendance"] = {
							["Tailung"] = "4215,72496,Y,NW80,,Orden Fenix,8,,,MT",
							["Freemansmou"] = "4215,52825,Y,HL80,,Orden Fenix,2,,,MT",
							["Snops"] = "4215,71795,M,HL80,,Orden Fenix,8,,,MT",
							["Pegason"] = "4215,72169,Y,HM80,,Orden Fenix,3,,,RD",
							["Elsinguild"] = "4215,12923,Y,HP80,,Orden Fenix,3,,,RD",
							["Dayron"] = "4215,48657,Y,HL80,voy con Yken.,Orden Fenix,3,,,MD",
							["Felli"] = "4215,47222,M,ND80,,Orden Fenix,7,,,MH",
						},
						["mRoleConfirm"] = true,
						["mLimits"] = {
							["mRoleLimits"] = {
								["MT"] = {
									["mMax"] = 3,
									["mMin"] = 2,
								},
								["MH"] = {
									["mMax"] = 3,
									["mMin"] = 2,
								},
								["MD"] = {
									["mMax"] = 3,
									["mMin"] = 2,
								},
								["RD"] = {
									["mMax"] = 3,
									["mMin"] = 2,
								},
							},
							["mMaxAttendance"] = 10,
						},
						["mDescription"] = "SOLO ANOTENSE LOS QUE VANA  ESTAR&c; LOS QUE TIENEN DUDAS PONGAN QUIZAS Y NO SI LO SLOGARES DE TANK ESTAN LLENOS NO SE ANOTEN DE TANK ( A MODO DE EJEMPLO)",
						["mTitle"] = "Ulduar 10 + HARDS",
						["mDate"] = 4215,
						["mID"] = 1,
					}, -- [1]
				},
				[4219] = {
					{
						["mDuration"] = 240,
						["mMinLevel"] = 80,
						["mTime"] = 1380,
						["mType"] = "Ulduar",
						["mAttendance"] = {
							["Stganimrod"] = "4216,29263,N,ND80,,Orden Fenix,2,,,MH",
							["Kokuch"] = "4219,82015,Y,GK80,,Orden Fenix,3,,,RD",
							["Snoops"] = "4219,79357,M,ND80,,Orden Fenix,8,,,MH",
							["Dayron"] = "4216,60064,Y,HL80,,Orden Fenix,3,,,MD",
							["Morpheos"] = "4218,31001,M,ND80,,Orden Fenix,9,,,MH",
							["Duendee"] = "4217,51046,Y,DW80,,Orden Fenix,6,,,MD",
							["Antaryus"] = "4216,86335,M,NW80,,Orden Fenix,3,,,MT",
							["Gilraenloss"] = "4216,25569,M,NH80,,Orden Fenix,5,,,RD",
							["Kynky"] = "4219,66105,Y,HK80,,Orden Fenix,8,,,RD",
							["Tartanarmy"] = "4216,15176,Y,AL80,,Orden Fenix,3,,,MT",
						},
						["mRoleConfirm"] = true,
						["mLimits"] = {
							["mRoleLimits"] = {
								["MT"] = {
									["mMax"] = 3,
									["mMin"] = 2,
								},
								["MH"] = {
									["mMax"] = 3,
									["mMin"] = 2,
								},
								["RD"] = {
									["mMax"] = 3,
									["mMin"] = 2,
								},
								["MD"] = {
									["mMax"] = 3,
									["mMin"] = 2,
								},
							},
							["mMaxAttendance"] = 10,
						},
						["mDescription"] = "SOLO ANOTENSE LOS QUE VANA  ESTAR&c; LOS QUE TIENEN DUDAS PONGAN QUIZAS Y NO SI LO SLOGARES DE TANK ESTAN LLENOS NO SE ANOTEN DE TANK ( A MODO DE EJEMPLO)",
						["mGuild"] = "Orden Fenix",
						["mDate"] = 4219,
						["mID"] = 29,
					}, -- [1]
				},
				[4220] = {
					{
						["mDuration"] = 240,
						["mMinLevel"] = 80,
						["mTime"] = 1320,
						["mType"] = "Ulduar",
						["mAttendance"] = {
							["Gilraenloss"] = "4216,25585,M,NH80,,Orden Fenix,5,,,RD",
							["Ahm"] = "4220,75875,Y,ND80,of spec tanke (medio devil),Orden Fenix,9,,,MH",
							["Shiffu"] = "4216,15272,Y,NP80,,Orden Fenix,3,,,MH",
							["Dayron"] = "4219,39400,Y,HL80,,Orden Fenix,3,,,MD",
							["Elsinguild"] = "4216,76124,Y,HP80,,Orden Fenix,3,,,RD",
							["Morpheos"] = "4216,75219,M,ND80,voy con l lock (pasado),Orden Fenix,9,,,RD",
							["Uzumakinarut"] = "4220,78816,S,NP80,,Orden Fenix,8,,,MH",
							["Pegason"] = "4216,15380,Y,HM80,,Orden Fenix,3,,,RD",
							["Antaryus"] = "4216,86311,Y,NW80,,Orden Fenix,3,,,MT",
							["Apolex"] = "4220,53420,M,HM80,,Orden Fenix,3,,,RD",
							["Felli"] = "4216,15280,Y,ND80,,Orden Fenix,7,,,MH",
						},
						["mDescription"] = "SOLO ANOTENSE LOS QUE VANA  ESTAR&c; LOS QUE TIENEN DUDAS PONGAN QUIZAS Y NO SI LO SLOGARES DE TANK ESTAN LLENOS NO SE ANOTEN DE TANK ( A MODO DE EJEMPLO) PROBAMOS LOS HARDS DE SIEMPRE + OTROS",
						["mRoleConfirm"] = true,
						["mLimits"] = {
							["mRoleLimits"] = {
								["MT"] = {
									["mMax"] = 3,
									["mMin"] = 2,
								},
								["MH"] = {
									["mMax"] = 3,
									["mMin"] = 2,
								},
								["RD"] = {
									["mMax"] = 3,
									["mMin"] = 2,
								},
								["MD"] = {
									["mMax"] = 3,
									["mMin"] = 2,
								},
							},
							["mMaxAttendance"] = 10,
						},
						["mGuild"] = "Orden Fenix",
						["mTitle"] = "Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
						["mDate"] = 4220,
						["mID"] = 30,
					}, -- [1]
				},
			},
			["Faction"] = "Alliance",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 30,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 365307959,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Bamboocha"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 364833180,
			["IsPlayerOwned"] = false,
			["UserName"] = "Bamboocha",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["Realm"] = "WoWArg",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 0,
		},
		["WoWArg_Papashango"] = {
			["Guild"] = "Orden Fenix",
			["Changes"] = {
				["ID"] = 359438370,
				["Revision"] = 5,
				["AuthRevision"] = 0,
				["ChangeList"] = {
					[5] = {
						"EVT:8/DEL", -- [1]
					},
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Papashango",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["Realm"] = "WoWArg",
			["CurrentEventID"] = 0,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 365977173,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Shadowsongs"] = {
			["Guild"] = "Orden Fenix",
			["Changes"] = {
				["ID"] = 366504623,
				["Revision"] = 2,
				["ChangeList"] = {
					[2] = {
						"EVT:2/DEL", -- [1]
					},
				},
				["AuthRevision"] = 0,
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Shadowsongs",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["CurrentEventID"] = 0,
			["Realm"] = "WoWArg",
		},
		["WoWArg_Wildwind"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 364782000,
			["Realm"] = "WoWArg",
			["Changes"] = {
				["ID"] = 357436949,
				["Revision"] = 4,
				["AuthRevision"] = 4,
				["ChangeList"] = {
					[4] = {
						"EVT:1/DEL", -- [1]
					},
				},
			},
			["IsPlayerOwned"] = false,
			["UserName"] = "Wildwind",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 0,
			["HighestKnownRSVPID"] = 364298733,
			["RSVPs"] = {
				["ID"] = 366432214,
				["Revision"] = 0,
				["AuthRevision"] = 0,
				["ChangeList"] = {
				},
			},
		},
		["WoWArg_Ahm"] = {
			["Guild"] = "Orden Fenix",
			["AddonVersionUpdated"] = 365185560,
			["IsPlayerOwned"] = false,
			["UserName"] = "Ahm",
			["LocalUsers"] = {
				["Gilraenloss"] = true,
			},
			["Events"] = {
			},
			["Faction"] = "Alliance",
			["Realm"] = "WoWArg",
			["AddonVersion"] = "4.6.1",
			["CurrentEventID"] = 0,
		},
	},
}
