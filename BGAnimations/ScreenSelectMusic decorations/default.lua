local t = LoadFallbackB()

local difficulty_icon_map= {
	Difficulty_Beginner= "_diconbeginner.png",
	Difficulty_Easy= "_diconlight.png",
	Difficulty_Medium= "_diconstandard.png",
	Difficulty_Hard= "_diconheavy.png",
	Difficulty_Challenge= "_dicononi.png",
	Difficulty_Edit= "_diconedit.png",
}

local difficulty_positions= {
	[PLAYER_1]= {_screen.cx-268, _screen.cy+10},
	[PLAYER_2]= {_screen.cx-53, _screen.cy+10}
}

local function difficulty_icon(pn)
	local args= {
		InitCommand= function(self)
			self:xy(difficulty_positions[pn][1], difficulty_positions[pn][2]):visible(false)
		end,
		OnCommand=function(self)
			self:addx(-SCREEN_WIDTH*0.6):bounceend(0.5):addx(SCREEN_WIDTH*0.6)
		end,
	}
	args["CurrentSteps" .. ToEnumShortString(pn) .. "ChangedMessageCommand"]=
		function(self)
			local steps= GAMESTATE:GetCurrentSteps(pn)
			if steps then
				local path= THEME:GetPathG("", difficulty_icon_map[steps:GetDifficulty()])
				self:Load(path):visible(true)
			else
				self:visible(false)
			end
		end
	return Def.Sprite(args)
end

local function GenerateModIconRow(pn)
	local MetricsName = "ModIcons" .. ToEnumShortString(pn);
	return Def.ActorFrame {
		InitCommand=function(self) 
			self:name(MetricsName)
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen")
		end,
		LoadActor( THEME:GetPathG("OptionIcon","Player") )..{
			InitCommand=function(self)
				self:pause():halign(0):x(-19)
			end,
			BeginCommand=function(self)
				self:setstate( pn == PLAYER_1 and 0 or 1 );
			end,
			OnCommand=function(self)
				self:zoomy(0):linear(0.5):zoomy(1)
			end,
			OffCommand=function(self)
				self:linear(0.5):zoomy(0)
			end
		},
		Def.ModIconRow {
			InitCommand=function(self)
				self:Load("ModIconRowSelectMusic"..ToEnumShortString(pn),pn):x(152)
			end,
			OnCommand=function(self)
				self:zoomy(0):linear(0.5):zoomy(1)
			end,
			OffCommand=function(self)
				self:linear(0.5):zoomy(0)
			end
		}
	}
end

