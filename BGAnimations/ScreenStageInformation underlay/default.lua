local playMode = GAMESTATE:GetPlayMode()
if playMode ~= 'PlayMode_Regular' then
	curStage = playMode
end
local sStage = "Stage_Event"

local t = Def.ActorFrame {}

t[#t+1] = Def.ActorFrame {
	Def.Quad {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):diffuse(color("#000000")):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
		end,
		OnCommand=function(self)
			self:diffusealpha(0):decelerate(0.3):diffusealpha(1)
		end
	}
}

t[#t+1] = LoadActor("StageDisplay")

t[#t+1] = Def.ActorFrame {
	Def.Quad {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_BOTTOM):vertalign(bottom):diffuse(color("#000000")):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT/2-40)
		end,
		OnCommand=function(self)
			self:diffusealpha(0):sleep(0.3):diffusealpha(1)
		end
	}
}

t[#t+1] = Def.ActorFrame {
	LoadActor("_underline") ..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+40)
		end,
		OnCommand=function(self)
			self:zoomx(0):sleep(0.5):smooth(0.1):zoomx(0.5):diffusealpha(0.5):linear(0.1):zoomx(1):diffusealpha(1):sleep(0.1):accelerate(0.2):zoomx(0):diffusealpha(0)
		end
	}
}

return t