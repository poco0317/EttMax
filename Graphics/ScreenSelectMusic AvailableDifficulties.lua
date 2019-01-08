local t = Def.ActorFrame { }
for idx, diff in pairs(Difficulty) do -- 0, Difficulty_Beginner
	if idx < 6 then
		t[#t+1] = LoadActor( "DifficultyDisplay bar" ) .. {
			InitCommand=function(self)
				self:SetTextureFiltering(false):pause():setstate(Difficulty:Reverse()[diff])
			end,
			ShowCommand=function(self)
				self:stoptweening():linear(0.18):diffuse(color("1,1,1,1"))
			end,
			HideCommand=function(self)
				self:stoptweening():linear(0.18):diffusealpha(0)
			end,
			BeginCommand=function(self)
				self:y(35*idx)
			end,

			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				local st = GAMESTATE:GetCurrentStyle():GetStepsType()
				local bHasStepsTypeAndDifficulty = song and song:HasStepsTypeAndDifficulty( st, diff )
				self:playcommand( bHasStepsTypeAndDifficulty and "Show" or "Hide" )
			end,
			CurrentSongChangedMessageCommand=function(self)
				self:playcommand("Set")
			end
		}
	end
end

return t