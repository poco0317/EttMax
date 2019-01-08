local t = Def.ActorFrame {}

t[#t+1] = Def.ActorFrame {
	LoadActor("_right") .. {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+25):y(SCREEN_TOP+25):zoomy(0.8)
		end,
		OnCommand=function(self)
			self:addx(SCREEN_WIDTH*0.6):bounceend(0.5):addx(-SCREEN_WIDTH*0.6)
		end,
		OffCommand=function(self)
			self:bounceend(0.5):addx(SCREEN_WIDTH)
		end
	}
}

return t