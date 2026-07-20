---------------------------------------------------------------------
--// SERVICES
---------------------------------------------------------------------
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
---------------------------------------------------------------------
--// FISHHUB
---------------------------------------------------------------------
local FishHub = getgenv().FishHub
if not FishHub.Config then
    FishHub.Config = {}
end
---------------------------------------------------------------------
--// HOTKEY CONFIG
---------------------------------------------------------------------
local HotkeyConfig = FishHub.HotkeyConfig
---------------------------------------------------------------------
--// PAGE
---------------------------------------------------------------------
local page = FishHub.pageContainer
---------------------------------------------------------------------
--// CLEAR OLD CONTENT
---------------------------------------------------------------------
for _,v in pairs(page:GetChildren()) do
    v:Destroy()
end
---------------------------------------------------------------------
--// TITLE
---------------------------------------------------------------------
local title = Instance.new("TextLabel")
title.Parent = page
title.BackgroundTransparency = 1
title.Position = UDim2.new(0,20,0,15)
title.Size = UDim2.new(1,-40,0,35)
title.Text = "⚙ Settings"
title.Font = Enum.Font.GothamBold
title.TextSize = 26
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextXAlignment = Enum.TextXAlignment.Left
local subtitle = Instance.new("TextLabel")
subtitle.Parent = page
subtitle.BackgroundTransparency = 1
subtitle.Position = UDim2.new(0,22,0,50)
subtitle.Size = UDim2.new(1,-40,0,25)
subtitle.Text = "Customize FishHub interface"
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 14
subtitle.TextColor3 = Color3.fromRGB(160,160,180)
subtitle.TextXAlignment = Enum.TextXAlignment.Left
---------------------------------------------------------------------
--// CREATE SETTING CARD
---------------------------------------------------------------------
local function CreateSetting(name, description, y, callback, state)
    local card = Instance.new("Frame")
    card.Parent = page
    card.Position = UDim2.new(0,20,0,y)
    card.Size = UDim2.new(1,-40,0,75)
    card.BackgroundColor3 = Color3.fromRGB(25,30,45)
    card.BorderSizePixel = 0
    local corner = Instance.new("UICorner")
    corner.Parent = card
    corner.CornerRadius = UDim.new(0,14)
    local stroke = Instance.new("UIStroke")
    stroke.Parent = card
    stroke.Color = Color3.fromRGB(0,170,255)
    stroke.Transparency = 0.65
    stroke.Thickness = 1
    ---------------------------------------------------------------------
    --// TITLE
    ---------------------------------------------------------------------
    local cardTitle = Instance.new("TextLabel")
    cardTitle.Parent = card
    cardTitle.BackgroundTransparency = 1
    cardTitle.Position = UDim2.new(0,18,0,10)
    cardTitle.Size = UDim2.new(.6,0,0,25)
    cardTitle.Text = name
    cardTitle.Font = Enum.Font.GothamBold
    cardTitle.TextSize = 17
    cardTitle.TextColor3 = Color3.new(1,1,1)
    cardTitle.TextXAlignment = Enum.TextXAlignment.Left
    ---------------------------------------------------------------------
    --// DESCRIPTION
    ---------------------------------------------------------------------
    local desc = Instance.new("TextLabel")
    desc.Parent = card
    desc.BackgroundTransparency = 1
    desc.Position = UDim2.new(0,18,0,38)
    desc.Size = UDim2.new(.7,0,0,20)
    desc.Text = description
    desc.Font = Enum.Font.Gotham
    desc.TextSize = 13
    desc.TextColor3 = Color3.fromRGB(150,150,170)
    desc.TextXAlignment = Enum.TextXAlignment.Left
    ---------------------------------------------------------------------
    --// SWITCH BACKGROUND
    ---------------------------------------------------------------------
    local switch = Instance.new("Frame")
    switch.Parent = card
    switch.Size = UDim2.new(0,55,0,28)
    switch.Position = UDim2.new(1,-75,0.5,-14)
    local switchCorner = Instance.new("UICorner")
    switchCorner.Parent = switch
    switchCorner.CornerRadius = UDim.new(1,0)
    ---------------------------------------------------------------------
    --// CIRCLE
    ---------------------------------------------------------------------
    local circle = Instance.new("Frame")
    circle.Parent = switch
    circle.Size = UDim2.new(0,22,0,22)
    circle.Position = UDim2.new(0,3,0.5,-11)
    local circleCorner = Instance.new("UICorner")
    circleCorner.Parent = circle
    circleCorner.CornerRadius = UDim.new(1,0)
    circle.BackgroundColor3 = Color3.fromRGB(240,240,240)
    ---------------------------------------------------------------------
    --// UPDATE
    ---------------------------------------------------------------------
    local function Update()
        if state then
            TweenService:Create(switch, TweenInfo.new(.25), {BackgroundColor3 = Color3.fromRGB(0,170,100)}):Play()
            TweenService:Create(circle, TweenInfo.new(.25), {Position = UDim2.new(1,-25,0.5,-11)}):Play()
        else
            TweenService:Create(switch, TweenInfo.new(.25), {BackgroundColor3 = Color3.fromRGB(70,70,80)}):Play()
            TweenService:Create(circle, TweenInfo.new(.25), {Position = UDim2.new(0,3,0.5,-11)}):Play()
        end
    end
    Update()
    ---------------------------------------------------------------------
    --// CLICK
    ---------------------------------------------------------------------
    local click = Instance.new("TextButton")
    click.Parent = card
    click.BackgroundTransparency = 1
    click.Size = UDim2.new(1,0,1,0)
    click.Text = ""
    click.MouseButton1Click:Connect(function()
        state = not state
        Update()
        callback(state)
    end)
