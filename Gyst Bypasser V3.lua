-- Main UI Setup
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local URLLabel = Instance.new("TextLabel")
local TabFrame = Instance.new("Frame")
local TitleAccent = Instance.new("Frame")
local TabAccent = Instance.new("Frame")

-- Parent to PlayerGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame Properties
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 500, 0, 400)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

-- Title Bar
TitleBar.Parent = MainFrame
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

-- Title Accent Line
TitleAccent.Parent = TitleBar
TitleAccent.Size = UDim2.new(1, 0, 0, 2)
TitleAccent.Position = UDim2.new(0, 0, 1, -2)
TitleAccent.BackgroundColor3 = Color3.fromRGB(138, 43, 226) -- Purple Line

-- Title
Title.Parent = TitleBar
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.Position = UDim2.new(0, 5, 0, 0)
Title.Text = "Gyst Bypasser V3 BETA  |  Delta"
Title.TextColor3 = Color3.fromRGB(200, 200, 200)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left

-- URL Label
URLLabel.Parent = TitleBar
URLLabel.Size = UDim2.new(0.3, -5, 1, 0)
URLLabel.Position = UDim2.new(0.7, 0, 0, 0)
URLLabel.Text = "URL: gyst.shadowt3ch.site"
URLLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
URLLabel.Font = Enum.Font.Gotham
URLLabel.TextSize = 12
URLLabel.BackgroundTransparency = 1
URLLabel.TextXAlignment = Enum.TextXAlignment.Right

-- Tab Frame
TabFrame.Parent = MainFrame
TabFrame.Size = UDim2.new(1, 0, 0, 30)
TabFrame.Position = UDim2.new(0, 0, 0, 30)
TabFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

-- Tab Accent Line
TabAccent.Parent = TabFrame
TabAccent.Size = UDim2.new(1, 0, 0, 2)
TabAccent.Position = UDim2.new(0, 0, 1, -2)
TabAccent.BackgroundColor3 = Color3.fromRGB(138, 43, 226) -- Purple Line

-- Tabs Setup (only Main and Player tabs)
local Tabs = {"Main", "Player"}
local ContentFrames = {}
for i, tabName in ipairs(Tabs) do
	local TabButton = Instance.new("TextButton")
	TabButton.Parent = TabFrame
	TabButton.Size = UDim2.new(0.5, -2, 1, 0) -- Equal width for 2 tabs
	TabButton.Position = UDim2.new((i - 1) * 0.5, 0, 0, 0)
	TabButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	TabButton.Text = tabName
	TabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
	TabButton.Font = Enum.Font.Gotham
	TabButton.TextSize = 12

	-- Hover Effect with Purple Highlight
	TabButton.MouseEnter:Connect(function()
		TabButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
	end)
	TabButton.MouseLeave:Connect(function()
		TabButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	end)

	-- Content Frames
	local ContentFrame = Instance.new("Frame")
	ContentFrame.Parent = MainFrame
	ContentFrame.Size = UDim2.new(1, 0, 1, -60)
	ContentFrame.Position = UDim2.new(0, 0, 0, 60)
	ContentFrame.BackgroundTransparency = 1
	ContentFrame.Visible = (i == 1) -- Show the first tab (Main) by default
	ContentFrames[tabName] = ContentFrame

	-- Tab Switching
	TabButton.MouseButton1Click:Connect(function()
		for _, frame in pairs(ContentFrames) do
			frame.Visible = false
		end
		ContentFrame.Visible = true
	end)
end

