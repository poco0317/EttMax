local t = Def.ActorFrame {}
-- Layer1
t[#t+1] = LoadActor("_ready") .. {
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):diffusealpha(0)
	end,
	OnCommand=function(self)
		self:linear(0.5):diffusealpha(.5):sleep(0.5):linear(0.5):diffusealpha(0)
	end
}
-- Layer 2
t[#t+1] = LoadActor("_ready") .. {
	InitCommand=function(self)
		self:x(220):y(140):diffusealpha(0)
	end,
	OnCommand=function(self)
		self:linear(0.5):diffusealpha(.5):x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):sleep(0.5):linear(0.5):diffusealpha(0):x(220):y(140)
	end
}
	
-- Layer 3
t[#t+1] = LoadActor("_ready") .. {
	InitCommand=function(self)
		self:x(620):y(340):diffusealpha(0)
	end,
	OnCommand=function(self)
		self:linear(0.5):diffusealpha(.5):x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):sleep(0.5):linear(0.5):diffusealpha(0):x(620):y(340)
	end
}	

return t