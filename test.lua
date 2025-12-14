--// Primordial Style GUI - Professional & Animated
--// Made with ❤️

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local UserType = Player.Name

-- Ana ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PrimordialUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.CoreGui

-- Ana Container
local MainContainer = Instance.new("Frame")
MainContainer.Name = "MainContainer"
MainContainer.Size = UDim2.new(0, 700, 0, 450)
MainContainer.Position = UDim2.new(0.5, -350, 0.5, -225)
MainContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainContainer.BorderSizePixel = 0
MainContainer.ClipsDescendants = true
MainContainer.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainContainer

-- Gölge Efekti
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.Position = UDim2.new(0, -15, 0, -15)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://5554236805"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.7
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(23, 23, 277, 277)
Shadow.ZIndex = 0
Shadow.Parent = MainContainer

-- Üst Header Bar
local HeaderBar = Instance.new("Frame")
HeaderBar.Name = "HeaderBar"
HeaderBar.Size = UDim2.new(1, 0, 0, 50)
HeaderBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
HeaderBar.BorderSizePixel = 0
HeaderBar.Parent = MainContainer

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 10)
HeaderCorner.Parent = HeaderBar

-- Logo
local LogoIcon = Instance.new("ImageLabel")
LogoIcon.Name = "Logo"
LogoIcon.Size = UDim2.new(0, 30, 0, 30)
LogoIcon.Position = UDim2.new(0, 15, 0, 10)
LogoIcon.BackgroundTransparency = 1
LogoIcon.Image = "rbxassetid://7733779610"
LogoIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
LogoIcon.Parent = HeaderBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "Title"
TitleLabel.Size = UDim2.new(1, -60, 1, 0)
TitleLabel.Position = UDim2.new(0, 50, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "example"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 18
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = HeaderBar

-- Sidebar
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 140, 1, -50)
Sidebar.Position = UDim2.new(0, 0, 0, 50)
Sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainContainer

local SidebarList = Instance.new("UIListLayout")
SidebarList.Padding = UDim.new(0, 5)
SidebarList.SortOrder = Enum.SortOrder.LayoutOrder
SidebarList.Parent = Sidebar

local SidebarPadding = Instance.new("UIPadding")
SidebarPadding.PaddingTop = UDim.new(0, 10)
SidebarPadding.PaddingLeft = UDim.new(0, 10)
SidebarPadding.PaddingRight = UDim.new(0, 10)
SidebarPadding.Parent = Sidebar

-- İçerik Container
local ContentContainer = Instance.new("Frame")
ContentContainer.Name = "ContentContainer"
ContentContainer.Size = UDim2.new(1, -150, 1, -60)
ContentContainer.Position = UDim2.new(0, 145, 0, 55)
ContentContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ContentContainer.BorderSizePixel = 0
ContentContainer.Parent = MainContainer

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 8)
ContentCorner.Parent = ContentContainer

-- Alt Navigation Bar
local NavBar = Instance.new("Frame")
NavBar.Name = "NavBar"
NavBar.Size = UDim2.new(1, -20, 0, 50)
NavBar.Position = UDim2.new(0, 10, 1, -60)
NavBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
NavBar.BorderSizePixel = 0
NavBar.Parent = MainContainer

local NavCorner = Instance.new("UICorner")
NavCorner.CornerRadius = UDim.new(0, 8)
NavCorner.Parent = NavBar

local NavList = Instance.new("UIListLayout")
NavList.FillDirection = Enum.FillDirection.Horizontal
NavList.Padding = UDim.new(0, 10)
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

-- Menu Library
local Menu = {}
Menu.Tabs = {}
Menu.CurrentTab = nil

-- Navigation butonları
local navButtons = {
    {Icon = "rbxassetid://7733920644", Name = "Example"},
    {Icon = "rbxassetid://7733954760", Name = "Example"},
    {Icon = "rbxassetid://7734021200", Name = "Example"},
    {Icon = "rbxassetid://7734042071", Name = "Example"},
    {Icon = "rbxassetid://7734056470", Name = "Example"},
    {Icon = "rbxassetid://7743871002", Name = "Example"}
}

