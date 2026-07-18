---------------------------------------------------------------------
--// SERVICES
---------------------------------------------------------------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Stats = game:GetService("Stats")

---------------------------------------------------------------------
--// PLAYER
---------------------------------------------------------------------
local Player = Players.LocalPlayer

---------------------------------------------------------------------
--// GUI
---------------------------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "FishHubTopBar"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = Player:WaitForChild("PlayerGui")

---------------------------------------------------------------------
--// TOP BAR
---------------------------------------------------------------------
--------------------------------------------------
-- Background
--------------------------------------------------
local bar = Instance.new("Frame")
bar.Parent = gui

--------------------------------------------------
-- Click Area
--------------------------------------------------
local button = Instance.new("TextButton")
button.Parent = bar
button.Size = UDim2.fromScale(1,1)
button.BackgroundTransparency = 1
button.Text = ""
button.AutoButtonColor = false
button.ZIndex = 50

--------------------------------------------------
-- Logo
--------------------------------------------------
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

--------------------------------------------------
-- Rainbow Border
--------------------------------------------------
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

--------------------------------------------------
-- Gradient
--------------------------------------------------
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
label.TextXAlignment = Enum.TextXAlignment.Left
label.TextScaled = true
label.RichText = true
label.TextColor3 = Color3.fromRGB(180,80,255)
label.Text =
"<font color='#B45CFF'>FishHub</font> <font color='#4C9AFF'>┆ Script Collection</font>"

---------------------------------------------------------------------
--// MAIN WINDOW
---------------------------------------------------------------------
--------------------------------------------------
-- Main Frame
--------------------------------------------------
local main = Instance.new("Frame")
main.Parent = gui
main.Size = UDim2.new(0,700,0,480)
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

--------------------------------------------------
-- Header
--------------------------------------------------
local header = Instance.new("Frame")
header.Parent = main
header.Size = UDim2.new(1,0,0,46)
header.Position = UDim2.new(0,0,0,0)
header.BackgroundTransparency = 1
header.BorderSizePixel = 0

--------------------------------------------------
-- Header Title
--------------------------------------------------
local title = Instance.new("TextLabel")
title.Parent = header
title.BackgroundTransparency = 1
title.Size = UDim2.new(1,0,1,0)
title.AnchorPoint = Vector2.new(0.5,0.5)
title.Position = UDim2.new(0.5,0,0.5,0)
title.RichText = true
title.Text =
"<font color='#4C9AFF'>FishHub</font> <font color='#B45CFF'>┆ Script Collection</font>"
title.TextXAlignment = Enum.TextXAlignment.Center
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(255,255,255)

--------------------------------------------------
-- Header Line
--------------------------------------------------
local line = Instance.new("Frame")
line.Parent = main
line.Size = UDim2.new(1,-20,0,2)
line.Position = UDim2.new(0,10,0,45)
line.BackgroundColor3 = Color3.fromRGB(120,80,255)
line.BorderSizePixel = 0
local lineCorner = Instance.new("UICorner")
lineCorner.Parent = line
lineCorner.CornerRadius = UDim.new(1,0)

---------------------------------------------------------------------
--// CONTENT
---------------------------------------------------------------------
---------------------------------------------------
-- CONTENT BACKGROUND
---------------------------------------------------
local content = Instance.new("Frame")
content.Parent = main
content.Position = UDim2.new(0,0,0,47)
content.Size = UDim2.new(1,0,1,-90)
content.BackgroundColor3 = Color3.fromRGB(15,18,30)
content.BackgroundTransparency = 0
content.BorderSizePixel = 0
content.ZIndex = 0
local contentCorner = Instance.new("UICorner")
contentCorner.Parent = content
contentCorner.CornerRadius = UDim.new(0,18)
content.BorderSizePixel = 0
content.ZIndex = 0
local contentCorner = Instance.new("UICorner")
contentCorner.Parent = content
contentCorner.CornerRadius = UDim.new(0,18)

