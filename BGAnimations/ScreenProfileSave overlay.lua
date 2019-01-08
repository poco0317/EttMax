local x = Def.ActorFrame{
	LoadActor( THEME:GetPathG("", "_moveon" ) )..{
		InitCommand=function(self)
			self:Center()
		end,
		OnCommand=function(self)
			self:zoomy(0):linear(0.3):zoomy(1.0):sleep(0.5)
		end
	}
}

x[#x+1] = Def.Actor {
	BeginCommand=function(self)
		if SCREENMAN:GetTopScreen():HaveProfileToSave() then
			self:sleep(0.01)
		end
		self:queuecommand("Load")
	end,
	LoadCommand=function()
		SCREENMAN:GetTopScreen():Continue()
	end
}

return x
