return Def.ActorFrame{
	LoadActor("bg")..{
		InitCommand=function(self)
			self:Center()
		end
	}
}