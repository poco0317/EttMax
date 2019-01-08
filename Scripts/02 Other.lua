function TextBannerAfterSet(self,param) 
	local Title=self:GetChild("Title") 
	local Subtitle=self:GetChild("Subtitle") 

	if Subtitle:GetText() == "" then 
		Title:maxwidth(300)
		Title:y(-1)
		Title:zoom(1)

		Subtitle:visible(false)
	else
		Title:y(-6)
		Title:zoom(0.8)

		-- subtitle below title
		Subtitle:visible(true)
		Subtitle:zoom(0.6)
		Subtitle:y(12)
	end
end

local g_metrics_group = nil
local g_element = nil

-- legacy:
SSC = true

function LoadFallbackB()
	-- Load the fallback BGA for the element that is currently being loaded.
	-- The fallback metrics group and element name will come either from LuaThreadVars
	-- (loading from C++) or from the Lua globals above (loading from Lua).

	--Warn( "g_element " .. (g_element or "") )
	--Warn( "MatchingElement " .. (Var 'MatchingElement' or "") )
	--Warn( "g_metrics_group " .. (g_metrics_group or "") )
	--Warn( "MatchingMetricsGroup " .. (Var 'MatchingMetricsGroup' or "") )

	local metrics_group = g_metrics_group or Var "MatchingMetricsGroup"
	local element = g_element or Var "MatchingElement"
	local fallback = THEME:GetMetric(metrics_group, "Fallback")

	local old_metrics_group = g_metrics_group
	local old_element = g_element

	local path
	path, g_metrics_group, g_element = THEME:GetPathInfoB(fallback, element)
	--Trace('path ' .. path )
	local t = LoadActor(path)

	g_metrics_group = old_metrics_group
	g_element = old_element

	return t
end

function FormatNumSongsPlayed(num)
	local s = num .. " song"
	if s == 1 then
		s = s .. " "
	else
		s = s .. "s"
	end
	return s .. " played"
end

function JudgmentTransformCommand(self, params)
	local y = -30
	if params.bReverse then
		y = y * -1
	end
	-- This makes no sense and wasn't even being used due to misspelling.
	-- if bCentered then y = y * 2 end
	self:x(0)
	self:y(y)
end

function JudgmentTransformSharedCommand(self, params)
	local y = -30
	if params.bReverse then
		y = 30
	end
	self:x(0)
	self:y(y)
end

function ComboTransformCommand(self, params)
	local y = 30
	if params.bReverse then
		y = y * -1
	end

	if params.bCentered then
		if params.bReverse then
			y = y - 30
		else
			y = y + 40
		end
	end
	self:x(0)
	self:y(y)
end

function GetEditModeSubScreens()
	return "ScreenMiniMenuEditHelp," ..
		"ScreenMiniMenuMainMenu," ..
			"ScreenMiniMenuAreaMenu," ..
				"ScreenMiniMenuStepsInformation," ..
					"ScreenMiniMenuSongInformation," ..
						"ScreenMiniMenuBackgroundChange," ..
							"ScreenMiniMenuInsertTapAttack," ..
								"ScreenMiniMenuInsertCourseAttack," .. "ScreenMiniMenuCourseDisplay," .. "ScreenEditOptions"
end

function GetCoursesToShowRanking()
	local CoursesToShowRanking = PREFSMAN:GetPreference("CoursesToShowRanking")
	if CoursesToShowRanking ~= "" then
		return CoursesToShowRanking
	end
	return "Courses/Default/MostPlayed_01-04.crs,Courses/Default/ChallengingRandom5.crs,Courses/Default/Jupiter.crs"
end

-- Get a metric from the currently-loading screen.  This is only valid while loading
-- an actor, such as from File or InitCommand attributes; not from commands.
Screen.Metric = function(sName)
	local sClass = Var "LoadingScreen"
	return THEME:GetMetric(sClass, sName)
end
ScreenMetric = Screen.Metric

Screen.String = function(sName)
	local sClass = Var "LoadingScreen"
	return THEME:GetString(sClass, sName)
end
ScreenString = Screen.String

function Song:GetStageCost()
	return self:IsMarathon() and 3 or self:IsLong() and 2 or 1
end

function OptionsNavigationMode()
	if PREFSMAN:GetPreference("ThreeKeyNavigation") then
		return "toggle"
	else
		return "normal"
	end
end