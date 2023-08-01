function createUI()
  getImages()
  createMainForm()
  createLabels()
end

function defineCreateUI()
  function getImages()
    local http = getInternet()
    local icon = http.getURL("https://raw.githubusercontent.com/MrTin0/Delta-App/main/.ico/delta-app.png")
    local imageScreen1 = http.getURL("https://raw.githubusercontent.com/MrTin0/Delta-App/main/.ico/delta-app.png")
    local imageScreen2 = http.getURL("https://raw.githubusercontent.com/MrTin0/Delta-App/main/.ico/delta-app.png")
    local imageScreen2 = http.getURL("https://raw.githubusercontent.com/MrTin0/Delta-App/main/.ico/delta-app.png")
    local iconStream = createStringStream(icon)
    local image1Stream = createStringStream(imageScreen1)
    local image2Stream = createStringStream(imageScreen2)
    http.Destroy()
    
    local Pic = createPicture()
    Pic.loadFromStream(IM)
    local Bit = Pic.getBitmap()
  end
  
  function createMainForm()
    UI = createForm()

    UI.Left = 0
    UI.Height = 820
    UI.Top = 0
    UI.Width = 1420
    -- UI.ActiveControl = InitCar
    UI.BorderStyle = 'bsSingle'
    UI.Caption = 'Custom Setups'
    UI.Color = clAppWorkspace
    UI.Font.Color = clWhite
    UI.ShowInTaskBar = 'stAlways'
    UI.Position = 'poScreenCenter'
    UI.Font.Name = 'Segoe UI'
  end
  
  function createLabels()
    userNameLabel = createLabel(UI)
      userNameLabel.AutoSize = false
      userNameLabel.ParentColor = false
      userNameLabel.Color = '$00E4E4E4'

      userNameLabel.Left = 10
      userNameLabel.Height = 32
      userNameLabel.Top = 10
      userNameLabel.Width = 175

      userNameLabel.Font.Color = clBlack
      userNameLabel.Font.Height = -18
      userNameLabel.Font.Size = 11
      userNameLabel.Font.Style = 'fsBold,fsItalic'
      userNameLabel.Font.Name = 'Segoe UI'
      userNameLabel.Caption = 'USERNAME'
      userNameLabel.Alignment = 'taCenter'
      userNameLabel.Layout = 'tlCenter'

    carNameLabel = createLabel(UI)
      carNameLabel.AutoSize = false
      carNameLabel.ParentColor = false
      carNameLabel.Color = '$00E4E4E4'

      carNameLabel.Left = 10
      carNameLabel.Height = 32
      carNameLabel.Top = 394
      carNameLabel.Width = 560

      carNameLabel.Font.Color = clBlack
      carNameLabel.Font.Height = -18
      carNameLabel.Font.Size = 11
      carNameLabel.Font.Style = 'fsBold,fsItalic,fsUnderline'
      carNameLabel.Font.Name = 'Segoe UI'
      carNameLabel.Caption = 'NO CAR SELECTED'
      carNameLabel.Alignment = 'taCenter'
      carNameLabel.Layout = 'tlCenter'

    moneyLabel = createLabel(UI)
      moneyLabel.AutoSize = false
      moneyLabel.ParentColor = false
      moneyLabel.Color = '$00E4E4E4'

      moneyLabel.Left = 190
      moneyLabel.Height = 32
      moneyLabel.Top = 10
      moneyLabel.Width = 90

      moneyLabel.Font.Color = clBlack
      moneyLabel.Font.Height = -18
      moneyLabel.Font.Size = 11
      moneyLabel.Font.Style = 'fsBold,fsItalic'
      moneyLabel.Font.Name = 'Segoe UI'
      moneyLabel.Caption = '0$'
      moneyLabel.Alignment = 'taCenter'
      moneyLabel.Layout = 'tlCenter'

    xpLabel = createLabel(UI)
      xpLabel.AutoSize = false
      xpLabel.ParentColor = false
      xpLabel.Color = '$00E4E4E4'

      xpLabel.Left = 285
      xpLabel.Height = 32
      xpLabel.Top = 10
      xpLabel.Width = 90

      xpLabel.Font.Color = clBlack
      xpLabel.Font.Height = -18
      xpLabel.Font.Size = 11
      xpLabel.Font.Style = 'fsBold,fsItalic'
      xpLabel.Font.Name = 'Segoe UI'
      xpLabel.Caption = 'BRONZE'
      xpLabel.Alignment = 'taCenter'
      xpLabel.Layout = 'tlCenter'
  end
  
    LapProgress = createProgressBar(UI)
      LapProgress.Left = 0
      LapProgress.Height = 12
      LapProgress.Top = 188
      LapProgress.Width = 480
      LapProgress.BorderStyle = 'bsNone'
      LapProgress.Position = 50
      LapProgress.TabOrder = 1
  
    LogBuildingButton = createButton(UI)
      LogBuildingButton.Left = 10
      LogBuildingButton.Height = 35
      LogBuildingButton.Top = 10
      LogBuildingButton.Width = 90
      LogBuildingButton.Caption = 'LOGS OFF'
      LogBuildingButton.Enabled = false
      LogBuildingButton.Font.Height = -16
      LogBuildingButton.Font.Name = 'Segoe UI'
      LogBuildingButton.Font.fsBold = true
      LogBuildingButton.Font.fsItalic = true
      LogBuildingButton.OnClick = LogsSwitcher
      LogBuildingButton.ParentFont = false
      LogBuildingButton.TabOrder = 4
  
    SettingPanel = createPanel(UI)
      SettingPanel.Left = 160
      SettingPanel.Height = 130
      SettingPanel.Top = 45
      SettingPanel.Width = 310
      SettingPanel.BevelColor = clBackground
      SettingPanel.BevelWidth = 2
      SettingPanel.ClientHeight = 130
      SettingPanel.ClientWidth = 310
      SettingPanel.TabOrder = 8
      SettingPanel.Visible = false

      SimplePanel.BevelWidth = 2
      SimplePanel.ClientHeight = 135
      SimplePanel.ClientWidth = 215
      SimplePanel.TabOrder = 8
      SimplePanel.Visible = false
  
      -- Show the UI again
      UI.Visible = true
  end