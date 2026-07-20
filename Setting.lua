local TweenService =
game:GetService("TweenService")

local FishHub = getgenv().FishHub


if not FishHub.Config then
    FishHub.Config = {}
end


local page = FishHub.pageContainer


--------------------------------------------------
-- CLEAR OLD CONTENT
--------------------------------------------------

for _,v in pairs(page:GetChildren()) do
    v:Destroy()
end


--------------------------------------------------
-- TITLE
--------------------------------------------------

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

subtitle.Position = UDim2.new(
    0,
    22,
    0,
    50
)

subtitle.Size = UDim2.new(
    1,
    -40,
    0,
    25
)

subtitle.Text =
"Customize FishHub interface"

subtitle.Font = Enum.Font.Gotham

subtitle.TextSize = 14

subtitle.TextColor3 =
Color3.fromRGB(160,160,180)

subtitle.TextXAlignment =
Enum.TextXAlignment.Left



--------------------------------------------------
-- CREATE SETTING CARD
--------------------------------------------------

local function CreateSetting(
    name,
    description,
    y,
    callback,
    state
)


local card = Instance.new("Frame")
card.Parent = page
card.Position = UDim2.new(0,20,0,y)
card.Size = UDim2.new(1,-40,0,75)

card.BackgroundColor3 =
Color3.fromRGB(25,30,45)

card.BorderSizePixel = 0


local corner = Instance.new("UICorner")
corner.Parent = card
corner.CornerRadius = UDim.new(0,14)



local stroke = Instance.new("UIStroke")
stroke.Parent = card
stroke.Color =
Color3.fromRGB(0,170,255)

stroke.Transparency = 0.65
stroke.Thickness = 1



--------------------------------------------------
-- TITLE
--------------------------------------------------

local title = Instance.new("TextLabel")

title.Parent = card

title.BackgroundTransparency = 1

title.Position =
UDim2.new(0,18,0,10)

title.Size =
UDim2.new(.6,0,0,25)


title.Text = name

title.Font =
Enum.Font.GothamBold

title.TextSize = 17

title.TextColor3 =
Color3.new(1,1,1)

title.TextXAlignment =
Enum.TextXAlignment.Left



--------------------------------------------------
-- DESCRIPTION
--------------------------------------------------

local desc = Instance.new("TextLabel")

desc.Parent = card

desc.BackgroundTransparency = 1

desc.Position =
UDim2.new(0,18,0,38)

desc.Size =
UDim2.new(.7,0,0,20)


desc.Text =
description


desc.Font =
Enum.Font.Gotham

desc.TextSize = 13

desc.TextColor3 =
Color3.fromRGB(
150,
150,
170
)

desc.TextXAlignment =
Enum.TextXAlignment.Left



--------------------------------------------------
-- SWITCH BACKGROUND
--------------------------------------------------

local switch =
Instance.new("Frame")

switch.Parent = card

switch.Size =
UDim2.new(
0,
55,
0,
28
)

switch.Position =
UDim2.new(
1,
-75,
0.5,
-14
)


local switchCorner =
Instance.new("UICorner")

switchCorner.Parent = switch

switchCorner.CornerRadius =
UDim.new(1,0)



--------------------------------------------------
-- CIRCLE
--------------------------------------------------

local circle =
Instance.new("Frame")

circle.Parent = switch

circle.Size =
UDim2.new(
0,
22,
0,
22
)

circle.Position =
UDim2.new(
0,
3,
0.5,
-11
)


local circleCorner =
Instance.new("UICorner")

circleCorner.Parent=circle

circleCorner.CornerRadius =
UDim.new(1,0)


circle.BackgroundColor3 =
Color3.fromRGB(
240,
240,
240
)



--------------------------------------------------
-- UPDATE
--------------------------------------------------

local function Update()

if state then


TweenService:Create(
switch,
TweenInfo.new(.25),
{
BackgroundColor3 =
Color3.fromRGB(
0,
170,
100
)
}
):Play()


TweenService:Create(
circle,
TweenInfo.new(.25),
{
Position =
UDim2.new(
1,
-25,
0.5,
-11
)
}
):Play()



else


TweenService:Create(
switch,
TweenInfo.new(.25),
{
BackgroundColor3 =
Color3.fromRGB(
70,
70,
80
)
}
):Play()


TweenService:Create(
circle,
TweenInfo.new(.25),
{
Position =
UDim2.new(
0,
3,
0.5,
-11
)
}
):Play()


end

end



Update()



--------------------------------------------------
-- CLICK
--------------------------------------------------

local click =
Instance.new("TextButton")

click.Parent = card

click.BackgroundTransparency = 1

click.Size =
UDim2.new(1,0,1,0)

click.Text = ""


click.MouseButton1Click:Connect(function()

state = not state

Update()

callback(state)

end)


end

CreateSetting(
"🌈 Rainbow Border",
"Animated rainbow outline",
90,

function(value)

FishHub.Config.RainbowBorder =
value

end,

FishHub.Config.RainbowBorder
)



CreateSetting(
"✨ GUI Animation",
"Open and close animation",
175,

function(value)

FishHub.Config.GUIAnimation =
value

end,

FishHub.Config.GUIAnimation
)

CreateSetting(
"🔵 Border Glow",
"Enable neon border effect",
260,

function(value)

FishHub.Config.BorderGlow =
value

end,

FishHub.Config.BorderGlow
)
