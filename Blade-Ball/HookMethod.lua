repeat
    task.wait()
until game:IsLoaded()
local U = game:GetService("Players")
local L = game:GetService("RunService")
local R = game:GetService("UserInputService")
local P = game:GetService("Workspace")
local K = game:GetService("ReplicatedStorage")
local n = game:GetService("TweenService")
local E = game:GetService("Debris")
local Y = game:GetService("VirtualInputManager")
local O = U.LocalPlayer
local T = O.Character or O.CharacterAdded:Wait()
local m = T:FindFirstChildOfClass("Humanoid")
local t = P:FindFirstChild("Alive")
local u = false
local q = tick()
local x = R:GetLastInputType()
local J = nil
local G = nil
local S = nil
local c = {}
local f = {}
local z = {}
local r = 0
local V = {}
local Q = {
    storage = {},
    current = nil;
    track = nil
}
setfpscap(60)
local function H(U)
    return # U == 7 and (type((U)[2]) == "string" and (type((U)[3]) == "number" and (typeof((U)[4]) == "CFrame" and (type((U)[5]) == "table" and (type((U)[6]) == "table" and type((U)[7]) == "boolean")))))
end
local function W(U)
    if not (f)[U] then
        if not (z)[getmetatable(U)] then
            (z)[getmetatable(U)] = true
            local L = getrawmetatable(U)
            setreadonly(L, false)
            local R = L.__index
            L.__index = function(U, L)
                if L == "FireServer" and U:IsA("RemoteEvent") or L == "InvokeServer" and U:IsA("RemoteFunction") then
                    return function(P, ...)
                        local K = {
                            ...
                        }
                        if H(K) then
                            if not (f)[U] then
                                (f)[U] = K
                                local L = U:IsA("RemoteEvent") and "RemoteEvent" or "RemoteFunction"
                                local R = {
                                    RemoteName = U.Name,
                                    RemoteType = L,
                                    Args = K
                                }

                                print("Welcome to Vampire hub")
                                game.StarterGui:SetCore("SendNotification", {
                                    Title = "Vampire test version";
                                    Text = "It work now";
                                    Duration = 5
                                })
                            end
                        end
                        return (R(U, L))(P, unpack(K))
                    end
                end
                return R(U, L)
            end
            setreadonly(L, true)
        end
    end
end
local function X()
    for U, L in pairs(f) do
        if (z)[getmetatable(U)] then
            local L = getrawmetatable(U)
            setreadonly(L, false)
            L.__index = nil
            setreadonly(L, true)
        end
    end
    f = {}
    print("Remotes restored.")
end
for U, L in pairs(game.ReplicatedStorage:GetChildren()) do
    if L:IsA("RemoteEvent") or L:IsA("RemoteFunction") then
        W(L)
    end
end
game.ReplicatedStorage.ChildAdded:Connect(function(U)
    if U:IsA("RemoteEvent") or U:IsA("RemoteFunction") then
        W(U)
    end
end)
local function e(U, L, R)
    local P = n:Create(U, L, R)
    P:Play()
    task.wait(L.Time)
    E:AddItem(P, 0)
    P:Destroy()
end
for U, L in pairs(K.Misc.Emotes:GetChildren()) do
    if L:IsA("Animation") and L:GetAttribute("EmoteName") then
        local U = L:GetAttribute("EmoteName");
        (Q.storage)[U] = L
    end
end
local g = S
local d = {}
d.Parry_Animation = function()
    local U = K.Shared.SwordAPI.Collection.Default:FindFirstChild("GrabParry")
    local L = O.Character:GetAttribute("CurrentlyEquippedSword")
    if not L or not U then
        return
    end
    local R = K.Shared.ReplicatedInstances.Swords.GetSword:Invoke(L)
    if not R or not R.AnimationType then
        return
    end
    for L, P in pairs(K.Shared.SwordAPI.Collection:GetChildren()) do
        if P.Name == R.AnimationType then
            local L = P:FindFirstChild("GrabParry") and "GrabParry" or "Grab"
            U = (P)[L]
        end
    end
    G = O.Character.Humanoid.Animator:LoadAnimation(U)
    G:Play()
