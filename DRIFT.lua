--ApplyDRIFTMod(IntoDRIFT,FWD,RWD,Drive,MaxFlat,Brake,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Steering)
if CarNameCurrent=='ELEGY' then
	 local FWD = -0.5
	 local RWD = -0.5
	 local Drive = 0.4
	 local MaxFlat = 0
	 local Steering = 0.3
	 local CurveMax = -1.0 --2.67
	 local CurveMin = -1.0 --2.55
	 local CurveLat = 1.0 --0.3926
     ApplyDRIFTMod(DRIFT,FWD,RWD,Drive,MaxFlat,CurveMax,CurveMin,CurveLat,Steering)
end
