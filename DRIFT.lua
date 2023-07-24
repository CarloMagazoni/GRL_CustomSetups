--ApplyDRIFTMod(IntoDRIFT,FWD,RWD,Drive,MaxFlat,Brake,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Steering)
if CarNameCurrent=='ELEGY' then
	local FWD = -0.5
	local RWD = -0.5
	local Drive = 0.6
	local MaxFlat = 0
	local Steering = 0.25
	local CurveMax = -1.8 --2.67
	local CurveMin = -1.0 --2.55
	local CurveLat = 2.5 --0.3926
	ApplyDRIFTMod(DRIFT,FWD,RWD,Drive,MaxFlat,CurveMax,CurveMin,CurveLat,Steering)
elseif CarNameCurrent=='RT3000' then
	local FWD = 0
	local RWD = 0
	local Drive = 0.6
	local MaxFlat = 0
	local Steering = 0.25
	local CurveMax = -1.8 --2.67
	local CurveMin = -1.0 --2.55
	local CurveLat = 2.5 --0.3926
	ApplyDRIFTMod(DRIFT,FWD,RWD,Drive,MaxFlat,CurveMax,CurveMin,CurveLat,Steering)
elseif CarNameCurrent=='EUROS' then
	local FWD = 0
	local RWD = 0
	local Drive = 0.6
	local MaxFlat = 0
	local Steering = 0.25
	local CurveMax = -1.8 --2.67
	local CurveMin = -1.0 --2.55
	local CurveLat = 2.5 --0.3926
	ApplyDRIFTMod(DRIFT,FWD,RWD,Drive,MaxFlat,CurveMax,CurveMin,CurveLat,Steering)
end
