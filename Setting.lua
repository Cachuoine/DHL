--=====================================================================
-- FILE: Setting.lua (Hoàn chỉnh)
-- Tác giả: DaoHuyLam (FishHub)
--=====================================================================

return function(Container)
    local TweenService = game:GetService("TweenService")
    local Players = game:GetService("Players")

    -- 1. Dọn dẹp UI cũ nếu có
    for _, child in ipairs(Container:GetChildren()) do
        child:Destroy()
    end

    -- 2. Tiêu đề Settings
    local titleLbl = Instance.new("TextLabel")
    titleLbl.Parent = Container
    titleLbl.BackgroundTransparency = 1
    titleLbl.Position = UDim2.new(0, 20, 0, 15)
    titleLbl.Size = UDim2.new(1, -40, 0, 35)
    titleLbl.Font = Enum.Font.GothamBold
    titleLbl.Text = "Settings"
    titleLbl.TextSize = 24
    titleLbl.TextColor3 = Color3.new(1, 1, 1)
    titleLbl.TextXAlignment = Enum.TextXAlignment.Left

    -- 3. Khung cuộn (ScrollingFrame) để chứa nhiều cài đặt
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Parent = Container
    scrollFrame.Position = UDim2.new(0, 20, 0, 60)
    scrollFrame.Size = UDim2.new(1, -40, 1, -70)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.ScrollBarThickness = 4
    scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)
    scrollFrame.BorderSizePixel = 0
    -- Tự động tính toán độ dài dựa trên số lượng item
    scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0) 

    local layout = Instance.new("UIListLayout")
    layout.Parent = scrollFrame
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 12)

    --=================================================================
    -- HÀM TẠO NÚT BẬT/TẮT (TOGGLE CHUẨN XỊN)
    --=================================================================
    local function CreateToggle(text, defaultState, callback)
        local toggleFrame = Instance.new("Frame")
        toggleFrame.Parent = scrollFrame
        toggleFrame.Size = UDim2.new(1, -10, 0, 45)
        toggleFrame.BackgroundColor3 = Color3.fromRGB(30, 34, 48)
        Instance.new("UICorner", toggleFrame).CornerRadius = UDim.new(0, 8)
        
        local toggleStroke = Instance.new("UIStroke")
        toggleStroke.Parent = toggleFrame
        toggleStroke.Color = defaultState and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(0, 170, 255)
        toggleStroke.Thickness = 1
        toggleStroke.Transparency = 0.5

        local lbl = Instance.new("TextLabel")
        lbl.Parent = toggleFrame
        lbl.BackgroundTransparency = 1
        lbl.Position = UDim2.new(0, 15, 0, 0)
        lbl.Size = UDim2.new(1, -70, 1, 0)
        lbl.Font = Enum.Font.GothamBold
        lbl.Text = text
        lbl.TextSize = 14
        lbl.TextColor3 = Color3.new(1, 1, 1)
        lbl.TextXAlignment = Enum.TextXAlignment.Left

        -- Nút công tắc (Switch)
        local switchBtn = Instance.new("TextButton")
        switchBtn.Parent = toggleFrame
        switchBtn.Size = UDim2.new(0, 42, 0, 22)
        switchBtn.Position = UDim2.new(1, -55, 0.5, -11)
        switchBtn.BackgroundColor3 = defaultState and Color3.fromRGB(0, 200, 80) or Color3.fromRGB(55, 65, 90)
        switchBtn.Text = ""
        switchBtn.AutoButtonColor = false
        Instance.new("UICorner", switchBtn).CornerRadius = UDim.new(1, 0)

        -- Cục tròn bên trong công tắc
        local circle = Instance.new("Frame")
        circle.Parent = switchBtn
        circle.Size = UDim2.new(0, 18, 0, 18)
        circle.Position = defaultState and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
        circle.BackgroundColor3 = Color3.new(1, 1, 1)
        Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

        local state = defaultState
        switchBtn.MouseButton1Click:Connect(function()
            state = not state
            if state then
                TweenService:Create(switchBtn, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(0, 200, 80)}):Play()
                TweenService:Create(circle, TweenInfo.new(0.25), {Position = UDim2.new(1, -20, 0.5, -9)}):Play()
                TweenService:Create(toggleStroke, TweenInfo.new(0.25), {Color = Color3.fromRGB(0, 255, 100)}):Play()
            else
                TweenService:Create(switchBtn, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(55, 65, 90)}):Play()
                TweenService:Create(circle, TweenInfo.new(0.25), {Position = UDim2.new(0, 2, 0.5, -9)}):Play()
                TweenService:Create(toggleStroke, TweenInfo.new(0.25), {Color = Color3.fromRGB(0, 170, 255)}):Play()
            end
            callback(state)
        end)
    end

    --=================================================================
    -- HÀM TẠO NÚT BẤM BÌNH THƯỜNG (BUTTON)
    --=================================================================
    local function CreateButton(text, callback)
        local btn = Instance.new("TextButton")
        btn.Parent = scrollFrame
        btn.Size = UDim2.new(1, -10, 0, 40)
        btn.BackgroundColor3 = Color3.fromRGB(30, 34, 48)
        btn.Text = text
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 14
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.AutoButtonColor = false
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

        local stroke = Instance.new("UIStroke")
        stroke.Parent = btn
        stroke.Color = Color3.fromRGB(0, 170, 255)
        stroke.Thickness = 1
        stroke.Transparency = 0.5

        btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 50, 70)}):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 34, 48)}):Play()
        end)

        btn.MouseButton1Click:Connect(callback)
    end

    --=================================================================
    -- THÊM CÁC TÍNH NĂNG VÀO SETTINGS
    --=================================================================
    
    -- 1. Anti-AFK (Chống bị kick khi treo game)
    CreateToggle("Anti-AFK", true, function(state)
        getgenv().AntiAFK = state
        if state then
            local VirtualUser = game:GetService("VirtualUser")
            Players.LocalPlayer.Idled:Connect(function()
                if getgenv().AntiAFK then
                    VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                    task.wait(1)
                    VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                end
            end)
        end
    end)

    -- 2. Đổi viền Rainbow (Kết nối trực tiếp với Config ở file chính)
    local isRainbow = getgenv().FishHub.Config and getgenv().FishHub.Config.RainbowBorder or true
    CreateToggle("Rainbow UI Effect", isRainbow, function(state)
        if getgenv().FishHub and getgenv().FishHub.Config then
            getgenv().FishHub.Config.RainbowBorder = state
        end
    end)

    -- 3. Auto Save
    CreateToggle("Auto Save Settings", true, function(state)
        -- Chỗ này mốt bạn viết code lưu file JSON nếu thích
        print("Auto Save: ", state)
    end)

    -- 4. Nút Rejoin Server (Hữu ích khi game lỗi)
    CreateButton("Rejoin Server", function()
        local teleportService = game:GetService("TeleportService")
        if #Players:GetPlayers() <= 1 then
            Players.LocalPlayer:Kick("\nRejoining...")
            task.wait()
            teleportService:Teleport(game.PlaceId, Players.LocalPlayer)
        else
            teleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
        end
    end)

    -- 5. Nút copy Discord link
    CreateButton("Copy Discord Link", function()
        if setclipboard then
            setclipboard("https://discord.gg/2tTJxRk2ct")
        end
    end)

end
