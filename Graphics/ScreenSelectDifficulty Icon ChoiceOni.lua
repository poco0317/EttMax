local gc = Var("GameCommand")
local ind = gc:GetIndex()
local delay = ind / 10

local path = "_screenselectdifficulty icons/"
return Def.ActorFrame {
	InitCommand=function(self)
		self:zoom(0)
	end,
	OnCommand=function(self)
		self:queuecommand("In")
	end,
	LoadActor( path .. "info oni" )..{
		InitCommand=function(self)
			self:y(-108):vertalign(bottom)
		end
	},
	LoadActor( path .. "picture oni" )
}