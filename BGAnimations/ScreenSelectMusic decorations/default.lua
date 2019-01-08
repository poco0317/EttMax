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

if not GAMESTATE:IsCourseMode() then
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
end

-- Banner Frame
		
t[#t+1] = Def.ActorFrame {
	InitCommand=function(self)
		self:visible(not GAMESTATE:IsCourseMode())
	end,
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


	LoadFont("_impact 24px") .. { 
        InitCommand=function(self)
        	self:zoom(0.6):x(SCREEN_CENTER_X-122):y(SCREEN_CENTER_Y-131):uppercase(true):horizalign(left):maxwidth(SCREEN_WIDTH):diffuse(color("#979797")):visible(not GAMESTATE:IsCourseMode()):draworder(1000):shadowlength(1)
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
	}
}

if not GAMESTATE:IsCourseMode() then
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
		end;
		
		self:zoom(scale(height,32,480,1,32/480))
	end
	t[#t+1] = Def.ActorFrame {
		OnCommand=function(self)
			self:draworder(105):x(SCREEN_CENTER_X-64):y(SCREEN_CENTER_Y-87):zoom(0):sleep(0.5):decelerate(0.25):zoom(1):SetUpdateFunction(CDTitleUpdate)
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
end
	
-- Difficulty frames

t[#t+1] = LoadActor("_dfp1") .. {
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X-250):y(SCREEN_CENTER_Y+11):visible(not GAMESTATE:IsCourseMode())
	end,
	OffCommand=function(self)
		self:bouncebegin(0.5):addx(-SCREEN_WIDTH*0.6)
	end,
	OnCommand=function(self)
		self:addx(-SCREEN_WIDTH*0.6):bounceend(0.5):addx(SCREEN_WIDTH*0.6)
	end
	}
	
t[#t+1] = LoadActor("_dfp2") .. {
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X-250+180):y(SCREEN_CENTER_Y+11):visible(not GAMESTATE:IsCourseMode())
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
	
t[#t+1] = LoadActor("_diffframep2") .. {
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X-240+160):y(SCREEN_CENTER_Y+195)
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

t[#t+1] = LoadFont("_neuropol 36px") .. { 
          InitCommand=function(self)
          	self:x(SCREEN_CENTER_X-250+180-32):y(SCREEN_CENTER_Y+11-10):horizalign(left):diffuse(PlayerColor(PLAYER_2)):zoom(0.6)
          end,
		  OnCommand=function(self)
		  	self:diffusealpha(0):sleep(0.3):smooth(0.2):diffusealpha(1)
		  end,
		  OffCommand=function(self)
		  	self:bouncebegin(0.5):addx(-SCREEN_WIDTH*0.6)
		  end,
          CurrentStepsP2ChangedMessageCommand=function(self)
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
			stepsP2 = GAMESTATE:GetCurrentSteps(PLAYER_2)
			local song = GAMESTATE:GetCurrentSong();
			if song then 
				if stepsP2 ~= nil then
					self:settext(stepsP2:GetMeter())
				else
					self:settext("")
				end
			else
				self:settext("")
			end
          end
}

if GAMESTATE:IsCourseMode() then

t[#t+1] = LoadActor("_courseframe") .. {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-160):y(SCREEN_CENTER_Y-88):draworder(80):visible(GAMESTATE:IsCourseMode())
		end,
		OffCommand=function(self)
			self:bouncebegin(0.5):addx(-SCREEN_WIDTH*0.6)
		end,
		OnCommand=function(self)
			self:addx(-SCREEN_WIDTH*0.6):bounceend(0.5):addx(SCREEN_WIDTH*0.6)
		end
		}
		
t[#t+1] = Def.ActorFrame {
	InitCommand=function(self)
		self:draworder(80)
	end,
	StandardDecorationFromFileOptional("SongTime","SongTime") .. {
	SetCommand=function(self)
		local curSelection = nil;
		local length = 0.0;
		if GAMESTATE:IsCourseMode() then
			curSelection = GAMESTATE:GetCurrentCourse()
			self:playcommand("Reset")
			if curSelection then
				self:settext("")
			end
		else
			curSelection = GAMESTATE:GetCurrentSong()
			self:playcommand("Reset")
			if curSelection then
				length = curSelection:MusicLengthSeconds()
				if curSelection:IsLong() then
					self:playcommand("Long")
				elseif curSelection:IsMarathon() then
					self:playcommand("Marathon")
				else
					self:playcommand("Reset")
				end
			else
				length = 0.0;
				self:playcommand("Reset")
			end
			self:settext( SecondsToMSS(length) )
		end
	end,
	CurrentSongChangedMessageCommand=function(self)
		self:playcommand("Set")
	end,
	CurrentCourseChangedMessageCommand=function(self)
		self:playcommand("Set")
	end,
	CurrentTrailP1ChangedMessageCommand=function(self)
		self:playcommand("Set")
	end,
	CurrentTrailP2ChangedMessageCommand=function(self)
		self:playcommand("Set")
	end
	},

	Def.ActorFrame {
		OnCommand=function(self)
			self:diffusealpha(0):sleep(2.0):smooth(0.4):diffusealpha(1)
		end,
		LoadFont("_numbers2") .. { 
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X-220-96):y(SCREEN_CENTER_Y-78):horizalign(center):diffuse(color("#FFFFFF")):strokecolor(Color("Outline")):zoom(1.0):diffusealpha(0)
			end,
			CurrentCourseChangedMessageCommand=function(self)
				self:queuecommand("Set")
			end,
			ChangedLanguageDisplayMessageCommand=function(self)
				self:queuecommand("Set")
			end,
			OnCommand=function(self)
				self:smooth(0.2):diffusealpha(1)
			end,
			OffCommand=function(self)
				self:decelerate(0.3):diffusealpha(0)
			end,
			SetCommand=function(self) 
				local course = GAMESTATE:GetCurrentCourse()
				if course then
						self:settext(course:GetEstimatedNumStages())
						self:queuecommand("Refresh")
					else
						self:settext("");
						self:queuecommand("Refresh")	
				end 
			end
			}
		}
	}
end
	
t[#t+1] = StandardDecorationFromFileOptional("StageDisplay","StageDisplay")
t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay")
t[#t+1] = StandardDecorationFromFileOptional("GrooveRadar","GrooveRadar")
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