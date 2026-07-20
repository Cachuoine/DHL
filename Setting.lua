local FishHub = getgenv().FishHub
local Page = FishHub.Page

if not Page then
    warn("FishHub.Page not found!")
    return
end
-- Xóa nội dung cũ (nếu muốn)
for _,v in ipairs(Page:GetChildren()) do
    v:Destroy()
end
-- Tiêu đề
local Title = Instance.new("TextLabel")
Title.Parent = Page
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0,20,0,20)
Title.Size = UDim2.new(1,-40,0,35)
Title.Font = Enum.Font.GothamBold
Title.Text = "Settings"
Title.TextSize = 24
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextXAlignment = Enum.TextXAlignment.Left
-- Khung
local Frame = Instance.new("Frame")
Frame.Parent = Page
Frame.Position = UDim2.new(0,20,0,70)
Frame.Size = UDim2.new(1,-40,1,-90)
Frame.BackgroundColor3 = Color3.fromRGB(30,34,48)
Frame.BorderSizePixel = 0
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0,12)
-- Chữ test
local Label = Instance.new("TextLabel")
Label.Parent = Frame
Label.BackgroundTransparency = 1
Label.Position = UDim2.new(0,20,0,20)
Label.Size = UDim2.new(1,-40,0,30)
Label.Font = Enum.Font.GothamBold
Label.Text = "Setting.lua loaded successfully!"
Label.TextSize = 18
Label.TextColor3 = Color3.fromRGB(255,255,255)
Label.TextXAlignment = Enum.TextXAlignment.Left
-- Nút test
local Button = Instance.new("TextButton")
Button.Parent = Frame
Button.Position = UDim2.new(0,20,0,70)
Button.Size = UDim2.new(0,180,0,40)
Button.Text = "Test Button"
Button.Font = Enum.Font.GothamBold
Button.TextSize = 16
Button.BackgroundColor3 = Color3.fromRGB(0,170,255)
Button.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Button).CornerRadius = UDim.new(0,8)
Button.MouseButton1Click:Connect(function()
    Label.Text = "Button Clicked!"
end)
