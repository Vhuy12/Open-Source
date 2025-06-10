--https://vyn.wtf
local I = game:GetService("Players")
local C = game:GetService("ReplicatedStorage")
local t = game:GetService("RunService")
local k = game:GetService("UserInputService")
local T = game:GetService("TweenService")
local w = game:GetService("VirtualUser")
local G = game:GetService("GuiService")
local V = game:GetService("VirtualInputManager")
local s = I.LocalPlayer
local U = s.Character or s.CharacterAdded:Wait()
local b = U:WaitForChild("HumanoidRootPart")
local Q = b.CFrame
local A = s:FindFirstChild("leaderstats")
local i = A and A:FindFirstChild("Sheckles")
local a = (C:WaitForChild("GameEvents")):WaitForChild("BuySeedStock")
local O = (C:WaitForChild("GameEvents")):WaitForChild("BuyGearStock")
local d = (C:WaitForChild("GameEvents")):WaitForChild("BuyEasterStock")
local L = s.PlayerGui.Seed_Shop.Frame.ScrollingFrame
local y = s.PlayerGui.Gear_Shop.Frame.ScrollingFrame
local j = I.LocalPlayer.PlayerGui.Teleport_UI.Frame.Gear
local Y = (C:WaitForChild("GameEvents")):WaitForChild("BuyEventShopStock")
local u = s.PlayerGui.EventShop_UI.Frame.ScrollingFrame
local K = false
local N = false
local B = (C:WaitForChild("GameEvents")):WaitForChild("BuyEventShopStock")
local c = s.PlayerGui.EventShop_UI.Frame.ScrollingFrame
local f = {
    "Carrot";
    "Strawberry";
    "Blueberry",
    "Orange Tulip",
    "Tomato";
    "Corn";
    "Daffodil";
    "Watermelon",
    "Pumpkin";
    "Apple",
    "Bamboo",
    "Coconut";
    "Cactus";
    "Dragon Fruit",
    "Mango";
    "Grape";
    "Mushroom";
    "Pepper",
    "Cacao",
    "Beanstalk"
}
local l = {
    "Watering Can";
    "Trowel",
    "Recall Wrench";
    "Basic Sprinkler",
    "Advanced Sprinkler",
    "Godly Sprinkler",
    "Lightning Rod";
    "Master Sprinkler",
    "Favorite Tool"
}
local P = {
    "Wet";
    "Gold",
    "Frozen",
    "Rainbow";
    "Choc";
    "Chilled";
    "Shocked",
    "Moonlit";
    "Bloodlit",
    "Celestial"
}
local e = {
    "Gold",
    "Frozen",
    "Rainbow";
    "Choc",
    "Chilled",
    "Shocked",
    "Moonlit";
    "Bloodlit",
    "Celestial"
}
local W = {
    "Apple";
    "Banana";
    "Bamboo",
    "Blueberry",
    "Candy Blossom",
    "Candy Sunflower",
    "Carrot";
    "Cactus";
    "Chocolate Carrot",
    "Chocolate Sprinkler";
    "Coconut",
    "Corn";
    "Cranberry",
    "Cucumber",
    "Cursed Fruit";
    "Daffodil",
    "Dragon Fruit";
    "Durian",
    "Easter Egg";
    "Eggplant",
    "Grape",
    "Lemon";
    "Lotus";
    "Mango",
    "Mushroom",
    "Pepper";
    "Orange Tulip",
    "Papaya";
    "Passionfruit",
    "Peach",
    "Pear",
    "Pineapple",
    "Pumpkin";
    "Raspberry",
    "Red Lollipop";
    "Soul Fruit";
    "Strawberry";
    "Tomato",
    "Venus Fly Trap",
    "Watermelon",
    "Cacao",
    "Beanstalk"
}
local h, z = {}, {}
local E = {}
local r = {}
local m = {
    "Mysterious Crate",
    "Night Egg",
    "Night Seed Pack",
    "Blood Banana",
    "Moon Melon";
    "Star Caller";
    "Blood Hedgehog",
    "Blood Kiwi",
    "Blood Owl"
}
local R, q, x = {}, {}, {}
j.Active = true
j.Visible = true
j.ImageColor3 = Color3.fromRGB(255, 255, 255)
local F = false
local Z
local function S()
    E = {}
    r = {}
    for I, C in pairs((workspace:FindFirstChild("Farm")):GetChildren()) do
        local t = C:FindFirstChild("Important") and C.Important:FindFirstChild("Data")
        if t and (t:FindFirstChild("Owner") and t.Owner.Value == s.Name) then
            table.insert(E, C)
            local I = C.Important:FindFirstChild("Plants_Physical")
            if I then
                for I, C in pairs(I:GetChildren()) do
                    for I, C in pairs(C:GetDescendants()) do
                        if C:IsA("BasePart") and C:FindFirstChildOfClass("ProximityPrompt") then
                            table.insert(r, C)
                            break
                        end
                    end
                end
            end
        end
    end
