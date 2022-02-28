Loremaster = LibStub("AceAddon-3.0"):NewAddon("Loremaster", "AceEvent-3.0", "AceConsole-3.0", "AceHook-3.0")
local Quixote = LibStub("LibQuixote-2.0")
local lastabandoned
local version = GetAddOnMetadata("Loremaster", "Version") 
local histach={} --new achievement counts
local currach={} --new achievement counts
local L = LibStub("AceLocale-3.0"):GetLocale("Loremaster")
local dbpc
local strFaction
Loremaster.Data = {};

local function concat(var, number)
	if type(var) == "number" then
		return var
	elseif type(var) == "string" then
		return var
	elseif type(var) == "table" then
		return "table"
	else
		if number then return 0 end
		return "nil"
	end
end

function Loremaster:SetData(data)
	self.Data = data;
end


function Loremaster:OnInitialize()
	strFaction, _ = UnitFactionGroup("player") 
	self.dbpc = LibStub("AceDB-3.0"):New("LoremasterDB", {
			char = 
				{
				settings={},
				history = {},
				completion= {},
				EQignored={}
				}
		}, "char")
	dbpc = self.dbpc.char;
	if dbpc["settings"]==nil then
		dbpc["settings"]={} 
		dbpc["settings"].debug=false
	end
	dbpc["settings"].version=version
	dbpc["settings"].faction=strFaction

end

function Loremaster:OnEnable()
-- 	Called when the addon is enabled
	Quixote.RegisterCallback(self, "Quest_Abandoned", "Abandon")
	Quixote.RegisterCallback(self, "Quest_Lost", "Lost")
	Loremaster:RegisterChatCommand("lm", "ConsoleComms")
	Loremaster:RegisterChatCommand("loremaster", "ConsoleComms")
	Loremaster:CheckCompletion()
	histach[1676]=0
	histach[1677]=0
	histach[1678]=0
	histach[1680]=0
	histach[1194]=0
	histach[1190]=0
	histach[1192]=0
	histach[1273]=0
	histach[1193]=0
	histach[1195]=0
	histach[1191]=0
	histach[1272]=0
	histach[1189]=0
	histach[1271]=0
	histach[37]=0
	histach[1357]=0
	histach[34]=0
	histach[1356]=0
	histach[40]=0
	histach[39]=0
	histach[1359]=0
	histach[35]=0
	histach[33]=0
	histach[1358]=0
	histach[36]=0
	histach[38]=0
	self:Debug(L["Updating historic achievements"])
	Loremaster:CountAchievements(currach)
	Loremaster:CountAchievements(histach)
	Loremaster:Print(L["Loremaster loaded. Please upload your saved variables to www.loremaster.eu!"])
	self:Debug(L["Debug mode enabled"])
	self:RawHook("GetQuestLogQuestText", true)
	self:SecureHook(GameTooltip, "SetHyperlink", "SetHyperlink")
--	self:Debug("Data test - " .. self.Data[2].Hachid)
end

function Loremaster:GetQuestLogQuestText()
	questDescription, questObjectives = self.hooks.GetQuestLogQuestText()
	_, _, _, _, _, _, _, _, questID = GetQuestLogTitle(GetQuestLogSelection())
	result = Loremaster:GetTextFromID(questID)
	return questDescription .. "\n\n" .. result, questObjectives
end

function Loremaster:GetTextFromID(uid)
	achdetail = Loremaster:GetQuestAchDetails(uid)
	return Loremaster:GetLoremasterText(achdetail)
end

function Loremaster:GetBoolFromID(uid)
	achdetail = Loremaster:GetQuestAchDetails(uid)
	questcount=""
	if achdetail.Hachid == nil then --No data
		result=false
	else 
		if strFaction == "Horde" then
			if achdetail.Hachid ==0 then
				result = false
			else
				if achdetail.Hach > (10*achdetail.Hnoach) then
					result=true
				else
					if achdetail.Hnoach>achdetail.Hach then
						result=false
					else
						result=true
					end
				end
			end
		else
			if achdetail.Aachid ==0 then
				result = false
			else
				if achdetail.Anoach==0 then
					result=true
				else
					if achdetail.Anoach>achdetail.Aach then
						result=false
					else
						result=true
					end
				end
			end
		end
	end
	return result
end

