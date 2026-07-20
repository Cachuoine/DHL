return function(container)
    local FishHub = getgenv().FishHub or {}
    local Config = FishHub.Config or {}

    local titleLbl = Instance.new("TextLabel")
    titleLbl.Parent = container
    titleLbl.BackgroundTransparency = 1
    titleLbl.Position = UDim2.new(0, 20, 0, 20)
    titleLbl.Size = UDim2.new(1, -40, 0, 30)
    titleLbl.Font = Enum.Font.GothamBold
    titleLbl.Text = "Settings Panel"
    titleLbl.TextSize = 22
    titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLbl.TextXAlignment = Enum.TextXAlignment.Left

    local descLbl = Instance.new("TextLabel")
    descLbl.Parent = container
    descLbl.BackgroundTransparency = 1
    descLbl.Position = UDim2.new(0, 20, 0, 48)
    descLbl.Size = UDim2.new(1, -40, 0, 18)
    descLbl.Font = Enum.Font.Gotham
    descLbl.Text = "Customize visual effects, themes, and hub performance"
    descLbl.TextSize = 12
    descLbl.TextColor3 = Color3.fromRGB(140, 150, 170)
    descLbl.TextXAlignment = Enum.TextXAlignment.Left

    local scroll = Instance.new("ScrollingFrame")
    scroll.Parent = container
    scroll.Position = UDim2.new(0, 20, 0, 80)
    scroll.Size = UDim2.new(1, -40, 1, -95)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel = 0
    scroll.CanvasSize = UDim2.new(0, 0, 0, 360)
    scroll.ScrollBarThickness = 3
    scroll.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)

    local uiList = Instance.new("UIListLayout")
    uiList.Parent = scroll
    uiList.SortOrder = Enum.SortOrder.LayoutOrder
    uiList.Padding = UDim.new(0, 10)

    local function CreateSectionHeader(text)
        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, 0, 0, 25)
        lbl.BackgroundTransparency = 1
        lbl.Font = Enum.Font.GothamBold
        lbl.Text = text:upper()
        lbl.TextSize = 12
        lbl.TextColor3 = Color3.fromRGB(0, 170, 255)
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        return lbl
    end

    local function CreateToggleOption(name, desc, initialState, callback)
        local card = Instance.new("Frame")
        card.Size = UDim2.new(1, 0, 0, 56)
        card.BackgroundColor3 = Color3.fromRGB(24, 29, 42)
        card.BorderSizePixel = 0
        Instance.new("UICorner", card).CornerRadius = UDim.new(0, 10)

        local stroke = Instance.new("UIStroke")
        stroke.Parent = card
        stroke.Color = Color3.fromRGB(40, 48, 70)
        stroke.Thickness = 1

        local tLbl = Instance.new("TextLabel")
        tLbl.Parent = card
        tLbl.BackgroundTransparency = 1
        tLbl.Position = UDim2.new(0, 15, 0, 10)
        tLbl.Size = UDim2.new(1, -90, 0, 18)
        tLbl.Font = Enum.Font.GothamBold
        tLbl.Text = name
        tLbl.TextSize = 15
        tLbl.TextColor3 = Color3.fromRGB(240, 245, 255)
        tLbl.TextXAlignment = Enum.TextXAlignment.Left

        local dLbl = Instance.new("TextLabel")
        dLbl.Parent = card
        dLbl.BackgroundTransparency = 1
        dLbl.Position = UDim2.new(0, 15, 0, 30)
        dLbl.Size = UDim2.new(1, -90, 0, 16)
        dLbl.Font = Enum.Font.Gotham
        dLbl.Text = desc
        dLbl.TextSize = 11
        dLbl.TextColor3 = Color3.fromRGB(120, 130, 150)
        dLbl.TextXAlignment = Enum.TextXAlignment.Left

        local toggleBtn = Instance.new("TextButton")
        toggleBtn.Parent = card
        toggleBtn.Size = UDim2.new(0, 44, 0, 24)
        toggleBtn.AnchorPoint = Vector2.new(1, 0.5)
        toggleBtn.Position = UDim2.new(1, -15, 0.5, 0)
        toggleBtn.BackgroundColor3 = initialState and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(45, 52, 74)
        toggleBtn.Text = ""
        toggleBtn.AutoButtonColor = false
        Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1, 0)

        local circle = Instance.new("Frame")
        circle.Parent = toggleBtn
        circle.Size = UDim2.new(0, 18, 0, 18)
        circle.AnchorPoint = Vector2.new(0, 0.5)
        circle.Position = initialState and UDim2.new(1, -21, 0.5, 0) or UDim2.new(0, 3, 0.5, 0)
        circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

        local state = initialState
        
        -- Xử lý sự kiện click để đổi trạng thái nút gạt
        toggleBtn.MouseButton1Click:Connect(function()
            state = not state
            local ts = game:GetService("TweenService")
            if state then
                ts:Create(toggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 170, 255)}):Play()
                ts:Create(circle, TweenInfo.new(0.2), {Position = UDim2.new(1, -21, 0.5, 0)}):Play()
            else
                ts:Create(toggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 52, 74)}):Play()
                ts:Create(circle, TweenInfo.new(0.2), {Position = UDim2.new(0, 3, 0.5, 0)}):Play()
            end
            if callback then callback(state) end
        end)

        return card
    end

    CreateSectionHeader("Visual Effects").Parent = scroll

    local opt1 = CreateToggleOption("Rainbow Border", "Enable dynamic RGB color animation for window borders", Config.RainbowBorder or false, function(val)
        Config.RainbowBorder = val
    end)
    opt1.Parent = scroll

    local opt2 = CreateToggleOption("Border Glow", "Adds a soft neon glow background effect to the main frame", Config.BorderGlow or false, function(val)
        Config.BorderGlow = val
    end)
    opt2.Parent = scroll

    CreateSectionHeader("Interface & Performance").Parent = scroll

    local opt3 = CreateToggleOption("GUI Animation", "Smooth opening and closing transition animations", Config.GUIAnimation or false, function(val)
        Config.GUIAnimation = val
    end)
    opt3.Parent = scroll
end