for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	if ShowStandardDecoration("ModIcons") then
		t[#t+1] = GenerateModIconRow(pn)
	end
end


-- Banner Frame
		
t[#t+1] = Def.ActorFrame {
	InitCommand=function(self)
		self:visible(true)
	end,
	-- The banner frame sprite
	LoadActor("_bannerframe") .. {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-160):y(SCREEN_CENTER_Y-88):draworder(140)
		end,
		OffCommand=function(self)
			self:bouncebegin(0.5):addx(-SCREEN_WIDTH*0.6)
		end,
		OnCommand=function(self)
			self:addx(-SCREEN_WIDTH*0.6):bounceend(0.5):addx(SCREEN_WIDTH*0.6)
		end
	},

	-- BPM in the banner frame
	LoadActor("BPMDisplay label") .. {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-195+20):y(SCREEN_CENTER_Y-130):draworder(140)
		end,
		OffCommand=function(self)
			self:bouncebegin(0.5):addx(-SCREEN_WIDTH*0.6)
		end,
		OnCommand=function(self)
			self:zoom(0.7):draworder(1000):horizalign(left):addx(-SCREEN_WIDTH*0.6):bounceend(0.5):addx(SCREEN_WIDTH*0.6)
		end
	},

	-- Sort name in the banner frame
	LoadFont("_impact 24px") .. { 
        InitCommand=function(self)
        	self:zoom(0.6):x(SCREEN_CENTER_X-122):y(SCREEN_CENTER_Y-131):uppercase(true):horizalign(left):maxwidth(SCREEN_WIDTH):diffuse(color("#979797")):visible(true):draworder(1000):shadowlength(1)
        end,
		OffCommand=function(self)
			self:bouncebegin(0.5):addx(-SCREEN_WIDTH*0.6)
		end,
		OnCommand=function(self)
			self:zoom(0.6):draworder(1000):horizalign(left):addx(-SCREEN_WIDTH*0.6):bounceend(0.5):addx(SCREEN_WIDTH*0.6)
		end,
        SortOrderChangedMessageCommand=function(self)
        	self:playcommand("Set")
        end,
        ChangedLanguageDisplayMessageCommand=function(self)
        	self:playcommand("Set")
        end,
        SetCommand=function(self) 
               local sortorder = GAMESTATE:GetSortOrder();
               if sortorder then
                    self:settext(SortOrderToLocalizedString(sortorder));
                    self:playcommand("Refresh")
				else
					self:settext("")
					self:playcommand("Refresh")
               end 
        end
	},

	-- The banner itself
	Def.Sprite {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-170):y(SCREEN_CENTER_Y-72):draworder(139):visible(true)
			self:scaletoclipped(capWideScale(get43size(263), 263), capWideScale(get43size(82), 82)):diffusealpha(1)
		end,
		OffCommand=function(self)
			self:bouncebegin(0.5):addx(-SCREEN_WIDTH*0.6)
		end,
		OnCommand=function(self)
			self:addx(-SCREEN_WIDTH*0.6):bounceend(0.5):addx(SCREEN_WIDTH*0.6)
			self:scaletoclipped(capWideScale(get43size(263), 263), capWideScale(get43size(82), 82)):diffusealpha(1)
			self:queuecommand("ChangeBanner")
		end,
		CurrentSongChangedMessageCommand=function(self)
			self:queuecommand("ChangeBanner")
		end,
		ChangeBannerCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				local bnpath = GAMESTATE:GetCurrentSong():GetBannerPath()
				if not bnpath then
					bnpath = THEME:GetPathG("Common", "fallback banner")
				end
				self:LoadBackground(bnpath)
			else
				local bnpath = SONGMAN:GetSongGroupBannerPath(SCREENMAN:GetTopScreen():GetMusicWheel():GetSelectedSection())
				if not bnpath or bnpath == "" then
					bnpath = THEME:GetPathG("Common", "fallback banner")
				end
				self:LoadBackground(bnpath)
			end
			self:scaletoclipped(capWideScale(get43size(263), 263), capWideScale(get43size(82), 82)):diffusealpha(1)
		end
	}
}

local function CDTitleUpdate(self)
	local song = GAMESTATE:GetCurrentSong()
	local cdtitle = self:GetChild("CDTitle")
	local height = cdtitle:GetHeight()
	
	if song then
		if song:HasCDTitle() then
			cdtitle:visible(true)
			cdtitle:Load(song:GetCDTitlePath())
		else
			cdtitle:visible(false)
		end;
	else
		cdtitle:visible(false)
	end
	local height = cdtitle:GetHeight()
	local width = cdtitle:GetWidth()

	if height >= 60 and width >= 75 then
		if height * (75 / 60) >= width then
			cdtitle:zoom(60 / height)
		else
			cdtitle:zoom(75 / width)
		end
	elseif height >= 60 then
		cdtitle:zoom(60 / height)
	elseif width >= 75 then
		cdtitle:zoom(75 / width)
	else
		cdtitle:zoom(1)
	end
end
t[#t+1] = Def.ActorFrame {
	OnCommand=function(self)
		self:draworder(105):x(SCREEN_CENTER_X-64):y(SCREEN_CENTER_Y+8):zoom(0):sleep(0.5):decelerate(0.25):zoom(1):SetUpdateFunction(CDTitleUpdate)
	end,
	OffCommand=function(self)
		self:bouncebegin(0.5):addx(-SCREEN_WIDTH*0.6)
	end,
	Def.Sprite {
		Name="CDTitle";
		OnCommand=function(self)
			self:draworder(106):shadowlength(1):zoom(0.75):diffusealpha(1):zoom(0):bounceend(0.35):zoom(0.75):spin():effectperiod(2):effectmagnitude(0,90,0)
		end,
		BackCullCommand=function(self)
			self:diffuse(color("0.5,0.5,0.5,1"))
		end
	}
}
	
-- Difficulty frames

t[#t+1] = LoadActor("_dfp1") .. {
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X-250):y(SCREEN_CENTER_Y+11):visible(true)
	end,
	OffCommand=function(self)
		self:bouncebegin(0.5):addx(-SCREEN_WIDTH*0.6)
	end,
	OnCommand=function(self)
		self:addx(-SCREEN_WIDTH*0.6):bounceend(0.5):addx(SCREEN_WIDTH*0.6)
	end
	}