end
local function M(I)
    if not I then
        return 0
    end
    I = ((((tostring(I)):gsub("\195\131\226\128\154\195\130\194\162", "")):gsub(",", "")):gsub(" ", "")):gsub("%$", "")
    local C = 1
    if (I:lower()):find("k") then
        C = 1000
        I = (I:lower()):gsub("k", "")
    elseif (I:lower()):find("m") then
        C = 1000000
        I = (I:lower()):gsub("m", "")
    end
    return (tonumber(I) or 0) * C
end
local function X()
    return M(i and i.Value or 0)
end
local function v()
    return # s.Backpack:GetChildren() >= 200
end
local n = false
local g
local function H()
    E = {}
    r = {}
    for I, C in pairs((workspace:FindFirstChild("Farm")):GetChildren()) do
        local t = C:FindFirstChild("Important") and C.Important:FindFirstChild("Data")
        if t and (t:FindFirstChild("Owner") and t.Owner.Value == s.Name) then
            table.insert(E, C)
            local I = C.Important:FindFirstChild("Plants_Physical")
            if I then
                for I, C in pairs(I:GetChildren()) do
                    for I, C in pairs(C:GetDescendants()) do
                        if C:IsA("BasePart") and C:FindFirstChildOfClass("ProximityPrompt") then
                            table.insert(r, C)
                            break
                        end
                    end
                end
            end
        end
    end
end
local function p()
    return M(i and i.Value or 0)
end
local J = nil
local o = false
local function D(I, C)
    while o do
        task.wait()
        I.CFrame = CFrame.new(C)
    end
    if task.wait(J) then
        o = false
    end
end
local function IR(I)
    if not s.Character then
        return
    end
    local C = s.Character:FindFirstChild("HumanoidRootPart")
    if not C then
        return
    end
    o = true
    task.wait(.1)
    D(C, I + Vector3.new(0, - 2, 0))
end
local function CR()
    return # s.Backpack:GetChildren() >= 200
end
local function tR()
    if g then
        task.cancel(g)
    end
    g = task.spawn(function()
        while n do
            while CR() do
                if not n then
                    return
                end
                task.wait(1)
            end
            if not n then
                return
            end
            H()
            for I, C in pairs(r) do
                if not n then
                    return
                end
                if CR() then
                    break
                end
                if C and C.Parent then
                    local I = C:FindFirstChildOfClass("ProximityPrompt")
                    if I then
                        IR(C.Position)
                        task.wait(.2)
                        for I, C in pairs(E) do
                            if not n or CR() then
                                break
                            end
                            for I, C in pairs(C:GetDescendants()) do
                                if C:IsA("ProximityPrompt") then
                                    local I = tostring(C.Parent)
                                    if not (I:find("Grow_Sign") or I:find("Core_Part")) then
                                        fireproximityprompt(C, 1)
                                    end
                                end
                            end
                        end
                        if not n then
                            return
                        end
                        task.wait(.2)
                    end
                end
            end
            if n then
                task.wait(.1)
            end
        end
    end)
end
local kR = false
local TR
local wR = 1e-008
local GR = 50
local function VR(I)
    local C = I.Parent
    if not C then
        return false
    end
    local t = C.Name:lower()
    return not (t:find("sign") or t:find("core"))
end
local function sR()
    local I = {}
    local C = s.Character and s.Character:FindFirstChild("HumanoidRootPart")
    if not C then
        return I
    end
    for t, k in pairs(workspace.Farm:GetChildren()) do
        local T = k:FindFirstChild("Important") and k.Important:FindFirstChild("Data")
        if T and (T:FindFirstChild("Owner") and T.Owner.Value == s.Name) then
            for t, k in pairs(k:GetDescendants()) do
                if k:IsA("ProximityPrompt") and VR(k) then
                    local t = k.Parent
                    if t:IsA("BasePart") then
                        local T = (C.Position - t.Position).Magnitude
                        if T <= GR then
                            table.insert(I, k)
                        end
                    end
                end
            end
        end
    end
    return I
