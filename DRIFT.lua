--ApplyDRIFTMod(IntoDRIFT,FWD,RWD,Drive,MaxFlat,Brake,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Steering)
if CarNameCurrent=='ELEGY' then
	 local FWD = -0.5
	 local RWD = -0.5
	 local Drive = 0.5
	 local MaxFlat = 0
	 local Steering = 0.2
	 local CurveMax = -2.0 --2.67
	 local CurveMin = -1.0 --2.55
	 local CurveLat = 3.0 --0.3926
     ApplyDRIFTMod(DRIFT,FWD,RWD,Drive,MaxFlat,CurveMax,CurveMin,CurveLat,Steering)
end
