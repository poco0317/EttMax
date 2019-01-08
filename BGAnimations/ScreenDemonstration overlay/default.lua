local t = Def.ActorFrame{}

t[#t+1] = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self)
			self:Center():zoomto(SCREEN_WIDTH,120):diffuse(color("0,0,0,0.7"))
		end
	},
	LoadActor("demonstration")..{
		InitCommand=function(self)
			self:Center()
		end,
		OnCommand=function(self)
			self:diffuseblink():effectperiod(1)
		end
	}
}

return t