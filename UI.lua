---------------------------------------------------------------------
--// SERVICES
---------------------------------------------------------------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Stats = game:GetService("Stats")

---------------------------------------------------------------------
--// PLAYER
---------------------------------------------------------------------
local Player = Players.LocalPlayer
getgenv().FishHub = {}

---------------------------------------------------------------------
--// CONFIG
---------------------------------------------------------------------
local Config = {
    MainWidth = 700,
    MainHeight = 480,
    MaxWidth = 1000,
    MaxHeight = 650,
	RainbowBorder = true,
    RainbowSpeed = 0.003,
    GUIAnimation = true,
}
getgenv().FishHub.Config = Config

---------------------------------------------------------------------
--// VARIABLES
---------------------------------------------------------------------
local CurrentPage = nil
local Maximize = false
local ChangeKeyButton

---------------------------------------------------------------------
--// GUI CREATION
---------------------------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "FishHub"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = Player:WaitForChild("PlayerGui")

---------------------------------------------------------------------
--// OPEN LINE
---------------------------------------------------------------------
local openLine = Instance.new("Frame")
openLine.Parent = gui
openLine.Size = UDim2.new(0,550,0,6)
openLine.Position = UDim2.new(0.5,0,0,3)
openLine.AnchorPoint = Vector2.new(0.5,0)
openLine.BackgroundColor3 = Color3.fromRGB(255,255,255)
openLine.BorderSizePixel = 0
local lineCorner = Instance.new("UICorner")
lineCorner.Parent = openLine
lineCorner.CornerRadius = UDim.new(1,0)
local lineStroke = Instance.new("UIStroke")
lineStroke.Parent = openLine
lineStroke.Thickness = 2
task.spawn(function()
    local hue = 0
    while openLine.Parent do
        if Config.RainbowBorder then
            lineStroke.Color = Color3.fromHSV(hue,1,1)
        else
            lineStroke.Color = Color3.fromRGB(0,170,255)
        end
        hue += Config.RainbowSpeed
        if hue >= 1 then
            hue = 0
        end
        RunService.RenderStepped:Wait()
    end
end)
local lineButton = Instance.new("TextButton")
lineButton.Parent = openLine
lineButton.Size = UDim2.fromScale(1,1)
lineButton.BackgroundTransparency = 1
lineButton.Text = ""
lineButton.AutoButtonColor = false

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
main.BackgroundColor3 = Color3.fromRGB(20,24,36)
main.BackgroundTransparency = 0.16
main.BorderSizePixel = 0
main.Visible = false
local mainCorner = Instance.new("UICorner")
mainCorner.Parent = main
mainCorner.CornerRadius = UDim.new(0,18)
local glassGradient = Instance.new("UIGradient")
glassGradient.Parent = main
glassGradient.Rotation = 90
glassGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0,Color3.fromRGB(45,50,70)),
    ColorSequenceKeypoint.new(1,Color3.fromRGB(18,22,35))
}
local highlight = Instance.new("UIStroke")
highlight.Parent = main
highlight.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
highlight.Color = Color3.fromRGB(255,255,255)
highlight.Transparency = 0.87
highlight.Thickness = 1
local mainStroke = Instance.new("UIStroke")
mainStroke.Parent = main
mainStroke.Color = Color3.fromRGB(0,170,255)
mainStroke.Thickness = 2
task.spawn(function()
    local hue = 0
    while gui.Parent do
        if Config.RainbowBorder then
            mainStroke.Color = Color3.fromHSV(hue,1,1)
        else
            mainStroke.Color = Color3.fromRGB(0,170,255)
        end
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
-- Discord Icon (Main Window)
--------------------------------------------------
local discordButton = Instance.new("ImageButton")
discordButton.Parent = header
discordButton.BackgroundTransparency = 1
discordButton.Size = UDim2.new(0,28,0,28)
discordButton.Position = UDim2.new(0,12,0.5,-14)
discordButton.Image = "rbxassetid://85459024706035"
discordButton.ImageColor3 = Color3.fromRGB(88,101,242)
discordButton.ScaleType = Enum.ScaleType.Fit
local function OpenDiscord(url)
    if syn and syn.open_url then
        syn.open_url(url)
        return
    end
    if open_url then
        open_url(url)
        return
    end
    if getgenv().open_url then
        getgenv().open_url(url)
        return
    end
    if setclipboard then
        setclipboard(url)
        return
    end
    if toclipboard then
        toclipboard(url)
    end
end
discordButton.MouseButton1Click:Connect(function()
    OpenDiscord("https://discord.gg/2tTJxRk2ct")
end)

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
content.BackgroundColor3 = Color3.fromRGB(18,22,35)
content.BackgroundTransparency = 1
content.BorderSizePixel = 0
content.ZIndex = 0
local contentCorner = Instance.new("UICorner")
contentCorner.Parent = content
contentCorner.CornerRadius = UDim.new(0,18)
local contentGradient = Instance.new("UIGradient")
contentGradient.Parent = content
contentGradient.Rotation = 90
contentGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0,Color3.fromRGB(38,42,58)),
    ColorSequenceKeypoint.new(1,Color3.fromRGB(18,22,35))
}

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
local avatar = Instance.new("ImageLabel")
avatar.Parent = discordBox
avatar.Size = UDim2.new(0,28,0,28)
avatar.Position = UDim2.new(0,6,0.5,-14)
avatar.BackgroundTransparency = 1
avatar.ScaleType = Enum.ScaleType.Fit
avatar.ZIndex = 21
local thumb = Players:GetUserThumbnailAsync(
	Player.UserId,
	Enum.ThumbnailType.HeadShot,
	Enum.ThumbnailSize.Size100x100
)
avatar.Image = thumb

