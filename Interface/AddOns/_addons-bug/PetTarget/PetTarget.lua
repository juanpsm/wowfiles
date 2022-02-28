
function TargetofPet_OnLoad (self)

   local frameLevel = PetFrame:GetFrameLevel();
   TargetofPetFrame:SetFrameLevel(frameLevel-1);

   UnitFrame_Initialize(self, "pet-target", TargetofPetName, TargetofPetPortrait,
			TargetofPetHealthBar, TargetofPetHealthBarText,
			TargetofPetManaBar, TargetofFocusPetManaBarText,
			TargetofPetThreatIndicator, "player");
   SetTextStatusBarTextZeroText(TargetofPetHealthBar, DEAD);
   self:RegisterEvent("UNIT_AURA");

   RegisterStateDriver( self, "show", "[@pet-target,exists,novehicleui] show; [@pet-target,noexists] hide;" );

   SecureUnitButton_OnLoad(self, "pet-target");

end

function TargetofPet_Update (self, elapsed)
   self = TargetofPetFrame;
   
   if ( UnitExists("pet") and UnitExists("pet-target") ) then

      UnitFrame_Update(self);
      TargetofPet_CheckDead();
      TargetofPetHealthCheck();
      RefreshDebuffs(TargetofPetFrame, "pet-target");
   end

end

hooksecurefunc( 'PetFrame_OnUpdate', TargetofPet_Update );

function TargetofPet_OnEvent( self, event, ... )
   UnitFrame_OnEvent( self, event, ... );

   TargetofPet_Update();
end


function TargetofPet_CheckDead ()

   if ( (UnitHealth("pet-target") <= 0) and UnitIsConnected("pet-target") ) then
      TargetofPetBackground:SetAlpha(0.9);
      TargetofPetDeadText:Show();
   else
      TargetofPetBackground:SetAlpha(1);
      TargetofPetDeadText:Hide();
   end
end

function TargetofPetHealthCheck ()

   if ( UnitIsPlayer("pet-target") ) then
      local unitHPMin, unitHPMax, unitCurrHP;
      unitHPMin, unitHPMax = TargetofPetHealthBar:GetMinMaxValues();
      unitCurrHP = TargetofPetHealthBar:GetValue();
      TargetofPetFrame.unitHPPercent = (unitCurrHP / unitHPMax);
      if ( UnitIsDead("pet-target") ) then
	 TargetofPetPortrait:SetVertexColor(0.35, 0.35, 0.35, 1.0);
      elseif ( UnitIsGhost("pet-target") ) then
	 TargetofPetPortrait:SetVertexColor(0.2, 0.2, 0.75, 1.0);
      elseif ( (TargetofPetFrame.unitHPPercent > 0) and (TargetofPetFrame.unitHPPercent <= 0.2) ) then
	 TargetofPetPortrait:SetVertexColor(1.0, 0.0, 0.0);
      else
	 TargetofPetPortrait:SetVertexColor(1.0, 1.0, 1.0, 1.0);
      end
   end
end
