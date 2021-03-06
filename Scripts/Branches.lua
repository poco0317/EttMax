Branch.TitleMenu = function()
	-- home mode is the most assumed use of sm-ssc.
	if GAMESTATE:GetCoinMode() == "CoinMode_Home" then
		return "ScreenTitleMenu"
	end
	-- arcade junk:
	if GAMESTATE:GetCoinsNeededToJoin() > GAMESTATE:GetCoins() then
		-- if no credits are inserted, don't show the Join screen. SM4 has
		-- this as the initial screen, but that means we'd be stuck in a
		-- loop with ScreenInit. No good.
		return "ScreenTitleJoin"
	else
		return "ScreenTitleJoin"
	end
end

Branch.StartGame = function()
	if SONGMAN:GetNumSongs() == 0 and SONGMAN:GetNumAdditionalSongs() == 0 then
		-- xxx: use titlemenu and titlejoin as needed
		return "ScreenTitleMenu"
	end

	return "ScreenSelectStyle"
end

-- gameplay branch that takes extra stage into account
Branch.GameplayScreen = function()
	if IsRoutine() then
		return "ScreenGameplayShared"
	end
	return "ScreenGameplay"
end

Branch.AfterGameplay = function()
	if IsNetSMOnline() then
		-- even though online mode isn't supported in this theme yet
		return "ScreenNetEvaluation"
	else
		return "ScreenEvaluationNormal"
	end
end

Branch.AfterEvaluation = function()
	return "ScreenProfileSave"
end

-- needs to be tested
Branch.AfterProfileSave = function()
	if GAMESTATE:IsEventMode() then
		-- infinite play
		return SelectMusicOrCourse()
	elseif STATSMAN:GetCurStageStats():AllFailed() then
		-- if the player failed extra stage, don't game over.
		return "ScreenGameOver"
	elseif GAMESTATE:GetSmallestNumStagesLeftForAnyHumanPlayer() == 0 then
		return "ScreenEvaluationSummary"
	else
		-- when do we get here??
		return SelectMusicOrCourse()
	end
end

-- pick an ending screen
Branch.Ending = function()
	if GAMESTATE:IsEventMode() then
		return SelectMusicOrCourse()
	end

	-- best final grade better than AA: show the credits.
	-- otherwise, show music scroll.
	return STATSMAN:GetBestFinalGrade() <= 'Grade_Tier03' and "ScreenCredits" or "ScreenMusicScroll"
end

Branch.AfterSaveSummary = function()
	local getRankingName = PREFSMAN:GetPreference("GetRankingName")
	if getRankingName == "RankingName_Off" then
		-- never show ranking screen
		return Branch.Ending()
	elseif getRankingName == "RankingName_List" then
		-- check if we've set the conditions (e.g. ranked course)
	elseif getRankingName == "RankingName_On" then
		-- check for ranking via GAMESTATE:AnyPlayerHasRankingFeats()
		if GAMESTATE:AnyPlayerHasRankingFeats() then return "ScreenNameEntry" end
	end

	return "ScreenGameOver"
	--[[ Enable when Finished ]]
	--return GAMESTATE:AnyPlayerHasRankingFeats() and "ScreenNameEntry" or "ScreenGameOver"
end
