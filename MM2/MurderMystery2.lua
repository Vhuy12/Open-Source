--https://vyn.wtf
local d = (loadstring(game:HttpGet("https://pastebin.com/raw/wJ32Ubua")))()
local S = Instance.new("TextButton")
S.Name = "WindUIToggle"
S.Text = "MM2"
S.TextColor3 = Color3.new(1, 1, 1)
S.TextSize = 12
S.Font = Enum.Font.GothamBold
S.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
S.BorderSizePixel = 0
S.Size = UDim2.new(0, 60, 0, 22)
S.Position = UDim2.new(1, - 70, 0, 10)
S.AnchorPoint = Vector2.new(1, 0)
S.ZIndex = 100
local H = Instance.new("UIGradient")
H.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 70, 120));
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 80))
})
H.Rotation = 90
H.Parent = S
local i = Instance.new("UICorner")
i.CornerRadius = UDim.new(0, 4)
i.Parent = S
local a = Instance.new("UIStroke")
a.Color = Color3.fromRGB(100, 100, 150)
a.Thickness = 1
a.Parent = S
S.Parent = game:GetService("CoreGui")
local p = d:CreateWindow({
    Title = "MM2 | fuckerHub";
    Icon = "sword";
    Author = "al",
    Folder = "YOU_GOT_RATTED",
    Size = UDim2.fromOffset(450, 350),
    Theme = "Dark";
    HasOutline = true
})
local X = true
S.MouseButton1Click:Connect(function()
    X = not X
    p:Toggle(X)
    S.BackgroundTransparency = X and 0 or .5
    S.TextTransparency = X and 0 or .5
end)
local Q = {
    HomeTab = p:Tab({
        Title = "Home";
        Icon = "mouse-pointer-2"
    });
    MainTab = p:Tab({
        Title = "Main";
        Icon = "star"
    }),
    AutoFarmTab = p:Tab({
        Title = "Auto Farm",
        Icon = "zap"
    }),
    TeleportTab = p:Tab({
        Title = "Teleport",
        Icon = "map-pin"
    });
    PlayerTab = p:Tab({
        Title = "Player",
        Icon = "user"
    }),
    VisualTab = p:Tab({
        Title = "Visual";
        Icon = "eye"
    }),
    TrollingTab = p:Tab({
        Title = "Trolling";
        Icon = "smile"
    }),
    ESPTab = p:Tab({
        Title = "ESP",
        Icon = "crosshair"
    }),
    MiscTab = p:Tab({
        Title = "Misc",
        Icon = "settings"
    }),
    CreditsTab = p:Tab({
        Title = "Credits",
        Icon = "award"
    }),
    LogsTab = p:Tab({
        Title = "Update Logs",
        Icon = "bell"
    })
}
local n = false
d:Popup({
    Title = "Welcome!";
    Icon = "info",
    Content = "Thanks for choosing GalaxyHub, report any bugs to us.";
    Buttons = {
        {
            Title = "Cancel";
            Callback = function()
            end;
            Variant = "Tertiary"
        };
        {
            Title = "Continue";
            Icon = "arrow-right";
            Callback = function()
                n = true
            end;
            Variant = "Primary"
        }
    }
})
repeat
    task.wait()
until n
Q.HomeTab:Paragraph({
    Title = "Beta Stage";
    Desc = "GalaxyHub is still in beta, expect bugs. If you have any suggestions, add sho.orn_ or gamerreadyreal on discord",
    Image = "info"
})
local function k(d)
    local S, H = require((game:GetService("ReplicatedStorage")).Database.Sync.Item), require((game:GetService("ReplicatedStorage")).Modules.ProfileData)
    local i = {};
    (i)[d] = 1
    local a = H.Weapons;
    (game:GetService("RunService")):BindToRenderStep("InventoryUpdate", 0, function()
        a.Owned = i
    end)
    game.Players.LocalPlayer.Character:BreakJoints()
end
Q.VisualTab:Paragraph({
    Title = "VISUAL WARNING",
    Desc = "ALL items are in fact visual and not real you do not get to keep any of the items after rejoining the game they are only for show and do not actually exist ";
    Image = "eye"
})
local L = {
    min = 1;
    max = 100000
}
Q.VisualTab:Section({
    Title = "Weapon Visuals",
    Desc = ""
})
Q.VisualTab:Slider({
    Title = "Min",
    Value = {
        Min = 1;
        Max = 100000,
        Default = 1
    };
    Compact = true;
    Callback = function(d)
        L.min = d
    end
})
Q.VisualTab:Slider({
    Title = "Max",
    Value = {
        Min = 1;
        Max = 100000;
        Default = 150
    };
    Compact = true;
    Callback = function(d)
        L.max = d
    end
})
Q.VisualTab:Button({
    Title = "spawn random Godlys (if they don\226\128\153t spawn reset ",
    Compact = true,
    Callback = function()
        local S = require((game:GetService("ReplicatedStorage")).Database.Sync.Item)
        local H = require((game:GetService("ReplicatedStorage")).Modules.ProfileData)
        local i = {}
        for d, S in pairs(S) do
            (i)[d] = math.random(L.min, L.max)
        end;
        (game:GetService("RunService")):BindToRenderStep("InventoryUpdate", 0, function()
            H.Weapons.Owned = i
        end)
        d:Notify({
            Title = "Visuals Enabled",
            Content = "Fake counts activated!",
            Duration = 2
        })
    end
})
Q.VisualTab:Section({
    Title = "Item Spawner";
    Desc = ""
})
Q.VisualTab:Input({
    Title = "Weapon Name",
    Placeholder = "Enter weapon name..",
    Compact = true;
    Callback = function(S)
        if S and S ~= "" then
            k(S)
            d:Notify({
                Title = "Weapon Spawned";
                Content = S .. " added!";
                Duration = 2
            })
        end
    end
})
Q.VisualTab:Section({
    Title = "weapon dupe ",
    Desc = ""
})
Q.VisualTab:Section({
    Title = "Duplication Options",
    Desc = "Select amount to duplicate by and choose a specific item to duplicate."
})
Q.VisualTab:Input({
    Title = "Duplication Multiplier",
    Placeholder = "Enter multiplier (e.g., 2, 3)";
    Compact = true,
    Callback = function(S)
        local H = tonumber(S)
        if H and H > 0 then
            _G.DupeMultiplier = H
            d:Notify({
                Title = "Multiplier Set",
                Content = "Duplication multiplier set to x" .. H,
                Duration = 2
            })
        else
            d:Notify({
                Title = "Invalid Multiplier";
                Content = "Please enter a valid multiplier (greater than 0).";
                Duration = 2
            })
        end
    end
})
Q.VisualTab:Input({
    Title = "Specific Item to Duplicate",
    Placeholder = "Enter item name to dupe (e.g., Christmas Knife)";
    Compact = true,
    Callback = function(S)
        _G.DupeSpecificItem = S
        d:Notify({
            Title = "Item Set";
            Content = "Specific item set to duplicate: " .. S,
            Duration = 2
        })
    end
})
Q.VisualTab:Button({
    Title = "Duplicate Inventory";
    Compact = true;
    Callback = function()
        local S = game:GetService("Players")
        local H = S.LocalPlayer
        local i
        if H.PlayerGui.MainGUI.Game:FindFirstChild("Inventory") ~= nil then
            i = H.PlayerGui.MainGUI.Game.Inventory.Main
        else
            i = H.PlayerGui.MainGUI.Lobby.Screens.Inventory.Main
        end
        local function a()
            local d = _G.DupeMultiplier or 2
            local S = _G.DupeSpecificItem
            for H, i in pairs(i.Weapons.Items.Container:GetChildren()) do
                for H, i in pairs(i.Container:GetChildren()) do
                    if i:IsA("Frame") then
                        local H = i.ItemName.Label.Text
                        if (not S or H == S) and (H ~= "Default Knife" and H ~= "Default Gun") then
                            local S = i.Container.Amount.Text
                            if S == "" or S == "None" then
                                i.Container.Amount.Text = "x" .. tostring(d)
                            else
                                local H = tonumber(S:match("x(%d+)"))
                                if H then
                                    i.Container.Amount.Text = "x" .. tostring(H * d)
                                end
                            end
                        end
                    end
                end
            end
            for S, H in pairs(i.Pets.Items.Container.Current.Container:GetChildren()) do
                if H:IsA("Frame") then
                    local S = H.Container.Amount.Text
                    if S == "" or S == "None" then
                        H.Container.Amount.Text = "x" .. tostring(d)
                    else
                        local i = tonumber(S:match("x(%d+)"))
                        if i then
                            H.Container.Amount.Text = "x" .. tostring(i * d)
                        end
                    end
                end
            end
        end
        a()
        d:Notify({
            Title = "Inventory Visual Duplication";
            Content = "Your inventory has been visually duplicated!",
            Duration = 2
        })
    end
})
local q = false
Q.AutoFarmTab:Section({
    Title = "Auto Farming",
    Desc = ""
})
local v
local I
local w
local M
local U = false
Q.AutoFarmTab:Toggle({
    Title = "Farm Eggs",
    Compact = true,
    Value = false;
    Callback = function(d)
        U = d
        if d then
            task.spawn(function()
                if not game:IsLoaded() then
                    game.Loaded:Wait()
                end
                local d = game:GetService("Players")
                local S = game:GetService("TweenService")
                local H = game:GetService("ReplicatedStorage")
                local i = game:GetService("Workspace")
                local a = game:GetService("VirtualUser")
                local p = d.LocalPlayer
                local X = p.Character or p.CharacterAdded:Wait()
                local Q = X:WaitForChild("HumanoidRootPart")
                local n = Q.CFrame
                local k = H.Remotes.Gameplay.CoinCollected
                local L = H.Remotes.Gameplay.RoundStart
                local q = H.Remotes.Gameplay.RoundEndFade
                local v = false
                local C = "Egg"
                local F = 150
                local Z = 25
                p.Idled:Connect(function()
                    a:CaptureController()
                    a:ClickButton2(Vector2.new())
                end)
                local function r()
                    local d, S = nil, math.huge
                    for H, i in ipairs(i:GetDescendants()) do
                        if i:IsA("BasePart") and i:GetAttribute("CoinID") == C then
                            if i:FindFirstChild("TouchInterest") then
                                local H = (Q.Position - i.Position).Magnitude
                                if H < S then
                                    d = i
                                    S = H
                                end
                            end
                        end
                    end
                    return d, S
                end
                local function o(d, H)
                    local i = S:Create(Q, TweenInfo.new(H, Enum.EasingStyle.Linear), {
                        CFrame = d
                    })
                    i:Play()
                    return i
                end
                I = k.OnClientEvent:Connect(function(d, S, H)
                    if d == C and S >= H then
                        v = true;
                        (o(n, 2)).Completed:Wait()
                        if p.Character and p.Character:FindFirstChildOfClass("Humanoid") then
                            (p.Character:FindFirstChildOfClass("Humanoid")).Health = 0
                        end
                        v = false
                    end
                end)
                w = L.OnClientEvent:Connect(function()
                    v = false
                end)
                M = q.OnClientEvent:Connect(function()
                    o(n, 2)
                end)
                while task.wait() do
                    local d = false
                    repeat
                        if not U or v then
                            d = true
                            break
                        end
                        X = p.Character or p.CharacterAdded:Wait()
                        Q = X:WaitForChild("HumanoidRootPart")
                        local S, H = r()
                        if S then
                            if H > F then
                                Q.CFrame = S.CFrame
                            else
                                local d = o(S.CFrame, H / Z)
                                repeat
                                    task.wait()
                                until not S.Parent or not S:FindFirstChild("TouchInterest") or not U
                                d:Cancel()
                            end
                        end
                        d = true
                    until true
                    if not d then
                        break
                    end
                end
            end)
        else
            if v then
                task.cancel(v)
            end
            if I then
                I:Disconnect()
            end
            if w then
                w:Disconnect()
            end
            if M then
                M:Disconnect()
            end
        end
    end
})
local C
Q.AutoFarmTab:Toggle({
    Title = "Farm Coins";
    Compact = true,
    Value = false,
    Callback = function(d)
        if d then
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            local d = game:GetService("Players")
            local S = game:GetService("TweenService")
            local H = game:GetService("ReplicatedStorage")
            local i = game:GetService("Workspace")
            local a = game:GetService("VirtualUser")
            local p = d.LocalPlayer
            local X = p.Character or p.CharacterAdded:Wait()
            local Q = X:WaitForChild("HumanoidRootPart")
            local n = Q.CFrame
            local k = H.Remotes.Gameplay.CoinCollected
            local L = H.Remotes.Gameplay.RoundStart
            local q = H.Remotes.Gameplay.RoundEndFade
            local v = true
            local I = false
            local U = "Coin"
            local F = 150
            local Z = 25
            p.Idled:Connect(function()
                a:CaptureController()
                a:ClickButton2(Vector2.new())
            end)
            local function r()
                local d, S = nil, math.huge
                for H, i in ipairs(i:GetDescendants()) do
                    if i:IsA("BasePart") and i:GetAttribute("CoinID") == U then
                        if i:FindFirstChild("TouchInterest") then
                            local H = (Q.Position - i.Position).Magnitude
                            if H < S then
                                d = i
                                S = H
                            end
                        end
                    end
                end
                return d, S
            end
            local function o(d, H)
                local i = S:Create(Q, TweenInfo.new(H, Enum.EasingStyle.Linear), {
                    CFrame = d
                })
                i:Play()
                return i
            end
            CoinCollectedConnection = k.OnClientEvent:Connect(function(d, S, H)
                if d == U and S >= H then
                    I = true;
                    (o(n, 2)).Completed:Wait()
                    if p.Character and p.Character:FindFirstChildOfClass("Humanoid") then
                        (p.Character:FindFirstChildOfClass("Humanoid")).Health = 0
                    end
                    I = false
                end
            end)
            w = L.OnClientEvent:Connect(function()
                v = true
                I = false
            end)
            M = q.OnClientEvent:Connect(function()
                v = false
                o(n, 2)
            end)
            C = task.spawn(function()
                while task.wait() do
                    local d = false
                    repeat
                        if not v or I then
                            d = true
                            break
                        end
                        X = p.Character or p.CharacterAdded:Wait()
                        Q = X:WaitForChild("HumanoidRootPart")
                        local S, H = r()
                        if S then
                            if H > F then
                                Q.CFrame = S.CFrame
                            else
                                local d = o(S.CFrame, H / Z)
                                repeat
                                    task.wait()
                                until not S.Parent or not S:FindFirstChild("TouchInterest") or not v
                                d:Cancel()
                            end
                        end
                        d = true
                    until true
                    if not d then
                        break
                    end
                end
            end)
        else
            farming = false
            if C then
                task.cancel(C)
            end
            if CoinCollectedConnection then
                CoinCollectedConnection:Disconnect()
            end
            if w then
                w:Disconnect()
            end
            if M then
                M:Disconnect()
            end
        end
    end
})
local F = false
local Z = nil
local function r()
    if Z then
        task.cancel(Z)
    end
    Z = task.spawn(function()
        while F do
            if not game:IsLoaded() then
                game.Loaded:Wait()
                task.wait(2)
            end
            local d = game:GetService("Players")
            local S = game:GetService("ReplicatedStorage")
            local H = game:GetService("VirtualInputManager")
            local i = d.LocalPlayer
            local a = i.Character or i.CharacterAdded:Wait()
            local p = a:WaitForChild("HumanoidRootPart")
            local X = {
                Spawn = CFrame.new(0, 5, 0);
                Potion = CFrame.new(- 105.23, 141.87, 101.46)
            }
            local function Q()
                local d = game:GetService("VirtualUser")
                i.Idled:Connect(function()
                    d:CaptureController()
                    d:ClickButton2(Vector2.new())
                    H:SendKeyEvent(true, "E", false, game)
                    task.wait(.1)
                    H:SendKeyEvent(false, "E", false, game)
                end)
                local S = time()
                while F and task.wait(1) do
                    if time() - S > 30 then
                        d:CaptureController()
                        d:ClickButton2(Vector2.new())
                        S = time()
                    end
                end
            end
            local n = task.spawn(Q)
            local function k(d)
                if (X)[d] and (a and p) then
                    pcall(function()
                        a:SetPrimaryPartCFrame((X)[d])
                    end)
                end
            end
            while F and task.wait(.1) do
                if not a or not a.Parent or not p then
                    a = i.Character or i.CharacterAdded:Wait()
                    p = a:WaitForChild("HumanoidRootPart")
                end
                k("Potion")
            end
            task.cancel(n)
            if S:FindFirstChild("Remotes") then
                local d = S.Remotes:FindFirstChild("RoundStart")
                if d then
                    d.OnClientEvent:Wait()
                    task.wait(1)
                end
            end
        end
    end)
