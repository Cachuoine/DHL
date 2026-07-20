local FishHub = getgenv().FishHub

local page = FishHub.pageContainer

if not page then
    return
end


--------------------------------------------------
-- TITLE
--------------------------------------------------

local title = Instance.new("TextLabel")

title.Parent = page
title.BackgroundTransparency = 1

title.Position = UDim2.new(
    0,
    20,
    0,
    20
)

title.Size = UDim2.new(
    1,
    -40,
    0,
    40
)

title.Text = "Settings"

title.Font = Enum.Font.GothamBold

title.TextSize = 26

title.TextColor3 = Color3.fromRGB(
    255,
    255,
    255
)


--------------------------------------------------
-- BUTTON EXAMPLE
--------------------------------------------------

local button = Instance.new("TextButton")

button.Parent = page

button.Position = UDim2.new(
    0,
    20,
    0,
    80
)

button.Size = UDim2.new(
    0,
    200,
    0,
    40
)


button.Text = "Rainbow Border"

button.Font = Enum.Font.GothamBold

button.TextSize = 16

button.TextColor3 = Color3.new(1,1,1)

button.BackgroundColor3 =
Color3.fromRGB(40,45,60)


local corner = Instance.new("UICorner")
corner.Parent = button


button.MouseButton1Click:Connect(function()

    FishHub.Config.RainbowBorder =
    not FishHub.Config.RainbowBorder

end)
