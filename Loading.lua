--========================================================
-- FishHub Premium - Cinematic Loading & Admin Key: DaoHuyLam22052009
--========================================================
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

-- Theme Colors
local C_BG = Color3.fromRGB(12, 14, 22)
local C_CYAN = Color3.fromRGB(0, 240, 255)
local C_PURPLE = Color3.fromRGB(139, 92, 246)
local KEY_FILE = "FishHub_SavedKey.txt"

-- CẤU HÌNH WEBSITE VÀ ADMIN KEY
local WEBSITE_URL = "https://fishhub-online.netlify.app/"
local ADMIN_KEY = "DaoHuyLam22052009" -- Key dành riêng cho Admin (vĩnh viễn, không hết hạn)

local function round(obj, radius)
    local uic = Instance.new("UICorner")
    uic.CornerRadius = UDim.new(0, radius)
    uic.Parent = obj
end

local function checkKeyValid(keyStr)
    -- Nếu đúng Admin Key thì hợp lệ ngay lập tức, không giới hạn thời gian
    if keyStr == ADMIN_KEY then
        return true
    end

    -- Kiểm tra key thường (24h)
    local split = string.split(keyStr, "-")
    if #split >= 3 and split[1] == "FishHub" then
        local ts = tonumber(split[3])
        if ts and (os.time() - ts) <= 86400 then
            return true
        end
    end
    return false
end

-- LÀM MỜ MÀN HÌNH GAME
local BlurEffect = Instance.new("BlurEffect")
BlurEffect.Size = 0
BlurEffect.Parent = Lighting
TweenService:Create(BlurEffect, TweenInfo.new(1), {Size = 24}):Play()

--============= 1. DUAL SPINNER LOADING SCREEN =============
local LoadBg = Instance.new("Frame")
LoadBg.Size = UDim2.new(0, 0, 0, 0)
LoadBg.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadBg.BackgroundColor3 = C_BG
LoadBg.BackgroundTransparency = 0.1
LoadBg.ClipsDescendants = true
LoadBg.Parent = ScreenGui
LoadBg.AnchorPoint = Vector2.new(0.5, 0.5)
round(LoadBg, 16)

local LoadStroke = Instance.new("UIStroke")
LoadStroke.Color = C_CYAN
LoadStroke.Thickness = 2
LoadStroke.Transparency = 1
LoadStroke.Parent = LoadBg

local OuterSpinner = Instance.new("Frame", LoadBg)
OuterSpinner.Size = UDim2.new(0, 45, 0, 45)
OuterSpinner.Position = UDim2.new(0.5, -22.5, 0.2, 5)
OuterSpinner.BackgroundTransparency = 1
round(OuterSpinner, 50)
local OuterStroke = Instance.new("UIStroke", OuterSpinner)
OuterStroke.Color = C_CYAN
OuterStroke.Thickness = 3

local InnerSpinner = Instance.new("Frame", LoadBg)
InnerSpinner.Size = UDim2.new(0, 30, 0, 30)
InnerSpinner.Position = UDim2.new(0.5, -15, 0.2, 12.5)
InnerSpinner.BackgroundTransparency = 1
round(InnerSpinner, 50)
local InnerStroke = Instance.new("UIStroke", InnerSpinner)
InnerStroke.Color = C_PURPLE
InnerStroke.Thickness = 2

local LoadText = Instance.new("TextLabel", LoadBg)
LoadText.Size = UDim2.new(1, 0, 0, 30)
LoadText.Position = UDim2.new(0, 0, 0.65, 0)
LoadText.BackgroundTransparency = 1
LoadText.Font = Enum.Font.GothamBlack
LoadText.Text = "ESTABLISHING CONNECTION..."
LoadText.TextColor3 = C_CYAN
LoadText.TextSize = 12
LoadText.TextTransparency = 1

