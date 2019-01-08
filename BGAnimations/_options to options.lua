return Def.ActorFrame{
	LoadActor(THEME:GetPathS("","_swoosh"))..{
		StartTransitioningCommand=function(self)
			self:play()
		end
	}
}