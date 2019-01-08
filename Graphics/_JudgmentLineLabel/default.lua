local jl = Var "JudgmentLine"

return Def.ActorFrame {
	Def.Quad {
		InitCommand=function(self)
			self:horizalign(right):zoomto(256,18)
		end,
		OnCommand=function(self)
			self:diffuse(Color("Black")):fadeleft(1)
		end
	},
	Def.Quad {
		InitCommand=function(self)
			self:horizalign(left):zoomto(256,18)
		end,
		OnCommand=function(self)
			self:diffuse(Color("Black")):faderight(1)
		end
	},
	
	LoadActor("_frame") .. {
		InitCommand=function(self)
			self:zoomy(0.75):diffuse(JudgmentLineToColor(jl))
		end
	},
	LoadFont("Common Normal") .. {
		InitCommand=function(self)
			self:zoom(0.75):settext(string.upper(JudgmentLineToLocalizedString(jl))):diffuse(JudgmentLineToColor(jl)):strokecolor(JudgmentLineToStrokeColor(jl)):shadowlength(0):maxwidth(180)
		end
	}
}