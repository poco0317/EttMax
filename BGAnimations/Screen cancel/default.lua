return Def.ActorFrame {
	Def.Quad {
		InitCommand=function(self)
			self:Center():zoomto(SCREEN_WIDTH+1,SCREEN_HEIGHT):draworder(4444)
		end,
		OnCommand=function(self)
			self:diffuse(color("0,0,0,1")):cropleft(1):fadeleft(0.5):linear(0.5):cropleft(-0.5)
		end
	},
	LoadActor(THEME:GetPathS("Common","back")) .. {
		StartTransitioningCommand=function(self)
			self:play()
		end
	}
}