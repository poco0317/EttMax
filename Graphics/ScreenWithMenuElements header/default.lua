local t = Def.ActorFrame {}
-- Could your 3.9 do THIS? -not poco
-- no but we can do it now -poco

local headercolour = {
["Select Style"] = "#d11120",
["Select Difficulty"] = "#ef5315",
["Select Music"] = "#298479",
["Select Course"] = "#298479",
["Result"] = "#1da5fb",
["Summary Result"] = "#1da5fb",
}

local subheadercolour = {
["Select Style"] = "#d11120",
["Select Difficulty"] = "#ef5315",
["Select Music"] = "#288c46",
["Select Course"] = "#288c46",
["Result"] = "#1da5fb",
["Summary Result"] = "#1da5fb",
}

local headeroffset = {
["Select Style"] = 0,
["Select Difficulty"] = -28,
["Select Music"] = -56,
["Select Course"] = -56,
["Result"] = -84,
["Summary Result"] = -84,
}


local headcolour = headercolour[Screen.String("HeaderText")]
local subheadcolour = subheadercolour[Screen.String("HeaderText")]
if headcolour == nil then headcolour = "#FFFFFF" end
if subheadcolour == nil then subheadcolour = "#FFFFFF" end

local headericon = Screen.String("HeaderText").." icon"
if FILEMAN:DoesFileExist("Themes/"..THEME:GetCurThemeName().."/Graphics/ScreenWithMenuElements header/"..headericon.." (doubleres).png") then
	headicon = headericon
	print("iconerror: file does exist: "..headericon.." (doubleres).png")
else
	headicon = "Select Style icon"
	print("iconerror: file does not exist")
end

t[#t+1] = Def.ActorFrame {

	Def.ActorFrame {
		OnCommand=function(self)
			self:addx(SCREEN_WIDTH*0.6):bounceend(0.5):addx(-SCREEN_WIDTH*0.6)
		end,
		OffCommand=function(self)
			self:bounceend(0.5):addx(SCREEN_WIDTH)
		end,
		Def.Quad {
			InitCommand=function(self)
				self:horizalign(left):vertalign(top):y(0):x(0):zoomto(SCREEN_WIDTH+1,48)
			end,
			OnCommand=function(self)
				self:diffuse(color("#0073A5"))
			end
		},
		LoadActor("_left") .. {
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X-335):y(SCREEN_TOP+25):zoomy(0.8)
			end
		},
		LoadActor("_left") .. {
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X-392.5):y(SCREEN_TOP+25):zoomy(0.8)
			end
		},
		-- is actually right lol
		LoadActor("_left") .. {
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X+280):y(SCREEN_TOP+25):zoomy(0.8)
			end
		},
		LoadActor("_left") .. {
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X+280-57.5):y(SCREEN_TOP+25):zoomy(0.8)
			end
		},
		LoadActor("_right") .. {
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X+25):y(SCREEN_TOP+25):zoomy(0.8)
			end
		}
	},
		
	--main header part
	Def.ActorFrame {
		InitCommand=function(self)
			self:x(headeroffset[Screen.String("HeaderText")])
		end,
		Def.ActorFrame {
			OnCommand=function(self)
				self:addx(SCREEN_WIDTH*0.6):bounceend(0.5):addx(-SCREEN_WIDTH*0.6)
			end,
			OffCommand=function(self)
				self:bounceend(0.5):addx(SCREEN_WIDTH)
			end,
			LoadActor("_middle") .. {
				InitCommand=function(self)
					self:y(SCREEN_TOP+25):x(SCREEN_CENTER_X):zoomy(0.8)
				end
			},
			LoadActor(headicon) .. {
				InitCommand=function(self)
					self:x(SCREEN_CENTER_X-265):y(SCREEN_TOP+25):zoomy(0.8)
				end
			}
		},
		-- Text
		LoadFont("_open sans extrabold 48px") .. {
			Name="HeaderText",
			Text=Screen.String("HeaderText"),
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X-230):y(SCREEN_TOP+20):horizalign(left):diffuse(color(headcolour)):strokecolor(color("#000000")):maxwidth(900):zoomx(0.5)
			end,
			OnCommand=function(self)
				self:zoomy(0):sleep(0.4):smooth(0.2):zoomy(0.4)
			end,
			OffCommand=function(self)
				self:decelerate(0.2):diffusealpha(0):zoomy(0)
			end,
			UpdateScreenHeaderMessageCommand=function(self,param)
				self:settext(param.Header)
			end
		},

		-- Subtitle
		LoadFont("_open sans extrabold 48px") .. {
			Name="HeaderSubText",
			Text=Screen.String("HeaderSubText"),
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X-230):y(SCREEN_TOP+36):horizalign(left):diffuse(color(subheadcolour)):maxwidth(900):zoom(0.25)
			end,
			OnCommand=function(self)
				self:zoomy(0):sleep(0.4):smooth(0.2):zoomy(0.2)
			end,
			OffCommand=function(self)
				self:decelerate(0.2):diffusealpha(0):zoomy(0)
			end,
			UpdateScreenHeaderMessageCommand=function(self,param)
				self:settext(param.Header)
			end
		}
	}
}

return t