end
local function UR()
    if TR then
        task.cancel(TR)
    end
    TR = task.spawn(function()
        while kR do
            local I = false
            repeat
                if CR() then
                    task.wait(1)
                    I = true
                    break
                end
                local C = sR()
                for I, C in pairs(C) do
                    if not kR then
                        return
                    end
                    if CR() then
                        break
                    end
                    fireproximityprompt(C, 1)
                    task.wait(wR)
                end
                task.wait(.1)
                I = true
            until true
            if not I then
                break
            end
        end
    end)
end
local bR = false
local QR
local function AR()
    local I = workspace.NPCS:FindFirstChild("Steven")
    if not I then
        return false
    end
    local t = s.Character
    if not t then
        return false
    end
    local k = t:FindFirstChild("HumanoidRootPart")
    if not k then
        return false
    end
    local T = k.CFrame
    k.CFrame = I.HumanoidRootPart.CFrame * CFrame.new(0, 3, 3)
    task.wait(.5)
    for I = 1, 5, 1 do
        pcall(function()
            C.GameEvents.Sell_Inventory:FireServer()
        end)
        task.wait(.15)
    end
    k.CFrame = T
    return true
end
local iR = false
local aR = nil
local function OR()
    local I = workspace:FindFirstChild("Farm")
    if not I then
        return nil
    end
    for I, C in ipairs(I:GetChildren()) do
        local t = C:FindFirstChild("Important") and C.Important:FindFirstChild("Data")
        local k = t and t:FindFirstChild("Owner")
        if k and k.Value == s.Name then
            return C
        end
    end
    return nil
end
local function dR(I)
    local C = I:FindFirstChild("ProximityPrompt")
    return C and C.Enabled
end
local function LR()
    if not iR then
        return
    end
    if CR() then
        return
    end
    local I = OR()
    if not I then
        return
    end
    local C = I:FindFirstChild("Important") and I.Important:FindFirstChild("Plants_Physical")
    if not C then
        return
    end
    for I, C in ipairs(C:GetChildren()) do
        if not iR then
            break
        end
        local t = C:FindFirstChild("Fruits")
        if t then
            for I, C in ipairs(t:GetChildren()) do
                if not iR then
                    break
                end
                for I, C in ipairs(C:GetChildren()) do
                    if not iR then
                        break
                    end
                    if C:IsA("BasePart") and dR(C) then
                        local I = C.ProximityPrompt
                        local t = C.Position + Vector3.new(0, 3, 0)
                        if s.Character and s.Character.PrimaryPart then
                            s.Character:SetPrimaryPartCFrame(CFrame.new(t))
                            task.wait(.1)
                            if not iR then
                                break
                            end
                            I:InputHoldBegin()
                            task.wait(.1)
                            if not iR then
                                break
                            end
                            I:InputHoldEnd()
                            task.wait(.1)
                        end
                    end
                end
            end
        end
    end
end
local function yR(I)
    if aR then
        aR:Disconnect()
        aR = nil
    end
    iR = I
    if I then
        aR = t.Heartbeat:Connect(function()
            if iR then
                LR()
            else
                aR:Disconnect()
                aR = nil
            end
        end)
    end
