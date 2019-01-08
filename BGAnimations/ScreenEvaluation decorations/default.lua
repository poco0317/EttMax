local t = LoadFallbackB()

t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay")

t[#t+1] = Def.ActorFrame {
	Condition=GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2(),
	InitCommand=function(self)
		self:draworder(105)
	end,
	LoadActor( THEME:GetPathS("ScreenEvaluation","try Extra1" ) ) .. {
		Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false,
		OnCommand=function(self)
			self:play()
		end
	}
}
t[#t+1] = Def.ActorFrame {
	Condition=GAMESTATE:HasEarnedExtraStage() and not GAMESTATE:IsExtraStage() and GAMESTATE:IsExtraStage2(),
	InitCommand=function(self)
		self:draworder(105)
	end,
	LoadActor( THEME:GetPathS("ScreenEvaluation","try Extra2" ) ) .. {
		Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false,
		OnCommand=function(self)
			self:play()
		end
	}
}

if ShowStandardDecoration("TryExtraStage") then
	if GAMESTATE:HasEarnedExtraStage() then
		t[#t+1] = StandardDecorationFromFile("TryExtraStage","TryExtraStage")
	end
end

--Let's try this again. - Inorizushi

t[#t+1] = LoadActor("_p1labels") .. {
        InitCommand=function(self)
        	self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y-60)
        end
}
t[#t+1] = LoadActor("_p2labels") .. {
        InitCommand=function(self)
        	self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y-60)
        end
}
		
t[#t+1] = LoadActor("_p1grade") .. {
        InitCommand=function(self)
        	self:player(PLAYER_1):x(SCREEN_CENTER_X-220):y(SCREEN_CENTER_Y-120)
        end,
		OnCommand=function(self)
			self:addx(-SCREEN_WIDTH):sleep(0.0):decelerate(0.3):addx(SCREEN_WIDTH)
		end,
		OffCommand=function(self)
			self:sleep(0.8):accelerate(0.3):addx(-SCREEN_WIDTH)
		end
}
		
t[#t+1] = LoadActor("_p2grade") .. {
        InitCommand=function(self)
        	self:player(PLAYER_2):x(SCREEN_CENTER_X+220):y(SCREEN_CENTER_Y-120)
        end,
		OnCommand=function(self)
			self:addx(SCREEN_WIDTH):sleep(0.0):decelerate(0.3):addx(-SCREEN_WIDTH)
		end,
		OffCommand=function(self)
			self:sleep(0.8):accelerate(0.3):addx(SCREEN_WIDTH)
		end
}
		
t[#t+1] = LoadActor("_judgements") .. {
        InitCommand=function(self)
        	self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y-60)
        end,
		OffCommand=function(self)
			self:sleep(0.8):bounceend(0.3):zoomx(0)
		end
	}
		
t[#t+1] = Def.ActorFrame {
		LoadActor("_p1bonus") .. {
			InitCommand=function(self)
				self:visible(GAMESTATE:IsHumanPlayer(PLAYER_1)):x(SCREEN_CENTER_X-220):y(SCREEN_CENTER_Y-64):vertalign(top)
			end,
			OffCommand=function(self)
				self:sleep(0.8):bounceend(0.3):zoomx(0)
			end
		},
		LoadActor("_p2bonus") .. {
			InitCommand=function(self)
				self:visible(GAMESTATE:IsHumanPlayer(PLAYER_2)):x(SCREEN_CENTER_X+220):y(SCREEN_CENTER_Y-64):vertalign(top)
			end,
			OffCommand=function(self)
				self:sleep(0.8):bounceend(0.3):zoomx(0)
			end
		}
	}
	
return t
