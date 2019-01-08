return Def.ActorFrame {

	LoadActor(THEME:GetPathS("", "_swoosh") )..{
		StartTransitioningCommand=function(self)
			self:play()
		end
	},

	Def.Quad {
		InitCommand=function(self)
			self:Center():zoomto(SCREEN_WIDTH+1,SCREEN_HEIGHT)
		end,
		OnCommand=function(self)
			self:diffuse(color("0,0,0,0")):diffusealpha(1):linear(0.3):diffusealpha(0)
		end
	}
}