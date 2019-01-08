local gc = Var("GameCommand")
local st = gc:GetName()

local t = Def.ActorFrame {
	LoadActor( "preview " .. st ) .. {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-150):y(SCREEN_CENTER_Y+40)
		end,
		OnCommand=function(self)
			self:finishtweening():diffusealpha(0):glow(color("1,1,1,0")):linear(0.2):glow(color("1,1,1,1")):linear(0.0):diffusealpha(1):linear(0.2):glow(color("1,1,1,0"))
		end,
		OffCommand=function(self)
			self:finishtweening():linear(0.5):diffusealpha(0):glow(1,1,1,0)
		end,
		GainFocusCommand=function(self)
			self:visible(true):queuecommand("On")
		end,
		LoseFocusCommand=function(self)
			self:queuecommand("Off"):visible(false)
		end
	},
	LoadActor( "card frame " .. st )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+160):y(SCREEN_CENTER_Y+40)
		end,
		OnCommand=function(self)
			self:finishtweening():zoomy(0):bounceend(0.5):zoomy(1)
		end,
		OffCommand=function(self)
			self:finishtweening():bouncebegin(0.5):zoomy(0)
		end,
		GainFocusCommand=function(self)
			self:visible(true):queuecommand("On")
		end,
		LoseFocusCommand=function(self)
			self:queuecommand("Off"):visible(false)
		end
	},
	Def.ActorFrame {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-260+gc:GetIndex()*80):y(84)
		end,
		LoadActor( "icon " .. st ) .. {
			OnCommand=function(self)
				self:addx(-SCREEN_WIDTH):sleep(0.20):decelerate(0.3):addx(SCREEN_WIDTH)
			end,
			OffCommand=function(self)
				self:bouncebegin(0.5):zoomy(0)
			end,
			EnabledCommand=function(self)
				self:diffuse(color("1,1,1,1"))
			end,
			DisabledCommand=function(self)
				self:diffuse(color(".5,.5,.5,1"))
			end,
			GainFocusCommand=function(self)
				self:glowshift():effectperiod(0.5)
			end,
			LoseFocusCommand=function(self)
				self:stopeffect()
			end
		}
	}
}

return t