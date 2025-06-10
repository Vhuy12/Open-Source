--https://vyn.wtf
if not game:IsLoaded() then
    print("Waiting for game to load...")
    game.Loaded:Wait()
    print("Loaded Game")
end
if getthreadcontext() > 7 then
    print("Executor Supported")
else
    print("Since Many Were skids, Executor Isnt Thread 7 Which Is Required For This Script To Work Use Swift Or Volcano!")
end
local D = "https://raw.githubusercontent.com/KINGHUB01/Gui/main/"
local W = (loadstring(game:HttpGet(D .. "Gui%20Lib%20%5BLibrary%5D")))()
local F = (loadstring(game:HttpGet(D .. "Gui%20Lib%20%5BThemeManager%5D")))()
local y = (loadstring(game:HttpGet(D .. "Gui%20Lib%20%5BSaveManager%5D")))()
local p = W:CreateWindow({
    Title = "sex Ware | Made By @al | discord.gg/niggerware",
    Center = true;
    AutoShow = true;
    TabPadding = 8,
    MenuFadeTime = .2
})
local X = {
    main = p:AddTab("Main");
    inventory = p:AddTab("Inventory"),
    shop = p:AddTab("Shop"),
    misc = p:AddTab("Misc");
    event = p:AddTab("Event");
    ["ui settings"] = p:AddTab("UI Settings")
}
local x = X.main:AddLeftGroupbox("Plant Settings")
local H = X.main:AddRightGroupbox("Egg Settings")
local P = X.inventory:AddLeftGroupbox("Favorite Settings")
local o = X.shop:AddLeftGroupbox("Seed Shop Settings")
local U = X.shop:AddRightGroupbox("Gear Shop Settings")
local E = X.shop:AddLeftGroupbox("Egg Shop Settings")
local j = X.shop:AddRightGroupbox("Sell Settings")
local J = X.misc:AddLeftGroupbox("Player Settings")
local n = X.event:AddLeftGroupbox("Event Settings")
local M = (X)["ui settings"]:AddLeftGroupbox("Menu")
local R = cloneref(game:GetService("ReplicatedStorage"))
local e = cloneref(game:GetService("TeleportService"))
local Y = cloneref(game:GetService("MarketplaceService"))
local V = cloneref(game:GetService("VirtualUser"))
local L = cloneref(game:GetService("RunService"))
local t = cloneref(game:GetService("Workspace"))
local a = cloneref(game:GetService("Players"))
local d = cloneref(game:GetService("Stats"))
local h = getconnections or get_signal_cons
local k = Y:GetProductInfo(game.PlaceId)
local Z = a.LocalPlayer
if identifyexecutor() == "Swift" then
    print("Fixed Require")
    setthreadidentity(8)
end
local G = require(R.Data.PetEggData)
local w = require(R.Data.SeedData)
local g = require(R.Data.GearData)
local m = {}
local K = {}
local I = {}
local C = {}
local A = {}
local c = {}
local r = {}
local l = {}
local Q = ((t:FindFirstChild("NPCS")):FindFirstChild("Pet Stand")):FindFirstChild("EggLocations")
local B = R:FindFirstChild("Seed_Models")
local i = t:FindFirstChild("PetsPhysical")
local O = nil
for D, W in next, (t:FindFirstChild("Farm")):GetDescendants() do
    if W.Name == "Owner" and W.Value == Z.Name then
        O = W.Parent.Parent
    end
end
for D, W in next, w do
    if W.StockChance > 0 then
        table.insert(c, D)
    end
end
for D, W in next, G do
    if W.StockChance > 0 then
        table.insert(l, W.EggName)
    end
end
for D, W in next, g do
    if W.StockChance > 0 then
        table.insert(r, W.GearName)
    end
end
for D, W in next, R.Mutation_FX:GetChildren() do
    table.insert(A, W.Name)
end
table.insert(A, "Gold")
table.insert(A, "Rainbow")
local T = false
local v = false
local q = false
local f = false
local z = false
local u = false
local b = false
local s = false
local N = false
local S = 20
local Dl = .1
local Wl = .1
local Fl = .01
local yl = .1
local pl = 1
local Xl = 1
local xl = 1
local Hl = 1
local Pl = .1
local ol = 10
local Ul = .01
local El = nil
local jl = "Player Position"
local Jl = "Closest"
function closest_pet()
    local D = nil
    local W = math.huge
    for F, y in next, i:GetChildren() do
        if y:IsA("Part") and (y:GetAttribute("OWNER") == Z.Name and y:GetAttribute("UUID")) then
            local F = ((y:GetPivot()).Position - (Z.Character:GetPivot()).Position).Magnitude
            if F < W then
                W = F
                D = y
            end
        end
    end
    return D
