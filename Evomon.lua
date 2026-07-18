local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Stats = game:GetService("Stats")
local Player = Players.LocalPlayer

---------------------------------------------------
-- GUI
---------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "FishHubTopBar"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = Player:WaitForChild("PlayerGui")
local bar = Instance.new("Frame")
bar.Parent = gui
local button = Instance.new("TextButton")
button.Parent = bar
button.Size = UDim2.fromScale(1,1)
button.BackgroundTransparency = 1
button.Text = ""
button.AutoButtonColor = false
button.ZIndex = 50
local logo = Instance.new("ImageLabel")
logo.Parent = bar
logo.BackgroundTransparency = 1
logo.Size = UDim2.new(0,26,0,26)
logo.Position = UDim2.new(0,8,0.5,-13)
logo.Image = "rbxassetid://119254006379989"
bar.Size = UDim2.new(0,520,0,36)
bar.AnchorPoint = Vector2.new(0.5,0)
bar.Position = UDim2.new(0.5,0,0,10)
bar.BackgroundColor3 = Color3.fromRGB(12,16,30)
bar.BackgroundTransparency = 1
bar.BorderSizePixel = 0
local corner = Instance.new("UICorner")
corner.Parent = bar
corner.CornerRadius = UDim.new(0,14)
local stroke = Instance.new("UIStroke")
stroke.Parent = bar
stroke.Color = Color3.fromRGB(0,170,255)
stroke.Thickness = 1.2
task.spawn(function()
    local hue = 0
    while true do
        stroke.Color = Color3.fromHSV(hue,1,1)
        hue += 0.003
        if hue >= 1 then
            hue = 0
        end
        RunService.RenderStepped:Wait()
    end
end)
local gradient = Instance.new("UIGradient")
gradient.Parent = bar
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0,Color3.fromRGB(8,10,22)),
    ColorSequenceKeypoint.new(1,Color3.fromRGB(18,25,45))
}
local label = Instance.new("TextLabel")
label.Parent = bar
label.Size = UDim2.new(1,-44,1,0)
label.Position = UDim2.new(0,36,0,0)
label.BackgroundTransparency = 1
label.Font = Enum.Font.GothamBold
label.TextColor3 = Color3.new(1,1,1)
label.TextXAlignment = Enum.TextXAlignment.Left
label.TextScaled = true
label.RichText = true

---------------------------------------------------
-- MAIN WINDOW
---------------------------------------------------
local main = Instance.new("Frame")
main.Parent = gui
main.Size = UDim2.new(0,700,0,420)
main.Position = UDim2.new(0.5,0,0.5,0)
main.AnchorPoint = Vector2.new(0.5,0.5)
main.BackgroundTransparency = 1
main.BorderSizePixel = 0
main.Visible = false
local mainCorner = Instance.new("UICorner")
mainCorner.Parent = main
mainCorner.CornerRadius = UDim.new(0,18)
local mainStroke = Instance.new("UIStroke")
mainStroke.Parent = main
mainStroke.Color = Color3.fromRGB(0,170,255)
mainStroke.Thickness = 2
task.spawn(function()
    local hue = 0
    while gui.Parent do
        mainStroke.Color = Color3.fromHSV(hue, 1, 1)
        hue += 0.003
        if hue >= 1 then
            hue = 0
        end
        RunService.RenderStepped:Wait()
    end
end)
local header = Instance.new("Frame")
header.Parent = main
header.Size = UDim2.new(1,0,0,46)
header.Position = UDim2.new(0,0,0,0)
header.BackgroundTransparency = 1
header.BorderSizePixel = 0
local title = Instance.new("TextLabel")
title.Parent = header
title.BackgroundTransparency = 1
title.Size = UDim2.new(1,0,1,0)
title.AnchorPoint = Vector2.new(0.5,0.5)
title.Position = UDim2.new(0.5,0,0.5,0)
title.Text = "FishHub ┆ Script Collection"
title.TextXAlignment = Enum.TextXAlignment.Center
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(255,255,255)
local line = Instance.new("Frame")
line.Parent = main
line.Size = UDim2.new(1,0,0,2)
line.Position = UDim2.new(0,0,0,45)
line.BackgroundColor3 = Color3.fromRGB(0,170,255)
line.BorderSizePixel = 0
local lineCorner = Instance.new("UICorner")
lineCorner.Parent = line
lineCorner.CornerRadius = UDim.new(1,0)

---------------------------------------------------
-- CONTENT BACKGROUND
---------------------------------------------------
local content = Instance.new("Frame")
content.Parent = main
content.Position = UDim2.new(0,0,0,47)
content.Size = UDim2.new(1,0,1,-47)
content.BackgroundColor3 = Color3.fromRGB(15,18,30)
content.BorderSizePixel = 0
content.ZIndex = 0
local contentCorner = Instance.new("UICorner")
contentCorner.Parent = content
contentCorner.CornerRadius = UDim.new(0,18)

