local s = THEME:GetString( 'ScreenTitleMenu', Var("GameCommand"):GetText() )
local t = Def.ActorFrame {
	LoadFont("_spaceport 2006 Bold 36px") ..{
		InitCommand=function(self)
			self:uppercase(true):settext(s):halign(0.5):strokecolor(Color("Black")):shadowlength(6)
		end,
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.25):zoom(1.0):diffuseshift():effectperiod(0.5):effectcolor1(0.5,1,0.5,1):effectcolor2(0.25,0.5,0.25,1)
		end,
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.25):zoom(0.7):stopeffect()
		end,
		DisabledCommand=function(self)
			self:diffuse(0.5,0.5,0.5,1)
		end
	}
}

return t