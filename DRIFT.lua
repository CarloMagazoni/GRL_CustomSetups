--ApplyDRIFTMod(IntoDRIFT,FWD,RWD,Drive,MaxFlat,Brake,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Steering)
if CarNameCurrent=='ELEGY' then
	local FWD = -0.5
	local RWD = -0.5
	local Drive = 0.6
	local MaxFlat = 0
	local Steering = 0.25
	local CurveMax = -1.8 --2.67
	local CurveMin = -0.99 --2.55
	local CurveLat = 1 --0.3926
	local CurveLatR = -0.5
	local LowSpeed = 0
	ApplyDRIFTMod(DRIFT,FWD,RWD,Drive,MaxFlat,CurveMax,CurveMin,CurveLat,Steering,CurveLatR,LowSpeed)
elseif CarNameCurrent=='RT3000' then
	local FWD = 0
	local RWD = 0
	local Drive = 0.6
	local MaxFlat = 0
	local Steering = 0.25
	local CurveMax = -1.8 --2.67
	local CurveMin = -0.61 --2.55
	local CurveLat = 1 --0.3926
	local CurveLatR = -0.5
	local LowSpeed = 0
	ApplyDRIFTMod(DRIFT,FWD,RWD,Drive,MaxFlat,CurveMax,CurveMin,CurveLat,Steering,CurveLatR,LowSpeed)
elseif CarNameCurrent=='EUROS' then
	local FWD = 0
	local RWD = 0
	local Drive = 0.6
	local MaxFlat = 0
	local Steering = 0.285
	local CurveMax = -1.8 --2.67
	local CurveMin = -0.6 --2.55
	local CurveLat = 1 --0.3926
	local CurveLatR = -0.5
	local LowSpeed = 0
	ApplyDRIFTMod(DRIFT,FWD,RWD,Drive,MaxFlat,CurveMax,CurveMin,CurveLat,Steering,CurveLatR,LowSpeed)
elseif CarNameCurrent=='VECTRE' then
	local FWD = -0.6
	local RWD = -0.4
	local Drive = 0.6
	local MaxFlat = 0
	local Steering = 0.25
	local CurveMax = -1.8 --2.67
	local CurveMin = -0.8 --2.55
	local CurveLat = 1 --0.3926
	local CurveLatR = -0.5
	local LowSpeed = 0
	ApplyDRIFTMod(DRIFT,FWD,RWD,Drive,MaxFlat,CurveMax,CurveMin,CurveLat,Steering,CurveLatR,LowSpeed)
elseif CarNameCurrent=='SCHWARZE' then
	local FWD = 0
	local RWD = 0
	local Drive = 0.62
	local MaxFlat = 0
	local Steering = 0.275
	local CurveMax = -1.6 --2.67
	local CurveMin = -0.5 --2.55
	local CurveLat = 1 --0.3926
	local CurveLatR = -0.5
	local LowSpeed = 0
	ApplyDRIFTMod(DRIFT,FWD,RWD,Drive,MaxFlat,CurveMax,CurveMin,CurveLat,Steering,CurveLatR,LowSpeed)
elseif CarNameCurrent=='JESTER4' then
	local FWD = 0
	local RWD = 0
	local Drive = 0.6
	local MaxFlat = 0
	local Steering = 0.25
	local CurveMax = -1.8 --2.67
	local CurveMin = -0.79 --2.55
	local CurveLat = 1 --0.3926
	local CurveLatR = -0.5
	local LowSpeed = 0
	ApplyDRIFTMod(DRIFT,FWD,RWD,Drive,MaxFlat,CurveMax,CurveMin,CurveLat,Steering,CurveLatR,LowSpeed)
elseif CarNameCurrent=='COMET3' then
	local FWD = 0
	local RWD = 0
	local Drive = 0.6
	local MaxFlat = 0
	local Steering = 0.25
	local CurveMax = -1.85 --2.67
	local CurveMin = -0.85 --2.55
	local CurveLat = 1 --0.3926
	local CurveLatR = -0.5
	local LowSpeed = 0
	ApplyDRIFTMod(DRIFT,FWD,RWD,Drive,MaxFlat,CurveMax,CurveMin,CurveLat,Steering,CurveLatR,LowSpeed)
elseif CarNameCurrent=='ZR350' then
	local FWD = 0
	local RWD = 0
	local Drive = 0.6
	local MaxFlat = 0
	local Steering = 0.25
	local CurveMax = -1.8 --2.67
	local CurveMin = -0.8 --2.55
	local CurveLat = 1 --0.3926
	local CurveLatR = -0.5
	local LowSpeed = 0
	ApplyDRIFTMod(DRIFT,FWD,RWD,Drive,MaxFlat,CurveMax,CurveMin,CurveLat,Steering,CurveLatR,LowSpeed)
elseif CarNameCurrent=='ELEGY2' then
	local FWD = -0.6
	local RWD = -0.4
	local Drive = 0.6
	local MaxFlat = 0
	local Steering = 0.45
	local CurveMax = -1.85 --2.67
	local CurveMin = -1.0 --2.55
	local CurveLat = 1 --0.3926
	local CurveLatR = -0.5
	local LowSpeed = -0.8
	ApplyDRIFTMod(DRIFT,FWD,RWD,Drive,MaxFlat,CurveMax,CurveMin,CurveLat,Steering,CurveLatR,LowSpeed)
end
