local FishHub = getgenv().FishHub

local page = FishHub.pageContainer

if not page then
    return
end


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

card.Position =
UDim2.new(
    0,
    20,
    0,
    y
)

card.Size =
UDim2.new(
    1,
    -40,
    0,
    70
)


card.BackgroundColor3 =
Color3.fromRGB(30,35,50)

card.BorderSizePixel = 0


local corner =
Instance.new("UICorner")

corner.Parent = card

corner.CornerRadius =
UDim.new(0,12)



local stroke =
Instance.new("UIStroke")

stroke.Parent = card

stroke.Color =
Color3.fromRGB(0,170,255)

stroke.Transparency =
0.5



--------------------------------------------------
-- NAME
--------------------------------------------------

local txt =
Instance.new("TextLabel")

txt.Parent = card

txt.BackgroundTransparency = 1

txt.Position =
UDim2.new(
0,
15,
0,
8
)

txt.Size =
UDim2.new(
0.6,
0,
0,
25
)


txt.Text =
name


txt.Font =
Enum.Font.GothamBold


txt.TextSize =
17


txt.TextColor3 =
Color3.new(1,1,1)


txt.TextXAlignment =
Enum.TextXAlignment.Left



--------------------------------------------------
-- DESCRIPTION
--------------------------------------------------

local desc =
Instance.new("TextLabel")

desc.Parent = card

desc.BackgroundTransparency = 1

desc.Position =
UDim2.new(
0,
15,
0,
34
)

desc.Size =
UDim2.new(
0.7,
0,
0,
20
)


desc.Text =
description


desc.Font =
Enum.Font.Gotham


desc.TextSize =
13


desc.TextColor3 =
Color3.fromRGB(
160,
160,
180
)


desc.TextXAlignment =
Enum.TextXAlignment.Left



--------------------------------------------------
-- TOGGLE
--------------------------------------------------

local toggle =
Instance.new("TextButton")


toggle.Parent = card


toggle.Size =
UDim2.new(
0,
60,
0,
30
)


toggle.Position =
UDim2.new(
1,
-75,
0.5,
-15
)


toggle.Font =
Enum.Font.GothamBold


toggle.TextSize =
14


toggle.TextColor3 =
Color3.new(1,1,1)


local function Update()

if state then

toggle.Text="ON"

toggle.BackgroundColor3 =
Color3.fromRGB(
0,
170,
90
)

else

toggle.Text="OFF"

toggle.BackgroundColor3 =
Color3.fromRGB(
180,
60,
60
)

end

end


local tc =
Instance.new("UICorner")

tc.Parent=toggle

tc.CornerRadius =
UDim.new(1,0)



Update()



toggle.MouseButton1Click:Connect(function()

state =
not state


Update()


callback(state)

end)


end



--------------------------------------------------
-- SETTINGS LIST
--------------------------------------------------


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

true
)
