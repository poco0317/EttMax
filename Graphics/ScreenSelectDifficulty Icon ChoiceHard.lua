local gc = Var("GameCommand")
local ind = gc:GetIndex()
local delay = ind / 10

local path = "_screenselectdifficulty icons/"
return Def.ActorFrame {
	InitCommand=function(self)
		self:zoom(0)
	end,
	OnCommand=function(self)
		self:queuecommand("In")
	end,
	InCommand=function(self)
		self:sleep(delay):zoom(1):addx(-SCREEN_CENTER_X):bounceend(0.35):addx(SCREEN_CENTER_X)
	end,
	LoadActor( path .. "info hard" )..{
		InitCommand=function(self)
			self:y(-108):vertalign(bottom)
		end
	},
	LoadActor( path .. "picture hard" )..{
		InitCommand=function(self)
			self:y(-108):valign(0)
		end,
		OnCommand=function(self)
			self:zoomy(0):sleep(1):bounceend(0.3):zoomy(1)
		end,
		OffCommand=function(self)
			self:sleep(0.6):bouncebegin(0.3):zoomy(0)
		end
	}
}