---------------------------------------------------------------------
--// DISCORD BAR
---------------------------------------------------------------------
--------------------------------------------------
-- Rainbow Line
--------------------------------------------------
local discordLine = Instance.new("Frame")
discordLine.Parent = main
discordLine.Position = UDim2.new(0,10,1,-42)
discordLine.Size = UDim2.new(1,-20,0,2)
discordLine.BackgroundColor3 = Color3.fromRGB(120,80,255)
discordLine.BorderSizePixel = 0
local lineGradient = Instance.new("UIGradient")
lineGradient.Parent = discordLine
task.spawn(function()
    local h = 0
    while true do
        lineGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0,Color3.fromHSV(h,1,1)),
            ColorSequenceKeypoint.new(1,Color3.fromHSV(h+0.3,1,1))
        }

        h += 0.01
        if h >= 1 then
            h = 0
        end

        RunService.RenderStepped:Wait()
    end
end)

--------------------------------------------------
-- Text Container
--------------------------------------------------
local discordBox = Instance.new("Frame")
discordBox.Parent = main
discordBox.Position = UDim2.new(0,10,1,-40)
discordBox.Size = UDim2.new(1,-20,0,35)
discordBox.BackgroundTransparency = 1
discordBox.ClipsDescendants = true
discordBox.ZIndex = 20

--------------------------------------------------
-- Scrolling Text
--------------------------------------------------
local discordText = Instance.new("TextButton")
discordText.Parent = discordBox
discordText.Size = UDim2.new(0,900,1,0)
discordText.Position = UDim2.new(1,0,0,0)
discordText.BackgroundTransparency = 1
discordText.Font = Enum.Font.GothamBold
discordText.TextScaled = true
discordText.RichText = true
discordText.TextXAlignment = Enum.TextXAlignment.Left
discordText.Text =
"<font color='#B45CFF'>My Discord: </font>"..
"<font color='#4C9AFF'>https://discord.gg/2tTJxRk2ct</font>"..
"<font color='#B45CFF'> ┆ CRE: DaoHuyLam</font>"
discordText.AutoButtonColor = false
discordText.MouseButton1Click:Connect(function()
    if syn and syn.open_url then
        syn.open_url("https://discord.gg/2tTJxRk2ct")
    elseif getgenv().open_url then
        getgenv().open_url("https://discord.gg/2tTJxRk2ct")
    else
        setclipboard("https://discord.gg/2tTJxRk2ct")
    end
end)
task.spawn(function()
    while true do
        discordText.Position =
            UDim2.new(1,0,0,0)
        local tween = TweenService:Create(
            discordText,
            TweenInfo.new(
                15,
                Enum.EasingStyle.Linear
            ),
            {
                Position =
                UDim2.new(
                    0,
                    -900,
                    0,
                    0
                )
            }
        )
        tween:Play()
        tween.Completed:Wait()
        task.wait(1)
    end
end)

---------------------------------------------------------------------
--// SIDEBAR
---------------------------------------------------------------------
--------------------------------------------------
-- Sidebar
--------------------------------------------------
local sidebar = Instance.new("Frame")
sidebar.Parent = content
sidebar.Position = UDim2.new(0,0,0,0)
sidebar.Size = UDim2.new(0,170,1,0)
sidebar.BackgroundColor3 = Color3.fromRGB(18,18,18)
sidebar.BorderSizePixel = 0
local sidebarCorner = Instance.new("UICorner")
sidebarCorner.Parent = sidebar
sidebarCorner.CornerRadius = UDim.new(0,18)

---------------------------------------------------
-- PAGE CONTAINER (RIGHT SIDE)
---------------------------------------------------
local pageContainer = Instance.new("Frame")
pageContainer.Parent = content
pageContainer.Position = UDim2.new(0,175,0,0)
pageContainer.Size = UDim2.new(1,-175,1,0)
pageContainer.BackgroundTransparency = 1
pageContainer.BorderSizePixel = 0

--------------------------------------------------
-- Indicator
--------------------------------------------------
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

---------------------------------------------------------------------
--// NAVIGATION BUTTONS
---------------------------------------------------------------------
--------------------------------------------------
-- Create Button Function
--------------------------------------------------
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