---------------------------------------------------
-- LEFT SIDEBAR
---------------------------------------------------
local sidebar = Instance.new("Frame")
sidebar.Parent = content
sidebar.Position = UDim2.new(0,0,0,0)
sidebar.Size = UDim2.new(0,170,1,0)
sidebar.BackgroundColor3 = Color3.fromRGB(18,18,18)
sidebar.BorderSizePixel = 0
local sidebarCorner = Instance.new("UICorner")
sidebarCorner.Parent = sidebar
sidebarCorner.CornerRadius = UDim.new(0,18)
local Indicator = Instance.new("Frame")
Indicator.Parent = sidebar
Indicator.Size = UDim2.new(0,4,0,42)
Indicator.Position = UDim2.new(0,2,0,18)
Indicator.BackgroundColor3 = Color3.fromRGB(0,170,255)
Indicator.BorderSizePixel = 0
Indicator.ZIndex = 10
local IndicatorCorner = Instance.new("UICorner")
IndicatorCorner.Parent = Indicator
IndicatorCorner.CornerRadius = UDim.new(1,0)

---------------------------------------------------
-- Vertical Divider
---------------------------------------------------
local divider = Instance.new("Frame")
divider.Parent = main
divider.Position = UDim2.new(0,170,0,47)
divider.Size = UDim2.new(0,2,1,-47)
divider.BackgroundColor3 = Color3.fromRGB(40,70,120)
divider.BorderSizePixel = 0

---------------------------------------------------
-- Button Creator
---------------------------------------------------
local function CreateSideButton(text, y, image)
	local btn = Instance.new("TextButton")
    btn.Parent = sidebar
    btn.Size = UDim2.new(1,-20,0,42)
    btn.Position = UDim2.new(0,10,0,y)
    btn.BackgroundColor3 = Color3.fromRGB(28,28,28)
    btn.BorderSizePixel = 0
    btn.Text = ""
    btn.AutoButtonColor = false
    Instance.new("UICorner",btn).CornerRadius = UDim.new(0,10)
	local dot = Instance.new("Frame")
	dot.Parent = btn
	dot.Size = UDim2.new(0,8,0,8)
	dot.Position = UDim2.new(0,10,0.5,-4)
	dot.BackgroundColor3 = Color3.fromRGB(0,170,255)
	dot.BorderSizePixel = 0
	local dotCorner = Instance.new("UICorner")
	dotCorner.Parent = dot
	dotCorner.CornerRadius = UDim.new(1,0)
	task.spawn(function()
    local hue = 0
    while btn.Parent do
        dot.BackgroundColor3 = Color3.fromHSV(hue,1,1)
        hue += 0.003
        if hue >= 1 then
            hue = 0
        end
        RunService.RenderStepped:Wait()
    end
end)
    local icon = Instance.new("ImageLabel")
	icon.Parent = btn
	icon.Size = UDim2.new(0,22,0,22)
	icon.Position = UDim2.new(0,24,0.5,-11)
	icon.BackgroundTransparency = 1
	icon.Image = image
	icon.ImageColor3 = Color3.fromRGB(255,255,255)
icon.ScaleType = Enum.ScaleType.Fit
    local lbl = Instance.new("TextLabel")
    lbl.Parent = btn
    lbl.BackgroundTransparency = 1
    lbl.Position = UDim2.new(0,52,0,0)
    lbl.Size = UDim2.new(1,-52,1,0)
    lbl.Text = text
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 17
    lbl.TextColor3 = Color3.new(1,1,1)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
	btn.MouseEnter:Connect(function()
    btn.BackgroundColor3 = Color3.fromRGB(42,42,42)
	end)

	btn.MouseLeave:Connect(function()
    btn.BackgroundColor3 = Color3.fromRGB(28,28,28)
	end)
    return btn
end
local HomeBtn = CreateSideButton(
    "Home",
    18,
    "rbxassetid://108029482244357"
)
local SupportBtn = CreateSideButton(
    "Support",
    70,
    "rbxassetid://86514728032684"
)
local SettingBtn = CreateSideButton(
    "Setting",
    122,
    "rbxassetid://99627454901549"
)
local CurrentButton
local function SelectButton(btn)
    if CurrentButton == btn then
        return
    end
    CurrentButton = btn
    TweenService:Create(
        Indicator,
        TweenInfo.new(
            0.25,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.Out
        ),
        {
            Position = UDim2.new(
                0,
                2,
                0,
                btn.Position.Y.Offset
            )
        }
    ):Play()
end
HomeBtn.MouseButton1Click:Connect(function()
    SelectButton(HomeBtn)
end)
SupportBtn.MouseButton1Click:Connect(function()
    SelectButton(SupportBtn)
end)
SettingBtn.MouseButton1Click:Connect(function()
    SelectButton(SettingBtn)
end)
SelectButton(HomeBtn)