--------------------------------------------------
-- Scrolling Text
--------------------------------------------------
local discordText = Instance.new("TextLabel")
discordText.Parent = discordBox
discordText.Size = UDim2.new(0,900,1,0)
discordText.Position = UDim2.new(0,42,0,0)
discordText.BackgroundTransparency = 1
discordText.Font = Enum.Font.GothamBold
discordText.TextScaled = true
discordText.RichText = true
discordText.TextXAlignment = Enum.TextXAlignment.Left
discordButton.MouseButton1Click:Connect(function()
    local url = "https://discord.gg/2tTJxRk2ct"
    if syn and syn.open_url then
        syn.open_url(url)
    elseif getgenv().open_url then
        getgenv().open_url(url)
    elseif setclipboard then
        setclipboard(url)
    elseif toclipboard then
        toclipboard(url)
    end
end)
task.spawn(function()
    while true do
        discordText.Position = UDim2.new(1,42,0,0)
        local tween = TweenService:Create(
            discordText,
            TweenInfo.new(
                15,
                Enum.EasingStyle.Linear
            ),
            {
                Position = UDim2.new(
                    0,
                    -950,
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

--------------------------------------------------
-- Sidebar Border (Blue)
--------------------------------------------------
local sidebarBorder = Instance.new("Frame")
sidebarBorder.Parent = content
sidebarBorder.Position = UDim2.new(0,5,0,5)
sidebarBorder.Size = UDim2.new(0,165,1,-10)
sidebarBorder.BackgroundTransparency = 1
sidebarBorder.ZIndex = 0
local sideCorner = Instance.new("UICorner")
sideCorner.Parent = sidebarBorder
sideCorner.CornerRadius = UDim.new(0,15)
local sideStroke = Instance.new("UIStroke")
sideStroke.Parent = sidebarBorder
sideStroke.Color = Color3.fromRGB(60,190,255)
sideStroke.Thickness = 2.5
sideStroke.Transparency = 0
sidebar.Position = UDim2.new(0,0,0,0)
sidebar.Size = UDim2.new(0,170,1,0)
sidebar.BackgroundColor3 = Color3.fromRGB(22,26,40)
sidebar.BorderSizePixel = 0
local sidebarCorner = Instance.new("UICorner")
sidebarCorner.Parent = sidebar
sidebarCorner.CornerRadius = UDim.new(0,18)
local sideGradient = Instance.new("UIGradient")
sideGradient.Parent = sidebar
sideGradient.Rotation = 90
sideGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0,Color3.fromRGB(40,44,60)),
    ColorSequenceKeypoint.new(1,Color3.fromRGB(20,22,32))
}
task.spawn(function()
    local hue = 0
    while sidebar.Parent do
        if Config.RainbowBorder then
            sideStroke.Color = Color3.fromHSV(hue,1,1)
        else
            sideStroke.Color = Color3.fromRGB(0,170,255) -- Xanh dương
        end
        hue += 0.003
        if hue >= 1 then
            hue = 0
        end
        RunService.RenderStepped:Wait()
    end
end)
sideStroke.Transparency = 0.15
sideStroke.Thickness = 1
local glow = Instance.new("UIStroke")
glow.Parent = sidebarBorder
glow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
glow.Color = Color3.fromRGB(0,170,255)
glow.Thickness = 6
glow.Transparency = 0.82

---------------------------------------------------
-- PAGE CONTAINER (RIGHT SIDE)
---------------------------------------------------
local pageContainer = Instance.new("Frame")
getgenv().FishHub.pageContainer = pageContainer
pageContainer.Parent = content

--------------------------------------------------
-- Content Border (Purple)
--------------------------------------------------
local contentBorder = Instance.new("Frame")
contentBorder.Parent = content
contentBorder.Position = UDim2.new(0,175,0,5)
contentBorder.Size = UDim2.new(1,-180,1,-10)
contentBorder.BackgroundTransparency = 1
contentBorder.ZIndex = 0
local contentCorner = Instance.new("UICorner")
contentCorner.Parent = contentBorder
contentCorner.CornerRadius = UDim.new(0,15)
local contentStroke = Instance.new("UIStroke")
contentStroke.Parent = contentBorder
contentStroke.Color = Color3.fromRGB(0,170,255)
contentStroke.Transparency = 0
contentStroke.Thickness = 2.5
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
    btn.BackgroundColor3 = Color3.fromRGB(30,34,48)
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
    	TweenService:Create(
        	btn,
        	TweenInfo.new(0.2),
        	{
            	BackgroundColor3 = Color3.fromRGB(55,65,90)
        	}
    	):Play()
	end)
	btn.MouseLeave:Connect(function()
	    TweenService:Create(
	        btn,
	        TweenInfo.new(0.2),
	        {
	            BackgroundColor3 =
    				Config.Theme == "Light"
    				and Color3.fromRGB(220,220,220)
					or Color3.fromRGB(30,34,48)
	        }
	    ):Play()
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
-- Clear Current Page
--------------------------------------------------
local function ClearContent()
    for _,v in ipairs(pageContainer:GetChildren()) do
        v:Destroy()
    end
end
getgenv().FishHub.ClearContent = ClearContent

--------------------------------------------------
-- LOAD SETTINGS SCRIPT
--------------------------------------------------
OpenSettings = function()
    ClearContent()
    local SettingsURL = 
    "https://raw.githubusercontent.com/Cachuoine/DHL/refs/heads/main/Setting.lua"
    local success, result = pcall(function()
        local script = game:HttpGet(SettingsURL)
        loadstring(script)()
    end)
    if not success then
        warn("Cannot load Settings:", result)
    end
end

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

---------------------------------------------------------------------
--// DROPDOWN SYSTEM
---------------------------------------------------------------------
local CurrentDropdown
local function CreateDropdown(parent, button, options, callback)
    if CurrentDropdown then
        CurrentDropdown:Destroy()
    end
    local dropdown = Instance.new("Frame")
    dropdown.Parent = parent
    dropdown.Size = UDim2.new(0,130,0,0)
    dropdown.BackgroundColor3 = Color3.fromRGB(25,30,45)
    dropdown.BorderSizePixel = 0
    dropdown.ZIndex = 100
    local abs = button.AbsolutePosition
    local size = button.AbsoluteSize
    dropdown.Position = UDim2.new(
        0,
        abs.X - parent.AbsolutePosition.X,
        0,
        abs.Y - parent.AbsolutePosition.Y + size.Y + 5
    )
    local corner = Instance.new("UICorner")
    corner.Parent = dropdown
    corner.CornerRadius = UDim.new(0,10)
    local stroke = Instance.new("UIStroke")
    stroke.Parent = dropdown
    stroke.Color = Color3.fromRGB(0,170,255)
    stroke.Thickness = 1.5
    local layout = Instance.new("UIListLayout")
    layout.Parent = dropdown
    layout.Padding = UDim.new(0,5)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    for _,name in ipairs(options) do
        local option = Instance.new("TextButton")
        option.Parent = dropdown
        option.Size = UDim2.new(1,-10,0,28)
        option.BackgroundColor3 = Color3.fromRGB(40,45,60)
        option.Text = name
        option.TextColor3 = Color3.new(1,1,1)
        option.Font = Enum.Font.GothamBold
        option.TextSize = 14
        option.ZIndex = 101
        local c = Instance.new("UICorner")
        c.Parent = option
        c.CornerRadius = UDim.new(0,8)
        option.MouseButton1Click:Connect(function()
            button.Text = name.." ▼"
            if callback then
                callback(name)
            end
            dropdown:Destroy()
            CurrentDropdown=nil
        end)
    end
    dropdown.Size = UDim2.new(
        0,
        130,
        0,
        (#options * 33)
    )
    CurrentDropdown = dropdown
end
getgenv().FishHub.CreateDropdown = CreateDropdown

---------------------------------------------------------------------
--// GUI ANIMATION SYSTEM
---------------------------------------------------------------------
local UIAnimating = false
local function OpenGUI()
    if UIAnimating then 
        return 
    end
    if not Config.GUIAnimation then
        main.Visible = true
        main.Size = UDim2.new(0,700,0,480)
        main.BackgroundTransparency = 0.16
        return
    end
    UIAnimating = true
    main.Visible = true
    main.Size = UDim2.new(0,560,0,380)
    main.BackgroundTransparency = 1
    TweenService:Create(
        main,
        TweenInfo.new(
            0.45,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.Out
        ),
        {
            Size = UDim2.new(0,700,0,480),
            BackgroundTransparency = 0.16
        }
    ):Play()
    UIAnimating = false
end
local function CloseGUI()
    if UIAnimating then 
        return 
    end
    if not Config.GUIAnimation then
        main.Visible = false
        return
    end
    UIAnimating = true
    local tween = TweenService:Create(
        main,
        TweenInfo.new(
            0.35,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.In
        ),
        {
            Size = UDim2.new(0,560,0,380),
            BackgroundTransparency = 1
        }
    )
    tween:Play()
    tween.Completed:Wait()
    main.Visible = false
    main.Size = UDim2.new(0,700,0,480)
    UIAnimating = false
end
local function ToggleMain()
    if main.Visible then
        CloseGUI()
    else
        OpenGUI()
    end
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
lineButton.MouseButton1Click:Connect(function()
    ToggleMain()
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
    CloseGUI()
end)


local executor = identifyexecutor and identifyexecutor() or "Unknown"
local username = Player.Name
local version = "v1.0.0"

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
discordText.Text = string.format(
    "<font color='#4C9AFF'>◆ USER:</font> %s" ..
    "<font color='#B45CFF'> ┆ ◆ EXECUTOR:</font> %s" ..
    "<font color='#4C9AFF'> ┆ ◆ VERSION:</font> %s" ..
    "<font color='#B45CFF'> ┆ ◆ CRE:</font> DaoHuyLam",
    username,
    executor,
    version
)
    task.wait(0.2)
end
