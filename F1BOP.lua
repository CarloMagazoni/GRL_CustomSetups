--ApplyF1Mod(F1info,Mass,Drag,UpShift,DownShift,Drive,MaxFlat,InitMaxFlat,Brake,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Front,Rear,Force,Bump,Travel,SuspensionLift,FS,RS,ARB,Rolo,DF)
if CarNameCurrent=='OPENWHEEL1' then
	 local Mass = 300
	 local Drag = -0.001
	 local UpShift = -4
	 local DownShift = -2
	 local Drive = -0.03
	 local MaxFlat = 15.84
	 local InitMaxFlat = 0
	 local Brake = -0.8
	 local CurveMax = -0.025
	 local CurveMaxR = -0.05
	 local CurveMin = -0.095
	 local CurveMinR = 0.14
	 local CurveLat = 0.038
	 local CurveLatR = -0.59 
	 local DF = -2
	 local Front = 0.05
	 local Rear = -0.05
	 local SuspensionLift = 0.07
	 local Force = 0.1
	 local Bump = 0.20
	 local ARB = 2
	 local FS = 0.17
	 local RS = - 0.17
	 local Travel = 0.05
	 local Rolo = 0.03
     ApplyF1Mod(F1,Mass,Drag,UpShift,DownShift,Drive,MaxFlat,InitMaxFlat,Brake,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Front,Rear,Force,Bump,Travel,SuspensionLift,FS,RS,ARB,Rolo,DF)
end