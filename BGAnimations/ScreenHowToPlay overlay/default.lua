-- ScreenHowToPlay Overlay

local t = Def.ActorFrame{
	LoadActor("LifeMeterBar not over")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+160):y(SCREEN_TOP+40)
		end,
		OnCommand=function(self)
			self:addy(-60):sleep(2.4):linear(0.2):addy(60):draworder(99)
		end
	},
	LoadActor("howtoplay")..{
		Name="HowToPlayBig",
		InitCommand=function(self)
			self:Center()
		end,
		OnCommand=function(self)
			self:diffusealpha(0):zoom(4):sleep(0.0):linear(0.3):diffusealpha(1):zoom(1):sleep(1.8):linear(0.3):zoom(0.5):x(170):y(60)
		end
	},
	LoadActor("feet")..{
		InitCommand=function(self)
			self:Center()
		end,
		OnCommand=function(self)
			self:addx(-SCREEN_WIDTH):sleep(2.4):decelerate(0.3):addx(SCREEN_WIDTH):sleep(2):linear(0.3):zoomy(0)
		end
	},
--Pre-Step message
	Def.ActorFrame {
		LoadActor("taphand")..{
			InitCommand=function(self)
				self:rotationy(180):rotationz(270):x(SCREEN_CENTER_X-30):y(SCREEN_CENTER_Y-130)
			end,
			OnCommand=function(self)
				self:bob():effectperiod(1):effectmagnitude(20,0,0):diffusealpha(0):sleep(6):linear(0):diffusealpha(1):sleep(2):linear(0):diffusealpha(0)
			end
		},
		LoadActor("tapmessage")..{
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X+160):y(SCREEN_CENTER_Y+40)
			end,
			OnCommand=function(self)
				self:diffusealpha(0):sleep(6):linear(0):diffusealpha(1):sleep(2):linear(0):diffusealpha(0)
			end
		}
	},
-- 1st Step -- DOWN
	Def.ActorFrame {
		LoadActor("taphand")..{
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X+128):y(SCREEN_CENTER_Y-60)
			end,
			OnCommand=function(self)
				self:bob():effectperiod(1):effectmagnitude(0,20,0):diffusealpha(0):sleep(9.7):linear(0):diffusealpha(1):sleep(1.7):linear(0):diffusealpha(0)
			end
		},
		LoadActor("tapmessage")..{
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X+160):y(SCREEN_CENTER_Y+40)
			end,
			OnCommand=function(self)
				self:diffusealpha(0):sleep(9.7):linear(0):diffusealpha(1):sleep(1.7):linear(0):diffusealpha(0)
			end
		}
	},
--2nd Step -- UP
	Def.ActorFrame {
		LoadActor("taphand")..{
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X+192):y(SCREEN_CENTER_Y-60)
			end,
			OnCommand=function(self)
				self:bob():effectperiod(1):effectmagnitude(0,20,0):diffusealpha(0):sleep(12.7):linear(0):diffusealpha(1):sleep(1.7):linear(0):diffusealpha(0)
			end
		},
		LoadActor("tapmessage")..{
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X+160):y(SCREEN_CENTER_Y+40)
			end,
			OnCommand=function(self)
				self:diffusealpha(0):sleep(12.7):linear(0):diffusealpha(1):sleep(1.7):linear(0):diffusealpha(0)
			end
		}
	},
--3rd Step -- LEFT
	Def.ActorFrame {
		LoadActor("taphand")..{
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X+64):y(SCREEN_CENTER_Y-60)
			end,
			OnCommand=function(self)
				self:bob():effectperiod(1):effectmagnitude(0,20,0):diffusealpha(0):sleep(15.7):linear(0):diffusealpha(1):sleep(1.7):linear(0):diffusealpha(0)
			end
		},
		LoadActor("tapmessage")..{
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X+160):y(SCREEN_CENTER_Y+40)
			end,
			OnCommand=function(self)
				self:diffusealpha(0):sleep(15.7):linear(0):diffusealpha(1):sleep(1.7):linear(0):diffusealpha(0)
			end
		}
	},
--4th Step -- JUMP
	Def.ActorFrame {
		LoadActor("jumphands")..{
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X+160):y(SCREEN_CENTER_Y-60)
			end,
			OnCommand=function(self)
				self:bob():effectperiod(1):effectmagnitude(0,20,0):diffusealpha(0):sleep(18.7):linear(0):diffusealpha(1):sleep(1.7):linear(0):diffusealpha(0)
			end
		},
		LoadActor("jumpmessage")..{
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X+160):y(SCREEN_CENTER_Y+40)
			end,
			OnCommand=function(self)
				self:diffusealpha(0):sleep(18.7):linear(0):diffusealpha(1):sleep(1.7):linear(0):diffusealpha(0)
			end
		}
	},
--Misstep
	Def.ActorFrame {
		LoadActor("taphand")..{
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X+228):y(SCREEN_CENTER_Y-130)
			end,
			OnCommand=function(self)
				self:bob():effectperiod(1):effectmagnitude(0,20,0):diffusealpha(0):sleep(22.7):linear(0):diffusealpha(1):sleep(1.7):linear(0):diffusealpha(0)
			end
		},
		LoadActor("missmessage")..{
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X+160):y(SCREEN_CENTER_Y+40)
			end,
			OnCommand=function(self)
				self:diffusealpha(0):sleep(22.7):linear(0):diffusealpha(1):sleep(1.7):linear(0):diffusealpha(0)
			end
		}
	}
}

return t