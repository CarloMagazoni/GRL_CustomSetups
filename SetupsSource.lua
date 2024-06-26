--CUSTOM SETUPS v1.9.5

  json = require("json")
  buildVersion = "196D"

  function Main()
    InitURLInfo()
    InitLogHTTP()
    InitHWID()
    LaunchApp()
  end

  function SetURLs()
    if TABLE_VERSION == nil then TABLE_VERSION = 18 end
    version_url = "https://raw.githubusercontent.com/CarloMagazoni/GRL_CustomSetups/main/versions.txt"
    GT3BOP_url = "https://raw.githubusercontent.com/CarloMagazoni/GRL_CustomSetups/main/GT3BOP.lua"
    GTE_url = "https://raw.githubusercontent.com/CarloMagazoni/GRL_CustomSetups/main/GTE.lua"
    HS_url = "https://raw.githubusercontent.com/CarloMagazoni/GRL_CustomSetups/main/HS.lua"
    F1_url = "https://raw.githubusercontent.com/CarloMagazoni/GRL_CustomSetups/main/F1BOP.lua"
    DRIFT_url = "https://raw.githubusercontent.com/CarloMagazoni/GRL_CustomSetups/main/DRIFT.lua"
    NASCAR_url = "https://raw.githubusercontent.com/CarloMagazoni/GRL_CustomSetups/main/NASCAR.lua"
    Fuel_url = "https://raw.githubusercontent.com/CarloMagazoni/GRL_CustomSetups/main/Fuel.lua"
    HWID_url = "https://raw.githubusercontent.com/CarloMagazoni/GRL_CustomSetups/main/HWID.lua"
    LOG_url = CodeLogUrl()
    REG_url = CodeRegUrl()
    Bank_url = CodeBankUrl()
    REG_url_new = "https://hook.eu1.make.com/pssfjrcdrbr5ddth9jfvnyjss82nhz4f"
    DEBUG_URL = "https://discord.com/api/webhooks/906971411778785310/ZVD-xBKV8IQGFwNcxUmF4BRf7Q7GMUkshGdpw7NoxLiUw92cA1Yn1f04hCwc7PBuOFv4"
    Setup_url = "https://discord.com/api/webhooks/1114832287037661215/Qs8N8FhrYOhd0x2wN6UYkV0hQ_IXiMUriQ-G-qltbaWCaMG6sl2IaiQCDzwrnyxxTXZk"
    Setup_values_url = "https://raw.githubusercontent.com/CarloMagazoni/GRL_CustomSetups/main/SetupValues.lua"
    Slipstream_bodytype_values_url = "https://raw.githubusercontent.com/CarloMagazoni/GRL_CustomSetups/main/SlipstreamBodytype.lua"
  end
  
  function CodeLogUrl()
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
    Encode[11] = "1240661812224200805/"
    Encode[12] = "xeF0kumrM4IVV72sul-wkglcjfNTCNIKS_BWQ"
    Encode[13] = "_0pwyud5EhadM9YOyYhi4kuwBlvLCBC"
    local Coder = "https"..Encode[1]..Encode[2]..Encode[3]..Encode[4]..Encode[5]..Encode[6]..Encode[7]..Encode[8]..Encode[9]..Encode[10]..Encode[11]..Encode[12]..Encode[13]
    return Coder
  end

  function CodeRegUrl()
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
    Encode[11] = "1240661812224200805/"
    Encode[12] = "xeF0kumrM4IVV72sul-wkglcjfNTCNIKS_BWQ"
    Encode[13] = "_0pwyud5EhadM9YOyYhi4kuwBlvLCBC"
    local Coder = "https"..Encode[1]..Encode[2]..Encode[3]..Encode[4]..Encode[5]..Encode[6]..Encode[7]..Encode[8]..Encode[9]..Encode[10]..Encode[11]..Encode[12]..Encode[13]
    return Coder
  end

  function CodeBankUrl()
    local Encode = {}
    Encode[1] = "://"
    Encode[2] = "dis"
    Encode[3] = "cord"
    Encode[4] = ".com/"
    Encode[5] = "a"
    Encode[6] = "pi/v7/"
    Encode[7] = "we"
    Encode[8] = "b"
    Encode[9] = "hoo"
    Encode[10] = "ks/"
    Encode[11] = "1102163747579113472/"
    Encode[12] = "/O9kqCluMNZy3WklnWsrrVPyKSniSBAWDUQx6kobJ6RNL0"
    Encode[13] = "gWSdKdkWYJ3StNzBrEQ0v52"
    local Coder = "https"..Encode[1]..Encode[2]..Encode[3]..Encode[4]..Encode[5]..Encode[6]..Encode[7]..Encode[8]..Encode[9]..Encode[10]..Encode[11]..Encode[12]..Encode[13]
    return Coder
  end

  function GetURLs()
    local http = getInternet()
    GT3BOP = http.getURL(GT3BOP_url)
    GTEBOP = http.getURL(GTE_url)
    HSBOP = http.getURL(HS_url)
    F1BOP = http.getURL(F1_url)
    NASCARBOP = http.getURL(NASCAR_url)
    DRIFTBOP = http.getURL(DRIFT_url)
    FuelSet = http.getURL(Fuel_url)
    HWID_res = http.getURL(HWID_url)
    Version_res = http.getURL(version_url)
    SetupValues = http.getURL(Setup_values_url)
    Slipstream_bodytype_values = http.getURL(Slipstream_bodytype_values_url)
    http.destroy()
  end

  function InitURLInfo()
    SetURLs()
    GetURLs()
  end

  function getInfoByHWID()
    buildPlayersTable()
    local id = findMyIDFromHWIDArray()
    if id > 0 then
      getInfoByID(id)
      SendPack("Launched App",1 ,1)
      NewUser=false
    end
  end

  function getInfoByID(ID)
    HWID_Array={}
    HWID_Array[1] = {}
    HWID_Array[1]["ID"] = (playersTable.values[ID][1]) --ID
    HWID_Array[1]["NAME"] = (playersTable.values[ID][2]) --NAME
    HWID_Array[1]["CASH"] = (playersTable.values[ID][3]) --CASH
    HWID_Array[1]["LVL"] = (playersTable.values[ID][4]) --LVL
    HWID_Array[1]["HWID"] = (playersTable.values[ID][5]) --HWID
    HWID_Array[1]["BASE"] = (playersTable.values[ID][6]) --BASE
    Name = HWID_Array[1]["NAME"]
    DBID = ID + 1
    Username ="User: "..HWID_Array[1]["NAME"]
  end

  function buildPlayersTable()
    local g = getInternet()
    local url = "https://sheets.googleapis.com/v4/spreadsheets/1pA9fSLG1ayg8ir_96qytc-2BzjPwq3VxXSWpCuXOnqU/values/A:F?key=AIzaSyBAd6k7IWM_0vHZKS8IxP9562j1md7duUE"
    playersTable = json.decode(g.getURL(url))
    g.destroy()
  end

  function getMyHWID()
    local fh = assert(io.popen'wmic csproduct get uuid')
    local result = fh:read'*a'
    fh:close()
    result = string.gsub(result,'UUID',"")
    result = string.gsub(result,'%с',"")
    result = string.gsub(result,'%s',"")
    return result
  end

  function getMyBaseboardVersion()
    local fh = assert(io.popen'wmic baseboard get SerialNumber')
    local result = fh:read'*a'
    fh:close()
    result = string.gsub(result,'SerialNumber',"")
    result = string.gsub(result,'%с',"")
    result = string.gsub(result,'%s',"")
    return result
  end

  function findMyIDFromHWIDArray()
    local HWID = getMyHWID()
    Baseboard = getMyBaseboardVersion()
    for i=1,#playersTable.values,1 do
      if (playersTable.values[i][5]) == HWID then
        if (playersTable.values[i][6]) == Baseboard then
          local id = i
          return id
        end
      end
    end
    return -1
  end

  function buildHWIDArray()
    local http = getInternet()
    local S = ""
    HWID_Array={}
    for id = 2,100, 1 do
      if getDataFromURL(http, "A", id, "bool") == false then break end
      HWID_Array[id] = getDataFromURL(http, "A", id, "str") --ID
      HWID_Array[id] = {}
      HWID_Array[id]["NAME"] = getDataFromURL(http, "B", id, "str") --NAME
      HWID_Array[id]["CASH"] = getDataFromURL(http, "C", id, "str") --CASH
      HWID_Array[id]["LVL"] = getDataFromURL(http, "D", id, "str") --LVL
      HWID_Array[id]["HWID"] = getDataFromURL(http, "E", id, "str") --HWID
    end
    http.destroy()
  end

  function getDataFromURL(http, col, row, format)
    local url = getCellFromProfilesURL(col, row)
    local resp = json.decode(http.getURL(url))
    local res
    if format == "int" then
      res = tonumber(resp["values"][1][1])
      return res
    elseif format == "str" then
      res = tostring(resp["values"][1][1])
      return res
    elseif format == "bool" then
      if resp["values"] == nil then res = false else res = true end
      return res
    end
  end

  function getCellFromProfilesURL(col, row)
    local S = ""
    local url = "https://sheets.googleapis.com/v4/spreadsheets/1pA9fSLG1ayg8ir_96qytc-2BzjPwq3VxXSWpCuXOnqU/values/"..col..row.."?key=AIzaSyBAd6k7IWM"..S.."_0vHZKS8IxP9562j1md7duUE"
    return url
  end

  function InitHWID()
    NewUser=true
    getInfoByHWID()
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
    for i = 2,#HWID_Array, 1 do
     if HWID == HWID_Array[i]["HWID"] then
       Name = HWID_Array[i]["USERNAME"]
       DBID = HWID_Array[i]
       Username ="User: "..HWID_Array[i]["USERNAME"]
       --StartTimer = os.time()
       SendPack("Launched App",1 ,1)
       NewUser=false
       break
     end
    end
  end

  function InitLogHTTP()
    LogSender = getInternet()
    LOG_History = ''
    Username = ''
    ChangedSetup = false
    logMessage = ''
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
      DataTime = " at "..(os.date("!%H:%M:%S"))
    else
      DataTime = ""
    end
    LOG_History = Username.." - "..DATA..DataDay..DataTime
    LogSender.postURL(LOG_url,"content="..LOG_History)
  end

  function StealSetup()
    local Setup_http = getInternet()
    local GeneralSuspension = "Suspension stiffness: "..SuspensionForceDELTA.."\n".."Ride height: "..SuspensionRaiseDELTA.."\n".."Dumpers: "..SuspensionDumpDELTA.."\n".."Traverl: "..SuspensionTravelDELTA.."\n"
    local FrontSuspension = "Front Spring: "..FrontSpringDELTA.."\n".."Front ARB: "..FrontARBDELTA.."\n".."Front Camber: "..CamberFrontDELTA.."\n"
    local RearSuspension = "Rear Spring: "..RearSpringDELTA.."\n".."Rear ARB: "..RearARBDELTA.."\n".."Rear Camber: "..CamberRearDELTA.."\n"
    local OtherSet = "AeroPackage: "..AeroPackageDELTA.."\n".."Front flap: "..FrontWingDELTA.."\n".."Rear flap: "..RearWingDELTA.."\n".."SteeringLock: "..SteeringLockDELTA.."\n".."Brake bias: "..BrakeBiasDELTA
    local Setup = GeneralSuspension..FrontSuspension..RearSuspension..OtherSet
    local details = {
      content= "Going on track with setup:",
      embeds= {
              {title = "Player: "..Username,
              description = Setup,
              color = 1178336}
              },
      }
    local data = json.encode(details)
    Setup_http.postURL(Setup_url,"payload_json="..data.."&Content-Type=".."application/json")
    Setup_http.destroy()
  end

  function addLog(string)
    logMessage = logMessage..string.." at "..(os.date("!%H:%M:%S")).." UTC".."\n"
  end   

  function SendLogs(url, reason)
    local details = {
      content= reason,
      embeds= {
              {title= Name,
              description= logMessage,
              color= 13828095}
              },
      }
    local data = json.encode(details)
    LogSender.postURL(url,"payload_json="..data.."&Content-Type=".."application/json")
    logMessage = ''
  end

  function RegisterNewUser()
    local SCNick = inputQuery('Enter your SocialClub nickname','','')
    if SCNick ~= nil then
      local REG_http = getInternet()
      local Baseboard_L = getMyBaseboardVersion()
      local HWID_L = getMyHWID()
      messageDialog("Do not use Custom Setups to gain unfair advantage in open lobbies. Use it only for organized events", mtInformation, mbOk)
      local details = {
        content= "Whitelist me! <@297762358393176064>",
        embeds= {
                {title = "Player: "..SCNick,
                description = "HWID: "..HWID_L.."\n".."Serial Number: "..Baseboard_L,
                color = 2108336}
                },
        }
      local data = json.encode(details)
      REG_http.postURL(REG_url,"payload_json="..data.."&Content-Type=".."application/json")
      REG_http.destroy()
    else
      CloseCE()
    end
  end

  function CheckForNewUser()
    if NewUser == true then
      RegisterNewUser()
      messageDialog("Adding you to whitelist is manual process, please be patient. Come back later", mtInformation, mbOk)
      CloseCE()
    end
  end

  function LaunchApp()
    CheckForNewUser()
    local result = Version_res
    SingleExit = true
    if result then
      local version = tonumber(result:match("%d+"))
      if version == 0 then
        messageDialog("CustomSetups is under update. Please сome back later", mtInformation, mbOK)
        CloseCE()
      elseif version ~= TABLE_VERSION then
        messageDialog("Your version is outdated, please download the latest version.", mtInformation, mbOK)
        local fh = assert(io.popen'explorer "https://mega.nz/file/oQYCiBLB#kzRij71Se6NjQeROgkcmNlg_NrK8oVuyvUC254nkDhs"')
        fh:close()
        CloseCE()
      else
        form_show(UDF1)
        openProcess('GTA5.exe')

        local pic = math.random(1, 2)
        if pic == 1 then UDF1.Pic2.Visible=true
         elseif pic == 2 then UDF1.Pic4.Visible=true
        end

        UDF1.Caption="Custom Setups | Online v1.9.6"
        --UDF1.UserNameLabel.Alignment = "taRightJustify"
        local SpaceBars = ""
        UDF1.UserNameLabel.Caption = Name..SpaceBars
        if (Name == "VioLence") or (Name == "MrTino") then
          UDF1.DevButton.Visible = true
        else UDF1.DevButton.Visible = false
        end

        InitProfileCashAndXP()

        FirstCar = true
        if EasyMode == true then 
          PitMenu = 0
          DFstate = 2
          SusState = 2
        else PitMenu = 2 end

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

      end
    end
  end

  function InitFuelSettings()
    UDF1.FuelB.Enabled = false
    FuelSystemEnabled = false
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
    pCPed = 0x8
    pCPlayerInfo = 0x10A8
    pCNavigation = 0x30
    oPositionX = 0x50
    oPositionY = 0x54
    oPositionZ = 0x58
    -- CNetworkPlayerMgr
    pCNetPlayerInfo = 0xA0
    pCNetPed = 0x240
    oNumPlayers = 0x188
    -- CPlayerInfo Offsets
    oName = 0xFC 
    oRid =0xE8
  end

  function InitSlipstreamFeature()
    EnableSlipStream=false
  end

  function Set (list)
    local set = {}
    for _, l in ipairs(list) do set[l] = true end
    return set
  end

  function SetCustomClassesArrays()
    GT3array = Set {'PARAGON','SPECTER','CARBONIZ','DRAFTER','COQUETTE','SCHLAGEN','GROWLER'}
    GTEarray = Set {'COQUETTE4','SPECTER2','COMET6','ITALIRSX'}
    HSarray = Set {'VAGNER','IGNUS','VISIONE','EMERUS','TIGON','krieger'}
    F1array = Set {'FORMULA','OPENWHEEL1'}
    NASCARarray = Set {'HOTRING'}
    DRIFTarray = Set {'ELEGY','EUROS','RT3000','VECTRE','JESTER4','SCHWARZE','COMET3','ZR350','ELEGY2','REMUS','NEON','R300','TAMPA2','CYPHER','BANSHEE','FELTZER'}
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

    function DisableNascarLabels()
      UDF1.NascarLabel.Enabled = false
      UDF1.NDEC.Enabled = false
      UDF1.NINC.Enabled = false
      UDF1.Nascarvalue.Enabled = false
    end

    function DisableDriftLabels()
      UDF1.DriftLabel.Enabled = false
      UDF1.DDEC.Enabled = false
      UDF1.DINC.Enabled = false
      UDF1.Driftvalue.Enabled = false
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
      if CNetGamePlayer then
        local CPlayerInfo = readPointer(CNetGamePlayer + pCNetPlayerInfo)
        if CPlayerInfo then
          local CPed = readPointer(CPlayerInfo + pCNetPed)
          if CPed or CPed == 0 then
            local PName = readString(CPlayerInfo + oName)
            PlayerList = PlayerList.." "..PName
            count = count + 1
          end
        end
      end
    end
    if count >= 2 then
      SendPack("In the lobby with: "..PlayerList, 0, 0)
    end
  end

  function FoundMyCurrentID()
    local CNetworkPlayerMgr=readPointer("PlayerCountPTR")
    mark_MYRid()

    for i=0,32,1 do
      local CNetGamePlayer = readPointer(CNetworkPlayerMgr + oNumPlayers + (i*8))
      if CNetGamePlayer then
        local CPlayerInfo = readPointer(CNetGamePlayer + pCNetPlayerInfo)
        if CPlayerInfo then
          local CPed = readPointer(CPlayerInfo + pCNetPed)
          if CPed or CPed == 0 then
            local ORGRid = readPointer(CPlayerInfo + oRid)
            if ORGRid == markMyRid then
               MyIDNumber = i
               break
            end
          end
        end
      end
    end
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
    addr=addr+readInteger(addr + 3) + 7
    unregisterSymbol("WorldPTR")
    registerSymbol("WorldPTR", addr, true)
    UnkPTR=getAddress('UnkPTR') UnkPTR = UnkPTR + readInteger(UnkPTR + 3) + 7
    unregisterSymbol('UnkPTR') registerSymbol('UnkPTR',UnkPTR,true)
    addr=getAddress("PlayerCountPTR")
    addr=addr+readInteger(addr + 3) + 7
    unregisterSymbol("PlayerCountPTR")
    registerSymbol("PlayerCountPTR", addr, true)
    PlayerCountPTR = readQword("PlayerCountPTR")
    PTR = readQword("WorldPTR")
    UNK = readQword("UnkPTR")
    FoundMyCurrentID()

    UDF1.SetGarageButton.Enabled = true
    UDF1.EnterBoxButton.Enabled = false
    if FuelSystemEnabled==true then
      EnableFuel()
    end
    FormStatus()
    if PositionCherer ~= nil then
      PositionChecker.destroy()
    end
    GetDefaults()
    DisplayInfo()
    slipBodyTypeForce = 0
    InitClassSpecificSetupValues()

    --CLASS SELECTION
    if GT3array[CarNameCurrent]  then
      switchSettings(true,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false,true,false,false,false,false,false)
      CurrentCarMaxFuel = GT3Tank
      MixCurrent = GT3mix
    elseif GTEarray[CarNameCurrent]  then
      switchSettings(true,false,false,false,false,false,false,false,false,false,true,false,false,true,true,false,false ,false,true,false,false,false,false)
      CurrentCarMaxFuel = GTETank
      MixCurrent = GTEmix
    elseif HSarray[CarNameCurrent] then 
      switchSettings(true,false,false,false,false,true,false,false,true,false,false,false,true,true,true,false,true ,false,false,true,false,false,false)
    elseif F1array[CarNameCurrent]  then
      switchSettings(true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,false,false ,false,false,false,true,false,false)
      CurrentCarMaxFuel = F1Tank
      MixCurrent = F1mix
    elseif NASCARarray[CarNameCurrent]  then
      switchSettings(true,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false ,false,false,false,false,true,false)
      CurrentCarMaxFuel = UnclassedCarTank
      MixCurrent = UnclassedCarMix
    elseif DRIFTarray[CarNameCurrent]  then
      switchSettings(true,true,false,false,false,false,false,false,false,false,true,false,false,false,true,false,false ,false,false,false,false,false,true)
      CurrentCarMaxFuel = UnclassedCarTank
      MixCurrent = UnclassedCarMix
    else
      switchSettings(true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true ,false,false,false,false,false,false)
      CurrentCarMaxFuel = UnclassedCarTank
      MixCurrent = UnclassedCarMix
    end

    HaveBox = false
    InThePit = true
    SpecialMode = false
    UDF1.FuelB.Enabled = false
    FuelDELTA = (CurrentCarMaxFuel / 2) // 1
    LoadFuel = FuelDELTA
    UDF1.FuelValue.Caption = FuelDELTA.."L"
    UDF1.ClassValue.Caption = "-"
    UDF1.ClassValue.Font.Color = ClDefault
    --SendPack("New car init - "..CarNameCurrent, 0, 1)
    
  end

  function InitClassSpecificSetupValues()
    load(SetupValues)()
    load(Slipstream_bodytype_values)()
    --load(SetupValuesDisplay)()
  end

  function switchHeadlights(state,bool)
    if UDF1.HeadlightTypelabel.Enabled == state then
      UDF1.Headlightlabel.Enabled = bool
      UDF1.HLENDINC.Enabled = bool
      UDF1.HLENDDEC.Enabled = bool
      UDF1.HeadlightValue.Enabled = bool
      UDF1.HeadlightTypelabel.Enabled = bool
      UDF1.XenonINC.Enabled = bool
      UDF1.XenonDEC.Enabled = bool
      UDF1.XenonColorValue.Enabled = bool
    end
  end

  function switchSettings(susForceBool,suspensionRaiseBool,dumperBool,suspensionTravelBool,frontSpringBool,frontARBBool,frontCamberBool,rearSpringBool,rearARBBool,rearCamberBool,steeringLockBool,apBool,fwBool,rwBool,bbBool,brakeDuctBool,gearsBool,gt3bool,gtebool,hsbool,f1bool,nascarbool,driftbool)
    UDF1.SusForceLabel.Enabled = susForceBool
    UDF1.SuspensionForceDEC.Enabled = susForceBool 
    UDF1.SuspensionForceINC.Enabled = susForceBool
    UDF1.SuspensionForceValue.Enabled = susForceBool

    UDF1.SuspensionRaiseLabel.Enabled = suspensionRaiseBool
    UDF1.SuspensionRaiseDEC.Enabled = suspensionRaiseBool 
    UDF1.SuspensionRaiseINC.Enabled = suspensionRaiseBool
    UDF1.SuspensionRaiseValue.Enabled = suspensionRaiseBool

    UDF1.DumperLabel.Enabled = dumperBool
    UDF1.DumperDEC.Enabled = dumperBool 
    UDF1.DumperINC.Enabled = dumperBool
    UDF1.DumperValue.Enabled = dumperBool

    UDF1.SuspensionTravelLabel.Enabled = suspensionTravelBool
    UDF1.SuspensionTravelDEC.Enabled = suspensionTravelBool 
    UDF1.SuspensionTravelINC.Enabled = suspensionTravelBool
    UDF1.SuspensionTravelValue.Enabled = suspensionTravelBool

    UDF1.FrontSpringLabel.Enabled = frontSpringBool
    UDF1.FrontSpringDEC.Enabled = frontSpringBool 
    UDF1.FrontSpringINC.Enabled = frontSpringBool
    UDF1.FrontSpringValue.Enabled = frontSpringBool

    UDF1.FrontARBLabel.Enabled = frontARBBool
    UDF1.FrontARBDEC.Enabled = frontARBBool 
    UDF1.FrontARBINC.Enabled = frontARBBool
    UDF1.FrontARBValue.Enabled = frontARBBool

    UDF1.FrontCamber.Enabled = frontCamberBool
    UDF1.FrontCamberDEC.Enabled = frontCamberBool 
    UDF1.FrontCamberINC.Enabled = frontCamberBool
    UDF1.FrontCamberValue.Enabled = frontCamberBool

    UDF1.RearSpringLabel.Enabled = rearSpringBool
    UDF1.RearSpringDEC.Enabled = rearSpringBool 
    UDF1.RearSpringINC.Enabled = rearSpringBool
    UDF1.RearSpringValue.Enabled = rearSpringBool

    UDF1.RearARBLabel.Enabled = rearARBBool
    UDF1.RearARBDEC.Enabled = rearARBBool 
    UDF1.RearARBINC.Enabled = rearARBBool
    UDF1.RearARBValue.Enabled = rearARBBool

    UDF1.FrontCamber1.Enabled = rearCamberBool
    UDF1.RearCamberDEC.Enabled = rearCamberBool 
    UDF1.RearCamberINC.Enabled = rearCamberBool
    UDF1.RearCamberValue.Enabled = rearCamberBool

    UDF1.SteeringLockLabel.Enabled = steeringLockBool
    UDF1.SteeringLockDEC.Enabled = steeringLockBool 
    UDF1.SteeringLockINC.Enabled = steeringLockBool
    UDF1.SteeringLockValue.Enabled = steeringLockBool

    UDF1.AeroPackageLabel.Enabled = apBool
    UDF1.APDEC.Enabled = apBool 
    UDF1.APINC.Enabled = apBool
    UDF1.AeroPackageValue.Enabled = apBool

    UDF1.FrontWingLabel.Enabled = fwBool
    UDF1.ARBForceDEC1.Enabled = fwBool 
    UDF1.ARBForceINC1.Enabled = fwBool
    UDF1.FrontWingValue.Enabled = fwBool

    UDF1.RearWingLabel1.Enabled = rwBool
    UDF1.ARBForceDEC2.Enabled = rwBool 
    UDF1.ARBForceINC2.Enabled = rwBool
    UDF1.RearWingValue.Enabled = rwBool

    UDF1.BumpLabel1.Enabled = bbBool
    UDF1.BrakeBiasDEC.Enabled = bbBool 
    UDF1.BrakeBiasINC.Enabled = bbBool
    UDF1.BrakeBiasValue.Enabled = bbBool

    UDF1.BrakeSizeLabel.Enabled = brakeDuctBool
    UDF1.BrakeSizeDEC.Enabled = brakeDuctBool 
    UDF1.BrakeSizeINC.Enabled = brakeDuctBool
    UDF1.BrakeSizeValue.Enabled = brakeDuctBool

    UDF1.GearsLabel.Enabled = gearsBool
    UDF1.GearsDEC.Enabled = gearsBool 
    UDF1.GearsINC.Enabled = gearsBool
    UDF1.GearsValue.Enabled = gearsBool

    UDF1.gt3Value.Enabled = gt3bool
    UDF1.gt3Label.Enabled = gt3bool
    UDF1.gt3DEC.Enabled = gt3bool
    UDF1.gt3INC.Enabled = gt3bool

    UDF1.gtevalue.Enabled = gtebool
    UDF1.gtelabel.Enabled = gtebool
    UDF1.gtedec.Enabled = gtebool
    UDF1.gteinc.Enabled = gtebool

    UDF1.hsvalue.Enabled = hsbool
    UDF1.hslabel.Enabled = hsbool
    UDF1.hsdec.Enabled = hsbool
    UDF1.hsinc.Enabled = hsbool
  
    UDF1.F1Label.Enabled = f1bool
    UDF1.F1DEC.Enabled = f1bool
    UDF1.F1INC.Enabled = f1bool
    UDF1.F1Value.Enabled = f1bool

    UDF1.NascarLabel.Enabled = nascarbool
    UDF1.NDEC.Enabled = nascarbool
    UDF1.NINC.Enabled = nascarbool
    UDF1.Nascarvalue.Enabled = nascarbool

    UDF1.DriftLabel.Enabled = driftbool
    UDF1.DDEC.Enabled = driftbool
    UDF1.DINC.Enabled = driftbool
    UDF1.Driftvalue.Enabled = driftbool
  end

  function GetDefaults()
    GetAdr()
    GetVal()
    SetCurrent()
    SetDeltaDefault()
    FirstCar = false
  end

  function GetAdr()
    MassADR = getAddress("[[[PTR+8]+D10]+960]+C")
    DragADR = getAddress("[[[PTR+8]+D10]+960]+10")
    WeightDistADR = getAddress("[[[PTR+8]+D10]+960]+24")
    FWDADR = getAddress("[[[PTR+8]+D10]+960]+48")
    RWDADR = getAddress("[[[PTR+8]+D10]+960]+4C")
    GearsADR = getAddress("[[[PTR+8]+D10]+960]+50")
    DriveInertiaADR = getAddress("[[[PTR+8]+D10]+960]+54")
    UpShiftADR = getAddress("[[[PTR+8]+D10]+960]+58")
    DownShiftADR = getAddress("[[[PTR+8]+D10]+960]+5C")
    InitialDriveForceADR = getAddress("[[[PTR+8]+D10]+960]+60")
    MaxFlatVelADR = getAddress("[[[PTR+8]+D10]+960]+64")
    InitialMaxFlatVelADR = getAddress("[[[PTR+8]+D10]+960]+68")
    BrakeForceADR = getAddress("[[[PTR+8]+D10]+960]+6C")
    BrakeBiasFrontADR = getAddress("[[[PTR+8]+D10]+960]+74")
    BrakeBiasRearADR = getAddress("[[[PTR+8]+D10]+960]+78")
    HandbrakeADR = getAddress("[[[PTR+8]+D10]+960]+7C")
    SteeringLockADR = getAddress("[[[PTR+8]+D10]+960]+80")
    SteeringLockRatioADR = getAddress("[[[PTR+8]+D10]+960]+84")
    CurveMaxADR = getAddress("[[[PTR+8]+D10]+960]+88")
    CurveMaxRatioADR = getAddress("[[[PTR+8]+D10]+960]+8C")
    CurveMinADR = getAddress("[[[PTR+8]+D10]+960]+90")
    CurveMinRatioADR = getAddress("[[[PTR+8]+D10]+960]+94")
    CurveLateralADR = getAddress("[[[PTR+8]+D10]+960]+98")
    CurveLateralRatioADR = getAddress("[[[PTR+8]+D10]+960]+9C")
    SpringDeltaADR = getAddress("[[[PTR+8]+D10]+960]+A0")
    SpringDeltaRatioADR = getAddress("[[[PTR+8]+D10]+960]+A4")
    LowSpeedTractionADR = getAddress("[[[PTR+8]+D10]+960]+A8")
    FrontGripADR = getAddress("[[[PTR+8]+D10]+960]+B0")
    RearGripADR = getAddress("[[[PTR+8]+D10]+960]+B4")
    TractionLossMultADR = getAddress("[[[PTR+8]+D10]+960]+B8")
    SuspensionForceADR = getAddress("[[[PTR+8]+D10]+960]+BC")
    SuspensionBumpADR = getAddress("[[[PTR+8]+D10]+960]+C0")
    SuspensionReboundADR = getAddress("[[[PTR+8]+D10]+960]+C4")
    SuspensionRaiseADR = getAddress("[[[PTR+8]+D10]+960]+D0")
    SuspensionTravelADR = getAddress("[[[PTR+8]+D10]+960]+CC")
    FrontSpringADR = getAddress("[[[PTR+8]+D10]+960]+D4")
    RearSpringADR = getAddress("[[[PTR+8]+D10]+960]+D8")
    ARBForceADR = getAddress("[[[PTR+8]+D10]+960]+DC")
    FrontARBADR = getAddress("[[[PTR+8]+D10]+960]+E0")
    RearARBADR = getAddress("[[[PTR+8]+D10]+960]+E4")
    CollisionMultADR = getAddress("[[[PTR+8]+D10]+960]+F0")
    EngineMultADR = getAddress("[[[PTR+8]+D10]+960]+FC")
    --PetrolADR = getAddress("[[[PTR+8]+D10]+960]+100")
    ToeFrontADR = getAddress("[[[PTR+8]+D10]+960]+344")
    ToeRearADR = getAddress("[[[PTR+8]+D10]+960]+348")
    CamberFrontADR = getAddress("[[[PTR+8]+D10]+960]+34C")
    CamberRearADR = getAddress("[[[PTR+8]+D10]+960]+350")
    ModelFlagADR = getAddress("[[[PTR+8]+D10]+960]+124")
    HandlingFlagADR = getAddress("[[[PTR+8]+D10]+960]+128")
    AdvancedADR = getAddress("[[[PTR+8]+D10]+960]+36C")
    CastorADR = getAddress("[[[PTR+8]+D10]+960]+354")
    DownForceMultADR = getAddress("[[[PTR+8]+D10]+960]+14")
    VehHealthADR = getAddress("[[PTR+8]+D10]+844")
    EngineHealthADR = getAddress("[[PTR+8]+D10]+908")
    BodyHealthADR = getAddress("[[PTR+8]+D10]+844")
    CarNameADR = getAddress("[[[PTR+8]+D10]+20]+298")
    HeadlightADR = getAddress("[[PTR+8]+D10]+9F4") --15
    XenonADR = getAddress("[[[PTR+8]+D10]+48]+3E1") --1
    XenonColorADR = getAddress("[[[PTR+8]+D10]+48]+406") --2 Proto 5 GT
    RoloFrontADR = getAddress("[[[PTR+8]+D10]+960]+E8")
    RoloRearADR = getAddress("[[[PTR+8]+D10]+960]+EC")
  end

  function GetVal()
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
    HandbrakeDefault = readFloat(HandbrakeADR)
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
    HandbrakeCurrent = HandbrakeDefault
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
    writeFloat(HandbrakeADR,HandbrakeCurrent)
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
      elseif F1array[CarNameCurrent]  then
          UDF1.F1Value.Enabled = false
          UDF1.F1Label.Enabled = false
          UDF1.F1DEC.Enabled = false
          UDF1.F1INC.Enabled = false
      elseif NASCARarray[CarNameCurrent]  then
          UDF1.Nascarvalue.Enabled = false
          UDF1.NascarLabel.Enabled = false
          UDF1.NDEC.Enabled = false
          UDF1.NINC.Enabled = false
      elseif DRIFTarray[CarNameCurrent]  then
          UDF1.Driftvalue.Enabled = false
          UDF1.DriftLabel.Enabled = false
          UDF1.DDEC.Enabled = false
          UDF1.DINC.Enabled = false
      end
    if MassCurrent~=MassDefault then writeFloat(MassADR,MassDefault) end
    if DragCurrent~=DragDefault then writeFloat(DragADR,DragDefault) end
    if WeightDistCurrent~=WeightDistDefault then writeFloat(WeightDistADR,WeightDistDefault) end
    if readFloat(FWDADR)~= FWDDefault or FWDCurrent~=FWDDefault then writeFloat(FWDADR,FWDDefault) end
    if readFloat(RWDADR)~= RWDDefault or RWDCurrent~=RWDDefault then writeFloat(RWDADR,RWDDefault) end
    if DriveInertiaCurrent~=DriveInertiaDefault then writeFloat(DriveInertiaADR,DriveInertiaDefault) end
    if readFloat(UpShiftADR)~= UpShiftDefault or UpShiftCurrent~=UpShiftDefault then writeFloat(UpShiftADR,UpShiftDefault) end
    if readFloat(DownShiftADR)~= DownShiftDefault or DownShiftCurrent~=DownShiftDefault then writeFloat(DownShiftADR,DownShiftDefault) end
    if InitialDriveForceCurrent~=InitialDriveForceDefault then writeFloat(InitialDriveForceADR,InitialDriveForceDefault) end
    if MaxFlatVelCurrent~=MaxFlatVelDefault then writeFloat(MaxFlatVelADR,MaxFlatVelDefault) end
    if InitialMaxFlatVelCurrent~=InitialMaxFlatVelDefault then writeFloat(InitialMaxFlatVelADR,InitialMaxFlatVelDefault) end
    if readFloat(BrakeForceADR)~=BrakeForceDefault or BrakeForceCurrent~=BrakeForceDefault then writeFloat(BrakeForceADR,BrakeForceDefault) end
    if BrakeBiasFrontCurrent~=BrakeBiasFrontDefault then writeFloat(BrakeBiasFrontADR,BrakeBiasFrontDefault) end
    if BrakeBiasRearCurrent~=BrakeBiasRearDefault then writeFloat(BrakeBiasRearADR,BrakeBiasRearDefault) end
    if HandbrakeCurrent~=HandbrakeDefault then writeFloat(HandbrakeADR,HandbrakeDefault) end
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
    ChangedSetup = true
    end
  end

  function ForceDefault()
    if CarNameADR ~= getAddress("[[[PTR+8]+D10]+20]+298") then
      GetAdr()
      BackToDefault()
    else
      BackToDefault()
    end
  end

  function BackToDefault()
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
      UDF1.F1Value.Caption = 'ON'
    elseif NASCARmodeDELTA==2 and NASCARarray[CarNameCurrent] then
      SendValues()
      DisplayInfo()
      MakeItNASCAR()
      NASCARmodeDELTA = 2
      UDF1.NascarValue.Caption = 'ON'
    elseif DRIFTmodeDELTA==2 and DRIFTarray[CarNameCurrent] then
      SendValues()
      DisplayInfo()
      MakeItDRIFT()
      DRIFTmodeDELTA = 2
      UDF1.Driftvalue.Caption = 'ON'
    end
    ChangedSetup = true
  end

  function SpecialModeInit()
   SendPack("Special Mode Initialization",0,1)
   if CarNameADR ~= getAddress("[[[PTR+8]+D10]+20]+298") then
      GetAdr()
   end
   SetCurrent()
   SetDeltaDefault()
   SendValues()
   DisplayInfo()
  end

  function SetDeltaDefault()
    SuspensionForceDELTA = 9 --1/9 1/18
    ARBForceDELTA = 7 --1/7 1/14
    SuspensionRaiseDELTA = 3 --1/9 1/18
    SuspensionBumpDELTA = 19 --1/19 1/38
    SuspensionDumpDELTA = 19 --1/19 1/38
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
    SteeringLockDELTA = 5 --1/9
    RearWingDELTA = 5 --1/9
    FrontWingDELTA = 5 --1/9
    AeroPackageDELTA = 3 --1/3
    CastorDELTA=9 --1/18
    GT3modeDELTA = 1
    GTEmodeDELTA = 1
    HSmodeDELTA = 1
    F1modeDELTA = 1
    NASCARmodeDELTA = 1
    DRIFTmodeDELTA = 1

    BrakeBiasDELTA = 8 --1/17
    BrakesSizeDELTA = 3
    HeadlightDELTA = 1
    XenonColorDELTA = 1
    TCDELTA = 5

    GearsDELTA = 1
    MixDELTA = 1
    BrakePressureDELTA = 100
    TPDELTA = 160 --140/180
    PreloadDELTA = 80 --0/160
    CarStatusDELTA = 1
    SpotterDELTA = 1
    EngRunDELTA=1
    HeadlightCurrent=readFloat("[[PTR+8]+D10]+A14")
    XenonCurrent=readBytes("[[[PTR+8]+D10]+48]+3E1")
    XenonColorCurrent=readBytes("[[[PTR+8]+D10]+48]+406")
    DFstate = 2
    SusState = 2
    UDF1.EasyDF3.Caption = 'HIGH'
    UDF1.EasyDF2.Caption = '-> STANDARD <-'
    UDF1.EasyDF1.Caption = 'LOW'
    UDF1.EasySus3.Caption = 'STIFF'
    UDF1.EasySus2.Caption = '-> STANDARD <-'
    UDF1.EasySus1.Caption = 'SOFT'
    UDF1.FrontWingLabel.Caption = 'FRONT FLAP:'
    UDF1.RearWingLabel1.Caption = 'REAR FLAP:'
    UDF1.BrakeSizeValue.Caption = 'Open'
    UDF1.BrakeSizeLabel.Caption = 'BRAKE DUCT:'
  end

  function DisplayInfo()
   UDF1.FrontWingValue.Caption = '5'
   UDF1.RearWingValue.Caption = '5'
   UDF1.GearsValue.Caption = 'Standard'
   UDF1.SteeringLockValue.Caption = SteeringLockDELTA
   UDF1.SuspensionForceValue.Caption = (SuspensionForceCurrent*100)//1
   UDF1.DumperValue.Caption = SuspensionDumpDELTA
   UDF1.SuspensionRaiseValue.Caption = (((SuspensionRaiseCurrent*1000)//1)/10)+9
   UDF1.FrontSpringValue.Caption = FrontSpringDELTA
   UDF1.RearSpringValue.Caption = RearSpringDELTA
   UDF1.FrontARBValue.Caption = FrontARBDELTA
   UDF1.RearARBValue.Caption = RearARBDELTA
   UDF1.FrontCamberValue.Caption = (((CamberFrontCurrent*55.5)*10)//1)/10
   UDF1.RearCamberValue.Caption = (((CamberRearCurrent*55.5)*10)//1)/10
   UDF1.CarNameLabel.Caption = CarNameCurrent
   UDF1.HeadlightValue.Caption = 'OFF'
   UDF1.XenonColorValue.Caption = 'Default'
   UDF1.BrakeSizeValue.Caption = 'Open'
   UDF1.AeroPackageValue.Caption = 'Standard'
   UDF1.BrakeBiasValue.Caption = ((((BrakeBiasFrontCurrent+0.001)*100/2)*100)//1)/100
   UDF1.SuspensionTravelValue.Caption=SuspensionTravelDELTA
   UDF1.gt3Value.Caption='OFF'
   UDF1.gtevalue.Caption='OFF'
   UDF1.hsvalue.Caption='OFF'
   UDF1.F1Value.Caption='OFF'
   UDF1.Nascarvalue.Caption='OFF'
   UDF1.Driftvalue.Caption='OFF'
   UDF1.MixValue.Caption = MixDELTA
   UDF1.CarNameLabel.Caption=CarNameCurrent
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
        SuspensionForceCurrent = SuspensionForceCurrent + susForceVAL
        UDF1.SuspensionForceValue.Caption = (SuspensionForceCurrent*100)//1
        SuspensionForceDELTA = SuspensionForceDELTA + 1
        WriteFloat(SuspensionForceADR,SuspensionForceCurrent)
        ChangedSetup=true
      end
    end

    function SuspensionForceDecrease()
      if SuspensionForceDELTA ~= 1 then
        SuspensionForceCurrent = SuspensionForceCurrent - susForceVAL
        UDF1.SuspensionForceValue.Caption = (SuspensionForceCurrent*100)//1
        SuspensionForceDELTA = SuspensionForceDELTA - 1
        WriteFloat(SuspensionForceADR,SuspensionForceCurrent)
        ChangedSetup=true
      end
    end

    --SUSPENSION RAISE
    function SuspensionRaiseIncrease()
      if SuspensionRaiseDELTA ~= 18 and not HSarray[CarNameCurrent] then
        SuspensionRaiseCurrent = SuspensionRaiseCurrent + susRaiseVAL
        UDF1.SuspensionRaiseValue.Caption = (((SuspensionRaiseCurrent*1000)//1)/10)+9
        SuspensionRaiseDELTA = SuspensionRaiseDELTA + 1
        WriteFloat(SuspensionRaiseADR,SuspensionRaiseCurrent)
        ChangedSetup=true
      end
    end

    function SuspensionRaiseDecrease()
      if SuspensionRaiseDELTA ~= 1 and not HSarray[CarNameCurrent] then
        SuspensionRaiseCurrent = SuspensionRaiseCurrent - susRaiseVAL
        UDF1.SuspensionRaiseValue.Caption = (((SuspensionRaiseCurrent*1000)//1)/10)+9
        SuspensionRaiseDELTA = SuspensionRaiseDELTA - 1
        WriteFloat(SuspensionRaiseADR,SuspensionRaiseCurrent)
        ChangedSetup=true
      end
    end

    --DUMP
    function SuspensionDumpIncrease()
      if SuspensionDumpDELTA ~= 38 and not HSarray[CarNameCurrent]  then
        SuspensionBumpCurrent = SuspensionBumpCurrent + susBumpVAL
        SuspensionDumpDELTA = SuspensionDumpDELTA + 1
        SuspensionReboundCurrent = SuspensionReboundCurrent + susReboundVAL
        UDF1.DumperValue.Caption = SuspensionDumpDELTA
        WriteFloat(SuspensionBumpADR,SuspensionBumpCurrent)
        WriteFloat(SuspensionReboundADR,SuspensionReboundCurrent)
        ChangedSetup=true
      end
    end

    function SuspensionDumpDecrease()
      if SuspensionDumpDELTA ~= 1 and not HSarray[CarNameCurrent]  then
        SuspensionBumpCurrent = SuspensionBumpCurrent - susBumpVAL
        SuspensionDumpDELTA = SuspensionDumpDELTA - 1
        SuspensionReboundCurrent = SuspensionReboundCurrent - susReboundVAL
        UDF1.DumperValue.Caption = SuspensionDumpDELTA
        WriteFloat(SuspensionBumpADR,SuspensionBumpCurrent)
        WriteFloat(SuspensionReboundADR,SuspensionReboundCurrent)
        ChangedSetup=true
      end
    end

    --BUMP
    function SuspensionBumpIncrease()
      if SuspensionBumpDELTA ~= 38 and not HSarray[CarNameCurrent]  then
        SuspensionBumpCurrent = SuspensionBumpCurrent + susBumpVAL
        SuspensionBumpDELTA = SuspensionBumpDELTA + 1
        UDF1.BumperValue.Caption = SuspensionBumpDELTA
        WriteFloat(SuspensionBumpADR,SuspensionBumpCurrent)
        ChangedSetup=true
      end
    end

    function SuspensionBumpDecrease()
      if SuspensionBumpDELTA ~= 1 and not HSarray[CarNameCurrent]  then
        SuspensionBumpCurrent = SuspensionBumpCurrent - susBumpVAL
        SuspensionBumpDELTA = SuspensionBumpDELTA - 1
        UDF1.BumperValue.Caption = SuspensionBumpDELTA
        WriteFloat(SuspensionBumpADR,SuspensionBumpCurrent)
        ChangedSetup=true
      end
    end

    --TODO REBOUND

    --Travel
    function SuspensionTravelIncrease()
      if SuspensionTravelDELTA ~= 18 and not HSarray[CarNameCurrent] then
        SuspensionTravelCurrent = SuspensionTravelCurrent - susTravelVAL
        SuspensionTravelDELTA = SuspensionTravelDELTA + 1
        UDF1.SuspensionTravelValue.Caption=SuspensionTravelDELTA
        writeFloat(SuspensionTravelADR,SuspensionTravelCurrent)
        ChangedSetup=true
      end
    end

    function SuspensionTravelDecrease()
      if SuspensionTravelDELTA ~= 1 and not HSarray[CarNameCurrent] then
        SuspensionTravelCurrent = SuspensionTravelCurrent + susTravelVAL
        SuspensionTravelDELTA = SuspensionTravelDELTA - 1
        UDF1.SuspensionTravelValue.Caption=SuspensionTravelDELTA
        writeFloat(SuspensionTravelADR,SuspensionTravelCurrent)
        ChangedSetup=true
      end
    end

     --FrontSpring
    function FrontSpringIncrease()
      if FrontSpringDELTA ~= 18 and not HSarray[CarNameCurrent]  then
        FrontSpringCurrent = FrontSpringCurrent + susFrontSpringVAL
        FrontSpringDELTA = FrontSpringDELTA + 1
        UDF1.FrontSpringValue.Caption = FrontSpringDELTA
        writeFloat(FrontSpringADR,FrontSpringCurrent)
        ChangedSetup=true
      end
    end

    function FrontSpringDecrease()
      if FrontSpringDELTA ~= 1 and not HSarray[CarNameCurrent]  then
        FrontSpringCurrent = FrontSpringCurrent - susFrontSpringVAL
        FrontSpringDELTA = FrontSpringDELTA - 1
        UDF1.FrontSpringValue.Caption = FrontSpringDELTA
        writeFloat(FrontSpringADR,FrontSpringCurrent)
        ChangedSetup=true
      end
    end

     --FrontARB
    function FrontARBIncrease()
      if FrontARBDELTA ~= 18  then
        FrontARBCurrent = FrontARBCurrent + susFrontARBVAL
        RoloFrontCurrent = RoloFrontCurrent + susFrontRoloVAL
        FrontARBDELTA = FrontARBDELTA + 1
        UDF1.FrontARBValue.Caption = FrontARBDELTA
        writeFloat(FrontARBADR,FrontARBCurrent)
        writeFloat(RoloFrontADR,RoloFrontCurrent)
        ChangedSetup=true
      end
    end

    function FrontARBDecrease()
      if FrontARBDELTA ~= 1  then
        FrontARBCurrent = FrontARBCurrent - susFrontARBVAL
        RoloFrontCurrent = RoloFrontCurrent - susFrontRoloVAL
        FrontARBDELTA = FrontARBDELTA - 1
        UDF1.FrontARBValue.Caption = FrontARBDELTA
        writeFloat(FrontARBADR,FrontARBCurrent)
        writeFloat(RoloFrontADR,RoloFrontCurrent)
        ChangedSetup=true
      end
    end

     --CamberFront
    function CamberFrontIncrease()
      if CamberFrontDELTA ~= 50 and not HSarray[CarNameCurrent] then
        CamberFrontCurrent = CamberFrontCurrent + 0.002
        UDF1.FrontCamberValue.Caption = (((CamberFrontCurrent*55.5)*10)//1)/10
        CamberFrontDELTA = CamberFrontDELTA + 1
        writeFloat(CamberFrontADR,CamberFrontCurrent)
        ChangedSetup=true
      end
    end

    function CamberFrontDecrease()
      if CamberFrontDELTA ~= 1 and not HSarray[CarNameCurrent] then
        CamberFrontCurrent = CamberFrontCurrent - 0.002
        UDF1.FrontCamberValue.Caption = (((CamberFrontCurrent*55.5)*10)//1)/10
        CamberFrontDELTA = CamberFrontDELTA - 1
        writeFloat(CamberFrontADR,CamberFrontCurrent)
        ChangedSetup=true
      end
    end

     --RearSpring
    function RearSpringIncrease()
      if RearSpringDELTA ~= 18 and not HSarray[CarNameCurrent]  then
        RearSpringCurrent = RearSpringCurrent + susRearSpringVAL
        RearSpringDELTA = RearSpringDELTA + 1
        UDF1.RearSpringValue.Caption = RearSpringDELTA
        writeFloat(RearSpringADR,RearSpringCurrent)
        ChangedSetup=true
      end
    end

    function RearSpringDecrease()
      if RearSpringDELTA ~= 1 and not HSarray[CarNameCurrent]  then
        RearSpringCurrent = RearSpringCurrent - susRearSpringVAL
        RearSpringDELTA = RearSpringDELTA - 1
        UDF1.RearSpringValue.Caption = RearSpringDELTA
        writeFloat(RearSpringADR,RearSpringCurrent)
        ChangedSetup=true
      end
    end

    --RearARB
      function RearARBIncrease()
        if RearARBDELTA ~= 18  then
          RearARBCurrent = RearARBCurrent + susRearARBVAL
          RoloRearCurrent = RoloRearCurrent + susRearRoloVAL
          RearARBDELTA = RearARBDELTA + 1
          UDF1.RearARBValue.Caption = RearARBDELTA
          writeFloat(RearARBADR,RearARBCurrent)
          writeFloat(RoloRearADR,RoloRearCurrent)
          ChangedSetup=true
        end
      end

      function RearARBDecrease()
        if RearARBDELTA ~= 1  then
          RearARBCurrent = RearARBCurrent - susRearARBVAL
          RoloRearCurrent = RoloRearCurrent - susRearRoloVAL
          RearARBDELTA = RearARBDELTA - 1
          UDF1.RearARBValue.Caption = RearARBDELTA
          writeFloat(RearARBADR,RearARBCurrent)
          writeFloat(RoloRearADR,RoloRearCurrent)
          ChangedSetup=true
        end
      end
    --RearARB

    --CamberRear
      function CamberRearIncrease()
        if CamberRearDELTA ~= 50 and not HSarray[CarNameCurrent] then
          CamberRearCurrent = CamberRearCurrent + 0.002
          UDF1.RearCamberValue.Caption = (((CamberRearCurrent*55.5)*10)//1)/10
          CamberRearDELTA = CamberRearDELTA + 1
          writeFloat(CamberRearADR,CamberRearCurrent)
          ChangedSetup=true
        end
      end

      function CamberRearDecrease()
        if CamberRearDELTA ~= 1 and not HSarray[CarNameCurrent] then
          CamberRearCurrent = CamberRearCurrent - 0.002
          UDF1.RearCamberValue.Caption = (((CamberRearCurrent*55.5)*10)//1)/10
          CamberRearDELTA = CamberRearDELTA - 1
          writeFloat(CamberRearADR,CamberRearCurrent)
          ChangedSetup=true
        end
      end
    --CamberRear
  end

  --CHASSIS tab
    function LoadChassisSettings()
      --Steering Lock
        function SteeringLockIncrease()
          if SteeringLockDELTA ~= 9 and not HSarray[CarNameCurrent] then
            SteeringLockCurrent = SteeringLockCurrent + steeringLockVAL
            SteeringLockRatioCurrent = SteeringLockRatioCurrent + steeringLockRatioVAL
            SteeringLockDELTA = SteeringLockDELTA + 1
            UDF1.SteeringLockValue.Caption = SteeringLockDELTA
            writeFloat(SteeringLockADR,SteeringLockCurrent)
            writeFloat(SteeringLockRatioADR,SteeringLockRatioCurrent)
            ChangedSetup=true
          end
        end

        function SteeringLockDecrease()
          if SteeringLockDELTA ~= 1 and not HSarray[CarNameCurrent] then
            SteeringLockCurrent = SteeringLockCurrent - steeringLockVAL
            SteeringLockRatioCurrent = SteeringLockRatioCurrent - steeringLockRatioVAL
            SteeringLockDELTA = SteeringLockDELTA - 1
            UDF1.SteeringLockValue.Caption = SteeringLockDELTA
            writeFloat(SteeringLockADR,SteeringLockCurrent)
            writeFloat(SteeringLockRatioADR,SteeringLockRatioCurrent)
            ChangedSetup=true
          end
        end
      --Steering Lock

      --Rear Wing
        function RearWingIncrease()
          if RearWingDELTA ~= 9 then
            DragCurrent = DragCurrent + rearWingDragVAL
            RearGripCurrent = RearGripCurrent + rearWingGripVAL
            RearWingDELTA = RearWingDELTA + 1
            UDF1.RearWingValue.Caption = RearWingDELTA
            writeFloat(DragADR,DragCurrent)
            writeFloat(RearGripADR,RearGripCurrent)
            ChangedSetup=true
          end
        end

        function RearWingDecrease()
          if RearWingDELTA ~= 1 then
            DragCurrent = DragCurrent - rearWingDragVAL
            RearGripCurrent = RearGripCurrent - rearWingGripVAL
            RearWingDELTA = RearWingDELTA - 1
            UDF1.RearWingValue.Caption = RearWingDELTA
            writeFloat(DragADR,DragCurrent)
            writeFloat(RearGripADR,RearGripCurrent)
            ChangedSetup=true
          end
        end
      --Rear Wing

      --Front Wing
        function FrontWingIncrease()
          if FrontWingDELTA ~= 9 then
            DragCurrent = DragCurrent + frontWingDragVAL
            FrontGripCurrent = FrontGripCurrent + frontWingGripVAL
            FrontWingDELTA = FrontWingDELTA + 1
            UDF1.FrontWingValue.Caption = FrontWingDELTA
            writeFloat(DragADR,DragCurrent)
            writeFloat(FrontGripADR,FrontGripCurrent)
            ChangedSetup=true
          end
        end

        function FrontWingDecrease()
          if FrontWingDELTA ~= 1 then
            DragCurrent = DragCurrent - frontWingDragVAL
            FrontGripCurrent = FrontGripCurrent - frontWingGripVAL
            FrontWingDELTA = FrontWingDELTA - 1
            UDF1.FrontWingValue.Caption = FrontWingDELTA
            writeFloat(DragADR,DragCurrent)
            writeFloat(FrontGripADR,FrontGripCurrent)
            ChangedSetup=true
          end
        end
      --Front Wing

      --AeroPackage
        function AeroPackageIncrease()
          if AeroPackageDELTA ~= 3 and CarNameCurrent == 'OPENWHEEL1'  then
            DragCurrent = DragCurrent + aeroPackageDragVAL
            FrontGripCurrent = FrontGripCurrent + aeroPackageFrontGripVAL
            RearGripCurrent = RearGripCurrent + aeroPackageRearGripVAL
            MaxFlatVelCurrent = MaxFlatVelCurrent - aeroPackageMaxFlatVAL
            AeroPackageDELTA = AeroPackageDELTA + 1
            if AeroPackageDELTA==3 then
                UDF1.AeroPackageValue.Caption = 'Standard downforce'
            end
            if AeroPackageDELTA==2 then
                UDF1.AeroPackageValue.Caption = 'Medium downforce'
            end
            WriteFloat(MaxFlatVelADR,MaxFlatVelCurrent)
            WriteFloat(DragADR,DragCurrent)
            WriteFloat(RearGripADR,RearGripCurrent)
            WriteFloat(FrontGripADR,FrontGripCurrent)
            ChangedSetup=true
          end
        end

        function AeroPackageDecrease()
          if AeroPackageDELTA ~= 1 and CarNameCurrent == 'OPENWHEEL1'  then
            DragCurrent = DragCurrent - aeroPackageDragVAL
            FrontGripCurrent = FrontGripCurrent - aeroPackageFrontGripVAL
            RearGripCurrent = RearGripCurrent - aeroPackageRearGripVAL
            MaxFlatVelCurrent = MaxFlatVelCurrent + aeroPackageMaxFlatVAL
            AeroPackageDELTA = AeroPackageDELTA - 1
            if AeroPackageDELTA==1 then
                UDF1.AeroPackageValue.Caption = 'Low downforce'
            end
            if AeroPackageDELTA==2 then
                UDF1.AeroPackageValue.Caption = 'Medium downforce'
            end
            WriteFloat(MaxFlatVelADR,MaxFlatVelCurrent)
            WriteFloat(DragADR,DragCurrent)
            WriteFloat(RearGripADR,RearGripCurrent)
            WriteFloat(FrontGripADR,FrontGripCurrent)
            ChangedSetup=true
          end
        end
      --AeroPackage
      
      --Custom classes
        function TurnGT3ModeOn()
        if GT3modeDELTA ~=2 then
              MakeItGT3()
              GT3modeDELTA = 2
              UDF1.gt3Value.Caption = 'ON'
              UDF1.ClassValue.Caption = "GT3"
              UDF1.ClassValue.Font.Color = 14389050
              SendPack("GT3 mode ON",0,1)
              ChangedSetup=true
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
            ChangedSetup=true
        end
        end

        function TurnGTEModeOn()
        if GTEmodeDELTA ~=2 then
              MakeItGTE()
              GTEmodeDELTA = 2
              UDF1.gtevalue.Caption = 'ON'
              UDF1.ClassValue.Caption = "GTE"
              UDF1.ClassValue.Font.Color = 47160
              SendPack("GTE mode ON",0,1)
              ChangedSetup=true
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
            ChangedSetup=true
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
              ChangedSetup=true
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
            ChangedSetup=true
        end
        end

        function TurnHSModeOn()
          if HSmodeDELTA ~= 2 then
            MakeItHS()
            HSmodeDELTA = 2
            UDF1.hsvalue.Caption = 'ON'
            UDF1.ClassValue.Caption = "HS"
            UDF1.ClassValue.Font.Color = 219
            SendPack("HS mode ON",0,1)
            ChangedSetup=true
          end
        end

        function TurnHSModeOff()
          if HSmodeDELTA ~= 1 then
            MakeItDefaultHS()
            HSmodeDELTA = 1
            UDF1.hsvalue.Caption = 'OFF'
            UDF1.ClassValue.Caption = "-"
            UDF1.ClassValue.Font.Color = clDefault
            SendPack("HS mode OFF",0,1)
            ChangedSetup=true
          end
        end

        function TurnNascarModeOn()
        if NASCARmodeDELTA ~= 2 then
              MakeItNASCAR()
              NascarmodeDELTA = 2
              UDF1.Nascarvalue.Caption = 'ON'
              UDF1.ClassValue.Caption = "NASCAR"
              UDF1.ClassValue.Font.Color = 15892238
              SendPack("Nascar mode ON",0,1)
        end
        end

        function TurnNascarModeOff()
        if NASCARmodeDELTA ~= 1 then
            MakeItDefaultNASCAR()
            NASCARmodeDELTA = 1
            UDF1.Nascarvalue.Caption = 'OFF'
            UDF1.ClassValue.Caption = "-"
            UDF1.ClassValue.Font.Color = clDefault
            SendPack("Nascar mode OFF",0,1)
        end
        end

        function TurnDriftModeOn()
        if DRIFTmodeDELTA ~= 2 then
          DRIFTmodeDELTA = 2
          MakeItDRIFT()
          UDF1.Driftvalue.Caption = 'ON'
          UDF1.ClassValue.Caption = "DRIFT"
          UDF1.ClassValue.Font.Color = 7502699
          sleep(100)
          SendPack("Drift mode ON",0,1)
          ChangedSetup=true
        end
        end

        function TurnDriftModeOff()
        if DRIFTmodeDELTA ~= 1 then
          DRIFTmodeDELTA = 1
          MakeItDefaultDRIFT()
          UDF1.Driftvalue.Caption = 'OFF'
          UDF1.ClassValue.Caption = "-"
          UDF1.ClassValue.Font.Color = clDefault
          sleep(100)
          SendPack("Drift mode OFF",0,1)
          ChangedSetup=true
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
              --WriteFloat(UpShiftADR,UpShiftCurrent)
            end
            if DownShift~=0 then
              DownShiftCurrent=DownShiftCurrent + DownShift
              --WriteFloat(DownShiftADR,DownShiftCurrent)
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
              --WriteFloat(UpShiftADR,UpShiftCurrent)
            end
            if DownShift~=0 then
              DownShiftCurrent=DownShiftCurrent + DownShift
              --WriteFloat(DownShiftADR,DownShiftCurrent)
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
              --WriteFloat(UpShiftADR,UpShiftCurrent)
            end
            if DownShift~=0 then
              DownShiftCurrent=DownShiftCurrent + DownShift
              --WriteFloat(DownShiftADR,DownShiftCurrent)
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

        function ApplyF1Mod(IntoF1,Mass,Drag,UpShift,DownShift,Drive,MaxFlat,InitMaxFlat,Brake,CurveMax,CurveMaxR,CurveMin,CurveMinR,CurveLat,CurveLatR,Front,Rear,Force,Bump,Travel,SuspensionLift,FS,RS,ARB,Rolo,DF,Steering)
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
              CurveLatR=CurveLatR*(-1)
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
              Steering=Steering*(-1)
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
            if Steering~=0 then
              SteeringLockRatioCurrent=SteeringLockRatioCurrent + Steering
              WriteFloat(SteeringLockRatioADR,SteeringLockRatioCurrent)
          end
        end

        function ApplyNASCARMod(IntoNASCAR,Drive,MaxFlat,Brake,CurveMax,CurveMin,Front,Rear)
            if IntoNASCAR==false then
              Drive=Drive*(-1)
              MaxFlat=MaxFlat*(-1)
              Brake=Brake*(-1)
              CurveMax=CurveMax*(-1)
              CurveMin=CurveMin*(-1)
              Front=Front*(-1)
              Rear=Rear*(-1)
            end
            if Drive~=0 then
              InitialDriveForceCurrent=InitialDriveForceCurrent + Drive
              WriteFloat(InitialDriveForceADR,InitialDriveForceCurrent)
            end
            if MaxFlat~=0 then
              MaxFlatVelCurrent=MaxFlatVelCurrent + MaxFlat
              WriteFloat(MaxFlatVelADR,MaxFlatVelCurrent)
            end
            if Brake~=0 then
              BrakeForceCurrent=BrakeForceCurrent + Brake
              WriteFloat(BrakeForceADR,BrakeForceCurrent)
            end
            if CurveMax~=0 then
              CurveMaxCurrent=CurveMaxCurrent + CurveMax
              WriteFloat(CurveMaxADR,CurveMaxCurrent)
            end
            if CurveMin~=0 then
              CurveMinCurrent=CurveMinCurrent + CurveMin
              WriteFloat(CurveMinADR,CurveMinCurrent)
            end
            if Rear~=0 then
              RearGripCurrent=RearGripCurrent + Rear
              WriteFloat(RearGripADR,RearGripCurrent)
            end
            if Front~=0 then
              FrontGripCurrent=FrontGripCurrent + Front
              WriteFloat(FrontGripADR,FrontGripCurrent)
            end
        end

        function ApplyDRIFTMod(IntoDRIFT,FWD,RWD,Drive,MaxFlat,CurveMax,CurveMin,CurveLat,Steering,CurveLatR,LowSpeed,Mass,Handbrake,UpShift)
            if IntoDRIFT==false then
              FWD=FWD*(-1)
              RWD=RWD*(-1)
              Drive=Drive*(-1)
              MaxFlat=MaxFlat*(-1)
              CurveMax=CurveMax*(-1)
              CurveMin=CurveMin*(-1)
              CurveLat=CurveLat*(-1)
              Steering=Steering*(-1)
              CurveLatR=CurveLatR*(-1)
              LowSpeed=LowSpeed*(-1)
              Mass=Mass*(-1)
              Handbrake = Handbrake*(-1)
              UpShift = UpShift*(-1)
            end
            if FWD~=0 then
              FWDCurrent=0
              WriteFloat(FWDADR,FWDCurrent)
            end
            if RWD~= 0 then
              RWDCurrent=1
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
            if CurveMax~=0 then
              CurveMaxCurrent=CurveMaxCurrent + CurveMax
              WriteFloat(CurveMaxADR,CurveMaxCurrent)
            end
            if CurveMin~=0 then
              CurveMinCurrent=CurveMinCurrent + CurveMin
              WriteFloat(CurveMinADR,CurveMinCurrent)
            end
            if CurveLat~=0 then
              CurveLateralCurrent=CurveLateralCurrent + CurveLat
              WriteFloat(CurveLateralADR,CurveLateralCurrent)
            end
            if Steering~=0 then
              SteeringLockCurrent=SteeringLockCurrent + Steering
              WriteFloat(SteeringLockADR,SteeringLockCurrent)
            end
            if CurveLatR~=0 then
              CurveLateralRatioCurrent=CurveLateralRatioCurrent + CurveLatR 
              WriteFloat(CurveLateralRatioADR,CurveLateralRatioCurrent)
            end
            if LowSpeed~=0 then
              LowSpeedTractionCurrent=0
              --LowSpeedTractionCurrent=LowSpeedTractionCurrent + LowSpeed 
              WriteFloat(LowSpeedTractionADR,LowSpeedTractionCurrent)
            end
            if Mass~=0 then
              MassCurrent=MassCurrent + Mass
              WriteFloat(MassADR,MassCurrent)
            end
            if Handbrake~=0 then
              HandbrakeCurrent=HandbrakeCurrent + Handbrake
              WriteFloat(HandbrakeADR,HandbrakeCurrent)
            end
            if UpShift~=0 then
              UpShiftCurrent=UpShiftCurrent + UpShift
            end
        end

        function MakeItGT3()
          GT3=true
          load(GT3BOP)()
        end

        function MakeItDefaultGT()
          GT3=false
          load(GT3BOP)()
        end

        function MakeItGTE()
        GTE=true
        load(GTEBOP)()
        end

        function MakeItDefaultGTE()
        GTE=false
        load(GTEBOP)()
        end

        function MakeItHS()
        HS=true
        load(HSBOP)()
        end

        function MakeItDefaultHS()
        HS=false
        load(HSBOP)()
        end

        function MakeItF1()
        F1=true
        load(F1BOP)()
        end

        function MakeItDefaultF1()
        F1=false
        load(F1BOP)()
        end

        function MakeItNASCAR()
        NASCAR=true
        load(NASCARBOP)()
        end

        function MakeItDefaultNASCAR()
        NASCAR=false
        load(NASCARBOP)()
        end

        function MakeItDRIFT()
        DRIFT=true
        load(DRIFTBOP)()
        end

        function MakeItDefaultDRIFT()
        DRIFT=false
        load(DRIFTBOP)()
        end
      --Custom classes
    end
  --CHASSIS tab

  --ADVANCED  tab
    function LoadAdvancedSettings()
      --BrakesSize
      function BrakesSizeIncrease()
      if BrakesSizeDELTA ~= 3 and CarNameCurrent ~= 'OPENWHEEL1' and not HSarray[CarNameCurrent]  then
        BrakeForceCurrent = BrakeForceCurrent - brakeSizeBrakeForceVAL
        DragCurrent = DragCurrent + brakeSizeDragVAL
        BrakesSizeDELTA = BrakesSizeDELTA + 1
        if BrakesSizeDELTA == 3 then
            UDF1.BrakeSizeValue.Caption = 'Open'
        end
        if BrakesSizeDELTA == 2 then
            UDF1.BrakeSizeValue.Caption = 'Closed 70%'
        end
        writeFloat(DragADR,DragCurrent)
        writeFloat(BrakeForceADR,BrakeForceCurrent)
        ChangedSetup=true
      end
      end

      function BrakesSizeDecrease()
      if BrakesSizeDELTA ~= 1 and CarNameCurrent ~= 'OPENWHEEL1' and not HSarray[CarNameCurrent]  then
        BrakeForceCurrent = BrakeForceCurrent - brakeSizeBrakeForceVAL
        DragCurrent = DragCurrent - brakeSizeDragVAL
        BrakesSizeDELTA = BrakesSizeDELTA - 1
        if BrakesSizeDELTA == 2 then
            UDF1.BrakeSizeValue.Caption = 'Closed 35%'
        end
        if BrakesSizeDELTA == 1 then
            UDF1.BrakeSizeValue.Caption = 'Closed 70%'
        end
        writeFloat(DragADR,DragCurrent)
        writeFloat(BrakeForceADR,BrakeForceCurrent)
        ChangedSetup=true
      end
      end

      --BrakeBias
      function BrakeBiasIncrease()
      if BrakeBiasDELTA ~= 17 then
        BrakeBiasFrontCurrent = BrakeBiasFrontCurrent + bbfrontVAL
        BrakeBiasRearCurrent = BrakeBiasRearCurrent - bbrearVAL
        UDF1.BrakeBiasValue.Caption = ((((BrakeBiasFrontCurrent+0.001)*100/2)*100)//1)/100
        BrakeBiasDELTA = BrakeBiasDELTA + 1
        writeFloat(BrakeBiasFrontADR,BrakeBiasFrontCurrent)
        writeFloat(BrakeBiasRearADR,BrakeBiasRearCurrent)
        ChangedSetup=true
      end
      end

      function BrakeBiasDecrease()
      if BrakeBiasDELTA ~= 1 then
        BrakeBiasRearCurrent = BrakeBiasRearCurrent + bbfrontVAL
        BrakeBiasFrontCurrent = BrakeBiasFrontCurrent - bbrearVAL
        UDF1.BrakeBiasValue.Caption = ((((BrakeBiasFrontCurrent+0.001)*100/2)*100)//1)/100
        BrakeBiasDELTA = BrakeBiasDELTA - 1
        writeFloat(BrakeBiasFrontADR,BrakeBiasFrontCurrent)
        writeFloat(BrakeBiasRearADR,BrakeBiasRearCurrent)
        ChangedSetup=true
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
            UDF1.XenonColorValue.Caption = 'Xenon'
        end
        if XenonColorDELTA == 2 then
            XenonCurrent = 1
            XenonColorCurrent = 6
            UDF1.XenonColorValue.Caption = 'GT'
        end
        if XenonColorDELTA == 3 then
            XenonCurrent = 1
            XenonColorCurrent = 2
            UDF1.XenonColorValue.Caption = 'HS'
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
            UDF1.XenonColorValue.Caption = 'Default'
        end
        if XenonColorDELTA == 3 then
            XenonCurrent = 1
            XenonColorCurrent = -1
            UDF1.XenonColorValue.Caption = 'Xenon'
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
      HeadlightADR = getAddress("[[PTR+8]+D10]+9F4") --15
      XenonADR = getAddress("[[[PTR+8]+D10]+48]+3E1") --1
      XenonColorADR = getAddress("[[[PTR+8]+D10]+48]+406") --2 Proto 6 GT
      writeFloat(HeadlightADR,HeadlightCurrent)
      writeBytes(XenonADR,XenonCurrent)
      writeBytes(XenonColorADR,XenonColorCurrent)
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
  --ADVANCED  tab

  --Drivetrain tab
    function LoadEngineSettings()
      --Gears

      function GearsIncrease()
      if GearsDELTA ~= 3 and CarNameCurrent ~= 'OPENWHEEL1' then
        DriveInertiaCurrent = DriveInertiaCurrent - gearsInertiaVAL
        --UpShiftCurrent = UpShiftCurrent + 5.6
        --DownShiftCurrent = DownShiftCurrent + 5.6
        MaxFlatVelCurrent = MaxFlatVelCurrent + gearsMaxFlatVAL
        InitialMaxFlatVelCurrent = InitialMaxFlatVelCurrent + gearsInitMaxFlatVAL
        GearsDELTA = GearsDELTA + 1
        if GearsDELTA==2 then
          UDF1.GearsValue.Caption = 'Stock'
        end
        if GearsDELTA==3 then
          UDF1.GearsValue.Caption = 'Long'
        end
        WriteFloat(DriveInertiaADR,DriveInertiaCurrent)
        --WriteFloat(UpShiftADR,UpShiftCurrent)
        --WriteFloat(DownShiftADR,DownShiftCurrent)
        WriteFloat(MaxFlatVelADR,MaxFlatVelCurrent)
        WriteFloat(InitialMaxFlatVelADR,InitialMaxFlatVelCurrent)
        ChangedSetup=true
      end
      end

      function GearsDecrease()
        if GearsDELTA ~= 1 and CarNameCurrent ~= 'OPENWHEEL1' then
          DriveInertiaCurrent = DriveInertiaCurrent + gearsInertiaVAL
          --UpShiftCurrent = UpShiftCurrent - 5.6
          --DownShiftCurrent = DownShiftCurrent - 5.6
          MaxFlatVelCurrent = MaxFlatVelCurrent - gearsMaxFlatVAL
          InitialMaxFlatVelCurrent = InitialMaxFlatVelCurrent - gearsInitMaxFlatVAL
        GearsDELTA = GearsDELTA - 1
        if GearsDELTA == 1 then
          UDF1.GearsValue.Caption = 'Short'
        end
        if GearsDELTA == 2 then
          UDF1.GearsValue.Caption = 'Stock'
        end
        WriteFloat(DriveInertiaADR,DriveInertiaCurrent)
        --WriteFloat(UpShiftADR,UpShiftCurrent)
        --WriteFloat(DownShiftADR,DownShiftCurrent)
        WriteFloat(MaxFlatVelADR,MaxFlatVelCurrent)
        WriteFloat(InitialMaxFlatVelADR,InitialMaxFlatVelCurrent)
        ChangedSetup=true
      end
      end

      function SetFuel()
        if FuelSystemEnabled==true then
          local level = inputQuery('SET FUEL LEVEL | FUEL TANK CAPACITY = '..CurrentCarMaxFuel,'','')
          if level ~= nil then
            level = tonumber(level)
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
        end
      end

      UDF1.FuelValue.onClick = SetFuel

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
          MixCurrent = MixCurrent + mixMixtureVAL
          MixDELTA = MixDELTA + 1
          RWDCurrent = RWDCurrent + mixRWDVAL
          if InThePit == false then 
            RWDSetted = RWDCurrent
            writeFloat(RWDADR,RWDSetted)
          else writeFloat(RWDADR,RWDCurrent)
          end
          speak(MixDELTA)
          UDF1.MixValue.Caption = MixDELTA
          UDF1.MixValueDisp.Caption = MixDELTA
        end
      end
      end

      function MixDecrease()
      if FuelSystemEnabled==true then
        if MixDELTA ~= 1 and EngRunDELTA ~= 0 then
          MixCurrent = MixCurrent - mixMixtureVAL
          MixDELTA = MixDELTA - 1
          RWDCurrent = RWDCurrent - mixRWDVAL
          if InThePit == false then 
            RWDSetted = RWDCurrent
            writeFloat(RWDADR,RWDSetted)
          else writeFloat(RWDADR,RWDCurrent)
          end
          speak(MixDELTA)
          UDF1.MixValue.Caption = MixDELTA
          UDF1.MixValueDisp.Caption = MixDELTA
        end
      end
      end
    end
  --Drivetrain tab

  --EASY EASY EASY
    function LoadEasySettings()
      --DF presets
        function DFpreset3()
        if DFstate ~= 3  then
            UDF1.EasyDF3.Caption = '-> HIGH <-'
            UDF1.EasyDF2.Caption = 'STANDARD'
            UDF1.EasyDF1.Caption = 'LOW'
            local FWTarget = 8
            local RWTarget = 8
            local AeroPackageTarget = 2
            
            local current
            if (AeroPackageDELTA < AeroPackageTarget) then AeroPackageIncrease() end

            if (FrontWingDELTA < FWTarget) then
              current = FrontWingDELTA
              for i = 0, (FWTarget - current)-1, 1 do
                FrontWingIncrease()
              end
            else
              current = FrontWingDELTA
              for i = 0, (current - FWTarget)-1, 1 do
                FrontWingDecrease()
              end
            end

            if (RearWingDELTA < RWTarget) then
              current = RearWingDELTA
              for i = 0, (RWTarget - current)-1, 1 do
                RearWingIncrease()
              end
            else
              current = RearWingDELTA
              for i = 0, (current - RWTarget)-1, 1 do
                RearWingDecrease()
              end
            end

            DFstate = 3
            ChangedSetup=true
        end
        end

        function DFpreset2()
          if DFstate ~= 2  then
            UDF1.EasyDF3.Caption = 'HIGH'
            UDF1.EasyDF2.Caption = '-> STANDARD <-'
            UDF1.EasyDF1.Caption = 'LOW'
            local FWTarget = 5
            local RWTarget = 5
            local AeroPackageTarget = 2
            
            local current
            if (AeroPackageDELTA < AeroPackageTarget) then AeroPackageIncrease() end

            if (FrontWingDELTA < FWTarget) then
              current = FrontWingDELTA
              for i = 0, (FWTarget - current)-1, 1 do
                FrontWingIncrease()
              end
            else
              current = FrontWingDELTA
              for i = 0, (current - FWTarget)-1, 1 do
                FrontWingDecrease()
              end
            end

            if (RearWingDELTA < RWTarget) then
              current = RearWingDELTA
              for i = 0, (RWTarget - current)-1, 1 do
                RearWingIncrease()
              end
            else
              current = RearWingDELTA
              for i = 0, (current - RWTarget)-1, 1 do
                RearWingDecrease()
              end
            end

            DFstate = 2
            ChangedSetup=true
          end
        end

        function DFpreset1()
          if DFstate ~= 1  then
            UDF1.EasyDF3.Caption = 'HIGH'
            UDF1.EasyDF2.Caption = 'STANDARD'
            UDF1.EasyDF1.Caption = '-> LOW <-'
            local FWTarget = 4
            local RWTarget = 6
            local AeroPackageTarget = 1
            
            local current
            if (AeroPackageDELTA > AeroPackageTarget) then AeroPackageDecrease() end

            if (FrontWingDELTA < FWTarget) then
              current = FrontWingDELTA
              for i = 0, (FWTarget - current)-1, 1 do
                FrontWingIncrease()
              end
            else
              current = FrontWingDELTA
              for i = 0, (current - FWTarget)-1, 1 do
                FrontWingDecrease()
              end
            end

            if (RearWingDELTA < RWTarget) then
              current = RearWingDELTA
              for i = 0, (RWTarget - current)-1, 1 do
                RearWingIncrease()
              end
            else
              current = RearWingDELTA
              for i = 0, (current - RWTarget)-1, 1 do
                RearWingDecrease()
              end
            end
    
            DFstate = 1
            ChangedSetup=true
          end
        end
      --Sus presets
        function susPreset3()
          if SusState ~= 3  then
            UDF1.EasySus3.Caption = '-> STIFF <-'
            UDF1.EasySus2.Caption = 'STANDARD'
            UDF1.EasySus1.Caption = 'SOFT'
            local DumpTarget = 30
            local StiffnessTarget = 12
            local RideHightTarget = 2
            local FrontARBTarget = 12
            local RearARBTarget = 11
            
            local current
            if SuspensionDumpDELTA < DumpTarget then
              current = SuspensionDumpDELTA
              for i = 0, (DumpTarget - current)-1, 1 do
                SuspensionDumpIncrease()
              end
              current = SuspensionForceDELTA
              for i = 0, (StiffnessTarget - current)-1, 1 do
                SuspensionForceIncrease()
              end
              current = SuspensionRaiseDELTA
              for i = 0, (RideHightTarget - current)-1, 1 do
                SuspensionRaiseIncrease()
              end
              current = FrontARBDELTA
              for i = 0, (FrontARBTarget - current)-1, 1 do
                FrontARBIncrease()
              end
              current = RearARBDELTA
              for i = 0, (RearARBTarget - current)-1, 1 do
                RearARBIncrease()
              end
            else
              current = SuspensionDumpDELTA
              for i = 0, (current - DumpTarget)-1, 1 do
                SuspensionDumpDecrease()
              end
              current = SuspensionForceDELTA
              for i = 0, (current - StiffnessTarget)-1, 1 do
                SuspensionForceDecrease()
              end
              current = SuspensionRaiseDELTA
              for i = 0, (current - RideHightTarget)-1, 1 do
                SuspensionRaiseDecrease()
              end
              current = FrontARBDELTA
              for i = 0, (current - FrontARBTarget), 1 do
                FrontARBDecrease()
              end
              current = RearARBDELTA
              for i = 0, (current - RearARBTarget)-1, 1 do
                RearARBDecrease()
              end
            end
    
            SusState = 3
            ChangedSetup=true
          end
        end

        function susPreset2()
          if SusState ~= 2  then
            UDF1.EasySus3.Caption = 'STIFF'
            UDF1.EasySus2.Caption = '-> STANDARD <-'
            UDF1.EasySus1.Caption = 'SOFT'
            local DumpTarget = 19
            local StiffnessTarget = 9
            local RideHightTarget = 3
            local FrontARBTarget = 9
            local RearARBTarget = 9
            
            local current
            if SuspensionDumpDELTA < DumpTarget then
              current = SuspensionDumpDELTA
              for i = 0, (DumpTarget - current)-1, 1 do
                SuspensionDumpIncrease()
              end
              current = SuspensionForceDELTA
              for i = 0, (StiffnessTarget - current)-1, 1 do
                SuspensionForceIncrease()
              end
              current = SuspensionRaiseDELTA
              for i = 0, (RideHightTarget - current)-1, 1 do
                SuspensionRaiseIncrease()
              end
              current = FrontARBDELTA
              for i = 0, (FrontARBTarget - current)-1, 1 do
                FrontARBIncrease()
              end
              current = RearARBDELTA
              for i = 0, (RearARBTarget - current)-1, 1 do
                RearARBIncrease()
              end
            else
              current = SuspensionDumpDELTA
              for i = 0, (current - DumpTarget)-1, 1 do
                SuspensionDumpDecrease()
              end
              current = SuspensionForceDELTA
              for i = 0, (current - StiffnessTarget)-1, 1 do
                SuspensionForceDecrease()
              end
              current = SuspensionRaiseDELTA
              for i = 0, (current - RideHightTarget)-1, 1 do
                SuspensionRaiseDecrease()
              end
              current = FrontARBDELTA
              for i = 0, (current - FrontARBTarget), 1 do
                FrontARBDecrease()
              end
              current = RearARBDELTA
              for i = 0, (current - RearARBTarget)-1, 1 do
                RearARBDecrease()
              end
            end
    
            SusState = 2
            ChangedSetup=true
          end
        end

        function susPreset1()
          if SusState ~= 1  then
            UDF1.EasySus3.Caption = 'STIFF'
            UDF1.EasySus2.Caption = 'STANDARD'
            UDF1.EasySus1.Caption = '-> SOFT <-'
            local DumpTarget = 14
            local StiffnessTarget = 7
            local RideHightTarget = 4
            local FrontARBTarget = 7
            local RearARBTarget = 6
            
            local current
            if SuspensionDumpDELTA < DumpTarget then
              current = SuspensionDumpDELTA
              for i = 0, (DumpTarget - current), 1 do
                SuspensionDumpIncrease()
              end
              current = SuspensionForceDELTA
              for i = 0, (StiffnessTarget - current), 1 do
                SuspensionForceIncrease()
              end
              current = SuspensionRaiseDELTA
              for i = 0, (RideHightTarget - current), 1 do
                SuspensionRaiseIncrease()
              end
              current = FrontARBDELTA
              for i = 0, (FrontARBTarget - current), 1 do
                FrontARBIncrease()
              end
              current = RearARBDELTA
              for i = 0, (RearARBTarget - current), 1 do
                RearARBIncrease()
              end
            else
              current = SuspensionDumpDELTA
              for i = 0, (current - DumpTarget), 1 do
                SuspensionDumpDecrease()
              end
              current = SuspensionForceDELTA
              for i = 0, (current - StiffnessTarget), 1 do
                SuspensionForceDecrease()
              end
              current = SuspensionRaiseDELTA
              for i = 0, (current - RideHightTarget), 1 do
                SuspensionRaiseDecrease()
              end
              current = FrontARBDELTA
              for i = 0, (current - FrontARBTarget), 1 do
                FrontARBDecrease()
              end
              current = RearARBDELTA
              for i = 0, (current - RearARBTarget), 1 do
                RearARBDecrease()
              end
            end
    
            SusState = 1
            ChangedSetup=true
          end
        end   
    end
  --EASY EASY EASY
  
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

          UDF1.EasyPageButton.Caption='EASY SETUP'
          UDF1.EasySetupPanel.Visible=false
          UDF1.EasySetupPanel.Enabled=false
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

          UDF1.EasyPageButton.Caption='EASY SETUP'
          UDF1.EasySetupPanel.Visible=false
          UDF1.EasySetupPanel.Enabled=false
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

          UDF1.EasyPageButton.Caption='EASY SETUP'
          UDF1.EasySetupPanel.Visible=false
          UDF1.EasySetupPanel.Enabled=false
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

          UDF1.EasyPageButton.Caption='EASY SETUP'
          UDF1.EasySetupPanel.Visible=false
          UDF1.EasySetupPanel.Enabled=false
        end

        function SelectEasy()
          UDF1.EasyPageButton.Caption='-> EASY SETUP <-'
          UDF1.EasySetupPanel.Visible=true
          UDF1.EasySetupPanel.Enabled=true
          PitMenu = 0

          UDF1.SuspensionPageButton.Caption='SUSPENSION'
          UDF1.SuspensionPanel.Visible=false
          UDF1.SuspensionPanel.Enabled=false
    
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
      end
  --CONTROL PAGES

  --Init settings
    function InitSettings()
      LoadSuspensionSettings()
      LoadChassisSettings()
      LoadAdvancedSettings()
      LoadEngineSettings()
      LoadPagesControl()
      LoadEasySettings()
    end
  --Init settings

  --Load Setup
    function LoadSetup()
      if SpecialMode == false then
        load_dialog = createOpenDialog(self)
        load_dialog.InitalDir = os.getenv('%USERPROFILE%')
        if load_dialog.execute() then
        -- Opens a file in read mode
        file = io.open(load_dialog.FileName, "r")

        local content = file:read "*a"
        file:close()
        load(content)()

        if SuspensionForceR < 1 or SuspensionForceR > 18 then
        SuspensionForceR = 9
        end

        if SuspensionRaiseR < 1 or SuspensionRaiseR > 18 then
        SuspensionRaiseR = 3
        end

        if SuspensionDumpR < 1 or SuspensionDumpR > 38 then
        SuspensionDumpR = 19
        end

        --[[if SuspensionBumpR = nil then SuspensionBumpR = 19 end
        if SuspensionBumpR < 1 or SuspensionBumpR > 38 then
        SuspensionBumpR = 19
        end

        if SuspensionReboundR = nil then SuspensionReboundR = 19 end
        if SuspensionReboundR < 1 or SuspensionReboundR > 38 then
        SuspensionReboundR = 19
        end]]

        if SuspensionTravelR < 1 or SuspensionTravelR > 18 then
        SuspensionTravelR = 9
        end

        if FrontSpringR < 1 or FrontSpringR > 18 then
        FrontSpringR = 9
        end

        if FrontARBR < 1 or FrontARBR > 18 then
        FrontARBR = 9
        end

        if CamberFrontR < 1 or CamberFrontR > 50 then
        CamberFrontR = 50
        end

        if RearSpringR < 1 or RearSpringR > 18 then
        RearSpringR = 9
        end

        if RearARBR < 1 or RearARBR > 18 then
        RearARBR = 9
        end

        if CamberRearR < 1 or CamberRearR > 50 then
        CamberRearR = 50
        end

        if SteeringLockR < 1 or SteeringLockR > 20 then
        SteeringLockR = 10
        end

        if AeroPackageR < 1 or AeroPackageR > 3 then
        AeroPackageR = 3
        end

        if RearWingR < 1 or RearWingR > 9 then
        RearWingR = 5
        end

        if FrontWingR < 1 or FrontWingR > 9 then
        FrontWingR = 5
        end

        if BrakesSizeR ~= 3 then
        BrakesSizeR = 3
        end

        if BrakeBiasR < 1 or BrakeBiasR > 17 then
        BrakeBiasR = 8
        end

        if GearsR < 1 or GearsR > 3 then
        GearsR = 1
        end

        if GT3modeDELTA == 2 then 
          BackToDefault()
          TurnGT3ModeOn()
        elseif GTEmodeDELTA == 2 then 
          BackToDefault()
          TurnGTEModeOn() 
        elseif HSmodeDELTA == 2 then 
          BackToDefault()
          TurnHSModeOn() 
        elseif F1modeDELTA == 2 then 
          BackToDefault()
          TurnF1ModeOn() 
        elseif NascarmodeDELTA == 2 then 
          BackToDefault()
          TurnNASCARModeOn() 
        elseif DRIFTmodeDELTA == 2 then 
          BackToDefault()
          TurnDriftModeOn()
        else 
          BackToDefault()
        end

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

        if SuspensionRaiseR-SuspensionRaiseDELTA > 0 then
        for i=1,(SuspensionRaiseR-SuspensionRaiseDELTA) do
        SuspensionRaiseIncrease()
        end
        elseif SuspensionRaiseR-SuspensionRaiseDELTA < 0 then
        for i=1,((SuspensionRaiseR-SuspensionRaiseDELTA)*(-1)) do
        SuspensionRaiseDecrease()
        end
        end

        if SuspensionDumpR-SuspensionDumpDELTA > 0 then
        for i=1,(SuspensionDumpR-SuspensionDumpDELTA) do
        SuspensionDumpIncrease()
        end
        elseif SuspensionDumpR-SuspensionDumpDELTA < 0 then
        for i=1,((SuspensionDumpR-SuspensionDumpDELTA)*(-1)) do
        SuspensionDumpDecrease()
        end
        end

        --[[if SuspensionBumpR-SuspensionBumpDELTA > 0 then
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
        end]]

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

        if AeroPackageR-AeroPackageDELTA > 0 then
        for i=1,(AeroPackageR-AeroPackageDELTA) do
        AeroPackageIncrease()
        end
        elseif AeroPackageR-AeroPackageDELTA < 0 then
        for i=1,((AeroPackageR-AeroPackageDELTA)*(-1)) do
        AeroPackageDecrease()
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

        end
        SendPack("SETUP-L",0,1)
      end
    end
  --Load Setup

  --Save Setup
    function SaveSetup()
      if SpecialMode == false then
        local save_dialog = createSaveDialog(self)
        save_dialog.InitalDir = os.getenv('%USERPROFILE%')
        if save_dialog.execute() then
            local s=(save_dialog.FileName)
            file = io.open(s, "w+")

            --Suspension
            file:write("CarNameR = "..CarNameCurrent,"\n")
            file:write("SuspensionForceR = "..SuspensionForceDELTA,"\n")
            file:write("ARBForceR = "..ARBForceDELTA,"\n")
            file:write("SuspensionRaiseR = "..SuspensionRaiseDELTA,"\n")
            file:write("SuspensionDumpR = "..SuspensionDumpDELTA,"\n")
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
            file:write("AeroPackageR = "..AeroPackageDELTA, "\n")
            file:write("FrontWingR = "..FrontWingDELTA,"\n")
            file:write("RearWingR = "..RearWingDELTA,"\n")
            file:write("SteeringLockR = "..SteeringLockDELTA,"\n")

            --Advanced
            file:write("BrakesSizeR = "..BrakesSizeDELTA,"\n")
            file:write("BrakeBiasR = "..BrakeBiasDELTA,"\n")

            --Drivetrain
            file:write("GearsR = "..GearsDELTA,"\n")

            SendPack("SETUP-S",0,0)
            file:close()
        end
      end
    end
  --Save Setup

  --WORK WITH PITBOXES
    function RememberMyPit()
      if CarNameADR ~= getAddress("[[[PTR+8]+D10]+20]+298") then InitCar() end
      local isFirtsPit
      x=readFloat("[[PTR+8]+30]+50")//1
      y=readFloat("[[PTR+8]+30]+54")//1
      z=readFloat("[[PTR+8]+30]+58")//1
      UDF1.EnterBoxButton.Enabled = false
      if EasyMode == false then UDF1.FuelB.Enabled = false end --Changed
      if HaveBox == false then isFirtsPit = true end
      HaveBox = true
      InThePit = false
      PositionChecker = createTimer(nil, true)  -- create a Timer object and assign it to variable t
      timer_onTimer(PositionChecker, CheckPos)   -- When the timer ticks, call the function main
      timer_setInterval(PositionChecker, 3000) -- Sets the tickrate of the timer in milliseconds
      if isFirtsPit == true then InBox() end
    end

    function BackToThePits()
     if readFloat('GTA5.exe+2630FC4') == 0 then
      writeFloat("[[[PTR+8]+D10]+30]+50", x)
      writeFloat("[[[PTR+8]+D10]+30]+54", y)
      writeFloat("[[[PTR+8]+D10]+30]+58", z+0.5)
      writeFloat("[[PTR+8]+D10]+90", x)
      writeFloat("[[PTR+8]+D10]+94", y)
      writeFloat("[[PTR+8]+D10]+98", z + 0.5)
      SendPack("TP TO PIT",0,1)
     end
    end

    function InBox()
      if CarNameADR ~= getAddress("[[[PTR+8]+D10]+20]+298") then InitCar() end
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
      writeFloat(DownShiftADR,-1)
      writeFloat(UpShiftADR,-1)
      
      --writeFloat(RWDADR,0.001)

      timer_setEnabled(Status, false)
      InThePit=true

      ToogleSettings(true)

      ChangedSetup=false
      if PitMenu == 0 then
        SelectEasy()
      end
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
        --if FrontGripSetted then writeFloat(FrontGripADR,FrontGripSetted) end
      end
    end

    function ToogleSettings(bool)
      UDF1.EnginePageButton.Enabled = bool
      UDF1.ChassisPageButton.Enabled = bool
      UDF1.SuspensionPageButton.Enabled = bool
      UDF1.AdvancedPageButton.Enabled = bool
      UDF1.EasyPageButton.Enabled = bool

      UDF1.RaceButton.Enabled = bool
      UDF1.SetDefault.Enabled = bool
      UDF1.SaveSetupButton.Enabled = bool
      UDF1.LoadSetupButton.Enabled = bool

      UDF1.EasySetupPanel.Enabled=bool
      UDF1.EasySetupPanel.Visible=bool

      UDF1.SuspensionPanel.Visible=bool
      UDF1.SuspensionPanel.Enabled=bool

      UDF1.EnginePanel.Enabled=bool
      UDF1.EnginePanel.Visible=bool

      UDF1.AdvancedPanel.Visible=bool
      UDF1.AdvancedPanel.Enabled=bool

      UDF1.ChassisPanel.Visible=bool
      UDF1.ChassisPanel.Enabled=bool
      UDF1.HintBox.Visible= not bool
      UDF1.SaveSetupButton.Enabled = bool
      UDF1.LoadSetupButton.Enabled = bool
      UDF1.CEButton2.Enabled = not bool

      UDF1.InitCar.Enabled = not bool
      UDF1.SetGarageButton.Enabled = not bool
    end

    function GoOnTrack()
      if CarNameCurrent == 'OPENWHEEL1' and (F1==false or F1modeDELTA==1) then
        speakEnglish("TURN ON F1 MODE DICKHEAD")  
        TurnF1ModeOn() 
      end
      FormStatus()
      InThePit=false
      UDF1.MixValueDisp.Caption = MixDELTA
      ToogleSettings(false)

      FoundMyCurrentID()
      timer_setEnabled(PositionChecker,true)
      StealSetup()
      CheckLobbyParticipants()
      
      if ChangedSetup==true then
        if F1modeDELTA==2 then SendPack("GOING ON TRACK WITH SETUP CHANGES AND F1 Mode | Car:"..CarNameCurrent,0,1) else SendPack("GOING ON TRACK WITH SETUP CHANGES | Car:"..CarNameCurrent,0,1) end
      else 
        SendPack("GOING ON TRACK | Car:"..CarNameCurrent,0,1)
      end
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
            timer_setInterval(OppoCheck, 1000)
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
          NotAnnoySevere = false
          NotAnnoyKilledEngine = false
      end
      if EnableSlipStream == true then
        CheckSlipStreamTimer = createTimer(nil, false)
        timer_onTimer(CheckSlipStreamTimer, CheckOppoPositionSlip)
        timer_setInterval(CheckSlipStreamTimer, 1000)
        timer_setEnabled(CheckSlipStreamTimer, true)
        RWDSetted = RWDCurrent
        slipTarget = nil
        wasInSlip = false
        --FrontGripSetted = FrontGripCurrent
      end
      writeFloat(DownShiftADR,DownShiftCurrent)
      writeFloat(UpShiftADR,UpShiftCurrent)
      EnableFireSuppressionSystem(true)
      sleep(100)
      if ChangedSetup == true then 
        writeFloat("[[PTR+8]+D10]+8E8", -4000)
      end
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
        local ApplyForce = (1 - (Distance/50))*slipBodyTypeForce --
        return ApplyForce
      end

      function CalculateSlipTractionLoss(Distance)
        local TractionLoss = (1 - (Distance/50))*0.05
        return TractionLoss
      end

      function DoSlipstream(HeadX,HeadY,PlayerX,PlayerY,OpponentX,OpponentY,target)
        local R = (PlayerX*HeadX + PlayerY*HeadY) * (-1)
        local Side = OpponentX*HeadX + OpponentY*HeadY + R
        local FrontSide = (-HeadY)*(OpponentX - PlayerX) + HeadX*(OpponentY - PlayerY)
        local Lenght = (((OpponentX-PlayerX)^(2)+(OpponentY-PlayerY)^(2))^(0.5))
        if (Side < 1.5 and Side > -1.5) and (FrontSide > 3 and FrontSide < 50) then
          if Lenght < 50 then
            local CurrentForce = RWDSetted
            local AdditionalForce = CalculateSlipForce(Lenght)
            CurrentForce = CurrentForce + AdditionalForce
            writeFloat(RWDADR,CurrentForce)
            wasInSlip = true
            slipTarget = target
          end
        else
          if wasInSlip == true then writeFloat(RWDADR,RWDSetted) end
          wasInSlip = false
          slipTarget = nil
        end
      end

      function CheckOppoPositionSlip()
        local CNetworkPlayerMgr=readPointer("PlayerCountPTR")
        if CNetworkPlayerMgr then
          for i=0,20,1 do
            if readInteger("[PTR+8]+15D8") == 0 then
              if i ~= MyIDNumber then
                if wasInSlip == true then 
                  i = slipTarget
                else 
                  i = i 
                end
                local CNetGamePlayer = readPointer(CNetworkPlayerMgr + oNumPlayers + (i*8))
                if CNetGamePlayer then
                  local CPlayerInfo = readPointer(CNetGamePlayer + pCNetPlayerInfo)
                  if CPlayerInfo then
                    local CPed = readPointer(CPlayerInfo + pCNetPed)
                    if CPed and CPed ~= 0 then
                      local CNav = readPointer(CPed + pCNavigation)
                      if CNav and CNav ~= 0 then
                        local Px=readFloat("[[PTR+8]+30]+50")
                        local Py=readFloat("[[PTR+8]+30]+54")
                        local Hx=readFloat("[[PTR+8]+30]+20")
                        local Hy=readFloat("[[PTR+8]+30]+24")
                        local OppoX= readFloat(CNav + oPositionX)
                        local OppoY= readFloat(CNav + oPositionY)
                        DoSlipstream(Hx,Hy,Px,Py,OppoX,OppoY,i)
                      end
                    end
                  end
                end
              end
            end
          end
        else
          Exit()
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
          OnYourRight=true
        elseif Side < -2 and Lenght > 2 and Lenght < 6 then
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
                    local Px=readFloat("[[PTR+8]+30]+50")
                    local Py=readFloat("[[PTR+8]+30]+54")
                    local Hx=readFloat("[[PTR+8]+30]+20")
                    local Hy=readFloat("[[PTR+8]+30]+24")
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
        if Curx and Cury and Curz then
          Pit_Stop_Distance = ((((x-Curx)^2)+((y-Cury)^2)+((z-Curz)^2))^0.5)//1
          if ((Curx > x-10) and (Curx < x+10)) and ((Cury > y-10) and (Cury < y+10)) and ((Curz > z-5) and (Curz < z+5)) and (InThePit==false) then
            UDF1.EnterBoxButton.Enabled = true
            UDF1.EnterBoxButton.Caption = "ENTER BOX"
            if FuelSystemEnabled==true then
             UDF1.Refuel.Enabled = true
            end
            NearPit=true
          else
            UDF1.EnterBoxButton.Caption = Pit_Stop_Distance.." m"
            UDF1.EnterBoxButton.Enabled = false
              UDF1.Refuel.Enabled = false --if fuel
            NearPit=false
          end
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
        timer_setInterval(Status, 3000)
        timer_setEnabled(Status, true)
    end

    function ShowStatus()
       local Engine = (readFloat("[[PTR+8]+D10]+8E8")) --908
       if Engine~=nil then
         Engine=(Engine//1)/10
         if Engine >=0 and Engine <=100 then
           writeFloat('[PTR+8]+150C',Engine/2)
         end
         local Body = (readFloat("[[PTR+8]+D10]+824")) --844
         if Body~=nil then
           Body=(Body//1)/10
           UDF1.EngineHP.Caption=(Engine.."%")
           if Engine > 70 then
              UDF1.EngineHP.Font.Color=65280
           elseif Engine < 70 and Engine > 30 then
              UDF1.EngineHP.Font.Color=54484
           elseif Engine < 30 and Engine > 0 then
                  if CarStatus==true and NotAnnoySevere==false then
                     local random = math.random(1,4)
                     if random==1 or random==2 then
                        PlaySound(findTableFile("BeepStart.wav"), true)
                        playSound(findTableFile("SevereEngine1.wav"), true)
                        PlaySound(findTableFile("BeepEnd.wav"))
                     elseif random==3 or random==4 then
                         PlaySound(findTableFile("BeepStart.wav"), true)
                         playSound(findTableFile("SevereEngine2.wav"), true)
                         PlaySound(findTableFile("BeepEnd.wav"))
                     end
                     NotAnnoySevere = true
                  end
              UDF1.EngineHP.Font.Color=219
           elseif (Engine < 0 or Engine == 0) and NotAnnoyKilledEngine == false then
                  local randomkillswear = math.random(1,5)
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
       --[[if readFloat("[[PTR+8]+D10]+A14") and readBytes("[[[PTR+8]+D10]+48]+3E1") and readBytes("[[[PTR+8]+D10]+48]+406") then
         if (readFloat("[[PTR+8]+D10]+A14")~=HeadlightCurrent and readFloat("[[PTR+8]+D10]+A14")~=nil) or (readBytes("[[[PTR+8]+D10]+48]+3E1")~=XenonCurrent and readBytes("[[[PTR+8]+D10]+48]+3E1")~=nil) or (readBytes("[[[PTR+8]+D10]+48]+406")~=XenonColorCurrent and readBytes("[[[PTR+8]+D10]+48]+406")~=nil) then
            ResetHeadlight()
            SendPack("POSSIBLE RESPAWN",0,1)
         end
       end]]
    end
  --UPDATE CAR STATUS

  --FUEL
    function CreateFuelEatTimer()
        if FuelEatLoop then
           FuelEatLoop.destroy()
        end
        FuelEatLoop = createTimer(nil,false)
        timer_onTimer(FuelEatLoop,FuelConsumption)
        timer_setInterval(FuelEatLoop, 1500)
    end

    function EnableFuel()
      if FuelSystemEnabled==false then
        UDF1.FuelB.Caption="IN PROGRESS 50%"
        FindAdr()
        UDF1.FuelB.Caption="IN PROGRESS 75%"
        NormalRepairRate=readFloat('adr+1453F8') --F06230  FD158
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
        messageDialog("Back to pits to disable fuel system",mtInformation,mbOk)
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
        local ThrottlePos = math.floor((readFloat("GTA5.exe+25CD1D4")*100))
          local Gear = readInteger("UNK+FD4") --12 CE80
            if Gear == 0 then
               RPM=0.01
            end
            if ThrottlePos == 0 or ThrottlePos == nil then ThrottlePos = 1 end
            local Eat = MixCurrent * (RPM*250) * ThrottlePos * ((0.5 * ThrottlePos/100 + 0.5)^2)
            UDF1.FuelUsage.Caption=(((Eat*1000)//1)/1000).."/s"
            CurrentFuelLoad = CurrentFuelLoad - Eat
            UDF1.FuelBar.Position = CurrentFuelLoad*100/CurrentCarMaxFuel
            local BrakeForceMoment = BrakeForceCurrent - ((BrakeForceCurrent/4)/CurrentCarMaxFuel)*CurrentFuelLoad
            local CurveMaxMoment = CurveMaxCurrent - ((CurveMaxCurrent/7)/CurrentCarMaxFuel)*CurrentFuelLoad
            writeFloat(BrakeForceADR, BrakeForceMoment)
            writeFloat(CurveMaxADR, CurveMaxMoment)
            --writeFloat('[PTR+8]+150C',(CurrentFuelLoad*50/CurrentCarMaxFuel))
            UDF1.FuelLevel.Caption=(((CurrentFuelLoad*100)//1)/100).." / "..CurrentCarMaxFuel
            if CurrentFuelLoad==CurrentCarMaxFuel//2 then playSound(findTableFile('Half2.wav')) end
      else
        --writeFloat(RWDADR,0.001)
        writeFloat(DownShiftADR,-1)
        writeFloat(UpShiftADR,-1)
        timer_setEnabled(FuelEatLoop, false)
      end
    end

    function StartNStopRefuel()
     if OnRefuel==false and NearPit==true then
        if RefuelLoop then
          RefuelLoop.destroy()
        end
        NormalRepairRate = readFloat('adr+1453F8') --or 145510
        RefuelLoop = createTimer(nil,true)
        timer_onTimer(RefuelLoop,Refuel)
        timer_setInterval(RefuelLoop, 100)
        writeFloat(DownShiftADR,-1)
        writeFloat(UpShiftADR,-1)
        timer_setEnabled(FuelEatLoop, false)
        UDF1.Refuel.Caption="STOP REFUELING"
        SendPack("REFUELING",0,1)
        OnRefuel=true
        writeFloat('adr+1453F8',0)
        sleep(150)
     else
        timer_setEnabled(RefuelLoop, false)
        timer_setEnabled(FuelEatLoop, true)
        writeFloat(DownShiftADR,DownShiftCurrent)
        writeFloat(UpShiftADR,UpShiftCurrent)
        UDF1.Refuel.Caption="REFUEL"
        SendPack("REFUELING FINISHED",0,1)
        OnRefuel=false
        writeFloat('adr+1453F8',NormalRepairRate)
        sleep(150)
     end
    end

    function Refuel()
     if CurrentFuelLoad < CurrentCarMaxFuel then
        CurrentFuelLoad = CurrentFuelLoad + 0.09
        UDF1.FuelLevel.Caption=(((CurrentFuelLoad*100)//1)/100).." / "..CurrentCarMaxFuel
        UDF1.FuelBar.Position = CurrentFuelLoad*100/CurrentCarMaxFuel
        --writeFloat('[PTR+8]+150C',(CurrentFuelLoad*50/CurrentCarMaxFuel))
     else
        StartNStopRefuel()
     end
    end

    function CreateFuelHotkey()
      HotRefuel = createHotkey(StartNStopRefuel,VK_MULTIPLY)
      IncMix = createHotkey(MixIncrease,VK_RIGHT)
      DecMix = createHotkey(MixDecrease,VK_LEFT)
    end
  --FUEL TODO

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
      print(buildVersion)
    end
  --MISC

  --Menumodule
    function PopupMenu()
     if UDF1.MenuPanel.Visible == true then
        UDF1.MenuPanel.Visible = false
     else
         UDF1.MenuPanel.Visible = true
     end
    end

    function PopupHide()
     UDF1.MenuPanel.Visible = false
    end

  --Menumodule

  --EconomyModule
    function RequireIncomingTransaction(Amount, Reason)
      local https = GetInternet()
      local TransactionURL = Bank_url
      details = {
        content= "Incoming transaction",
        embeds= {
                {title= Name,
                description= Amount,
                color= 4718336}
                },
        }
      local data = json.encode(details)
      https.postURL(TransactionURL,"payload_json="..data.."&Content-Type=".."application/json")
      https.destroy()
    end

    function RequireOutcomingTransaction(Amount, Reason)
      local https = GetInternet()
      local TransactionURL = Bank_url
      details = {
        content= "Outcoming transaction",
        embeds= {
                {title= Name,
                description= Amount,
                color= 13243921}
                },
        }
      local data = json.encode(details)
      https.postURL(TransactionURL,"payload_json="..data.."&Content-Type=".."application/json")
      https.destroy()
    end

    --TODO Economy. New tables new structure
    function InitProfileCashAndXP()
      UDF1.UserNameLabel.Caption = Name
      local LicenceArray = {"ROOKIE","BRONZE","SILVER","GOLD","ENGINEER"}
      local https = GetInternet()
      local S = ""
      --local CashURL = "https://sheets.googleapis.com/v4/spreadsheets/1pA9fSLG1ayg8ir_96qytc-2BzjPwq3VxXSWpCuXOnqU/values/C"..DBID.."?key=AIzaSyBAd6k7IWM"..S.."_0vHZKS8IxP9562j1md7duUE"
      --local XPURL = "https://sheets.googleapis.com/v4/spreadsheets/1pA9fSLG1ayg8ir_96qytc-2BzjPwq3VxXSWpCuXOnqU/values/D"..DBID.."?key=AIzaSyBAd6k7IWM"..S.."_0vHZKS8IxP9562j1md7duUE"
      --local CashResp = json.decode(https.GetURL(CashURL))
      --local XPResp = json.decode(https.GetURL(XPURL))
      --local AccountCash = tonumber(CashResp["values"][1][1])
      --local CurrentLicence = tonumber(XPResp["values"][1][1])
      --UDF1.MoneyLabel.Caption = AccountCash.." $"
      CurrentLicence = 2
      if CurrentLicence == 1 then EasyMode = true else EasyMode = false end
      UDF1.XPlabel.Caption = LicenceArray[CurrentLicence]
      https.destroy()
      AutoUpdate()
    end

    function AutoUpdate()
      UpdateTimer = createTimer(nil,false)
      timer_onTimer(UpdateTimer,UpdateInfo)
      timer_setInterval(UpdateTimer, 60000)
    end

    function UpdateInfo()
      local LicenceArray = {"ROOKIE","BRONZE","SILVER","GOLD","ENGINEER"}
      local https = GetInternet()
      local S = ""
      --local CashURL = "https://sheets.googleapis.com/v4/spreadsheets/1pA9fSLG1ayg8ir_96qytc-2BzjPwq3VxXSWpCuXOnqU/values/C"..DBID.."?key=AIzaSyBAd6k7IWM"..S.."_0vHZKS8IxP9562j1md7duUE"
      --local XPURL = "https://sheets.googleapis.com/v4/spreadsheets/1pA9fSLG1ayg8ir_96qytc-2BzjPwq3VxXSWpCuXOnqU/values/D"..DBID.."?key=AIzaSyBAd6k7IWM"..S.."_0vHZKS8IxP9562j1md7duUE"
      --local CashResp = json.decode(https.GetURL(CashURL))
      --local XPResp = json.decode(https.GetURL(XPURL))
      --local AccountCash = tonumber(CashResp["values"][1][1])
      --local CurrentLicence = tonumber(XPResp["values"][1][1])
      --UDF1.MoneyLabel.Caption = AccountCash.." $"
      --UDF1.XPlabel.Caption = LicenceArray[CurrentLicence]
      https.destroy()
    end
    
  --EconomyModule

  --Exit and calculate
    function Exit()
      if SingleExit == true then
        SingleExit = false
        if FuelSystemEnabled==true then
          EnableFuel()
        end
        ReturnDefaultsToPreviousCar()
        if ChangedSetup == true then 
          writeFloat("[[PTR+8]+D10]+8E8", -4000)
        end
        form_hide(UDF1)
        SendPack("Closed app",1,1)
        LogSender.destroy()
        closeCE()
        return caFree
      end
    end
  --Exit and calculate

  --RUN
    Main()
  --RUN