end
local jR = false
local YR = 48
local uR, KR
local NR
local function BR(I)
    jR = I
    if jR then
        local I = s.Character
        if not I or not I:FindFirstChild("HumanoidRootPart") then
            return
        end
        local C = I:FindFirstChildOfClass("Humanoid")
        if not C then
            return
        end
        KR = Instance.new("BodyGyro")
        uR = Instance.new("BodyVelocity")
        KR.P = 9000
        KR.maxTorque = Vector3.new(8999999488, 8999999488, 8999999488)
        KR.cframe = I.HumanoidRootPart.CFrame
        KR.Parent = I.HumanoidRootPart
        uR.velocity = Vector3.new(0, 0, 0)
        uR.maxForce = Vector3.new(8999999488, 8999999488, 8999999488)
        uR.Parent = I.HumanoidRootPart
        C.PlatformStand = true
        NR = t.Heartbeat:Connect(function()
            if not jR or not I:FindFirstChild("HumanoidRootPart") then
                if NR then
                    NR:Disconnect()
                end
                return
            end
            local C = workspace.CurrentCamera.CFrame
            local t = Vector3.new()
            if k:IsKeyDown(Enum.KeyCode.W) then
                t = t + C.LookVector
            end
            if k:IsKeyDown(Enum.KeyCode.S) then
                t = t - C.LookVector
            end
            if k:IsKeyDown(Enum.KeyCode.A) then
                t = t - C.RightVector
            end
            if k:IsKeyDown(Enum.KeyCode.D) then
                t = t + C.RightVector
            end
            if t.Magnitude > 0 then
                t = t.Unit * YR
            end
            if k:IsKeyDown(Enum.KeyCode.Space) then
                t = t + Vector3.new(0, YR, 0)
            end
            if k:IsKeyDown(Enum.KeyCode.LeftShift) then
                t = t + Vector3.new(0, - YR, 0)
            end
            uR.velocity = t
            KR.cframe = C
        end)
    else
        if uR then
            uR:Destroy()
        end
        if KR then
            KR:Destroy()
        end
        local I = s.Character
        if I then
            local C = I:FindFirstChildOfClass("Humanoid")
            if C then
                C.PlatformStand = false
            end
        end
        if NR then
            NR:Disconnect()
            NR = nil
        end
    end
end
local cR = false
t.Stepped:Connect(function()
    if cR then
        for I, C in ipairs(U:GetDescendants()) do
            if C:IsA("BasePart") and C.CanCollide == true then
                C.CanCollide = false
            end
        end
    end
end)
local function fR(I)
    cR = I
end
local lR = false
k.JumpRequest:Connect(function()
    if lR and (U and U:FindFirstChildOfClass("Humanoid")) then
        (U:FindFirstChildOfClass("Humanoid")):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)
local function PR(I)
    lR = I
end
local function eR()
    local I = s.PlayerGui.Seed_Shop
    I.Enabled = not I.Enabled
end
local function WR()
    local I = s.PlayerGui.Gear_Shop
    I.Enabled = not I.Enabled
end
local function hR()
    local I = s.PlayerGui.Easter_Shop
    I.Enabled = not I.Enabled
end
local function zR()
    local I = s.PlayerGui.DailyQuests_UI
    I.Enabled = not I.Enabled
end
local function ER()
    local I = s.PlayerGui.TravellingMerchant_Shop
    I.Enabled = not I.Enabled
end
local function rR()
    fireproximityprompt(((workspace.NPCS)["Pet Stand"].EggLocations)["Common Egg"].ProximityPrompt)
end
local function mR()
    fireproximityprompt((((workspace.NPCS)["Pet Stand"].EggLocations:GetChildren()))[6].ProximityPrompt)
end
local function RR()
    fireproximityprompt((((workspace.NPCS)["Pet Stand"].EggLocations:GetChildren()))[5].ProximityPrompt)
end
local qR = (workspace:WaitForChild("NPCS")):WaitForChild("Pet Stand")
local xR = qR.Timer.SurfaceGui:WaitForChild("ResetTimeLabel")
local FR = qR:WaitForChild("EggLocations")
local ZR = (game:GetService("ReplicatedStorage")):WaitForChild("GameEvents")
local SR = false
local MR = true
local XR = game.Players.LocalPlayer
local vR = XR.Character and (XR.Character:WaitForChild("HumanoidRootPart")).CFrame or CFrame.new()
local nR = CFrame.new(- 255.12291, 2.99999976, - 1.13749218, - 0.0163238496, 1.05261321e-007, .999866784, - 5.92361182e-009, 1, - 1.0537206e-007, - 0.999866784, - 7.64290053e-009, - 0.0163238496)
local function gR(I)
    if I then
        pcall(function()
            fireproximityprompt(I)
        end)
    end
end
local function HR(I)
    pcall(function()
        (ZR:WaitForChild("BuyPetEgg")):FireServer(I)
    end)
end
local function pR()
    for I, C in ipairs(FR:GetChildren()) do
        for I, C in ipairs(C:GetDescendants()) do
            if C:IsA("ProximityPrompt") then
                C.Exclusivity = Enum.ProximityPromptExclusivity.AlwaysShow
            end
        end
    end