end
d.Play_Animation = function(U)
    local L = (Q.storage)[U]
    if not L then
        return false
    end
    local R = O.Character.Humanoid.Animator
    if Q.track and Q.track:IsA("AnimationTrack") then
        Q.track:Stop()
    end
    Q.track = R:LoadAnimation(L)
    if Q.track and Q.track:IsA("AnimationTrack") then
        Q.track:Play()
    end
    Q.current = U
end
d.Get_Balls = function()
    local U = {}
    for L, R in pairs(P.Balls:GetChildren()) do
        if R:GetAttribute("realBall") then
            R.CanCollide = false
            table.insert(U, R)
        end
    end
    return U
end
d.Get_Ball = function()
    for U, L in pairs(P.Balls:GetChildren()) do
        if L:GetAttribute("realBall") then
            L.CanCollide = false
            return L
        end
    end
end
d.Parry_Data = function()
    local U = {}
    local L = workspace.CurrentCamera
    if x == Enum.UserInputType.MouseButton1 or x == Enum.UserInputType.MouseButton2 or x == Enum.UserInputType.Keyboard then
        local U = R:GetMouseLocation()
        J = {
            U.X,
            U.Y
        }
    else
        J = {
            L.ViewportSize.X / 2;
            L.ViewportSize.Y / 2
        }
    end
    for R, P in pairs(workspace.Alive:GetChildren()) do
        if P:IsA("Model") and P.PrimaryPart then
            (U)[tostring(P)] = L:WorldToScreenPoint(P.PrimaryPart.Position)
        end
    end
    return {
        0,
        L.CFrame;
        U,
        J
    }
end
local h = "Remote"
local y = false
function d.Parry(U)
    local L = d.Parry_Data(U)
    if not y then
        Y:SendKeyEvent(true, Enum.KeyCode.F, false, game)
        task.wait(.1)
        Y:SendKeyEvent(false, Enum.KeyCode.F, false, game)
        y = true
    else
        for U, L in pairs(f) do
            if U:IsA("RemoteEvent") then
                U:FireServer(unpack(L))
            elseif U:IsA("RemoteFunction") then
                U:InvokeServer(unpack(L))
            end
        end
    end
    if r > 7 then
        return false
    end
    r = r + 1
    task.delay(.5, function()
        if r > 0 then
            r = r - 1
        end
    end)
end
local v = 0
local l = tick()
d.Linear_Interpolation = function(U, L, R)
    return U + (L - U) * R
end
local M = {}
local A = tick()
d.Is_Curved = function()
    local U = d.Get_Ball()
    if not U then
        return false
    end
    local L = U:FindFirstChild("zoomies")
    if not L then
        return false
    end
    local R = ((game:GetService("Stats")).Network.ServerStatsItem)["Data Ping"]:GetValue()
    local P = L.VectorVelocity
    local K = P.Unit
    local n = (O.Character.PrimaryPart.Position - U.Position).Unit
    local E = n:Dot(K)
    local Y = P.Magnitude
    local T = math.min(Y / 100, 40)
    local m = 40 * math.max(E, 0)
    local t = (K - P).Unit
    local u = n:Dot(t)
    local q = E - u
    local x = .5 - R / 1000
    local J = (O.Character.PrimaryPart.Position - U.Position).Magnitude
    local G = J / Y - R / 1000
    local S = Y > 100
    local c = ((15 - math.min(J / 1000, 15)) + m) + T
    table.insert(M, P)
    if # M > 4 then
        table.remove(M, 1)
    end
    if S and G > R / 10 then
        c = math.max(c - 15, 15)
    end
    if J < c then
        return false
    end
    if tick() - A < G / 1.5 then
        return true
    end
    if q < x then
        return true
    end
    local f = math.asin(E)
    v = d.Linear_Interpolation(v, f, .8)
    if v < .018 then
        l = tick()
    end
    if tick() - l < G / 1.5 then
        return true
    end
    if # M == 4 then
        for U = 1, 2, 1 do
            local L = (K - (M)[U].Unit).Unit
            local R = n:Dot(L)
            local P = E - R
            if P < x then
                return true
            end
        end
    end
    return E < x