---------------------------------------------------
-- WINDOW BUTTONS
---------------------------------------------------
local btnSize = 28
local spacing = 8
local startX = main.Size.X.Offset - 18
local function CreateCircleButton(text, xOffset)
    local btn = Instance.new("TextButton")
    btn.Parent = main
    btn.Size = UDim2.new(0,30,0,30)
    btn.AnchorPoint = Vector2.new(1,0)
    btn.Position = UDim2.new(1,-xOffset,0,8)
    btn.BackgroundColor3 = Color3.fromRGB(55,55,60)
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.Text = text
    btn.Font = Enum.Font.Legacy
    btn.TextSize = 12
	btn.TextYAlignment = Enum.TextYAlignment.Center
    btn.TextColor3 = Color3.fromRGB(240,240,240)
    local corner = Instance.new("UICorner")
    corner.Parent = btn
    corner.CornerRadius = UDim.new(0,8)
    local stroke = Instance.new("UIStroke")
    stroke.Parent = btn
    stroke.Color = Color3.fromRGB(110,110,120)
    stroke.Thickness = 1
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(80,80,85)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(55,55,60)
    end)
    return btn
end
local closeBtn = CreateCircleButton("×",18)
local hideBtn  = CreateCircleButton("─",54)
local sizeBtn  = CreateCircleButton("□",90)
local normalSize = UDim2.new(0,700,0,420)
local maxSize = UDim2.new(0,1000,0,650)
local maximize = false
sizeBtn.MouseButton1Click:Connect(function()
    maximize = not maximize
    if maximize then
        main.Size = maxSize
    else
        main.Size = normalSize
    end
end)
local confirm = Instance.new("Frame")
confirm.Parent = gui
confirm.Size = UDim2.new(0,320,0,150)
confirm.Position = UDim2.new(.5,0,.5,0)
confirm.AnchorPoint = Vector2.new(.5,.5)
confirm.BackgroundColor3 = Color3.fromRGB(20,25,35)
confirm.Visible = false
confirm.BorderSizePixel = 0
local confirmCorner = Instance.new("UICorner")
confirmCorner.Parent = confirm
confirmCorner.CornerRadius = UDim.new(0,14)
local txt = Instance.new("TextLabel")
txt.Parent = confirm
txt.Size = UDim2.new(1,-20,0,60)
txt.Position = UDim2.new(0,10,0,15)
txt.BackgroundTransparency = 1
txt.Text = "Do you want to close the entire FishHub script?"
txt.Font = Enum.Font.GothamBold
txt.TextScaled = true
txt.TextWrapped = true
txt.TextColor3 = Color3.new(1,1,1)
local yes = Instance.new("TextButton")
yes.Parent = confirm
yes.Size = UDim2.new(.38,0,0,34)
yes.Position = UDim2.new(.08,0,1,-45)
yes.Text = "Yes"
yes.BackgroundColor3 = Color3.fromRGB(0,170,90)
yes.TextColor3 = Color3.new(1,1,1)
local yesCorner = Instance.new("UICorner")
yesCorner.Parent = yes
yesCorner.CornerRadius = UDim.new(1,0)
local no = Instance.new("TextButton")
no.Parent = confirm
no.Size = UDim2.new(.38,0,0,34)
no.Position = UDim2.new(.54,0,1,-45)
no.Text = "No"
no.BackgroundColor3 = Color3.fromRGB(220,70,70)
no.TextColor3 = Color3.new(1,1,1)
local noCorner = Instance.new("UICorner")
noCorner.Parent = no
noCorner.CornerRadius = UDim.new(1,0)
button.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)
closeBtn.MouseButton1Click:Connect(function()
    confirm.Visible = true
end)
yes.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
no.MouseButton1Click:Connect(function()
    confirm.Visible = false
end)
hideBtn.MouseButton1Click:Connect(function()
    main.Visible = false
end)

---------------------------------------------------
-- FPS
---------------------------------------------------
local fps = 60
local frames = 0
local lastTick = tick()
RunService.RenderStepped:Connect(function()
    frames += 1
    if tick()-lastTick >= 1 then
        fps = frames
        frames = 0
        lastTick = tick()
    end
end)

---------------------------------------------------
-- UPDATE
---------------------------------------------------
local startTime = tick()
local blue = 0
while true do
    local ping = "?"
    pcall(function()
        ping = math.floor(
            Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
        )
    end)
local elapsed = math.floor(tick() - startTime)
local hours = math.floor(elapsed / 3600)
local minutes = math.floor((elapsed % 3600) / 60)
local seconds = elapsed % 60
local timeString = string.format("%02d:%02d:%02d", hours, minutes, seconds)
blue += 0.05
local brightness = (math.sin(blue) + 1) / 2
local color = Color3.fromRGB(
    0,
    math.floor(120 + brightness * 135),
    255
)
local hex = string.format(
    "#%02X%02X%02X",
    color.R * 255,
    color.G * 255,
    color.B * 255
)
label.Text = string.format(
    "<font color='%s'>FishHub</font> | FPS: %d | Ping: %sms | Time: %s",
    hex,
    fps,
    tostring(ping),
    timeString
)
    task.wait(0.2)
end
