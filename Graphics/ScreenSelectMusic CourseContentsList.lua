local transform = function(self,offsetFromCenter,itemIndex,numitems)
	self:y( offsetFromCenter * 56 )
end
return Def.CourseContentsList {
	MaxSongs = 8,
    NumItemsToDraw = 7,
	ShowCommand=function(self)
		self:bouncebegin(0.3):zoomy(1)
	end,
	HideCommand=function(self)
		self:linear(0.3):zoomy(0)
	end,
	SetCommand=function(self)
		self:SetFromGameState()
		self:SetCurrentAndDestinationItem(0)
		self:SetPauseCountdownSeconds(1)
		self:SetSecondsPauseBetweenItems( 0.25 )
		self:SetTransformFromFunction(transform)
		--
		self:SetDestinationItem( math.max(0,self:GetNumItems() - 4) )
		self:SetLoop(false)
		self:SetMask(400,65)
	end,
	CurrentTrailP1ChangedMessageCommand=function(self)
		self:playcommand("Set")
	end,
	CurrentTrailP2ChangedMessageCommand=function(self)
		self:playcommand("Set")
	end,

	Display = Def.ActorFrame { 
		InitCommand=function(self)
			self:setsize(270,44)
		end,

		LoadActor(THEME:GetPathG("CourseEntryDisplay","bar")) .. {
			SetSongCommand=function(self, params)
				self:finishtweening():diffusealpha(0):sleep(0.125*params.Number):linear(0.125):diffusealpha(1):linear(0.05):glow(color("1,1,1,0.5")):decelerate(0.1):glow(color("1,1,1,0"))
			end
		},

		Def.TextBanner {
			InitCommand=function(self)
				self:x(24):y(1):Load("TextBanner"):SetFromString("", "", "", "", "", ""):zoom(0.8)
			end,
			SetSongCommand=function(self, params)
				if params.Song then
					self:SetFromSong( params.Song )
					self:diffuse( CustomDifficultyToColor(params.Difficulty) )
-- 					self:glow("1,1,1,0.5")
				else
					self:SetFromString( "??????????", "??????????", "", "", "", "" )
					self:diffuse( color("#FFFFFF") )
-- 					self:glow("1,1,1,0")
				end
				self:finishtweening():zoomy(0):sleep(0.125*params.Number):linear(0.125):zoomy(1.1):linear(0.05):zoomx(1.1):decelerate(0.1):zoom(1)
			end
		},

 		LoadFont("CourseEntryDisplay","difficulty") .. {
			Text="0",
			InitCommand=function(self)
				self:x(144):y(0):zoom(0.75):shadowlength(1)
			end,
			SetSongCommand=function(self, params)
				if params.PlayerNumber ~= GAMESTATE:GetMasterPlayerNumber() then
					return
				end
				self:settext( params.Meter )
				self:diffuse(ColorLightTone(CustomDifficultyToColor(params.Difficulty) ))
				self:finishtweening():zoomy(0):sleep(0.125*params.Number):linear(0.125):zoomy(1.1):linear(0.05):zoomx(1.1):decelerate(0.1):zoom(1)
			end
		}
	}
}