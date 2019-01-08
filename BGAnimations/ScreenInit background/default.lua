local t = Def.ActorFrame {
	LoadActor(THEME:GetPathS("ScreenInit","music")) .. {
		OnCommand=function(self)
			self:play()
		end
	}
}

t[#t+1] = Def.ActorFrame {
	Def.Quad{
			OnCommand=function(self)
				self:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT):Center():diffuse(color("1,1,1,1"))
			end
	}
}

t[#t+1] = Def.ActorFrame {
	InitCommand=function(self)
		self:CenterX():y(SCREEN_CENTER_Y+60)
	end,
	Def.ActorFrame {
	  OnCommand=function(self)
	  	self:playcommandonchildren("ChildrenOn")
	  end,
		LoadFont("Common Normal") .. {
			Text=ProductID(),
			InitCommand=function(self)
				self:y(-20):zoom(0.75)
			end,
			OnCommand=function(self)
				self:diffuse(color("0,0,0,1"))
			end
		},
		LoadFont("Common Normal") .. {
			Text=THEME:GetThemeDisplayName(),
			OnCommand=function(self)
				self:diffuse(color("0,0,0,1"))
			end
		},
		LoadFont("Common Normal") .. {
			Text="Created by " .. THEME:GetThemeAuthor(),
			InitCommand=function(self)
				self:y(24):zoom(0.75)
			end,
			OnCommand=function(self)
				self:diffuse(color("0,0,0,1"))
			end
		}
	}
}

t[#t+1] = Def.ActorFrame {
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X-20):y(SCREEN_CENTER_Y-40):fov(70)
	end,
	LoadActor("_textshadow")..{
		InitCommand=function(self)
			self:x(20):y(6)
		end,
		OnCommand=function(self)
			self:linear(8):addx(-40)
		end
	},
	LoadActor("_arrowshadow")..{
		InitCommand=function(self)
			self:x(20+225):y(6)
		end,
		OnCommand=function(self)
			self:linear(8):addx(-40)
		end
	},
	LoadActor("_arrow (dither)")..{
		InitCommand=function(self)
			self:x(225)
		end
	},
	LoadActor("_text (dither)")
}

return t