return Def.ActorFrame {
	Def.Quad{
		InitCommand=function(self)
			self:texturewrapping(1):setsize(SCREEN_WIDTH,60):diffuse(color("0,0,0,1")):CenterX():y(SCREEN_TOP+30):diffusebottomedge(1,1,1,0)
		end
	},
	Def.Quad{
		InitCommand=function(self)
			self:texturewrapping(1):setsize(SCREEN_WIDTH,60):diffuse(color("0,0,0,1")):CenterX():y(SCREEN_BOTTOM-30):diffusetopedge(1,1,1,0)
		end
	}
	
}