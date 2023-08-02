if CarNameCurrent ~= 'OPENWHEEL1' then
    SuspensionForceDELTA = 9 --1/9 1/18
    SuspensionForceDELTAMin = 1
    SuspensionForceDELTAMax = 18
    SuspensionForceDELTADisplay = {'1(Soft)','2','3','4','5','6','7','8','9(Mid)','10','11','12','13','14','15','16','17','18(Hard)'}

    ARBForceDELTA = 7 --1/7 1/14
    ARBForceDELTAMin = 1
    ARBForceDELTAMax = 14
    ARBForceDELTADisplay = {'1(Soft)','2','3','4','5','6','7(Mid)','8','9','10','11','12','13','14(Hard)'}

    SuspensionRaiseDELTA = 3 --1/9 1/18
    SuspensionRaiseDELTAMin = 1
    SuspensionRaiseDELTAMax = 18
    SuspensionRaiseDELTADisplay = {'1(Low)','2','3(Stock)','4','5','6','7','8','9(High)'}

    SuspensionBumpDELTA = 9 --1/19 1/38
    SuspensionBumpDELTAMin = 1
    SuspensionBumpDELTAMax = 18
    SuspensionBumpDELTADisplay = {'1(Soft)','2','3','4','5','6','7','8','9(Mid)','10','11','12','13','14','15','16','17','18(Hard)'}

    SuspensionReboundDELTA = 9 --1/19 1/38
    SuspensionReboundDELTAMin = 1
    SuspensionReboundDELTAMax = 18
    SuspensionReboundDELTADisplay = {'1(Soft)','2','3','4','5','6','7','8','9(Mid)','10','11','12','13','14','15','16','17','18(Hard)'}

    SuspensionDumpDELTA = 9 --1/19 1/38
    SuspensionDumpDELTAMin = 1
    SuspensionDumpDELTAMax = 18
    SuspensionDumpDELTADisplay = {'1(Soft)','2','3','4','5','6','7','8','9(Mid)','10','11','12','13','14','15','16','17','18(Hard)'}

    SuspensionTravelDELTA = 9 --1/9 1/18
    SuspensionTravelDELTAMin = 1
    SuspensionTravelDELTAMax = 18
    SuspensionTravelDELTADisplay = {'1(Soft)','2','3','4','5','6','7','8','9(Mid)','10','11','12','13','14','15','16','17','18(Hard)'}

    FrontSpringDELTA = 9 --1/9 1/18
    FrontSpringDELTAMin = 1
    FrontSpringDELTAMax = 18
    FrontSpringDELTADisplay = {'1(Soft)','2','3','4','5','6','7','8','9(Mid)','10','11','12','13','14','15','16','17','18(Hard)'}

    FrontARBDELTA = 9 --1/9 1/18
    FrontARBDELTAMin = 1
    FrontARBDELTAMax = 18
    FrontARBDELTADisplay = {'1(Soft)','2','3','4','5','6','7','8','9(Mid)','10','11','12','13','14','15','16','17','18(Hard)'}

    --ToeFrontDELTA = 18 --1/18 1/36
    CamberFrontDELTA = 50 --20
    CamberFrontDELTAMin = 1
    CamberFrontDELTAMax = 50

    RearSpringDELTA = 9 --1/9 1/18
    RearSpringDELTAMin = 1
    RearSpringDELTAMax = 18
    RearSpringDELTADisplay = {'1(Soft)','2','3','4','5','6','7','8','9(Mid)','10','11','12','13','14','15','16','17','18(Hard)'}

    RearARBDELTA = 9 --1/9 1/18
    RearARBDELTAMin = 1
    RearARBDELTAMax = 18
    RearARBDELTADisplay = {'1(Soft)','2','3','4','5','6','7','8','9(Mid)','10','11','12','13','14','15','16','17','18(Hard)'}

    --ToeRearDELTA = 18 --1/18 1/36
    CamberRearDELTA = 50 --20
    CamberRearDELTAMin = 1
    CamberRearDELTAMax = 50

    SteeringLockDELTA = 5 --1/9
    SteeringLockDELTAMin = 1
    SteeringLockDELTAMax = 9
    SteeringLockDELTADisplay = {'1(Min)','2','3','4','5(Stock)','6','7','8','9(Max)'}

    RearWingDELTA = 3 --1/5
    RearWingDELTAMin = 1
    RearWingDELTAMax = 5
    RearWingDELTADisplay = {'P1','P2','P3','P4','P5'}

    FrontWingDELTA = 3 --1/5
    FrontWingDELTAMin = 1
    FrontWingDELTAMax = 5
    FrontWingDELTADisplay = {'P1','P2','P3','P4','P5'}

    AeroPackageDELTA = 3 --1/3
    AeroPackageDELTAMin = 1
    AeroPackageDELTAMax = 3
    AeroPackageDELTADisplay = {'Low DF','Mid DF','High DF'}

    GT3modeDELTA = 1
    GT3modeDELTAMin = 1
    GT3modeDELTAMax = 2
    GT3modeDELTADisplay = {'DISABLED','ENABLED'}

    GTEmodeDELTA = 1
    GTEmodeDELTAMin = 1
    GTEmodeDELTAMax = 2
    GTEmodeDELTADisplay = {'DISABLED','ENABLED'}

    HSmodeDELTA = 1
    HSmodeDELTAMin = 1
    HSmodeDELTAMax = 2
    HSmodeDELTADisplay = {'DISABLED','ENABLED'}

    F1modeDELTA = 1
    F1modeDELTAMin = 1
    F1modeDELTAMax = 2
    F1modeDELTADisplay = {'DISABLED','ENABLED'}

    NASCARmodeDELTA = 1
    NASCARmodeDELTAMin = 1
    NASCARmodeDELTAMax = 2
    NASCARmodeDELTADisplay = {'DISABLED','ENABLED'}

    DRIFTmodeDELTA = 1
    DRIFTmodeDELTAMin = 1
    DRIFTmodeDELTAMax = 2
    DRIFTmodeDELTADisplay = {'DISABLED','ENABLED'}

    BrakeBiasDELTA = 8 --1/17
    BrakeBiasDELTAMin = 1
    BrakeBiasDELTAMax = 17

    BrakesSizeDELTA = 3
    BrakesSizeDELTAMin = 3
    BrakesSizeDELTAMax = 3
    BrakesSizeDELTADisplay = {'OVAL','ROVAL','CIRCUIT'}

    HeadlightDELTA = 1
    XenonColorDELTA = 1

    GearsDELTA = 2
    GearsDELTAMin = 1
    GearsDELTAMax = 3
    GearsDELTADisplay = {'SHORT','STOCK','LONG'}

    MixDELTA = 1
    CarStatusDELTA = 1
    SpotterDELTA = 1
    EngRunDELTA=1