for i, btnData in ipairs(navButtons) do
    local NavButton = Instance.new("TextButton")
    NavButton.Name = btnData.Name
    NavButton.Size = UDim2.new(0, 40, 0, 40)
    NavButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    NavButton.BorderSizePixel = 0
    NavButton.Text = ""
    NavButton.AutoButtonColor = false
    NavButton.Parent = NavBar
    
    local NavBtnCorner = Instance.new("UICorner")
    NavBtnCorner.CornerRadius = UDim.new(0, 6)
    NavBtnCorner.Parent = NavButton
    
    local NavIcon = Instance.new("ImageLabel")
    NavIcon.Size = UDim2.new(0, 24, 0, 24)
    NavIcon.Position = UDim2.new(0.5, -12, 0.5, -12)
    NavIcon.BackgroundTransparency = 1
    NavIcon.Image = btnData.Icon
    NavIcon.ImageColor3 = Color3.fromRGB(180, 180, 180)
    NavIcon.Parent = NavButton
    
    NavButton.MouseEnter:Connect(function()
        TweenService:Create(NavButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
        TweenService:Create(NavIcon, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    end)
    
    NavButton.MouseLeave:Connect(function()
        TweenService:Create(NavButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
        TweenService:Create(NavIcon, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(180, 180, 180)}):Play()
    end)
end

-- Tab oluşturma
function Menu:CreateTab(tabName, subtitle)
    local Tab = {}
    Tab.Name = tabName
    Tab.Subtitle = subtitle or "example text"
    
    local TabButton = Instance.new("TextButton")
    TabButton.Name = tabName
    TabButton.Size = UDim2.new(1, -10, 0, 40)
    TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TabButton.BorderSizePixel = 0
    TabButton.Text = ""
    TabButton.AutoButtonColor = false
    TabButton.Parent = Sidebar
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 6)
    TabCorner.Parent = TabButton
    
    local TabLabel = Instance.new("TextLabel")
    TabLabel.Size = UDim2.new(1, -10, 0, 16)
    TabLabel.Position = UDim2.new(0, 5, 0, 5)
    TabLabel.BackgroundTransparency = 1
    TabLabel.Text = tabName
    TabLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    TabLabel.TextSize = 13
    TabLabel.Font = Enum.Font.GothamSemibold
    TabLabel.TextXAlignment = Enum.TextXAlignment.Left
    TabLabel.Parent = TabButton
    
    local TabSubtitle = Instance.new("TextLabel")
    TabSubtitle.Size = UDim2.new(1, -10, 0, 14)
    TabSubtitle.Position = UDim2.new(0, 5, 0, 22)
    TabSubtitle.BackgroundTransparency = 1
    TabSubtitle.Text = Tab.Subtitle
    TabSubtitle.TextColor3 = Color3.fromRGB(120, 120, 120)
    TabSubtitle.TextSize = 11
    TabSubtitle.Font = Enum.Font.Gotham
    TabSubtitle.TextXAlignment = Enum.TextXAlignment.Left
    TabSubtitle.Parent = TabButton
    
    local TabContent = Instance.new("ScrollingFrame")
    TabContent.Name = tabName .. "_Content"
    TabContent.Size = UDim2.new(1, -20, 1, -20)
    TabContent.Position = UDim2.new(0, 10, 0, 10)
    TabContent.BackgroundTransparency = 1
    TabContent.BorderSizePixel = 0
    TabContent.ScrollBarThickness = 4
    TabContent.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
    TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabContent.Visible = false
    TabContent.Parent = ContentContainer
    
    local ContentList = Instance.new("UIListLayout")
    ContentList.Padding = UDim.new(0, 10)
    ContentList.SortOrder = Enum.SortOrder.LayoutOrder
    ContentList.Parent = TabContent
    
    ContentList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabContent.CanvasSize = UDim2.new(0, 0, 0, ContentList.AbsoluteContentSize.Y + 20)
    end)
    
    TabButton.MouseEnter:Connect(function()
        if Menu.CurrentTab ~= Tab then
            TweenService:Create(TabButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
        end
    end)
    
    TabButton.MouseLeave:Connect(function()
        if Menu.CurrentTab ~= Tab then
            TweenService:Create(TabButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}):Play()
        end
    end)
    
    TabButton.MouseButton1Click:Connect(function()
        for _, tab in pairs(Menu.Tabs) do
            tab.Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            tab.Content.Visible = false
        end
        TabButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
        TabContent.Visible = true
        Menu.CurrentTab = Tab
    end)
    
    Tab.Button = TabButton
    Tab.Content = TabContent
    
    function Tab:CreateSection(sectionName)
        local Section = Instance.new("Frame")
        Section.Size = UDim2.new(1, 0, 0, 35)
        Section.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        Section.BorderSizePixel = 0
        Section.Parent = TabContent
        
        local SectionCorner = Instance.new("UICorner")
        SectionCorner.CornerRadius = UDim.new(0, 6)
        SectionCorner.Parent = Section
        
        local SectionLabel = Instance.new("TextLabel")
        SectionLabel.Size = UDim2.new(1, -20, 1, 0)
        SectionLabel.Position = UDim2.new(0, 15, 0, 0)
        SectionLabel.BackgroundTransparency = 1
        SectionLabel.Text = sectionName
        SectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        SectionLabel.TextSize = 14
        SectionLabel.Font = Enum.Font.GothamBold
        SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
        SectionLabel.Parent = Section
    end
    
    function Tab:CreateToggle(name, default, callback)
        local Toggle = {Value = default or false, Callback = callback or function() end}
        
        local ToggleFrame = Instance.new("Frame")
        ToggleFrame.Size = UDim2.new(1, 0, 0, 40)
        ToggleFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        ToggleFrame.BorderSizePixel = 0
        ToggleFrame.Parent = TabContent
        
        local ToggleCorner = Instance.new("UICorner")
        ToggleCorner.CornerRadius = UDim.new(0, 6)
        ToggleCorner.Parent = ToggleFrame
        
        local ToggleLabel = Instance.new("TextLabel")
        ToggleLabel.Size = UDim2.new(1, -70, 1, 0)
        ToggleLabel.Position = UDim2.new(0, 15, 0, 0)
        ToggleLabel.BackgroundTransparency = 1
        ToggleLabel.Text = name
        ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        ToggleLabel.TextSize = 13
        ToggleLabel.Font = Enum.Font.Gotham
        ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
        ToggleLabel.Parent = ToggleFrame
        
        local ToggleButton = Instance.new("TextButton")
        ToggleButton.Size = UDim2.new(0, 45, 0, 22)
        ToggleButton.Position = UDim2.new(1, -55, 0.5, -11)
        ToggleButton.BackgroundColor3 = Toggle.Value and Color3.fromRGB(70, 130, 255) or Color3.fromRGB(50, 50, 50)
        ToggleButton.BorderSizePixel = 0
        ToggleButton.Text = ""
        ToggleButton.AutoButtonColor = false
        ToggleButton.Parent = ToggleFrame
        
        local ToggleBtnCorner = Instance.new("UICorner")
        ToggleBtnCorner.CornerRadius = UDim.new(1, 0)
        ToggleBtnCorner.Parent = ToggleButton
        
        local Circle = Instance.new("Frame")
        Circle.Size = UDim2.new(0, 18, 0, 18)
        Circle.Position = Toggle.Value and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
        Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Circle.BorderSizePixel = 0
        Circle.Parent = ToggleButton
        
        local CircleCorner = Instance.new("UICorner")
        CircleCorner.CornerRadius = UDim.new(1, 0)
        CircleCorner.Parent = Circle
        
        function Toggle:SetValue(value)
            Toggle.Value = value
            TweenService:Create(ToggleButton, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                BackgroundColor3 = value and Color3.fromRGB(70, 130, 255) or Color3.fromRGB(50, 50, 50)
            }):Play()
            TweenService:Create(Circle, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Position = value and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
            }):Play()
            Toggle.Callback(value)
        end
        
        ToggleButton.MouseButton1Click:Connect(function()
            Toggle:SetValue(not Toggle.Value)
        end)
        
        ToggleFrame.MouseEnter:Connect(function()
            TweenService:Create(ToggleFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
        end)
        
        ToggleFrame.MouseLeave:Connect(function()
            TweenService:Create(ToggleFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
        end)
        
        return Toggle
    end
    
    function Tab:CreateSlider(name, min, max, default, suffix, callback)
        local Slider = {Value = default or min, Min = min, Max = max, Suffix = suffix or "", Callback = callback or function() end}
        
        local SliderFrame = Instance.new("Frame")
        SliderFrame.Size = UDim2.new(1, 0, 0, 55)
        SliderFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        SliderFrame.BorderSizePixel = 0
        SliderFrame.Parent = TabContent
        
        local SliderCorner = Instance.new("UICorner")
        SliderCorner.CornerRadius = UDim.new(0, 6)
        SliderCorner.Parent = SliderFrame
        
        local SliderLabel = Instance.new("TextLabel")
        SliderLabel.Size = UDim2.new(1, -20, 0, 20)
        SliderLabel.Position = UDim2.new(0, 15, 0, 8)
        SliderLabel.BackgroundTransparency = 1
        SliderLabel.Text = name
        SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        SliderLabel.TextSize = 13
        SliderLabel.Font = Enum.Font.Gotham
        SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
        SliderLabel.Parent = SliderFrame
        
        local SliderValue = Instance.new("TextLabel")
        SliderValue.Size = UDim2.new(0, 60, 0, 20)
        SliderValue.Position = UDim2.new(1, -75, 0, 8)
        SliderValue.BackgroundTransparency = 1
        SliderValue.Text = Slider.Value .. Slider.Suffix
        SliderValue.TextColor3 = Color3.fromRGB(70, 130, 255)
        SliderValue.TextSize = 13
        SliderValue.Font = Enum.Font.GothamBold
        SliderValue.TextXAlignment = Enum.TextXAlignment.Right
        SliderValue.Parent = SliderFrame
        
        local SliderBG = Instance.new("Frame")
        SliderBG.Size = UDim2.new(1, -30, 0, 6)
        SliderBG.Position = UDim2.new(0, 15, 1, -18)
        SliderBG.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        SliderBG.BorderSizePixel = 0
        SliderBG.Parent = SliderFrame
        
        local SliderBGCorner = Instance.new("UICorner")
        SliderBGCorner.CornerRadius = UDim.new(1, 0)
        SliderBGCorner.Parent = SliderBG
        
        local SliderBar = Instance.new("Frame")
        SliderBar.Size = UDim2.new((Slider.Value - min) / (max - min), 0, 1, 0)
        SliderBar.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
        SliderBar.BorderSizePixel = 0
        SliderBar.Parent = SliderBG
        
        local SliderBarCorner = Instance.new("UICorner")
        SliderBarCorner.CornerRadius = UDim.new(1, 0)
        SliderBarCorner.Parent = SliderBar
        
        local Dragging = false
        
        function Slider:SetValue(value)
            value = math.clamp(value, min, max)
            Slider.Value = math.floor(value)
            SliderValue.Text = Slider.Value .. Slider.Suffix
            TweenService:Create(SliderBar, TweenInfo.new(0.15), {
                Size = UDim2.new((Slider.Value - min) / (max - min), 0, 1, 0)
            }):Play()
            Slider.Callback(Slider.Value)
        end
        
        SliderBG.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dragging = true
                local function Update()
                    local mousePos = UserInputService:GetMouseLocation().X
                    local relativePos = mousePos - SliderBG.AbsolutePosition.X
                    local percentage = math.clamp(relativePos / SliderBG.AbsoluteSize.X, 0, 1)
                    Slider:SetValue(min + (percentage * (max - min)))
                end
                Update()
                local connection = RunService.RenderStepped:Connect(function()
                    if Dragging then Update() else connection:Disconnect() end
                end)
            end
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then Dragging = false end
        end)
        
        SliderFrame.MouseEnter:Connect(function()
            TweenService:Create(SliderFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
        end)
        
        SliderFrame.MouseLeave:Connect(function()
            TweenService:Create(SliderFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
        end)
        
        return Slider
    end
    
    function Tab:CreateDropdown(name, options, default, callback)
        local Dropdown = {Value = default or options[1], Options = options, Callback = callback or function() end, Open = false}
        
        local DropdownFrame = Instance.new("Frame")
        DropdownFrame.Size = UDim2.new(1, 0, 0, 40)
        DropdownFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        DropdownFrame.BorderSizePixel = 0
        DropdownFrame.ClipsDescendants = true
        DropdownFrame.Parent = TabContent
        
        local DropdownCorner = Instance.new("UICorner")
        DropdownCorner.CornerRadius = UDim.new(0, 6)
        DropdownCorner.Parent = DropdownFrame
        
        local DropdownLabel = Instance.new("TextLabel")
        DropdownLabel.Size = UDim2.new(1, -50, 0, 40)
        DropdownLabel.Position = UDim2.new(0, 15, 0, 0)
        DropdownLabel.BackgroundTransparency = 1
        DropdownLabel.Text = name
        DropdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        DropdownLabel.TextSize = 13
        DropdownLabel.Font = Enum.Font.Gotham
        DropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
        DropdownLabel.Parent = DropdownFrame
        
        local DropdownButton = Instance.new("TextButton")
        DropdownButton.Size = UDim2.new(0, 90, 0, 26)
        DropdownButton.Position = UDim2.new(1, -100, 0, 7)
        DropdownButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        DropdownButton.BorderSizePixel = 0
        DropdownButton.Text = Dropdown.Value
        DropdownButton.TextColor3 = Color3.fromRGB(200, 200, 200)
        DropdownButton.TextSize = 12
        DropdownButton.Font = Enum.Font.Gotham
        DropdownButton.AutoButtonColor = false
        DropdownButton.Parent = DropdownFrame
        
        local DropBtnCorner = Instance.new("UICorner")
        DropBtnCorner.CornerRadius = UDim.new(0, 4)
        DropBtnCorner.Parent = DropdownButton
        
        local OptionsContainer = Instance.new("Frame")
        OptionsContainer.Size = UDim2.new(1, -20, 0, #options * 30)
        OptionsContainer.Position = UDim2.new(0, 10, 0, 45)
        OptionsContainer.BackgroundTransparency = 1
        OptionsContainer.Parent = DropdownFrame
        
        local OptionsList = Instance.new("UIListLayout")
        OptionsList.Padding = UDim.new(0, 2)
        OptionsList.Parent = OptionsContainer
        
        for _, option in ipairs(options) do
            local OptionButton = Instance.new("TextButton")
            OptionButton.Size = UDim2.new(1, 0, 0, 28)
            OptionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            OptionButton.BorderSizePixel = 0
            OptionButton.Text = option
            OptionButton.TextColor3 = Color3.fromRGB(200, 200, 200)
            OptionButton.TextSize = 12
            OptionButton.Font = Enum.Font.Gotham
            OptionButton.AutoButtonColor = false
            OptionButton.Parent = OptionsContainer
            
            local OptionCorner = Instance.new("UICorner")
            OptionCorner.CornerRadius = UDim.new(0, 4)
            OptionCorner.Parent = OptionButton
            
            OptionButton.MouseButton1Click:Connect(function()
                Dropdown.Value = option
                DropdownButton.Text = option
                Dropdown.Callback(option)
                Dropdown.Open = false
                TweenService:Create(DropdownFrame, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 40)}):Play()
            end)
            
            OptionButton.MouseEnter:Connect(function()
                TweenService:Create(OptionButton, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
            end)
            
            OptionButton.MouseLeave:Connect(function()
                TweenService:Create(OptionButton, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
            end)
        end
        
        DropdownButton.MouseButton1Click:Connect(function()
            Dropdown.Open = not Dropdown.Open
            local targetSize = Dropdown.Open and UDim2.new(1, 0, 0, 50 + (#options * 30)) or UDim2.new(1, 0, 0, 40)
            TweenService:Create(DropdownFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {Size = targetSize}):Play()
        end)
        
        DropdownFrame.MouseEnter:Connect(function()
            TweenService:Create(DropdownFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
        end)
        
        DropdownFrame.MouseLeave:Connect(function()
            TweenService:Create(DropdownFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
        end)
        
        function Dropdown:SetValue(value)
            if table.find(Dropdown.Options, value) then
                Dropdown.Value = value
                DropdownButton.Text = value
                Dropdown.Callback(value)
            end
        end
        
        function Dropdown:Refresh(newOptions)
            Dropdown.Options = newOptions
            for _, child in pairs(OptionsContainer:GetChildren()) do
                if child:IsA("TextButton") then child:Destroy() end
            end
            for _, option in ipairs(newOptions) do
                local OptionButton = Instance.new("TextButton")
                OptionButton.Size = UDim2.new(1, 0, 0, 28)
                OptionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                OptionButton.BorderSizePixel = 0
                OptionButton.Text = option
                OptionButton.TextColor3 = Color3.fromRGB(200, 200, 200)
                OptionButton.TextSize = 12
                OptionButton.Font = Enum.Font.Gotham
                OptionButton.AutoButtonColor = false
                OptionButton.Parent = OptionsContainer
                
                local OptionCorner = Instance.new("UICorner")
                OptionCorner.CornerRadius = UDim.new(0, 4)
                OptionCorner.Parent = OptionButton
                
                OptionButton.MouseButton1Click:Connect(function()
                    Dropdown.Value = option
                    DropdownButton.Text = option
                    Dropdown.Callback(option)
                    Dropdown.Open = false
                    TweenService:Create(DropdownFrame, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 40)}):Play()
                end)
            end
            OptionsContainer.Size = UDim2.new(1, -20, 0, #newOptions * 30)
        end
        
        return Dropdown
    end
    
    function Tab:CreateButton(name, callback)
        local Button = {Callback = callback or function() end}
        
        local ButtonFrame = Instance.new("TextButton")
        ButtonFrame.Size = UDim2.new(1, 0, 0, 40)
        ButtonFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        ButtonFrame.BorderSizePixel = 0
        ButtonFrame.Text = ""
        ButtonFrame.AutoButtonColor = false
        ButtonFrame.Parent = TabContent
        
        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 6)
        ButtonCorner.Parent = ButtonFrame
        
        local ButtonLabel = Instance.new("TextLabel")
        ButtonLabel.Size = UDim2.new(1, -20, 1, 0)
        ButtonLabel.Position = UDim2.new(0, 15, 0, 0)
        ButtonLabel.BackgroundTransparency = 1
        ButtonLabel.Text = name
        ButtonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        ButtonLabel.TextSize = 13
        ButtonLabel.Font = Enum.Font.Gotham
        ButtonLabel.TextXAlignment = Enum.TextXAlignment.Left
        ButtonLabel.Parent = ButtonFrame
        
        local ButtonIcon = Instance.new("ImageLabel")
        ButtonIcon.Size = UDim2.new(0, 16, 0, 16)
        ButtonIcon.Position = UDim2.new(1, -30, 0.5, -8)
        ButtonIcon.BackgroundTransparency = 1
        ButtonIcon.Image = "rbxassetid://7733717447"
        ButtonIcon.ImageColor3 = Color3.fromRGB(150, 150, 150)
        ButtonIcon.Parent = ButtonFrame
        
        local Ripple = Instance.new("Frame")
        Ripple.Name = "Ripple"
        Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Ripple.BackgroundTransparency = 0.8
        Ripple.BorderSizePixel = 0
        Ripple.Parent = ButtonFrame
        Ripple.Visible = false
        
        local RippleCorner = Instance.new("UICorner")
        RippleCorner.CornerRadius = UDim.new(1, 0)
        RippleCorner.Parent = Ripple
        
        ButtonFrame.MouseButton1Click:Connect(function()
            -- Ripple Effect
            local mousePos = UserInputService:GetMouseLocation()
            local relativeX = mousePos.X - ButtonFrame.AbsolutePosition.X
            local relativeY = mousePos.Y - ButtonFrame.AbsolutePosition.Y - 36
            
            Ripple.Size = UDim2.new(0, 0, 0, 0)
            Ripple.Position = UDim2.new(0, relativeX, 0, relativeY)
            Ripple.Visible = true
            Ripple.BackgroundTransparency = 0.7
            
            TweenService:Create(Ripple, TweenInfo.new(0.5), {
                Size = UDim2.new(0, 200, 0, 200),
                Position = UDim2.new(0, relativeX - 100, 0, relativeY - 100),
                BackgroundTransparency = 1
            }):Play()
            
            task.delay(0.5, function()
                Ripple.Visible = false
            end)
            
            Button.Callback()
        end)
        
        ButtonFrame.MouseEnter:Connect(function()
            TweenService:Create(ButtonFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
            TweenService:Create(ButtonIcon, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(70, 130, 255)}):Play()
        end)
        
        ButtonFrame.MouseLeave:Connect(function()
            TweenService:Create(ButtonFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
            TweenService:Create(ButtonIcon, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(150, 150, 150)}):Play()
        end)
        
        return Button
    end
    
    function Tab:CreateTextbox(name, placeholder, callback)
        local Textbox = {Value = "", Callback = callback or function() end}
        
        local TextboxFrame = Instance.new("Frame")
        TextboxFrame.Size = UDim2.new(1, 0, 0, 40)
        TextboxFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        TextboxFrame.BorderSizePixel = 0
        TextboxFrame.Parent = TabContent
        
        local TextboxCorner = Instance.new("UICorner")
        TextboxCorner.CornerRadius = UDim.new(0, 6)
        TextboxCorner.Parent = TextboxFrame
        
        local TextboxLabel = Instance.new("TextLabel")
        TextboxLabel.Size = UDim2.new(0.5, -10, 1, 0)
        TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
        TextboxLabel.BackgroundTransparency = 1
        TextboxLabel.Text = name
        TextboxLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextboxLabel.TextSize = 13
        TextboxLabel.Font = Enum.Font.Gotham
        TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextboxLabel.Parent = TextboxFrame
        
        local InputBox = Instance.new("TextBox")
        InputBox.Size = UDim2.new(0.45, -10, 0, 26)
        InputBox.Position = UDim2.new(0.5, 5, 0.5, -13)
        InputBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        InputBox.BorderSizePixel = 0
        InputBox.Text = ""
        InputBox.PlaceholderText = placeholder or "Enter text..."
        InputBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
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
            TweenService:Create(InputBox, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
        end)
        
        InputBox.FocusLost:Connect(function(enterPressed)
            TweenService:Create(InputBox, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
            Textbox.Value = InputBox.Text
            Textbox.Callback(InputBox.Text, enterPressed)
        end)
        
        TextboxFrame.MouseEnter:Connect(function()
            TweenService:Create(TextboxFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
        end)
        
        TextboxFrame.MouseLeave:Connect(function()
            TweenService:Create(TextboxFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
        end)
        
        function Textbox:SetValue(value)
            InputBox.Text = value
            Textbox.Value = value
        end
        
        return Textbox
    end
    
    function Tab:CreateKeybind(name, default, callback)
        local Keybind = {Value = default or Enum.KeyCode.Unknown, Callback = callback or function() end, Listening = false}
        
        local KeybindFrame = Instance.new("Frame")
        KeybindFrame.Size = UDim2.new(1, 0, 0, 40)
        KeybindFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        KeybindFrame.BorderSizePixel = 0
        KeybindFrame.Parent = TabContent
        
        local KeybindCorner = Instance.new("UICorner")
        KeybindCorner.CornerRadius = UDim.new(0, 6)
        KeybindCorner.Parent = KeybindFrame
        
        local KeybindLabel = Instance.new("TextLabel")
        KeybindLabel.Size = UDim2.new(1, -100, 1, 0)
        KeybindLabel.Position = UDim2.new(0, 15, 0, 0)
        KeybindLabel.BackgroundTransparency = 1
        KeybindLabel.Text = name
        KeybindLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        KeybindLabel.TextSize = 13
        KeybindLabel.Font = Enum.Font.Gotham
        KeybindLabel.TextXAlignment = Enum.TextXAlignment.Left
        KeybindLabel.Parent = KeybindFrame
        
        local KeybindButton = Instance.new("TextButton")
        KeybindButton.Size = UDim2.new(0, 70, 0, 26)
        KeybindButton.Position = UDim2.new(1, -80, 0.5, -13)
        KeybindButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        KeybindButton.BorderSizePixel = 0
        KeybindButton.Text = Keybind.Value.Name or "None"
        KeybindButton.TextColor3 = Color3.fromRGB(200, 200, 200)
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
            TweenService:Create(KeybindButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 130, 255)}):Play()
        end)
        
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if Keybind.Listening then
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    Keybind.Value = input.KeyCode
                    KeybindButton.Text = input.KeyCode.Name
                    Keybind.Listening = false
                    TweenService:Create(KeybindButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
                elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
                    Keybind.Listening = false
                    KeybindButton.Text = Keybind.Value.Name or "None"
                    TweenService:Create(KeybindButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
                end
            elseif input.KeyCode == Keybind.Value and not gameProcessed then
                Keybind.Callback(Keybind.Value)
            end
        end)
        
        KeybindFrame.MouseEnter:Connect(function()
            TweenService:Create(KeybindFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
        end)
        
        KeybindFrame.MouseLeave:Connect(function()
            TweenService:Create(KeybindFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
        end)
        
        function Keybind:SetValue(key)
            Keybind.Value = key
            KeybindButton.Text = key.Name
        end
        
        return Keybind
    end
    
    function Tab:CreateLabel(text)
        local Label = {}
        
        local LabelFrame = Instance.new("Frame")
        LabelFrame.Size = UDim2.new(1, 0, 0, 30)
        LabelFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        LabelFrame.BorderSizePixel = 0
        LabelFrame.Parent = TabContent
        
        local LabelCorner = Instance.new("UICorner")
        LabelCorner.CornerRadius = UDim.new(0, 6)
        LabelCorner.Parent = LabelFrame
        
        local LabelText = Instance.new("TextLabel")
        LabelText.Size = UDim2.new(1, -20, 1, 0)
        LabelText.Position = UDim2.new(0, 10, 0, 0)
        LabelText.BackgroundTransparency = 1
        LabelText.Text = text
        LabelText.TextColor3 = Color3.fromRGB(180, 180, 180)
        LabelText.TextSize = 12
        LabelText.Font = Enum.Font.Gotham
        LabelText.TextXAlignment = Enum.TextXAlignment.Left
        LabelText.Parent = LabelFrame
        
        function Label:SetText(newText)
            LabelText.Text = newText
        end
        
        return Label
    end
    
    function Tab:CreateColorPicker(name, default, callback)
        local ColorPicker = {Value = default or Color3.fromRGB(255, 255, 255), Callback = callback or function() end, Open = false}
        
        local ColorFrame = Instance.new("Frame")
        ColorFrame.Size = UDim2.new(1, 0, 0, 40)
        ColorFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        ColorFrame.BorderSizePixel = 0
        ColorFrame.ClipsDescendants = true
        ColorFrame.Parent = TabContent
        
        local ColorCorner = Instance.new("UICorner")
        ColorCorner.CornerRadius = UDim.new(0, 6)
        ColorCorner.Parent = ColorFrame
        
        local ColorLabel = Instance.new("TextLabel")
        ColorLabel.Size = UDim2.new(1, -60, 0, 40)
        ColorLabel.Position = UDim2.new(0, 15, 0, 0)
        ColorLabel.BackgroundTransparency = 1
        ColorLabel.Text = name
        ColorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        ColorLabel.TextSize = 13
        ColorLabel.Font = Enum.Font.Gotham
        ColorLabel.TextXAlignment = Enum.TextXAlignment.Left
        ColorLabel.Parent = ColorFrame
        
        local ColorDisplay = Instance.new("TextButton")
        ColorDisplay.Size = UDim2.new(0, 35, 0, 22)
        ColorDisplay.Position = UDim2.new(1, -45, 0, 9)
        ColorDisplay.BackgroundColor3 = ColorPicker.Value
        ColorDisplay.BorderSizePixel = 0
        ColorDisplay.Text = ""
        ColorDisplay.AutoButtonColor = false
        ColorDisplay.Parent = ColorFrame
        
        local ColorDisplayCorner = Instance.new("UICorner")
        ColorDisplayCorner.CornerRadius = UDim.new(0, 4)
        ColorDisplayCorner.Parent = ColorDisplay
        
        -- Color Picker Panel
        local PickerPanel = Instance.new("Frame")
        PickerPanel.Size = UDim2.new(1, -20, 0, 120)
        PickerPanel.Position = UDim2.new(0, 10, 0, 45)
        PickerPanel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        PickerPanel.BorderSizePixel = 0
        PickerPanel.Parent = ColorFrame
        
        local PickerPanelCorner = Instance.new("UICorner")
        PickerPanelCorner.CornerRadius = UDim.new(0, 4)
        PickerPanelCorner.Parent = PickerPanel
        
        -- Saturation/Value Canvas
        local SVCanvas = Instance.new("ImageLabel")
        SVCanvas.Size = UDim2.new(0, 100, 0, 100)
        SVCanvas.Position = UDim2.new(0, 10, 0, 10)
        SVCanvas.BackgroundColor3 = Color3.fromHSV(0, 1, 1)
        SVCanvas.BorderSizePixel = 0
        SVCanvas.Image = "rbxassetid://4155801252"
        SVCanvas.Parent = PickerPanel
        
        local SVCanvasCorner = Instance.new("UICorner")
        SVCanvasCorner.CornerRadius = UDim.new(0, 4)
        SVCanvasCorner.Parent = SVCanvas
        
        local SVCursor = Instance.new("Frame")
        SVCursor.Size = UDim2.new(0, 10, 0, 10)
        SVCursor.Position = UDim2.new(1, -5, 0, -5)
        SVCursor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SVCursor.BorderSizePixel = 0
        SVCursor.Parent = SVCanvas
        
        local SVCursorCorner = Instance.new("UICorner")
        SVCursorCorner.CornerRadius = UDim.new(1, 0)
        SVCursorCorner.Parent = SVCursor
        
        local SVCursorStroke = Instance.new("UIStroke")
        SVCursorStroke.Thickness = 2
        SVCursorStroke.Color = Color3.fromRGB(0, 0, 0)
        SVCursorStroke.Parent = SVCursor
        
        -- Hue Slider
        local HueSlider = Instance.new("ImageLabel")
        HueSlider.Size = UDim2.new(0, 20, 0, 100)
        HueSlider.Position = UDim2.new(0, 120, 0, 10)
        HueSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        HueSlider.BorderSizePixel = 0
        HueSlider.Image = "rbxassetid://3641079629"
        HueSlider.Rotation = 180
        HueSlider.Parent = PickerPanel
        
        local HueSliderCorner = Instance.new("UICorner")
        HueSliderCorner.CornerRadius = UDim.new(0, 4)
        HueSliderCorner.Parent = HueSlider
        
        local HueCursor = Instance.new("Frame")
        HueCursor.Size = UDim2.new(1, 4, 0, 6)
        HueCursor.Position = UDim2.new(0, -2, 0, -3)
        HueCursor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        HueCursor.BorderSizePixel = 0
        HueCursor.Parent = HueSlider
        
        local HueCursorCorner = Instance.new("UICorner")
        HueCursorCorner.CornerRadius = UDim.new(0, 2)
        HueCursorCorner.Parent = HueCursor
        
        -- RGB Inputs
        local RGBContainer = Instance.new("Frame")
        RGBContainer.Size = UDim2.new(0, 100, 0, 100)
        RGBContainer.Position = UDim2.new(0, 150, 0, 10)
        RGBContainer.BackgroundTransparency = 1
        RGBContainer.Parent = PickerPanel
        
        local function CreateRGBInput(name, yPos, value)
            local Container = Instance.new("Frame")
            Container.Size = UDim2.new(1, 0, 0, 28)
            Container.Position = UDim2.new(0, 0, 0, yPos)
            Container.BackgroundTransparency = 1
            Container.Parent = RGBContainer
            
            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(0, 20, 1, 0)
            Label.BackgroundTransparency = 1
            Label.Text = name
            Label.TextColor3 = Color3.fromRGB(150, 150, 150)
            Label.TextSize = 11
            Label.Font = Enum.Font.GothamBold
            Label.Parent = Container
            
            local Input = Instance.new("TextBox")
            Input.Size = UDim2.new(0, 50, 0, 22)
            Input.Position = UDim2.new(0, 25, 0.5, -11)
            Input.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            Input.BorderSizePixel = 0
            Input.Text = tostring(value)
            Input.TextColor3 = Color3.fromRGB(255, 255, 255)
            Input.TextSize = 11
            Input.Font = Enum.Font.Gotham
            Input.Parent = Container
            
            local InputCorner = Instance.new("UICorner")
            InputCorner.CornerRadius = UDim.new(0, 4)
            InputCorner.Parent = Input
            
            return Input
        end
        
        local RInput = CreateRGBInput("R", 0, math.floor(ColorPicker.Value.R * 255))
        local GInput = CreateRGBInput("G", 32, math.floor(ColorPicker.Value.G * 255))
        local BInput = CreateRGBInput("B", 64, math.floor(ColorPicker.Value.B * 255))
        
        local H, S, V = 0, 1, 1
        
        local function UpdateColor()
            local newColor = Color3.fromHSV(H, S, V)
            ColorPicker.Value = newColor
            ColorDisplay.BackgroundColor3 = newColor
            SVCanvas.BackgroundColor3 = Color3.fromHSV(H, 1, 1)
            RInput.Text = tostring(math.floor(newColor.R * 255))
            GInput.Text = tostring(math.floor(newColor.G * 255))
            BInput.Text = tostring(math.floor(newColor.B * 255))
            ColorPicker.Callback(newColor)
        end
        
        local svDragging = false
        local hueDragging = false
        
        SVCanvas.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                svDragging = true
            end
        end)
        
        HueSlider.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                hueDragging = true
            end
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                svDragging = false
                hueDragging = false
            end
        end)
        
        RunService.RenderStepped:Connect(function()
            if svDragging then
                local mousePos = UserInputService:GetMouseLocation()
                local relX = math.clamp((mousePos.X - SVCanvas.AbsolutePosition.X) / SVCanvas.AbsoluteSize.X, 0, 1)
                local relY = math.clamp((mousePos.Y - SVCanvas.AbsolutePosition.Y - 36) / SVCanvas.AbsoluteSize.Y, 0, 1)
                S = relX
                V = 1 - relY
                SVCursor.Position = UDim2.new(relX, -5, relY, -5)
                UpdateColor()
            end
            
            if hueDragging then
                local mousePos = UserInputService:GetMouseLocation()
                local relY = math.clamp((mousePos.Y - HueSlider.AbsolutePosition.Y - 36) / HueSlider.AbsoluteSize.Y, 0, 1)
                H = 1 - relY
                HueCursor.Position = UDim2.new(0, -2, relY, -3)
                UpdateColor()
            end
        end)
        
        local function UpdateFromRGB()
            local r = math.clamp(tonumber(RInput.Text) or 0, 0, 255)
            local g = math.clamp(tonumber(GInput.Text) or 0, 0, 255)
            local b = math.clamp(tonumber(BInput.Text) or 0, 0, 255)
            local newColor = Color3.fromRGB(r, g, b)
            H, S, V = Color3.toHSV(newColor)
            ColorPicker.Value = newColor
            ColorDisplay.BackgroundColor3 = newColor
            SVCanvas.BackgroundColor3 = Color3.fromHSV(H, 1, 1)
            SVCursor.Position = UDim2.new(S, -5, 1 - V, -5)
            HueCursor.Position = UDim2.new(0, -2, 1 - H, -3)
            ColorPicker.Callback(newColor)
        end
        
        RInput.FocusLost:Connect(UpdateFromRGB)
        GInput.FocusLost:Connect(UpdateFromRGB)
        BInput.FocusLost:Connect(UpdateFromRGB)
        
        ColorDisplay.MouseButton1Click:Connect(function()
            ColorPicker.Open = not ColorPicker.Open
            local targetSize = ColorPicker.Open and UDim2.new(1, 0, 0, 175) or UDim2.new(1, 0, 0, 40)
            TweenService:Create(ColorFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = targetSize}):Play()
        end)
        
        ColorFrame.MouseEnter:Connect(function()
            TweenService:Create(ColorFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
        end)
        
        ColorFrame.MouseLeave:Connect(function()
            TweenService:Create(ColorFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
        end)
        
        function ColorPicker:SetValue(color)
            ColorPicker.Value = color
            ColorDisplay.BackgroundColor3 = color
            H, S, V = Color3.toHSV(color)
            SVCanvas.BackgroundColor3 = Color3.fromHSV(H, 1, 1)
            SVCursor.Position = UDim2.new(S, -5, 1 - V, -5)
            HueCursor.Position = UDim2.new(0, -2, 1 - H, -3)
            RInput.Text = tostring(math.floor(color.R * 255))
            GInput.Text = tostring(math.floor(color.G * 255))
            BInput.Text = tostring(math.floor(color.B * 255))
        end
        
        return ColorPicker
    end
    
    table.insert(Menu.Tabs, Tab)
    
    -- İlk tab'ı seç
    if #Menu.Tabs == 1 then
        TabButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
        TabContent.Visible = true
        Menu.CurrentTab = Tab
    end
    
    return Tab
end

-- Close & Minimize Buttons
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "Close"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -40, 0, 10)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
CloseButton.BorderSizePixel = 0
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.Font = Enum.Font.GothamBold
CloseButton.AutoButtonColor = false
CloseButton.Parent = HeaderBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 80, 80)}):Play()
end)

CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 60, 60)}):Play()
end)

CloseButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    task.delay(0.3, function()
        ScreenGui:Destroy()
    end)
end)

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "Minimize"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -75, 0, 10)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Text = "−"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 18
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.AutoButtonColor = false
MinimizeButton.Parent = HeaderBar

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 6)
MinimizeCorner.Parent = MinimizeButton

local isMinimized = false
local originalSize = MainContainer.Size

MinimizeButton.MouseEnter:Connect(function()
    TweenService:Create(MinimizeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play()
end)

MinimizeButton.MouseLeave:Connect(function()
    TweenService:Create(MinimizeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
end)

MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        TweenService:Create(MainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
            Size = UDim2.new(0, 700, 0, 50)
        }):Play()
        Sidebar.Visible = false
        ContentContainer.Visible = false
        NavBar.Visible = false
    else
        TweenService:Create(MainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
            Size = originalSize
        }):Play()
        task.delay(0.15, function()
            Sidebar.Visible = true
            ContentContainer.Visible = true
            NavBar.Visible = true
        end)
    end
end)

-- Toggle GUI with Key
local guiVisible = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightControl then
        guiVisible = not guiVisible
        if guiVisible then
            MainContainer.Visible = true
            TweenService:Create(MainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Size = originalSize,
                Position = UDim2.new(0.5, -350, 0.5, -225)
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

task.delay(0.1, function()
    TweenService:Create(MainContainer, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
        Size = UDim2.new(0, 700, 0, 450),
        Position = UDim2.new(0.5, -350, 0.5, -225)
    }):Play()
end)

