local function radarSet(self,player)
	local selection = nil
	if GAMESTATE:GetCurrentSong() then
		selection = GAMESTATE:GetCurrentSteps(PLAYER_1)
	end
	if selection then
		self:SetFromRadarValues(PLAYER_1, selection:GetRadarValues(PLAYER_1))
	else
		self:SetEmpty(PLAYER_1)
	end
end
local t = Def.GrooveRadar {
		CurrentSongChangedMessageCommand=function(self)
			for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
				radarSet(self, PLAYER_1)
			end
		end,
		CurrentStepsP1ChangedMessageCommand=function(self)
			radarSet(self, PLAYER_1)
		end,
		CurrentTrailP1ChangedMessageCommand=function(self)
			radarSet(self, PLAYER_1)
		end
	}
return t