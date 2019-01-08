local t = LoadFallbackB()

t[#t+1] =  Def.ActorFrame {
	--[[ LoadActor( "more" )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-320+580):y(SCREEN_CENTER_Y-240+90)
		end
		OnCommand=function(self)
			self:addx(SCREEN_WIDTH/2):linear(0.2):addx(-SCREEN_WIDTH/2)
		end
		OffCommand=function(self)
			self:linear(0.3):zoom(0):addx(SCREEN_WIDTH/2)
		end
	}]]
	LoadFont("Common", "normal")..{
		Text=THEME:GetString(Var "LoadingScreen", "HelpText"),
		InitCommand=function(self)
			self:draworder(101):x(SCREEN_CENTER_X):y(SCREEN_BOTTOM-24):shadowlength(0)
		end,
		OnCommand=function(self)
			self:queuecommand("In")
		end,
		InCommand=function(self)
			self:zoom(0.5):zoomy(0):linear(0.5):zoomy(0.5):diffuseblink()
		end,
		OffCommand=function(self)
			self:linear(0.5):zoomy(0)
		end
	}
}

return t