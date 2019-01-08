local t = Def.ActorFrame {}

t[#t+1] = Def.ActorFrame {
		OnCommand=function(self)
			self:zoomy(0):smooth(0.3):zoomy(1.0)
		end,
		OffCommand=function(self)
			self:sleep(0.7):accelerate(0.3):addy(SCREEN_HEIGHT)
		end,
		LoadActor("_pod") .. {
			InitCommand=function(self)
				self:zoom(0.5)
			end
		},
		LoadFont("_spaceport 2006 Bold") .. {
			InitCommand=function(self)
				self:zoomy(0.4):zoomx(0.33):diffuse(color("#FFFFFF")):settext(string.upper(JudgmentLineToLocalizedString('JudgmentLine_W1'))):addy(-1)
			end
		}
}

t[#t+1] = Def.ActorFrame {
		InitCommand=function(self)
			self:addy(30)
		end,
		OnCommand=function(self)
			self:zoomy(0):smooth(0.3):zoomy(1.0)
		end,
		OffCommand=function(self)
			self:sleep(0.6):accelerate(0.3):addy(SCREEN_HEIGHT)
		end,
		LoadActor("_pod") .. {
			InitCommand=function(self)
				self:zoom(0.5)
			end
		},
		LoadFont("_spaceport 2006 Bold") .. {
			InitCommand=function(self)
				self:zoom(0.4):diffuse(color("#FFFFFF")):settext(string.upper(JudgmentLineToLocalizedString('JudgmentLine_W2'))):addy(-1)
			end
		}
}

t[#t+1] = Def.ActorFrame {
		InitCommand=function(self)
			self:addy(30*2)
		end,
		OnCommand=function(self)
			self:zoomy(0):smooth(0.3):zoomy(1.0)
		end,
		OffCommand=function(self)
			self:sleep(0.5):accelerate(0.3):addy(SCREEN_HEIGHT)
		end,
		LoadActor("_pod") .. {
			InitCommand=function(self)
				self:zoom(0.5)
			end
		},
		LoadFont("_spaceport 2006 Bold") .. {
			InitCommand=function(self)
				self:zoom(0.4):diffuse(color("#FFFFFF")):settext(string.upper(JudgmentLineToLocalizedString('JudgmentLine_W3'))):addy(-1)
			end
		}
}

t[#t+1] = Def.ActorFrame {
		InitCommand=function(self)
			self:addy(30*3)
		end,
		OnCommand=function(self)
			self:zoomy(0):smooth(0.3):zoomy(1.0)
		end,
		OffCommand=function(self)
			self:sleep(0.4):accelerate(0.3):addy(SCREEN_HEIGHT)
		end,
		LoadActor("_pod") .. {
			InitCommand=function(self)
				self:zoom(0.5)
			end
		},
		LoadFont("_spaceport 2006 Bold") .. {
			InitCommand=function(self)
				self:zoom(0.4):diffuse(color("#FFFFFF")):settext(string.upper(JudgmentLineToLocalizedString('JudgmentLine_W4'))):addy(-1)
			end
		}
}

t[#t+1] = Def.ActorFrame {
		InitCommand=function(self)
			self:addy(30*4)
		end,
		OnCommand=function(self)
			self:zoomy(0):smooth(0.3):zoomy(1.0)
		end,
		OffCommand=function(self)
			self:sleep(0.3):accelerate(0.3):addy(SCREEN_HEIGHT)
		end,
		LoadActor("_pod") .. {
			InitCommand=function(self)
				self:zoom(0.5)
			end
		},
		LoadFont("_spaceport 2006 Bold") .. {
			InitCommand=function(self)
				self:zoom(0.4):diffuse(color("#FFFFFF")):settext(string.upper(JudgmentLineToLocalizedString('JudgmentLine_W5'))):addy(-1)
			end
		}
}

t[#t+1] = Def.ActorFrame {
		InitCommand=function(self)
			self:addy(30*5)
		end,
		OnCommand=function(self)
			self:zoomy(0):smooth(0.3):zoomy(1.0)
		end,
		OffCommand=function(self)
			self:sleep(0.2):accelerate(0.3):addy(SCREEN_HEIGHT)
		end,
		LoadActor("_pod") .. {
			InitCommand=function(self)
				self:zoom(0.5)
			end
		},
		LoadFont("_spaceport 2006 Bold") .. {
			InitCommand=function(self)
				self:zoom(0.4):diffuse(color("#FFFFFF")):settext(string.upper(JudgmentLineToLocalizedString('JudgmentLine_Miss'))):addy(-1)
			end
		}
}

t[#t+1] = Def.ActorFrame {
		InitCommand=function(self)
			self:addy(30*6)
		end,
		OnCommand=function(self)
			self:zoomy(0):smooth(0.3):zoomy(1.0)
		end,
		OffCommand=function(self)
			self:sleep(0.1):accelerate(0.3):addy(SCREEN_HEIGHT)
		end,
		LoadActor("_pod") .. {
			InitCommand=function(self)
				self:zoom(0.5)
			end
		},
		LoadFont("_spaceport 2006 Bold") .. {
			InitCommand=function(self)
				self:zoom(0.4):diffuse(color("#FFFFFF")):settext(string.upper(JudgmentLineToLocalizedString('JudgmentLine_Held'))):addy(-1)
			end
		}
}

t[#t+1] = Def.ActorFrame {
		InitCommand=function(self)
			self:addy(30*7)
		end,
		OnCommand=function(self)
			self:zoomy(0):smooth(0.3):zoomy(1.0)
		end,
		OffCommand=function(self)
			self:bounceend(0.3):zoomx(0)
		end,
		LoadFont("_neuropol 36px") .. {
			InitCommand=function(self)
				self:zoom(0.7):diffuse(color("#FFFFFF")):settext(("SCORE")):addy(-1)
			end
		}
}
						
return t