end
local function JR()
    if SR then
        if not MR then
            while xR.Text ~= "00:00:00" do
                task.wait(.1)
            end
            task.wait(3)
        else
            MR = false
        end
        if not XR.Character or not XR.Character:FindFirstChild("HumanoidRootPart") then
            return
        end
        XR.Character.HumanoidRootPart.CFrame = nR
        pR()
        local I = FR:FindFirstChild("Common Egg")
        if I then
            gR(I:FindFirstChild("ProximityPrompt"))
            task.wait(.3)
            HR(1)
        end
        local C = ((FR:GetChildren()))[6]
        if C then
            gR(C:FindFirstChild("ProximityPrompt"))
            task.wait(.3)
            HR(2)
        end
        local t = ((FR:GetChildren()))[5]
        if t then
            gR(t:FindFirstChild("ProximityPrompt"))
            task.wait(.3)
            HR(3)
        end
        XR.Character.HumanoidRootPart.CFrame = vR
    end
end
spawn(function()
    while true do
        task.wait(.5)
        if SR then
            JR()
        end
    end
end)
local function oR()
    local I = workspace.NPCS:FindFirstChild("Steven")
    if I then
        b.CFrame = I.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        wait(.2);
        ((C:WaitForChild("GameEvents")):WaitForChild("Sell_Inventory")):FireServer()
        local t = (workspace:WaitForChild("Farm")):GetChildren()
        for I, C in pairs(t) do
            local t = C:FindFirstChild("Important") and C.Important:FindFirstChild("Data")
            if t and (t:FindFirstChild("Owner") and t.Owner.Value == s.Name) then
                local I = C:FindFirstChild("Spawn_Point")
                if I then
                    b.CFrame = I.CFrame + Vector3.new(0, 3, 0)
                    break
                end
            end
        end
    end
end
local function DR()
    local I = workspace.NPCS:FindFirstChild("Steven")
    if I then
        b.CFrame = I.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        wait(.2);
        ((C:WaitForChild("GameEvents")):WaitForChild("Sell_Item")):FireServer()
        local t = (workspace:WaitForChild("Farm")):GetChildren()
        for I, C in pairs(t) do
            local t = C:FindFirstChild("Important") and C.Important:FindFirstChild("Data")
            if t and (t:FindFirstChild("Owner") and t.Owner.Value == s.Name) then
                local I = C:FindFirstChild("Spawn_Point")
                if I then
                    b.CFrame = I.CFrame + Vector3.new(0, 3, 0)
                    break
                end
            end
        end
    end
end
local Iz = false
local function Cz(I)
    Iz = I
    task.spawn(function()
        while Iz do
            local I = (game:GetService("Players")).LocalPlayer
            local C = I:FindFirstChild("Backpack")
            local t = I.Character or I.CharacterAdded:Wait()
            if C and t then
                for I, C in pairs(C:GetChildren()) do
                    if typeof(C) == "Instance" and (C:IsA("Tool") and string.find(C.Name, "%[Moonlit%]")) then
                        C.Parent = t
                        wait(.5)
                        for I = 1, 10, 1 do
                            (game:GetService("ReplicatedStorage")).GameEvents.NightQuestRemoteEvent:FireServer("SubmitHeldPlant")
                        end
                        wait(.5)
                    end
                end
            end
            wait(.5)
        end
    end)
end
local function tz()
    local I = s.PlayerGui.EventShop_UI
    I.Enabled = not I.Enabled
end
local kz = false
local Tz
local function wz()
    if Tz then
        task.cancel(Tz)
    end
    Tz = task.spawn(function()
        while kz do
            local I = C.GameEvents.EasterShopService
            for C = 1, 5, 1 do
                I:FireServer("PurchaseSeed", C)
                task.wait(.1)
            end
            task.wait(20)
        end
    end)
end
local Gz
local Vz = false
local function sz()
    if Gz then
        task.cancel(Gz)
    end
    Gz = task.spawn(function()
        while Vz do
            C.GameEvents.BuySeedStock:FireServer("Banana")
            task.wait(20)
        end
    end)
end
local Uz
local bz = false
local function Qz()
    if Uz then
        task.cancel(CrimsomDupe)
    end
    Uz = task.spawn(function()
        while bz do
            C.GameEvents.BuySeedStock:FireServer("Crimson Vine")
            task.wait(20)
        end
    end)
