local fSleepTime = THEME:GetMetric( Var "LoadingScreen","ScreenInDelay")
return Def.ActorFrame {
	OnCommand=function(self)
		self:sleep(0.15+fSleepTime)
	end,
	Def.Quad {
		InitCommand=function(self)
			self:Center():zoomto(SCREEN_WIDTH+1,SCREEN_HEIGHT)
		end,
		OnCommand=function(self)
			self:diffuse(color("0,0,0,0")):diffusealpha(0):sleep(fSleepTime):linear(0.3):diffusealpha(1)
		end
	}
}