--================================================================
-- FishHub Premium - Modern Spinner Loading & Sleek Glass Key System
--================================================================
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

if CoreGui:FindFirstChild("FishHubUltimate") then
    CoreGui.FishHubUltimate:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FishHubUltimate"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999999

-- Cấu hình màu sắc Cyberpunk / Glassmorphism
local C_BG = Color3.fromRGB(12, 14, 22)
local C_CYAN = Color3.fromRGB(0, 240, 255)
local C_PURPLE = Color3.fromRGB(139, 92, 246)
local KEY_FILE = "FishHub_SavedKey.txt"
local WEBSITE_URL = "https://fishhub-online.netlify.app/"
local ADMIN_KEY = "DaoHuyLam22052009"

local function round(obj, radius)
    local uic = Instance.new("UICorner")
    uic.CornerRadius = UDim.new(0, radius)
    uic.Parent = obj
end

local function checkKeyValid(keyStr)
    if not keyStr or type(keyStr) ~= "string" then return false end
    if keyStr == ADMIN_KEY then return true end
    local split = string.split(keyStr, "-")
    if #split >= 3 and split[1] == "FishHub" then
        local ts = tonumber(split[3])
        if ts and (os.time() - ts) <= 86400 then return true end
    end
    return false
end

-- Hàm thực thi tải UI chính từ file Checking.lua
local function loadMainUI()
    pcall(function()
        local code = game:HttpGet("https://raw.githubusercontent.com/Cachuoine/DHL/refs/heads/main/Checking.lua")
        if code and code ~= "" then
            loadstring(code)()
        end
    end)
end

-- Hiệu ứng mờ nền
local BlurEffect = Instance.new("BlurEffect", Lighting)
BlurEffect.Size = 0
TweenService:Create(BlurEffect, TweenInfo.new(0.8), {Size = 22}):Play()

--============= 1. CINEMATIC LOADING SCREEN (XOÁY TRÒN KÉP) ==============
local LoadBg = Instance.new("Frame", ScreenGui)
LoadBg.Size = UDim2.new(0, 320, 0, 160)
LoadBg.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadBg.AnchorPoint = Vector2.new(0.5, 0.5)
LoadBg.BackgroundColor3 = C_BG
LoadBg.BackgroundTransparency = 0.15
LoadBg.ClipsDescendants = true
round(LoadBg, 18)

local LoadStroke = Instance.new("UIStroke", LoadBg)
LoadStroke.Color = C_CYAN
LoadStroke.Thickness = 1.5
LoadStroke.Transparency = 0.3

local OuterSpinner = Instance.new("Frame", LoadBg)
OuterSpinner.Size = UDim2.new(0, 50, 0, 50)
OuterSpinner.Position = UDim2.new(0.5, -25, 0.2, 0)
OuterSpinner.BackgroundTransparency = 1
round(OuterSpinner, 50)
local OuterStroke = Instance.new("UIStroke", OuterSpinner)
OuterStroke.Color = C_CYAN
OuterStroke.Thickness = 3

local InnerSpinner = Instance.new("Frame", LoadBg)
InnerSpinner.Size = UDim2.new(0, 32, 0, 32)
InnerSpinner.Position = UDim2.new(0.5, -16, 0.2, 9)
InnerSpinner.BackgroundTransparency = 1
round(InnerSpinner, 50)
local InnerStroke = Instance.new("UIStroke", InnerSpinner)
InnerStroke.Color = C_PURPLE
InnerStroke.Thickness = 2

local LoadText = Instance.new("TextLabel", LoadBg)
LoadText.Size = UDim2.new(1, 0, 0, 30)
LoadText.Position = UDim2.new(0, 0, 0.65, 0)
LoadText.BackgroundTransparency = 1
LoadText.Font = Enum.Font.GothamBold
LoadText.Text = "ESTABLISHING SECURE PROTOCOL..."
LoadText.TextColor3 = C_CYAN
LoadText.TextSize = 11

local spinOut = TweenService:Create(OuterSpinner, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {Rotation = 360})
local spinIn = TweenService:Create(InnerSpinner, TweenInfo.new(1.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {Rotation = -360})
spinOut:Play()
spinIn:Play()

--============= 2. KEY SYSTEM INTERFACE (SIÊU ĐẸP & MƯỢT) ==============
local KeyMain = Instance.new("Frame", ScreenGui)
KeyMain.Size = UDim2.new(0, 440, 0, 275)
KeyMain.Position = UDim2.new(0.5, 0, 0.5, 0)
KeyMain.AnchorPoint = Vector2.new(0.5, 0.5)
KeyMain.BackgroundColor3 = C_BG
KeyMain.BackgroundTransparency = 1
KeyMain.Visible = false
round(KeyMain, 22)

local MainStroke = Instance.new("UIStroke", KeyMain)
MainStroke.Color = C_CYAN
MainStroke.Thickness = 1.5
MainStroke.Transparency = 1

-- Nút đóng UI (Dấu nhân)
local CloseBtn = Instance.new("TextButton", KeyMain)
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -40, 0, 12)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(150, 160, 190)
CloseBtn.TextSize = 24
CloseBtn.TextTransparency = 1

