local lifeFrame = "_header"

if GAMESTATE:IsAnExtraStage() then lifeFrame = "_eheader" end

local t = Def.ActorFrame {}

	t[#t+1] = LoadActor(lifeFrame) .. {
		InitCommand=function(self)
			self:zoom(0.75):CenterX():draworder(100)
			if GAMESTATE:IsAnExtraStage() then
				self:valign(1):y(SCREEN_BOTTOM)
			else
				self:valign(0):y(SCREEN_TOP)
			end
		end,
		OnCommand=function(self)
			if GAMESTATE:IsAnExtraStage() then
				self:addy(230):smooth(1.5):addy(-230)
			else
				self:addy(-230):smooth(1.5):addy(230)
			end
		end
	}

	t[#t+1] = LoadActor("_tile") .. {
		InitCommand=function(self)
			self:CenterX():draworder(100):zoomto(SCREEN_WIDTH,66)
			if GAMESTATE:IsAnExtraStage() then
				self:valign(1):zoomy(-1):y(SCREEN_TOP)
			else
				self:valign(1):y(SCREEN_BOTTOM)
			end
		end,
		OnCommand=function(self)
			if GAMESTATE:IsAnExtraStage() then
				self:addy(-230):smooth(1.5):addy(230)
			else
				self:addy(230):smooth(1.5):addy(-230)
			end
		end
	}

	t[#t+1] = Def.ActorFrame {
	-- P1 StageDisplay
	InitCommand=function(self)
		self:visible(GAMESTATE:IsHumanPlayer(PLAYER_1)):x(SCREEN_CENTER_X-310):draworder(100)
		if GAMESTATE:IsAnExtraStage() then
			self:y(SCREEN_CENTER_Y-163)
		else
			self:y(SCREEN_CENTER_Y+163)
		end
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
					local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil
					local cd = GetCustomDifficulty(st, diff, courseType)
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
					local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil
					local cd = GetCustomDifficulty(st, diff, courseType)
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
	
	t[#t+1] = Def.ActorFrame {
	-- P2 StageDisplay
	InitCommand=function(self)
		self:visible(GAMESTATE:IsHumanPlayer(PLAYER_2)):x(SCREEN_CENTER_X+310):draworder(100)
		if GAMESTATE:IsAnExtraStage() then
			self:y(SCREEN_CENTER_Y-163)
		else
			self:y(SCREEN_CENTER_Y+163)
		end
	end,
	OnCommand=function(self)
		self:addx(SCREEN_WIDTH*0.6):smooth(1.5):addx(-SCREEN_WIDTH*0.6)
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
				stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_2)
				local song = GAMESTATE:GetCurrentSong()
				if song then 
					if stepsP1 ~= nil then
					local st = stepsP1:GetStepsType()
					local diff = stepsP1:GetDifficulty()
					local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil
					local cd = GetCustomDifficulty(st, diff, courseType)
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
				stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_2)
				local song = GAMESTATE:GetCurrentSong()
				if song then 
					if stepsP1 ~= nil then
					local st = stepsP1:GetStepsType()
					local diff = stepsP1:GetDifficulty()
					local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil
					local cd = GetCustomDifficulty(st, diff, courseType)
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
			if GAMESTATE:IsAnExtraStage() then
				self:valign(1):zoomy(-1):y(SCREEN_TOP)
			else
				self:valign(1):y(SCREEN_BOTTOM)
			end
		end,
		OnCommand=function(self)
			if GAMESTATE:IsAnExtraStage() then
				self:addy(-230):smooth(1.5):addy(230)
			else
				self:addy(230):smooth(1.5):addy(-230)
			end
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
			local curStage = GAMESTATE:GetCurrentStage()
			if GAMESTATE:IsCourseMode() then
				local stats = STATSMAN:GetCurStageStats()
				if not stats then
					return
				end
				local mpStats = stats:GetPlayerStageStats( GAMESTATE:GetMasterPlayerNumber() )
				local songsPlayed = mpStats:GetSongsPassed() + 1
				self:settextf("%i / %i", songsPlayed, GAMESTATE:GetCurrentCourse():GetEstimatedNumStages())
			else
				if GAMESTATE:IsEventMode() then
					self:settextf("Event")
				else
					self:settextf("%s", ToEnumShortString(curStage))
				end
			end
			self:zoom(0.5)
			self:diffuse(StageToColor(curStage))
			self:strokecolor(ColorDarkTone(StageToColor(curStage)))
		end
	}
return t