--============= 2. KEY SYSTEM SCREEN =============
local KeyMain = Instance.new("Frame", ScreenGui)
KeyMain.Size = UDim2.new(0, 420, 0, 240)
KeyMain.Position = UDim2.new(0.5, 0, 0.5, 0)
KeyMain.AnchorPoint = Vector2.new(0.5, 0.5)
KeyMain.BackgroundColor3 = C_BG
KeyMain.BackgroundTransparency = 1
KeyMain.Visible = false
round(KeyMain, 20)

local MainStroke = Instance.new("UIStroke", KeyMain)
MainStroke.Color = C_CYAN
MainStroke.Thickness = 2
MainStroke.Transparency = 1

local Title = Instance.new("TextLabel", KeyMain)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0,0,0,10)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBlack
Title.Text = "FISHHUB SECURITY"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 22
Title.TextTransparency = 1

local BoxWrap = Instance.new("Frame", KeyMain)
BoxWrap.Size = UDim2.new(0.85, 0, 0, 45)
BoxWrap.Position = UDim2.new(0.075, 0, 0.35, 0)
BoxWrap.BackgroundColor3 = Color3.fromRGB(20, 25, 40)
BoxWrap.BackgroundTransparency = 1
round(BoxWrap, 8)
local BoxStroke = Instance.new("UIStroke", BoxWrap)
BoxStroke.Color = Color3.fromRGB(80, 80, 100)
BoxStroke.Transparency = 1

local InputKey = Instance.new("TextBox", BoxWrap)
InputKey.Size = UDim2.new(1, 0, 1, 0)
InputKey.BackgroundTransparency = 1
InputKey.Font = Enum.Font.GothamMedium
InputKey.PlaceholderText = "Insert Access Token..."
InputKey.Text = ""
InputKey.TextColor3 = C_CYAN
InputKey.TextSize = 14
InputKey.TextTransparency = 1

local BtnCheck = Instance.new("TextButton", KeyMain)
BtnCheck.Size = UDim2.new(0.4, 0, 0, 40)
BtnCheck.Position = UDim2.new(0.075, 0, 0.65, 0)
BtnCheck.BackgroundColor3 = C_CYAN
BtnCheck.BackgroundTransparency = 1
BtnCheck.Font = Enum.Font.GothamBold
BtnCheck.Text = "VERIFY KEY"
BtnCheck.TextColor3 = Color3.fromRGB(0, 0, 0)
BtnCheck.TextSize = 13
BtnCheck.TextTransparency = 1
round(BtnCheck, 8)

local BtnGet = Instance.new("TextButton", KeyMain)
BtnGet.Size = UDim2.new(0.4, 0, 0, 40)
BtnGet.Position = UDim2.new(0.525, 0, 0.65, 0)
BtnGet.BackgroundColor3 = Color3.fromRGB(40, 45, 65)
BtnGet.BackgroundTransparency = 1
BtnGet.Font = Enum.Font.GothamBold
BtnGet.Text = "GET KEY"
BtnGet.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnGet.TextSize = 13
BtnGet.TextTransparency = 1
round(BtnGet, 8)

--============= KỊCH BẢN CHẠY VÀ KIỂM TRA KEY ĐÃ LƯU =============
TweenService:Create(LoadBg, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 300, 0, 140)}):Play()
TweenService:Create(LoadStroke, TweenInfo.new(0.6), {Transparency = 0.5}):Play()
TweenService:Create(LoadText, TweenInfo.new(0.6), {TextTransparency = 0}):Play()

