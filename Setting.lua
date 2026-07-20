return function(container)
    -- Tiêu đề của trang Setting
    local titleLbl = Instance.new("TextLabel")
    titleLbl.Parent = container
    titleLbl.BackgroundTransparency = 1
    titleLbl.Position = UDim2.new(0, 20, 0, 20)
    titleLbl.Size = UDim2.new(1, -40, 0, 35)
    titleLbl.Font = Enum.Font.GothamBold
    titleLbl.Text = "Settings Panel"
    titleLbl.TextSize = 24
    titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLbl.TextXAlignment = Enum.TextXAlignment.Left

    -- Một nút cài đặt ví dụ
    local exampleBtn = Instance.new("TextButton")
    exampleBtn.Parent = container
    exampleBtn.Size = UDim2.new(0, 200, 0, 40)
    exampleBtn.Position = UDim2.new(0, 20, 0, 70)
    exampleBtn.BackgroundColor3 = Color3.fromRGB(40, 44, 60)
    exampleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    exampleBtn.Font = Enum.Font.GothamBold
    exampleBtn.Text = "Test Nút Setting"
    
    local corner = Instance.new("UICorner")
    corner.Parent = exampleBtn
    corner.CornerRadius = UDim.new(0, 8)
    
    -- Chức năng cho nút ví dụ
    exampleBtn.MouseButton1Click:Connect(function()
        exampleBtn.Text = "Đã bấm!"
        task.wait(1)
        exampleBtn.Text = "Test Nút Setting"
    end)
    
    -- Bạn có thể viết thêm các nút, toggle, slider khác ở dưới dòng này
    -- Nhớ luôn set thuộc tính `.Parent = container` nhé!
end
