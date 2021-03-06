local Player = ...
if not Player then error("ScreenEvaluation DifficultyIcon requires a Player") end

return LoadActor(THEME:GetPathG("ScreenSelectMusic","DifficultyIcon/_difficulty icons"))..{
	InitCommand=function(self)
		self:pause()
	end,
	BeginCommand=function(self)
		self:playcommand("Set")
	end,
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		if song then
			-- change icon index based on difficulty
			local steps = GAMESTATE:GetCurrentSteps(Player)
			if steps then
				self:setstate(GetDifficultyIconFrame(steps:GetDifficulty()))
				self:visible(true)
			end
		else
			self:visible(false)
		end
	end
}