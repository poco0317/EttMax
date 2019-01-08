local curScreen = Var "LoadingScreen"
local curStageIndex = GAMESTATE:GetCurrentStageIndex() + 1
local playMode = GAMESTATE:GetPlayMode()

local t = Def.ActorFrame {
	LoadFont("_shared2") .. {
		InitCommand=function(self)
			self:y(-1):shadowlength(1):playcommand("Set")
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
					self:settextf("%s", curStageIndex)
				else
					self:settextf("%s", ToEnumShortString(curStage))
				end
			end
			self:zoom(1.0)
			self:diffuse(StageToColor(curStage))
			self:strokecolor(ColorDarkTone(StageToColor(curStage)))
		end
	}
}
return t

