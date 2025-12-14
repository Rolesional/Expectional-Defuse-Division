--// Primordial Style GUI - Bottom Navigation Version
--// Made with ❤️

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

-- Ana ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PrimordialUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.CoreGui

-- Ana Container
local MainContainer = Instance.new("Frame")
MainContainer.Name = "MainContainer"
MainContainer.Size = UDim2.new(0, 550, 0, 400)
MainContainer.Position = UDim2.new(0.5, -275, 0.5, -200)
MainContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainContainer.BorderSizePixel = 0
MainContainer.ClipsDescendants = true
MainContainer.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainContainer

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 1
MainStroke.Color = Color3.fromRGB(60, 60, 70)
MainStroke.Parent = MainContainer

-- Gölge Efekti
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(1, 40, 1, 40)
Shadow.Position = UDim2.new(0, -20, 0, -20)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://5554236805"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.6
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(23, 23, 277, 277)
Shadow.ZIndex = 0
Shadow.Parent = MainContainer

-- Üst Header Bar
local HeaderBar = Instance.new("Frame")
HeaderBar.Name = "HeaderBar"
HeaderBar.Size = UDim2.new(1, 0, 0, 45)
HeaderBar.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
HeaderBar.BorderSizePixel = 0
HeaderBar.Parent = MainContainer

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = HeaderBar

-- Header alt köşeleri düzelt
local HeaderFix = Instance.new("Frame")
HeaderFix.Size = UDim2.new(1, 0, 0, 15)
HeaderFix.Position = UDim2.new(0, 0, 1, -15)
HeaderFix.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
HeaderFix.BorderSizePixel = 0
HeaderFix.Parent = HeaderBar

-- Logo & Title
local LogoContainer = Instance.new("Frame")
LogoContainer.Size = UDim2.new(0, 150, 1, 0)
LogoContainer.BackgroundTransparency = 1
LogoContainer.Parent = HeaderBar

local LogoIcon = Instance.new("ImageLabel")
LogoIcon.Name = "Logo"
LogoIcon.Size = UDim2.new(0, 28, 0, 28)
LogoIcon.Position = UDim2.new(0, 15, 0.5, -14)
LogoIcon.BackgroundTransparency = 1
LogoIcon.Image = "rbxassetid://7733779610"
LogoIcon.ImageColor3 = Color3.fromRGB(100, 140, 255)
LogoIcon.Parent = LogoContainer

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "Title"
TitleLabel.Size = UDim2.new(0, 100, 1, 0)
TitleLabel.Position = UDim2.new(0, 50, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Primordial"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 16
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = LogoContainer

-- User Badge
local UserBadge = Instance.new("Frame")
UserBadge.Size = UDim2.new(0, 80, 0, 24)
UserBadge.Position = UDim2.new(0, 155, 0.5, -12)
UserBadge.BackgroundColor3 = Color3.fromRGB(100, 140, 255)
UserBadge.BorderSizePixel = 0
UserBadge.Parent = HeaderBar

local BadgeCorner = Instance.new("UICorner")
BadgeCorner.CornerRadius = UDim.new(0, 4)
BadgeCorner.Parent = UserBadge

local BadgeText = Instance.new("TextLabel")
BadgeText.Size = UDim2.new(1, 0, 1, 0)
BadgeText.BackgroundTransparency = 1
BadgeText.Text = "PREMIUM"
BadgeText.TextColor3 = Color3.fromRGB(255, 255, 255)
BadgeText.TextSize = 10
BadgeText.Font = Enum.Font.GothamBold
BadgeText.Parent = UserBadge

-- Close & Minimize Buttons
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "Close"
CloseButton.Size = UDim2.new(0, 32, 0, 32)
CloseButton.Position = UDim2.new(1, -42, 0.5, -16)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
CloseButton.BorderSizePixel = 0
CloseButton.Text = ""
CloseButton.AutoButtonColor = false
CloseButton.Parent = HeaderBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

local CloseIcon = Instance.new("TextLabel")
CloseIcon.Size = UDim2.new(1, 0, 1, 0)
CloseIcon.BackgroundTransparency = 1
CloseIcon.Text = "✕"
CloseIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseIcon.TextSize = 14
CloseIcon.Font = Enum.Font.GothamBold
CloseIcon.Parent = CloseButton

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "Minimize"
MinimizeButton.Size = UDim2.new(0, 32, 0, 32)
MinimizeButton.Position = UDim2.new(1, -80, 0.5, -16)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Text = ""
MinimizeButton.AutoButtonColor = false
MinimizeButton.Parent = HeaderBar

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 6)
MinimizeCorner.Parent = MinimizeButton

local MinimizeIcon = Instance.new("TextLabel")
MinimizeIcon.Size = UDim2.new(1, 0, 1, 0)
MinimizeIcon.BackgroundTransparency = 1
MinimizeIcon.Text = "−"
MinimizeIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeIcon.TextSize = 20
MinimizeIcon.Font = Enum.Font.GothamBold
MinimizeIcon.Parent = MinimizeButton

-- İçerik Container (Ortada)
local ContentContainer = Instance.new("Frame")
ContentContainer.Name = "ContentContainer"
ContentContainer.Size = UDim2.new(1, -20, 1, -115)
ContentContainer.Position = UDim2.new(0, 10, 0, 50)
ContentContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
ContentContainer.BorderSizePixel = 0
ContentContainer.ClipsDescendants = true
ContentContainer.Parent = MainContainer

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 8)
ContentCorner.Parent = ContentContainer

