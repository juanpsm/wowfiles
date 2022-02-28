--[[
	main.lua
		The bagnon driver thingy
--]]

local Bagnon = LibStub('AceAddon-3.0'):GetAddon('Bagnon')
local VoidStorage = Bagnon:NewModule('VoidStorage', 'AceEvent-3.0')
local L = LibStub('AceLocale-3.0'):GetLocale('Bagnon-VoidStorage')

function VoidStorage:OnEnable()
	Bagnon.VaultFrame:New('voidstorage', L.Title)

	self:RegisterEvent('VOID_STORAGE_CLOSE')
	self:RegisterEvent('VOID_STORAGE_OPEN')
end

function VoidStorage:VOID_STORAGE_OPEN()
	IsVoidStorageReady()
	Bagnon.FrameSettings:Get('voidstorage'):Show()
	
	if not CanUseVoidStorage() then
		if Bagnon.VAULT_COST > GetMoney() then
			StaticPopup_Show('BAGNON_CANNOT_PURCHASE_VAULT')
		else
			StaticPopup_Show('BAGNON_VAULT_PURCHASE')
		end
	end
end

function VoidStorage:VOID_STORAGE_CLOSE()
	Bagnon.FrameSettings:Get('voidstorage'):Hide()
end
