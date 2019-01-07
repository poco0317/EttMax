-- Swiped from Konamix; thank you!
-- ScreenGameplay out
local travelDist = SCREEN_WIDTH*2;
local LeftToRight = Def.ActorFrame{
	LoadActor("_LeftToRight");
	Def.Quad{
		InitCommand=cmd(addx,-64;diffuse,color("#000000FF");halign,1;zoomto,travelDist,32);
	};
};

local RightToLeft = Def.ActorFrame{
	LoadActor("_RightToLeft");
	Def.Quad{
		InitCommand=cmd(addx,64;diffuse,color("#000000FF");halign,0;zoomto,travelDist,32);
	};
};

local t = Def.ActorFrame{
	Def.Quad{
		Name="Blocker";
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,0"));
		OnCommand=cmd(sleep,0.6;linear,0.6;diffusealpha,1);
	};

	-- LeftToRight x6
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-640;y,SCREEN_CENTER_Y-160);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-480;y,SCREEN_CENTER_Y-96);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-320;y,SCREEN_CENTER_Y-32);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-320;y,SCREEN_CENTER_Y+32);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-400;y,SCREEN_CENTER_Y+96);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-480;y,SCREEN_CENTER_Y+160);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};

	-- RightToLeft x6
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+560;y,SCREEN_CENTER_Y-192);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+480;y,SCREEN_CENTER_Y-128);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+400;y,SCREEN_CENTER_Y-64);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+320;y,SCREEN_CENTER_Y);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+400;y,SCREEN_CENTER_Y+64);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+480;y,SCREEN_CENTER_Y+128);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};
	
	Def.ActorFrame {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;);
		LoadActor("_failed") .. {
			OnCommand=cmd(diffusealpha,0;zoom,4;sleep,0.8;decelerate,0.6;diffusealpha,0.4;zoom,0.6;accelerate,0.4;zoom,1;decelerate,0.2;zoom,1.1;linear,0.1;zoom,1.0;sleep,2;linear,0.5;diffusealpha,0);
		};
			
		LoadActor("_failed") .. {
			OnCommand=cmd(diffusealpha,0;zoom,4;sleep,0.7;decelerate,0.6;diffusealpha,0.4;zoom,0.6;accelerate,0.4;zoom,1;decelerate,0.2;zoom,1.1;linear,0.1;zoom,1.0;sleep,2;linear,0.5;diffusealpha,0);
		};	
				
		LoadActor("_failed") .. {
			OnCommand=cmd(diffusealpha,0;zoom,4;sleep,0.6;decelerate,0.6;diffusealpha,0.4;zoom,0.6;accelerate,0.4;zoom,1;decelerate,0.2;zoom,1.1;linear,0.1;zoom,1.0;sleep,2;linear,0.5;diffusealpha,0);
		};	

		LoadActor("_failed") .. {
			OnCommand=cmd(diffusealpha,0;zoom,4;sleep,0.5;decelerate,0.6;diffusealpha,0.4;zoom,0.6;accelerate,0.4;zoom,1;decelerate,0.2;zoom,1.1;linear,0.1;zoom,1.0;sleep,2;linear,0.5;diffusealpha,0);
		};	

		LoadActor("_failed") .. {
			OnCommand=cmd(diffusealpha,0;zoom,4;sleep,0.9;decelerate,0.6;diffusealpha,1.0;zoom,0.6;accelerate,0.4;zoom,1;sleep,3;smooth,1;diffusealpha,0;);
		};	
	};
	
	LoadActor("_sound") .. {
		StartTransitioningCommand=cmd(play);
	};
};

return t;