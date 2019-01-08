return Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self)
			self:FullScreen():diffuse(color("0,0,0,1"))
		end,
		OnCommand=function(self)
			self:diffusealpha(0):linear(0.3):diffusealpha(1)
		end
	}
}