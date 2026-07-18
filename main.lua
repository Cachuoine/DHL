local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer
local MarketplaceService = game:GetService("MarketplaceService")

--------------------------------------------------
-- Supported Games
--------------------------------------------------
local Games = {
    {
        Name = "Evomon",
        PlaceId = 134381727982611,
        Script = "https://raw.githubusercontent.com/Cachuoine/DHL/refs/heads/main/UI.lua"
    }
}
local gameName = "Unknown"
local gameScript
for _, v in ipairs(Games) do
    if game.PlaceId == v.PlaceId then
        gameName = v.Name
        gameScript = v.Script
        break
    end
end
if not gameScript then
    local success, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    print("PlaceId:", game.PlaceId)
    print("Success:", success)

    if success and info then
        print("Name:", info.Name)
        gameName = info.Name
    else
        warn(info)
    end
end

--------------------------------------------------
-- Detect Executor
--------------------------------------------------
local executor = "Unknown"
pcall(function()
    if identifyexecutor then
        executor = identifyexecutor()
    elseif getexecutorname then
        executor = getexecutorname()
    end
end)

--------------------------------------------------
-- GUI
--------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "FishHubLoader"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = Player.PlayerGui

--------------------------------------------------
-- Background
--------------------------------------------------
local bg = Instance.new("Frame")
bg.Parent = gui
bg.Size = UDim2.fromScale(1,1)
bg.BackgroundColor3 = Color3.new()
bg.BackgroundTransparency = .35
bg.BorderSizePixel = 0

--------------------------------------------------
-- Window
--------------------------------------------------
local frame = Instance.new("Frame")
frame.Parent = gui
frame.AnchorPoint = Vector2.new(.5,.5)
frame.Position = UDim2.fromScale(.5,.5)
frame.Size = UDim2.new(0,520,0,330)
frame.BackgroundColor3 = Color3.fromRGB(15,18,30)
frame.BorderSizePixel = 0
Instance.new("UICorner",frame).CornerRadius = UDim.new(0,18)
local stroke = Instance.new("UIStroke")
stroke.Parent = frame
stroke.Thickness = 2
task.spawn(function()
    local h = 0
    while gui.Parent do
        stroke.Color = Color3.fromHSV(h,1,1)
        h += .002
        if h >= 1 then
            h = 0
        end
        RunService.RenderStepped:Wait()
    end
end)

--------------------------------------------------
-- Title
--------------------------------------------------
local title = Instance.new("TextLabel")
title.Parent = frame
title.BackgroundTransparency = 1
title.Size = UDim2.new(1,0,0,55)
title.Font = Enum.Font.GothamBold
title.Text = "FishHub"
title.TextSize = 30
title.TextColor3 = Color3.new(1,1,1)

--------------------------------------------------
-- Close Button
--------------------------------------------------
local closeBtn = Instance.new("TextButton")
closeBtn.Parent = frame
closeBtn.Size = UDim2.new(0,36,0,36)
closeBtn.Position = UDim2.new(1,-48,0,12)
closeBtn.BackgroundColor3 = Color3.fromRGB(55,55,60)
closeBtn.BorderSizePixel = 0
closeBtn.Text = "×"
closeBtn.Font = Enum.Font.Legacy
closeBtn.TextSize = 22
closeBtn.TextColor3 = Color3.fromRGB(240,240,240)
closeBtn.AutoButtonColor = false
closeBtn.ZIndex = 10
local closeCorner = Instance.new("UICorner")
closeCorner.Parent = closeBtn
closeCorner.CornerRadius = UDim.new(0,12)
closeBtn.MouseEnter:Connect(function()
    TweenService:Create(
        closeBtn,
        TweenInfo.new(0.15),
        {
            BackgroundColor3 = Color3.fromRGB(80,80,85)
        }
    ):Play()
end)
closeBtn.MouseLeave:Connect(function()
    TweenService:Create(
        closeBtn,
        TweenInfo.new(0.15),
        {
            BackgroundColor3 = Color3.fromRGB(80,80,90)
        }
    ):Play()
end)
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

--------------------------------------------------
-- Divider
--------------------------------------------------
local line = Instance.new("Frame")
line.Parent = frame
line.Size = UDim2.new(.9,0,0,2)
line.Position = UDim2.new(.05,0,0,55)
line.BackgroundColor3 = Color3.fromRGB(0,170,255)
line.BorderSizePixel = 0

--------------------------------------------------
-- Info
--------------------------------------------------
local info = Instance.new("TextLabel")
info.Parent = frame
info.BackgroundTransparency = 1
info.Position = UDim2.new(.08,0,0,65)
info.Size = UDim2.new(.84,0,0,150)
info.TextXAlignment = Enum.TextXAlignment.Left
info.TextYAlignment = Enum.TextYAlignment.Top
info.Font = Enum.Font.Code
info.TextSize = 19
info.RichText = true
info.Text =
"<font color='#00AAFF'>⚡ Version :</font> 0.0.1\n\n"..
"<font color='#FF6666'>🎮 Game :</font> "..gameName.."\n\n"..
"<font color='#00FF99'>👤 Username :</font> "..Player.Name.."\n\n"..
"<font color='#FFD966'>🖥️ Executor :</font> "..executor.."\n\n"..
"<font color='#00FF66'>🌐 Status :</font> Working"
info.TextColor3 = Color3.new(1,1,1)

--------------------------------------------------
-- Continue
--------------------------------------------------
local btn = Instance.new("TextButton")
btn.Parent = frame
btn.AnchorPoint = Vector2.new(.5,1)
btn.Position = UDim2.new(.5,0,1,-18)
btn.Size = UDim2.new(0,180,0,42)
btn.Text = "Continue"
btn.Font = Enum.Font.GothamBold
btn.TextSize = 20
btn.TextColor3 = Color3.new(1,1,1)
btn.BackgroundColor3 = Color3.fromRGB(0,170,255)
Instance.new("UICorner",btn).CornerRadius = UDim.new(1,0)

--------------------------------------------------
-- Check Game
--------------------------------------------------
if not gameScript then
    btn.Text = "Unsupported Game"
    btn.BackgroundColor3 = Color3.fromRGB(255,50,50)
    btn.Active = false
end

--------------------------------------------------
-- Animation
--------------------------------------------------
frame.Size = UDim2.new(0,0,0,0)
TweenService:Create(
    frame,
    TweenInfo.new(.35,Enum.EasingStyle.Back),
    {
        Size = UDim2.new(0,520,0,330)
    }
):Play()

--------------------------------------------------
-- Continue
--------------------------------------------------
btn.MouseButton1Click:Connect(function()
if not gameScript then
    return
end
    TweenService:Create(
        frame,
        TweenInfo.new(.25),
        {
            Size = UDim2.new(0,0,0,0),
            BackgroundTransparency = 1
        }
    ):Play()
    TweenService:Create(
        bg,
        TweenInfo.new(.25),
        {
            BackgroundTransparency = 1
        }
    ):Play()
    task.wait(0.3)
    gui:Destroy()
loadstring(game:HttpGet(gameScript))()
end)
