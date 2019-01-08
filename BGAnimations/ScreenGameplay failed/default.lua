-- Swiped from Konamix; thank you!
-- ScreenGameplay out
local travelDist = SCREEN_WIDTH*2
local LeftToRight = Def.ActorFrame{
	LoadActor("_LeftToRight"),
	Def.Quad{
		InitCommand=function(self)
			self:addx(-64):diffuse(color("#000000FF")):halign(1):zoomto(travelDist,32)
		end
	}
}

local RightToLeft = Def.ActorFrame{
	LoadActor("_RightToLeft"),
	Def.Quad{
		InitCommand=function(self)
			self:addx(64):diffuse(color("#000000FF")):halign(0):zoomto(travelDist,32)
		end
	}
}

local t = Def.ActorFrame{
	Def.Quad{
		Name="Blocker",
		InitCommand=function(self)
			self:Center():FullScreen():diffuse(color("0,0,0,0"))
		end,
		OnCommand=function(self)
			self:sleep(0.6):linear(0.6):diffusealpha(1)
		end
	},

	-- LeftToRight x6
	LeftToRight..{
		InitCommand=function(self)
			self:x(SCREEN_LEFT-640):y(SCREEN_CENTER_Y-160)
		end,
		OnCommand=function(self)
			self:linear(1.2):addx(travelDist)
		end
	},
	LeftToRight..{
		InitCommand=function(self)
			self:x(SCREEN_LEFT-480):y(SCREEN_CENTER_Y-96)
		end,
		OnCommand=function(self)
			self:linear(1.2):addx(travelDist)
		end
	},
	LeftToRight..{
		InitCommand=function(self)
			self:x(SCREEN_LEFT-320):y(SCREEN_CENTER_Y-32)
		end,
		OnCommand=function(self)
			self:linear(1.2):addx(travelDist)
		end
	},
	LeftToRight..{
		InitCommand=function(self)
			self:x(SCREEN_LEFT-320):y(SCREEN_CENTER_Y+32)
		end,
		OnCommand=function(self)
			self:linear(1.2):addx(travelDist)
		end
	},
	LeftToRight..{
		InitCommand=function(self)
			self:x(SCREEN_LEFT-400):y(SCREEN_CENTER_Y+96)
		end,
		OnCommand=function(self)
			self:linear(1.2):addx(travelDist)
		end
	},
	LeftToRight..{
		InitCommand=function(self)
			self:x(SCREEN_LEFT-480):y(SCREEN_CENTER_Y+160)
		end,
		OnCommand=function(self)
			self:linear(1.2):addx(travelDist)
		end
	},

	-- RightToLeft x6
	RightToLeft..{
		InitCommand=function(self)
			self:x(SCREEN_RIGHT+560):y(SCREEN_CENTER_Y-192)
		end,
		OnCommand=function(self)
			self:linear(1.2):addx(-travelDist)
		end
	},
	RightToLeft..{
		InitCommand=function(self)
			self:x(SCREEN_RIGHT+480):y(SCREEN_CENTER_Y-128)
		end,
		OnCommand=function(self)
			self:linear(1.2):addx(-travelDist)
		end
	},
	RightToLeft..{
		InitCommand=function(self)
			self:x(SCREEN_RIGHT+400):y(SCREEN_CENTER_Y-64)
		end,
		OnCommand=function(self)
			self:linear(1.2):addx(-travelDist)
		end
	},
	RightToLeft..{
		InitCommand=function(self)
			self:x(SCREEN_RIGHT+320):y(SCREEN_CENTER_Y)
		end,
		OnCommand=function(self)
			self:linear(1.2):addx(-travelDist)
		end
	},
	RightToLeft..{
		InitCommand=function(self)
			self:x(SCREEN_RIGHT+400):y(SCREEN_CENTER_Y+64)
		end,
		OnCommand=function(self)
			self:linear(1.2):addx(-travelDist)
		end
	},
	RightToLeft..{
		InitCommand=function(self)
			self:x(SCREEN_RIGHT+480):y(SCREEN_CENTER_Y+128)
		end,
		OnCommand=function(self)
			self:linear(1.2):addx(-travelDist)
		end
	},
	
	Def.ActorFrame {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end,
		LoadActor("_failed") .. {
			OnCommand=function(self)
				self:diffusealpha(0):zoom(4):sleep(0.8):decelerate(0.6):diffusealpha(0.4):zoom(0.6):accelerate(0.4):zoom(1):decelerate(0.2):zoom(1.1):linear(0.1):zoom(1.0):sleep(2):linear(0.5):diffusealpha(0)
			end
		},
			
		LoadActor("_failed") .. {
			OnCommand=function(self)
				self:diffusealpha(0):zoom(4):sleep(0.7):decelerate(0.6):diffusealpha(0.4):zoom(0.6):accelerate(0.4):zoom(1):decelerate(0.2):zoom(1.1):linear(0.1):zoom(1.0):sleep(2):linear(0.5):diffusealpha(0)
			end
		},
				
		LoadActor("_failed") .. {
			OnCommand=function(self)
				self:diffusealpha(0):zoom(4):sleep(0.6):decelerate(0.6):diffusealpha(0.4):zoom(0.6):accelerate(0.4):zoom(1):decelerate(0.2):zoom(1.1):linear(0.1):zoom(1.0):sleep(2):linear(0.5):diffusealpha(0)
			end
		},

		LoadActor("_failed") .. {
			OnCommand=function(self)
				self:diffusealpha(0):zoom(4):sleep(0.5):decelerate(0.6):diffusealpha(0.4):zoom(0.6):accelerate(0.4):zoom(1):decelerate(0.2):zoom(1.1):linear(0.1):zoom(1.0):sleep(2):linear(0.5):diffusealpha(0)
			end
		},

		LoadActor("_failed") .. {
			OnCommand=function(self)
				self:diffusealpha(0):zoom(4):sleep(0.9):decelerate(0.6):diffusealpha(1.0):zoom(0.6):accelerate(0.4):zoom(1):sleep(3):smooth(1):diffusealpha(0)
			end
		},
	},
	
	LoadActor("_sound") .. {
		StartTransitioningCommand=function(self)
			self:play()
		end
	}
}

return t