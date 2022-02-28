-- Help for Ace3: http://www.wowace.com/addons/ace3/pages/getting-started/

local debug=false
--@alpha@
debug=true
--@end-alpha@

local GuildManager = LibStub("AceAddon-3.0"):NewAddon("GuildManager","AceEvent-3.0", "AceConsole-3.0")
local frame, events = CreateFrame("Frame"), {};

local currentTab = 0
local moneyTab = 7
local numGuildTabs = 0

local L = LibStub("AceLocale-3.0"):GetLocale("GuildManager", not debug)
 
function GuildManager:OnInitialize()
    -- do init tasks here, like loading the Saved Variables, 
    -- or setting up slash commands.
end

function GuildManager:OnDisable()
    -- Unhook, Unregister Events, Hide frames that you created.
    -- You would probably only use an OnDisable if you want to 
    -- build a "standby" mode, or be able to toggle modules on/off.
end

function GuildManager:GUILDBANKLOG_UPDATE(eventName, ...)
    --@alpha@
    GuildManager:Print("Updating guildBankLog for tab "..currentTab);
    --@end-alpha@
    for index=1, GetNumGuildBankTransactions(currentTab) do
        local type, name, itemLink, count, tab1, tab2, year, month, day, hour = GetGuildBankTransaction(currentTab, index)
        transactionTime = RecentTimeDate(year, month, day, hour)
        --if not type == "move" then
            if guildBankLog == nil then
               guildBankLog = {}
            end
            if guildBankLog[name]==nil then
               guildBankLog[name]={}
            end
            if guildBankLog[name][currentTab]==nil then
              guildBankLog[name][currentTab]={}
            end
            if guildBankLog[name][currentTab][transactionTime]==nil then
              guildBankLog[name][currentTab][transactionTime]={}
            end
            if guildBankLog[name][currentTab][transactionTime][type]==nil then
              guildBankLog[name][currentTab][transactionTime][type]={}
            end
            if guildBankLog[name][currentTab][transactionTime][type][itemLink]==nil then
              guildBankLog[name][currentTab][transactionTime][type][itemLink]=count
              --[===[@debug@
              GuildManager:Print("Added")
              --@end-debug@]===]
            end
        --[===[@debug@
		--else
            GuildManager:Print("Type: Move")
        --@end-debug@]===]
        --end
    end
    local nextTab = currentTab +1

    if numTabs == currentTab then
        nextTab = moneyTab
    else
        nextTab = currentTab + 1
    end

    if currentTab < moneyTab then
        currentTab = nextTab
        QueryGuildBankLog(currentTab)
    else 
            GuildManager:UnregisterEvent("GUILDBANKLOG_UPDATE")
    end
end

function GuildManager:GUILDBANKFRAME_OPENED(eventName, ...)
    -- handle Guild Bank Open
    numTabs = GetNumGuildBankTabs()
    currentTab = 1
    GuildManager:RegisterEvent("GUILDBANKLOG_UPDATE")
    QueryGuildBankLog(currentTab)
end

function split(pString, pPattern)
    local Table = {} -- NOTE: use {n = 0} in Lua-5.0
    local fpat = "(.-)" .. pPattern
    local last_end = 1
    local s, e, cap = pString:find(fpat, 1)
    while s do
        if s ~= 1 or cap ~= "" then
            table.insert(Table,cap)
        end
        last_end = e+1
        s, e, cap = pString:find(fpat, last_end)
    end
    if last_end <= #pString then
        cap = pString:sub(last_end)
        table.insert(Table, cap)
    end
    return Table
end

-- http://wowprogramming.com/docs/api/GetGuildRosterInfo
function GuildManager:GUILD_ROSTER_UPDATE(isChached)
    for index=1,GetNumGuildMembers() do
        name, rank, rankIndex, level, class, zone, note, officernote, online, status, classFileName = GetGuildRosterInfo(index)
        
        invited, invitor, realname = split(officernote,',')
    end
end

function GuildManager:startInterface( input )
    Guildmanager:RegisterEvent("GUILD_ROSTER_UPDATE")
    GuildRoster()
end

function GuildManager:OnEnable()
    -- Do more initialization here, that really enables the use of your addon.
    -- Register Events, Hook functions, Create Frames, Get information from 
    -- the game that wasn't available in OnInitialize

    --f:RegisterEvent("GUILDBANKFRAME_OPENED");
    --f:SetScript("OnEvent",GUILDBANKFRAME_OPENED)
    --f:RegisterEvent("GUILDBANKLOG_UPDATE");
    --f:SetScript("OnEvent",GUILDBANKLOG_UPDATE)
    GuildManager:RegisterEvent("GUILDBANKFRAME_OPENED")
    
    GuildManager:RegisterChatCommand("guildmanager", "startInterface")
end


