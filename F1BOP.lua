--ApplyF1Mod(F1info,Mass,Drag,UpShift,DownShift,Drive,MaxFlat,InitMaxFlat,Brake,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Front,Rear,Force,Bump,Travel,SuspensionLift,FS,RS,ARB,Rolo,DF)
if CarNameCurrent=='FORMULA' then
	 local Mass = -305
	 local Drag = 0
	 local UpShift = 0
	 local DownShift = 0
	 local Drive = -0.01
	 local MaxFlat = 36
	 local InitMaxFlat = 15
	 local Brake = -0.65
	 local CurveMax = -0.085
	 local CurveMaxR = 0
	 local CurveMin = 0
	 local CurveMinR = 0
	 local CurveLat = 0
	 local CurveLatR = 0
	 local DF = -4
	 local Front = 0.06
	 local Rear = -0.06
	 local SuspensionLift = 0
	 local Force = -0.45
	 local Bump = 0.20
	 local ARB = 0
	 local FS = 0
	 local RS = 0
	 local Travel = -0.01
	 local Rolo = 0
     ApplyF1Mod(F1,Mass,Drag,UpShift,DownShift,Drive,MaxFlat,InitMaxFlat,Brake,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Front,Rear,Force,Bump,Travel,SuspensionLift,FS,RS,ARB,Rolo,DF)
elseif CarNameCurrent=='OPENWHEEL1' then
	 local Mass = 300
	 local Drag = 0
	 local UpShift = -4
	 local DownShift = 0
	 local Drive = 0
	 local MaxFlat = 26
	 local InitMaxFlat = 0
	 local Brake = -0.8
	 local CurveMax = -0.025
	 local CurveMaxR = -0.05
	 local CurveMin = -0.065
	 local CurveMinR = 0.14
	 local CurveLat = 0.038
	 local CurveLatR = -0.39
	 local DF = -3
	 local Front = 0.1
	 local Rear = -0.01
	 local SuspensionLift = 0.07
	 local Force = 0.1
	 local Bump = 0.20
	 local ARB = 2
	 local FS = 0
	 local RS = 0
	 local Travel = -0.01
	 local Rolo = 0.03
     ApplyF1Mod(F1,Mass,Drag,UpShift,DownShift,Drive,MaxFlat,InitMaxFlat,Brake,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Front,Rear,Force,Bump,Travel,SuspensionLift,FS,RS,ARB,Rolo,DF)
end
