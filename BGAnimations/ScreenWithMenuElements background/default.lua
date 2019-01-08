local t = Def.ActorFrame {}

t[#t+1] = LoadActor("bg") .. {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end,
		OnCommand=function(self)
			self:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
		end
}

return t