end
CreateSetting("🌈 Rainbow Border", "Animated rainbow outline", 175, function(value)
    FishHub.Config.RainbowBorder = value
end, FishHub.Config.RainbowBorder)
CreateSetting("✨ GUI Animation", "Open and close animation", 260, function(value)
    FishHub.Config.GUIAnimation = value
end, FishHub.Config.GUIAnimation)
CreateSetting("🔵 Border Glow", "Enable neon border effect", 345, function(value)
    FishHub.Config.BorderGlow = value
end, FishHub.Config.BorderGlow)
---------------------------------------------------------------------
--// HOTKEY CARD
---------------------------------------------------------------------
local function CreateHotkeySetting()
    local card = Instance.new("Frame")
    card.Parent = page
    card.Position = UDim2.new(0,20,0,90)
    card.Size = UDim2.new(1,-40,0,75)
    card.BackgroundColor3 = Color3.fromRGB(25,30,45)
    card.BorderSizePixel = 0
    local corner = Instance.new("UICorner")
    corner.Parent = card
    corner.CornerRadius = UDim.new(0,14)
    local stroke = Instance.new("UIStroke")
    stroke.Parent = card
    stroke.Color = Color3.fromRGB(0,170,255)
    stroke.Transparency = .65
    ---------------------------------------------------------------------
    --// TEXT
    ---------------------------------------------------------------------
    local text = Instance.new("TextLabel")
    text.Parent = card
    text.BackgroundTransparency = 1
    text.Position = UDim2.new(0,18,0,10)
    text.Size = UDim2.new(.5,0,0,25)
    text.Text = "⌨ UI Hotkey"
    text.Font = Enum.Font.GothamBold
    text.TextSize = 17
    text.TextColor3 = Color3.new(1,1,1)
    text.TextXAlignment = Enum.TextXAlignment.Left
    local desc = Instance.new("TextLabel")
    desc.Parent = card
    desc.BackgroundTransparency = 1
    desc.Position = UDim2.new(0,18,0,38)
    desc.Size = UDim2.new(.6,0,0,20)
    desc.Text = "Press key to hide/show UI"
    desc.Font = Enum.Font.Gotham
    desc.TextSize = 13
    desc.TextColor3 = Color3.fromRGB(150,150,170)
    desc.TextXAlignment = Enum.TextXAlignment.Left
    ---------------------------------------------------------------------
    --// KEY BUTTON
    ---------------------------------------------------------------------
    local keyButton = Instance.new("TextButton")
    keyButton.Parent = card
    keyButton.Size = UDim2.new(0,120,0,38)
    keyButton.Position = UDim2.new(1,-140,.5,-19)
    keyButton.BackgroundColor3 = Color3.fromRGB(40,45,60)
    keyButton.TextColor3 = Color3.new(1,1,1)
    keyButton.Font = Enum.Font.GothamBold
    keyButton.TextSize = 14
    keyButton.Text = "[LEFTCONTROL]"
    local keyCorner = Instance.new("UICorner")
    keyCorner.Parent = keyButton
    keyCorner.CornerRadius = UDim.new(0,10)
    ---------------------------------------------------------------------
    --// CHANGE KEY
    ---------------------------------------------------------------------
	local waiting = false
	keyButton.Text = "[" .. HotkeyConfig.Key.Name:upper() .. "]"
	keyButton.MouseButton1Click:Connect(function()
	    if waiting then
	        return
	    end
	    waiting = true
	    getgenv().FishHub.IsChangingKey = true
	    keyButton.Text = "[PRESS KEY]"
	    local connection
	    connection = UserInputService.InputBegan:Connect(function(input, gp)
	        if gp then
	            return
	        end
	        if input.UserInputType ~= Enum.UserInputType.Keyboard then
	            return
	        end
	        HotkeyConfig.Key = input.KeyCode
	        keyButton.Text = "[" .. input.KeyCode.Name:upper() .. "]"
	        waiting = false
	        getgenv().FishHub.IsChangingKey = false
	        connection:Disconnect()
	    end)
	end)
end
CreateHotkeySetting()