end
d.Closest_Player = function()
    local U = math.huge
    Closest_Entity = nil
    for L, R in pairs(P.Alive:GetChildren()) do
        if tostring(R) ~= tostring(O) and R.PrimaryPart then
            local L = O:DistanceFromCharacter(R.PrimaryPart.Position)
            if L < U then
                U = L
                Closest_Entity = R
            end
        end
    end
    return Closest_Entity
end
d.Get_Entity_Properties = function(U)
    d.Closest_Player()
    if not Closest_Entity then
        return false
    end
    local L = Closest_Entity.PrimaryPart.Velocity
    local R = (O.Character.PrimaryPart.Position - Closest_Entity.PrimaryPart.Position).Unit
    local P = (O.Character.PrimaryPart.Position - Closest_Entity.PrimaryPart.Position).Magnitude
    return {
        Velocity = L,
        Direction = R;
        Distance = P
    }
end
d.Get_Entity_Properties = function(U)
    d.Closest_Player()
    if not Closest_Entity then
        return false
    end
    local L = Closest_Entity.PrimaryPart.Velocity
    local R = (O.Character.PrimaryPart.Position - Closest_Entity.PrimaryPart.Position).Unit
    local P = (O.Character.PrimaryPart.Position - Closest_Entity.PrimaryPart.Position).Magnitude
    return {
        Velocity = L,
        Direction = R,
        Distance = P
    }
end
d.Get_Ball_Properties = function(U)
    local L = d.Get_Ball()
    if not L then
        return false
    end
    local R = O.Character
    if not R or not R.PrimaryPart then
        return false
    end
    local P = L.AssemblyLinearVelocity
    local K = (R.PrimaryPart.Position - L.Position).Unit
    local n = (R.PrimaryPart.Position - L.Position).Magnitude
    local E = K:Dot(P.Unit)
    return {
        Velocity = P;
        Direction = K;
        Distance = n,
        Dot = E
    }
end
d.Spam_Service = function(U)
    local L = d.Get_Ball()
    if not L then
        return false
    end
    d.Closest_Player()
    local R = 0
    local P = 100
    if not U.Spam_Sensitivity then
        U.Spam_Sensitivity = 50
    end
    if not U.Ping_Based_Spam then
        U.Ping_Based_Spam = false
    end
    local K = L.AssemblyLinearVelocity
    local n = K.Magnitude
    local E = (O.Character.PrimaryPart.Position - L.Position).Unit
    local Y = E:Dot(K.Unit)
    local T = Closest_Entity.PrimaryPart.Position
    local m = O:DistanceFromCharacter(T)
    local t = U.Ping + math.min(n / 6.5, 95)
    t = t * U.Spam_Sensitivity
    if U.Ping_Based_Spam then
        t = t + U.Ping
    end
    if U.Entity_Properties.Distance > t or U.Ball_Properties.Distance > t or m > t then
        return P
    end
    local u = 5 - math.min(n / 5, 5)
    local q = math.clamp(Y, - 1, 0) * u
    P = t - q
    task.wait(R)
    return P
end
local o = false
local function a()
    return O and O.Character
end
local function b()
    local U = a()
    return U and U.PrimaryPart
end
local function s()
    local U = P:FindFirstChild("Balls")
    if U then
        for U, L in ipairs(U:GetChildren()) do
            if not L.Anchored then
                return L
            end
        end
    end
    return nil
