return Def.ActorFrame {
	LoadActor( THEME:GetPathS("", "_swoosh") ) .. {
		StartTransitioningCommand=function(self)
			self:play()
		end
	},
	LoadActor( THEME:GetPathG("", "_moveon" ) )..{
		OnCommand=function(self)
			self:Center():zoomy(0):diffuse(0,0,0,0):linear(0.5):diffuse(1,1,1,1):zoomy(1)
		end
	}
}