function Loremaster:GetNumericFromID(uid)
	achdetail = Loremaster:GetQuestAchDetails(uid)
	if achdetail.Hachid == nil then --No data
		result=0 --no data
	else 
		if strFaction == "Horde" then
			if achdetail.Hachid ==0 then
				if achdetail.Hnoach>0 then
					result = 2 --Does not count
				else
					result = 1 --No faction data
				end
			else
				if achdetail.Hach > (10*achdetail.Hnoach) then
					result=5 --Counts
				else
					if achdetail.Hnoach>achdetail.Hach then
						result=3 --Probably doesn't count
					else
						result=4 --Probably counts
					end
				end
			end
		else
			if achdetail.Aachid ==0 then
				if achdetail.Anoach>0 then
					result = 2 --Does not count
				else
					result = 1 --No faction data
				end
			else
				if achdetail.Aach > (10*achdetail.Anoach) then
					result=5 --Counts
				else
					if achdetail.Anoach>achdetail.Aach then
						result=3 --Probably doesn't count
					else
						result=4 --Probably counts
					end
				end
			end
		end
	end
	return result
end


function Loremaster:GetQuestAchDetails(uid)
	if self.Data[uid] == nil then
		return {}
	else
		return self.Data[uid]
	end
end



function Loremaster:GetLoremasterText(achdetail)
	questcount=""
	if achdetail.Hachid == nil then --No data
		result=L["No Loremaster data yet."]
	else 
		if strFaction == "Horde" then
			if dbpc.settings.debug then
				questcount = " (+" .. achdetail.Hach .. ", -" .. achdetail.Hnoach .. ")"
			end
			if achdetail.Hachid ==0 then
				result = L["Does not count towards Loremaster achievements"] .. questcount .. "."
			else
				if achdetail.Hach > (10*achdetail.Hnoach) then
					result=L["Counts towards "] .. GetAchievementLink(achdetail.Hachid) .. questcount .. "."
				else
					if achdetail.Hnoach>achdetail.Hach then
						result=L["Might count towards "] .. GetAchievementLink(achdetail.Hachid) .. questcount .. "."
					else
						result=L["Probably counts towards "] .. GetAchievementLink(achdetail.Hachid) .. questcount .. "."
					end
				end
			end
		else
			if dbpc.settings.debug then
				questcount = "(+" .. achdetail.Aach .. ", -" .. achdetail.Anoach .. ")"
			end
			if achdetail.Aachid ==0 then
				result = L["Probably does not count towards Loremaster achievements"] .. questcount .. "."
			else
				if achdetail.Anoach==0 then
					result=L["Counts towards "] .. GetAchievementLink(achdetail.Aachid) .. questcount .. "."
				else
					if achdetail.Anoach>achdetail.Aach then
						result=L["Might count towards "] .. GetAchievementLink(achdetail.Aachid) .. questcount .. "."
					else
						result=L["Probably counts towards "] .. GetAchievementLink(achdetail.Aachid) .. questcount .. "."
					end
				end
			end
		end
	end
	return result
end

function Loremaster:ConsoleComms(arg)
	if arg=="debug" then
		--toggle debug mode
		if dbpc.settings.debug then 
			dbpc.settings.debug=false 
			Loremaster:Print(L["Debug mode disabled"])
		else
			dbpc.settings.debug=true 
			Loremaster:Print(L["Debug mode enabled"])
		end
	elseif arg=="eqignore" then
		if EveryQuest then
			Loremaster:EQIgnore()
		else
			Loremaster:Print(L["EveryQuest is not running!"])
		end
	elseif arg=="equnignore" then
		if EveryQuest then
			Loremaster:EQUnIgnore()
		else
			Loremaster:Print(L["EveryQuest is not running!"])
		end 
	else	
		Loremaster:Print(L["Loremaster version "] ..version)
		Loremaster:Print("/lm debug - " .. L["toggles debug mode"])
		Loremaster:Print("/lm eqignore - " .. L["sets quests that probably don't count for Loremaster to 'Ignored' status in EveryQuest"])
		Loremaster:Print("/lm equnignore - " .. L["clears ignore list created by eqignore"])
	end
end

function Loremaster:OnDisable()
-- 	Called when the addon is disabled
    Quixote:UnregisterAll()
	Loremaster:UnhookAll()
end

function Loremaster:Lost(event, title, uid, zone)
-- 	this is where we have to check achievements - but we need to check if abandoned or not
	self:Debug(L["Quest abandoned or completed"])
	if not (uid==lastabandoned) then
		if dbpc.history[zone] == nil then
				dbpc.history[zone] = {}
		end
		if dbpc.history[zone][uid] == nil then
			dbpc.history[zone][uid] = {}
			dbpc.history[zone][uid].uid = uid
			dbpc.history[zone][uid].time = time()
			dbpc.history[zone][uid].title=title
			dbpc.history[zone][uid].lmver=version
		end
		dbpc.history[zone][uid].achievement=Loremaster:CheckAchievements()
		if dbpc.history[zone][uid].achievement==0 then
			self:Debug(L["Completed, no achievement increase"] .. " - " .. uid)
		else
			self:Debug(L["Completed, achievement increased!"] .. " (" .. dbpc.history[zone][uid].achievement .. ") - " .. uid)
			local name
			if dbpc.history[zone][uid].achievement == 99999 or dbpc.history[zone][uid].achievement==99998 then
				name="LEK & LK"
			else
				_, name, _, _, _, _, _, _, _, _, _ = GetAchievementInfo(dbpc.history[zone][uid].achievement)
			end
			dbpc.history[zone][uid].achname = name
			Loremaster:CheckCompletion()
		end
		if self.Data[uid] == nil then Loremaster:Print(L["You have completed a quest not in the Loremaster database. Please submit your saved variables to www.loremaster.eu to improve the database!"]) end
	else
		self:Debug(L["Abandoned - no achievement update"] .. " - " .. uid)
	end