-- Notification System
function Menu:Notify(title, message, duration)
    duration = duration or 3
    
    local NotifContainer = ScreenGui:FindFirstChild("NotifContainer")
    if not NotifContainer then
        NotifContainer = Instance.new("Frame")
        NotifContainer.Name = "NotifContainer"
        NotifContainer.Size = UDim2.new(0, 300, 1, -20)
        NotifContainer.Position = UDim2.new(1, -310, 0, 10)
        NotifContainer.BackgroundTransparency = 1
        NotifContainer.Parent = ScreenGui
        
        local NotifList = Instance.new("UIListLayout")
        NotifList.Padding = UDim.new(0, 10)
        NotifList.SortOrder = Enum.SortOrder.LayoutOrder
        NotifList.VerticalAlignment = Enum.VerticalAlignment.Top
        NotifList.Parent = NotifContainer
    end
    
    local Notification = Instance.new("Frame")
    Notification.Size = UDim2.new(1, 0, 0, 70)
    Notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Notification.BorderSizePixel = 0
    Notification.ClipsDescendants = true
    Notification.Parent = NotifContainer
    
    local NotifCorner = Instance.new("UICorner")
    NotifCorner.CornerRadius = UDim.new(0, 8)
    NotifCorner.Parent = Notification
    
    local NotifStroke = Instance.new("UIStroke")
    NotifStroke.Thickness = 1
    NotifStroke.Color = Color3.fromRGB(70, 130, 255)
    NotifStroke.Parent = Notification
    
    local NotifTitle = Instance.new("TextLabel")
    NotifTitle.Size = UDim2.new(1, -20, 0, 25)
    NotifTitle.Position = UDim2.new(0, 10, 0, 8)
    NotifTitle.BackgroundTransparency = 1
    NotifTitle.Text = title
    NotifTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotifTitle.TextSize = 14
    NotifTitle.Font = Enum.Font.GothamBold
    NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
    NotifTitle.Parent = Notification
    
    local NotifMessage = Instance.new("TextLabel")
    NotifMessage.Size = UDim2.new(1, -20, 0, 30)
    NotifMessage.Position = UDim2.new(0, 10, 0, 30)
    NotifMessage.BackgroundTransparency = 1
    NotifMessage.Text = message
    NotifMessage.TextColor3 = Color3.fromRGB(180, 180, 180)
    NotifMessage.TextSize = 12
    NotifMessage.Font = Enum.Font.Gotham
    NotifMessage.TextXAlignment = Enum.TextXAlignment.Left
    NotifMessage.TextWrapped = true
    NotifMessage.Parent = Notification
    
    local ProgressBar = Instance.new("Frame")
    ProgressBar.Size = UDim2.new(1, 0, 0, 3)
    ProgressBar.Position = UDim2.new(0, 0, 1, -3)
    ProgressBar.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
    ProgressBar.BorderSizePixel = 0
    ProgressBar.Parent = Notification
    
    -- Slide in animation
    Notification.Position = UDim2.new(1, 0, 0, 0)
    TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
        Position = UDim2.new(0, 0, 0, 0)
    }):Play()
    
    -- Progress bar animation
    TweenService:Create(ProgressBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
        Size = UDim2.new(0, 0, 0, 3)
    }):Play()
    
    -- Remove after duration
    task.delay(duration, function()
        TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
            Position = UDim2.new(1, 0, 0, 0)
        }):Play()
        task.delay(0.3, function()
            Notification:Destroy()
        end)
    end)
end

-- User Info Display
local UserInfo = Instance.new("TextLabel")
UserInfo.Size = UDim2.new(0, 200, 0, 30)
UserInfo.Position = UDim2.new(0, 50, 0.5, -15)
UserInfo.BackgroundTransparency = 1
UserInfo.Text = "Welcome, " .. UserType
UserInfo.TextColor3 = Color3.fromRGB(150, 150, 150)
UserInfo.TextSize = 11
UserInfo.Font = Enum.Font.Gotham
UserInfo.TextXAlignment = Enum.TextXAlignment.Left
UserInfo.Parent = HeaderBar

return Menu

