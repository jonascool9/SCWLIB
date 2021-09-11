local library = {}

function library:Load(name)
	if game.Players.LocalPlayer.PlayerGui:FindFirstChild("SCWLIB2") then
		game.Players.LocalPlayer.PlayerGui:FindFirstChild("SCWLIB2"):Destroy()
		warn("Removed old instance")
	end


	local SCWLIB2 = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local TopFrame = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")
	local Toggle = Instance.new("ImageButton")
	local ListFrame = Instance.new("Frame")
	local Container = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local close = Instance.new("ImageButton")
	local UserInputService = game:GetService("UserInputService")
	local ts = game:GetService("TweenService")

	local function uicorner(Parent)
		local uicorner = Instance.new("UICorner")
		uicorner.CornerRadius = UDim.new(0,8)
		uicorner.Parent = Parent
	end

	close.Name = "close"
	close.Parent = TopFrame
	close.BackgroundTransparency = 1
	close.Position = UDim2.new(0.930279016, 0, -0.0366666652, 0)
	close.Size = UDim2.new(0, 29, 0, 29)
	close.ZIndex = 2
	close.Image = "rbxassetid://3926305904"
	close.ImageRectOffset = Vector2.new(284, 4)
	close.ImageRectSize = Vector2.new(24, 24)

	SCWLIB2.Name = "SCWLIB2"
	SCWLIB2.Parent = game.Players.LocalPlayer.PlayerGui
	SCWLIB2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = SCWLIB2
	MainFrame.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
	MainFrame.Position = UDim2.new(0.334508687, 0, 0.472006232, 0)
	MainFrame.Size = UDim2.new(0, 430, 0, 37)

	TopFrame.Name = "TopFrame"
	TopFrame.Parent = MainFrame
	TopFrame.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
	TopFrame.BorderSizePixel = 0
	TopFrame.ClipsDescendants = true
	TopFrame.Size = UDim2.new(0, 430, 0, 30)

	TextLabel.Parent = TopFrame
	TextLabel.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.0186046511, 0, 0, 0)
	TextLabel.Size = UDim2.new(0, 415, 0, 30)
	TextLabel.Font = Enum.Font.Ubuntu
	TextLabel.Text = name
	TextLabel.TextColor3 = Color3.new(1, 1, 1)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14
	TextLabel.TextWrapped = true

	Toggle.Name = "Toggle"
	Toggle.Parent = TopFrame
	Toggle.BackgroundTransparency = 1
	Toggle.Position = UDim2.new(-0.0001937747, 0, 0.0398148, 0)
	Toggle.Size = UDim2.new(0, 28, 0, 28)
	Toggle.ZIndex = 2
	Toggle.Image = "rbxassetid://3926305904"
	Toggle.ImageRectOffset = Vector2.new(924, 884)
	Toggle.ImageRectSize = Vector2.new(36, 36)

	ListFrame.Name = "ListFrame"
	ListFrame.Parent = MainFrame
	ListFrame.BackgroundColor3 = Color3.new(0.235294, 0.235294, 0.235294)
	ListFrame.BorderSizePixel = 0
	ListFrame.Position = UDim2.new(0, 0, 0, 30)
	ListFrame.Size = UDim2.new(0, 430, 0, 35)
	ListFrame.Visible = true

	Container.Name = "Container"
	Container.Parent = MainFrame
	Container.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
	Container.ClipsDescendants = true
	Container.Position = UDim2.new(0, 0, 0.778043449, 0)
	Container.Size = UDim2.new(0, 430, 0, 228)
	Container.BorderSizePixel = 0

	UIListLayout.Parent = Container
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)


	uicorner(Container)
	uicorner(MainFrame)
	uicorner(TopFrame)


	local gui = MainFrame
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)

	Toggle.MouseButton1Click:Connect(function()
		local TweenInfos = TweenInfo.new(
			0.8,
			Enum.EasingStyle.Linear,
			Enum.EasingDirection.In,
			0,
			false,
			0
		)
		--open = 0, 430,0, 228  closed = 0, 430,0, 1

		-- 0, 0,1.6, 0 || 0, 0,0.76, 0

		local tween = ts:Create(Toggle, TweenInfos, {Rotation = 0})
		local tween2 = ts:Create(Toggle, TweenInfos, {Rotation = 90})
		if Container.Position == UDim2.new(0, 0,1.6, 0) then
			tween:Play()
			Container:TweenPosition(UDim2.new(0, 0,0.76, 0))
		else
			Container:TweenPosition(UDim2.new(0, 0,1.6, 0))
			tween2:Play()
		end
	end)

	close.MouseButton1Click:Connect(function()
		if Container.Size == UDim2.new(0, 430,0, 228) then
			Container:TweenSize(UDim2.new(0, 430,0, 0))
		else
			Container:TweenSize(UDim2.new(0, 430,0, 228))
		end
	end)
	local scwlib2 = {}

	function scwlib2:CreateButton(Text, callback)
		local callback = callback or function() end
		local TextButton = Instance.new("TextButton")

		TextButton.Parent = Container
		TextButton.BackgroundColor3 = Color3.new(0.470588, 0.470588, 0.470588)
		TextButton.BorderSizePixel = 0
		TextButton.Position = UDim2.new(0.0186046511, 0, 0.0385051221, 0)
		TextButton.Size = UDim2.new(0, 415, 0, 30)
		TextButton.Font = Enum.Font.SourceSans
		TextButton.TextColor3 = Color3.new(0, 0, 0)
		TextButton.TextScaled = true
		TextButton.TextSize = 14
		TextButton.TextWrapped = true
		TextButton.Text = Text

		uicorner(TextButton)

		TextButton.MouseButton1Click:Connect(function()
			pcall(callback)
		end)
	end
	return scwlib2
end

local lib = library:Load('Antonio Exploits')
lib:CreateButton('Infinite Yield', function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/jonascool9/SCWLIB/main/main2.Lua'))()
end)
lib:CreateButton('Kick Yourself', function()
	game.Players.LocalPlayer:Kick("Spannend")
end)
