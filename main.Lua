local library = {}
function loadlib.loadlib()
function library:CreateWindow(name)
	local SCWLIB = Instance.new("ScreenGui")
	local TopMain = Instance.new("Frame")
	local Container = Instance.new("Frame")
	local UIGridLayout = Instance.new("UIGridLayout")
	local Frames = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local Toggle = Instance.new("TextButton")
	local UserInputService = game:GetService("UserInputService")
	local ts = game:GetService("TweenService")

	SCWLIB.Name = "SCWLIB"
	SCWLIB.Parent = game.Players.LocalPlayer.PlayerGui
	SCWLIB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	SCWLIB.ResetOnSpawn = false

	TopMain.Name = "TopMain"
	TopMain.Parent = SCWLIB
	TopMain.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
	TopMain.BorderSizePixel = 0
	TopMain.Position = UDim2.new(0.396363646, 0, 0.343934089, 0)
	TopMain.Size = UDim2.new(0.0, 0, 0.0, 0)

	Container.Name = "Container"
	Container.Parent = TopMain
	Container.BackgroundColor3 = Color3.new(0.0784314, 0.0784314, 0.0784314)
	Container.BorderSizePixel = 0
	Container.Position = UDim2.new(0.186291739, 0, 0.98097378, 0)
	Container.Size = UDim2.new(0.813051164, 0, 9.87096882, 0)
	Container.ClipsDescendants = true

	UIGridLayout.Parent = Container
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellPadding = UDim2.new(0, 10, 0, 10)
	UIGridLayout.CellSize = UDim2.new(0, 150, 0, 50)

	Frames.Name = "Frames"
	Frames.Parent = TopMain
	Frames.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
	Frames.BorderSizePixel = 0
	Frames.Position = UDim2.new(0, 0, 1, 0)
	Frames.Size = UDim2.new(0.186948851, 0, 9.87096882, 0)
	Frames.ClipsDescendants = true

	Title.Name = "Title"
	Title.Parent = TopMain
	Title.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.323374331, 0, 0.0322580636, 0)
	Title.Size = UDim2.new(0.352733672, 0, 0.935483932, 0)
	Title.Font = Enum.Font.SourceSans
	Title.Text = name
	Title.TextColor3 = Color3.new(1, 1, 1)
	Title.TextScaled = true
	Title.TextSize = 14
	Title.TextWrapped = true

	Toggle.Name = "Toggle"
	Toggle.Parent = TopMain
	Toggle.BackgroundColor3 = Color3.new(1, 1, 1)
	Toggle.BackgroundTransparency = 1
	Toggle.Position = UDim2.new(0.94708997, 0, 0.0322580673, 0)
	Toggle.Rotation = 90
	Toggle.Size = UDim2.new(0.0493827164, 0, 0.935483932, 0)
	Toggle.Font = Enum.Font.SourceSans
	Toggle.Text = ">"
	Toggle.TextColor3 = Color3.new(1, 1, 1)
	Toggle.TextScaled = true
	Toggle.TextSize = 14
	Toggle.TextWrapped = true

	UIAspectRatioConstraint.Parent = TopMain
	UIAspectRatioConstraint.AspectRatio = 18.290323257446

	local gui = TopMain
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

	---------Tween
	TopMain:TweenSize(UDim2.new(0.343636364, 0, 0.0365135446, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 2)
	--------------

	Toggle.MouseButton1Click:Connect(function()
		local TweenInfos = TweenInfo.new(
			0.8,
			Enum.EasingStyle.Linear,
			Enum.EasingDirection.In,
			0,
			false,
			0
		)
		local tween = ts:Create(Toggle, TweenInfos, {Rotation = 0})
		local tween2 = ts:Create(Toggle, TweenInfos, {Rotation = 90})
		if Container.Size == UDim2.new(0.813, 0,9.903, 0) then
			Frames:TweenSize(UDim2.new(0.187, 0,0.019, 0))
			Container:TweenSize(UDim2.new(0.813, 0,0.019, 0))
			tween:Play()
		else
			Container:TweenSize(UDim2.new(0.813, 0,9.903, 0))
			Frames:TweenSize(UDim2.new(0.187, 0,9.903, 0))
			tween2:Play()
		end
	end)

	local scwlib = {}

	function scwlib:CreateButton(name, callback)
		local callback = callback or function() end
		local TextButton = Instance.new("TextButton")
		TextButton.Parent = Container
		TextButton.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
		TextButton.BorderSizePixel = 0
		TextButton.Size = UDim2.new(0.32537961, 0, 0.162866443, 0)
		TextButton.Font = Enum.Font.SourceSans
		TextButton.TextColor3 = Color3.new(1, 1, 1)
		TextButton.TextScaled = true
		TextButton.TextSize = 14
		TextButton.TextWrapped = true
		TextButton.Text = name

		TextButton.MouseButton1Click:Connect(function()
			pcall(callback)
		end)
	end
		return scwlib
	end

local main = library:CreateWindow('Antonio Exploits')
main:CreateButton('Infinite yield', function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
main:CreateButton('Music gui', function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/jonascool9/ScoobsScripts/main/Musikdings.Lua'))
	end)
end
