local lifeFrame = "_header"

local t = Def.ActorFrame {}

	t[#t+1] = LoadActor(lifeFrame) .. {
		InitCommand=function(self)
			self:zoom(0.75):CenterX():draworder(100)
			self:valign(0):y(SCREEN_TOP)
		end,
		OnCommand=function(self)
			self:addy(-230):smooth(1.5):addy(230)
		end
	}

	t[#t+1] = LoadActor("_tile") .. {
		InitCommand=function(self)
			self:CenterX():draworder(100):zoomto(SCREEN_WIDTH,66)
			self:valign(1):y(SCREEN_BOTTOM)
		end,
		OnCommand=function(self)
			self:addy(230):smooth(1.5):addy(-230)
		end
	}

t[#t+1] = Def.ActorFrame {
	-- P1 StageDisplay
	InitCommand=function(self)
		self:visible(GAMESTATE:IsHumanPlayer(PLAYER_1)):x(SCREEN_CENTER_X-310):draworder(100)
		self:y(SCREEN_CENTER_Y+163)
	end,
	OnCommand=function(self)
		self:addx(-SCREEN_WIDTH*0.6):smooth(1.5):addx(SCREEN_WIDTH*0.6)
	end,
	LoadActor("_diffpoda") .. { 
			  OnCommand=function(self)
			  	self:playcommand("Set")
			  end,
			  CurrentStepsP1ChangedMessageCommand=function(self)
			  	self:playcommand("Set")
			  end,
			  PlayerJoinedMessageCommand=function(self)
			  	self:playcommand("Set"):diffusealpha(0):smooth(0.3):diffusealpha(1)
			  end,
			  SetCommand=function(self)
				stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
				local song = GAMESTATE:GetCurrentSong()
				if song then 
					if stepsP1 ~= nil then
					local st = stepsP1:GetStepsType()
					local diff = stepsP1:GetDifficulty()
					local cd = GetCustomDifficulty(st, diff)
					self:diffuse(CustomDifficultyToColor(cd))
					else
						self:settext("")
					end
				else
					self:settext("")
				end
			  end	
	},
	LoadFont("_impact 24px") .. { 
		OnCommand=function(self)
			self:uppercase(true):skewx(-0.1):zoom(0.7):playcommand("Set")
		end,
		CurrentStepsP1ChangedMessageCommand=function(self)
			self:playcommand("Set")
		end,
		PlayerJoinedMessageCommand=function(self)
			self:playcommand("Set"):diffusealpha(0):smooth(0.3):diffusealpha(1)
		end,
		ChangedLanguageDisplayMessageCommand=function(self)
			self:playcommand("Set")
		end,
		SetCommand=function(self)
			stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
			local song = GAMESTATE:GetCurrentSong()
			if song then 
				if stepsP1 ~= nil then
				local st = stepsP1:GetStepsType()
				local diff = stepsP1:GetDifficulty()
				local cd = GetCustomDifficulty(st, diff)
				self:settext(THEME:GetString("CustomDifficulty",ToEnumShortString(diff)))
				self:diffuse(ColorLightTone(CustomDifficultyToColor(cd)))
				else
					self:settext("")
				end
			else
				self:settext("")
			end
		end	
	}
}
	
t[#t+1] = LoadActor("frame") .. {
	InitCommand=function(self)
		self:CenterX():draworder(100)
		self:valign(1):y(SCREEN_BOTTOM)
	end,
	OnCommand=function(self)
		self:addy(230):smooth(1.5):addy(-230)
	end
}
	
t[#t+1] = LoadFont("_neuropol 36px") .. {
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X):y(SCREEN_TOP+50):draworder(101):shadowlength(1)
	end,
	OnCommand=function(self)
		self:draworder(75):addy(-230):smooth(1.5):addy(230)
	end,
	CurrentSongChangedMessageCommand=function(self)
		self:playcommand("Set")
	end,
	CurrentCourseChangedMessageCommand=function(self)
		self:playcommand("Set")
	end,
	CurrentStepsP1ChangedMessageCommand=function(self)
		self:playcommand("Set")
	end,
	CurrentStepsP2ChangedMessageCommand=function(self)
		self:playcommand("Set")
	end,
	CurrentTraiP1ChangedMessageCommand=function(self)
		self:playcommand("Set")
	end,
	CurrentTraiP2ChangedMessageCommand=function(self)
		self:playcommand("Set")
	end,
	SetCommand=function(self)
		local curScreen = Var "LoadingScreen"
		local curStageIndex = GAMESTATE:GetCurrentStageIndex() + 1
		local playMode = GAMESTATE:GetPlayMode()
		local curStage = "Stage_Event"
		if GAMESTATE:IsEventMode() then
			self:settextf("Event")
		else
			self:settextf("%s", ToEnumShortString(curStage))
		end
		self:zoom(0.5)
		self:diffuse(StageToColor(curStage))
		self:strokecolor(ColorDarkTone(StageToColor(curStage)))
	end
}
return t