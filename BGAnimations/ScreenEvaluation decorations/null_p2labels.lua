local t = Def.ActorFrame {}

-- P2 numbers
-- P2 numbers
t[#t+1] = Def.ActorFrame {
	InitCommand=function(self)
		self:addx(60)
	end,
	OnCommand=function(self)
		self:zoomx(0):bounceend(0.2):zoomx(1)
	end,
	OffCommand=function(self)
		self:bounceend(0.2):zoomx(0)
	end,
	LoadFont("_numbers2") .. {
		InitCommand=function(self)
			self:visible(GAMESTATE:IsHumanPlayer(PLAYER_2)):horizalign(left):diffuse(PlayerColor(PLAYER_2)):playcommand("Set")
		end,
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W1"))
        end
	},
	LoadFont("_numbers2") .. {
		InitCommand=function(self)
			self:visible(GAMESTATE:IsHumanPlayer(PLAYER_2)):horizalign(left):diffuse(PlayerColor(PLAYER_2)):addy(30):playcommand("Set")
		end,
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W2"))
        end
	},
	LoadFont("_numbers2") .. {
		InitCommand=function(self)
			self:visible(GAMESTATE:IsHumanPlayer(PLAYER_2)):horizalign(left):diffuse(PlayerColor(PLAYER_2)):addy(30*2):playcommand("Set")
		end,
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W3"))
        end
	},
	LoadFont("_numbers2") .. {
		InitCommand=function(self)
			self:visible(GAMESTATE:IsHumanPlayer(PLAYER_2)):horizalign(left):diffuse(PlayerColor(PLAYER_2)):addy(30*3):playcommand("Set")
		end,
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W4"))
        end
	},
	LoadFont("_numbers2") .. {
		InitCommand=function(self)
			self:visible(GAMESTATE:IsHumanPlayer(PLAYER_2)):horizalign(left):diffuse(PlayerColor(PLAYER_2)):addy(30*4):playcommand("Set")
		end,
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W5"))
        end
	},
	LoadFont("_numbers2") .. {
		InitCommand=function(self)
			self:visible(GAMESTATE:IsHumanPlayer(PLAYER_2)):horizalign(left):diffuse(PlayerColor(PLAYER_2)):addy(30*5):playcommand("Set")
		end,
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_Miss"))
        end
	},
	LoadFont("_numbers2") .. {
		InitCommand=function(self)
			self:visible(GAMESTATE:IsHumanPlayer(PLAYER_2)):horizalign(left):diffuse(PlayerColor(PLAYER_2)):addy(30*6):playcommand("Set")
		end,
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetHoldNoteScores("HoldNoteScore_Held"))
        end
	},
	LoadFont("_numbers2") .. {
		InitCommand=function(self)
			self:visible(GAMESTATE:IsHumanPlayer(PLAYER_2)):horizalign(left):diffuse(color("#FFFF00")):addy(27*6+6):addx(80):playcommand("Set")
		end,
		SetCommand=function(self)
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):MaxCombo())
        end
	},	
	LoadFont("_numbers2") .. {
		InitCommand=function(self)
			self:visible(GAMESTATE:IsHumanPlayer(PLAYER_2)):horizalign(left):diffuse(PlayerColor(PLAYER_2)):addy(30*7+3):addx(10):playcommand("Set")
		end,
		SetCommand=function(self)
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetScore())
        end
	}
}
	
return t