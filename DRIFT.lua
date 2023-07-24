--ApplyDRIFTMod(IntoDRIFT,FWD,RWD,Drive,MaxFlat,Brake,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Steering)
if CarNameCurrent=='ELEGY' then
	local FWD = -0.5
	local RWD = -0.5
	local Drive = 0.6
	local MaxFlat = 0
	local Steering = 0.25
	local CurveMax = -1.8 --2.67
	local CurveMin = -1.0 --2.55
	local CurveLat = 0 --0.3926
	local CurveLatR = -0.5
	ApplyDRIFTMod(DRIFT,FWD,RWD,Drive,MaxFlat,CurveMax,CurveMin,CurveLat,Steering,CurveLatR)
elseif CarNameCurrent=='RT3000' then
	local FWD = 0
	local RWD = 0
	local Drive = 0.6
	local MaxFlat = 0
	local Steering = 0.25
	local CurveMax = -1.8 --2.67
	local CurveMin = -1.0 --2.55
	local CurveLat = 0 --0.3926
	local CurveLatR = -0.5
	ApplyDRIFTMod(DRIFT,FWD,RWD,Drive,MaxFlat,CurveMax,CurveMin,CurveLat,Steering,CurveLatR)
elseif CarNameCurrent=='EUROS' then
	local FWD = 0
	local RWD = 0
	local Drive = 0.6
	local MaxFlat = 0
	local Steering = 0.3
	local CurveMax = -1.8 --2.67
	local CurveMin = -0.6 --2.55
	local CurveLat = 0 --0.3926
	local CurveLatR = -0.5
	ApplyDRIFTMod(DRIFT,FWD,RWD,Drive,MaxFlat,CurveMax,CurveMin,CurveLat,Steering,CurveLatR)
end