end
Q.AutoFarmTab:Toggle({
    Title = "Auto Farm Level (Persistent)";
    Compact = true;
    Value = F,
    Callback = function(d)
        F = d
        if d then
            r()
        else
            if Z then
                task.cancel(Z)
            end
        end
    end
})
if not F and (getgenv()).AutoFarmWasEnabled then
    F = true;
    (Q.AutoFarmTab:Get("Auto Farm Level (Persistent)")):Set(true)
    r()
end;
(game:GetService("Players")).LocalPlayer.OnTeleport:Connect(function()
    (getgenv()).AutoFarmWasEnabled = F
end)
local o = game:GetService("Players")
local e = o.LocalPlayer
local G = game:GetService("RunService")
local J = game:GetService("UserInputService")
local g = game:GetService("Lighting")
local V = game:GetService("StarterPack")
local s, y = 16, 50
local A = false
local t = false
local b = 50
local N = false
local R = false
local K = true
local D = false
Q.PlayerTab:Section({
    Title = "Movement";
    Desc = ""
})
Q.PlayerTab:Slider({
    Title = "Walk Speed",
    Compact = true;
    Value = {
        Min = 16;
        Max = 200,
        Default = 16
    },
    Callback = function(d)
        s = d
        local S = e.Character and e.Character:FindFirstChildOfClass("Humanoid")
        if S then
            S.WalkSpeed = d
        end
    end
})
Q.AutoFarmTab:Toggle({
    Title = "White screen (performance)";
    Compact = true;
    Value = false,
    Callback = function(d)
        if d then
            local d = game:GetService("Lighting")
            local S = workspace:FindFirstChildOfClass("Terrain")
            local H = game:GetService("Players")
            local i = H.LocalPlayer
            d.GlobalShadows = false
            d.FogEnd = 10000000000.0
            d.Brightness = 0
            if S then
                S.WaterWaveSize = 0
                S.WaterWaveSpeed = 0
                S.WaterReflectance = 0
                S.WaterTransparency = 1
            end
            for d, S in ipairs(workspace:GetDescendants()) do
                if S:IsA("BasePart") then
                    S.Material = Enum.Material.Plastic
                    S.Reflectance = 0
                elseif S:IsA("Decal") or S:IsA("Texture") then
                    S:Destroy()
                elseif S:IsA("ParticleEmitter") or S:IsA("Trail") then
                    S:Destroy()
                elseif S:IsA("PointLight") or S:IsA("SpotLight") or S:IsA("SurfaceLight") then
                    S:Destroy()
                end
            end
            for d, S in ipairs(H:GetPlayers()) do
                local H = S.Character
                if H then
                    for d, S in ipairs(H:GetDescendants()) do
                        if S:IsA("Accessory") or S:IsA("Clothing") then
                            S:Destroy()
                        end
                    end
                end
            end
            whiteScreenGui = Instance.new("ScreenGui")
            whiteScreenGui.Name = "WhiteScreenOverlay"
            whiteScreenGui.ResetOnSpawn = false
            whiteScreenGui.IgnoreGuiInset = true
            whiteScreenGui.DisplayOrder = 999
            local a = Instance.new("Frame")
            a.Size = UDim2.new(1, 0, 1, 0)
            a.Position = UDim2.new(0, 0, 0, 0)
            a.BackgroundColor3 = Color3.new(1, 1, 1)
            a.BorderSizePixel = 0
            a.Parent = whiteScreenGui
            whiteScreenGui.Parent = H.LocalPlayer:WaitForChild("PlayerGui")
        else
            if whiteScreenGui then
                whiteScreenGui:Destroy()
                whiteScreenGui = nil
            end
        end
    end
})
Q.PlayerTab:Slider({
    Title = "Jump Power",
    Compact = true,
    Value = {
        Min = 50;
        Max = 500,
        Default = 50
    };
    Callback = function(d)
        y = d
        local S = e.Character and e.Character:FindFirstChildOfClass("Humanoid")
        if S then
            S.JumpPower = d
        end
    end
})
Q.PlayerTab:Toggle({
    Title = "Infinite Jump";
    Compact = true,
    Callback = function(d)
        N = d
    end
})
J.JumpRequest:Connect(function()
    if N and e.Character then
        local d = e.Character:FindFirstChildOfClass("Humanoid")
        if d then
            d:ChangeState("Jumping")
        end
    end
end)
Q.PlayerTab:Toggle({
    Title = "Zero Gravity",
    Compact = true,
    Callback = function(d)
        K = not d
        workspace.Gravity = d and 0 or 196.2
    end
})
Q.PlayerTab:Section({
    Title = "Flight",
    Desc = ""
})
local Y = false
local E, h
local function B()
    E = Instance.new("BodyVelocity")
    E.Velocity = Vector3.new(0, 0, 0)
    E.MaxForce = Vector3.new(100000, 100000, 100000)
    h = Instance.new("BodyGyro")
    h.MaxTorque = Vector3.new(100000, 100000, 100000)
end
local function u()
    if not e.Character then
        return
    end
    local d = e.Character
    local S = d:FindFirstChild("HumanoidRootPart")
    local H = d:FindFirstChildOfClass("Humanoid")
    if not S or not H then
        return
    end
    B()
    t = true
    E.Parent = S
    h.Parent = S
    h.CFrame = S.CFrame
    H.PlatformStand = true
end
local function l()
    t = false
    if E then
        E:Destroy()
    end
    if h then
        h:Destroy()
    end
    local S = e.Character
    if S then
        local d = S:FindFirstChildOfClass("Humanoid")
        if d then
            d.PlatformStand = false
        end
    end
    d:Notify({
        Title = "Flight",
        Content = "Flight disabled";
        Duration = 2
    })
end
J.InputBegan:Connect(function(d, S)
    if S or d.KeyCode ~= Enum.KeyCode.E then
        return
    end
    if not Y then
        return
    end
    if t then
        l()
    else
        u()
    end
end)
G.RenderStepped:Connect(function()
    if not t or not e.Character then
        return
    end
    local d = e.Character
    local S = d:FindFirstChild("HumanoidRootPart")
    if not S then
        return
    end
    local H = Vector3.new(0, 0, 0)
    local i = workspace.CurrentCamera
    if J:IsKeyDown(Enum.KeyCode.W) then
        H = H + i.CFrame.LookVector
    end
    if J:IsKeyDown(Enum.KeyCode.S) then
        H = H - i.CFrame.LookVector
    end
    if J:IsKeyDown(Enum.KeyCode.A) then
        H = H - i.CFrame.RightVector
    end
    if J:IsKeyDown(Enum.KeyCode.D) then
        H = H + i.CFrame.RightVector
    end
    if J:IsKeyDown(Enum.KeyCode.Space) then
        H = H + Vector3.new(0, 1, 0)
    end
    if J:IsKeyDown(Enum.KeyCode.LeftShift) then
        H = H - Vector3.new(0, 1, 0)
    end
    E.Velocity = H * b
    h.CFrame = i.CFrame
end)
e.CharacterAdded:Connect(function(d)
    if Y and t then
        task.wait(1)
        u()
    end
end)
Q.PlayerTab:Toggle({
    Title = "PC Fly (Press E)";
    Compact = true,
    Callback = function(d)
        Y = d
        if not d and t then
            l()
        end
    end
})
Q.PlayerTab:Slider({
    Title = "Fly Speed";
    Compact = true,
    Value = {
        Min = 20,
        Max = 200,
        Default = 50
    },
    Callback = function(S)
        b = S
        if t then
            d:Notify({
                Title = "Flight Speed";
                Content = "Speed set to: " .. S,
                Duration = 2
            })
        end
    end
})
Q.PlayerTab:Button({
    Title = "Mobile Fly (Touch)",
    Compact = true;
    Callback = function()
        D = not D
        if D then
            (loadstring("loadstring(game:HttpGet(('https://gist.githubusercontent.com/meozoneYT/bf037dff9f0a70017304ddd67fdcd370/raw/e14e74f425b060df523343cf30b787074eb3c5d2/arceus%2520x%2520fly%25202%2520obflucator'),true))()\n\n"))()
        end
    end
})
Q.PlayerTab:Section({
    Title = "Visual",
    Desc = ""
})
Q.PlayerTab:Toggle({
    Title = "X-ray Vision",
    Compact = true;
    Callback = function(d)
        R = d
        for S, H in pairs(workspace:GetDescendants()) do
            if H:IsA("BasePart") and not H:IsDescendantOf(e.Character) then
                H.LocalTransparencyModifier = d and .7 or 0
            end
        end
    end
})
Q.PlayerTab:Toggle({
    Title = "Fullbright",
    Compact = true,
    Callback = function(d)
        g.GlobalShadows = not d
        g.Brightness = d and 2 or 1
    end
})
Q.PlayerTab:Section({
    Title = "Utility";
    Desc = ""
})
Q.PlayerTab:Toggle({
    Title = "Smart Noclip (Auto)",
    Compact = true,
    Callback = function(d)
        A = d
        if d then
            (coroutine.wrap(function()
                while A and e.Character do
                    if e.Character:FindFirstChildOfClass("Humanoid") then
                        for d, S in pairs(e.Character:GetDescendants()) do
                            if S:IsA("BasePart") then
                                S.CanCollide = false
                            end
                        end
                    end
                    task.wait(.1)
                end
            end))()
        end
    end
})
Q.PlayerTab:Button({
    Title = "Give Teleport Tool";
    Compact = true;
    Callback = function()
        local d = Instance.new("Tool")
        d.RequiresHandle = false
        d.Name = "Teleport Tool"
        d.Activated:Connect(function()
            local d = e:GetMouse()
            local S = d.Hit.Position + Vector3.new(0, 5, 0)
            local H = e.Character and e.Character:FindFirstChild("HumanoidRootPart")
            if H then
                H.CFrame = CFrame.new(S)
            end
        end)
        d.Parent = e:WaitForChild("Backpack")
    end
})
e.CharacterAdded:Connect(function(d)
    task.wait(1)
    local S = d:FindFirstChildOfClass("Humanoid")
    if S then
        S.WalkSpeed = s
        S.JumpPower = y
    end
end)
local f = {
    Locations = {
        Spawn = CFrame.new(- 105.23, 141.87, 101.46);
        Game = CFrame.new(- 85.67, 142.12, 125.34)
    }
}
local function P()
    local d = {}
    for S, H in ipairs((game:GetService("Players")):GetPlayers()) do
        if H ~= game.Players.LocalPlayer then
            table.insert(d, H.Name)
        end
    end
    return d
