local t = Def.ActorFrame {}

t[#t+1] = Def.ActorFrame {
	LoadActor("_footer tile") .. {
		InitCommand=function(self)
			self:zoomto(SCREEN_WIDTH,32)
		end
	},
	LoadActor("_shared footer") .. {}
}

return t