local t = LoadFallbackB()

t[#t+1] = Def.ActorFrame {
	LoadActor( "explanation" )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+160):y(SCREEN_CENTER_Y-70)
		end,
		OnCommand=function(self)
			self:addx(400):bounceend(0.5):addx(-400)
		end,
		OffCommand=function(self)
			self:bouncebegin(0.5):addx(400)
		end
	},
	LoadActor( "warning" )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+160):y(SCREEN_CENTER_Y+160)
		end,
		OnCommand=function(self)
			self:addy(-120):zoomy(0):decelerate(0.5):zoomy(1):addy(120):diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("0.4,0.4,0.4,1"))
		end,
		OffCommand=function(self)
			self:accelerate(0.3):zoomy(0):y(SCREEN_CENTER_Y+40)
		end
	},
	LoadFont("Common", "normal")..{
		Text=THEME:GetString(Var "LoadingScreen", "HelpText"),
		InitCommand=function(self)
			self:draworder(101):x(SCREEN_CENTER_X):y(SCREEN_BOTTOM-24):shadowlength(0)
		end,
		OnCommand=function(self)
			self:zoom(0.5):zoomy(0):linear(0.5):zoomy(0.5):diffuseblink()
		end,
		OffCommand=function(self)
			self:linear(0.5):zoomy(0)
		end
	}
}

return t