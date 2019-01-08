return Def.ActorFrame{
	LoadActor("caution")..{
		InitCommand=function(self)
			self:Center()
		end
	}
}