CloseBtn.MouseButton1Click:Connect(function()
    TweenService:Create(BlurEffect, TweenInfo.new(0.4), {Size = 0}):Play()
    TweenService:Create(KeyMain, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()
    task.wait(0.3)
    BlurEffect:Destroy()
    ScreenGui:Destroy()
end)

CloseBtn.MouseEnter:Connect(function() TweenService:Create(CloseBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(239, 68, 68)}):Play() end)
CloseBtn.MouseLeave:Connect(function() TweenService:Create(CloseBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 160, 190)}):Play() end)

local Title = Instance.new("TextLabel", KeyMain)
Title.Size = UDim2.new(1, -50, 0, 30)
Title.Position = UDim2.new(0, 20, 0, 18)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBlack
Title.Text = "FISHHUB SECURITY"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextTransparency = 1

local SubTitle = Instance.new("TextLabel", KeyMain)
SubTitle.Size = UDim2.new(1, -40, 0, 18)
SubTitle.Position = UDim2.new(0, 20, 0, 48)
SubTitle.BackgroundTransparency = 1
SubTitle.Font = Enum.Font.GothamMedium
SubTitle.Text = "Enter your access token to unlock premium features."
SubTitle.TextColor3 = Color3.fromRGB(140, 150, 180)
SubTitle.TextSize = 12
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.TextTransparency = 1

local BoxWrap = Instance.new("Frame", KeyMain)
BoxWrap.Size = UDim2.new(0.9, 0, 0, 46)
BoxWrap.Position = UDim2.new(0.05, 0, 0.38, 0)
BoxWrap.BackgroundColor3 = Color3.fromRGB(18, 22, 35)
BoxWrap.BackgroundTransparency = 1
round(BoxWrap, 12)

local BoxStroke = Instance.new("UIStroke", BoxWrap)
BoxStroke.Color = Color3.fromRGB(70, 75, 105)
BoxStroke.Transparency = 1

local InputKey = Instance.new("TextBox", BoxWrap)
InputKey.Size = UDim2.new(1, -20, 1, 0)
InputKey.Position = UDim2.new(0, 10, 0, 0)
InputKey.BackgroundTransparency = 1
InputKey.Font = Enum.Font.GothamMedium
InputKey.PlaceholderText = "Paste your Access Token here..."
InputKey.PlaceholderColor3 = Color3.fromRGB(110, 120, 150)
InputKey.Text = ""
InputKey.TextColor3 = C_CYAN
InputKey.TextSize = 13
InputKey.TextTransparency = 1
InputKey.ClearTextOnFocus = false

local BtnCheck = Instance.new("TextButton", KeyMain)
BtnCheck.Size = UDim2.new(0.435, 0, 0, 44)
BtnCheck.Position = UDim2.new(0.05, 0, 0.70, 0)
BtnCheck.BackgroundColor3 = C_CYAN
BtnCheck.BackgroundTransparency = 1
BtnCheck.Font = Enum.Font.GothamBold
BtnCheck.Text = "VERIFY KEY"
BtnCheck.TextColor3 = Color3.fromRGB(12, 14, 22)
BtnCheck.TextSize = 13
BtnCheck.TextTransparency = 1
round(BtnCheck, 12)

local BtnGet = Instance.new("TextButton", KeyMain)
BtnGet.Size = UDim2.new(0.435, 0, 0, 44)
BtnGet.Position = UDim2.new(0.515, 0, 0.70, 0)
BtnGet.BackgroundColor3 = Color3.fromRGB(35, 40, 65)
BtnGet.BackgroundTransparency = 1
BtnGet.Font = Enum.Font.GothamBold
BtnGet.Text = "GET KEY"
BtnGet.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnGet.TextSize = 13
BtnGet.TextTransparency = 1
round(BtnGet, 12)