-- Add Content for Each Tab
local function createTabContent(tabName, ContentFrame)
	if tabName == "Main" then
		-- Main Tab Content
		local mainFrame = Instance.new("Frame")
		mainFrame.Parent = ContentFrame
		mainFrame.Size = UDim2.new(1, 0, 1, 0)
		mainFrame.BackgroundTransparency = 1

		-- Welcome Message
		local welcomeLabel = Instance.new("TextLabel")
		welcomeLabel.Parent = mainFrame
		welcomeLabel.Size = UDim2.new(1, 0, 0.1, 0)
		welcomeLabel.Position = UDim2.new(0, 0, 0, 0)
		welcomeLabel.Text = "Welcome to the Gyst Bypasser V3 Beta!"
		welcomeLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		welcomeLabel.Font = Enum.Font.GothamBold
		welcomeLabel.TextSize = 20
		welcomeLabel.BackgroundTransparency = 1
		welcomeLabel.TextXAlignment = Enum.TextXAlignment.Center

		-- Status Indicator
		local statusLabel = Instance.new("TextLabel")
		statusLabel.Parent = mainFrame
		statusLabel.Size = UDim2.new(1, 0, 0.08, 0)
		statusLabel.Position = UDim2.new(0, 0, 0.1, 0)
		statusLabel.Text = "Status: BETA"
		statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
		statusLabel.Font = Enum.Font.Gotham
		statusLabel.TextSize = 16
		statusLabel.BackgroundTransparency = 1
		statusLabel.TextXAlignment = Enum.TextXAlignment.Center

		-- Latest Updates Section
		local updatesTitle = Instance.new("TextLabel")
		updatesTitle.Parent = mainFrame
		updatesTitle.Size = UDim2.new(1, 0, 0.06, 0)
		updatesTitle.Position = UDim2.new(0, 0, 0.2, 0)
		updatesTitle.Text = "Latest Updates:"
		updatesTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
		updatesTitle.Font = Enum.Font.GothamBold
		updatesTitle.TextSize = 18
		updatesTitle.BackgroundTransparency = 1
		updatesTitle.TextXAlignment = Enum.TextXAlignment.Center

		local updatesText = Instance.new("TextLabel")
		updatesText.Parent = mainFrame
		updatesText.Size = UDim2.new(1, 0, 0.12, 0)
		updatesText.Position = UDim2.new(0, 0, 0.26, 0)
		updatesText.Text = "- Bug fixes\n- Improved UI\n- Added new words!"
		updatesText.TextColor3 = Color3.fromRGB(200, 200, 200)
		updatesText.Font = Enum.Font.Gotham
		updatesText.TextSize = 14
		updatesText.BackgroundTransparency = 1
		updatesText.TextXAlignment = Enum.TextXAlignment.Center

		-- Credits Section
		local creditsTitle = Instance.new("TextLabel")
		creditsTitle.Parent = mainFrame
		creditsTitle.Size = UDim2.new(1, 0, 0.06, 0)
		creditsTitle.Position = UDim2.new(0, 0, 0.4, 0)
		creditsTitle.Text = "Credits:"
		creditsTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
		creditsTitle.Font = Enum.Font.GothamBold
		creditsTitle.TextSize = 18
		creditsTitle.BackgroundTransparency = 1
		creditsTitle.TextXAlignment = Enum.TextXAlignment.Center

		local creditsText = Instance.new("TextLabel")
		creditsText.Parent = mainFrame
		creditsText.Size = UDim2.new(1, 0, 0.12, 0)
		creditsText.Position = UDim2.new(0, 0, 0.46, 0)
		creditsText.Text = "ShadowT3ch Development Team\nBeta Testers"
		creditsText.TextColor3 = Color3.fromRGB(200, 200, 200)
		creditsText.Font = Enum.Font.Gotham
		creditsText.TextSize = 14
		creditsText.BackgroundTransparency = 1
		creditsText.TextXAlignment = Enum.TextXAlignment.Center
	elseif tabName == "Player" then
		-- Player Tab Content
		local playerFrame = Instance.new("Frame")
		playerFrame.Parent = ContentFrame
		playerFrame.Size = UDim2.new(1, 0, 1, 0)
		playerFrame.BackgroundTransparency = 1

		-- Bypass Section Title
		local bypasserTitle = Instance.new("TextLabel")
		bypasserTitle.Parent = playerFrame
		bypasserTitle.Size = UDim2.new(1, 0, 0.1, 0)
		bypasserTitle.Position = UDim2.new(0, 0, 0, 0)
		bypasserTitle.Text = "Bypasser: Controls"
		bypasserTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		bypasserTitle.Font = Enum.Font.GothamBold
		bypasserTitle.TextSize = 16
		bypasserTitle.BackgroundTransparency = 1
		bypasserTitle.TextXAlignment = Enum.TextXAlignment.Center

		-- Bypass Word List
		local bypassWords = {
			"ыасk", "шiне", "Sтгu", "иiзза", "вгтсн", "нawk-тuан",
			"Freaky as𝗴 boy 💀", "моммγ", "הrםק"
		}

		-- Create a UIGridLayout to arrange the buttons in a grid
		local gridLayout = Instance.new("UIGridLayout")
		gridLayout.Parent = playerFrame
		gridLayout.CellSize = UDim2.new(0, 200, 0, 30)  -- Button size
		gridLayout.CellPadding = UDim2.new(0, 10, 0, 10)  -- Padding between buttons
		gridLayout.FillDirection = Enum.FillDirection.Horizontal  -- Arrange horizontally, then vertically
		gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		gridLayout.VerticalAlignment = Enum.VerticalAlignment.Top

		-- Create buttons for each word in the bypass list
		for i, word in ipairs(bypassWords) do
			local button = Instance.new("TextButton")
			button.Size = UDim2.new(0, 200, 0, 30)  -- Set button size
			button.Text = word
			button.TextSize = 14  -- Smaller text size
			button.TextColor3 = Color3.fromRGB(255, 255, 255)
			button.BackgroundTransparency = 1  -- Make the background invisible
			button.Font = Enum.Font.Gotham
			button.Parent = playerFrame

			-- Add text shadow for better readability
			button.TextStrokeTransparency = 0.8  -- Stroke transparency for text shadow
			button.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)  -- Black text shadow for contrast

			-- Hover effect to highlight the button
			button.MouseEnter:Connect(function()
				-- Smooth transition for hover effect
				game:GetService("TweenService"):Create(
					button, 
					TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), 
					{TextColor3 = Color3.fromRGB(138, 43, 226)}  -- Purple hover effect on text
				):Play()
			end)

			button.MouseLeave:Connect(function()
				-- Smooth transition to default state
				game:GetService("TweenService"):Create(
					button, 
					TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), 
					{TextColor3 = Color3.fromRGB(255, 255, 255)}  -- Reset to white text color
				):Play()
			end)

			-- Active state when button is clicked (slight scale change)
			button.MouseButton1Click:Connect(function()
				-- Send the selected word to chat using Roblox's chat system
				local player = game.Players.LocalPlayer
				local chatService = game:GetService("Chat")

				-- Send the word to the chat
				local char = player.Character
				if char and char:FindFirstChild("HumanoidRootPart") then
					-- Send the word to the chat window (chat window should display)
					chatService:Chat(char, word, Enum.ChatColor.White)  -- This sends the word to the chat

					-- Now simulate the character saying the word
					local humanoid = char:FindFirstChild("Humanoid")
					if humanoid then
						humanoid:PlayAnimation(char:WaitForChild("Animator"):LoadAnimation(Instance.new("Animation")))  -- Optional for sound/animation
					end
				end

				-- Optionally add scale effect on click
				local originalSize = button.Size
				game:GetService("TweenService"):Create(
					button, 
					TweenInfo.new(0.1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), 
					{Size = UDim2.new(0, 190, 0, 28)}  -- Slightly smaller size on click
				):Play()

				-- Reset to original size after click
				wait(0.1)
				game:GetService("TweenService"):Create(
					button, 
					TweenInfo.new(0.1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), 
					{Size = originalSize}  -- Return to original size after the click
				):Play()
			end)
		end
	end
end

-- Create content for both Main and Player tabs
createTabContent("Main", ContentFrames["Main"])
createTabContent("Player", ContentFrames["Player"])