end
x:AddDivider()
x:AddLabel("If Pickup Aura Delay Is Low Theres A Chance To Insta Collect Before Planted", true)
x:AddDivider()
x:AddToggle("pickup_aura", {
    Text = "Pickup Aura",
    Default = u,
    Tooltip = "Collects avaible plants";
    Callback = function(D)
        u = D
        if D then
            if not Fl or tonumber(Fl) < .01 then
                W:Notify("Min Weight Must Be Above 0.01")
                return
            end
            repeat
                for D, W in next, (O:FindFirstChild("Plants_Physical")):GetChildren() do
                    if W:IsA("Model") and Z.Character:FindFirstChild("HumanoidRootPart") then
                        for D, F in next, W:GetDescendants() do
                            if F:IsA("ProximityPrompt") and (F.Parent.Parent:FindFirstChild("Weight") and (F.Parent.Parent.Weight.Value > tonumber(Fl) and ((W:GetPivot()).Position - (Z.Character:GetPivot()).Position).Magnitude < S)) then
                                fireproximityprompt(F)
                                task.wait(Dl)
                            end
                        end
                    end
                end
                task.wait()
            until not u
        end
    end
})
x:AddSlider("pickup_aura_delay", {
    Text = "Pickup Aura Delay:";
    Default = Dl,
    Min = .1,
    Max = 60;
    Rounding = 1,
    Compact = false;
    Callback = function(D)
        Dl = D
    end
})
x:AddSlider("pickup_aura_range", {
    Text = "Pickup Aura Range:";
    Default = S,
    Min = 5;
    Max = 20,
    Rounding = 0;
    Compact = false,
    Callback = function(D)
        S = D
    end
})
x:AddInput("pickup_min_weight", {
    Default = Fl;
    Numeric = true;
    Finished = true;
    Text = "Pickup At Min Weight:";
    Tooltip = "Will pick up above the weight",
    Placeholder = "";
    Callback = function(D)
        Fl = D
    end
})
x:AddDivider()
x:AddToggle("auto_plant", {
    Text = "Auto Plant";
    Default = b;
    Tooltip = "Auto plants held seed",
    Callback = function(D)
        b = D
        if D then
            if jl == "Choosen Position" and not El then
                W:Notify("No Position Found To Plant")
                return
            end
            repeat
                if Z.Character and (Z.Character:FindFirstChildOfClass("Tool") and (Z.Character:FindFirstChildOfClass("Tool")):GetAttribute("ItemType") == "Seed") then
                    if jl == "Choosen Position" then
                        ((R:WaitForChild("GameEvents")):WaitForChild("Plant_RE")):FireServer(El, (Z.Character:FindFirstChildOfClass("Tool")):GetAttribute("ItemName"))
                    elseif jl == "Player Position" then
                        ((R:WaitForChild("GameEvents")):WaitForChild("Plant_RE")):FireServer((Z.Character:GetPivot()).Position, (Z.Character:FindFirstChildOfClass("Tool")):GetAttribute("ItemName"))
                    end
                    task.wait(Pl)
                end
                task.wait()
            until not b
        end
    end
})
x:AddDropdown("auto_plant_method", {
    Values = {
        "Choosen Position";
        "Player Position"
    };
    Default = jl;
    Multi = false,
    Text = "Select Auto Plant Method:",
    Tooltip = "Auto plants with selected method";
    Callback = function(D)
        jl = D
    end
})
x:AddSlider("plant_delay", {
    Text = "Auto Plant Delay:";
    Default = Pl,
    Min = 0,
    Max = 10;
    Rounding = 1,
    Compact = false;
    Callback = function(D)
        Pl = D
    end
})
x:AddDivider()
x:AddButton({
    Text = "Get Choosen Position";
    Func = function()
        if Z.Character then
            El = (Z.Character:GetPivot()).Position
        end
    end;
    DoubleClick = false,
    Tooltip = "Get Position For Choosen Position"
})
H:AddDivider()
H:AddToggle("hatch_aura", {
    Text = "Hatch Aura",
    Default = s,
    Tooltip = "Hatches avaible eggs",
    Callback = function(D)
        s = D
        if D then
            repeat
                for D, W in next, (O:FindFirstChild("Objects_Physical")):GetChildren() do
                    if W:IsA("Model") and (W:GetAttribute("TimeToHatch") == 0 and (Z.Character and ((W:GetPivot()).Position - (Z.Character:GetPivot()).Position).Magnitude < 20)) then
                        for D, W in next, (W:FindFirstChildOfClass("Model")):GetChildren() do
                            if W:IsA("ProximityPrompt") and W.Name == "ProximityPrompt" then
                                fireproximityprompt(W)
                                task.wait(Wl)
                            end
                        end
                    end
                end
                task.wait()
            until not s
        end
    end
})
H:AddSlider("hatch_aura_delay", {
    Text = "Hatch Aura Delay:",
    Default = Wl,
    Min = .1,
    Max = 60,
    Rounding = 2;
    Compact = false,
    Callback = function(D)
        Wl = D
    end
})
H:AddDivider()
H:AddButton({
    Text = "Max Feed Nearest Pet";
    Func = function()
        local D = Z.Character:FindFirstChildOfClass("Tool")
        if not D then
            W:Notify("Not Holding A Tool")
            return
        end
        if D:GetAttribute("ItemType") and not D:GetAttribute("ItemType") == "Holdable" then
            W:Notify("Not Holding A Holdable Item")
            return
        end
        if D:GetAttribute("Favorite") then
            W:Notify("Cannot Feed Favorited Item")
            return
        end
        if Jl == "Closest" then
            local D = closest_pet()
            if not D then
                W:Notify("No Pets Found")
                return
            end
            for W = 1, Hl, 1 do
                ((R:WaitForChild("GameEvents")):WaitForChild("ActivePetService")):FireServer("Feed", D:GetAttribute("UUID"))
            end
            W:Notify("Done Feeding Pet")
            return
        end
        if Jl == "All" then
            for D = 1, Hl, 1 do
                for D, W in next, i:GetChildren() do
                    if W:IsA("Part") and (W:GetAttribute("OWNER") == Z.Name and W:GetAttribute("UUID")) then
                        ((R:WaitForChild("GameEvents")):WaitForChild("ActivePetService")):FireServer("Feed", W:GetAttribute("UUID"))
                    end
                end
            end
            W:Notify("Done Feeding Pets")
            return
        end
    end,
    DoubleClick = false,
    Tooltip = "Feeds pets to max"
})
H:AddDropdown("dupe_method", {
    Values = {
        "Closest",
        "All"
    };
    Default = Jl,
    Multi = false,
    Text = "Select Max Feed Method:",
    Tooltip = "Max feeds pets with selected method";
    Callback = function(D)
        Jl = D
    end
})
H:AddSlider("dupe_amount", {
    Text = "Dupe Amount:",
    Default = Hl,
    Min = 1,
    Max = 1000;
    Rounding = 0,
    Compact = false;
    Callback = function(D)
        Hl = D
    end
})
P:AddDivider()
P:AddToggle("auto_favorite", {
    Text = "Auto Favorite",
    Default = z,
    Tooltip = "Favorites fruits above choosen weight";
    Callback = function(D)
        z = D
        if D then
            if not Ul or tonumber(Ul) < .01 then
                W:Notify("Min Weight Must Be Above 0.01")
                return
            end
            repeat
                for D, W in next, (Z:FindFirstChild("Backpack")):GetChildren() do
                    for D, F in next, B:GetChildren() do
                        if W:IsA("Tool") and (not W:GetAttribute("Favorite") and (W:GetAttribute("ItemName") == F.Name and (W:FindFirstChild("Weight") and W.Weight.Value > tonumber(Ul)))) then
                            ((R:WaitForChild("GameEvents")):WaitForChild("Favorite_Item")):FireServer(W)
                        elseif m then
                            for D, y in next, m do
                                if W:IsA("Tool") and (not W:GetAttribute("Favorite") and (W:GetAttribute("ItemName") == F.Name and W.Name:find(D))) then
                                    ((R:WaitForChild("GameEvents")):WaitForChild("Favorite_Item")):FireServer(W)
                                end
                            end
                        end
                    end
                end
                task.wait(yl)
            until not z
        end
    end
})
P:AddInput("min_weight", {
    Default = Ul;
    Numeric = true;
    Finished = true;
    Text = "Select Min Weight:",
    Tooltip = "Will favorite above the min weight",
    Placeholder = "";
    Callback = function(D)
        Ul = D
    end
})
P:AddSlider("favorite_delay", {
    Text = "Select Favorite Delay:",
    Default = yl,
    Min = 0;
    Max = 60;
    Rounding = 1,
    Compact = false,
    Callback = function(D)
        yl = D
    end
})
P:AddDropdown("mutation_selector", {
    Values = A;
    Default = m,
    Multi = true;
    Text = "Select Mutations To Favorite:",
    Tooltip = "Favorites selected mutations",
    Callback = function(D)
        m = D
    end
})
P:AddDivider()
P:AddButton({
    Text = "Unfavorite All",
    Func = function()
        for D, W in next, (Z:FindFirstChild("Backpack")):GetChildren() do
            if W:GetAttribute("Favorite") then
                ((R:WaitForChild("GameEvents")):WaitForChild("Favorite_Item")):FireServer(W)
            end
        end
    end;
    DoubleClick = false,
    Tooltip = "Unfavorites all favorited fruits"
})
o:AddDivider()
o:AddToggle("auto_buy_seeds", {
    Text = "Auto Buy Seeds",
    Default = v,
    Tooltip = "Buys selected seeds";
    Callback = function(D)
        v = D
        if D then
            repeat
                for D, W in next, K do
                    ((R:WaitForChild("GameEvents")):WaitForChild("BuySeedStock")):FireServer(D)
                end
                task.wait(Xl)
            until not v
        end
    end
})
o:AddDropdown("seed_selector", {
    Values = c,
    Default = K;
    Multi = true;
    Text = "Select Seeds To Auto Buy:",
    Tooltip = "Buys selected seeds",
    Callback = function(D)
        K = D
    end
})
o:AddSlider("seed_buy_delay", {
    Text = "Seed Buy Delay:",
    Default = Xl;
    Min = 0,
    Max = 60,
    Rounding = 0,
    Compact = false;
    Callback = function(D)
        Xl = D
    end
})
o:AddDivider()
o:AddButton({
    Text = "Buy Seeds";
    Func = function()
        for D, W in next, K do
            ((R:WaitForChild("GameEvents")):WaitForChild("BuySeedStock")):FireServer(D)
        end
    end,
    DoubleClick = false;
    Tooltip = "Buys selected seeds"
})
U:AddDivider()
U:AddToggle("auto_buy_gears", {
    Text = "Auto Buy Gears";
    Default = q,
    Tooltip = "Buys selected gears";
    Callback = function(D)
        q = D
        if D then
            repeat
                for D, W in next, I do
                    ((R:WaitForChild("GameEvents")):WaitForChild("BuyGearStock")):FireServer(D)
                end
                task.wait(pl)
            until not q
        end
    end
})
U:AddDropdown("gear_selector", {
    Values = r,
    Default = I,
    Multi = true;
    Text = "Select Gear To Buy:";
    Tooltip = "Buys selected gear";
    Callback = function(D)
        I = D
    end
})
U:AddSlider("gear_buy_delay", {
    Text = "Gear Buy Delay:";
    Default = pl;
    Min = 0;
    Max = 60,
    Rounding = 0,
    Compact = false;
    Callback = function(D)
        pl = D
    end
})
U:AddDivider()
U:AddButton({
    Text = "Buy Gears",
    Func = function()
        for D, W in next, I do
            ((R:WaitForChild("GameEvents")):WaitForChild("BuyGearStock")):FireServer(D)
        end
    end,
    DoubleClick = false,
    Tooltip = "Buys selected gear"
})
E:AddDivider()
E:AddToggle("auto_buy_eggs", {
    Text = "Auto Buy Eggs";
    Default = f;
    Tooltip = "Buys selected eggs";
    Callback = function(D)
        f = D
        if D then
            repeat
                for D, W in next, Q:GetChildren() do
                    for F, y in next, C do
                        if W.Name == F and not W:GetAttribute("RobuxEggOnly") then
                            ((R:WaitForChild("GameEvents")):WaitForChild("BuyPetEgg")):FireServer(D - 3)
                        end
                    end
                end
                task.wait(xl)
            until not f
        end
    end
})
E:AddDropdown("egg_selector", {
    Values = l;
    Default = C,
    Multi = true,
    Text = "Select Egg To Buy:";
    Tooltip = "Buys selected egg",
    Callback = function(D)
        C = D
    end
})
E:AddSlider("egg_buy_delay", {
    Text = "Egg Buy Delay:",
    Default = xl;
    Min = 0,
    Max = 60,
    Rounding = 0;
    Compact = false;
    Callback = function(D)
        xl = D
    end
})
E:AddDivider()
E:AddButton({
    Text = "Buy Eggs";
    Func = function()
        for D, W in next, Q:GetChildren() do
            for F, y in next, C do
                if W.Name == F and not W:GetAttribute("RobuxEggOnly") then
                    ((R:WaitForChild("GameEvents")):WaitForChild("BuyPetEgg")):FireServer(D - 3)
                end
            end
        end
    end,
    DoubleClick = false;
    Tooltip = "Buys selected egg"
})
j:AddDivider()
j:AddToggle("auto_sell", {
    Text = "Auto Sell All";
    Default = N,
    Tooltip = "Sells all automatically for you",
    Callback = function(D)
        N = D
        if D then
            repeat
                if Z.Character and Z.Character:FindFirstChild("HumanoidRootPart") then
                    local D = (Z.Character:FindFirstChild("HumanoidRootPart")).CFrame;
                    (Z.Character:FindFirstChild("HumanoidRootPart")).CFrame = t.Tutorial_Points.Tutorial_Point_2.CFrame
                    task.wait(.2);
                    ((R:WaitForChild("GameEvents")):WaitForChild("Sell_Inventory")):FireServer()
                    task.wait(.2);
                    (Z.Character:FindFirstChild("HumanoidRootPart")).CFrame = D
                    task.wait(ol)
                end
            until not N
        end
    end
})
j:AddSlider("auto_sell_delay", {
    Text = "Auto Sell Delay";
    Default = ol,
    Min = 10;
    Max = 600;
    Rounding = 1;
    Compact = false,
    Callback = function(D)
        ol = D
    end
})
j:AddDivider()
j:AddButton({
    Text = "Sell All";
    Func = function()
        local D = (Z.Character:FindFirstChild("HumanoidRootPart")).CFrame;
        (Z.Character:FindFirstChild("HumanoidRootPart")).CFrame = t.Tutorial_Points.Tutorial_Point_2.CFrame
        task.wait(.2);
        ((R:WaitForChild("GameEvents")):WaitForChild("Sell_Inventory")):FireServer()
        task.wait(.2);
        (Z.Character:FindFirstChild("HumanoidRootPart")).CFrame = D
        W:Notify("Sold All")
    end,
    DoubleClick = false;
    Tooltip = "Sells Inventory"
})
j:AddButton({
    Text = "Sell Held Plant";
    Func = function()
        local D = Z.Character:FindFirstChildOfClass("Tool")
        if not D then
            W:Notify("Not Holding A Tool")
            return
        end
        if D:GetAttribute("Favorite") then
            W:Notify("Cannot Sell Favorited Item")
            return
        end
        for F, y in next, c:GetChildren() do
            if D:GetAttribute("ItemType") == y.Name and D:GetAttribute("ItemType") == "Holdable" then
                local D = (Z.Character:FindFirstChild("HumanoidRootPart")).CFrame;
                (Z.Character:FindFirstChild("HumanoidRootPart")).CFrame = t.Tutorial_Points.Tutorial_Point_2.CFrame
                task.wait(.2);
                ((R:WaitForChild("GameEvents")):WaitForChild("Sell_Item")):FireServer()
                task.wait(.2);
                (Z.Character:FindFirstChild("HumanoidRootPart")).CFrame = D
                W:Notify("Sold Item")
            end
        end
    end;
    DoubleClick = false;
    Tooltip = "Sells held item"
})
J:AddDivider()
J:AddButton({
    Text = "Anti Afk";
    Func = function()
        if h then
            for D, W in next, h(Z.Idled) do
                if W.Disable then
                    W.Disable(W)
                elseif W.Disconnect then
                    W.Disconnect(W)
                end
            end
        else
            Z.Idled:Connect(function()
                V:CaptureController()
                V:ClickButton2(Vector2.new())
            end)
        end
        W:Notify("Anti Afk Enabled! (Credits to inf yield)")
    end;
    DoubleClick = false;
    Tooltip = "Credits to inf yield <3"
})
J:AddButton({
    Text = "Rejoin";
    Func = function()
        queue_on_teleport("            loadstring(game:HttpGet(\"https://raw.githubusercontent.com/kylosilly/astolfoware/refs/heads/main/astolfo%20ware%20loader.lua\"))()\n        ")
        e:TeleportToPlaceInstance(game.PlaceId, game.JobId, Z)
    end,
    DoubleClick = false,
    Tooltip = "Rejoins the game"
})
J:AddButton({
    Text = "Join Discord Server";
    Func = function()
        setclipboard("https://discord.gg/SUTpER4dNc")
        W:Notify("Copied discord invite to clipboard")
    end;
    DoubleClick = false,
    Tooltip = "Copies discord invite to clipboard"
})
n:AddDivider()
n:AddToggle("auto_give_moonlits", {
    Text = "Auto Give Moonlit Items";
    Default = T,
    Tooltip = "Automatically gives moonlit items";
    Callback = function(D)
        T = D
        if D then
            repeat
                for D, W in next, Z.Backpack:GetChildren() do
                    if W:IsA("Tool") and W.Name:find("Moonlit") then
                        ((R:WaitForChild("GameEvents")):WaitForChild("NightQuestRemoteEvent")):FireServer("SubmitAllPlants")
                    end
                end
                task.wait(1)
            until not T
        end
    end
})
n:AddDivider()
n:AddButton({
    Text = "Tp To Event";
    Func = function()
        (Z.Character:FindFirstChild("HumanoidRootPart")).CFrame = (t.NightEvent.OwlNPCTree)["26"].Part.CFrame + Vector3.new(0, 5, 0)
    end;
    DoubleClick = false,
    Tooltip = "Teleports you to the event platform"
})
n:AddButton({
    Text = "Give All Moonlit Items",
    Func = function()
        for D, W in next, Z.Backpack:GetChildren() do
            if W:IsA("Tool") and W.Name:find("Moonlit") then
                ((R:WaitForChild("GameEvents")):WaitForChild("NightQuestRemoteEvent")):FireServer("SubmitAllPlants")
                return
            end
        end
        W:Notify("No Moonlit Items Found")
    end;
    DoubleClick = false,
    Tooltip = "Gives all moonlit items"
})
n:AddButton({
    Text = "Give Held Moonlit Item";
    Func = function()
        local D = Z.Character:FindFirstChildOfClass("Tool")
        if not D then
            W:Notify("Not Holding A Tool")
            return
        end
        if not D.Name:find("Moonlit") then
            W:Notify("Not Holding A Moonlit Item")
            return
        end;
        ((R:WaitForChild("GameEvents")):WaitForChild("NightQuestRemoteEvent")):FireServer("SubmitHeldPlant")
    end,
    DoubleClick = false,
    Tooltip = "Gives held moonlit item"
})
local nl = tick()
local Ml = 0
local Rl = 60
local el = L.RenderStepped:Connect(function()
    Ml = Ml + 1
    if tick() - nl >= 1 then
        Rl = Ml
        nl = tick()
        Ml = 0
    end
    W:SetWatermark(("Astolfo Ware | %s fps | %s ms | game: " .. (k.Name .. "")):format(math.floor(Rl), math.floor((d.Network.ServerStatsItem)["Data Ping"]:GetValue())))
end)
M:AddButton("Unload", function()
    T = false
    v = false
    q = false
    f = false
    z = false
    u = false
    b = false
    s = false
    N = false
    el:Disconnect()
    W:Unload()
end);
(M:AddLabel("Menu bind")):AddKeyPicker("MenuKeybind", {
    Default = "End",
    NoUI = true,
    Text = "Menu keybind"
})
W.ToggleKeybind = Options.MenuKeybind
F:SetLibrary(W)
y:SetLibrary(W)
y:IgnoreThemeSettings()
y:SetIgnoreIndexes({
    "MenuKeybind"
})
F:SetFolder("Astolfo Ware")
y:SetFolder("Astolfo Ware/untitled drill game")
y:BuildConfigSection((X)["ui settings"])
F:ApplyToTab((X)["ui settings"])
y:LoadAutoloadConfig()
