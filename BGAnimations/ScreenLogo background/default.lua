local t = Def.ActorFrame {}

t[#t+1] = LoadActor("bg") .. {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end,
		OnCommand=function(self)
			self:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
		end
}

t[#t+1] = LoadActor("logo") .. {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end,
		OnCommand=function(self)
			self:zoomy(0):sleep(0.6):bounceend(0.5):zoomy(1):glowshift():effectperiod(2.5):effectcolor1(1,1,1,0.1):effectcolor2(1,1,1,0.3)
		end
}

t[#t+1] = Def.ActorFrame {
	Def.Quad {
		InitCommand=function(self)
			self:zoomto(SCREEN_WIDTH+1,SCREEN_HEIGHT)
		end,
		OnCommand=function(self)
			self:diffuse(color("0,0,0,0")):linear(0.5):diffusealpha(0)
		end
	}
}

return t