-- Alt Navigation Bar
local NavBar = Instance.new("Frame")
NavBar.Name = "NavBar"
NavBar.Size = UDim2.new(1, -20, 0, 55)
NavBar.Position = UDim2.new(0, 10, 1, -60)
NavBar.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
NavBar.BorderSizePixel = 0
NavBar.Parent = MainContainer

local NavCorner = Instance.new("UICorner")
NavCorner.CornerRadius = UDim.new(0, 10)
NavCorner.Parent = NavBar

local NavList = Instance.new("UIListLayout")
NavList.FillDirection = Enum.FillDirection.Horizontal
NavList.Padding = UDim.new(0, 8)
NavList.HorizontalAlignment = Enum.HorizontalAlignment.Center
NavList.VerticalAlignment = Enum.VerticalAlignment.Center
NavList.Parent = NavBar

-- Draggable
local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainContainer.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

HeaderBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainContainer.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

HeaderBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Close/Minimize handlers
CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 100, 100)}):Play()
end)

CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 70, 70)}):Play()
end)

CloseButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    TweenService:Create(MainContainer, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    task.delay(0.3, function()
        ScreenGui:Destroy()
    end)
end)

MinimizeButton.MouseEnter:Connect(function()
    TweenService:Create(MinimizeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 70, 80)}):Play()
end)

MinimizeButton.MouseLeave:Connect(function()
    TweenService:Create(MinimizeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}):Play()
end)

local isMinimized = false
local originalSize = MainContainer.Size

MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        TweenService:Create(MainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
            Size = UDim2.new(0, 550, 0, 45)
        }):Play()
        ContentContainer.Visible = false
        NavBar.Visible = false
    else
        TweenService:Create(MainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
            Size = originalSize
        }):Play()
        task.delay(0.15, function()
            ContentContainer.Visible = true
            NavBar.Visible = true
        end)
    end
end)

-- Menu Library
local Menu = {}
Menu.Tabs = {}
Menu.CurrentTab = nil
Menu.AccentColor = Color3.fromRGB(100, 140, 255)

function Menu:SetAccentColor(color)
    Menu.AccentColor = color
    UserBadge.BackgroundColor3 = color
    LogoIcon.ImageColor3 = color
end