end
local Az = false
local iz = 50
local az = {}
local Oz
local dz
local function Lz(I, C)
    pcall(function()
        I.RequiresLineOfSight = not C
        I.Exclusivity = C and Enum.ProximityPromptExclusivity.AlwaysShow or Enum.ProximityPromptExclusivity.One
    end)
end
local function yz(I)
    for C, t in pairs(E) do
        if I:IsDescendantOf(t) then
            return true
        end
    end
    return false
end
local function jz(I)
    if not I:IsA("ProximityPrompt") then
        return
    end
    if not yz(I) then
        return
    end
    if not (az)[I] then
        (az)[I] = {
            originalRequiresLOS = I.RequiresLineOfSight;
            originalExclusivity = I.Exclusivity
        }
    end
    Lz(I, Az)
    I.AncestryChanged:Connect(function(C, t)
        if t == nil then
            (az)[I] = nil
        end
    end)
end
local Yz = false
local function uz(C)
    Yz = C
    local t = I.LocalPlayer.PlayerGui:FindFirstChild("ShovelPrompt")
    if t and t:FindFirstChild("ConfirmFrame") then
        t.ConfirmFrame.Visible = not C
    end
end
local function Kz(C)
    if C then
        if not _G.AntiAfkConnection then
            _G.AntiAfkConnection = I.LocalPlayer.Idled:Connect(function()
                w:CaptureController()
                w:ClickButton2(Vector2.new())
            end)
        end
    elseif _G.AntiAfkConnection then
        _G.AntiAfkConnection:Disconnect()
        _G.AntiAfkConnection = nil
    end
end
local function Nz()
    for I, C in pairs(workspace.Farm:GetChildren()) do
        local t = C:FindFirstChild("Sign")
        if t then
            local I = t:FindFirstChild("Core_Part")
            if I then
                for I, C in pairs(I:GetDescendants()) do
                    if C:IsA("ProximityPrompt") then
                        C:Destroy()
                    end
                end
            end
        end
        local k = C:FindFirstChild("Grow_Sign")
        if k then
            for I, C in pairs(k:GetDescendants()) do
                if C:IsA("ProximityPrompt") then
                    C:Destroy()
                end
            end
        end
    end
end
local Bz = (C:WaitForChild("GameEvents")):WaitForChild("Favorite_Item")
local cz = nil
local fz = false
local function lz(I)
    for C, t in ipairs(e) do
        if string.find(I, t) then
            return true
        end
    end
    return false
end
local function Pz(I)
    return I:GetAttribute("Favorite") or I:FindFirstChild("Favorite") and I.Favorite.Value
end
local function ez(I)
    if lz(I.Name) and not Pz(I) then
        Bz:FireServer(I)
        task.wait(.1)
    end
end
local function Wz()
    local I = s:FindFirstChild("Backpack") or s:WaitForChild("Backpack")
    for I, C in ipairs(I:GetChildren()) do
        ez(C)
    end
end
local function hz()
    if cz then
        cz:Disconnect()
    end
    local I = s:WaitForChild("Backpack")
    cz = I.ChildAdded:Connect(function(I)
        task.wait(.1)
        ez(I)
    end)
    Wz()
end
local zz = false
local Ez = nil
local function rz()
    C.GameEvents.SeedPackGiverEvent:FireServer("ClaimPremiumPack")
end
local function mz(I)
    zz = I
    if Ez then
        Ez:Disconnect()
        Ez = nil
    end
    if zz then
        Ez = t.Heartbeat:Connect(function()
            rz()
            task.wait()
        end)
    end
end
local Rz = false
local function qz()
    Rz = not Rz
    if Rz then
        task.spawn(function()
            local I = s.Character
            local C = s:FindFirstChild("Backpack")
            local t
            if C then
                for I, C in ipairs(C:GetChildren()) do
                    if C:IsA("Tool") and C.Name:find("Basic Seed Pack") then
                        t = C
                        break
                    end
                end
            end
            if t and I then
                t.Parent = I
            end
            while Rz do
                local I = s:FindFirstChild("PlayerGui")
                local C = I and I:FindFirstChild("RollCrate_UI")
                local t = s.Character
                local k = t and t:FindFirstChildOfClass("Tool")
                local T = k and k.Name:find("Basic Seed Pack")
                if C then
                    if C.Enabled then
                        local I = C:FindFirstChild("Frame")
                        local t = I and I:FindFirstChild("Skip")
                        if t and (t:IsA("ImageButton") and t.Visible) then
                            G.SelectedObject = t
                            V:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                            V:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                        end
                    elseif T then
                        V:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                        V:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                    end
                end
                task.wait(.1)
            end
        end)
    end