elseif CarNameCurrent=='OPENWHEEL1' then
    SuspensionForceDELTA = 9 --1/9 1/18
    SuspensionForceDELTAMin = 1
    SuspensionForceDELTAMax = 18
    SuspensionForceDELTADisplay = {'1(Soft)','2','3','4','5','6','7','8','9(Mid)','10','11','12','13','14','15','16','17','18(Hard)'}

    ARBForceDELTA = 7 --1/7 1/14
    ARBForceDELTAMin = 1
    ARBForceDELTAMax = 14
    ARBForceDELTADisplay = {'1(Soft)','2','3','4','5','6','7(Mid)','8','9','10','11','12','13','14(Hard)'}

    SuspensionRaiseDELTA = 3 --1/9 1/18
    SuspensionRaiseDELTAMin = 1
    SuspensionRaiseDELTAMax = 18
    SuspensionRaiseDELTADisplay = {'1(Low)','2','3(Stock)','4','5','6','7','8','9(High)'}

    SuspensionBumpDELTA = 9 --1/19 1/38
    SuspensionBumpDELTAMin = 1
    SuspensionBumpDELTAMax = 18
    SuspensionBumpDELTADisplay = {'1(Soft)','2','3','4','5','6','7','8','9(Mid)','10','11','12','13','14','15','16','17','18(Hard)'}

    SuspensionReboundDELTA = 9 --1/19 1/38
    SuspensionReboundDELTAMin = 1
    SuspensionReboundDELTAMax = 18
    SuspensionReboundDELTADisplay = {'1(Soft)','2','3','4','5','6','7','8','9(Mid)','10','11','12','13','14','15','16','17','18(Hard)'}

    SuspensionDumpDELTA = 9 --1/19 1/38
    SuspensionDumpDELTAMin = 1
    SuspensionDumpDELTAMax = 18
    SuspensionDumpDELTADisplay = {'1(Soft)','2','3','4','5','6','7','8','9(Mid)','10','11','12','13','14','15','16','17','18(Hard)'}

    SuspensionTravelDELTA = 9 --1/9 1/18
    SuspensionTravelDELTAMin = 1
    SuspensionTravelDELTAMax = 18
    SuspensionTravelDELTADisplay = {'1(Soft)','2','3','4','5','6','7','8','9(Mid)','10','11','12','13','14','15','16','17','18(Hard)'}

    FrontSpringDELTA = 9 --1/9 1/18
    FrontSpringDELTAMin = 1
    FrontSpringDELTAMax = 18
    FrontSpringDELTADisplay = {'1(Soft)','2','3','4','5','6','7','8','9(Mid)','10','11','12','13','14','15','16','17','18(Hard)'}

    FrontARBDELTA = 9 --1/9 1/18
    FrontARBDELTAMin = 1
    FrontARBDELTAMax = 18
    FrontARBDELTADisplay = {'1(Soft)','2','3','4','5','6','7','8','9(Mid)','10','11','12','13','14','15','16','17','18(Hard)'}

    --ToeFrontDELTA = 18 --1/18 1/36
    CamberFrontDELTA = 50 --20
    CamberFrontDELTAMin = 1
    CamberFrontDELTAMax = 50

    RearSpringDELTA = 9 --1/9 1/18
    RearSpringDELTAMin = 1
    RearSpringDELTAMax = 18
    RearSpringDELTADisplay = {'1(Soft)','2','3','4','5','6','7','8','9(Mid)','10','11','12','13','14','15','16','17','18(Hard)'}

    RearARBDELTA = 9 --1/9 1/18
    RearARBDELTAMin = 1
    RearARBDELTAMax = 18
    RearARBDELTADisplay = {'1(Soft)','2','3','4','5','6','7','8','9(Mid)','10','11','12','13','14','15','16','17','18(Hard)'}

    --ToeRearDELTA = 18 --1/18 1/36
    CamberRearDELTA = 50 --20
    CamberRearDELTAMin = 1
    CamberRearDELTAMax = 50

    SteeringLockDELTA = 5 --1/9
    SteeringLockDELTAMin = 1
    SteeringLockDELTAMax = 9
    SteeringLockDELTADisplay = {'1(Min)','2','3','4','5(Stock)','6','7','8','9(Max)'}

    RearWingDELTA = 5 --1/9
    RearWingDELTAMin = 1
    RearWingDELTAMax = 9
    RearWingDELTADisplay = {'1(Speed)','2','3','4','5','6','7','8','9(Grip)'}

    FrontWingDELTA = 5 --1/9
    FrontWingDELTAMin = 1
    FrontWingDELTAMax = 9
    FrontWingDELTADisplay = {'1(Speed)','2','3','4','5','6','7','8','9(Grip)'}

    AeroPackageDELTA = 3 --1/3
    AeroPackageDELTAMin = 1
    AeroPackageDELTAMax = 3
    AeroPackageDELTADisplay = {'Low DF','Mid DF','High DF'}

    GT3modeDELTA = 1
    GT3modeDELTAMin = 1
    GT3modeDELTAMax = 2
    GT3modeDELTADisplay = {'DISABLED','ENABLED'}

    GTEmodeDELTA = 1
    GTEmodeDELTAMin = 1
    GTEmodeDELTAMax = 2
    GTEmodeDELTADisplay = {'DISABLED','ENABLED'}

    HSmodeDELTA = 1
    HSmodeDELTAMin = 1
    HSmodeDELTAMax = 2
    HSmodeDELTADisplay = {'DISABLED','ENABLED'}

    F1modeDELTA = 1
    F1modeDELTAMin = 1
    F1modeDELTAMax = 2
    F1modeDELTADisplay = {'DISABLED','ENABLED'}

    NASCARmodeDELTA = 1
    NASCARmodeDELTAMin = 1
    NASCARmodeDELTAMax = 2
    NASCARmodeDELTADisplay = {'DISABLED','ENABLED'}

    DRIFTmodeDELTA = 1
    DRIFTmodeDELTAMin = 1
    DRIFTmodeDELTAMax = 2
    DRIFTmodeDELTADisplay = {'DISABLED','ENABLED'}

    BrakeBiasDELTA = 8 --1/17
    BrakeBiasDELTAMin = 1
    BrakeBiasDELTAMax = 17

    BrakesSizeDELTA = 3
    BrakesSizeDELTAMin = 3
    BrakesSizeDELTAMax = 3
    BrakesSizeDELTADisplay = {'OVAL','ROVAL','CIRCUIT'}

    HeadlightDELTA = 1
    XenonColorDELTA = 1

    GearsDELTA = 2
    GearsDELTAMin = 1
    GearsDELTAMax = 3
    GearsDELTADisplay = {'SHORT','STOCK','LONG'}

    MixDELTA = 1
    CarStatusDELTA = 1
    SpotterDELTA = 1
    EngRunDELTA=1
end