t[#t+1] = Def.ActorFrame{ 
	difficulty_icon(PLAYER_1), difficulty_icon(PLAYER_2),
	OffCommand=function(self)
		self:bouncebegin(0.5):addx(-SCREEN_WIDTH*0.6)
	end,
	OnCommand=function(self)
		self:addx(-SCREEN_WIDTH*0.6):bounceend(0.5):addx(SCREEN_WIDTH*0.6)
	end
	}
	
t[#t+1] = LoadActor("_diffframep1") .. {
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X-240):y(SCREEN_CENTER_Y+195)
	end,
	OffCommand=function(self)
		self:bouncebegin(0.5):addx(-SCREEN_WIDTH*0.6)
	end,
	OnCommand=function(self)
		self:addx(-SCREEN_WIDTH*0.6):bounceend(0.5):addx(SCREEN_WIDTH*0.6)
	end
	}	

-- Difficulty numbers
t[#t+1] = LoadFont("_neuropol 36px") .. { 
          InitCommand=function(self)
          	self:x(SCREEN_CENTER_X-250+32):y(SCREEN_CENTER_Y+11-10):horizalign(right):diffuse(PlayerColor(PLAYER_1)):zoom(0.6)
          end,
		  OnCommand=function(self)
		  	self:diffusealpha(0):sleep(0.3):smooth(0.2):diffusealpha(1)
		  end,
		  OffCommand=function(self)
		  	self:bouncebegin(0.5):addx(-SCREEN_WIDTH*0.6)
		  end,
          CurrentStepsP1ChangedMessageCommand=function(self)
          	self:playcommand("Set"):playcommand("Transition")
          end,
		  TransitionCommand=function(self)
		  	self:finishtweening():diffusealpha(0):smooth(0.2):diffusealpha(1)
		  end,
		  PlayerJoinedMessageCommand=function(self)
		  	self:playcommand("Set"):diffusealpha(0):smooth(0.3):diffusealpha(1)
		  end,
          ChangedLanguageDisplayMessageCommand=function(self)
          	self:playcommand("Set")
          end,
          SetCommand=function(self)
			stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
			local song = GAMESTATE:GetCurrentSong();
			if song then 
				if stepsP1 ~= nil then
					self:settext(stepsP1:GetMeter())
				else
					self:settext("")
				end
			else
				self:settext("")
			end
          end
}
	
