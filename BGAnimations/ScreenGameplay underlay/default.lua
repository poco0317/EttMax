local t = Def.ActorFrame {}

	t[#t+1] = LoadActor("_headtile") .. {
		InitCommand=function(self)
			self:zoom(0.75):CenterX():zoomto(SCREEN_WIDTH,69)
			self:valign(0):y(SCREEN_TOP)
		end,
		OnCommand=function(self)
			self:addy(-230):smooth(1.5):addy(230)
		end
	}
	
	t[#t+1] = Def.Quad {
		-- Lifebar underlay
		InitCommand=function(self)
			self:diffuse(color("#000000")):CenterX():zoomto(700,45)
			self:valign(0):y(SCREEN_TOP)
		end,
		OnCommand=function(self)
			self:addy(-230):smooth(1.5):addy(230)
		end
	}
	
return t