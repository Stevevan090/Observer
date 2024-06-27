local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local FollowButton = Instance.new("TextButton")
local CreditsLabel = Instance.new("TextLabel")

ScreenGui.Name = "FollowPlayerGui"
ScreenGui.Parent = game.CoreGui

Frame.Name = "Frame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.4, 0, 0.4, 0)
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Active = true
Frame.Draggable = true

TextBox.Name = "TextBox"
TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Position = UDim2.new(0.1, 0, 0.1, 0)
TextBox.Size = UDim2.new(0.8, 0, 0.2, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Enter player name"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextScaled = true

FollowButton.Name = "FollowButton"
FollowButton.Parent = Frame
FollowButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
FollowButton.Position = UDim2.new(0.1, 0, 0.4, 0)
FollowButton.Size = UDim2.new(0.8, 0, 0.2, 0)
FollowButton.Font = Enum.Font.SourceSans
FollowButton.Text = "Follow Player"
FollowButton.TextColor3 = Color3.fromRGB(0, 0, 0)
FollowButton.TextScaled = true

CreditsLabel.Name = "CreditsLabel"
CreditsLabel.Parent = Frame
CreditsLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CreditsLabel.Position = UDim2.new(0.1, 0, 0.7, 0)
CreditsLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
CreditsLabel.Font = Enum.Font.SourceSans
CreditsLabel.Text = "Script by Stevejjj228"
CreditsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditsLabel.TextScaled = true

local function followPlayer(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        camera.CameraSubject = targetPlayer.Character.HumanoidRootPart
    else
        camera.CameraSubject = localPlayer.Character.HumanoidRootPart
    end
end

FollowButton.MouseButton1Click:Connect(function()
    local targetPlayerName = TextBox.Text
    local targetPlayer = Players:FindFirstChild(targetPlayerName)
    if targetPlayer then
        followPlayer(targetPlayer)
    else
        print("Player not found")
        camera.CameraSubject = localPlayer.Character.HumanoidRootPart
    end
end)

RunService.RenderStepped:Connect(function()
    local targetPlayerName = TextBox.Text
    local targetPlayer = Players:FindFirstChild(targetPlayerName)
    if targetPlayer then
        followPlayer(targetPlayer)
    else
        camera.CameraSubject = localPlayer.Character.HumanoidRootPart
    end
end)
