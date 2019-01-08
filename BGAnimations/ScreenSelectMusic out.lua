return Def.ActorFrame{
	LoadActor(THEME:GetPathS("","_swoosh"))..{
		StartTransitioningCommand=function(self)
			self:play()
		end
	},

	Def.Quad{
		InitCommand=function(self)
			self:Center():FullScreen():diffuse(color("0,0,0,0"))
		end,
		OnCommand=function(self)
			self:diffusealpha(0):sleep(1):linear(0.333):diffusealpha(1)
		end
	}
}