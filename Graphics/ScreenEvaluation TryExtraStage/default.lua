return Def.Sprite{
	BeginCommand=function(self)
		local extraType = "extra1"
		self:Load(THEME:GetPathG("ScreenEvaluation","TryExtraStage/"..extraType))
	end
}