t[#t+1] = StandardDecorationFromFileOptional("StageDisplay","StageDisplay")
t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay")
--t[#t+1] = StandardDecorationFromFileOptional("GrooveRadar","GrooveRadar")

local function rotationForIndex(index, maxindex)
	return math.pi / 2 + math.pi * (2 / maxindex) * index
end

local function makeATriangle(vertices, size, index, maxindex, prettycolor)
	local x = 0
	size = size * 2
	vertices[#vertices+1] = {{math.cos(rotationForIndex(index,maxindex))*size, math.sin(rotationForIndex(index,maxindex))*size, 0}, prettycolor}
end

local function makeTheRadarBackground(vertices, size, fans, prettycolor)
	local x = 0
	for i = 1, fans do
		vertices[#vertices+1] = {{math.cos(rotationForIndex(i,fans))*size, math.sin(rotationForIndex(i,fans))*size, 0.5}, prettycolor}
	end
end
local radarsteps
-- A groove radar which is made up of the skillsets of a file instead of the weird groove radar values
-- It's an actormultivertex
t[#t+1] = Def.ActorFrame {
	Def.Sprite {
		InitCommand=function(self)
			self:xy(SCREEN_CENTER_X-100, SCREEN_CENTER_Y+90)
			self:zoom(0.4)
			self:Load(THEME:GetPathG("","GroovyRadar.png"))
		end,
		OnCommand=function(self)
			self:addx(-SCREEN_WIDTH*0.6):bounceend(0.5):addx(SCREEN_WIDTH*0.6)
		end,
		OffCommand=function(self)
			self:bouncebegin(0.5):addx(-SCREEN_WIDTH*0.6)
		end
	},
--[[
	Def.ActorMultiVertex {
		Name = "SkillsetBackground",
		InitCommand=function(self)
			self:xy(SCREEN_CENTER_X-160, SCREEN_CENTER_Y+90)
			local verts = {}
			local colr = color(".5,.5,.5")
			makeTheRadarBackground(verts, 60, #ms.SkillSets-1, colr)
			self:SetVertices(verts)
			self:SetDrawState( {Mode = "DrawMode_Fan", First = 1, Num = #verts} )
		end,
		OnCommand=function(self)
			self:addx(-SCREEN_WIDTH*0.6):bounceend(0.5):addx(SCREEN_WIDTH*0.6)
		end,
		OffCommand=function(self)
			self:bouncebegin(0.5):addx(-SCREEN_WIDTH*0.6)
		end
	},]]
	
	Def.ActorMultiVertex {
		Name = "SkillsetRadar",
		InitCommand=function(self)
			self:SetVertices({})
			self:SetDrawState( {Mode = "DrawMode_Fan", First = 0, Num = 0} )
			self:xy(SCREEN_CENTER_X-100, SCREEN_CENTER_Y+90)
		end,
		OnCommand=function(self)
			self:addx(-SCREEN_WIDTH*0.6):bounceend(0.5):addx(SCREEN_WIDTH*0.6)
		end,
		OffCommand=function(self)
			self:bouncebegin(0.5):addx(-SCREEN_WIDTH*0.6)
		end,
		CurrentSongChangedMessageCommand=function(self)
			self:queuecommand("RadarUpdate")
		end,
		RadarUpdateCommand = function(self)
			radarsteps = GAMESTATE:GetCurrentSteps(PLAYER_1)
			if radarsteps ~= nil then
				local verts = {}
				local skillsetValues = {}
				for i = 2, #ms.SkillSets do
					skillsetValues[i+1] = radarsteps:GetMSD(getCurRateValue(), i)
				end
				for i = 2, #ms.SkillSets do
					local colr = byMSD(skillsetValues[i+1])
					makeATriangle(verts, skillsetValues[i+1], i, #ms.SkillSets-1, colr)
				end

				self:SetVertices(verts)
				self:SetDrawState( {Mode = "DrawMode_Fan", First = 1, Num = #verts} )
			else
				self:SetVertices({})
				self:SetDrawState( {Mode = "DrawMode_Triangles", First = 0, Num = 0} )
			end
		end
	}
}

local function makeSkillsetLabel(i, top)
	local r = 
		LoadFont("Common Normal") ..
		{
			Name = "SkillSet"..i,
			InitCommand=function(self)
				self:settext(ms.SkillSets[i])
				--self:xy(SCREEN_CENTER_X-160, SCREEN_CENTER_Y+90)
				self:xy(SCREEN_CENTER_X-100+math.cos(rotationForIndex(i,top))*95, SCREEN_CENTER_Y+90+math.sin(rotationForIndex(i,top))*95)
				self:diffuse(color("0.5,0.7,0.7"))
				self:zoom(0.3)
			end,
			OnCommand=function(self)
				self:addx(-SCREEN_WIDTH*0.6):bounceend(0.5):addx(SCREEN_WIDTH*0.6)
			end,
			OffCommand=function(self)
				self:bouncebegin(0.5):addx(-SCREEN_WIDTH*0.6)
			end,
			CurrentSongChangedMessageCommand=function(self)
				self:queuecommand("RadarUpdate")
			end,
			RadarUpdateCommand = function(self)
				self:visible(GAMESTATE:GetCurrentSteps(PLAYER_1) ~= nil)
			end
		}
	return r
end
for i = 2, #ms.SkillSets do
	t[#t+1] = makeSkillsetLabel(i, #ms.SkillSets-1)
end

t[#t+1] = StandardDecorationFromFileOptional("AvailableDifficulties", "AvailableDifficulties")
t[#t+1] = StandardDecorationFromFileOptional("CourseContentsList","CourseContentsList")
t[#t+1] = StandardDecorationFromFileOptional("SongOptions","SongOptionsText") .. {
	ShowPressStartForOptionsCommand=THEME:GetMetric(Var "LoadingScreen","SongOptionsShowCommand"),
	ShowEnteringOptionsCommand=THEME:GetMetric(Var "LoadingScreen","SongOptionsEnterCommand"),
	HidePressStartForOptionsCommand=THEME:GetMetric(Var "LoadingScreen","SongOptionsHideCommand")
}

t[#t+1] = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self)
			self:draworder(99):FullScreen():diffuse(color("0,0,0,1")):diffusealpha(0)
		end,
		ShowPressStartForOptionsCommand=function(self)
			self:linear(0.8):diffusealpha(1)
		end
	}
}
	
return t