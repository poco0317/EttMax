return Def.BPMDisplay {
	File=THEME:GetPathF("BPMDisplay", "bpm"),
	Name="BPMDisplay",
	SetCommand=function(self)
		self:SetFromGameState()
	end,
	OffCommand=function(self)
		self:bouncebegin(0.5):addx(-SCREEN_WIDTH*0.6)
	end,
	OnCommand=function(self)
		self:zoom(0.8):draworder(1000):horizalign(left):addx(-SCREEN_WIDTH*0.6):bounceend(0.5):addx(SCREEN_WIDTH*0.6)
	end,
	CurrentSongChangedMessageCommand=function(self)
		self:playcommand("Set")
	end,
	CurrentCourseChangedMessageCommand=function(self)
		self:playcommand("Set")
	end
}