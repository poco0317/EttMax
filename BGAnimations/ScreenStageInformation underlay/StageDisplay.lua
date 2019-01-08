local sStage = "Stage_Event"
----------------------------------------------------------------------------
return Def.ActorFrame {
	LoadActor( THEME:GetPathG("ScreenStageInformation", "Stage " .. ToEnumShortString(sStage) ) ) .. {
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+120)
	end,
	OnCommand=function(self)
		self:diffusealpha(0):sleep(0.3):diffusealpha(1):sleep(0.2):smooth(0.6):y(SCREEN_CENTER_Y):sleep(2):smooth(0.4):diffusealpha(0)
	end
	}
}