-- Tab oluşturma
function Menu:CreateTab(tabName, tabIcon)
    local Tab = {}
    Tab.Name = tabName
    Tab.Icon = tabIcon or "rbxassetid://7733960981"
    
    -- Alt Navigation'da Tab Butonu
    local TabButton = Instance.new("TextButton")
    TabButton.Name = tabName
    TabButton.Size = UDim2.new(0, 75, 0, 45)
    TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    TabButton.BorderSizePixel = 0
    TabButton.Text = ""
    TabButton.AutoButtonColor = false
    TabButton.Parent = NavBar
    
    local TabBtnCorner = Instance.new("UICorner")
    TabBtnCorner.CornerRadius = UDim.new(0, 8)
    TabBtnCorner.Parent = TabButton
    
    local TabIcon = Instance.new("ImageLabel")
    TabIcon.Size = UDim2.new(0, 20, 0, 20)
    TabIcon.Position = UDim2.new(0.5, -10, 0, 5)
    TabIcon.BackgroundTransparency = 1
    TabIcon.Image = Tab.Icon
    TabIcon.ImageColor3 = Color3.fromRGB(140, 140, 150)
    TabIcon.Parent = TabButton
    
    local TabLabel = Instance.new("TextLabel")
    TabLabel.Size = UDim2.new(1, 0, 0, 15)
    TabLabel.Position = UDim2.new(0, 0, 1, -18)
    TabLabel.BackgroundTransparency = 1
    TabLabel.Text = tabName
    TabLabel.TextColor3 = Color3.fromRGB(140, 140, 150)
    TabLabel.TextSize = 10
    TabLabel.Font = Enum.Font.GothamSemibold
    TabLabel.Parent = TabButton
    
    -- Aktif Indicator
    local ActiveIndicator = Instance.new("Frame")
    ActiveIndicator.Size = UDim2.new(0.6, 0, 0, 3)
    ActiveIndicator.Position = UDim2.new(0.2, 0, 0, 2)
    ActiveIndicator.BackgroundColor3 = Menu.AccentColor
    ActiveIndicator.BorderSizePixel = 0
    ActiveIndicator.Visible = false
    ActiveIndicator.Parent = TabButton
    
    local IndicatorCorner = Instance.new("UICorner")
    IndicatorCorner.CornerRadius = UDim.new(0, 2)
    IndicatorCorner.Parent = ActiveIndicator
    
    -- Tab İçerik Sayfası
    local TabContent = Instance.new("ScrollingFrame")
    TabContent.Name = tabName .. "_Content"
    TabContent.Size = UDim2.new(1, -20, 1, -20)
    TabContent.Position = UDim2.new(0, 10, 0, 10)
    TabContent.BackgroundTransparency = 1
    TabContent.BorderSizePixel = 0
    TabContent.ScrollBarThickness = 3
    TabContent.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 100)
    TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabContent.Visible = false
    TabContent.Parent = ContentContainer
    
    local ContentList = Instance.new("UIListLayout")
    ContentList.Padding = UDim.new(0, 8)
    ContentList.SortOrder = Enum.SortOrder.LayoutOrder
    ContentList.Parent = TabContent
    
    ContentList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabContent.CanvasSize = UDim2.new(0, 0, 0, ContentList.AbsoluteContentSize.Y + 10)
    end)
    
    -- Tab Seçme Fonksiyonları
    local function SelectTab()
        for _, tab in pairs(Menu.Tabs) do
            tab.Button.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
            tab.Icon.ImageColor3 = Color3.fromRGB(140, 140, 150)
            tab.Label.TextColor3 = Color3.fromRGB(140, 140, 150)
            tab.Indicator.Visible = false
            tab.Content.Visible = false
        end
        
        TweenService:Create(TabButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 60)}):Play()
        TweenService:Create(TabIcon, TweenInfo.new(0.2), {ImageColor3 = Menu.AccentColor}):Play()
        TweenService:Create(TabLabel, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        ActiveIndicator.Visible = true
        TabContent.Visible = true
        Menu.CurrentTab = Tab
    end
    
    TabButton.MouseEnter:Connect(function()
        if Menu.CurrentTab ~= Tab then
            TweenService:Create(TabButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 50)}):Play()
        end
    end)
    
    TabButton.MouseLeave:Connect(function()
        if Menu.CurrentTab ~= Tab then
            TweenService:Create(TabButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 35, 45)}):Play()
        end
    end)
    
    TabButton.MouseButton1Click:Connect(SelectTab)
    
    Tab.Button = TabButton
    Tab.Icon = TabIcon
    Tab.Label = TabLabel
    Tab.Indicator = ActiveIndicator
    Tab.Content = TabContent
    Tab.Select = SelectTab
    
    -- ═══════════════════════════════════════════════════════════
    -- SECTION
    -- ═══════════════════════════════════════════════════════════
    function Tab:CreateSection(sectionName)
        local Section = Instance.new("Frame")
        Section.Size = UDim2.new(1, 0, 0, 28)
        Section.BackgroundTransparency = 1
        Section.BorderSizePixel = 0
        Section.Parent = TabContent
        
        local SectionLabel = Instance.new("TextLabel")
        SectionLabel.Size = UDim2.new(1, 0, 1, 0)
        SectionLabel.BackgroundTransparency = 1
        SectionLabel.Text = string.upper(sectionName)
        SectionLabel.TextColor3 = Color3.fromRGB(100, 100, 120)
        SectionLabel.TextSize = 11
        SectionLabel.Font = Enum.Font.GothamBold
        SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
        SectionLabel.Parent = Section
        
        local SectionLine = Instance.new("Frame")
        SectionLine.Size = UDim2.new(1, -80, 0, 1)
        SectionLine.Position = UDim2.new(0, 75, 0.5, 0)
        SectionLine.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        SectionLine.BorderSizePixel = 0
        SectionLine.Parent = Section
    end
    
    -- ═══════════════════════════════════════════════════════════
    -- TOGGLE
    -- ═══════════════════════════════════════════════════════════
    function Tab:CreateToggle(name, default, callback)
        local Toggle = {Value = default or false, Callback = callback or function() end}
        
        local ToggleFrame = Instance.new("Frame")
        ToggleFrame.Size = UDim2.new(1, 0, 0, 38)
        ToggleFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        ToggleFrame.BorderSizePixel = 0
        ToggleFrame.Parent = TabContent
        
        local ToggleCorner = Instance.new("UICorner")
        ToggleCorner.CornerRadius = UDim.new(0, 6)
        ToggleCorner.Parent = ToggleFrame
        
        local ToggleLabel = Instance.new("TextLabel")
        ToggleLabel.Size = UDim2.new(1, -70, 1, 0)
        ToggleLabel.Position = UDim2.new(0, 12, 0, 0)
        ToggleLabel.BackgroundTransparency = 1
        ToggleLabel.Text = name
        ToggleLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
        ToggleLabel.TextSize = 13
        ToggleLabel.Font = Enum.Font.Gotham
        ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
        ToggleLabel.Parent = ToggleFrame
        
        local ToggleButton = Instance.new("TextButton")
        ToggleButton.Size = UDim2.new(0, 42, 0, 22)
        ToggleButton.Position = UDim2.new(1, -52, 0.5, -11)
        ToggleButton.BackgroundColor3 = Toggle.Value and Menu.AccentColor or Color3.fromRGB(50, 50, 60)
        ToggleButton.BorderSizePixel = 0
        ToggleButton.Text = ""
        ToggleButton.AutoButtonColor = false
        ToggleButton.Parent = ToggleFrame
        
        local ToggleBtnCorner = Instance.new("UICorner")
        ToggleBtnCorner.CornerRadius = UDim.new(1, 0)
        ToggleBtnCorner.Parent = ToggleButton
        
        local Circle = Instance.new("Frame")
        Circle.Size = UDim2.new(0, 16, 0, 16)
        Circle.Position = Toggle.Value and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
        Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Circle.BorderSizePixel = 0
        Circle.Parent = ToggleButton
        
        local CircleCorner = Instance.new("UICorner")
        CircleCorner.CornerRadius = UDim.new(1, 0)
        CircleCorner.Parent = Circle
        
        function Toggle:SetValue(value)
            Toggle.Value = value
            TweenService:Create(ToggleButton, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
                BackgroundColor3 = value and Menu.AccentColor or Color3.fromRGB(50, 50, 60)
            }):Play()
            TweenService:Create(Circle, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
                Position = value and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
            }):Play()
            Toggle.Callback(value)
        end
        
        ToggleButton.MouseButton1Click:Connect(function()
            Toggle:SetValue(not Toggle.Value)
        end)
        
        ToggleFrame.MouseEnter:Connect(function()
            TweenService:Create(ToggleFrame, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(40, 40, 52)}):Play()
        end)
        
        ToggleFrame.MouseLeave:Connect(function()
            TweenService:Create(ToggleFrame, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(35, 35, 45)}):Play()
        end)
        
        return Toggle
    end
    
    -- ═══════════════════════════════════════════════════════════
    -- SLIDER
    -- ═══════════════════════════════════════════════════════════
    function Tab:CreateSlider(name, min, max, default, suffix, callback)
        local Slider = {Value = default or min, Min = min, Max = max, Suffix = suffix or "", Callback = callback or function() end}
        
        local SliderFrame = Instance.new("Frame")
        SliderFrame.Size = UDim2.new(1, 0, 0, 50)
        SliderFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        SliderFrame.BorderSizePixel = 0
        SliderFrame.Parent = TabContent
        
        local SliderCorner = Instance.new("UICorner")
        SliderCorner.CornerRadius = UDim.new(0, 6)
        SliderCorner.Parent = SliderFrame
        
        local SliderLabel = Instance.new("TextLabel")
        SliderLabel.Size = UDim2.new(1, -70, 0, 20)
        SliderLabel.Position = UDim2.new(0, 12, 0, 6)
        SliderLabel.BackgroundTransparency = 1
        SliderLabel.Text = name
        SliderLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
        SliderLabel.TextSize = 13
        SliderLabel.Font = Enum.Font.Gotham
        SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
        SliderLabel.Parent = SliderFrame
        
        local SliderValue = Instance.new("TextLabel")
        SliderValue.Size = UDim2.new(0, 55, 0, 20)
        SliderValue.Position = UDim2.new(1, -65, 0, 6)
        SliderValue.BackgroundTransparency = 1
        SliderValue.Text = Slider.Value .. Slider.Suffix
        SliderValue.TextColor3 = Menu.AccentColor
        SliderValue.TextSize = 12
        SliderValue.Font = Enum.Font.GothamBold
        SliderValue.TextXAlignment = Enum.TextXAlignment.Right
        SliderValue.Parent = SliderFrame
        
        local SliderBG = Instance.new("Frame")
        SliderBG.Size = UDim2.new(1, -24, 0, 6)
        SliderBG.Position = UDim2.new(0, 12, 1, -16)
        SliderBG.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        SliderBG.BorderSizePixel = 0
        SliderBG.Parent = SliderFrame
        
        local SliderBGCorner = Instance.new("UICorner")
        SliderBGCorner.CornerRadius = UDim.new(1, 0)
        SliderBGCorner.Parent = SliderBG
        
        local SliderBar = Instance.new("Frame")
        SliderBar.Size = UDim2.new((Slider.Value - min) / (max - min), 0, 1, 0)
        SliderBar.BackgroundColor3 = Menu.AccentColor
        SliderBar.BorderSizePixel = 0
        SliderBar.Parent = SliderBG
        
        local SliderBarCorner = Instance.new("UICorner")
        SliderBarCorner.CornerRadius = UDim.new(1, 0)
        SliderBarCorner.Parent = SliderBar
        
        local SliderKnob = Instance.new("Frame")
        SliderKnob.Size = UDim2.new(0, 14, 0, 14)
        SliderKnob.Position = UDim2.new(1, -7, 0.5, -7)
        SliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderKnob.BorderSizePixel = 0
        SliderKnob.Parent = SliderBar
        
        local KnobCorner = Instance.new("UICorner")
        KnobCorner.CornerRadius = UDim.new(1, 0)
        KnobCorner.Parent = SliderKnob
        
        local Dragging = false
        
        function Slider:SetValue(value)
            value = math.clamp(value, min, max)
            Slider.Value = math.floor(value)
            SliderValue.Text = Slider.Value .. Slider.Suffix
            TweenService:Create(SliderBar, TweenInfo.new(0.1), {
                Size = UDim2.new((Slider.Value - min) / (max - min), 0, 1, 0)
            }):Play()
            Slider.Callback(Slider.Value)
        end
        
        SliderBG.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dragging = true
            end
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dragging = false
            end
        end)
        
        RunService.RenderStepped:Connect(function()
            if Dragging then
                local mousePos = UserInputService:GetMouseLocation().X
                local relativePos = mousePos - SliderBG.AbsolutePosition.X
                local percentage = math.clamp(relativePos / SliderBG.AbsoluteSize.X, 0, 1)
                Slider:SetValue(min + (percentage * (max - min)))
            end
        end)
        
        SliderFrame.MouseEnter:Connect(function()
            TweenService:Create(SliderFrame, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(40, 40, 52)}):Play()
        end)
        
        SliderFrame.MouseLeave:Connect(function()
            TweenService:Create(SliderFrame, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(35, 35, 45)}):Play()
        end)
        
        return Slider
    end
    
    -- ═══════════════════════════════════════════════════════════
    -- BUTTON
    -- ═══════════════════════════════════════════════════════════
    function Tab:CreateButton(name, callback)
        local Button = {Callback = callback or function() end}
        
        local ButtonFrame = Instance.new("TextButton")
        ButtonFrame.Size = UDim2.new(1, 0, 0, 38)
        ButtonFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        ButtonFrame.BorderSizePixel = 0
        ButtonFrame.Text = ""
        ButtonFrame.AutoButtonColor = false
        ButtonFrame.ClipsDescendants = true
        ButtonFrame.Parent = TabContent
        
        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 6)
        ButtonCorner.Parent = ButtonFrame
        
        local ButtonLabel = Instance.new("TextLabel")
        ButtonLabel.Size = UDim2.new(1, -50, 1, 0)
        ButtonLabel.Position = UDim2.new(0, 12, 0, 0)
        ButtonLabel.BackgroundTransparency = 1
        ButtonLabel.Text = name
        ButtonLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
        ButtonLabel.TextSize = 13
        ButtonLabel.Font = Enum.Font.Gotham
        ButtonLabel.TextXAlignment = Enum.TextXAlignment.Left
        ButtonLabel.Parent = ButtonFrame
        
        local ButtonIcon = Instance.new("ImageLabel")
        ButtonIcon.Size = UDim2.new(0, 18, 0, 18)
        ButtonIcon.Position = UDim2.new(1, -30, 0.5, -9)
        ButtonIcon.BackgroundTransparency = 1
        ButtonIcon.Image = "rbxassetid://7733717447"
        ButtonIcon.ImageColor3 = Color3.fromRGB(120, 120, 140)
        ButtonIcon.Rotation = -90
        ButtonIcon.Parent = ButtonFrame
        
        ButtonFrame.MouseButton1Click:Connect(function()
            -- Click Animation
            TweenService:Create(ButtonFrame, TweenInfo.new(0.1), {BackgroundColor3 = Menu.AccentColor}):Play()
            task.delay(0.1, function()
                TweenService:Create(ButtonFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 35, 45)}):Play()
            end)
            Button.Callback()
        end)
        
        ButtonFrame.MouseEnter:Connect(function()
            TweenService:Create(ButtonFrame, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(40, 40, 52)}):Play()
            TweenService:Create(ButtonIcon, TweenInfo.new(0.15), {ImageColor3 = Menu.AccentColor}):Play()
        end)
        
        ButtonFrame.MouseLeave:Connect(function()
            TweenService:Create(ButtonFrame, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(35, 35, 45)}):Play()
            TweenService:Create(ButtonIcon, TweenInfo.new(0.15), {ImageColor3 = Color3.fromRGB(120, 120, 140)}):Play()
        end)
        
        return Button
    end
    
    -- ═══════════════════════════════════════════════════════════
    -- DROPDOWN
    -- ═══════════════════════════════════════════════════════════
    function Tab:CreateDropdown(name, options, default, callback)
        local Dropdown = {Value = default or options[1], Options = options, Callback = callback or function() end, Open = false}
        
        local DropdownFrame = Instance.new("Frame")
        DropdownFrame.Size = UDim2.new(1, 0, 0, 38)
        DropdownFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        DropdownFrame.BorderSizePixel = 0
        DropdownFrame.ClipsDescendants = true
        DropdownFrame.Parent = TabContent
        
        local DropdownCorner = Instance.new("UICorner")
        DropdownCorner.CornerRadius = UDim.new(0, 6)
        DropdownCorner.Parent = DropdownFrame
        
        local DropdownLabel = Instance.new("TextLabel")
        DropdownLabel.Size = UDim2.new(0.5, -10, 0, 38)
        DropdownLabel.Position = UDim2.new(0, 12, 0, 0)
        DropdownLabel.BackgroundTransparency = 1
        DropdownLabel.Text = name
        DropdownLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
        DropdownLabel.TextSize = 13
        DropdownLabel.Font = Enum.Font.Gotham
        DropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
        DropdownLabel.Parent = DropdownFrame
        
        local DropdownButton = Instance.new("TextButton")
        DropdownButton.Size = UDim2.new(0.45, -10, 0, 26)
        DropdownButton.Position = UDim2.new(0.55, 0, 0, 6)
        DropdownButton.BackgroundColor3 = Color3.fromRGB(45, 45, 58)
        DropdownButton.BorderSizePixel = 0
        DropdownButton.Text = ""
        DropdownButton.AutoButtonColor = false
        DropdownButton.Parent = DropdownFrame
        
        local DropBtnCorner = Instance.new("UICorner")
        DropBtnCorner.CornerRadius = UDim.new(0, 4)
        DropBtnCorner.Parent = DropdownButton
        
        local DropdownText = Instance.new("TextLabel")
        DropdownText.Size = UDim2.new(1, -25, 1, 0)
        DropdownText.Position = UDim2.new(0, 10, 0, 0)
        DropdownText.BackgroundTransparency = 1
        DropdownText.Text = Dropdown.Value
        DropdownText.TextColor3 = Color3.fromRGB(200, 200, 210)
        DropdownText.TextSize = 12
        DropdownText.Font = Enum.Font.Gotham
        DropdownText.TextXAlignment = Enum.TextXAlignment.Left
        DropdownText.TextTruncate = Enum.TextTruncate.AtEnd
        DropdownText.Parent = DropdownButton
        
        local DropdownArrow = Instance.new("ImageLabel")
        DropdownArrow.Size = UDim2.new(0, 14, 0, 14)
        DropdownArrow.Position = UDim2.new(1, -20, 0.5, -7)
        DropdownArrow.BackgroundTransparency = 1
        DropdownArrow.Image = "rbxassetid://7733717447"
        DropdownArrow.ImageColor3 = Color3.fromRGB(140, 140, 160)
        DropdownArrow.Rotation = 90
        DropdownArrow.Parent = DropdownButton
        
        local OptionsContainer = Instance.new("Frame")
        OptionsContainer.Size = UDim2.new(1, -20, 0, #options * 28 + 5)
        OptionsContainer.Position = UDim2.new(0, 10, 0, 42)
        OptionsContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 52)
        OptionsContainer.BorderSizePixel = 0
        OptionsContainer.ClipsDescendants = true
        OptionsContainer.Parent = DropdownFrame
        
        local OptionsCorner = Instance.new("UICorner")
        OptionsCorner.CornerRadius = UDim.new(0, 4)
        OptionsCorner.Parent = OptionsContainer
        
        local OptionsList = Instance.new("UIListLayout")
        OptionsList.Padding = UDim.new(0, 2)
        OptionsList.SortOrder = Enum.SortOrder.LayoutOrder
        OptionsList.Parent = OptionsContainer
        
        local OptionsPadding = Instance.new("UIPadding")
        OptionsPadding.PaddingTop = UDim.new(0, 3)
        OptionsPadding.PaddingLeft = UDim.new(0, 3)
        OptionsPadding.PaddingRight = UDim.new(0, 3)
        OptionsPadding.Parent = OptionsContainer
        
        local function CreateOption(optionText)
            local OptionButton = Instance.new("TextButton")
            OptionButton.Size = UDim2.new(1, 0, 0, 26)
            OptionButton.BackgroundColor3 = Color3.fromRGB(45, 45, 58)
            OptionButton.BorderSizePixel = 0
            OptionButton.Text = optionText
            OptionButton.TextColor3 = Color3.fromRGB(200, 200, 210)
            OptionButton.TextSize = 12
            OptionButton.Font = Enum.Font.Gotham
            OptionButton.AutoButtonColor = false
            OptionButton.Parent = OptionsContainer
            
            local OptionCorner = Instance.new("UICorner")
            OptionCorner.CornerRadius = UDim.new(0, 4)
            OptionCorner.Parent = OptionButton
            
            OptionButton.MouseButton1Click:Connect(function()
                Dropdown.Value = optionText
                DropdownText.Text = optionText
                Dropdown.Callback(optionText)
                Dropdown.Open = false
                TweenService:Create(DropdownFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {Size = UDim2.new(1, 0, 0, 38)}):Play()
                TweenService:Create(DropdownArrow, TweenInfo.new(0.2), {Rotation = 90}):Play()
            end)
            
            OptionButton.MouseEnter:Connect(function()
                TweenService:Create(OptionButton, TweenInfo.new(0.1), {BackgroundColor3 = Menu.AccentColor}):Play()
            end)
            
            OptionButton.MouseLeave:Connect(function()
                TweenService:Create(OptionButton, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(45, 45, 58)}):Play()
            end)
            
            return OptionButton
        end
        
        for _, option in ipairs(options) do
            CreateOption(option)
        end
        
        DropdownButton.MouseButton1Click:Connect(function()
            Dropdown.Open = not Dropdown.Open
            local targetSize = Dropdown.Open and UDim2.new(1, 0, 0, 48 + (#options * 28) + 5) or UDim2.new(1, 0, 0, 38)
            TweenService:Create(DropdownFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {Size = targetSize}):Play()
            TweenService:Create(DropdownArrow, TweenInfo.new(0.2), {Rotation = Dropdown.Open and 270 or 90}):Play()
        end)
        
        DropdownFrame.MouseEnter:Connect(function()
            TweenService:Create(DropdownFrame, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(40, 40, 52)}):Play()
        end)
        
        DropdownFrame.MouseLeave:Connect(function()
            TweenService:Create(DropdownFrame, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(35, 35, 45)}):Play()
        end)
        
        function Dropdown:SetValue(value)
            if table.find(Dropdown.Options, value) then
                Dropdown.Value = value
                DropdownText.Text = value
                Dropdown.Callback(value)
            end
        end
        
        function Dropdown:Refresh(newOptions)
            Dropdown.Options = newOptions
            for _, child in pairs(OptionsContainer:GetChildren()) do
                if child:IsA("TextButton") then child:Destroy() end
            end
            for _, option in ipairs(newOptions) do
                CreateOption(option)
            end
            OptionsContainer.Size = UDim2.new(1, -20, 0, #newOptions * 28 + 5)
        end
        
        return Dropdown
    end
    
    -- ═══════════════════════════════════════════════════════════
    -- TEXTBOX
    -- ═══════════════════════════════════════════════════════════
    function Tab:CreateTextbox(name, placeholder, callback)
        local Textbox = {Value = "", Callback = callback or function() end}
        
        local TextboxFrame = Instance.new("Frame")
        TextboxFrame.Size = UDim2.new(1, 0, 0, 38)
        TextboxFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        TextboxFrame.BorderSizePixel = 0
        TextboxFrame.Parent = TabContent
        
        local TextboxCorner = Instance.new("UICorner")
        TextboxCorner.CornerRadius = UDim.new(0, 6)
        TextboxCorner.Parent = TextboxFrame
        
        local TextboxLabel = Instance.new("TextLabel")
        TextboxLabel.Size = UDim2.new(0.4, -10, 1, 0)
        TextboxLabel.Position = UDim2.new(0, 12, 0, 0)
        TextboxLabel.BackgroundTransparency = 1
        TextboxLabel.Text = name
        TextboxLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
        TextboxLabel.TextSize = 13
        TextboxLabel.Font = Enum.Font.Gotham
        TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextboxLabel.Parent = TextboxFrame
        
        local InputBox = Instance.new("TextBox")
        InputBox.Size = UDim2.new(0.55, -10, 0, 26)
        InputBox.Position = UDim2.new(0.45, 0, 0.5, -13)
        InputBox.BackgroundColor3 = Color3.fromRGB(45, 45, 58)
        InputBox.BorderSizePixel = 0
        InputBox.Text = ""
        InputBox.PlaceholderText = placeholder or "Enter text..."
        InputBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 120)
        InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        InputBox.TextSize = 12
        InputBox.Font = Enum.Font.Gotham
        InputBox.ClearTextOnFocus = false
        InputBox.Parent = TextboxFrame
        
        local InputCorner = Instance.new("UICorner")
        InputCorner.CornerRadius = UDim.new(0, 4)
        InputCorner.Parent = InputBox
        
        local InputPadding = Instance.new("UIPadding")
        InputPadding.PaddingLeft = UDim.new(0, 10)
        InputPadding.PaddingRight = UDim.new(0, 10)
        InputPadding.Parent = InputBox
        
        InputBox.Focused:Connect(function()
            TweenService:Create(InputBox, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(55, 55, 70)}):Play()
        end)
        
        InputBox.FocusLost:Connect(function(enterPressed)
            TweenService:Create(InputBox, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 58)}):Play()
            Textbox.Value = InputBox.Text
            Textbox.Callback(InputBox.Text, enterPressed)
        end)
        
        TextboxFrame.MouseEnter:Connect(function()
            TweenService:Create(TextboxFrame, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(40, 40, 52)}):Play()
        end)
        
        TextboxFrame.MouseLeave:Connect(function()
            TweenService:Create(TextboxFrame, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(35, 35, 45)}):Play()
        end)
        
        function Textbox:SetValue(value)
            InputBox.Text = value
            Textbox.Value = value
        end
        
        return Textbox
    end
    
    -- ═══════════════════════════════════════════════════════════
    -- KEYBIND
    -- ═══════════════════════════════════════════════════════════
    function Tab:CreateKeybind(name, default, callback)
        local Keybind = {Value = default or Enum.KeyCode.Unknown, Callback = callback or function() end, Listening = false}
        
        local KeybindFrame = Instance.new("Frame")
        KeybindFrame.Size = UDim2.new(1, 0, 0, 38)
        KeybindFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        KeybindFrame.BorderSizePixel = 0
        KeybindFrame.Parent = TabContent
        
        local KeybindCorner = Instance.new("UICorner")
        KeybindCorner.CornerRadius = UDim.new(0, 6)
        KeybindCorner.Parent = KeybindFrame
        
        local KeybindLabel = Instance.new("TextLabel")
        KeybindLabel.Size = UDim2.new(1, -90, 1, 0)
        KeybindLabel.Position = UDim2.new(0, 12, 0, 0)
        KeybindLabel.BackgroundTransparency = 1
        KeybindLabel.Text = name
        KeybindLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
        KeybindLabel.TextSize = 13
        KeybindLabel.Font = Enum.Font.Gotham
        KeybindLabel.TextXAlignment = Enum.TextXAlignment.Left
        KeybindLabel.Parent = KeybindFrame
        
        local KeybindButton = Instance.new("TextButton")
        KeybindButton.Size = UDim2.new(0, 65, 0, 26)
        KeybindButton.Position = UDim2.new(1, -75, 0.5, -13)
        KeybindButton.BackgroundColor3 = Color3.fromRGB(45, 45, 58)
        KeybindButton.BorderSizePixel = 0
        KeybindButton.Text = Keybind.Value.Name or "None"
        KeybindButton.TextColor3 = Color3.fromRGB(200, 200, 210)
        KeybindButton.TextSize = 11
        KeybindButton.Font = Enum.Font.GothamBold
        KeybindButton.AutoButtonColor = false
        KeybindButton.Parent = KeybindFrame
        
        local KeybindBtnCorner = Instance.new("UICorner")
        KeybindBtnCorner.CornerRadius = UDim.new(0, 4)
        KeybindBtnCorner.Parent = KeybindButton
        
        KeybindButton.MouseButton1Click:Connect(function()
            Keybind.Listening = true
            KeybindButton.Text = "..."
            TweenService:Create(KeybindButton, TweenInfo.new(0.2), {BackgroundColor3 = Menu.AccentColor}):Play()
        end)
        
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if Keybind.Listening then
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    Keybind.Value = input.KeyCode
                    KeybindButton.Text = input.KeyCode.Name
                    Keybind.Listening = false
                    TweenService:Create(KeybindButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 58)}):Play()
                elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
                    Keybind.Listening = false
                    KeybindButton.Text = Keybind.Value.Name or "None"
                    TweenService:Create(KeybindButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 58)}):Play()
                end
            elseif input.KeyCode == Keybind.Value and not gameProcessed then
                Keybind.Callback(Keybind.Value)
            end
        end)
        
        KeybindFrame.MouseEnter:Connect(function()
            TweenService:Create(KeybindFrame, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(40, 40, 52)}):Play()
        end)
        
        KeybindFrame.MouseLeave:Connect(function()
            TweenService:Create(KeybindFrame, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(35, 35, 45)}):Play()
        end)
        
        function Keybind:SetValue(key)
            Keybind.Value = key
            KeybindButton.Text = key.Name
        end
        
        return Keybind
    end
    
    -- ═══════════════════════════════════════════════════════════
    -- LABEL
    -- ═══════════════════════════════════════════════════════════
    function Tab:CreateLabel(text)
        local Label = {}
        
        local LabelFrame = Instance.new("Frame")
        LabelFrame.Size = UDim2.new(1, 0, 0, 28)
        LabelFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        LabelFrame.BorderSizePixel = 0
        LabelFrame.Parent = TabContent
        
        local LabelCorner = Instance.new("UICorner")
        LabelCorner.CornerRadius = UDim.new(0, 6)
        LabelCorner.Parent = LabelFrame
        
        local LabelText = Instance.new("TextLabel")
        LabelText.Size = UDim2.new(1, -20, 1, 0)
        LabelText.Position = UDim2.new(0, 12, 0, 0)
        LabelText.BackgroundTransparency = 1
        LabelText.Text = text
        LabelText.TextColor3 = Color3.fromRGB(160, 160, 180)
        LabelText.TextSize = 12
        LabelText.Font = Enum.Font.Gotham
        LabelText.TextXAlignment = Enum.TextXAlignment.Left
        LabelText.Parent = LabelFrame
        
        function Label:SetText(newText)
            LabelText.Text = newText
        end
        
        return Label
    end
    
    table.insert(Menu.Tabs, Tab)
    
    -- İlk tab'ı seç
    if #Menu.Tabs == 1 then
        Tab.Select()
    end
    
    return Tab
