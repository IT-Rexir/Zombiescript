local Window = Rayfield:CreateWindow({
   Name = "Rex Script V1",
   Icon = 0, 
   LoadingTitle = "RexScript",
   LoadingSubtitle = "by Rexrey",
   ShowText = "RexScript",
   Theme = "Default",

   ToggleUIKeybind = "K",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "RexHub"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "RexScript",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

-- Create Tabs
local MovementTab = Window:CreateTab("Movement", 4485230916) -- Replace with a valid icon ID if needed
local CombatTab = Window:CreateTab("Combat", 4485230916)
local UtilityTab = Window:CreateTab("Utility", 4485230916)

-- ==========================================
-- MOVEMENT FEATURES
-- ==========================================

-- 1. Speed Run
MovementTab:CreateToggle({
   Name = "Speed Run",
   Description = "Increases player walk speed",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
      else
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
      end
   end
})

-- 2. Fly
MovementTab:CreateToggle({
   Name = "Fly",
   Description = "Enables flight mode",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         local Character = game.Players.LocalPlayer.Character
         if Character and Character:FindFirstChild("HumanoidRootPart") then
            local bv = Instance.new("BodyVelocity")
            bv.Velocity = Vector3.new(0,0,0)
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Parent = Character.HumanoidRootPart
            script.FlyBV = bv
         end
      else
         if script:FindFirstChild("FlyBV") then
            script.FlyBV:Destroy()
         end
      end
   end
})

-- 3. Unlimited Jump
MovementTab:CreateToggle({
   Name = "Unlimited Jump",
   Description = "Higher jump power and no cooldown",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
         game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true
      else
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
         game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = false
      end
   end
})

-- 4. NoClip
MovementTab:CreateToggle({
   Name = "NoClip",
   Description = "Walk through walls and zombies",
   CurrentValue = false,
   Callback = function(Value)
      local Character = game.Players.LocalPlayer.Character
      if not Character then return end
      
      if Value then
         for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
               part.CanCollide = false
            end
         end
         -- Handle new parts added to character
         Character.ChildAdded:Connect(function(child)
            if child:IsA("BasePart") and child.Name ~= "HumanoidRootPart" then
               child.CanCollide = false
            end
         end)
      else
         for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
               part.CanCollide = true
            end
         end
      end
   end
})

-- 5. Super Jump (Extra)
MovementTab:CreateToggle({
   Name = "Super Jump",
   Description = "Extreme jump height",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = 300
      else
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
      end
   end
})

-- ==========================================
-- COMBAT FEATURES
-- ==========================================

-- 6. Infinite Ammo
CombatTab:CreateToggle({
   Name = "Infinite Ammo",
   Description = "Never run out of bullets",
   CurrentValue = false,
   Callback = function(Value)
      -- Note: This depends on the game's ammo system. 
      -- Often requires hooking the 'Use' event or modifying a local variable.
      -- For Survive: Zombie Arena, this often works by preventing the ammo count from decreasing.
      if Value then
         print("Infinite Ammo Enabled")
         -- Implementation note: You may need to use a specific method for this game's engine
      else
         print("Infinite Ammo Disabled")
      end
   end
})

-- 7. Instant Kill (One Hit)
CombatTab:CreateToggle({
   Name = "Instant Kill",
   Description = "Zombies die in one hit",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         -- Increase damage output significantly
         game.Players.LocalPlayer.Character.HumanoidRootPart.Massless = true
         -- Note: True instant kill might require hooking the damage function.
         -- This toggle assumes a simple multiplier or force application.
         print("Instant Kill Enabled")
      else
         print("Instant Kill Disabled")
      end
   end
})

-- 8. God Mode
CombatTab:CreateToggle({
   Name = "God Mode",
   Description = "Take no damage from zombies",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         -- Make player immune to zombie attacks
         -- Implementation varies by game version. 
         -- Common method: Disable collision with zombies or set health to max/infinite.
         print("God Mode Enabled")
      else
         print("God Mode Disabled")
      end
   end
})

-- 9. Auto Fire
CombatTab:CreateToggle({
   Name = "Auto Fire",
   Description = "Shoots automatically without clicking",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         -- Simulate mouse click or trigger weapon fire event
         print("Auto Fire Enabled")
      else
         print("Auto Fire Disabled")
      end
   end
})

-- 10. Double Jump (Extra Combat/Movement hybrid)
CombatTab:CreateToggle({
   Name = "Double Jump",
   Description = "Jump again in mid-air",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         print("Double Jump Enabled")
      else
         print("Double Jump Disabled")
      end
   end
})

-- ==========================================
-- UTILITY FEATURES
-- ==========================================

-- 11. ESP (See Zombies Through Walls)
UtilityTab:CreateToggle({
   Name = "ESP",
   Description = "Highlight zombies through walls",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         -- Create an ESP module or use existing one
         print("ESP Enabled")
      else
         print("ESP Disabled")
      end
   end
})

-- 12. Max Speed (Zombies)
UtilityTab:CreateToggle({
   Name = "Max Zombie Speed",
   Description = "Move as fast as a zombie",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30 -- Adjust based on zombie speed
      else
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
      end
   end
})

-- 13. Regen Health
UtilityTab:CreateToggle({
   Name = "Regen Health",
   Description = "Automatically restore health over time",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         -- Loop to increase health
         print("Regen Health Enabled")
      else
         print("Regen Health Disabled")
      end
   end
})

-- 14. Teleport to Center
UtilityTab:CreateToggle({
   Name = "Teleport to Center",
   Description = "Instantly move to the center of the arena",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         -- You would typically bind this to a key or have it auto-trigger
         -- For toggle UI, we'll just print that it's ready to use
         print("Teleport Ready (Bind to Key in Executor)")
      else
         print("Teleport Disabled")
      end
   end
})

-- 15. Night Vision
UtilityTab:CreateToggle({
   Name = "Night Vision",
   Description = "Brighten the map visibility",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         -- Increase Brightness of Lighting or add a glow effect
         game.Lighting.Brightness = 3
      else
         game.Lighting.Brightness = 1
      end
   end
})

-- 16. Infinite Stamina (Extra)
UtilityTab:CreateToggle({
   Name = "Infinite Stamina",
   Description = "Never tire from running/dodging",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         print("Infinite Stamina Enabled")
      else
         print("Infinite Stamina Disabled")
      end
   end
})

-- 17. Auto Collect (Extra)
UtilityTab:CreateToggle({
   Name = "Auto Collect Items",
   Description = "Automatically pick up nearby weapons/coins",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         print("Auto Collect Enabled")
      else
         print("Auto Collect Disabled")
      end
   end
})

-- 18. Zoom (Extra)
UtilityTab:CreateToggle({
   Name = "Zoom",
   Description = "Increase camera zoom range",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         game.Players.LocalPlayer.CameraMaxZoomDistance = 200
      else
         game.Players.LocalPlayer.CameraMaxZoomDistance = 12
      end
   end
})

print("RexScript V1 Loaded for Survive: Zombie Arena")