local spinOut = TweenService:Create(OuterSpinner, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {Rotation = 360})
local spinIn = TweenService:Create(InnerSpinner, TweenInfo.new(1.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {Rotation = -360})
spinOut:Play()
spinIn:Play()

task.spawn(function()
    task.wait(1.5)
    LoadText.Text = "CHECKING SAVED CREDENTIALS..."
    task.wait(1.0)
    
    local autoPassed = false
    if writefile and readfile and isfile and isfile(KEY_FILE) then
        local savedKey = readfile(KEY_FILE)
        if checkKeyValid(savedKey) then
            autoPassed = true
        end
    end

    spinOut:Cancel() spinIn:Cancel()

    if autoPassed then
        LoadText.Text = "AUTO-LOGGED IN SUCCESSFULLY!"
        LoadText.TextColor3 = Color3.fromRGB(0, 255, 128)
        task.wait(0.8)
        
        TweenService:Create(BlurEffect, TweenInfo.new(0.8), {Size = 0}):Play()
        TweenService:Create(LoadBg, TweenInfo.new(0.4), {Size = UDim2.new(0,0,0,0), BackgroundTransparency = 1}):Play()
        task.wait(0.5)
        BlurEffect:Destroy()
        ScreenGui:Destroy()
        
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Cachuoine/DHL/refs/heads/main/UI.lua'))()
        return
    end

    TweenService:Create(LoadBg, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 420, 0, 240)}):Play()
    TweenService:Create(OuterSpinner, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    TweenService:Create(InnerSpinner, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    TweenService:Create(LoadText, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    
    task.wait(0.5)
    LoadBg.Visible = false
    KeyMain.Visible = true
    KeyMain.BackgroundTransparency = 0.1
    MainStroke.Transparency = 0.5
    
    TweenService:Create(Title, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
    TweenService:Create(BoxWrap, TweenInfo.new(0.4), {BackgroundTransparency = 0.5}):Play()
    TweenService:Create(BoxStroke, TweenInfo.new(0.4), {Transparency = 0}):Play()
    TweenService:Create(InputKey, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
    TweenService:Create(BtnCheck, TweenInfo.new(0.4), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
    TweenService:Create(BtnGet, TweenInfo.new(0.4), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
end)

BtnCheck.MouseEnter:Connect(function() TweenService:Create(BtnCheck, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 200, 255)}):Play() end)
BtnCheck.MouseLeave:Connect(function() TweenService:Create(BtnCheck, TweenInfo.new(0.2), {BackgroundColor3 = C_CYAN}):Play() end)

--============= XÁC THỰC VÀ LƯU KEY ==============
BtnGet.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(WEBSITE_URL) end
    Title.Text = "LINK COPIED TO CLIPBOARD"
    Title.TextColor3 = C_CYAN
    task.wait(2)
    Title.Text = "FISHHUB SECURITY"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

BtnCheck.MouseButton1Click:Connect(function()
    local key = InputKey.Text
    
    if checkKeyValid(key) then
        if writefile then
            pcall(function()
                writefile(KEY_FILE, key)
            end)
        end

        Title.Text = (key == ADMIN_KEY) and "ADMIN ACCESS GRANTED!" or "ACCESS GRANTED!"
        Title.TextColor3 = Color3.fromRGB(0, 255, 128)
        MainStroke.Color = Color3.fromRGB(0, 255, 128)
        
        task.wait(1)
        TweenService:Create(BlurEffect, TweenInfo.new(0.8), {Size = 0}):Play()
        local closeTween = TweenService:Create(KeyMain, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0,0,0,0), BackgroundTransparency = 1})
        for _, v in ipairs(KeyMain:GetDescendants()) do
            if v:IsA("TextLabel") or v:IsA("TextBox") or v:IsA("TextButton") then
                TweenService:Create(v, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
            elseif v:IsA("UIStroke") then
                TweenService:Create(v, TweenInfo.new(0.3), {Transparency = 1}):Play()
            elseif v:IsA("Frame") then
                TweenService:Create(v, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
            end
        end
        
        closeTween:Play()
        closeTween.Completed:Wait()
        BlurEffect:Destroy()
        ScreenGui:Destroy()
        
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Cachuoine/DHL/refs/heads/main/UI.lua'))()
        
    else
        Title.Text = "INVALID OR EXPIRED KEY!"
        Title.TextColor3 = Color3.fromRGB(255, 60, 60)
        BoxStroke.Color = Color3.fromRGB(255, 60, 60)
        
        task.wait(1.5)
        Title.Text = "FISHHUB SECURITY"
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        BoxStroke.Color = Color3.fromRGB(80, 80, 100)
    end
end)