end
local function xz()
    local I = game:GetService("TeleportService")
    local C = game:GetService("HttpService")
    local t = game.PlaceId
    local k = game.JobId
    local T = {}
    local w = nil
    local function G(I)
        local k = "https://games.roblox.com/v1/games/" .. (t .. "/servers/Public?sortOrder=Asc&limit=100")
        if I then
            k = k .. ("&cursor=" .. I)
        end
        return C:JSONDecode(game:HttpGet(k))
    end
    repeat
        local I = G(w)
        for I, C in ipairs(I.data) do
            if C.playing < C.maxPlayers and C.id ~= k then
                table.insert(T, {
                    id = C.id;
                    playing = C.playing
                })
            end
        end
        w = I.nextPageCursor
    until not w or # T > 0
    if # T == 0 then
        warn("No available servers found.")
        return
    end
    table.sort(T, function(I, C)
        return I.playing < C.playing
    end)
    local V = (T)[1].id
    I:TeleportToPlaceInstance(t, V, game.Players.LocalPlayer)
end
local Fz = (C:WaitForChild("GameEvents")):WaitForChild("Plant_RE")
local Zz = false
local Sz = false
local Mz = {}
local function Xz()
    local I = s.Character or s.CharacterAdded:Wait()
    local C = I:FindFirstChild("HumanoidRootPart")
    return C and C.Position or Vector3.zero
end
local function vz()
    local I = {}
    for C, t in ipairs(s.Backpack:GetChildren()) do
        if t:IsA("Tool") then
            local C = t.Name:match("^(.-) Seed")
            if C and table.find(Mz, C) then
                (I)[# I + 1] = {
                    BaseName = C;
                    Tool = t
                }
            end
        end
    end
    return I
end
local function nz(I)
    local C = Xz()
    Fz:FireServer(C, I)
end
local function gz(I)
    if not I or not I:IsDescendantOf(s.Backpack) then
        return
    end
    pcall(function()
        s.Character.Humanoid:UnequipTools()
        task.wait(.1)
        I.Parent = s.Character
        while not s.Character:FindFirstChild(I.Name) do
            task.wait(.1)
        end
    end)
end
local function Hz()
    if Sz then
        return
    end
    Sz = true
    task.spawn(function()
        while Zz do
            local I = vz()
            for I, C in ipairs(I) do
                local t = false
                repeat
                    local I = C.Tool
                    local k = C.BaseName
                    if not table.find(Mz, k) then
                        t = true
                        break
                    end
                    if I and (I:IsA("Tool") and I:IsDescendantOf(s.Backpack)) then
                        gz(I)
                        task.wait(.5)
                        while Zz and s.Character:FindFirstChild(I.Name) do
                            if not table.find(Mz, k) then
                                break
                            end
                            nz(k)
                            task.wait(.2)
                        end
                    end
                    t = true
                until true
                if not t then
                    break
                end
            end
            task.wait(.5)
        end
        Sz = false
    end)
end
local function pz()
    local I = workspace:FindFirstChild("Farm")
    if not I then
        return
    end
    for I, C in pairs(I:GetChildren()) do
        local t = C:FindFirstChild("Important") and C.Important:FindFirstChild("Data")
        if t and (t:FindFirstChild("Owner") and t.Owner.Value ~= s.Name) then
            local I = C:FindFirstChild("Important") and C.Important:FindFirstChild("Plants_Physical")
            if I then
                for I, C in pairs(I:GetChildren()) do
                    C:Destroy()
                end
            end
        end
    end