-- Kiểm tra Key đã lưu từ trước
task.spawn(function()
    task.wait(1.5)
    LoadText.Text = "CHECKING SAVED CREDENTIALS..."
    task.wait(0.8)

    local autoPassed = false
    if writefile and readfile and isfile and isfile(KEY_FILE) then
        local ok, saved = pcall(function() return readfile(KEY_FILE) end)
        if ok and checkKeyValid(saved) then
            autoPassed = true
        end
    end

    spinOut:Cancel()
    spinIn:Cancel()

    if autoPassed then
        LoadText.Text = "AUTO-LOGGED IN SUCCESSFULLY!"
        LoadText.TextColor3 = Color3.fromRGB(34, 197, 94)
        task.wait(0.8)
        TweenService:Create(BlurEffect, TweenInfo.new(0.6), {Size = 0}):Play()
        TweenService:Create(LoadBg, TweenInfo.new(0.4), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()
        task.wait(0.5)
        BlurEffect:Destroy()
        ScreenGui:Destroy()
        loadMainUI()
        return
    end

    -- Ẩn bảng Loading, hiện bảng Key mượt mà
    TweenService:Create(LoadBg, TweenInfo.new(0.4), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()
    task.wait(0.3)
    LoadBg.Visible = false

    KeyMain.Visible = true
    TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundTransparency = 0.08}):Play()
    TweenService:Create(MainStroke, TweenInfo.new(0.4), {Transparency = 0.3}):Play()
    TweenService:Create(Title, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
    TweenService:Create(SubTitle, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
    TweenService:Create(CloseBtn, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
    TweenService:Create(BoxWrap, TweenInfo.new(0.4), {BackgroundTransparency = 0.2}):Play()
    TweenService:Create(BoxStroke, TweenInfo.new(0.4), {Transparency = 0}):Play()
    TweenService:Create(InputKey, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
    TweenService:Create(BtnCheck, TweenInfo.new(0.4), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
    TweenService:Create(BtnGet, TweenInfo.new(0.4), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
end)

-- Hiệu ứng Hover nút
BtnCheck.MouseEnter:Connect(function() TweenService:Create(BtnCheck, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 210, 230)}):Play() end)
BtnCheck.MouseLeave:Connect(function() TweenService:Create(BtnCheck, TweenInfo.new(0.2), {BackgroundColor3 = C_CYAN}):Play() end)

BtnGet.MouseEnter:Connect(function() TweenService:Create(BtnGet, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 58, 90)}):Play() end)
BtnGet.MouseLeave:Connect(function() TweenService:Create(BtnGet, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 40, 65)}):Play() end)

-- Xử lý nút Lấy Key
BtnGet.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(WEBSITE_URL) end
    SubTitle.Text = "URL copied to clipboard successfully!"
    SubTitle.TextColor3 = C_CYAN
    task.wait(2)
    SubTitle.Text = "Enter your access token to unlock premium features."
    SubTitle.TextColor3 = Color3.fromRGB(140, 150, 180)
end)

-- Xử lý nút Xác nhận Key
BtnCheck.MouseButton1Click:Connect(function()
    local userKey = InputKey.Text
    if checkKeyValid(userKey) then
        if writefile then pcall(function() writefile(KEY_FILE, userKey) end) end

        SubTitle.Text = (userKey == ADMIN_KEY) and "Admin access granted!" or "Access granted successfully!"
        SubTitle.TextColor3 = Color3.fromRGB(34, 197, 94)
        MainStroke.Color = Color3.fromRGB(34, 197, 94)

        task.wait(0.8)
        TweenService:Create(BlurEffect, TweenInfo.new(0.6), {Size = 0}):Play()
        
        local closeTween = TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1})
        for _, v in ipairs(KeyMain:GetDescendants()) do
            if v:IsA("TextLabel") or v:IsA("TextBox") or v:IsA("TextButton") then
                TweenService:Create(v, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
            elseif v:IsA("UIStroke") then
                TweenService:Create(v, TweenInfo.new(0.2), {Transparency = 1}):Play()
            elseif v:IsA("Frame") then
                TweenService:Create(v, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
            end
        end

        closeTween:Play()
        closeTween.Completed:Wait()
        BlurEffect:Destroy()
        ScreenGui:Destroy()
        loadMainUI()
    else
        SubTitle.Text = "Invalid or expired key. Please try again!"
        SubTitle.TextColor3 = Color3.fromRGB(239, 68, 68)
        BoxStroke.Color = Color3.fromRGB(239, 68, 68)

        task.wait(1.5)
        SubTitle.Text = "Enter your access token to unlock premium features."
        SubTitle.TextColor3 = Color3.fromRGB(140, 150, 180)
        BoxStroke.Color = Color3.fromRGB(70, 75, 105)
    end
end)
