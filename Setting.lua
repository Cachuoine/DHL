local FH = getgenv().FishHub
local Config = FH.Config
local ClearContent = FH.ClearContent
local pageContainer = FH.pageContainer
local CreateDropdown = FH.CreateDropdown
local ApplyTheme = FH.ApplyTheme
local function OpenSettings = LoadSettingsPage
	OpenSettings()
	-- 1. ScrollingFrame
	local Scroll = Instance.new("ScrollingFrame")
	Scroll.Parent = pageContainer
	Scroll.Position = UDim2.new(0,0,0,0)
	Scroll.Size = UDim2.new(1,0,1,0)
	Scroll.BackgroundTransparency = 1
	Scroll.BorderSizePixel = 0
	Scroll.CanvasSize = UDim2.new(0,0,0,950)
	Scroll.ScrollBarThickness = 6
	Scroll.AutomaticCanvasSize = Enum.AutomaticSize.None
	local Layout = Instance.new("UIListLayout")
	Layout.Parent = Scroll
	Layout.Padding = UDim.new(0,16)
	Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	Layout.SortOrder = Enum.SortOrder.LayoutOrder
	-- 2. CreateSection()
	local function CreateSection(text)
    	local title = Instance.new("TextLabel")
    	title.Parent = Scroll
    	title.Size = UDim2.new(1,-40,0,32)
    	title.BackgroundTransparency = 1
    	title.Font = Enum.Font.GothamBold
    	title.TextSize = 22
    	title.TextXAlignment = Enum.TextXAlignment.Left
    	title.TextColor3 = Color3.fromRGB(255,255,255)
    	title.Text = text
    	-- Line
    	local line = Instance.new("Frame")
    	line.Parent = Scroll
    	line.Size = UDim2.new(1,-40,0,2)
    	line.BackgroundColor3 = Color3.fromRGB(0,170,255)
    	line.BorderSizePixel = 0
    	Instance.new("UICorner",line).CornerRadius = UDim.new(1,0)
    	local gradient = Instance.new("UIGradient")
    	gradient.Parent = line
    	gradient.Color = ColorSequence.new{
        	ColorSequenceKeypoint.new(0,Color3.fromRGB(0,170,255)),
        	ColorSequenceKeypoint.new(1,Color3.fromRGB(180,80,255))
    	}
    	local padding = Instance.new("Frame")
    	padding.Parent = Scroll
    	padding.Size = UDim2.new(1,-40,0,6)
    	padding.BackgroundTransparency = 1
	end
	-- 3. CreateRow()
	local function CreateRow(Name)
    	local row = Instance.new("Frame")
    	row.Parent = Scroll
    	-- kích thước ô
    	row.Size = UDim2.new(1,-50,0,38)
    	-- màu nền ô
    	row.BackgroundColor3 = Color3.fromRGB(30,35,50)
    	row.BorderSizePixel = 0
    	-- bo góc
    	local corner = Instance.new("UICorner")
    	corner.Parent = row
    	corner.CornerRadius = UDim.new(0,10)
    	-- viền
    	local stroke = Instance.new("UIStroke")
    	stroke.Parent = row
    	stroke.Color = Color3.fromRGB(70,90,130)
    	stroke.Transparency = 0.5
    	stroke.Thickness = 1
    	-- chữ bên trái
    	local txt = Instance.new("TextLabel")
    	txt.Parent = row
    	txt.Size = UDim2.new(0.6,0,1,0)
    	txt.Position = UDim2.new(0,15,0,0)
    	txt.BackgroundTransparency = 1
    	txt.Font = Enum.Font.GothamBold
    	txt.TextSize = 16
    	txt.TextXAlignment = Enum.TextXAlignment.Left
    	txt.TextColor3 = Color3.fromRGB(240,240,240)
    	txt.Text = Name
   	 	return row
	end
		-- 4. CreateToggle()
		local function CreateToggle(row,state,callback)
    		local btn = Instance.new("TextButton")
    		btn.Parent = row
    		btn.Size = UDim2.new(0,60,0,24)
			btn.AnchorPoint = Vector2.new(1,0.5)
			btn.Position = UDim2.new(1,-15,0.5,0)
    		btn.Text = state and "ON" or "OFF"
    		btn.Font = Enum.Font.GothamBold
    		btn.TextSize = 14
    		btn.TextColor3 = Color3.new(1,1,1)
    		btn.BorderSizePixel = 0
			local btnCorner = Instance.new("UICorner")
			btnCorner.Parent = btn
			btnCorner.CornerRadius = UDim.new(0,8)
			local btnStroke = Instance.new("UIStroke")
			btnStroke.Parent = btn
			btnStroke.Color = Color3.fromRGB(0,170,255)
			btnStroke.Transparency = 0.5
			btnStroke.Thickness = 1
    		local function Refresh()
				if state then
    				btn.BackgroundTransparency = 1
    				btn.TextColor3 = Color3.fromRGB(0,255,120)
    				btn.Text = "◉ ON"
				else
    				btn.BackgroundTransparency = 1
    				btn.TextColor3 = Color3.fromRGB(170,170,170)
    				btn.Text = "◉ OFF"
				end
    		end
    		Refresh()
            btn.MouseButton1Click:Connect(function()
                state = not state
                Refresh()

                if callback then
                    callback(state)
                end
            end)
        end
	-- 5. CreateButton()
	local function CreateButton(row,text)
    	local btn=Instance.new("TextButton")
    	btn.Parent=row
    	btn.Size=UDim2.new(0,130,0,28)
		btn.AnchorPoint = Vector2.new(1,0.5)
		btn.Position = UDim2.new(1,-15,0.5,0)
    	btn.BackgroundColor3=Color3.fromRGB(40,40,45)
    	btn.Text=text
    	btn.TextColor3=Color3.new(1,1,1)
    	btn.Font=Enum.Font.GothamBold
    	btn.TextSize=15
    	Instance.new("UICorner",btn)
    	return btn
	end
    -- 6. Bắt đầu tạo giao diện
    CreateSection("⚙ General")
	local row=CreateRow("Toggle Key")
	ChangeKeyButton=CreateButton(row,"["..Config.ToggleKey.Name.."]")
	ChangeKeyButton.MouseButton1Click:Connect(function()
    	Config.WaitingForHotkey = true
    	ChangeKeyButton.Text = "[ ... ]"
	end)
    row = CreateRow("GUI Animation")
    CreateToggle(
        row,
        Config.GUIAnimation,
        function(value)
            Config.GUIAnimation = value
        end
    )
	CreateSection("🎨 Appearance")
	row = CreateRow("Rainbow Border")
	CreateToggle(
	    row,
	    Config.RainbowBorder,
	    function(value)
	        Config.RainbowBorder = value
	    end
	)
	row = CreateRow("Theme")
	local themeBtn = CreateButton(
	    row,
	    Config.Theme.."▼"
	)
	themeBtn.MouseButton1Click:Connect(function()
    	CreateDropdown(
       		pageContainer,
        	themeBtn,
        	{
	   	        "Dark",
	   	        "Light",
	            "Midnight",
	            "Purple",
				"Ocean",
				"Purple Neon",
				"Emerald"
	        },
	        function(value)
	            ApplyTheme(value)
				themeBtn.Text = value.."▼"
	        end
	    )
	end)
	row = CreateRow("Accent Color")
	CreateButton(row,"Blue ▼")
	row = CreateRow("Transparency")
	CreateButton(row,"16% ▼")
	row = CreateRow("Animation Speed")
	CreateButton(row,"0.45 ▼")
	CreateSection("📊 Performance")
	row = CreateRow("Show FPS")
	CreateToggle(
	    row,
	    Config.ShowFPS,
	    function(value)
	        Config.ShowFPS = value
	    end
	)
	row = CreateRow("Show Ping")
	CreateToggle(
	    row,
	    Config.ShowPing,
	    function(value)
	        Config.ShowPing = value
	    end
	)
	row = CreateRow("Show Runtime")
	CreateToggle(
	    row,
	    Config.ShowRuntime,
	    function(value)
	        Config.ShowRuntime = value
	    end
	)
	CreateSection("🔔 Notification")
	row = CreateRow("Notification")
	CreateToggle(
	    row,
   		true,
   		function(value)
   		end
	)	
end
LoadSettingsPage()