--------------------------------------------------
-- Home Button
--------------------------------------------------
local HomeBtn = CreateSideButton(
    "Home",
    18,
    "rbxassetid://108029482244357"
)

--------------------------------------------------
-- Support Button
--------------------------------------------------
local SupportBtn = CreateSideButton(
    "Support",
    70,
    "rbxassetid://86514728032684"
)

--------------------------------------------------
-- Settings Button
--------------------------------------------------
local SettingBtn = CreateSideButton(
    "Setting",
    122,
    "rbxassetid://99627454901549"
)
local CurrentButton
local OpenHome
local OpenSupport
local OpenSettings

--------------------------------------------------
-- Navigation
--------------------------------------------------
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
    OpenHome()
end)
SupportBtn.MouseButton1Click:Connect(function()
    SelectButton(SupportBtn)
    OpenSupport()
end)
SettingBtn.MouseButton1Click:Connect(function()
    SelectButton(SettingBtn)
    OpenSettings()
end)

---------------------------------------------------------------------
--// PAGE SYSTEM
---------------------------------------------------------------------
--------------------------------------------------
-- Clear Current Page
--------------------------------------------------
local function ClearContent()
    for _,v in ipairs(pageContainer:GetChildren()) do
        v:Destroy()
    end
end

--------------------------------------------------
-- Home Page
--------------------------------------------------
OpenHome = function()
    ClearContent()
    local title = Instance.new("TextLabel")
    title.Parent = pageContainer
    title.BackgroundTransparency = 1
    title.Position = UDim2.new(0,20,0,20)
    title.Size = UDim2.new(1,-40,0,35)
    title.Font = Enum.Font.GothamBold
    title.Text = "Home"
    title.TextSize = 24
    title.TextColor3 = Color3.new(1,1,1)
end

--------------------------------------------------
-- Support Page
--------------------------------------------------
OpenSupport = function()
    ClearContent()
    local title = Instance.new("TextLabel")
    title.Parent = pageContainer
    title.BackgroundTransparency = 1
    title.Position = UDim2.new(0,20,0,20)
    title.Size = UDim2.new(1,-40,0,35)
    title.Font = Enum.Font.GothamBold
    title.Text = "Support"
    title.TextSize = 24
    title.TextColor3 = Color3.new(1,1,1)
end

--------------------------------------------------
-- Settings Page
--------------------------------------------------
OpenSettings = function()
	ClearContent()
	local title = Instance.new("TextLabel")
	title.Parent = pageContainer
	title.BackgroundTransparency = 1
	title.Position = UDim2.new(0,20,0,20)
	title.Size = UDim2.new(1,-40,0,35)
	title.Font = Enum.Font.GothamBold
	title.TextSize = 24
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.TextColor3 = Color3.new(1,1,1)
	title.Text = "Settings"
	local closeGui = Instance.new("TextButton")
	closeGui.MouseButton1Click:Connect(function()
    gui:Destroy()
	end)
	closeGui.Parent = pageContainer
	closeGui.BackgroundTransparency = 1
	closeGui.Position = UDim2.new(0,20,0,70)
	closeGui.Size = UDim2.new(1,-40,0,30)
	closeGui.Font = Enum.Font.Gotham
	closeGui.TextSize = 18
	closeGui.TextXAlignment = Enum.TextXAlignment.Left
	closeGui.TextColor3 = Color3.fromRGB(220,220,220)
	closeGui.Text = "• Close GUI"
end
SelectButton(HomeBtn)
OpenHome()

---------------------------------------------------------------------
--// WINDOW CONTROLS
---------------------------------------------------------------------
local btnSize = 28
local spacing = 8
local startX = main.Size.X.Offset - 18

--------------------------------------------------
-- Create Window Button
--------------------------------------------------
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

--------------------------------------------------
-- Close Button
--------------------------------------------------
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

--------------------------------------------------
-- Events
--------------------------------------------------
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

---------------------------------------------------------------------
--// PERFORMANCE
---------------------------------------------------------------------
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

---------------------------------------------------------------------
--// UPDATE LOOP
---------------------------------------------------------------------
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
