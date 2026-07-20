return function(container)
    local Config = getgenv().FishHub and getgenv().FishHub.Config or {}

    -- Tiêu đề trang Setting
    local titleLbl = Instance.new("TextLabel")
    titleLbl.Parent = container
    titleLbl.BackgroundTransparency = 1
    titleLbl.Position = UDim2.new(0, 20, 0, 20)
    titleLbl.Size = UDim2.new(1, -40, 0, 35)
    titleLbl.Font = Enum.Font.GothamBold
    titleLbl.Text = "Settings"
    titleLbl.TextSize = 24
    titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLbl.TextXAlignment = Enum.TextXAlignment.Left

    -- Mô tả phụ
    local descLbl = Instance.new("TextLabel")
    descLbl.Parent = container
    descLbl.BackgroundTransparency = 1
    descLbl.Position = UDim2.new(0, 20, 0, 52)
    descLbl.Size = UDim2.new(1, -40, 0, 20)
    descLbl.Font = Enum.Font.Gotham
    descLbl.Text = "Customize your FishHub experience and preferences"
    descLbl.TextSize = 13
    descLbl.TextColor3 = Color3.fromRGB(150, 160, 180)
    descLbl.TextXAlignment = Enum.TextXAlignment.Left

    -- Khung cuộn chứa các lựa chọn cài đặt
    local scroll = Instance.new("ScrollingFrame")
    scroll.Parent = container
    scroll.Position = UDim2.new(0, 20, 0, 85)
    scroll.Size = UDim2.new(1, -40, 1, -100)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel = 0
    scroll.CanvasSize = UDim2.new(0, 0, 0, 250)
    scroll.ScrollBarThickness = 4

    local uiList = Instance.new("UIListLayout")
    uiList.Parent = scroll
    uiList.SortOrder = Enum.SortOrder.LayoutOrder
    uiList.Padding = UDim.new(0, 12)

    -- Hàm tạo thành phần Toggle Option đồng bộ với giao diện chính
    local function CreateToggleOption(name, desc, initialState, callback)
        local card = Instance.new("Frame")
        card.Size = UDim2.new(1, 0, 0, 60)
        card.BackgroundColor3 = Color3.fromRGB(26, 31, 46)
        card.BorderSizePixel = 0
        Instance.new("UICorner", card).CornerRadius = UDim.new(0, 10)

        local stroke = Instance.new("UIStroke")
        stroke.Parent = card
        stroke.Color = Color3.fromRGB(45, 52, 74)
        stroke.Thickness = 1

        local tLbl = Instance.new("TextLabel")
        tLbl.Parent = card
        tLbl.BackgroundTransparency = 1
        tLbl.Position = UDim2.new(0, 15, 0, 10)
        tLbl.Size = UDim2.new(1, -100, 0, 20)
        tLbl.Font = Enum.Font.GothamBold
        tLbl.Text = name
        tLbl.TextSize = 16
        tLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
        tLbl.TextXAlignment = Enum.TextXAlignment.Left

        local dLbl = Instance.new("TextLabel")
        dLbl.Parent = card
        dLbl.BackgroundTransparency = 1
        dLbl.Position = UDim2.new(0, 15, 0, 32)
        dLbl.Size = UDim2.new(1, -100, 0, 16)
        dLbl.Font = Enum.Font.Gotham
        dLbl.Text = desc
        dLbl.TextSize = 12
        dLbl.TextColor3 = Color3.fromRGB(130, 140, 160)
        dLbl.TextXAlignment = Enum.TextXAlignment.Left

        local toggleBtn = Instance.new("TextButton")
        toggleBtn.Parent = card
        toggleBtn.Size = UDim2.new(0, 50, 0, 26)
        toggleBtn.AnchorPoint = Vector2.new(1, 0.5)
        toggleBtn.Position = UDim2.new(1, -15, 0.5, 0)
        toggleBtn.BackgroundColor3 = initialState and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(45, 52, 74)
        toggleBtn.Text = ""
        toggleBtn.AutoButtonColor = false
        Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1, 0)

        local circle = Instance.new("Frame")
        circle.Parent = toggleBtn
        circle.Size = UDim2.new(0, 20, 0, 20)
        circle.AnchorPoint = Vector2.new(0, 0.5)
        circle.Position = initialState and UDim2.new(1, -23, 0.5, 0) or UDim2.new(0, 3, 0.5, 0)
        circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

        local state = initialState
        toggleBtn.MouseButton1Click:Connect(function()
            state = not state
            local ts = game:GetService("TweenService")
            if state then
                ts:Create(toggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 170, 255)}):Play()
                ts:Create(circle, TweenInfo.new(0.2), {Position = UDim2.new(1, -23, 0.5, 0)}):Play()
            else
                ts:Create(toggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 52, 74)}):Play()
                ts:Create(circle, TweenInfo.new(0.2), {Position = UDim2.new(0, 3, 0.5, 0)}):Play()
            end
            if callback then callback(state) end
        end)

        return card
    end

    -- Thêm các tùy chọn cài đặt thực tế vào trang
    local opt1 = CreateToggleOption("Rainbow Border", "Enable animated rainbow gradient for window borders", Config.RainbowBorder, function(val)
        Config.RainbowBorder = val
    end)
    opt1.Parent = scroll

    local opt2 = CreateToggleOption("GUI Animation", "Smooth opening and closing transition animations", Config.GUIAnimation, function(val)
        Config.GUIAnimation = val
    end)
    opt2.Parent = scroll

    local opt3 = CreateToggleOption("Border Glow", "Adds a soft background glowing effect to the UI frame", Config.BorderGlow, function(val)
        Config.BorderGlow = val
    end)
    opt3.Parent = scroll
end
