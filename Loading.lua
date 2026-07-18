local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

--------------------------------------------------
-- GUI
--------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "FishHubLoading"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = Player:WaitForChild("PlayerGui")

--------------------------------------------------
-- Background
--------------------------------------------------
local bg = Instance.new("Frame")
bg.Parent = gui
bg.Size = UDim2.fromScale(1,1)
bg.BackgroundColor3 = Color3.fromRGB(12,15,22)
bg.BackgroundTransparency = 0.15
bg.BorderSizePixel = 0

--------------------------------------------------
-- Panel
--------------------------------------------------
local panel = Instance.new("Frame")
panel.Parent = bg
panel.Size = UDim2.new(0,420,0,300)
panel.AnchorPoint = Vector2.new(.5,.5)
panel.Position = UDim2.new(.5,0,.5,0)
panel.BackgroundColor3 = Color3.fromRGB(22,25,35)
panel.BorderSizePixel = 0
Instance.new("UICorner",panel).CornerRadius = UDim.new(0,16)
panel.Size = UDim2.new(0,0,0,0)
local stroke = Instance.new("UIStroke")
stroke.Parent = panel
stroke.Thickness = 3
stroke.LineJoinMode = Enum.LineJoinMode.Round
task.spawn(function()
	local hue = 0
	while gui.Parent do
		hue = hue + 0.01
		if hue >= 1 then
			hue = 0
		end
		stroke.Color = Color3.fromHSV(hue, 1, 1)
		task.wait(0.03)
	end
end)

--------------------------------------------------
-- Title
--------------------------------------------------
local title = Instance.new("TextLabel")
title.Parent = panel
title.BackgroundTransparency = 1
title.Size = UDim2.new(1,0,0,35)
title.Position = UDim2.new(0,0,0,18)
title.Font = Enum.Font.GothamBold
title.Text = "🐟 FishHub"
title.TextSize = 30
title.TextColor3 = Color3.new(1,1,1)

--------------------------------------------------
-- Divider
--------------------------------------------------
local topLine = Instance.new("Frame")
topLine.Parent = panel
topLine.Size = UDim2.new(1,-40,0,2)
topLine.Position = UDim2.new(0,20,0,70)
topLine.BackgroundColor3 = Color3.fromRGB(70,70,80)
topLine.BorderSizePixel = 0

--------------------------------------------------
-- Steps
--------------------------------------------------
local function CreateStep(text,y)
	local lbl = Instance.new("TextLabel")
	lbl.Parent = panel
	lbl.BackgroundTransparency = 1
	lbl.Size = UDim2.new(1,-40,0,24)
	lbl.Position = UDim2.new(0,20,0,y)
	lbl.Font = Enum.Font.Gotham
	lbl.TextSize = 18
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.TextColor3 = Color3.fromRGB(130,130,130)
	lbl.Text = "○ "..text
	return lbl
end
local Step1 = CreateStep("Initializing...",85)
local Step2 = CreateStep("Detecting Game...",115)
local Step3 = CreateStep("Loading Assets...",145)
local Step4 = CreateStep("Building Interface...",175)

--------------------------------------------------
-- Divider
--------------------------------------------------
local bottomLine = topLine:Clone()
bottomLine.Parent = panel
bottomLine.Position = UDim2.new(0,20,0,210)

--------------------------------------------------
-- Progress
--------------------------------------------------
local outline = Instance.new("Frame")
outline.Parent = panel
outline.Size = UDim2.new(0,320,0,12)
outline.Position = UDim2.new(.5,-160,0,230)
outline.BackgroundColor3 = Color3.fromRGB(45,45,55)
outline.BorderSizePixel = 0
Instance.new("UICorner",outline).CornerRadius = UDim.new(1,0)
local fill = Instance.new("Frame")
fill.Parent = outline
fill.Size = UDim2.new(0,0,1,0)
fill.BackgroundColor3 = Color3.fromRGB(0,170,255)
fill.BorderSizePixel = 0
Instance.new("UICorner",fill).CornerRadius = UDim.new(1,0)

--------------------------------------------------
-- Percent
--------------------------------------------------
local percent = Instance.new("TextLabel")
percent.Parent = panel
percent.BackgroundTransparency = 1
percent.Size = UDim2.new(1,0,0,24)
percent.Position = UDim2.new(0,0,0,250)
percent.Font = Enum.Font.GothamBold
percent.TextSize = 20
percent.Text = "0%"
percent.TextColor3 = Color3.new(1,1,1)

--------------------------------------------------
-- Function
--------------------------------------------------
local function Finish(step)
	step.Text = step.Text:gsub("○","✓")
	step.TextColor3 = Color3.new(1,1,1)
end
local function LoadStage(first,last,step)
	for i = first,last do
		fill.Size = UDim2.new(i/100,0,1,0)
		percent.Text = i.."%"
		task.wait(0.03)
	end
	Finish(step)
end

--------------------------------------------------
-- Loading
--------------------------------------------------
TweenService:Create(
    panel,
    TweenInfo.new(0.35, Enum.EasingStyle.Back),
    {
        Size = UDim2.new(0,420,0,300)
    }
):Play()
task.wait(0.4)
LoadStage(1,8,Step1)
LoadStage(9,35,Step2)
LoadStage(36,70,Step3)
LoadStage(71,100,Step4)
task.wait(0.5)
local close = TweenService:Create(
    panel,
    TweenInfo.new(
        0.3,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.In
    ),
    {
        Size = UDim2.new(0,0,0,0)
    }
)
close:Play()
close.Completed:Wait()
gui:Destroy()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Cachuoine/DHL/refs/heads/main/main.lua"))()