end

function Loremaster:Abandon(event, title, uid)
	lastabandoned=uid
	self:Debug(L["Updating historic achievements"])
	Loremaster:CountAchievements(histach)
end

function Loremaster:Debug(string)
	if dbpc.settings.debug then  
		self:Print(string)
	end
end

function Loremaster:Print(text)
    DEFAULT_CHAT_FRAME:AddMessage("Loremaster: " ..tostring(text))
end

function Loremaster:CountAchievements(achtable)
	for i,v in pairs(histach) do
		_, _, _, achtable[i], _, _, _, _, _, _ = GetAchievementCriteriaInfo(i, 1)
-- 		self:Debug(i .. " " .. achtable[i] .. " Hist " .. histach[i] .. " Curr " .. currach[i])
	end
end

function Loremaster:CheckAchievements()

	self:Debug(L["Updating current achievements"])
	Loremaster:CountAchievements(currach)
	for i,v in pairs(histach) do
		if not (histach[i]==currach[i]) then
			self:Debug(L["Updating historic achievements"])
			Loremaster:CountAchievements(histach)
			return i
		end
	end
	self:Debug(L["Updating historic achievements"])
	Loremaster:CountAchievements(histach)
	return 0

end

function Loremaster:CheckCompletion()
	--If achievements are complete, then criteria will not be updated even if they count towards a achievement.
	--Webpage will need to compare achievement completed times against quests that count for that achievement.
	--Bit of a circular argument as we need to know which quests count against which achievements, but with enough
	--data we'll get there.
	
	--Need to improve accuracy of this by checking against day, month and year of completion. If the day is wong then should replace.
	
	self:Debug(L["Checking achievement completion"])
	for i,v in pairs(histach) do
		if (dbpc.completion[i] == nil) then
		_, name, _, completed, cmonth, cday, cyear, _, _, _, _ = GetAchievementInfo(i)
			if completed == true then 
				dbpc.completion[i]={}
				dbpc.completion[i].completed=time()
				dbpc.completion[i].name=name
			end
		end
	end
	
end

function Loremaster:EQIgnore()
--this function marks all non-counting quests as ignored in EQ, and makes a record of it in the Loremaster db.
	Loremaster:EQUnIgnore()
	Loremaster:Print(L["Ignoring quests that don't count..."])
	eqdbpc=EveryQuest.dbpc.profile
	if dbpc.EQignored==nil then dbpc.EQignored={} end
	for i,v in pairs(self.Data) do
		if Loremaster:GetNumericFromID(i)==2 or Loremaster:GetNumericFromID(i)==3 then --doesn't count or probably doesn't count
--			uid, quest, zoneid = EveryQuest:GetQuestData(i)
--			if type(quest)=="table" and type(uid)=="number" then --makes sure quest is in EQ database
				if not eqdbpc.ignored[uid] then
					dbpc.EQignored[i]=true
					eqdbpc.ignored[i]=true
				end
--			end
		end
	end
	EveryQuest:UpdateFrame()
	Loremaster:Print(L["...EQ ignore done."])
end

function Loremaster:EQUnIgnore()
--this function clears the previously ignored quest list
	Loremaster:Print(L["Clearing ignore list..."])
	eqdbpc=EveryQuest.dbpc.profile
	if dbpc.EQignored==nil then dbpc.EQignored={} end
	for i,v in pairs(dbpc.EQignored) do
--		Loremaster:Debug(eqdbpc.ignored[i] .. "EQ" .. i)
		if eqdbpc.ignored[i] then
			eqdbpc.ignored[i]=nil
		end
	end
	dbpc.EQignored={}
	EveryQuest:UpdateFrame()
	Loremaster:Print(L["...EQ ignore list cleared."])
end

function Loremaster:SetHyperlink(self, value)
	local questid
	if string.find(tostring(value), "^quest:") then
		questid = tonumber(string.match(tostring(value), "[^quest:]%d+"))
		if not (questid==nil) then
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine(Loremaster:GetTextFromID(questid))
		end
	end
end