end
local Jz = (loadstring(game:HttpGet("https://raw.githubusercontent.com/MerrySubs4t/96soul/refs/heads/main/Utilities/NongkhawKawaii-UI.luau", true)))()
local oz = {
    Genral = 101849161408766,
    Auto = 110162136250435,
    Setting = 72210587662292,
    Misc = 84034775913393;
    Items = 98574803492996,
    Shop = 74630923244478,
    Teleport = 137847566773112,
    Visual = 123257335719276;
    Combat = 112935442242481,
    Update = 86844430363710
}
local Dz = Jz:Window({
    Title = "porn Hub";
    Desc = "- Grow a Garden"
})
local IC = Dz:Add({
    Title = "Auto",
    Desc = "Automatically";
    Banner = oz.Auto
})
local CC = IC:Section({
    Title = "Auto Collect";
    Side = "l"
})
CC:CreateToggle({
    Title = "Auto Collect",
    Desc = "Automatically Collect Fruits",
    Value = false,
    Callback = function(I)
        pcall(function()
            kR = I
            if kR then
                UR()
            elseif TR then
                task.cancel(TR)
                TR = nil
            end
        end)
    end
})
CC:CreateToggle({
    Title = "Auto Collect Nearby",
    Desc = "Automatically Collect Nearby Fruits";
    Value = false,
    Callback = function(I)
        pcall(function()
            Az = I
            H()
            for I, C in pairs(E) do
                for I, C in ipairs(C:GetDescendants()) do
                    if C:IsA("ProximityPrompt") then
                        jz(C)
                    end
                end
            end
            if Az then
                Oz = task.spawn(function()
                    while Az and task.wait(.1) do
                        if not CR() then
                            local I = game.Players.LocalPlayer
                            local C = I and I.Character
                            local t = C and C:FindFirstChild("HumanoidRootPart")
                            if t then
                                for I, C in pairs(az) do
                                    if I:IsA("ProximityPrompt") and (I.Enabled and I.KeyboardKeyCode == Enum.KeyCode.E) then
                                        local C
                                        local k = I.Parent
                                        if k:IsA("BasePart") then
                                            C = k.Position
                                        elseif k:IsA("Model") and k:FindFirstChild("HumanoidRootPart") then
                                            C = k.HumanoidRootPart.Position
                                        end
                                        if C and (t.Position - C).Magnitude <= iz then
                                            pcall(function()
                                                fireproximityprompt(I, 1, true)
                                            end)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            else
                for I, C in pairs(az) do
                    if I:IsA("ProximityPrompt") then
                        pcall(function()
                            I.RequiresLineOfSight = C.originalRequiresLOS
                            I.Exclusivity = C.originalExclusivity
                        end)
                    end
                end
                if Oz then
                    task.cancel(Oz)
                    Oz = nil
                end
            end
        end)
    end
})
pcall(function()
    dz = workspace.DescendantAdded:Connect(function(I)
        if I:IsA("ProximityPrompt") and yz(I) then
            jz(I)
        end
    end)
    for I, C in pairs(E) do
        for I, C in ipairs(C:GetDescendants()) do
            if C:IsA("ProximityPrompt") then
                jz(C)
            end
        end
    end
end)
CC:CreateToggle({
    Title = "Auto Sell";
    Desc = "Automatically Sell When Inventory is full.",
    Value = false;
    Callback = function(I)
        pcall(function()
            bR = I
            if bR then
                QR = task.spawn(function()
                    while bR and task.wait(1) do
                        if CR() then
                            AR()
                        end
                    end
                end)
            elseif QR then
                task.cancel(QR)
            end
        end)
    end
})
CC:CreateToggle({
    Title = "Insta Sell";
    Desc = "Instantly Sell";
    Value = false,
    Callback = function(I)
        pcall(function()
            bR = I
            if bR then
                QR = task.spawn(function()
                    while bR and task.wait(1) do
                        if CR() then
                            AR()
                        end
                    end
                end)
            elseif QR then
                task.cancel(QR)
            end
        end)
    end
})
CC:Line()
CC:Dropdown({
    Title = "Select Mutation";
    Multi = true;
    List = P;
    Value = e;
    Callback = function(I)
        pcall(function()
            e = I
            if fz then
                Wz()
            end
        end)
    end
})
CC:CreateToggle({
    Title = "Auto Favorite",
    Desc = "Automatically Favorite Fruits with the right Mutations";
    Value = false,
    Callback = function(I)
        pcall(function()
            fz = I
            if I then
                hz()
            elseif cz then
                cz:Disconnect()
                cz = nil
            end
        end)
    end
})
local function tC()
    local I = s:FindFirstChild("Backpack") or s:WaitForChild("Backpack")
    for I, C in ipairs(I:GetChildren()) do
        local t = C:GetAttribute("Favorite") or C:FindFirstChild("Favorite") and C.Favorite.Value
        if t then
            Bz:FireServer(C)
            task.wait()
        end
    end
end