end
local function c(d)
    for S, H in ipairs((game:GetService("Players")):GetPlayers()) do
        if H ~= game.Players.LocalPlayer then
            if d == "Murder" then
                local d = H.Backpack and H.Backpack:FindFirstChild("Knife") or H.Character and H.Character:FindFirstChild("Knife")
                if d then
                    return H
                end
            elseif d == "Sheriff" then
                local d = H.Backpack and H.Backpack:FindFirstChild("Gun") or H.Character and H.Character:FindFirstChild("Gun")
                if d then
                    return H
                end
            end
        end
    end
    return nil
end
local j = Q.TeleportTab:Dropdown({
    Title = "Select player to go to";
    Values = P();
    Value = "";
    Compact = true;
    Callback = function(S)
        local H = (game:GetService("Players")):FindFirstChild(S)
        if H then
            if H.Character and H.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = H.Character.HumanoidRootPart.CFrame
                d:Notify({
                    Title = "Teleported",
                    Content = "Teleported to " .. S,
                    Duration = 2
                })
            else
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = f.Locations.Spawn
                d:Notify({
                    Title = "Teleported";
                    Content = S .. " has no character. Moved to spawn instead.",
                    Duration = 3
                })
            end
        else
            d:Notify({
                Title = "Error",
                Content = "Player not found!",
                Duration = 2
            })
        end
    end
})
task.spawn(function()
    while task.wait(5) do
        j:UpdateValues(P())
    end
end)
Q.TeleportTab:Button({
    Title = "Teleport to Murderer";
    Compact = true,
    Callback = function()
        local S = c("Murder")
        if S then
            if S.Character and S.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = S.Character.HumanoidRootPart.CFrame
                d:Notify({
                    Title = "Teleported";
                    Content = "Found Murderer: " .. S.Name;
                    Duration = 3
                })
            else
                d:Notify({
                    Title = "Error",
                    Content = "Murderer has no character!",
                    Duration = 3
                })
            end
        else
            d:Notify({
                Title = "Error";
                Content = "No Murderer found!";
                Duration = 3
            })
        end
    end
})
Q.TeleportTab:Button({
    Title = "Teleport to Sheriff",
    Compact = true,
    Callback = function()
        local S = c("Sheriff")
        if S then
            if S.Character and S.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = S.Character.HumanoidRootPart.CFrame
                d:Notify({
                    Title = "Teleported";
                    Content = "Found Sheriff: " .. S.Name,
                    Duration = 3
                })
            else
                d:Notify({
                    Title = "Error",
                    Content = "Sheriff has no character!",
                    Duration = 3
                })
            end
        else
            d:Notify({
                Title = "Error";
                Content = "No Sheriff found!";
                Duration = 3
            })
        end
    end
})
Q.TeleportTab:Button({
    Title = "Teleport to Random Player";
    Compact = true;
    Callback = function()
        local S = P()
        if # S > 0 then
            local H = ((game:GetService("Players")))[(S)[math.random(1, # S)]]
            if H then
                if H.Character and H.Character:FindFirstChild("HumanoidRootPart") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = H.Character.HumanoidRootPart.CFrame
                    d:Notify({
                        Title = "Teleported";
                        Content = "Teleported to: " .. H.Name;
                        Duration = 3
                    })
                else
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = f.Locations.Spawn
                    d:Notify({
                        Title = "Teleported";
                        Content = H.Name .. " has no character. Moved to spawn instead.",
                        Duration = 3
                    })
                end
            end
        else
            d:Notify({
                Title = "Error",
                Content = "No players to teleport to!",
                Duration = 3
            })
        end
    end
})
Q.TeleportTab:Button({
    Title = "Teleport to Dropped Gun",
    Compact = true,
    Callback = function(d)
        local S = game.Players.LocalPlayer.Character
        if not S then
            return
        end
        local H = S:FindFirstChild("HumanoidRootPart")
        if not H then
            return
        end
        local i, a = nil, math.huge
        for d, S in ipairs(game.Workspace:GetDescendants()) do
            if S.Name == "GunDrop" then
                local d = (H.Position - (S:GetPivot()).Position).Magnitude
                if d < a then
                    i = S
                    a = d
                end
            end
        end
        if i then
            H.CFrame = CFrame.new((i:GetPivot()).Position + Vector3.new(0, 2, 0))
        end
    end
})
Q.ESPTab:Section({
    Title = "ESP Features",
    Desc = ""
})
local O = {
    Objects = {},
    Enabled = {
        All = false;
        Innocent = false;
        Murderer = false,
        Sheriff = false,
        DroppedGun = false
    };
    Loops = {}
}
function clearESP(d)
    for S, H in pairs(O.Objects) do
        if typeof(S) == "Instance" and S:IsDescendantOf(game) then
            if S:IsA("Model") and S:FindFirstChild("Humanoid") then
                local H = game.Players:GetPlayerFromCharacter(S)
                if H then
                    local i = getPlayerRole(H)
                    if d == "All" or d == "Innocent" and i == "Innocent" or d == "Murderer" and i == "Murder" or d == "Sheriff" and i == "Sheriff" then
                        destroyESP(S)
                    end
                end
            elseif S:IsA("Tool") and d == "DroppedGun" then
                destroyESP(S)
            end
        end
    end
end
function toggleESP(d, S)
    (O.Enabled)[d] = S
    if S then
        startESPLoop(d)
    else
        clearESP(d)
    end
end
Q.ESPTab:Toggle({
    Title = "All Player ESP",
    Compact = true,
    Value = false;
    Callback = function(d)
        toggleESP("All", d)
    end
})
Q.ESPTab:Toggle({
    Title = "Innocent ESP";
    Compact = true,
    Value = false;
    Callback = function(d)
        toggleESP("Innocent", d)
    end
})
Q.ESPTab:Toggle({
    Title = "Murderer ESP",
    Compact = true,
    Value = false,
    Callback = function(d)
        toggleESP("Murderer", d)
    end
})
Q.ESPTab:Toggle({
    Title = "Sheriff ESP";
    Compact = true,
    Value = false,
    Callback = function(d)
        toggleESP("Sheriff", d)
    end
})
function startESPLoop(d)
    if (O.Loops)[d] then
        return
    end;
    (O.Loops)[d] = task.spawn(function()
        while (O.Enabled)[d] do
            if d == "DroppedGun" then
                updateGunESP()
            else
                updateAllESP()
            end
            task.wait(.5)
        end;
        (O.Loops)[d] = nil
    end)
end
function getPlayerRole(d)
    local S = d:FindFirstChild("Backpack")
    local H = d.Character
    if S and S:FindFirstChild("Knife") or H and H:FindFirstChild("Knife") then
        return "Murder"
    end
    if S and S:FindFirstChild("Gun") or H and H:FindFirstChild("Gun") then
        return "Sheriff"
    end
    return "Innocent"
end
function createESP(d, S)
    destroyESP(d)
    local H = Instance.new("Highlight")
    H.Name = "MM2ESP"
    H.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    H.FillTransparency = .4
    H.OutlineTransparency = 0
    H.Parent = d
    if S == "Murder" then
        H.FillColor = Color3.fromRGB(255, 50, 50)
        H.OutlineColor = Color3.fromRGB(200, 0, 0)
    elseif S == "Sheriff" then
        H.FillColor = Color3.fromRGB(50, 50, 255)
        H.OutlineColor = Color3.fromRGB(0, 0, 200)
    else
        H.FillColor = Color3.fromRGB(50, 255, 50)
        H.OutlineColor = Color3.fromRGB(0, 200, 0)
    end;
    (O.Objects)[d] = H
end
function destroyESP(d)
    if (O.Objects)[d] then
        (O.Objects)[d]:Destroy();
        (O.Objects)[d] = nil
    end
end
function shouldShowESP(d)
    if d == game.Players.LocalPlayer then
        return false
    end
    local S = getPlayerRole(d)
    return O.Enabled.All or O.Enabled.Innocent and S == "Innocent" or O.Enabled.Murderer and S == "Murder" or O.Enabled.Sheriff and S == "Sheriff"
end
function updatePlayerESP(d)
    if not d.Character then
        return
    end
    if shouldShowESP(d) then
        createESP(d.Character, getPlayerRole(d))
    else
        destroyESP(d.Character)
    end
end
function updateAllESP()
    for d, S in ipairs(game.Players:GetPlayers()) do
        updatePlayerESP(S)
    end
end
game.Players.PlayerAdded:Connect(function(d)
    d.CharacterAdded:Connect(function()
        task.wait(.5)
        updatePlayerESP(d)
    end)
end)
game.Players.PlayerRemoving:Connect(function(d)
    if d.Character then
        destroyESP(d.Character)
    end
end)
for d, S in ipairs(game.Players:GetPlayers()) do
    S.CharacterAdded:Connect(function()
        task.wait(.5)
        updatePlayerESP(S)
    end)
    if S.Character then
        updatePlayerESP(S)
    end
end
local x = game:GetService("Players")
local T = game:GetService("Workspace")
local W = game:GetService("RunService")
local z = x.LocalPlayer
local m = {
    HighlightColor = Color3.fromRGB(255, 215, 0);
    TextColor = Color3.fromRGB(255, 255, 255),
    TextSize = 16,
    MaxDistance = 200;
    Outline = true;
    AutoCollect = false;
    CollectDistance = 100,
    CollectDelay = .2;
    HighlightTransparency = .3,
    HighlightFill = true;
    Enabled = false
}
local dZ = {
    TrackedGuns = {},
    Connections = {};
    Enabled = false
}
local function SZ()
    for d, S in pairs(dZ.TrackedGuns) do
        if S.Highlight then
            S.Highlight:Destroy()
        end
        if S.Text then
            S.Text:Remove()
        end
    end
    dZ.TrackedGuns = {}
    for d, S in pairs(dZ.Connections) do
        S:Disconnect()
    end
    dZ.Connections = {}
end
local function HZ(d)
    if not d or not d:IsDescendantOf(T) or (dZ.TrackedGuns)[d] then
        return
    end
    local S = false
    for H, i in pairs(x:GetPlayers()) do
        local a = i.Character
        if a and (a:FindFirstChild("Humanoid") and a:FindFirstChild("HumanoidRootPart")) then
            if a:FindFirstChild("Backpack") and a.Backpack:FindFirstChild(d.Name) then
                S = true
                break
            end
        end
    end
    if S then
        return
    end
    local H = Instance.new("Highlight")
    H.Name = "GunESP_Highlight"
    H.FillColor = m.HighlightColor
    H.OutlineColor = m.HighlightColor
    H.FillTransparency = m.HighlightTransparency
    H.OutlineTransparency = 0
    H.Enabled = m.HighlightFill
    H.Adornee = d
    H.Parent = d
    local i = Drawing.new("Text")
    i.Text = "GUN"
    i.Size = m.TextSize
    i.Color = m.TextColor
    i.Outline = m.Outline
    i.Center = true
    i.Visible = false;
    (dZ.TrackedGuns)[d] = {
        Highlight = H,
        Text = i
    }
    local a = W.RenderStepped:Connect(function()
        if not d or not d:IsDescendantOf(T) then
            if (dZ.TrackedGuns)[d] then
                if (dZ.TrackedGuns)[d].Highlight then
                    (dZ.TrackedGuns)[d].Highlight:Destroy()
                end
                if (dZ.TrackedGuns)[d].Text then
                    (dZ.TrackedGuns)[d].Text:Remove()
                end;
                (dZ.TrackedGuns)[d] = nil
            end
            return
        end
        local S = z.Character
        local a = S and S:FindFirstChild("HumanoidRootPart")
        if not a then
            return
        end
        local p = (d:GetPivot()).Position
        local X = (a.Position - p).Magnitude
        H.Enabled = X <= m.MaxDistance
        if X <= m.MaxDistance then
            local S, H = T.CurrentCamera:WorldToViewportPoint(p)
            if H then
                i.Visible = dZ.Enabled
                i.Position = Vector2.new(S.X, S.Y)
                i.Text = string.format("GUN (%d studs)", math.floor(X))
                if m.AutoCollect and X <= m.CollectDistance then
                    task.delay(m.CollectDelay, function()
                        if d and (d:IsDescendantOf(T) and a) then
                            if (z:FindFirstChildOfClass("Backpack")):FindFirstChild("Gun") then
                                return
                            end
                            a.CFrame = CFrame.new(p + Vector3.new(0, 3, 0))
                        end
                    end)
                end
            else
                i.Visible = false
            end
        else
            i.Visible = false
        end
    end)
    table.insert(dZ.Connections, a)
end
local function iZ()
    SZ()
    for d, S in ipairs(T:GetDescendants()) do
        if (S.Name == "GunDrop" or S:IsA("Tool") and (S.Name:lower()):find("gun")) and not S.Parent:FindFirstChild("Humanoid") then
            HZ(S)
        end
    end
    dZ.Connections.DescendantAdded = T.DescendantAdded:Connect(function(d)
        if (d.Name == "GunDrop" or d:IsA("Tool") and (d.Name:lower()):find("gun")) and not d.Parent:FindFirstChild("Humanoid") then
            HZ(d)
        end
    end)
    dZ.Connections.CharacterRemoving = z.CharacterRemoving:Connect(SZ)
end
z.CharacterAdded:Connect(function()
    task.wait(1)
    if dZ.Enabled then
        iZ()
    end
end)
Q.ESPTab:Toggle({
    Title = "Gun ESP",
    Compact = true;
    Value = false,
    Callback = function(d)
        dZ.Enabled = d
        if d then
            iZ()
        else
            SZ()
        end
    end
})
Q.TrollingTab:Section({
    Title = "Flinging";
    Desc = ""
})
local aZ = game:GetService("Players")
local pZ = game:GetService("RunService")
local XZ = aZ.LocalPlayer
local QZ = false
local nZ = nil
local kZ = nil
local LZ = nil
local qZ = workspace.FallenPartsDestroyHeight
local vZ = "Orbit"
local function IZ(d)
    for S, H in ipairs(aZ:GetPlayers()) do
        if H ~= XZ and H.Character then
            if d == "Murder" then
                local d = H.Character:FindFirstChild("Knife") or H.Backpack:FindFirstChild("Knife")
                if d then
                    return H
                end
            elseif d == "Sheriff" then
                local d = H.Character:FindFirstChild("Gun") or H.Backpack:FindFirstChild("Gun")
                if d then
                    return H
                end
            end
        end
    end
    return nil
end
local function wZ()
    local d = {}
    for S, H in ipairs(aZ:GetPlayers()) do
        if H ~= XZ then
            table.insert(d, H.Name)
        end
    end
    return d
end
local function MZ()
    local d = {}
    for S, H in ipairs(aZ:GetPlayers()) do
        if H ~= XZ then
            table.insert(d, H)
        end
    end
    if # d > 0 then
        return (d)[math.random(1, # d)]
    end
    return nil
end
local function UZ(d, S, H)
    (game:GetService("StarterGui")):SetCore("SendNotification", {
        Title = d,
        Text = S,
        Duration = H
    })
end
local function CZ()
    if XZ.Character then
        XZ.Character:BreakJoints()
    end
end
local function FZ(d)
    if not d then
        return
    end
    kZ = d
    local S = XZ.Character
    local H = S and S:FindFirstChildOfClass("Humanoid")
    local i = H and H.RootPart
    local a = d.Character
    local p = a and a:FindFirstChildOfClass("Humanoid")
    local X = p and p.RootPart
    if not (S and (H and i)) then
        return UZ("Error", "Character not found", 5)
    end
    if i.Velocity.Magnitude < 50 then
        LZ = i.CFrame
    end
    if p and p.Sit then
        return UZ("Error", "Target is sitting", 5)
    end
    QZ = true
    workspace.FallenPartsDestroyHeight = 0 / 0
    for d, S in pairs(i:GetChildren()) do
        if S:IsA("BodyVelocity") or S:IsA("BodyAngularVelocity") then
            S:Destroy()
        end
    end
    local Q = Instance.new("BodyVelocity")
    Q.Name = "EpixVel"
    Q.Parent = i
    Q.Velocity = Vector3.new(900000000.0, 900000000.0, 900000000.0)
    Q.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
    local n = Instance.new("BodyAngularVelocity")
    n.Name = "EpixSpin"
    n.Parent = i
    n.AngularVelocity = Vector3.new(0, 0, 0)
    n.MaxTorque = Vector3.new(1 / 0, 1 / 0, 1 / 0)
    H:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    nZ = pZ.Heartbeat:Connect(function()
        if not QZ or not d.Character then
            stopFling()
            return
        end
        X = d.Character:FindFirstChild("HumanoidRootPart")
        if not X then
            return
        end
        local S = tick() * 10
        local H = Vector3.new(math.random(- 2, 2), math.random(- 1, 1), math.random(- 2, 2))
        if vZ == "Orbit" then
            i.CFrame = (CFrame.new(X.Position) * CFrame.new(0, 1.5, 0)) * CFrame.Angles(math.rad(S), 0, 0)
            n.AngularVelocity = Vector3.new(0, 50, 0)
        elseif vZ == "Chaos" then
            i.CFrame = CFrame.new(X.Position + H) * CFrame.Angles(math.rad(S), math.rad(S), math.rad(S))
            n.AngularVelocity = Vector3.new(math.random(- 100, 100), math.random(- 100, 100), math.random(- 100, 100))
        elseif vZ == "Tornado" then
            i.CFrame = (CFrame.new(X.Position) * CFrame.new(math.sin(S) * 3, S % 5, math.cos(S) * 3)) * CFrame.Angles(math.rad(S * 2), 0, math.rad(S))
            n.AngularVelocity = Vector3.new(0, 100, 0)
        elseif vZ == "LegHug" then
            i.CFrame = CFrame.new(X.Position - Vector3.new(0, 3, 0)) * CFrame.Angles(0, math.rad(S), 0)
            n.AngularVelocity = Vector3.new(0, 100, 0)
        end
        i.Velocity = Vector3.new(90000.0, 90000.0, 90000.0)
        i.RotVelocity = Vector3.new(math.random(- 90000.0, 90000.0), math.random(- 90000.0, 90000.0), math.random(- 90000.0, 90000.0))
    end)
end
local function ZZ()
    QZ = false
    if nZ then
        nZ:Disconnect()
        nZ = nil
    end
    local d = XZ.Character
    if d then
        local S = d:FindFirstChild("HumanoidRootPart")
        if S then
            for d, S in pairs(S:GetChildren()) do
                if S.Name == "EpixVel" or S.Name == "EpixSpin" then
                    S:Destroy()
                end
            end
        end
    end
    workspace.FallenPartsDestroyHeight = qZ
    kZ = nil
    CZ()
end
Q.TrollingTab:Dropdown({
    Title = "Fling Style";
    Values = {
        "Orbit",
        "Chaos";
        "Tornado",
        "LegHug"
    };
    Value = vZ;
    Compact = true,
    Callback = function(d)
        vZ = d
    end
})
Q.TrollingTab:Dropdown({
    Title = "Fling specific player",
    Values = wZ(),
    Value = "Select a Player";
    Compact = true,
    Callback = function(d)
        if d and d ~= "Select a Player" then
            local S = aZ:FindFirstChild(d)
            if S then
                FZ(S)
            end
        end
    end
})
Q.TrollingTab:Button({
    Title = "Stop Fling (Respawn You)";
    Callback = ZZ
})
Q.TrollingTab:Button({
    Title = "Fling Murder",
    Callback = function()
        local d = IZ("Murder")
        if d then
            FZ(d)
            UZ("Success", "Flinging the Murderer!", 3)
        else
            UZ("Info", "Murderer not found", 3)
        end
    end
})
Q.TrollingTab:Button({
    Title = "Fling Sheriff",
    Callback = function()
        local d = IZ("Sheriff")
        if d then
            FZ(d)
            UZ("Success", "Flinging the Sheriff!", 3)
        else
            UZ("Info", "Sheriff not found", 3)
        end
    end
})
Q.TrollingTab:Button({
    Title = "Fling Random Player",
    Callback = function()
        local d = MZ()
        if d then
            FZ(d)
            UZ("Success", "Flinging random player!", 3)
        else
            UZ("Info", "No other players found", 3)
        end
    end
})
aZ.PlayerAdded:Connect(function()
    Q.TrollingTab:UpdateDropdown("Fling specific player", {
        Values = wZ()
    })
end)
aZ.PlayerRemoving:Connect(function()
    Q.TrollingTab:UpdateDropdown("Fling specific player", {
        Values = wZ()
    })
end)
XZ.CharacterAdded:Connect(function()
    ZZ()
end)
Q.TrollingTab:Section({
    Title = "More";
    Desc = ""
})
Q.TrollingTab:Button({
    Title = "Walk on Walls (must reset to stop)";
    Callback = function()
        (loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty21.lua")))()
    end
})
Q.TrollingTab:Button({
    Title = "respawn",
    Callback = function()
        local d = (game:GetService("Players")).LocalPlayer
        if d.Character then
            d.Character:BreakJoints()
        end
    end
})
Q.TrollingTab:Toggle({
    Title = "Fake dead (lays)",
    Compact = true,
    Value = false;
    Callback = function(d)
        local S = game.Players.LocalPlayer.Character
        if not S then
            return
        end
        local H = S:FindFirstChild("HumanoidRootPart")
        local i = S:FindFirstChildOfClass("Humanoid")
        if d then
            if H and i then
                local d = i:FindFirstChild("Animator")
                if d then
                    d:Destroy()
                end
                i:ChangeState(Enum.HumanoidStateType.Physics)
                H.Anchored = true
                H.CFrame = H.CFrame * CFrame.Angles(math.rad(90), 0, 0)
                H.CFrame = H.CFrame + Vector3.new(0, - 2.5, 0)
            end
        else
            if H and i then
                H.Anchored = false
                i:ChangeState(Enum.HumanoidStateType.GettingUp)
                if not i:FindFirstChild("Animator") then
                    local d = Instance.new("Animator")
                    d.Parent = i
                end
            end
        end
    end
})
local rZ = game:GetService("Players")
local oZ = game:GetService("Workspace")
local eZ = game:GetService("RunService")
local GZ = game:GetService("UserInputService")
local JZ = rZ.LocalPlayer
local gZ = {
    HighlightColor = Color3.fromRGB(255, 215, 0);
    TextColor = Color3.fromRGB(255, 255, 255),
    TextSize = 16,
    MaxDistance = 2000;
    Outline = true;
    AutoCollect = false;
    CollectDistance = 1000;
    CollectDelay = 0;
    HighlightTransparency = .3,
    HighlightFill = true;
    Enabled = false;
    ReturnDelay = .5,
    Cooldown = .1,
    TeleportHeight = 3;
    CheckInterval = .1
}
local VZ = {
    TrackedGuns = {},
    Connections = {};
    Enabled = false;
    OriginalCFrame = nil,
    LastCollectionTime = 0,
    IsCollecting = false;
    Active = false
}
local function sZ()
    for d, S in pairs(VZ.TrackedGuns) do
        if S.Highlight then
            S.Highlight:Destroy()
        end
        if S.Text then
            S.Text:Remove()
        end
    end
    VZ.TrackedGuns = {}
    for d, S in pairs(VZ.Connections) do
        S:Disconnect()
    end
    VZ.Connections = {}
end
local function yZ()
    local d = JZ:FindFirstChildOfClass("Backpack")
    local S = JZ.Character
    if d then
        for d, S in ipairs(d:GetChildren()) do
            if S:IsA("Tool") and ((S.Name:lower()):find("gun") or S:FindFirstChild("GunScript")) then
                return true
            end
        end
    end
    if S then
        for d, S in ipairs(S:GetChildren()) do
            if S:IsA("Tool") and ((S.Name:lower()):find("gun") or S:FindFirstChild("GunScript")) then
                return true
            end
        end
    end
    return false
end
local function AZ(d, S)
    if VZ.IsCollecting or yZ() then
        return
    end
    VZ.IsCollecting = true
    VZ.OriginalCFrame = S.CFrame
    local H = S.Anchored
    local i = (d:GetPivot()).Position
    S.Anchored = true
    S.CFrame = CFrame.new(i + Vector3.new(0, gZ.TeleportHeight, 0))
    S.Anchored = false
    local a = tick()
    while tick() - a < gZ.ReturnDelay and (d and d:IsDescendantOf(oZ)) do
        task.wait()
    end
    if VZ.OriginalCFrame and S then
        S.Anchored = true
        S.CFrame = VZ.OriginalCFrame
        S.Anchored = H
    end
    VZ.IsCollecting = false
    VZ.LastCollectionTime = tick()
end
local function tZ(d)
    if not d or not d:IsDescendantOf(oZ) or (VZ.TrackedGuns)[d] then
        return
    end
    local S = false
    for H, i in pairs(rZ:GetPlayers()) do
        local a = i.Character
        if a and a:FindFirstChild("Humanoid") then
            if a:FindFirstChild("Backpack") and a.Backpack:FindFirstChild(d.Name) or a:FindFirstChild(d.Name) then
                S = true
                break
            end
        end
    end
    if S then
        return
    end
    local H = Instance.new("Highlight")
    H.Name = "GunESP_Highlight"
    H.FillColor = gZ.HighlightColor
    H.OutlineColor = gZ.HighlightColor
    H.FillTransparency = gZ.HighlightTransparency
    H.OutlineTransparency = 0
    H.Enabled = gZ.HighlightFill
    H.Adornee = d
    H.Parent = d
    local i = Drawing.new("Text")
    i.Text = "GUN"
    i.Size = gZ.TextSize
    i.Color = gZ.TextColor
    i.Outline = gZ.Outline
    i.Center = true
    i.Visible = false;
    (VZ.TrackedGuns)[d] = {
        Highlight = H;
        Text = i;
        LastCheck = 0
    }
end
local function bZ()
    if not VZ.Enabled then
        return
    end
    local d = tick()
    local S = JZ.Character
    local H = S and S:FindFirstChild("HumanoidRootPart")
    if not H then
        return
    end
    for S, i in pairs(VZ.TrackedGuns) do
        local a = false
        repeat
            if not S or not S:IsDescendantOf(oZ) then
                if i.Highlight then
                    i.Highlight:Destroy()
                end
                if i.Text then
                    i.Text:Remove()
                end;
                (VZ.TrackedGuns)[S] = nil
                a = true
                break
            end
            if d - i.LastCheck < gZ.CheckInterval then
                a = true
                break
            end
            i.LastCheck = d
            local p = (S:GetPivot()).Position
            local X = (H.Position - p).Magnitude
            if i.Highlight then
                i.Highlight.Enabled = X <= gZ.MaxDistance
            end
            if i.Text then
                local a, Q = oZ.CurrentCamera:WorldToViewportPoint(p)
                if Q and X <= gZ.MaxDistance then
                    i.Text.Visible = true
                    i.Text.Position = Vector2.new(a.X, a.Y)
                    i.Text.Text = string.format("GUN (%d studs)", math.floor(X))
                    if gZ.AutoCollect and X <= gZ.CollectDistance then
                        if d - VZ.LastCollectionTime > gZ.Cooldown and (not VZ.IsCollecting and not yZ()) then
                            task.spawn(AZ, S, H)
                        end
                    end
                else
                    i.Text.Visible = false
                end
            end
            a = true
        until true
        if not a then
            break
        end
    end
end
local function NZ()
    for d, S in ipairs(oZ:GetDescendants()) do
        if S.Name == "GunDrop" or (S:IsA("Tool") and ((S.Name:lower()):find("gun") or S:FindFirstChild("GunScript"))) and not S.Parent:FindFirstChild("Humanoid") then
            tZ(S)
        end
    end
end
local function RZ()
    sZ()
    NZ()
    VZ.Connections.DescendantAdded = oZ.DescendantAdded:Connect(function(d)
        if d.Name == "GunDrop" or (d:IsA("Tool") and ((d.Name:lower()):find("gun") or d:FindFirstChild("GunScript"))) and not d.Parent:FindFirstChild("Humanoid") then
            tZ(d)
        end
    end)
    VZ.Connections.CharacterRemoving = JZ.CharacterRemoving:Connect(sZ)
    VZ.Connections.Heartbeat = eZ.Heartbeat:Connect(function()
        if VZ.Enabled then
            bZ()
        end
    end)
    VZ.Active = true
end
JZ.CharacterAdded:Connect(function()
    task.wait(1)
    if VZ.Enabled then
        RZ()
    end
end)
Q.ESPTab:Section({
    Title = "Boxes and tracers ESP";
    Desc = ""
})
local KZ = game:GetService("Players")
local DZ = game:GetService("RunService")
local YZ = game:GetService("CoreGui")
local EZ = KZ.LocalPlayer
local hZ = {}
hZ.Objects = {}
hZ.Enabled = false
local function BZ(d)
    if d:FindFirstChild("Backpack") then
        for d, S in ipairs(d.Backpack:GetChildren()) do
            if S.Name == "Knife" then
                return "Murderer"
            elseif S.Name == "Gun" then
                return "Sheriff"
            end
        end
    end
    if d.Character then
        for d, S in ipairs(d.Character:GetChildren()) do
            if S.Name == "Knife" then
                return "Murderer"
            elseif S.Name == "Gun" then
                return "Sheriff"
            end
        end
    end
    return "Innocent"
end
local function uZ(d)
    if d == "Murderer" then
        return Color3.fromRGB(255, 0, 0)
    elseif d == "Sheriff" then
        return Color3.fromRGB(0, 0, 255)
    elseif d == "Innocent" then
        return Color3.fromRGB(0, 255, 0)
    else
        return Color3.fromRGB(128, 128, 128)
    end
end
function hZ.Add(S, d)
    if d.Character and not (hZ.Objects)[d] then
        local S = Instance.new("Highlight")
        S.Name = "MM2ESP"
        S.FillTransparency = 1
        S.OutlineTransparency = 0
        S.Adornee = d.Character
        S.Parent = YZ;
        (hZ.Objects)[d] = {
            Highlight = S
        }
    end
end
function hZ.Remove(S, d)
    if (hZ.Objects)[d] then
        (hZ.Objects)[d].Highlight:Destroy();
        (hZ.Objects)[d] = nil
    end
end
function hZ.Update(d)
    for d, S in pairs(hZ.Objects) do
        if d and (d.Character and S.Highlight) then
            local H = BZ(d)
            S.Highlight.OutlineColor = uZ(H)
            S.Highlight.Adornee = d.Character
        else
            hZ:Remove(d)
        end
    end
end
KZ.PlayerAdded:Connect(function(d)
    d.CharacterAdded:Connect(function()
        task.wait(1)
        if hZ.Enabled then
            hZ:Add(d)
        end
    end)
end)
KZ.PlayerRemoving:Connect(function(d)
    hZ:Remove(d)
end)
DZ.Heartbeat:Connect(function()
    if hZ.Enabled then
        hZ:Update()
    end
end)
local lZ = game:GetService("Players")
local fZ = game:GetService("RunService")
local PZ = game:GetService("CoreGui")
local cZ = workspace.CurrentCamera
local jZ = lZ.LocalPlayer
local OZ = {}
OZ.Highlights = {}
OZ.Boxes = {}
OZ.HighlightEnabled = false
OZ.BoxEnabled = false
local function xZ(d)
    if d:FindFirstChild("Backpack") then
        for d, S in ipairs(d.Backpack:GetChildren()) do
            if S.Name == "Knife" then
                return "Murderer"
            elseif S.Name == "Gun" then
                return "Sheriff"
            end
        end
    end
    if d.Character then
        for d, S in ipairs(d.Character:GetChildren()) do
            if S.Name == "Knife" then
                return "Murderer"
            elseif S.Name == "Gun" then
                return "Sheriff"
            end
        end
    end
    return "Innocent"
end
local function TZ(d)
    if d == "Murderer" then
        return Color3.fromRGB(255, 0, 0)
    elseif d == "Sheriff" then
        return Color3.fromRGB(0, 0, 255)
    elseif d == "Innocent" then
        return Color3.fromRGB(0, 255, 0)
    else
        return Color3.fromRGB(128, 128, 128)
    end
end
function OZ.AddHighlight(S, d)
    if d.Character and not (OZ.Highlights)[d] then
        local S = Instance.new("Highlight")
        S.Name = "MM2ESP"
        S.FillTransparency = 1
        S.OutlineTransparency = 0
        S.Adornee = d.Character
        S.Parent = PZ;
        (OZ.Highlights)[d] = S
    end
end
function OZ.AddBox(S, d)
    if d.Character and not (OZ.Boxes)[d] then
        local S = Drawing.new("Square")
        S.Thickness = 2
        S.Transparency = 1
        S.Filled = false
        S.Visible = false;
        (OZ.Boxes)[d] = S
    end
end
function OZ.Remove(S, d)
    if (OZ.Highlights)[d] then
        (OZ.Highlights)[d]:Destroy();
        (OZ.Highlights)[d] = nil
    end
    if (OZ.Boxes)[d] then
        (OZ.Boxes)[d]:Remove();
        (OZ.Boxes)[d] = nil
    end
end
function OZ.Update(d)
    for d, S in ipairs(lZ:GetPlayers()) do
        if S ~= jZ and (S.Character and S.Character:FindFirstChild("HumanoidRootPart")) then
            local d = S.Character.HumanoidRootPart
            local H, i = cZ:WorldToViewportPoint(d.Position)
            local a = xZ(S)
            local p = TZ(a)
            if OZ.HighlightEnabled and (OZ.Highlights)[S] then
                (OZ.Highlights)[S].OutlineColor = p;
                (OZ.Highlights)[S].Adornee = S.Character
            end
            if OZ.BoxEnabled then
                if not (OZ.Boxes)[S] then
                    OZ:AddBox(S)
                end
                local a = (OZ.Boxes)[S]
                if i then
                    local S = d.Size
                    local i = (cZ.CFrame.Position - d.Position).Magnitude / 25
                    local X = math.clamp(50 / i, 10, 300)
                    local Q = math.clamp(80 / i, 20, 400)
                    a.Size = Vector2.new(X, Q)
                    a.Position = Vector2.new(H.X - X / 2, H.Y - Q / 2)
                    a.Color = p
                    a.Visible = true
                else
                    a.Visible = false
                end
            elseif (OZ.Boxes)[S] then
                (OZ.Boxes)[S].Visible = false
            end
        else
            OZ:Remove(S)
        end
    end
end
lZ.PlayerAdded:Connect(function(d)
    d.CharacterAdded:Connect(function()
        task.wait(1)
        if OZ.HighlightEnabled then
            OZ:AddHighlight(d)
        end
        if OZ.BoxEnabled then
            OZ:AddBox(d)
        end
    end)
end)
lZ.PlayerRemoving:Connect(function(d)
    OZ:Remove(d)
end)
fZ.RenderStepped:Connect(function()
    if OZ.HighlightEnabled or OZ.BoxEnabled then
        OZ:Update()
    end
end)
Q.ESPTab:Toggle({
    Title = "Outline ESP",
    Compact = true;
    Value = false;
    Callback = function(d)
        OZ.HighlightEnabled = d
        if d then
            for d, S in ipairs(lZ:GetPlayers()) do
                if S ~= jZ then
                    OZ:AddHighlight(S)
                end
            end
        else
            for d in pairs(OZ.Highlights) do
                OZ:Remove(d)
            end
        end
    end
})
Q.ESPTab:Toggle({
    Title = "Box ESP";
    Compact = true,
    Value = false,
    Callback = function(d)
        OZ.BoxEnabled = d
        if d then
            for d, S in ipairs(lZ:GetPlayers()) do
                if S ~= jZ then
                    OZ:AddBox(S)
                end
            end
        else
            for d in pairs(OZ.Boxes) do
                if (OZ.Boxes)[d] then
                    (OZ.Boxes)[d]:Remove();
                    (OZ.Boxes)[d] = nil
                end
            end
        end
    end
})
local WZ = game:GetService("Players")
local zZ = game:GetService("RunService")
local mZ = workspace.CurrentCamera
local dO = WZ.LocalPlayer
local SO = {}
local HO = false
local function iO(d)
    if d:FindFirstChild("Backpack") then
        for d, S in ipairs(d.Backpack:GetChildren()) do
            if S.Name == "Knife" then
                return "Murderer"
            elseif S.Name == "Gun" then
                return "Sheriff"
            end
        end
    end
    if d.Character then
        for d, S in ipairs(d.Character:GetChildren()) do
            if S.Name == "Knife" then
                return "Murderer"
            elseif S.Name == "Gun" then
                return "Sheriff"
            end
        end
    end
    return "Innocent"
end
local function aO(d)
    if d == "Murderer" then
        return Color3.fromRGB(255, 0, 0)
    elseif d == "Sheriff" then
        return Color3.fromRGB(0, 0, 255)
    elseif d == "Innocent" then
        return Color3.fromRGB(0, 255, 0)
    else
        return Color3.fromRGB(128, 128, 128)
    end
end
local function pO(d)
    if not (SO)[d] then
        local S = Drawing.new("Line")
        S.Thickness = 2
        S.Transparency = 1
        S.Visible = false;
        (SO)[d] = S
    end
end
local function XO(d)
    if (SO)[d] then
        (SO)[d]:Remove();
        (SO)[d] = nil
    end
end
zZ.RenderStepped:Connect(function()
    if not HO then
        for d, S in pairs(SO) do
            S.Visible = false
        end
        return
    end
    for d, S in ipairs(WZ:GetPlayers()) do
        if S ~= dO and (S.Character and S.Character:FindFirstChild("HumanoidRootPart")) then
            local d = S.Character.HumanoidRootPart
            local H, i = mZ:WorldToViewportPoint(d.Position)
            if not (SO)[S] then
                pO(S)
            end
            local a = (SO)[S]
            if i then
                a.From = Vector2.new(mZ.ViewportSize.X / 2, mZ.ViewportSize.Y)
                a.To = Vector2.new(H.X, H.Y)
                a.Color = aO(iO(S))
                a.Visible = true
            else
                a.Visible = false
            end
        elseif (SO)[S] then
            (SO)[S].Visible = false
        end
    end
end)
WZ.PlayerAdded:Connect(function(d)
    d.CharacterAdded:Connect(function()
        task.wait(1)
        if HO then
            pO(d)
        end
    end)
end)
WZ.PlayerRemoving:Connect(function(d)
    XO(d)
end)
Q.ESPTab:Toggle({
    Title = "Tracer ESP",
    Compact = true,
    Value = false,
    Callback = function(d)
        HO = d
        if d then
            for d, S in ipairs(WZ:GetPlayers()) do
                if S ~= dO then
                    pO(S)
                end
            end
        else
            for d, S in pairs(SO) do
                S.Visible = false
            end
        end
    end
})
local QO = game:GetService("Players")
local nO = game:GetService("RunService")
local kO = QO.LocalPlayer
local LO = {}
LO.Enabled = false
LO.Tags = {}
local function qO(d)
    if not d.Character then
        return "None"
    end
    for d, S in ipairs(d.Backpack:GetChildren()) do
        if S.Name == "Knife" then
            return "Murderer"
        elseif S.Name == "Gun" then
            return "Sheriff"
        end
    end
    for d, S in ipairs(d.Character:GetChildren()) do
        if S.Name == "Knife" then
            return "Murderer"
        elseif S.Name == "Gun" then
            return "Sheriff"
        end
    end
    return "Innocent"
end
local function vO(d)
    if d == "Murderer" then
        return Color3.fromRGB(255, 0, 0)
    elseif d == "Sheriff" then
        return Color3.fromRGB(0, 0, 255)
    elseif d == "Innocent" then
        return Color3.fromRGB(0, 255, 0)
    else
        return Color3.fromRGB(200, 200, 200)
    end
end
function LO.Create(S, d)
    if not d.Character then
        return
    end
    if (LO.Tags)[d] then
        return
    end
    local H = d.Character:FindFirstChild("Head")
    if not H then
        return
    end
    local i = Instance.new("BillboardGui")
    i.Name = "AAESP"
    i.Adornee = H
    i.Size = UDim2.new(0, 200, 0, 30)
    i.StudsOffset = Vector3.new(0, 2.5, 0)
    i.AlwaysOnTop = true
    i.Parent = H
    local a = Instance.new("TextLabel")
    a.Name = "NameLabel"
    a.Size = UDim2.new(1, 0, 1, 0)
    a.BackgroundTransparency = 1
    a.TextScaled = true
    a.Font = Enum.Font.SourceSansBold
    a.TextStrokeTransparency = .7
    a.Text = d.Name
    a.TextColor3 = Color3.new(1, 1, 1)
    a.Parent = i;
    (LO.Tags)[d] = i
end
function LO.Remove(S, d)
    if (LO.Tags)[d] then
        (LO.Tags)[d]:Destroy();
        (LO.Tags)[d] = nil
    end
end
function LO.Update(d)
    for d, S in ipairs(QO:GetPlayers()) do
        if S ~= kO and (S.Character and S.Character:FindFirstChild("Head")) then
            if not (LO.Tags)[S] then
                LO:Create(S)
            end
            local d = qO(S)
            local H = vO(d)
            local i = (LO.Tags)[S]
            if i and i:FindFirstChild("NameLabel") then
                i.NameLabel.TextColor3 = H
                i.NameLabel.Text = S.Name .. (" [" .. (d .. "]"))
            end
        else
            LO:Remove(S)
        end
    end
end
local function IO(d)
    d.CharacterAdded:Connect(function()
        task.wait(.5)
        if LO.Enabled then
            LO:Create(d)
        end
    end)
    if d.Character then
        task.wait(.5)
        if LO.Enabled then
            LO:Create(d)
        end
    end
end
QO.PlayerAdded:Connect(function(d)
    IO(d)
end)
QO.PlayerRemoving:Connect(function(d)
    LO:Remove(d)
end)
nO.RenderStepped:Connect(function()
    if LO.Enabled then
        LO:Update()
    end
end)
Q.ESPTab:Toggle({
    Title = "Name ESP";
    Compact = true;
    Value = false,
    Callback = function(d)
        LO.Enabled = d
        if d then
            for d, S in ipairs(QO:GetPlayers()) do
                if S ~= kO then
                    IO(S)
                end
            end
        else
            for d in pairs(LO.Tags) do
                LO:Remove(d)
            end
        end
    end
})
Q.MiscTab:Section({
    Title = "Misc";
    Desc = ""
})
Q.MiscTab:Button({
    Title = "Trade Helper";
    Compact = true,
    Callback = function()
        (loadstring(game:HttpGet("https://pastebin.com/raw/8LDyigix")))()
        d:Notify({
            Title = "Trade Helper",
            Content = "Script loaded!";
            Duration = 3
        })
    end
})
Q.MiscTab:Button({
    Title = "Infinite yeild";
    Compact = true;
    Callback = function()
        (loadstring(game:HttpGet("https://rawscripts.net/raw/Infinite-Yield_500")))()
        d:Notify({
            Title = "Trade Helper";
            Content = "Script loaded!",
            Duration = 3
        })
    end
})
Q.MiscTab:Button({
    Title = "Anti-Fling",
    Compact = true,
    Callback = function()
        local d = game:GetService("RunService")
        local S = game:GetService("Players")
        local H = S.LocalPlayer
        local i = true
        local a = {}
        local function p()
            for d, S in pairs(a) do
                S:Disconnect()
            end
            a = {}
        end
        local function X(S)
            if not i then
                return
            end
            local H = d.Heartbeat:Connect(function()
                if S and S.Parent then
                    S.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
                    S.Velocity = Vector3.new(0, 0, 0)
                    S.RotVelocity = Vector3.new(0, 0, 0)
                    S.CanCollide = false
                else
                    conn:Disconnect()
                end
            end)
            table.insert(a, H)
        end
        for d, S in ipairs(workspace:GetDescendants()) do
            if S:IsA("BasePart") and (S.Name == "HumanoidRootPart" and S.Parent ~= H.Character) then
                X(S)
            end
        end
        workspace.DescendantAdded:Connect(function(d)
            if d:IsA("BasePart") and (d.Name == "HumanoidRootPart" and d.Parent ~= H.Character) then
                task.wait(.5)
                X(d)
            end
        end)
        H.CharacterAdded:Connect(function(d)
            p()
            local S = d:WaitForChild("Humanoid")
            S.Died:Connect(p)
        end)
        return function()
            i = false
            p()
        end
    end
})
Q.MiscTab:Section({
    Title = "server";
    Desc = ""
})
Q.CreditsTab:Section({
    Title = "Credits",
    Desc = ""
})
Q.MainTab:Section({
    Title = "Murder",
    Desc = ""
})
local wO = game:GetService("Players")
local MO = wO.LocalPlayer
local UO = game:GetService("Workspace")
local CO = game:GetService("RunService")
local FO = {
    ThrowDelay = 0,
    EquipWaitTime = 0;
    MaxDistance = 2500;
    HoldDuration = 15;
    PredictionMultiplier = .92;
    KnifeSpeed = 140
}
local ZO = {}
local rO = false
local oO = nil
local function eO()
    local d = {
        "Spawn"
    }
    for S, H in ipairs(wO:GetPlayers()) do
        if H ~= MO then
            table.insert(d, H.Name)
        end
    end
    return d
end
local function GO()
    if MO.Character then
        local d = MO.Character:FindFirstChild("Knife")
        if d then
            return d
        end
    end
    local d = MO:FindFirstChild("Backpack")
    if d then
        local S = d:FindFirstChild("Knife")
        if S then
            local d = MO.Character:FindFirstChildOfClass("Humanoid")
            if d then
                d:EquipTool(S)
                task.wait(FO.EquipWaitTime)
                return S
            end
        end
    end
    local S = UO:FindFirstChild("Knife")
    if S then
        S.Parent = MO.Backpack
        task.wait(.2)
        local d = MO.Character:FindFirstChildOfClass("Humanoid")
        if d then
            d:EquipTool(S)
            task.wait(FO.EquipWaitTime)
            return S
        end
    end
    warn("\226\157\140 Knife not found! Are you the murderer?")
    return nil
end
local function JO(d)
    if not d or not d.Character then
        return false
    end
    local S = GO()
    if not S then
        return false
    end
    local H = d.Character:FindFirstChild("HumanoidRootPart")
    local i = MO.Character:FindFirstChild("HumanoidRootPart")
    if not H or not i then
        return false
    end
    local a = H.Position
    local p = i.Position
    local X = H.Velocity
    local Q = (a - p).Magnitude
    local n = Q / FO.KnifeSpeed
    local k = a + (X * n) * FO.PredictionMultiplier
    local L = {
        [1] = CFrame.new(p, k),
        [2] = k
    }
    local q = S:FindFirstChild("Throw")
    if q then
        q:FireServer(unpack(L))
        return true
    end
    return false
end
local function gO(d)
    if d == "Spawn" then
        return
    end
    if rO then
        Cleanup()
    end
    local S = wO:FindFirstChild(d)
    if not S then
        warn("\226\157\140 Player not found: " .. d)
        return
    end
    oO = S
    rO = true
    if not GO() then
        warn("\240\159\148\170 Knife not equipped!")
        rO = false
        return
    end
    local H = tick()
    ZO.killLoop = CO.Heartbeat:Connect(function()
        if tick() - H > FO.HoldDuration then
            warn("\226\143\176 Timeout reached")
            Cleanup()
            return
        end
        if not S.Character or S.Character.Humanoid.Health <= 0 then
            warn("\226\156\133 Target eliminated!")
            Cleanup()
            return
        end
        JO(S)
        task.wait(FO.ThrowDelay)
    end)
end
local function VO()
    rO = false
    oO = nil
    if ZO.killLoop then
        ZO.killLoop:Disconnect()
    end
end
Q.MainTab:Dropdown({
    Title = " Kill Specific Player";
    Values = eO(),
    Value = "Player";
    Compact = true,
    Callback = function(d)
        gO(d)
    end
})
wO.PlayerAdded:Connect(function()
    Q.MainTab:UpdateDropdown("\240\159\148\170 Kill Specific Player", {
        Values = eO()
    })
end)
wO.PlayerRemoving:Connect(function()
    Q.MainTab:UpdateDropdown("\240\159\148\170 Kill Specific Player", {
        Values = eO()
    })
end)
local sO = game:GetService("VirtualUser")
MO.Idled:Connect(function()
    sO:CaptureController()
    sO:ClickButton2(Vector2.new())
end)
MO.CharacterRemoving:Connect(VO)
print("")
local yO = game:GetService("Players")
local AO = yO.LocalPlayer
local tO = game:GetService("Workspace")
local bO = game:GetService("RunService")
local NO = {
    ThrowDelay = .2;
    MaxDistance = 150,
    HoldDuration = 15;
    Prediction = .88
}
local RO = {}
local KO = false
local function DO()
    if AO.Character then
        for d, S in ipairs(AO.Character:GetChildren()) do
            if S.Name == "Knife" then
                return S
            end
        end
        local d = AO:FindFirstChild("Backpack")
        if d then
            local S = d:FindFirstChild("Knife")
            if S then
                local d = AO.Character:FindFirstChildOfClass("Humanoid")
                if d then
                    d:EquipTool(S)
                    task.wait(.3)
                    return S
                end
            end
        end
    end
    local d = tO:FindFirstChild("Knife")
    if d then
        d.Parent = AO.Backpack
        task.wait(.2)
        local S = AO.Character:FindFirstChildOfClass("Humanoid")
        if S then
            S:EquipTool(d)
            task.wait(.3)
            return d
        end
    end
    return nil
end
local function YO()
    local d = {}
    for S, H in ipairs(yO:GetPlayers()) do
        if H ~= AO and H.Character then
            local S = H.Character:FindFirstChildOfClass("Humanoid")
            local i = H.Character:FindFirstChild("HumanoidRootPart")
            if S and (S.Health > 0 and i) then
                local S = (i.Position - AO.Character.HumanoidRootPart.Position).Magnitude
                if S <= NO.MaxDistance then
                    table.insert(d, H)
                end
            end
        end
    end
    if # d > 0 then
        return (d)[math.random(1, # d)]
    end
    return nil
end
local function EO(d)
    if not d or not d.Character then
        return false
    end
    local S = DO()
    if not S then
        return false
    end
    local H = d.Character.HumanoidRootPart
    local i = AO.Character.HumanoidRootPart
    if not H or not i then
        return false
    end
    local a = H.Position
    local p = i.Position
    local X = H.Velocity
    local Q = (a - p).Magnitude
    local n = Q / 120
    local k = a + (X * n) * NO.Prediction
    local L = {
        [1] = CFrame.new(p, k),
        [2] = k
    }
    local q = S:FindFirstChild("Throw")
    if q then
        q:FireServer(unpack(L))
        return true
    end
    return false
end
local function hO()
    if KO then
        return
    end
    KO = true
    if not DO() then
        warn("You need to be the murderer!")
        KO = false
        return
    end
    local d = YO()
    if not d then
        warn("No valid targets found!")
        KO = false
        return
    end
    local S = tick()
    RO.attackLoop = bO.Heartbeat:Connect(function()
        if tick() - S > NO.HoldDuration then
            warn("Attack timeout")
            VO()
            return
        end
        if not d.Character or not d.Character:FindFirstChild("HumanoidRootPart") or d.Character.Humanoid.Health <= 0 then
            VO()
            return
        end
        EO(d)
        task.wait(NO.ThrowDelay)
    end)
end
local function BO()
    KO = false
    if RO.attackLoop then
        RO.attackLoop:Disconnect()
    end
end
Q.MainTab:Button({
    Title = "Kill Random person",
    Compact = true,
    Callback = hO
})
local uO = game:GetService("VirtualUser")
AO.Idled:Connect(function()
    uO:CaptureController()
    uO:ClickButton2(Vector2.new())
end)
AO.CharacterRemoving:Connect(BO)
print("")
local lO = game:GetService("Players")
local fO = lO.LocalPlayer
local PO = game:GetService("Workspace")
local cO = game:GetService("RunService")
local jO = {
    ThrowDelay = 0;
    HoldDuration = 60,
    EquipWaitTime = .1;
    KillAuraDistance = 30;
    HitboxSize = Vector3.new(5, 5, 5)
}
local OO = {}
local xO = false
local TO = {}
local function WO()
    for d, S in ipairs(lO:GetPlayers()) do
        if S ~= fO and S.Character then
            local d = S.Character:FindFirstChild("HumanoidRootPart")
            if d then
                (TO)[S] = d.Size
                d.Size = jO.HitboxSize
            end
        end
    end
end
local function zO()
    for d, S in pairs(TO) do
        if d and d.Character then
            local H = d.Character:FindFirstChild("HumanoidRootPart")
            if H then
                H.Size = S
            end
        end
    end
    TO = {}
end
local function mO()
    if fO.Character then
        for d, S in ipairs(fO.Character:GetChildren()) do
            if S:IsA("Tool") and S.Name == "Knife" then
                return S
            end
        end
        local d = fO:FindFirstChild("Backpack")
        if d then
            local S = d:FindFirstChild("Knife")
            if S then
                return S
            end
        end
    end
    return PO:FindFirstChild("Knife")
end
local function d4()
    local d = mO()
    if not d then
        warn("No knife found!")
        return false
    end
    if fO.Character then
        local d = fO.Character:FindFirstChild("Knife")
        if d then
            return true
        end
    end
    if d.Parent ~= fO.Backpack then
        d.Parent = fO.Backpack
        task.wait(.1)
    end
    local S = fO.Character and fO.Character:FindFirstChildOfClass("Humanoid")
    if S then
        S:EquipTool(d)
        task.wait(jO.EquipWaitTime)
        return true
    end
    return false
end
local function S4(d)
    if not d.Character then
        return
    end
    local S = d.Character:FindFirstChild("HumanoidRootPart")
    if not S then
        return
    end
    if not d4() then
        return
    end
    local H = fO.Character and fO.Character:FindFirstChild("HumanoidRootPart")
    if not H then
        return
    end
    local i = H.Position
    local a = S.Position
    local p = d.Character:FindFirstChildOfClass("Humanoid")
    if p and p.MoveDirection.Magnitude > 0 then
        local d = S.Velocity
        local H = (a - i).Magnitude / 100
        a = a + (d * H) * .7
    end
    local X = {
        [1] = CFrame.new(i, a);
        [2] = a
    }
    local Q = fO.Character and fO.Character:FindFirstChild("Knife")
    if Q then
        local d = Q:FindFirstChild("Throw")
        if d then
            d:FireServer(unpack(X))
        end
    end
end
local function H4()
    if xO then
        return
    end
    xO = true
    WO()
    if not d4() then
        warn("You must be murderer!")
        StopKillAura()
        return
    end
    OO.KillAuraLoop = cO.Heartbeat:Connect(function()
        if not xO then
            return
        end
        local d = fO.Character and fO.Character:FindFirstChild("HumanoidRootPart")
        if not d then
            return
        end
        for S, H in ipairs(lO:GetPlayers()) do
            if H ~= fO and H.Character then
                local S = H.Character:FindFirstChild("HumanoidRootPart")
                local i = H.Character:FindFirstChildOfClass("Humanoid")
                if S and (i and i.Health > 0) then
                    local i = (d.Position - S.Position).Magnitude
                    if i <= jO.KillAuraDistance then
                        S4(H)
                    end
                end
            end
        end
    end)
end
local function i4()
    xO = false
    if OO.KillAuraLoop then
        OO.KillAuraLoop:Disconnect()
    end
    zO()
end
function ToggleKillAura(d)
    if d then
        H4()
    else
        i4()
    end
end
fO.CharacterRemoving:Connect(function()
    i4()
end)
if Q and Q.MainTab then
    Q.MainTab:Toggle({
        Title = "Kill Aura";
        Description = "Auto throws knives at players nearby.",
        Default = false;
        Callback = function(d)
            ToggleKillAura(d)
        end
    })
    Q.MainTab:Slider({
        Title = "Kill Aura Distance (studs)",
        Description = "Set the distance to kill players.";
        Value = {
            Min = 1;
            Max = 1000,
            Default = 200
        },
        Callback = function(d)
            jO.KillAuraDistance = d
        end
    })
end
local a4 = game:GetService("Players")
local p4 = a4.LocalPlayer
local X4 = game:GetService("Workspace")
local Q4 = game:GetService("RunService")
local n4 = {
    HitboxSize = Vector3.new(20, 20, 20),
    StabDistance = 1000;
    TeleportDistance = 10;
    MagnetStrength = 50
}
local k4 = {}
local L4 = {}
local function q4()
    for d, S in ipairs(a4:GetPlayers()) do
        if S ~= p4 and S.Character then
            local d = S.Character:FindFirstChild("HumanoidRootPart")
            if d then
                (L4)[S] = d.Size
                d.Size = n4.HitboxSize
                d.Massless = true
                d.CanCollide = false
                d.Transparency = 1
            end
            for d, S in pairs(S.Character:GetChildren()) do
                if S:IsA("BasePart") then
                    S.CanCollide = false
                    S.Transparency = 1
                end
            end
        end
    end
end
local function v4()
    for d, S in pairs(L4) do
        if d and d.Character then
            local H = d.Character:FindFirstChild("HumanoidRootPart")
            if H then
                H.Size = S
                H.Massless = false
                H.CanCollide = true
                H.Transparency = 0
            end
        end
    end
    L4 = {}
    for d, S in ipairs(a4:GetPlayers()) do
        if S.Character then
            for d, S in pairs(S.Character:GetChildren()) do
                if S:IsA("BasePart") then
                    S.CanCollide = true
                    S.Transparency = 0
                end
            end
        end
    end
end
local function I4()
    if p4.Character then
        for d, S in ipairs(p4.Character:GetChildren()) do
            if S:IsA("Tool") and S.Name == "Knife" then
                return S
            end
        end
        local d = p4:FindFirstChild("Backpack")
        if d then
            return d:FindFirstChild("Knife")
        end
    end
    return nil
end
local function w4()
    local d = I4()
    if not d then
        warn("No knife found!")
        return false
    end
    if d.Parent ~= p4.Character then
        local S = p4.Character and p4.Character:FindFirstChildOfClass("Humanoid")
        if S then
            S:EquipTool(d)
            task.wait(.1)
        end
    end
    return true
end
local function M4(d)
    local S = I4()
    if S then
        local d = S:FindFirstChild("Stab")
        if d then
            d:FireServer("Down")
        end
    end
end
local function U4()
    for d, S in ipairs(a4:GetPlayers()) do
        if S ~= p4 and S.Character then
            local d = S.Character:FindFirstChild("HumanoidRootPart")
            local H = S.Character
            if d then
                local S = (p4.Character.HumanoidRootPart.Position - d.Position).unit
                d.CFrame = p4.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, n4.TeleportDistance)
                local i = H:FindFirstChildOfClass("Humanoid")
                if i then
                    i.PlatformStand = true
                    H:SetPrimaryPartCFrame(p4.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, n4.TeleportDistance))
                    H:SetAttribute("Invisible", true)
                    for d, S in pairs(H:GetChildren()) do
                        if S:IsA("BasePart") then
                            S.Transparency = 1
                            S.CanCollide = false
                        end
                    end
                    local S = math.random(0, 1) == 0 and 10 or - 10
                    d.CFrame = p4.Character.HumanoidRootPart.CFrame * CFrame.new(0, S, 0)
                end
            end
        end
    end
end
local function C4()
    q4()
    if not w4() then
        warn("No knife to stab with!")
        v4()
        return
    end
    k4.killLoop = Q4.Heartbeat:Connect(function()
        U4()
        for d, S in ipairs(a4:GetPlayers()) do
            if S ~= p4 and (S.Character and S.Character:FindFirstChild("HumanoidRootPart")) then
                local d = p4.Character and p4.Character:FindFirstChild("HumanoidRootPart")
                local H = S.Character:FindFirstChild("HumanoidRootPart")
                if d and H then
                    local i = (d.Position - H.Position).Magnitude
                    if i <= n4.StabDistance then
                        M4(S)
                    end
                end
            end
        end
    end)
end
local function F4()
    if k4.killLoop then
        k4.killLoop:Disconnect()
    end
    v4()
end
Q.MainTab:Button({
    Title = "Kill All (Teleport and Big Hitbox)";
    Description = "Expands hitboxes, teleports players to you, hides them, and automatically stabs them.",
    Callback = function()
        C4()
    end
})
p4.CharacterRemoving:Connect(F4)
Q.MainTab:Section({
    Title = "Sheriff";
    Desc = ""
})
Q.MainTab:Toggle({
    Title = "Auto Shoot Murderer",
    Compact = true,
    Callback = function(d)
        if d then
            _G.AimbotEnabled = true
            spawn(function()
                while _G.AimbotEnabled and task.wait() do
                    local d = false
                    repeat
                        if not p4.Character or not p4.Character:FindFirstChild("HumanoidRootPart") or not p4.Character:FindFirstChild("Gun") then
                            d = true
                            break
                        end
                        local S = nil
                        for d, H in pairs(a4:GetPlayers()) do
                            if H ~= p4 and H.Character then
                                local d = H.Character:FindFirstChild("Knife") or H.Backpack:FindFirstChild("Knife")
                                if d then
                                    S = H
                                    break
                                end
                            end
                        end
                        if S and (S.Character and S.Character:FindFirstChild("HumanoidRootPart")) then
                            local d = S.Character.HumanoidRootPart.Position
                            local H = S.Character.HumanoidRootPart.Velocity
                            local i = 300
                            local a = (d - p4.Character.HumanoidRootPart.Position).Magnitude
                            local p = d + H * (a / i)
                            local X = p4.Character.Gun.KnifeLocal.CreateBeam.RemoteFunction
                            if X then
                                X:InvokeServer(1, p, "AH2")
                            end
                        end
                        d = true
                    until true
                    if not d then
                        break
                    end
                end
            end)
        else
            _G.AimbotEnabled = false
        end
    end
})
local Z4 = game:GetService("Players")
local r4 = Z4.LocalPlayer
local o4 = workspace.CurrentCamera
Q.MainTab:Button({
    Title = "Shoot Murderer";
    Compact = true,
    Callback = function()
        local d = nil
        for S, H in pairs(Z4:GetPlayers()) do
            if H ~= r4 and H.Character then
                local S = H.Character:FindFirstChild("Knife") or H.Backpack:FindFirstChild("Knife")
                if S then
                    d = H
                    break
                end
            end
        end
        if d and (d.Character and d.Character:FindFirstChild("HumanoidRootPart")) then
            local S = d.Character
            local H = S.HumanoidRootPart.Position
            local i = S.HumanoidRootPart.Velocity
            local a = 300
            local p = (H - r4.Character.HumanoidRootPart.Position).Magnitude
            local X = H + i * (p / a)
            local Q, n = pcall(function()
                local d = ((((workspace:WaitForChild(r4.Name)):WaitForChild("Gun")):WaitForChild("KnifeLocal")):WaitForChild("CreateBeam")):WaitForChild("RemoteFunction")
                d:InvokeServer(1, X, "AH2")
            end)
            if not Q then
                warn("Failed to shoot murderer:", n)
            end
        else
            warn("No murderer found or murderer is invalid")
        end
    end
})
Q.MainTab:Toggle({
    Title = "Aimbot Lock (Torso)",
    Compact = true;
    Callback = function(d)
        (getgenv()).AimlockEnabled = d
        if d then
            if not (getgenv()).AimlockInitialized then
                (getgenv()).AimlockInitialized = true
                local d = game:GetService("Players")
                local S = d.LocalPlayer
                local H = game:GetService("Workspace")
                local i = game:GetService("RunService")
                local a = H.CurrentCamera
                local function p()
                    for d, H in ipairs(d:GetPlayers()) do
                        if H ~= S and H.Character then
                            local d = H.Character:FindFirstChild("Knife") or H.Backpack:FindFirstChild("Knife")
                            if d and H.Character:FindFirstChild("HumanoidRootPart") then
                                return H
                            end
                        end
                    end
                    return nil
                end
                i.RenderStepped:Connect(function()
                    if (getgenv()).AimlockEnabled then
                        local d = p()
                        if d and d.Character then
                            local S = d.Character:FindFirstChild("HumanoidRootPart")
                            if S then
                                a.CFrame = CFrame.new(a.CFrame.Position, S.Position)
                            end
                        end
                    end
                end)
                d.PlayerRemoving:Connect(function(d)
                    if d == S then
                        (getgenv()).AimlockEnabled = false;
                        (getgenv()).AimlockInitialized = false
                    end
                end)
            end
        else
            (getgenv()).AimlockEnabled = false
        end
    end
})
Q.MainTab:Section({
    Title = "Innocent";
    Desc = ""
})
Q.CreditsTab:Button({
    Title = "discord invite",
    Compact = true,
    Callback = function()
        setclipboard("https://discord.gg/u6YsArMUR3")
    end
})
local e4 = game:GetService("Players")
local G4 = game:GetService("ReplicatedStorage")
local J4 = game:GetService("TextChatService")
local g4 = false
local V4 = false
local s4 = .5
local function y4()
    local d, S
    for H, i in ipairs(e4:GetPlayers()) do
        local a = i.Backpack:FindFirstChild("Knife") or i.Character and i.Character:FindFirstChild("Knife")
        local p = i.Backpack:FindFirstChild("Gun") or i.Character and i.Character:FindFirstChild("Gun")
        if a then
            d = i.Name
        end
        if p then
            S = i.Name
        end
    end
    return d, S
end
local function A4(d)
    local S = pcall(function()
        if J4:FindFirstChild("TextChannels") and J4.TextChannels:FindFirstChild("RBXGeneral") then
            J4.TextChannels.RBXGeneral:SendAsync(d)
        else
            G4.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(d, "All")
        end
    end)
    if not S then
        warn("Failed to send message")
    end
end
local function t4()
    if not g4 or V4 then
        return
    end
    local d, S = y4()
    if d or S then
        local H = "[ Galaxy Hub on Top. ] "
        if d and S then
            H = H .. string.format(" Murderer: %s | Sheriff: %s", d, S)
        elseif d then
            H = H .. ("Murderer Found: " .. d)
        else
            H = H .. ("Sheriff Found: " .. S)
        end
        A4(H)
        V4 = true
    end
end
local function b4()
    while g4 and (not V4 and task.wait(s4)) do
        t4()
    end
end
local function N4(d)
    g4 = d
    if g4 then
        V4 = false;
        (coroutine.wrap(b4))()
    end
end
Q.MainTab:Toggle({
    Title = "Auto Role Revealer",
    Description = "Announce roles ONCE when game starts";
    Callback = N4,
    Default = false
})
Q.MainTab:Button({
    Title = "Reveal Now";
    Description = "Force one-time announcement";
    Callback = function()
        V4 = false
        t4()
    end
})
local R4 = 12
Q.MiscTab:Slider({
    Title = "Max Players";
    Description = "Find a server with less than or equal to this many players";
    Value = {
        Min = 3,
        Max = 12,
        Default = 1
    };
    Callback = function(d)
        R4 = d
    end
})
Q.MiscTab:Button({
    Title = "Join  Server",
    Compact = true,
    Callback = function()
        local d = game:GetService("TeleportService")
        local S = game:GetService("HttpService")
        local H = 142823291
        local function i()
            local d = ""
            while true do
                local i = "https://games.roblox.com/v1/games/" .. (H .. "/servers/Public?sortOrder=Asc&limit=100")
                if d ~= "" then
                    i = i .. ("&cursor=" .. d)
                end
                local a, p = pcall(function()
                    return S:JSONDecode(game:HttpGet(i))
                end)
                if a and (p and p.data) then
                    for d, S in ipairs(p.data) do
                        local H = S.playing
                        local i = S.maxPlayers
                        if H >= 1 and (H <= R4 and H < i) then
                            return S.id
                        end
                    end
                end
                if not p or not p.nextPageCursor then
                    break
                end
                d = p.nextPageCursor
            end
            return nil
        end
        local a = i()
        if a then
            d:TeleportToPlaceInstance(H, a, game.Players.LocalPlayer)
        else
            warn("No suitable server found.")
        end
    end
})
Q.MiscTab:Button({
    Title = "Server Hop";
    Compact = true;
    Callback = function()
        local d = game:GetService("TeleportService")
        local S = game:GetService("HttpService")
        local H = game:GetService("Players")
        local i = 142823291
        local function a()
            local a = ""
            while true do
                local p = "https://games.roblox.com/v1/games/" .. (i .. "/servers/Public?sortOrder=Asc&limit=100")
                if a ~= "" then
                    p = p .. ("&cursor=" .. a)
                end
                local X, Q = pcall(function()
                    return S:JSONDecode(game:HttpGet(p))
                end)
                if X and (Q and Q.data) then
                    for S, a in ipairs(Q.data) do
                        if a.playing < a.maxPlayers and a.id ~= game.JobId then
                            d:TeleportToPlaceInstance(i, a.id, H.LocalPlayer)
                            return
                        end
                    end
                end
                if not Q or not Q.nextPageCursor then
                    break
                end
                a = Q.nextPageCursor
            end
            warn("No servers available to hop.")
        end
        a()
    end
})
Q.MiscTab:Button({
    Title = "Rejoin Server";
    Compact = true;
    Callback = function()
        local d = game:GetService("TeleportService")
        local S = game:GetService("Players")
        d:TeleportToPlaceInstance(game.PlaceId, game.JobId, S.LocalPlayer)
    end
})
Q.LogsTab:Paragraph({
    Title = "Update 1";
    Desc = "Launched on 4/27/25",
    Image = "bell"
})
local K4 = game:GetService("Players")
local D4 = K4.LocalPlayer
local Y4 = game:GetService("Workspace")
local E4 = game:GetService("RunService")
local h4 = {
    CollectDistance = 1500;
    TeleportHeight = 0,
    CollectionTime = .3,
    ScanInterval = .5,
    Cooldown = .5,
    Enabled = false
}
local B4 = 0
local u4 = {}
local function l4(d)
    if not h4.Enabled or tick() - B4 < h4.Cooldown then
        return
    end
    if not d or not d:IsDescendantOf(Y4) then
        return
    end
    local S = D4.Character
    if not S then
        return
    end
    local H = S:FindFirstChild("HumanoidRootPart")
    if not H then
        return
    end
    local i = H.CFrame
    local a = H.Anchored
    H.Anchored = true
    H.CFrame = CFrame.new((d:GetPivot()).Position + Vector3.new(0, h4.TeleportHeight, 0))
    H.Anchored = false
    local p = tick() + 2
    repeat
        task.wait(.1)
    until not d:IsDescendantOf(Y4) or tick() > p
    if H and H.Parent then
        H.Anchored = true
        H.CFrame = i
        H.Anchored = a
    end
    B4 = tick()
end
local function f4()
    for d, S in pairs(u4) do
        S:Disconnect()
    end
    u4 = {}
end
local function P4()
    f4()
    u4.heartbeat = E4.Heartbeat:Connect(function()
        if not h4.Enabled or tick() - B4 < h4.Cooldown then
            return
        end
        if not D4.Character then
            return
        end
        local d = D4.Character:FindFirstChild("HumanoidRootPart")
        if not d then
            return
        end
        local S, H = nil, h4.CollectDistance
        for i, a in ipairs(Y4:GetDescendants()) do
            if a.Name == "GunDrop" then
                local i = (d.Position - (a:GetPivot()).Position).Magnitude
                if i < H then
                    S = a
                    H = i
                end
            end
        end
        if S then
            l4(S)
        end
    end)
    u4.descendantAdded = Y4.DescendantAdded:Connect(function(d)
        if h4.Enabled and d.Name == "GunDrop" then
            if D4.Character and D4.Character:FindFirstChild("HumanoidRootPart") then
                local S = (D4.Character.HumanoidRootPart.Position - (d:GetPivot()).Position).Magnitude
                if S < h4.CollectDistance then
                    task.wait(.5)
                    l4(d)
                end
            end
        end
    end)
end
Q.MainTab:Toggle({
    Title = "Auto Get Gun";
    Compact = true,
    Callback = function(d)
        h4.Enabled = d
        if d then
            P4()
        else
            f4()
        end
    end
})
task.wait(0)
d:Notify({
    Title = "Welcome To aoskdpoakdao;dk",
    Content = "GUI loaded!";
    Duration = 10,
    Icon = "check-circle"
})
