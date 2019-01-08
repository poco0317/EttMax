local curScreen = Var "LoadingScreen"
local curStage = "Stage_1st"
local curStageIndex = GAMESTATE:GetCurrentStageIndex()
local t = Def.ActorFrame {}

t[#t+1] = Def.ActorFrame {
	LoadFont("_neuropol 36px") .. {
		InitCommand=function(self)
			self:y(-1):shadowlength(1)
		end,
		BeginCommand=function(self)
			local top = SCREENMAN:GetTopScreen()
			if top then
				if not string.find(top:GetName(),"ScreenEvaluation") then
					curStageIndex = curStageIndex + 1
				end
			end
			self:playcommand("Set")
		end,
		SetCommand=function(self)
			if GAMESTATE:IsEventMode() then
				self:settextf("Stage %s", curStageIndex)
			else
				if THEME:GetMetric(curScreen,"StageDisplayUseShortString") then
				  self:settextf("%s", ToEnumShortString(curStage))
				  self:zoom(1)
				else
				  self:settextf("%s Stage", ToEnumShortString(curStage))
				  self:zoom(1)
				end
			end
			-- StepMania is being stupid so we have to do this here
			self:diffuse(StageToColor(curStage))
			self:strokecolor(ColorDarkTone(StageToColor(curStage)))
		end
	}
}
return t