end

-- ═══════════════════════════════════════════════════════════
-- NOTIFICATION SYSTEM
-- ═══════════════════════════════════════════════════════════
function Menu:Notify(title, message, duration)
    duration = duration or 3
    
    local NotifContainer = ScreenGui:FindFirstChild("NotifContainer")
    if not NotifContainer then
        NotifContainer = Instance.new("Frame")
        NotifContainer.Name = "NotifContainer"
        NotifContainer.Size = UDim2.new(0, 280, 1, -20)
        NotifContainer.Position = UDim2.new(1, -290, 0, 10)
        NotifContainer.BackgroundTransparency = 1
        NotifContainer.Parent = ScreenGui
        
        local NotifList = Instance.new("UIListLayout")
        NotifList.Padding = UDim.new(0, 8)
        NotifList.SortOrder = Enum.SortOrder.LayoutOrder
        NotifList.VerticalAlignment = Enum.VerticalAlignment.Bottom
        NotifList.Parent = NotifContainer
    end
    
    local Notification = Instance.new("Frame")
    Notification.Size = UDim2.new(1, 0, 0, 65)
    Notification.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
    Notification.BorderSizePixel = 0
    Notification.ClipsDescendants = true
    Notification.Parent = NotifContainer
    
    local NotifCorner = Instance.new("UICorner")
    NotifCorner.CornerRadius = UDim.new(0, 8)
    NotifCorner.Parent = Notification
    
    local NotifStroke = Instance.new("UIStroke")
    NotifStroke.Thickness = 1
    NotifStroke.Color = Menu.AccentColor
    NotifStroke.Transparency = 0.5
    NotifStroke.Parent = Notification
    
    local AccentBar = Instance.new("Frame")
    AccentBar.Size = UDim2.new(0, 4, 1, -10)
    AccentBar.Position = UDim2.new(0, 5, 0, 5)
    AccentBar.BackgroundColor3 = Menu.AccentColor
    AccentBar.BorderSizePixel = 0
    AccentBar.Parent = Notification
    
    local AccentBarCorner = Instance.new("UICorner")
    AccentBarCorner.CornerRadius = UDim.new(0, 2)
    AccentBarCorner.Parent = AccentBar
    
    local NotifTitle = Instance.new("TextLabel")
    NotifTitle.Size = UDim2.new(1, -25, 0, 22)
    NotifTitle.Position = UDim2.new(0, 18, 0, 8)
    NotifTitle.BackgroundTransparency = 1
    NotifTitle.Text = title
    NotifTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotifTitle.TextSize = 13
    NotifTitle.Font = Enum.Font.GothamBold
    NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
    NotifTitle.Parent = Notification
    
    local NotifMessage = Instance.new("TextLabel")
    NotifMessage.Size = UDim2.new(1, -25, 0, 28)
    NotifMessage.Position = UDim2.new(0, 18, 0, 28)
    NotifMessage.BackgroundTransparency = 1
    NotifMessage.Text = message
    NotifMessage.TextColor3 = Color3.fromRGB(160, 160, 180)
    NotifMessage.TextSize = 11
    NotifMessage.Font = Enum.Font.Gotham
    NotifMessage.TextXAlignment = Enum.TextXAlignment.Left
    NotifMessage.TextWrapped = true
    NotifMessage.Parent = Notification
    
    local ProgressBar = Instance.new("Frame")
    ProgressBar.Size = UDim2.new(1, 0, 0, 2)
    ProgressBar.Position = UDim2.new(0, 0, 1, -2)
    ProgressBar.BackgroundColor3 = Menu.AccentColor
    ProgressBar.BorderSizePixel = 0
    ProgressBar.Parent = Notification
    
    -- Slide in
    Notification.Position = UDim2.new(1, 20, 0, 0)
    TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
        Position = UDim2.new(0, 0, 0, 0)
    }):Play()
    
    -- Progress
    TweenService:Create(ProgressBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
        Size = UDim2.new(0, 0, 0, 2)
    }):Play()
    
    -- Remove
    task.delay(duration, function()
        TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
            Position = UDim2.new(1, 20, 0, 0)
        }):Play()
        task.delay(0.3, function()
            Notification:Destroy()
        end)
    end)
end

-- Toggle GUI with Key
local guiVisible = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightControl then
        guiVisible = not guiVisible
        if guiVisible then
            MainContainer.Visible = true
            TweenService:Create(MainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Size = originalSize,
                Position = UDim2.new(0.5, -275, 0.5, -200)
            }):Play()
        else
            TweenService:Create(MainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }):Play()
            task.delay(0.3, function()
                MainContainer.Visible = false
            end)
        end
    end
end)

-- Intro Animation
MainContainer.Size = UDim2.new(0, 0, 0, 0)
MainContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
MainContainer.BackgroundTransparency = 1

task.delay(0.1, function()
    TweenService:Create(MainContainer, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
        Size = UDim2.new(0, 550, 0, 400),
        Position = UDim2.new(0.5, -275, 0.5, -200),
        BackgroundTransparency = 0
    }):Play()
end)

return Menu
