--ApplyGTEMod(GTE,Mass,Drag,FWD,RWD,UpShift,DownShift,Drive,MaxFlat,InitMaxFlat,Brake,Steering,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Coll,Eng,DF)
if CarNameCurrent=='HOTRING' then
	 local Drive = 0.05
	 local MaxFlat = 67
	 local Brake = -0.5
	 local CurveMax = -0.1 --2.67
	 local CurveMin = 2 --2.55
   local Front = -0.25
   local Rear = -0.3
     ApplyNASCARMod(NASCAR,Drive,MaxFlat,Brake,CurveMax,CurveMin,Front,Rear)
end