end
local function I()
    local U = s()
    if U then
        local L = U.Velocity.Magnitude
        return math.clamp(L / 2.4 + 10, 15, 200)
    end
    return 15
end
local N = Instance.new("Part")
N.Shape = Enum.PartType.Ball
N.Anchored = true
N.CanCollide = false
N.Material = Enum.Material.ForceField
N.Transparency = .5
N.Parent = P
N.Size = Vector3.new(0, 0, 0)
local function w(U)
    o = U
    if not U then
        N.Size = Vector3.new(0, 0, 0)
    end
end
L.RenderStepped:Connect(function()
    if not o then
        return
    end
    local U = b()
    local L = s()
    if U and L then
        local L = I()
        local R = U:FindFirstChild("Highlight")
        N.Size = Vector3.new(L, L, L)
        N.CFrame = U.CFrame
        N.Color = R and Color3.fromRGB(255, 255, 255)
    else
        N.Size = Vector3.new(0, 0, 0)
    end
end)
function ManualSpam()
    if MauaulSpam then
        MauaulSpam:Destroy()
        MauaulSpam = nil
        return
    end
    MauaulSpam = Instance.new("ScreenGui")
    MauaulSpam.Name = "MauaulSpam"
    MauaulSpam.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")
    MauaulSpam.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    MauaulSpam.ResetOnSpawn = false
    local U = Instance.new("Frame")
    U.Name = "Main"
    U.Parent = MauaulSpam
    U.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    U.BorderColor3 = Color3.fromRGB(0, 0, 0)
    U.BorderSizePixel = 0
    U.Position = UDim2.new(.41414836, 0, .404336721, 0)
    U.Size = UDim2.new(.227479532, 0, .191326529, 0)
    local L = Instance.new("UICorner")
    L.Parent = U
    local R = Instance.new("Frame")
    R.Name = "IndercantorBlahblah"
    R.Parent = U
    R.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    R.BorderColor3 = Color3.fromRGB(0, 0, 0)
    R.BorderSizePixel = 0
    R.Position = UDim2.new(.0280000009, 0, .0733333305, 0)
    R.Size = UDim2.new(.0719999969, 0, .119999997, 0)
    local P = Instance.new("UICorner")
    P.CornerRadius = UDim.new(1, 0)
    P.Parent = R
    local K = Instance.new("UIAspectRatioConstraint")
    K.Parent = R
    local n = Instance.new("TextLabel")
    n.Name = "PC"
    n.Parent = U
    n.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    n.BackgroundTransparency = 1
    n.BorderColor3 = Color3.fromRGB(0, 0, 0)
    n.BorderSizePixel = 0
    n.Position = UDim2.new(.547999978, 0, .826666653, 0)
    n.Size = UDim2.new(.451999992, 0, .173333332, 0)
    n.Font = Enum.Font.Unknown
    n.Text = "PC: E to spam"
    n.TextColor3 = Color3.fromRGB(57, 57, 57)
    n.TextScaled = true
    n.TextSize = 16
    n.TextWrapped = true
    local E = Instance.new("UITextSizeConstraint")
    E.Parent = n
    E.MaxTextSize = 16
    local Y = Instance.new("UIAspectRatioConstraint")
    Y.Parent = n
    Y.AspectRatio = 4.346
    local O = Instance.new("TextButton")
    O.Name = "IndercanotTextBlah"
    O.Parent = U
    O.Active = false
    O.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    O.BackgroundTransparency = 1
    O.BorderColor3 = Color3.fromRGB(0, 0, 0)
    O.BorderSizePixel = 0
    O.Position = UDim2.new(.164000005, 0, .326666653, 0)
    O.Selectable = false
    O.Size = UDim2.new(.667999983, 0, .346666664, 0)
    O.Font = Enum.Font.GothamBold
    O.Text = "Spam"
    O.TextColor3 = Color3.fromRGB(255, 255, 255)
    O.TextScaled = true
    O.TextSize = 24
    O.TextWrapped = true
    local T = Instance.new("UIGradient")
    T.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0));
        ColorSequenceKeypoint.new(.75, Color3.fromRGB(255, 0, 4));
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    })
    T.Parent = O
    local m = Instance.new("UITextSizeConstraint")
    m.Parent = O
    m.MaxTextSize = 52
    local t = Instance.new("UIAspectRatioConstraint")
    t.Parent = O
    t.AspectRatio = 3.212
    local u = Instance.new("UIAspectRatioConstraint")
    u.Parent = U
    u.AspectRatio = 1.667
    local q
    local x = false
    local J = 15
    local G = game:GetService("RunService")
    local S = game:GetService("UserInputService")
    local function c()
        x = not x
        if q then
            q:Disconnect()
            q = nil
        end
        if x then
            q = G.PreSimulation:Connect(function()
                for U = 1, J, 1 do
                    if not x then
                        break
                    end
                    local L, R = pcall(function()
                        d.Parry()
                    end)
                    if not L then
                        warn("Error in Auto_Parry.Parry:", R)
                    end
                    task.wait()
                end
            end)
        end
    end
    local f = O
    local z = f.UIGradient
    local r = R
    local V = {
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0));
        ColorSequenceKeypoint.new(.75, Color3.fromRGB(0, 255, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    }
    local Q = {
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(.75, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    }
    local H = Q
    local W = V
    local X = false
    local e = false
    local g = 1
    local h
    local function y()
        e = true
        h = tick()
    end
    G.Heartbeat:Connect(function()
        if e then
            local U = tick() - h
            local L = math.clamp(U / g, 0, 1)
            local R = {}
            for U = 1, # H, 1 do
                local P = (H)[U].Value
                local K = (W)[U].Value;
                (R)[U] = ColorSequenceKeypoint.new((H)[U].Time, P:Lerp(K, L))
            end
            z.Color = ColorSequence.new(R)
            if L >= 1 then
                e = false
                H, W = W, H
            end
        end
    end)
    local function v()
        if not e then
            X = not X
            if X then
                W = V
                r.BackgroundColor3 = Color3.new(0, 1, 0)
                c()
            else
                W = Q
                r.BackgroundColor3 = Color3.new(1, 0, 0)
                c()
            end
            y()
        end
    end
    f.MouseButton1Click:Connect(v)
    local l
    l = S.InputBegan:Connect(function(U, L)
        if L then
            return
        end
        if U.KeyCode == Enum.KeyCode.E then
            v()
        end
    end)
    MauaulSpam.Destroying:Connect(function()
        if l then
            l:Disconnect()
        end
        if q then
            q:Disconnect()
        end
    end)
    local M = U
    local A
    local o
    local a
    local b
    local function s(U)
        local L = U.Position - a
        local R = UDim2.new(b.X.Scale, b.X.Offset + L.X, b.Y.Scale, b.Y.Offset + L.Y)
        local P = game:GetService("TweenService")
        local K = TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local n = P:Create(M, K, {
            Position = R
        })
        n:Play()
    end
    M.InputBegan:Connect(function(U)
        if U.UserInputType == Enum.UserInputType.MouseButton1 or U.UserInputType == Enum.UserInputType.Touch then
            A = true
            a = U.Position
            b = M.Position
            U.Changed:Connect(function()
                if U.UserInputState == Enum.UserInputState.End then
                    A = false
                end
            end)
        end
    end)
    M.InputChanged:Connect(function(U)
        if U.UserInputType == Enum.UserInputType.MouseMovement or U.UserInputType == Enum.UserInputType.Touch then
            o = U
        end
    end)
    S.InputChanged:Connect(function(U)
        if A and U == o then
            s(U)
        end
    end)
end
ManualSpam()
local Z = (loadstring(game:HttpGet("https://raw.githubusercontent.com/CodeE4X-dev/Library/refs/heads/main/FluentRemake.lua")))()
local C = (loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua")))()
local i = Z:CreateWindow({
    Title = "Vampire test version",
    SubTitle = "by Kurayami";
    TabWidth = 160;
    Size = UDim2.fromOffset(500, 300),
    Acrylic = false,
    Theme = "Aqua";
    MinimizeKey = Enum.KeyCode.LeftControl
})
local D = {
    Home = i:AddTab({
        Title = "Home",
        Icon = "home"
    });
    Main = i:AddTab({
        Title = "Main",
        Icon = "swords"
    })
}
i:SelectTab(1)
local B = D.Home:AddSection("Credits")
D.Home:AddParagraph({
    Title = "Join our discord",
    Content = "Join to follow the update"
})
D.Home:AddButton({
    Title = "Our Discord";
    Description = "Click this button to copy link discord",
    Callback = function()
        setclipboard("https://discord.gg/NmxEYuQU")
        Z:Notify({
            Title = "Thank you";
            Content = "Link has been copied to clipboard.";
            Duration = 3
        })
    end
})

local p = D.Main:AddToggle("AutoParry", {
    Title = "Auto parry";
    Default = true
})
local Parried = false
local lastParryTime = 0
local parryCooldown = 0.1

p:OnChanged(function(U)
    if U then
        V["Auto Parry"] = L.PreSimulation:Connect(function()
            local Ball = d.Get_Ball()
            local AllBalls = d.Get_Balls()
            if not AllBalls or #AllBalls == 0 then return end

            for _, R in pairs(AllBalls) do
                if not R then return end
                local zoom = R:FindFirstChild("zoomies")
                if not zoom then return end

                R:GetAttributeChangedSignal("target"):Once(function()
                    Parried = false
                end)

                if Parried or (tick() - lastParryTime < parryCooldown) then return end

                local target = R:GetAttribute("target")
                local character = O.Character
                if not character or not character.PrimaryPart then return end

                local distance = (character.PrimaryPart.Position - R.Position).Magnitude
                local velocity = zoom.VectorVelocity
                local speed = velocity.Magnitude
                local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 10
                local threshold = speed / 3.25 + ping

                if target == tostring(O) and distance <= threshold then
                    d.Parry()
                    Parried = true
                    lastParryTime = tick()
                end
            end
        end)
    elseif V["Auto Parry"] then
        V["Auto Parry"]:Disconnect()
        V["Auto Parry"] = nil
    end
end)

local F = D.Main:AddToggle("AutoSpam", {
    Title = "Auto Spam",
    Default = true
})
local j = nil
local UI = nil
F:OnChanged(function(U)
    if U then
        if j then
            coroutine.resume(j, "stop")
            j = nil
        end
        j = coroutine.create(function(U)
            while F.Value and U ~= "stop" do
                -- ... (giữ nguyên logic auto spam gốc của bạn)
                task.wait()
            end
        end)
        coroutine.resume(j)
    elseif j then
        coroutine.resume(j, "stop")
        j = nil
    end
end)
local lastManualParry = 0
local manualParryDelay = 0.5
local manualSpamThread = nil

local LI = D.Main:AddToggle("ManualSpam", {
    Title = "Manual Spam",
    Default = false,
    Callback = function(state)
        if state then
            if manualSpamThread then
                coroutine.close(manualSpamThread)
                manualSpamThread = nil
            end

            manualSpamThread = coroutine.create(function()
                while LI.Value do
                    local currentTime = tick()
                    if currentTime - lastManualParry >= manualParryDelay then
                        lastManualParry = currentTime
                        d.Parry()
                    end
                    task.wait(0.05)
                end
            end)

            coroutine.resume(manualSpamThread)
        else
            if manualSpamThread then
                coroutine.close(manualSpamThread)
                manualSpamThread = nil
            end
        end
    end
})