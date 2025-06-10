
--vyn.wtf
--another allusive skids💔 🥀

(getgenv()).GG = {
    Language = {
        CheckboxEnabled = "Enabled";
        CheckboxDisabled = "Disabled";
        SliderValue = "Value";
        DropdownSelect = "Select",
        DropdownNone = "None";
        DropdownSelected = "Selected",
        ButtonClick = "Click";
        TextboxEnter = "Enter",
        ModuleEnabled = "Enabled";
        ModuleDisabled = "Disabled",
        TabGeneral = "General";
        TabSettings = "Settings";
        Loading = "Loading...",
        Error = "Error",
        Success = "Success"
    }
}
local f = GG.Language
function convertStringToTable(s)
    local b = {}
    for s in string.gmatch(s, "([^,]+)") do
        local f = s:match("^%s*(.-)%s*$")
        tablein(b, f)
    end
    return b
end
function convertTableToString(s)
    return table.concat(s, ", ")
end
local I = cloneref(game:GetService("UserInputService"))
local a = cloneref(game:GetService("ContentProvider"))
local O = cloneref(game:GetService("TweenService"))
local y = cloneref(game:GetService("HttpService"))
local z = cloneref(game:GetService("TextService"))
local Z = cloneref(game:GetService("RunService"))
local N = cloneref(game:GetService("Lighting"))
local G = cloneref(game:GetService("Players"))
local J = cloneref(game:GetService("CoreGui"))
local D = cloneref(game:GetService("Debris"))
local X = G.LocalPlayer:GetMouse()
local j = J:FindFirstChild("Silly")
if j then
    D:AddItem(j, 0)
end
if not isfolder("asdasd") then
    makefolder("asdasd")
end
local F = setmetatable({
    disconnect = function(s, b)
        if not (s)[b] then
            return
        end;
        (s)[b]:Disconnect();
        (s)[b] = nil
    end,
    disconnect_all = function(s)
        for s, b in s do
            local f = false
            repeat
                if typeof(b) == "function" then
                    f = true
                    break
                end
                b:Disconnect()
                f = true
            until true
            if not f then
                break
            end
        end
    end
}, Connections)
local w = setmetatable({
    map = function(s, b, f, I, a, O)
        return ((b - f) * (O - a)) / (I - f) + a
    end;
    viewport_point_to_world = function(s, b, f)
        local I = workspace.CurrentCamera:ScreenPointToRay(b.X, b.Y)
        return I.Origin + I.Direction * f
    end,
    get_offset = function(s)
        local b = workspace.CurrentCamera.ViewportSize.Y
        return s:map(b, 0, 2560, 8, 56)
    end
}, Util)
local v = {}
v.__index = v
function v.new(s)
    local b = setmetatable({
        _object = s;
        _folder = nil;
        _frame = nil,
        _root = nil
    }, v)
    b:setup()
    return b
end
function v.create_folder(s)
    local b = workspace.CurrentCamera:FindFirstChild("AcrylicBlur")
    if b then
        D:AddItem(b, 0)
    end
    local f = Instance.new("Folder")
    f.Name = "AcrylicBlur"
    f.Parent = workspace.CurrentCamera
    s._folder = f
end
function v.create_depth_of_fields(s)
    local b = N:FindFirstChild("AcrylicBlur") or Instance.new("DepthOfFieldEffect")
    b.FarIntensity = 0
    b.FocusDistance = .05
    b.InFocusRadius = .1
    b.NearIntensity = 1
    b.Name = "AcrylicBlur"
    b.Parent = N
    for s, f in N:GetChildren() do
        local I = false
        repeat
            if not f:IsA("DepthOfFieldEffect") then
                I = true
                break
            end
            if f == b then
                I = true
                break
            end;
            (F)[f] = (f:GetPropertyChangedSignal("FarIntensity")):Connect(function()
                f.FarIntensity = 0
            end)
            f.FarIntensity = 0
            I = true
        until true
        if not I then
            break
        end
    end
end
function v.create_frame(s)
    local b = Instance.new("Frame")
    b.Size = UDim2.new(1, 0, 1, 0)
    b.Position = UDim2.new(.5, 0, .5, 0)
    b.AnchorPoint = Vector2.new(.5, .5)
    b.BackgroundTransparency = 1
    b.Parent = s._object
    s._frame = b
end
function v.create_root(s)
    local b = Instance.new("Part")
    b.Name = "Root"
    b.Color = Color3.new(0, 0, 0)
    b.Material = Enum.Material.Glass
    b.Size = Vector3.new(1, 1, 0)
    b.Anchored = true
    b.CanCollide = false
    b.CanQuery = false
    b.Locked = true
    b.CastShadow = false
    b.Transparency = .98
    b.Parent = s._folder
    local f = Instance.new("SpecialMesh")
    f.MeshType = Enum.MeshType.Brick
    f.Offset = Vector3.new(0, 0, - 1e-006)
    f.Parent = b
    s._root = b
end
function v.setup(s)
    s:create_depth_of_fields()
    s:create_folder()
    s:create_root()
    s:create_frame()
    s:render(.001)
    s:check_quality_level()
end
function v.render(b, s)
    local f = {
        top_left = Vector2.new(),
        top_right = Vector2.new();
        bottom_right = Vector2.new()
    }
    local function I(s, b)
        f.top_left = b
        f.top_right = b + Vector2.new(s.X, 0)
        f.bottom_right = b + s
    end
    local function a()
        local I = f.top_left
        local a = f.top_right
        local O = f.bottom_right
        local y = w:viewport_point_to_world(I, s)
        local z = w:viewport_point_to_world(a, s)
        local Z = w:viewport_point_to_world(O, s)
        local N = (z - y).Magnitude
        local G = (z - Z).Magnitude
        if not b._root then
            return
        end
        b._root.CFrame = CFrame.fromMatrix((y + Z) / 2, workspace.CurrentCamera.CFrame.XVector, workspace.CurrentCamera.CFrame.YVector, workspace.CurrentCamera.CFrame.ZVector)
        b._root.Mesh.Scale = Vector3.new(N, G, 0)
    end
    local function O()
        local s = w:get_offset()
        local f = b._frame.AbsoluteSize - Vector2.new(s, s)
        local O = b._frame.AbsolutePosition + Vector2.new(s / 2, s / 2)
        I(f, O)
        task.spawn(a)
    end
    F.cframe_update = (workspace.CurrentCamera:GetPropertyChangedSignal("CFrame")):Connect(a)
    F.viewport_size_update = (workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(a)
    F.field_of_view_update = (workspace.CurrentCamera:GetPropertyChangedSignal("FieldOfView")):Connect(a)
    F.frame_absolute_position = (b._frame:GetPropertyChangedSignal("AbsolutePosition")):Connect(O)
    F.frame_absolute_size = (b._frame:GetPropertyChangedSignal("AbsoluteSize")):Connect(O)
    task.spawn(a)
end
function v.check_quality_level(s)
    local b = (UserSettings()).GameSettings
    local f = b.SavedQualityLevel.Value
    if f < 8 then
        s:change_visiblity(false)
    end
    F.quality_level = (b:GetPropertyChangedSignal("SavedQualityLevel")):Connect(function()
        local b = (UserSettings()).GameSettings
        local f = b.SavedQualityLevel.Value
        s:change_visiblity(f >= 8)
    end)
end
function v.change_visiblity(b, s)
    b._root.Transparency = s and .98 or 1
end
local h = setmetatable({
    save = function(s, b, f)
        local I, a = pcall(function()
            local s = y:JSONEncode(f)
            writefile("asday/" .. (b .. ".json"), s)
        end)
        if not I then
            warn("failed to save config", a)
        end
    end;
    load = function(s, b, f)
        local I, a = pcall(function()
            if not isfile("asday/" .. (b .. ".json")) then
                s:save(b, f)
                return
            end
            local I = readfile("asday/" .. (b .. ".json"))
            if not I then
                s:save(b, f)
                return
            end
            return y:JSONDecode(I)
        end)
        if not I then
            warn("failed to load config", a)
        end
        if not a then
            a = {
                _flags = {},
                _keybinds = {};
                _library = {}
            }
        end
        return a
    end
}, Config)
local n = {
    _config = h:load(game.GameId);
    _choosing_keybind = false;
    _device = nil,
    _ui_open = true,
    _ui_scale = 1;
    _ui_loaded = false,
    _ui = nil;
    _dragging = false;
    _drag_start = nil;
    _container_position = nil
}
n.__index = n
function n.new()
    local s = setmetatable({
        _loaded = false,
        _tab = 0
    }, n)
    s:create_ui()
    return s
end
local Q = Instance.new("Frame")
Q.Name = "RobloxCoreGuis"
Q.Size = UDim2.new(0, 300, 0, 0)
Q.Position = UDim2.new(.8, 0, 0, 10)
Q.BackgroundTransparency = 1
Q.ClipsDescendants = false
Q.Parent = (game:GetService("CoreGui")).RobloxGui:FindFirstChild("RobloxCoreGuis") or Instance.new("ScreenGui", (game:GetService("CoreGui")).RobloxGui)
Q.AutomaticSize = Enum.AutomaticSize.Y
local k = Instance.new("UIListLayout")
k.FillDirection = Enum.FillDirection.Vertical
k.SortOrder = Enum.SortOrder.LayoutOrder
k.Padding = UDim.new(0, 10)
k.Parent = Q
function n.SendNotification(s)
    local b = Instance.new("Frame")
    b.Size = UDim2.new(1, 0, 0, 60)
    b.BackgroundTransparency = 1
    b.BorderSizePixel = 0
    b.Name = "Notification"
    b.Parent = Q
    b.AutomaticSize = Enum.AutomaticSize.Y
    local f = Instance.new("UICorner")
    f.CornerRadius = UDim.new(0, 4)
    f.Parent = b
    local I = Instance.new("Frame")
    I.Size = UDim2.new(1, 0, 0, 60)
    I.Position = UDim2.new(0, 0, 0, 0)
    I.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
    I.BackgroundTransparency = .2
    I.BorderSizePixel = 0
    I.Name = "InnerFrame"
    I.Parent = b
    I.AutomaticSize = Enum.AutomaticSize.Y
    local a = Instance.new("UICorner")
    a.CornerRadius = UDim.new(0, 4)
    a.Parent = I
    local y = Instance.new("TextLabel")
    y.Text = s.title or "Notification Title"
    y.TextColor3 = Color3.fromRGB(210, 210, 210)
    y.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    y.TextSize = 14
    y.Size = UDim2.new(1, - 10, 0, 20)
    y.Position = UDim2.new(0, 5, 0, 5)
    y.BackgroundTransparency = 1
    y.TextXAlignment = Enum.TextXAlignment.Left
    y.TextYAlignment = Enum.TextYAlignment.Center
    y.TextWrapped = true
    y.AutomaticSize = Enum.AutomaticSize.Y
    y.Parent = I
    local z = Instance.new("TextLabel")
    z.Text = s.text or "This is the body of the notification."
    z.TextColor3 = Color3.fromRGB(255, 200, 200)
    z.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    z.TextSize = 12
    z.Size = UDim2.new(1, - 10, 0, 30)
    z.Position = UDim2.new(0, 5, 0, 25)
    z.BackgroundTransparency = 1
    z.TextXAlignment = Enum.TextXAlignment.Left
    z.TextYAlignment = Enum.TextYAlignment.Top
    z.TextWrapped = true
    z.AutomaticSize = Enum.AutomaticSize.Y
    z.Parent = I
    task.spawn(function()
        wait(.1)
        local s = (y.TextBounds.Y + z.TextBounds.Y) + 10
        I.Size = UDim2.new(1, 0, 0, s)
    end)
    task.spawn(function()
        local f = O:Create(I, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 10 + Q.Size.Y.Offset)
        })
        f:Play()
        local a = s.duration or 5
        wait(a)
        local y = O:Create(I, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 310, 0, 10 + Q.Size.Y.Offset)
        })
        y:Play()
        y.Completed:Connect(function()
            b:Destroy()
        end)
    end)
end
function n.get_screen_scale(s)
    local b = workspace.CurrentCamera.ViewportSize.X
    s._ui_scale = b / 1400
end
function n.get_device(s)
    local b = "Unknown"
    if not I.TouchEnabled and (I.KeyboardEnabled and I.MouseEnabled) then
        b = "PC"
    elseif I.TouchEnabled then
        b = "Mobile"
    elseif I.GamepadEnabled then
        b = "Console"
    end
    s._device = b
end
function n.removed(b, s)
    b._ui.AncestryChanged:Once(s)
end
function n.flag_type(f, s, b)
    if not (n._config._flags)[s] then
        return
    end
    return typeof((n._config._flags)[s]) == b
end
function n.remove_table_value(f, s, b)
    for f, I in s do
        local a = false
        repeat
            if I ~= b then
                a = true
                break
            end
            table.remove(s, f)
            a = true
        until true
        if not a then
            break
        end
    end
end
function n.create_ui(s)
    local b = J:FindFirstChild("Silly")
    if b then
        D:AddItem(b, 0)
    end
    local y = Instance.new("ScreenGui")
    y.ResetOnSpawn = false
    y.Name = "sadasdasdasdasdasdadas"
    y.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    y.Parent = J
    local Z = Instance.new("Frame")
    Z.ClipsDescendants = true
    Z.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Z.AnchorPoint = Vector2.new(.5, .5)
    Z.Name = "Container"
    Z.BackgroundTransparency = .15
    Z.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
    Z.Position = UDim2.new(.5, 0, .5, 0)
    Z.Size = UDim2.new(0, 0, 0, 0)
    Z.Active = true
    Z.BorderSizePixel = 0
    Z.Parent = y
    local N = Instance.new("UICorner")
    N.CornerRadius = UDim.new(0, 10)
    N.Parent = Z
    local G = Instance.new("UIStroke")
    G.Color = Color3.fromRGB(52, 66, 89)
    G.Transparency = .5
    G.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    G.Parent = Z
    local j = Instance.new("Frame")
    j.BackgroundTransparency = 1
    j.Name = "Handler"
    j.BorderColor3 = Color3.fromRGB(0, 0, 0)
    j.Size = UDim2.new(0, 698, 0, 479)
    j.BorderSizePixel = 0
    j.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    j.Parent = Z
    local w = Instance.new("ScrollingFrame")
    w.ScrollBarImageTransparency = 1
    w.ScrollBarThickness = 0
    w.Name = "Tabs"
    w.Size = UDim2.new(0, 129, 0, 401)
    w.Selectable = false
    w.AutomaticCanvasSize = Enum.AutomaticSize.XY
    w.BackgroundTransparency = 1
    w.Position = UDim2.new(.026097271591425, 0, .11111111193895, 0)
    w.BorderColor3 = Color3.fromRGB(0, 0, 0)
    w.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    w.BorderSizePixel = 0
    w.CanvasSize = UDim2.new(0, 0, .5, 0)
    w.Parent = j
    local Q = Instance.new("UIListLayout")
    Q.Padding = UDim.new(0, 4)
    Q.SortOrder = Enum.SortOrder.LayoutOrder
    Q.Parent = w
    local k = Instance.new("TextLabel")
    k.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    k.TextColor3 = Color3.fromRGB(120, 0, 0)
    k.TextTransparency = .20000000298023
    k.Text = "lydsfsfd"
    k.Name = "ClientName"
    k.Size = UDim2.new(0, 31, 0, 13)
    k.AnchorPoint = Vector2.new(0, .5)
    k.Position = UDim2.new(.056000001728535, 0, .054999999701977, 0)
    k.BackgroundTransparency = 1
    k.TextXAlignment = Enum.TextXAlignment.Left
    k.BorderSizePixel = 0
    k.BorderColor3 = Color3.fromRGB(0, 0, 0)
    k.TextSize = 13
    k.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    k.Parent = j
    local W = Instance.new("UIGradient")
    W.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(155, 155, 155)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
    })
    W.Parent = k
    local E = Instance.new("Frame")
    E.Name = "Pin"
    E.Position = UDim2.new(.026000000536442, 0, .13600000739098, 0)
    E.BorderColor3 = Color3.fromRGB(0, 0, 0)
    E.Size = UDim2.new(0, 2, 0, 16)
    E.BorderSizePixel = 0
    E.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
    E.Parent = j
    local i = Instance.new("UICorner")
    i.CornerRadius = UDim.new(1, 0)
    i.Parent = E
    local T = Instance.new("ImageLabel")
    T.ImageColor3 = Color3.fromRGB(120, 0, 0)
    T.ScaleType = Enum.ScaleType.Fit
    T.BorderColor3 = Color3.fromRGB(0, 0, 0)
    T.AnchorPoint = Vector2.new(0, .5)
    T.Image = "rbxassetid://107819132007001"
    T.BackgroundTransparency = 1
    T.Position = UDim2.new(.025000000372529, 0, .054999999701977, 0)
    T.Name = "Icon"
    T.Size = UDim2.new(0, 18, 0, 18)
    T.BorderSizePixel = 0
    T.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    T.Parent = j
    local M = Instance.new("Frame")
    M.Name = "Divider"
    M.BackgroundTransparency = .5
    M.Position = UDim2.new(.23499999940395, 0, 0, 0)
    M.BorderColor3 = Color3.fromRGB(0, 0, 0)
    M.Size = UDim2.new(0, 1, 0, 479)
    M.BorderSizePixel = 0
    M.BackgroundColor3 = Color3.fromRGB(52, 66, 89)
    M.Parent = j
    local g = Instance.new("Folder")
    g.Name = "Sections"
    g.Parent = j
    local c = Instance.new("TextButton")
    c.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    c.TextColor3 = Color3.fromRGB(0, 0, 0)
    c.BorderColor3 = Color3.fromRGB(0, 0, 0)
    c.Text = ""
    c.AutoButtonColor = false
    c.Name = "Minimize"
    c.BackgroundTransparency = 1
    c.Position = UDim2.new(.020057305693626, 0, .029227556660771, 0)
    c.Size = UDim2.new(0, 24, 0, 24)
    c.BorderSizePixel = 0
    c.TextSize = 14
    c.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    c.Parent = j
    local Y = Instance.new("UIScale")
    Y.Parent = Z
    s._ui = y
    local function r(b, f)
        if b.UserInputType == Enum.UserInputType.MouseButton1 or b.UserInputType == Enum.UserInputType.Touch then
            s._dragging = true
            s._drag_start = b.Position
            s._container_position = Z.Position
            F.container_input_ended = b.Changed:Connect(function()
                if b.UserInputState ~= Enum.UserInputState.End then
                    return
                end
                F:disconnect("container_input_ended")
                s._dragging = false
            end)
        end
    end
    local function P(b)
        local f = b.Position - s._drag_start
        local I = UDim2.new(s._container_position.X.Scale, s._container_position.X.Offset + f.X, s._container_position.Y.Scale, s._container_position.Y.Offset + f.Y);
        (O:Create(Z, TweenInfo.new(.2), {
            Position = I
        })):Play()
    end
    local function S(b, f)
        if not s._dragging then
            return
        end
        if b.UserInputType == Enum.UserInputType.MouseMovement or b.UserInputType == Enum.UserInputType.Touch then
            P(b)
        end
    end
    F.container_input_began = Z.InputBegan:Connect(r)
    F.input_changed = I.InputChanged:Connect(S)
    s:removed(function()
        s._ui = nil
        F:disconnect_all()
    end)
    function s.Update1Run(b, s)
        if s == "nil" then
            Z.BackgroundTransparency = .15
        else
            pcall(function()
                Z.BackgroundTransparency = tonumber(s)
            end)
        end
    end
    function s.UIVisiblity(s)
        y.Enabled = not y.Enabled
    end
    function s.change_visiblity(b, s)
        if s then
            (O:Create(Z, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Size = UDim2.fromOffset(698, 479)
            })):Play()
        else
            (O:Create(Z, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Size = UDim2.fromOffset(104.5, 52)
            })):Play()
        end
    end
    function s.load(s)
        local b = {}
        for s, f in y:GetDescendants() do
            local I = false
            repeat
                if not f:IsA("ImageLabel") then
                    I = true
                    break
                end
                table.insert(b, f)
                I = true
            until true
            if not I then
                break
            end
        end
        a:PreloadAsync(b)
        s:get_device()
        if s._device == "Mobile" or s._device == "Unknown" then
            s:get_screen_scale()
            Y.Scale = s._ui_scale
            F.ui_scale = (workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(function()
                s:get_screen_scale()
                Y.Scale = s._ui_scale
            end)
        end;
        (O:Create(Z, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Size = UDim2.fromOffset(698, 479)
        })):Play()
        v.new(Z)
        s._ui_loaded = true
    end
    function s.update_tabs(b, s)
        for b, f in w:GetChildren() do
            local I = false
            repeat
                if f.Name ~= "Tab" then
                    I = true
                    break
                end
                if f == s then
                    if f.BackgroundTransparency ~= .5 then
                        local s = f.LayoutOrder * .086923076923077;
                        (O:Create(E, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Position = UDim2.fromScale(.026, .135 + s)
                        })):Play();
                        (O:Create(f, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            BackgroundTransparency = .5
                        })):Play();
                        (O:Create(f.TextLabel, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            TextTransparency = .2;
                            TextColor3 = Color3.fromRGB(120, 0, 0)
                        })):Play();
                        (O:Create(f.TextLabel.UIGradient, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Offset = Vector2.new(1, 0)
                        })):Play();
                        (O:Create(f.Icon, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            ImageTransparency = .2,
                            ImageColor3 = Color3.fromRGB(120, 0, 0)
                        })):Play()
                    end
                    I = true
                    break
                end
                if f.BackgroundTransparency ~= 1 then
                    (O:Create(f, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundTransparency = 1
                    })):Play();
                    (O:Create(f.TextLabel, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        TextTransparency = .7,
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    })):Play();
                    (O:Create(f.TextLabel.UIGradient, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Offset = Vector2.new(0, 0)
                    })):Play();
                    (O:Create(f.Icon, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        ImageTransparency = .8,
                        ImageColor3 = Color3.fromRGB(255, 255, 255)
                    })):Play()
                end
                I = true
            until true
            if not I then
                break
            end
        end
    end
    function s.update_sections(f, s, b)
        for f, I in g:GetChildren() do
            local a = false
            repeat
                if I == s or I == b then
                    I.Visible = true
                    a = true
                    break
                end
                I.Visible = false
                a = true
            until true
            if not a then
                break
            end
        end
    end
    function s.create_tab(a, s, b)
        local y = {}
        local Z = 0
        local N = Instance.new("GetTextBoundsParams")
        N.Text = s
        N.Font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
        N.Size = 13
        N.Width = 10000
        local G = z:GetTextBoundsAsync(N)
        local J = not w:FindFirstChild("Tab")
        local D = Instance.new("TextButton")
        D.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        D.TextColor3 = Color3.fromRGB(0, 0, 0)
        D.BorderColor3 = Color3.fromRGB(0, 0, 0)
        D.Text = ""
        D.AutoButtonColor = false
        D.BackgroundTransparency = 1
        D.Name = "Tab"
        D.Size = UDim2.new(0, 129, 0, 38)
        D.BorderSizePixel = 0
        D.TextSize = 14
        D.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
        D.Parent = w
        D.LayoutOrder = a._tab
        local j = Instance.new("UICorner")
        j.CornerRadius = UDim.new(0, 5)
        j.Parent = D
        local v = Instance.new("TextLabel")
        v.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
        v.TextColor3 = Color3.fromRGB(255, 255, 255)
        v.TextTransparency = .7
        v.Text = s
        v.Size = UDim2.new(0, G.X, 0, 16)
        v.AnchorPoint = Vector2.new(0, .5)
        v.Position = UDim2.new(.24000017344952, 0, .5, 0)
        v.BackgroundTransparency = 1
        v.TextXAlignment = Enum.TextXAlignment.Left
        v.BorderSizePixel = 0
        v.BorderColor3 = Color3.fromRGB(0, 0, 0)
        v.TextSize = 13
        v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v.Parent = D
        local Q = Instance.new("UIGradient")
        Q.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(.7, Color3.fromRGB(155, 155, 155)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(58, 58, 58))
        })
        Q.Parent = v
        local k = Instance.new("ImageLabel")
        k.ScaleType = Enum.ScaleType.Fit
        k.ImageTransparency = .80000001192093
        k.BorderColor3 = Color3.fromRGB(0, 0, 0)
        k.AnchorPoint = Vector2.new(0, .5)
        k.BackgroundTransparency = 1
        k.Position = UDim2.new(.10000000149012, 0, .5, 0)
        k.Name = "Icon"
        k.Image = b
        k.Size = UDim2.new(0, 12, 0, 12)
        k.BorderSizePixel = 0
        k.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        k.Parent = D
        local W = Instance.new("ScrollingFrame")
        W.Name = "LeftSection"
        W.AutomaticCanvasSize = Enum.AutomaticSize.XY
        W.ScrollBarThickness = 0
        W.Size = UDim2.new(0, 243, 0, 445)
        W.Selectable = false
        W.AnchorPoint = Vector2.new(0, .5)
        W.ScrollBarImageTransparency = 1
        W.BackgroundTransparency = 1
        W.Position = UDim2.new(.25943264365196, 0, .5, 0)
        W.BorderColor3 = Color3.fromRGB(0, 0, 0)
        W.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        W.BorderSizePixel = 0
        W.CanvasSize = UDim2.new(0, 0, .5, 0)
        W.Visible = false
        W.Parent = g
        local E = Instance.new("UIListLayout")
        E.Padding = UDim.new(0, 11)
        E.HorizontalAlignment = Enum.HorizontalAlignment.Center
        E.SortOrder = Enum.SortOrder.LayoutOrder
        E.Parent = W
        local i = Instance.new("UIPadding")
        i.PaddingTop = UDim.new(0, 1)
        i.Parent = W
        local T = Instance.new("ScrollingFrame")
        T.Name = "RightSection"
        T.AutomaticCanvasSize = Enum.AutomaticSize.XY
        T.ScrollBarThickness = 0
        T.Size = UDim2.new(0, 243, 0, 445)
        T.Selectable = false
        T.AnchorPoint = Vector2.new(0, .5)
        T.ScrollBarImageTransparency = 1
        T.BackgroundTransparency = 1
        T.Position = UDim2.new(.62900000810623, 0, .5, 0)
        T.BorderColor3 = Color3.fromRGB(0, 0, 0)
        T.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        T.BorderSizePixel = 0
        T.CanvasSize = UDim2.new(0, 0, .5, 0)
        T.Visible = false
        T.Parent = g
        local M = Instance.new("UIListLayout")
        M.Padding = UDim.new(0, 11)
        M.HorizontalAlignment = Enum.HorizontalAlignment.Center
        M.SortOrder = Enum.SortOrder.LayoutOrder
        M.Parent = T
        local c = Instance.new("UIPadding")
        c.PaddingTop = UDim.new(0, 1)
        c.Parent = T
        a._tab = a._tab + 1
        if J then
            a:update_tabs(D, W, T)
            a:update_sections(W, T)
        end
        D.MouseButton1Click:Connect(function()
            a:update_tabs(D, W, T)
            a:update_sections(W, T)
        end)
        function y.create_module(b, s)
            local a = 0
            local y = {
                _state = false;
                _size = 0,
                _multiplier = 0
            }
            if s.section == "right" then
                s.section = T
            else
                s.section = W
            end
            local Z = Instance.new("Frame")
            Z.ClipsDescendants = true
            Z.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Z.BackgroundTransparency = .5
            Z.Position = UDim2.new(.004115226212889, 0, 0, 0)
            Z.Name = "Module"
            Z.Size = UDim2.new(0, 241, 0, 93)
            Z.BorderSizePixel = 0
            Z.BackgroundColor3 = Color3.fromRGB(230, 28, 75)
            Z.Parent = s.section
            local N = Instance.new("UIListLayout")
            N.SortOrder = Enum.SortOrder.LayoutOrder
            N.Parent = Z
            local G = Instance.new("UICorner")
            G.CornerRadius = UDim.new(0, 5)
            G.Parent = Z
            local J = Instance.new("UIStroke")
            J.Color = Color3.fromRGB(52, 66, 89)
            J.Transparency = .5
            J.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            J.Parent = Z
            local D = Instance.new("TextButton")
            D.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            D.TextColor3 = Color3.fromRGB(0, 0, 0)
            D.BorderColor3 = Color3.fromRGB(0, 0, 0)
            D.Text = ""
            D.AutoButtonColor = false
            D.BackgroundTransparency = 1
            D.Name = "Header"
            D.Size = UDim2.new(0, 241, 0, 93)
            D.BorderSizePixel = 0
            D.TextSize = 14
            D.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            D.Parent = Z
            local j = Instance.new("ImageLabel")
            j.ImageColor3 = Color3.fromRGB(120, 0, 0)
            j.ScaleType = Enum.ScaleType.Fit
            j.ImageTransparency = .69999998807907
            j.BorderColor3 = Color3.fromRGB(0, 0, 0)
            j.AnchorPoint = Vector2.new(0, .5)
            j.Image = "rbxassetid://79095934438045"
            j.BackgroundTransparency = 1
            j.Position = UDim2.new(.071000002324581, 0, .81999999284744, 0)
            j.Name = "Icon"
            j.Size = UDim2.new(0, 15, 0, 15)
            j.BorderSizePixel = 0
            j.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            j.Parent = D
            local w = Instance.new("TextLabel")
            w.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
            w.TextColor3 = Color3.fromRGB(230, 28, 75)
            w.TextTransparency = .20000000298023
            if not s.rich then
                w.Text = s.title or "Skibidi"
            else
                w.RichText = true
                w.Text = s.richtext or "<font color='rgb(255,0,0)'>rdggdrgsessg</font> user"
            end
            w.Name = "ModuleName"
            w.Size = UDim2.new(0, 205, 0, 13)
            w.AnchorPoint = Vector2.new(0, .5)
            w.Position = UDim2.new(.072999998927116, 0, .23999999463558, 0)
            w.BackgroundTransparency = 1
            w.TextXAlignment = Enum.TextXAlignment.Left
            w.BorderSizePixel = 0
            w.BorderColor3 = Color3.fromRGB(0, 0, 0)
            w.TextSize = 13
            w.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            w.Parent = D
            local v = Instance.new("TextLabel")
            v.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
            v.TextColor3 = Color3.fromRGB(120, 0, 0)
            v.TextTransparency = .69999998807907
            v.Text = s.description
            v.Name = "Description"
            v.Size = UDim2.new(0, 205, 0, 13)
            v.AnchorPoint = Vector2.new(0, .5)
            v.Position = UDim2.new(.072999998927116, 0, .41999998688698, 0)
            v.BackgroundTransparency = 1
            v.TextXAlignment = Enum.TextXAlignment.Left
            v.BorderSizePixel = 0
            v.BorderColor3 = Color3.fromRGB(0, 0, 0)
            v.TextSize = 10
            v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            v.Parent = D
            local Q = Instance.new("Frame")
            Q.Name = "Toggle"
            Q.BackgroundTransparency = .69999998807907
            Q.Position = UDim2.new(.81999999284744, 0, .75700002908707, 0)
            Q.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Q.Size = UDim2.new(0, 25, 0, 12)
            Q.BorderSizePixel = 0
            Q.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Q.Parent = D
            local k = Instance.new("UICorner")
            k.CornerRadius = UDim.new(1, 0)
            k.Parent = Q
            local E = Instance.new("Frame")
            E.BorderColor3 = Color3.fromRGB(0, 0, 0)
            E.AnchorPoint = Vector2.new(0, .5)
            E.BackgroundTransparency = .20000000298023
            E.Position = UDim2.new(0, 0, .5, 0)
            E.Name = "Circle"
            E.Size = UDim2.new(0, 12, 0, 12)
            E.BorderSizePixel = 0
            E.BackgroundColor3 = Color3.fromRGB(66, 80, 115)
            E.Parent = Q
            local i = Instance.new("UICorner")
            i.CornerRadius = UDim.new(1, 0)
            i.Parent = E
            local M = Instance.new("Frame")
            M.Name = "Keybind"
            M.BackgroundTransparency = .69999998807907
            M.Position = UDim2.new(.15000000596046, 0, .73500001430511, 0)
            M.BorderColor3 = Color3.fromRGB(0, 0, 0)
            M.Size = UDim2.new(0, 33, 0, 15)
            M.BorderSizePixel = 0
            M.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
            M.Parent = D
            local g = Instance.new("UICorner")
            g.CornerRadius = UDim.new(0, 3)
            g.Parent = M
            local c = Instance.new("TextLabel")
            c.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
            c.TextColor3 = Color3.fromRGB(209, 222, 255)
            c.BorderColor3 = Color3.fromRGB(0, 0, 0)
            c.Text = "None"
            c.AnchorPoint = Vector2.new(.5, .5)
            c.Size = UDim2.new(0, 25, 0, 13)
            c.BackgroundTransparency = 1
            c.TextXAlignment = Enum.TextXAlignment.Left
            c.Position = UDim2.new(.5, 0, .5, 0)
            c.BorderSizePixel = 0
            c.TextSize = 10
            c.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            c.Parent = M
            local Y = Instance.new("Frame")
            Y.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Y.AnchorPoint = Vector2.new(.5, 0)
            Y.BackgroundTransparency = .5
            Y.Position = UDim2.new(.5, 0, .62000000476837, 0)
            Y.Name = "Divider"
            Y.Size = UDim2.new(0, 241, 0, 1)
            Y.BorderSizePixel = 0
            Y.BackgroundColor3 = Color3.fromRGB(52, 66, 89)
            Y.Parent = D
            local r = Instance.new("Frame")
            r.BorderColor3 = Color3.fromRGB(0, 0, 0)
            r.AnchorPoint = Vector2.new(.5, 0)
            r.BackgroundTransparency = .5
            r.Position = UDim2.new(.5, 0, 1, 0)
            r.Name = "Divider"
            r.Size = UDim2.new(0, 241, 0, 1)
            r.BorderSizePixel = 0
            r.BackgroundColor3 = Color3.fromRGB(52, 66, 89)
            r.Parent = D
            local P = Instance.new("Frame")
            P.Name = "Options"
            P.BackgroundTransparency = 1
            P.Position = UDim2.new(0, 0, 1, 0)
            P.BorderColor3 = Color3.fromRGB(0, 0, 0)
            P.Size = UDim2.new(0, 241, 0, 8)
            P.BorderSizePixel = 0
            P.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            P.Parent = Z
            local S = Instance.new("UIPadding")
            S.PaddingTop = UDim.new(0, 8)
            S.Parent = P
            local m = Instance.new("UIListLayout")
            m.Padding = UDim.new(0, 5)
            m.HorizontalAlignment = Enum.HorizontalAlignment.Center
            m.SortOrder = Enum.SortOrder.LayoutOrder
            m.Parent = P
            function y.change_state(f, b)
                f._state = b
                if f._state then
                    (O:Create(Z, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Size = UDim2.fromOffset(241, (93 + f._size) + f._multiplier)
                    })):Play();
                    (O:Create(Q, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(120, 0, 0)
                    })):Play();
                    (O:Create(E, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(120, 0, 0),
                        Position = UDim2.fromScale(.53, .5)
                    })):Play()
                else
                    (O:Create(Z, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Size = UDim2.fromOffset(241, 93)
                    })):Play();
                    (O:Create(Q, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    })):Play();
                    (O:Create(E, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(66, 80, 115),
                        Position = UDim2.fromScale(0, .5)
                    })):Play()
                end;
                (n._config._flags)[s.flag] = f._state
                h:save(game.GameId, n._config)
                s.callback(f._state)
            end
            function y.connect_keybind(b)
                if not (n._config._keybinds)[s.flag] then
                    return
                end;
                (F)[s.flag .. "_keybind"] = I.InputBegan:Connect(function(f, I)
                    if I then
                        return
                    end
                    if tostring(f.KeyCode) ~= (n._config._keybinds)[s.flag] then
                        return
                    end
                    b:change_state(not b._state)
                end)
            end
            function y.scale_keybind(f, b)
                if (n._config._keybinds)[s.flag] and not b then
                    local b = string.gsub(tostring((n._config._keybinds)[s.flag]), "Enum.KeyCode.", "")
                    local f = Instance.new("GetTextBoundsParams")
                    f.Text = b
                    f.Font = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold)
                    f.Size = 10
                    f.Width = 10000
                    local I = z:GetTextBoundsAsync(f)
                    M.Size = UDim2.fromOffset(I.X + 6, 15)
                    c.Size = UDim2.fromOffset(I.X, 13)
                else
                    M.Size = UDim2.fromOffset(31, 15)
                    c.Size = UDim2.fromOffset(25, 13)
                end
            end
            if n:flag_type(s.flag, "boolean") then
                y._state = true
                s.callback(y._state)
                Q.BackgroundColor3 = Color3.fromRGB(230, 28, 75)
                E.BackgroundColor3 = Color3.fromRGB(230, 28, 75)
                E.Position = UDim2.fromScale(.53, .5)
            end
            if (n._config._keybinds)[s.flag] then
                local b = string.gsub(tostring((n._config._keybinds)[s.flag]), "Enum.KeyCode.", "")
                c.Text = b
                y:connect_keybind()
                y:scale_keybind()
            end;
            (F)[s.flag .. "_input_began"] = D.InputBegan:Connect(function(b)
                if n._choosing_keybind then
                    return
                end
                if b.UserInputType ~= Enum.UserInputType.MouseButton3 then
                    return
                end
                n._choosing_keybind = true
                F.keybind_choose_start = I.InputBegan:Connect(function(b, f)
                    if f then
                        return
                    end
                    if b == Enum.UserInputState or b == Enum.UserInputType then
                        return
                    end
                    if b.KeyCode == Enum.KeyCode.Unknown then
                        return
                    end
                    if b.KeyCode == Enum.KeyCode.Backspace then
                        y:scale_keybind(true);
                        (n._config._keybinds)[s.flag] = nil
                        h:save(game.GameId, n._config)
                        c.Text = "None"
                        if (F)[s.flag .. "_keybind"] then
                            (F)[s.flag .. "_keybind"]:Disconnect();
                            (F)[s.flag .. "_keybind"] = nil
                        end
                        F.keybind_choose_start:Disconnect()
                        F.keybind_choose_start = nil
                        n._choosing_keybind = false
                        return
                    end
                    F.keybind_choose_start:Disconnect()
                    F.keybind_choose_start = nil;
                    (n._config._keybinds)[s.flag] = tostring(b.KeyCode)
                    h:save(game.GameId, n._config)
                    if (F)[s.flag .. "_keybind"] then
                        (F)[s.flag .. "_keybind"]:Disconnect();
                        (F)[s.flag .. "_keybind"] = nil
                    end
                    y:connect_keybind()
                    y:scale_keybind()
                    n._choosing_keybind = false
                    local I = string.gsub(tostring((n._config._keybinds)[s.flag]), "Enum.KeyCode.", "")
                    c.Text = I
                end)
            end)
            D.MouseButton1Click:Connect(function()
                y:change_state(not y._state)
            end)
            function y.create_paragraph(b, s)
                a = a + 1
                local f = {}
                if b._size == 0 then
                    b._size = 11
                end
                b._size = b._size + (s.customScale or 70)
                if y._state then
                    Z.Size = UDim2.fromOffset(241, 93 + b._size)
                end
                P.Size = UDim2.fromOffset(241, b._size)
                local I = Instance.new("Frame")
                I.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
                I.BackgroundTransparency = .2
                I.Size = UDim2.new(0, 207, 0, 30)
                I.BorderSizePixel = 0
                I.Name = "Paragraph"
                I.AutomaticSize = Enum.AutomaticSize.Y
                I.Parent = P
                I.LayoutOrder = a
                local z = Instance.new("UICorner")
                z.CornerRadius = UDim.new(0, 4)
                z.Parent = I
                local N = Instance.new("TextLabel")
                N.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                N.TextColor3 = Color3.fromRGB(210, 210, 210)
                N.Text = s.title or "Title"
                N.Size = UDim2.new(1, - 10, 0, 20)
                N.Position = UDim2.new(0, 5, 0, 5)
                N.BackgroundTransparency = 1
                N.TextXAlignment = Enum.TextXAlignment.Left
                N.TextYAlignment = Enum.TextYAlignment.Center
                N.TextSize = 12
                N.AutomaticSize = Enum.AutomaticSize.XY
                N.Parent = I
                local G = Instance.new("TextLabel")
                G.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                G.TextColor3 = Color3.fromRGB(255, 200, 200)
                if not s.rich then
                    G.Text = s.text or "Skibidi"
                else
                    G.RichText = true
                    G.Text = s.richtext or "<font color='rgb(255,0,0)'>rgdrdrdgdgdr</font> user"
                end
                G.Size = UDim2.new(1, - 10, 0, 20)
                G.Position = UDim2.new(0, 5, 0, 30)
                G.BackgroundTransparency = 1
                G.TextXAlignment = Enum.TextXAlignment.Left
                G.TextYAlignment = Enum.TextYAlignment.Top
                G.TextSize = 11
                G.TextWrapped = true
                G.AutomaticSize = Enum.AutomaticSize.XY
                G.Parent = I
                I.MouseEnter:Connect(function()
                    (O:Create(I, TweenInfo.new(.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(42, 50, 66)
                    })):Play()
                end)
                I.MouseLeave:Connect(function()
                    (O:Create(I, TweenInfo.new(.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(120, 0, 0)
                    })):Play()
                end)
                return f
            end
            function y.create_text(b, s)
                a = a + 1
                local f = {}
                if b._size == 0 then
                    b._size = 11
                end
                b._size = b._size + (s.customScale or 50)
                if y._state then
                    Z.Size = UDim2.fromOffset(241, 93 + b._size)
                end
                P.Size = UDim2.fromOffset(241, b._size)
                local I = Instance.new("Frame")
                I.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
                I.BackgroundTransparency = .2
                I.Size = UDim2.new(0, 207, 0, s.CustomYSize)
                I.BorderSizePixel = 0
                I.Name = "Text"
                I.AutomaticSize = Enum.AutomaticSize.Y
                I.Parent = P
                I.LayoutOrder = a
                local z = Instance.new("UICorner")
                z.CornerRadius = UDim.new(0, 4)
                z.Parent = I
                local N = Instance.new("TextLabel")
                N.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                N.TextColor3 = Color3.fromRGB(255, 200, 200)
                if not s.rich then
                    N.Text = s.text or "Skibidi"
                else
                    N.RichText = true
                    N.Text = s.richtext or "<font color='rgb(255,0,0)'>dfgdgdfgrggdfgdrgd</font> user"
                end
                N.Size = UDim2.new(1, - 10, 1, 0)
                N.Position = UDim2.new(0, 5, 0, 5)
                N.BackgroundTransparency = 1
                N.TextXAlignment = Enum.TextXAlignment.Left
                N.TextYAlignment = Enum.TextYAlignment.Top
                N.TextSize = 10
                N.TextWrapped = true
                N.AutomaticSize = Enum.AutomaticSize.XY
                N.Parent = I
                I.MouseEnter:Connect(function()
                    (O:Create(I, TweenInfo.new(.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(42, 50, 66)
                    })):Play()
                end)
                I.MouseLeave:Connect(function()
                    (O:Create(I, TweenInfo.new(.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(120, 0, 0)
                    })):Play()
                end)
                function f.Set(b, s)
                    if not s.rich then
                        N.Text = s.text or "Skibidi"
                    else
                        N.RichText = true
                        N.Text = s.richtext or "<font color='rgb(255,0,0)'>rdgfdfgdfg</font> user"
                    end
                end
                return f
            end
            function y.create_textbox(b, s)
                a = a + 1
                local f = {
                    _text = ""
                }
                if b._size == 0 then
                    b._size = 11
                end
                b._size = b._size + 32
                if y._state then
                    Z.Size = UDim2.fromOffset(241, 93 + b._size)
                end
                P.Size = UDim2.fromOffset(241, b._size)
                local I = Instance.new("TextLabel")
                I.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                I.TextColor3 = Color3.fromRGB(255, 255, 255)
                I.TextTransparency = .2
                I.Text = s.title or "Enter text"
                I.Size = UDim2.new(0, 207, 0, 13)
                I.AnchorPoint = Vector2.new(0, 0)
                I.Position = UDim2.new(0, 0, 0, 0)
                I.BackgroundTransparency = 1
                I.TextXAlignment = Enum.TextXAlignment.Left
                I.BorderSizePixel = 0
                I.Parent = P
                I.TextSize = 10
                I.LayoutOrder = a
                local O = Instance.new("TextBox")
                O.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                O.TextColor3 = Color3.fromRGB(255, 255, 255)
                O.BorderColor3 = Color3.fromRGB(0, 0, 0)
                O.PlaceholderText = s.placeholder or "Enter text..."
                O.Text = (n._config._flags)[s.flag] or ""
                O.Name = "Textbox"
                O.Size = UDim2.new(0, 207, 0, 15)
                O.BorderSizePixel = 0
                O.TextSize = 10
                O.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
                O.BackgroundTransparency = .9
                O.ClearTextOnFocus = false
                O.Parent = P
                O.LayoutOrder = a
                local z = Instance.new("UICorner")
                z.CornerRadius = UDim.new(0, 4)
                z.Parent = O
                function f.update_text(f, b)
                    f._text = b;
                    (n._config._flags)[s.flag] = f._text
                    h:save(game.GameId, n._config)
                    s.callback(f._text)
                end
                if n:flag_type(s.flag, "string") then
                    f:update_text((n._config._flags)[s.flag])
                end
                O.FocusLost:Connect(function()
                    f:update_text(O.Text)
                end)
                return f
            end
            function y.create_checkbox(b, s)
                a = a + 1
                local z = {
                    _state = false
                }
                if b._size == 0 then
                    b._size = 11
                end
                b._size = b._size + 20
                if y._state then
                    Z.Size = UDim2.fromOffset(241, 93 + b._size)
                end
                P.Size = UDim2.fromOffset(241, b._size)
                local N = Instance.new("TextButton")
                N.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                N.TextColor3 = Color3.fromRGB(0, 0, 0)
                N.BorderColor3 = Color3.fromRGB(0, 0, 0)
                N.Text = ""
                N.AutoButtonColor = false
                N.BackgroundTransparency = 1
                N.Name = "Checkbox"
                N.Size = UDim2.new(0, 207, 0, 15)
                N.BorderSizePixel = 0
                N.TextSize = 14
                N.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                N.Parent = P
                N.LayoutOrder = a
                local G = Instance.new("TextLabel")
                G.Name = "TitleLabel"
                if f == "th" then
                    G.FontFace = Font.new("rbxasset://fonts/families/NotoSansThai.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                    G.TextSize = 13
                else
                    G.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                    G.TextSize = 11
                end
                G.TextColor3 = Color3.fromRGB(255, 255, 255)
                G.TextTransparency = .2
                G.Text = s.title or "Skibidi"
                G.Size = UDim2.new(0, 142, 0, 13)
                G.AnchorPoint = Vector2.new(0, .5)
                G.Position = UDim2.new(0, 0, .5, 0)
                G.BackgroundTransparency = 1
                G.TextXAlignment = Enum.TextXAlignment.Left
                G.Parent = N
                local J = Instance.new("Frame")
                J.Name = "KeybindBox"
                J.Size = UDim2.fromOffset(14, 14)
                J.Position = UDim2.new(1, - 35, .5, 0)
                J.AnchorPoint = Vector2.new(0, .5)
                J.BackgroundColor3 = Color3.fromRGB(230, 28, 75)
                J.BorderSizePixel = 0
                J.Parent = N
                local D = Instance.new("UICorner")
                D.CornerRadius = UDim.new(0, 4)
                D.Parent = J
                local X = Instance.new("TextLabel")
                X.Name = "KeybindLabel"
                X.Size = UDim2.new(1, 0, 1, 0)
                X.BackgroundTransparency = 1
                X.TextColor3 = Color3.fromRGB(0, 0, 0)
                X.TextScaled = false
                X.TextSize = 10
                X.Font = Enum.Font.SourceSans
                X.Text = (n._config._keybinds)[s.flag] and string.gsub(tostring((n._config._keybinds)[s.flag]), "Enum.KeyCode.", "") or "..."
                X.Parent = J
                local j = Instance.new("Frame")
                j.BorderColor3 = Color3.fromRGB(0, 0, 0)
                j.AnchorPoint = Vector2.new(1, .5)
                j.BackgroundTransparency = .9
                j.Position = UDim2.new(1, 0, .5, 0)
                j.Name = "Box"
                j.Size = UDim2.new(0, 15, 0, 15)
                j.BorderSizePixel = 0
                j.BackgroundColor3 = Color3.fromRGB(230, 28, 75)
                j.Parent = N
                local w = Instance.new("UICorner")
                w.CornerRadius = UDim.new(0, 4)
                w.Parent = j
                local v = Instance.new("Frame")
                v.AnchorPoint = Vector2.new(.5, .5)
                v.BackgroundTransparency = .2
                v.Position = UDim2.new(.5, 0, .5, 0)
                v.BorderColor3 = Color3.fromRGB(0, 0, 0)
                v.Name = "Fill"
                v.BorderSizePixel = 0
                v.BackgroundColor3 = Color3.fromRGB(230, 28, 75)
                v.Parent = j
                local Q = Instance.new("UICorner")
                Q.CornerRadius = UDim.new(0, 3)
                Q.Parent = v
                function z.change_state(f, b)
                    f._state = b
                    if f._state then
                        (O:Create(j, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            BackgroundTransparency = .7
                        })):Play();
                        (O:Create(v, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(9, 9)
                        })):Play()
                    else
                        (O:Create(j, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            BackgroundTransparency = .9
                        })):Play();
                        (O:Create(v, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(0, 0)
                        })):Play()
                    end;
                    (n._config._flags)[s.flag] = f._state
                    h:save(game.GameId, n._config)
                    s.callback(f._state)
                end
                if n:flag_type(s.flag, "boolean") then
                    z:change_state((n._config._flags)[s.flag])
                end
                N.MouseButton1Click:Connect(function()
                    z:change_state(not z._state)
                end)
                N.InputBegan:Connect(function(b, f)
                    if f then
                        return
                    end
                    if b.UserInputType ~= Enum.UserInputType.MouseButton3 then
                        return
                    end
                    if n._choosing_keybind then
                        return
                    end
                    n._choosing_keybind = true
                    local a
                    a = I.InputBegan:Connect(function(b, f)
                        if f then
                            return
                        end
                        if b.UserInputType ~= Enum.UserInputType.Keyboard then
                            return
                        end
                        if b.KeyCode == Enum.KeyCode.Unknown then
                            return
                        end
                        if b.KeyCode == Enum.KeyCode.Backspace then
                            y:scale_keybind(true);
                            (n._config._keybinds)[s.flag] = nil
                            h:save(game.GameId, n._config)
                            X.Text = "..."
                            if (F)[s.flag .. "_keybind"] then
                                (F)[s.flag .. "_keybind"]:Disconnect();
                                (F)[s.flag .. "_keybind"] = nil
                            end
                            a:Disconnect()
                            n._choosing_keybind = false
                            return
                        end
                        a:Disconnect();
                        (n._config._keybinds)[s.flag] = tostring(b.KeyCode)
                        h:save(game.GameId, n._config)
                        if (F)[s.flag .. "_keybind"] then
                            (F)[s.flag .. "_keybind"]:Disconnect();
                            (F)[s.flag .. "_keybind"] = nil
                        end
                        y:connect_keybind()
                        y:scale_keybind()
                        n._choosing_keybind = false
                        local I = string.gsub(tostring((n._config._keybinds)[s.flag]), "Enum.KeyCode.", "")
                        X.Text = I
                    end)
                end)
                local k = I.InputBegan:Connect(function(b, f)
                    if f then
                        return
                    end
                    if b.UserInputType == Enum.UserInputType.Keyboard then
                        local f = (n._config._keybinds)[s.flag]
                        if f and tostring(b.KeyCode) == f then
                            z:change_state(not z._state)
                        end
                    end
                end);
                (F)[s.flag .. "_keypress"] = k
                return z
            end
            function y.create_divider(b, s)
                a = a + 1
                if b._size == 0 then
                    b._size = 11
                end
                b._size = b._size + 27
                if y._state then
                    Z.Size = UDim2.fromOffset(241, 93 + b._size)
                end
                local f = 1
                local I = 207
                local O = Instance.new("Frame")
                O.Size = UDim2.new(0, I, 0, 20)
                O.BackgroundTransparency = 1
                O.Name = "OuterFrame"
                O.Parent = P
                O.LayoutOrder = a
                if s and s.showtopic then
                    local b = Instance.new("TextLabel")
                    b.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                    b.TextColor3 = Color3.fromRGB(255, 255, 255)
                    b.TextTransparency = 0
                    b.Text = s.title
                    b.Size = UDim2.new(0, 153, 0, 13)
                    b.Position = UDim2.new(.5, 0, .501, 0)
                    b.BackgroundTransparency = 1
                    b.TextXAlignment = Enum.TextXAlignment.Center
                    b.BorderSizePixel = 0
                    b.AnchorPoint = Vector2.new(.5, .5)
                    b.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    b.TextSize = 11
                    b.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    b.ZIndex = 3
                    b.TextStrokeTransparency = 0
                    b.Parent = O
                end
                if not s or s and not s.disableline then
                    local s = Instance.new("Frame")
                    s.Size = UDim2.new(1, 0, 0, f)
                    s.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    s.BorderSizePixel = 0
                    s.Name = "Divider"
                    s.Parent = O
                    s.ZIndex = 2
                    s.Position = UDim2.new(0, 0, .5, - f / 2)
                    local b = Instance.new("UIGradient")
                    b.Parent = s
                    b.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255, 0))
                    })
                    b.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1);
                        NumberSequenceKeypoint.new(.5, 0),
                        NumberSequenceKeypoint.new(1, 1)
                    })
                    b.Rotation = 0
                    local I = Instance.new("UICorner")
                    I.CornerRadius = UDim.new(0, 2)
                    I.Parent = s
                end
                return true
            end
            function y.create_slider(b, s)
                a = a + 1
                local f = {}
                if b._size == 0 then
                    b._size = 11
                end
                b._size = b._size + 27
                if y._state then
                    Z.Size = UDim2.fromOffset(241, 93 + b._size)
                end
                P.Size = UDim2.fromOffset(241, b._size)
                local z = Instance.new("TextButton")
                z.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                z.TextSize = 14
                z.TextColor3 = Color3.fromRGB(0, 0, 0)
                z.BorderColor3 = Color3.fromRGB(0, 0, 0)
                z.Text = ""
                z.AutoButtonColor = false
                z.BackgroundTransparency = 1
                z.Name = "Slider"
                z.Size = UDim2.new(0, 207, 0, 22)
                z.BorderSizePixel = 0
                z.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                z.Parent = P
                z.LayoutOrder = a
                local N = Instance.new("TextLabel")
                if GG.SelectedLanguage == "th" then
                    N.FontFace = Font.new("rbxasset://fonts/families/NotoSansThai.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                    N.TextSize = 13
                else
                    N.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                    N.TextSize = 11
                end
                N.TextColor3 = Color3.fromRGB(255, 255, 255)
                N.TextTransparency = .20000000298023
                N.Text = s.title
                N.Size = UDim2.new(0, 153, 0, 13)
                N.Position = UDim2.new(0, 0, .050000000745058, 0)
                N.BackgroundTransparency = 1
                N.TextXAlignment = Enum.TextXAlignment.Left
                N.BorderSizePixel = 0
                N.BorderColor3 = Color3.fromRGB(0, 0, 0)
                N.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                N.Parent = z
                local G = Instance.new("Frame")
                G.BorderColor3 = Color3.fromRGB(0, 0, 0)
                G.AnchorPoint = Vector2.new(.5, 1)
                G.BackgroundTransparency = .89999997615814
                G.Position = UDim2.new(.5, 0, .94999998807907, 0)
                G.Name = "Drag"
                G.Size = UDim2.new(0, 207, 0, 4)
                G.BorderSizePixel = 0
                G.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
                G.Parent = z
                local J = Instance.new("UICorner")
                J.CornerRadius = UDim.new(1, 0)
                J.Parent = G
                local D = Instance.new("Frame")
                D.BorderColor3 = Color3.fromRGB(0, 0, 0)
                D.AnchorPoint = Vector2.new(0, .5)
                D.BackgroundTransparency = .5
                D.Position = UDim2.new(0, 0, .5, 0)
                D.Name = "Fill"
                D.Size = UDim2.new(0, 103, 0, 4)
                D.BorderSizePixel = 0
                D.BackgroundColor3 = Color3.fromRGB(230, 28, 75)
                D.Parent = G
                local j = Instance.new("UICorner")
                j.CornerRadius = UDim.new(0, 3)
                j.Parent = D
                local w = Instance.new("UIGradient")
                w.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255));
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(79, 79, 79))
                })
                w.Parent = D
                local v = Instance.new("Frame")
                v.AnchorPoint = Vector2.new(1, .5)
                v.Name = "Circle"
                v.Position = UDim2.new(1, 0, .5, 0)
                v.BorderColor3 = Color3.fromRGB(0, 0, 0)
                v.Size = UDim2.new(0, 6, 0, 6)
                v.BorderSizePixel = 0
                v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v.Parent = D
                local Q = Instance.new("UICorner")
                Q.CornerRadius = UDim.new(1, 0)
                Q.Parent = v
                local k = Instance.new("TextLabel")
                k.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                k.TextColor3 = Color3.fromRGB(255, 255, 255)
                k.TextTransparency = .20000000298023
                k.Text = "50"
                k.Name = "Value"
                k.Size = UDim2.new(0, 42, 0, 13)
                k.AnchorPoint = Vector2.new(1, 0)
                k.Position = UDim2.new(1, 0, 0, 0)
                k.BackgroundTransparency = 1
                k.TextXAlignment = Enum.TextXAlignment.Right
                k.BorderSizePixel = 0
                k.BorderColor3 = Color3.fromRGB(0, 0, 0)
                k.TextSize = 10
                k.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                k.Parent = z
                function f.set_percentage(f, b)
                    local I = 0
                    if s.round_number then
                        I = math.floor(b)
                    else
                        I = math.floor(b * 10) / 10
                    end
                    b = (b - s.minimum_value) / (s.maximum_value - s.minimum_value)
                    local a = math.clamp(b, .02, 1) * G.Size.X.Offset
                    local y = math.clamp(I, s.minimum_value, s.maximum_value);
                    (n._config._flags)[s.flag] = y
                    k.Text = y;
                    (O:Create(D, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Size = UDim2.fromOffset(a, G.Size.Y.Offset)
                    })):Play()
                    s.callback(y)
                end
                function f.update(b)
                    local f = (X.X - G.AbsolutePosition.X) / G.Size.X.Offset
                    local I = s.minimum_value + (s.maximum_value - s.minimum_value) * f
                    b:set_percentage(I)
                end
                function f.input(b)
                    f:update();
                    (F)["slider_drag_" .. s.flag] = X.Move:Connect(function()
                        f:update()
                    end);
                    (F)["slider_input_" .. s.flag] = I.InputEnded:Connect(function(b, f)
                        if b.UserInputType ~= Enum.UserInputType.MouseButton1 and b.UserInputType ~= Enum.UserInputType.Touch then
                            return
                        end
                        F:disconnect("slider_drag_" .. s.flag)
                        F:disconnect("slider_input_" .. s.flag)
                        if not s.ignoresaved then
                            h:save(game.GameId, n._config)
                        end
                    end)
                end
                if n:flag_type(s.flag, "number") then
                    if not s.ignoresaved then
                        f:set_percentage((n._config._flags)[s.flag])
                    else
                        f:set_percentage(s.value)
                    end
                else
                    f:set_percentage(s.value)
                end
                z.MouseButton1Down:Connect(function()
                    f:input()
                end)
                return f
            end
            function y.create_dropdown(b, s)
                if not s.Order then
                    a = a + 1
                end
                local f = {
                    _state = false;
                    _size = 0
                }
                if not s.Order then
                    if b._size == 0 then
                        b._size = 11
                    end
                    b._size = b._size + 44
                end
                if not s.Order then
                    if y._state then
                        Z.Size = UDim2.fromOffset(241, 93 + b._size)
                    end
                    P.Size = UDim2.fromOffset(241, b._size)
                end
                local I = Instance.new("TextButton")
                I.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                I.TextColor3 = Color3.fromRGB(0, 0, 0)
                I.BorderColor3 = Color3.fromRGB(0, 0, 0)
                I.Text = ""
                I.AutoButtonColor = false
                I.BackgroundTransparency = 1
                I.Name = "Dropdown"
                I.Size = UDim2.new(0, 207, 0, 39)
                I.BorderSizePixel = 0
                I.TextSize = 14
                I.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                I.Parent = P
                if not s.Order then
                    I.LayoutOrder = a
                else
                    I.LayoutOrder = s.OrderValue
                end
                if not (n._config._flags)[s.flag] then
                    (n._config._flags)[s.flag] = {}
                end
                local z = Instance.new("TextLabel")
                if GG.SelectedLanguage == "th" then
                    z.FontFace = Font.new("rbxasset://fonts/families/NotoSansThai.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                    z.TextSize = 13
                else
                    z.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                    z.TextSize = 11
                end
                z.TextColor3 = Color3.fromRGB(255, 255, 255)
                z.TextTransparency = .20000000298023
                z.Text = s.title
                z.Size = UDim2.new(0, 207, 0, 13)
                z.BackgroundTransparency = 1
                z.TextXAlignment = Enum.TextXAlignment.Left
                z.BorderSizePixel = 0
                z.BorderColor3 = Color3.fromRGB(0, 0, 0)
                z.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                z.Parent = I
                local N = Instance.new("Frame")
                N.ClipsDescendants = true
                N.BorderColor3 = Color3.fromRGB(0, 0, 0)
                N.AnchorPoint = Vector2.new(.5, 0)
                N.BackgroundTransparency = .89999997615814
                N.Position = UDim2.new(.5, 0, 1.2000000476837, 0)
                N.Name = "Box"
                N.Size = UDim2.new(0, 207, 0, 22)
                N.BorderSizePixel = 0
                N.BackgroundColor3 = Color3.fromRGB(230, 28, 75)
                N.Parent = z
                local G = Instance.new("UICorner")
                G.CornerRadius = UDim.new(0, 4)
                G.Parent = N
                local J = Instance.new("Frame")
                J.BorderColor3 = Color3.fromRGB(0, 0, 0)
                J.AnchorPoint = Vector2.new(.5, 0)
                J.BackgroundTransparency = 1
                J.Position = UDim2.new(.5, 0, 0, 0)
                J.Name = "Header"
                J.Size = UDim2.new(0, 207, 0, 22)
                J.BorderSizePixel = 0
                J.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                J.Parent = N
                local D = Instance.new("TextLabel")
                D.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                D.TextColor3 = Color3.fromRGB(255, 255, 255)
                D.TextTransparency = .20000000298023
                D.Name = "CurrentOption"
                D.Size = UDim2.new(0, 161, 0, 13)
                D.AnchorPoint = Vector2.new(0, .5)
                D.Position = UDim2.new(.049999881535769, 0, .5, 0)
                D.BackgroundTransparency = 1
                D.TextXAlignment = Enum.TextXAlignment.Left
                D.BorderSizePixel = 0
                D.BorderColor3 = Color3.fromRGB(0, 0, 0)
                D.TextSize = 10
                D.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                D.Parent = J
                local X = Instance.new("UIGradient")
                X.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(.704, 0);
                    NumberSequenceKeypoint.new(.872, .36250001192093);
                    NumberSequenceKeypoint.new(1, 1)
                })
                X.Parent = D
                local j = Instance.new("ImageLabel")
                j.BorderColor3 = Color3.fromRGB(0, 0, 0)
                j.AnchorPoint = Vector2.new(0, .5)
                j.Image = "rbxassetid://84232453189324"
                j.BackgroundTransparency = 1
                j.Position = UDim2.new(.91000002622604, 0, .5, 0)
                j.Name = "Arrow"
                j.Size = UDim2.new(0, 8, 0, 8)
                j.BorderSizePixel = 0
                j.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                j.Parent = J
                local F = Instance.new("ScrollingFrame")
                F.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
                F.Active = true
                F.ScrollBarImageTransparency = 1
                F.AutomaticCanvasSize = Enum.AutomaticSize.XY
                F.ScrollBarThickness = 0
                F.Name = "Options"
                F.Size = UDim2.new(0, 207, 0, 0)
                F.BackgroundTransparency = 1
                F.Position = UDim2.new(0, 0, 1, 0)
                F.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                F.BorderColor3 = Color3.fromRGB(0, 0, 0)
                F.BorderSizePixel = 0
                F.CanvasSize = UDim2.new(0, 0, .5, 0)
                F.Parent = N
                local w = Instance.new("UIListLayout")
                w.SortOrder = Enum.SortOrder.LayoutOrder
                w.Parent = F
                local v = Instance.new("UIPadding")
                v.PaddingTop = UDim.new(0, - 1)
                v.PaddingLeft = UDim.new(0, 10)
                v.Parent = F
                local Q = Instance.new("UIListLayout")
                Q.SortOrder = Enum.SortOrder.LayoutOrder
                Q.Parent = N
                function f.update(f, b)
                    if s.multi_dropdown then
                        if not (n._config._flags)[s.flag] then
                            (n._config._flags)[s.flag] = {}
                        end
                        local f = nil
                        if # (n._config._flags)[s.flag] > 0 then
                            f = convertTableToString((n._config._flags)[s.flag])
                        end
                        local I = {}
                        if f then
                            for s in string.gmatch(f, "([^,]+)") do
                                local b = s:match("^%s*(.-)%s*$")
                                if b ~= "Label" then
                                    table.insert(I, b)
                                end
                            end
                        else
                            for s in string.gmatch(D.Text, "([^,]+)") do
                                local b = s:match("^%s*(.-)%s*$")
                                if b ~= "Label" then
                                    table.insert(I, b)
                                end
                            end
                        end
                        local a = convertStringToTable(D.Text)
                        optionSkibidi = "nil"
                        if typeof(b) ~= "string" then
                            optionSkibidi = b.Name
                        else
                            optionSkibidi = b
                        end
                        local O = false
                        for s, b in pairs(a) do
                            if b == optionSkibidi then
                                table.remove(a, s)
                                break
                            end
                        end
                        D.Text = table.concat(I, ", ")
                        local y = {}
                        for s, b in F:GetChildren() do
                            if b.Name == "Option" then
                                table.insert(y, b.Text)
                                if table.find(I, b.Text) then
                                    b.TextTransparency = .2
                                else
                                    b.TextTransparency = .6
                                end
                            end
                        end
                        f = convertStringToTable(D.Text)
                        for s, b in f do
                            if not table.find(y, b) and table.find(I, b) then
                                table.remove(I, s)
                            end
                        end
                        D.Text = table.concat(I, ", ");
                        (n._config._flags)[s.flag] = convertStringToTable(D.Text)
                    else
                        D.Text = typeof(b) == "string" and b or b.Name
                        for s, b in F:GetChildren() do
                            if b.Name == "Option" then
                                if b.Text == D.Text then
                                    b.TextTransparency = .2
                                else
                                    b.TextTransparency = .6
                                end
                            end
                        end;
                        (n._config._flags)[s.flag] = b
                    end
                    h:save(game.GameId, n._config)
                    s.callback(b)
                end
                local k = 0
                function f.unfold_settings(s)
                    s._state = not s._state
                    if s._state then
                        y._multiplier = y._multiplier + s._size
                        k = s._size;
                        (O:Create(Z, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(241, (93 + y._size) + y._multiplier)
                        })):Play();
                        (O:Create(Z.Options, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(241, y._size + y._multiplier)
                        })):Play();
                        (O:Create(I, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(207, 39 + s._size)
                        })):Play();
                        (O:Create(N, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(207, 22 + s._size)
                        })):Play();
                        (O:Create(j, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Rotation = 180
                        })):Play()
                    else
                        y._multiplier = y._multiplier - s._size
                        k = 0;
                        (O:Create(Z, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(241, (93 + y._size) + y._multiplier)
                        })):Play();
                        (O:Create(Z.Options, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(241, y._size + y._multiplier)
                        })):Play();
                        (O:Create(I, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(207, 39)
                        })):Play();
                        (O:Create(N, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = UDim2.fromOffset(207, 22)
                        })):Play();
                        (O:Create(j, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Rotation = 0
                        })):Play()
                    end
                end
                if # s.options > 0 then
                    f._size = 3
                    for b, I in s.options do
                        local a = false
                        repeat
                            local O = Instance.new("TextButton")
                            O.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                            O.Active = false
                            O.TextTransparency = .60000002384186
                            O.AnchorPoint = Vector2.new(0, .5)
                            O.TextSize = 10
                            O.Size = UDim2.new(0, 186, 0, 16)
                            O.TextColor3 = Color3.fromRGB(255, 255, 255)
                            O.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            O.Text = typeof(I) == "string" and I or I.Name
                            O.AutoButtonColor = false
                            O.Name = "Option"
                            O.BackgroundTransparency = 1
                            O.TextXAlignment = Enum.TextXAlignment.Left
                            O.Selectable = false
                            O.Position = UDim2.new(.049999881535769, 0, .34210526943207, 0)
                            O.BorderSizePixel = 0
                            O.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            O.Parent = F
                            local y = Instance.new("UIGradient")
                            y.Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 0);
                                NumberSequenceKeypoint.new(.704, 0);
                                NumberSequenceKeypoint.new(.872, .36250001192093);
                                NumberSequenceKeypoint.new(1, 1)
                            })
                            y.Parent = O
                            O.MouseButton1Click:Connect(function()
                                if not (n._config._flags)[s.flag] then
                                    (n._config._flags)[s.flag] = {}
                                end
                                if s.multi_dropdown then
                                    if table.find((n._config._flags)[s.flag], I) then
                                        n:remove_table_value((n._config._flags)[s.flag], I)
                                    else
                                        table.insert((n._config._flags)[s.flag], I)
                                    end
                                end
                                f:update(I)
                            end)
                            if b > s.maximum_options then
                                a = true
                                break
                            end
                            f._size = f._size + 16
                            F.Size = UDim2.fromOffset(207, f._size)
                            a = true
                        until true
                        if not a then
                            break
                        end
                    end
                end
                function f.New(b, s)
                    I:Destroy(true)
                    s.OrderValue = I.LayoutOrder
                    y._multiplier = y._multiplier - k
                    return y:create_dropdown(s)
                end
                if n:flag_type(s.flag, "string") then
                    f:update((n._config._flags)[s.flag])
                else
                    f:update((s.options)[1])
                end
                I.MouseButton1Click:Connect(function()
                    f:unfold_settings()
                end)
                return f
            end
            function y.create_feature(b, s)
                local f = false
                a = a + 1
                if b._size == 0 then
                    b._size = 11
                end
                b._size = b._size + 20
                if y._state then
                    Z.Size = UDim2.fromOffset(241, 93 + b._size)
                end
                P.Size = UDim2.fromOffset(241, b._size)
                local I = Instance.new("Frame")
                I.Size = UDim2.new(0, 207, 0, 16)
                I.BackgroundTransparency = 1
                I.Parent = P
                I.LayoutOrder = a
                local O = Instance.new("UIListLayout")
                O.FillDirection = Enum.FillDirection.Horizontal
                O.SortOrder = Enum.SortOrder.LayoutOrder
                O.Parent = I
                local z = Instance.new("TextButton")
                z.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                z.TextSize = 11
                z.Size = UDim2.new(1, - 35, 0, 16)
                z.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
                z.TextColor3 = Color3.fromRGB(210, 210, 210)
                z.Text = "    " .. s.title or "    Feature"
                z.AutoButtonColor = false
                z.TextXAlignment = Enum.TextXAlignment.Left
                z.TextTransparency = .2
                z.Parent = I
                local N = Instance.new("Frame")
                N.Size = UDim2.new(0, 45, 0, 16)
                N.BackgroundTransparency = 1
                N.Parent = I
                local G = Instance.new("UIListLayout")
                G.Padding = UDim.new(.1, 0)
                G.FillDirection = Enum.FillDirection.Horizontal
                G.HorizontalAlignment = Enum.HorizontalAlignment.Right
                G.SortOrder = Enum.SortOrder.LayoutOrder
                G.Parent = N
                local J = Instance.new("TextLabel")
                J.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                J.Size = UDim2.new(0, 15, 0, 15)
                J.BackgroundColor3 = Color3.fromRGB(230, 28, 75)
                J.TextColor3 = Color3.fromRGB(255, 255, 255)
                J.TextSize = 11
                J.BackgroundTransparency = 1
                J.LayoutOrder = 2
                J.Parent = N
                local D = Instance.new("TextButton")
                D.Size = UDim2.new(1, 0, 1, 0)
                D.BackgroundTransparency = 1
                D.TextTransparency = 1
                D.Parent = J
                local X = Instance.new("UICorner", J)
                X.CornerRadius = UDim.new(0, 3)
                local j = Instance.new("UIStroke", J)
                j.Color = Color3.fromRGB(120, 0, 0)
                j.Thickness = 1
                j.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                if not n._config._flags then
                    n._config._flags = {}
                end
                if not (n._config._flags)[s.flag] then
                    (n._config._flags)[s.flag] = {
                        checked = false;
                        BIND = s.default or "Unknown"
                    }
                end
                f = (n._config._flags)[s.flag].checked
                J.Text = (n._config._flags)[s.flag].BIND
                if J.Text == "Unknown" then
                    J.Text = "..."
                end
                local w = nil
                if not s.disablecheck then
                    local b = Instance.new("TextButton")
                    b.Size = UDim2.new(0, 15, 0, 15)
                    b.BackgroundColor3 = f and Color3.fromRGB(120, 0, 0) or Color3.fromRGB(120, 0, 0)
                    b.Text = ""
                    b.Parent = N
                    b.LayoutOrder = 1
                    local I = Instance.new("UIStroke", b)
                    I.Color = Color3.fromRGB(120, 0, 0)
                    I.Thickness = 1
                    I.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    local a = Instance.new("UICorner")
                    a.CornerRadius = UDim.new(0, 3)
                    a.Parent = b
                    local function O()
                        f = not f
                        b.BackgroundColor3 = f and Color3.fromRGB(120, 0, 0) or Color3.fromRGB(120, 0, 0);
                        (n._config._flags)[s.flag].checked = f
                        h:save(game.GameId, n._config)
                        if s.callback then
                            s.callback(f)
                        end
                    end
                    w = O
                    b.MouseButton1Click:Connect(O)
                else
                    w = function()
                        s.button_callback()
                    end
                end
                D.MouseButton1Click:Connect(function()
                    J.Text = "..."
                    local b
                    b = (game:GetService("UserInputService")).InputBegan:Connect(function(f, I)
                        if I then
                            return
                        end
                        if f.UserInputType == Enum.UserInputType.Keyboard then
                            local I = f.KeyCode.Name;
                            (n._config._flags)[s.flag].BIND = I
                            if I ~= "Unknown" then
                                J.Text = I
                            end
                            h:save(game.GameId, n._config)
                            b:Disconnect()
                        elseif f.UserInputType == Enum.UserInputType.MouseButton3 then
                            (n._config._flags)[s.flag].BIND = "Unknown"
                            J.Text = "..."
                            h:save(game.GameId, n._config)
                            b:Disconnect()
                        end
                    end);
                    (F)["keybind_input_" .. s.flag] = b
                end)
                local v
                v = (game:GetService("UserInputService")).InputBegan:Connect(function(b, f)
                    if f then
                        return
                    end
                    if b.UserInputType == Enum.UserInputType.Keyboard then
                        if b.KeyCode.Name == (n._config._flags)[s.flag].BIND then
                            w()
                        end
                    end
                end);
                (F)["keybind_press_" .. s.flag] = v
                z.MouseButton1Click:Connect(function()
                    if s.button_callback then
                        s.button_callback()
                    end
                end)
                if not s.disablecheck then
                    s.callback(f)
                end
                return I
            end
            return y
        end
        return y
    end
    F.library_visiblity = I.InputBegan:Connect(function(b, f)
        if b.KeyCode ~= Enum.KeyCode.Insert then
            return
        end
        s._ui_open = not s._ui_open
        s:change_visiblity(s._ui_open)
    end)
    s._ui.Container.Handler.Minimize.MouseButton1Click:Connect(function()
        s._ui_open = not s._ui_open
        s:change_visiblity(s._ui_open)
    end)
    return s
end
local W = n.new()
local E = W:create_tab("Blatant", "rbxassetid://76499042599127")
local i = W:create_tab("Player", "rbxassetid://126017907477623")
local T = W:create_tab("World", "rbxassetid://85168909131990")
local M = W:create_tab("Farm", "rbxassetid://132243429647479")
local g = W:create_tab("Misc", "rbxassetid://132243429647479")
repeat
    task.wait()
until game:IsLoaded()
local c = game:GetService("Players")
local Y = c.LocalPlayer
local r = game:GetService("ReplicatedStorage")
local P = tick()
local S = game:GetService("UserInputService")
local m = S:GetLastInputType()
local L = game:GetService("Debris")
local e = game:GetService("RunService")
local p = nil
local V = nil
local H = {}
local d = nil
local t = 1.1
local U = 1.1
local x = false
local C = 2.5
local K = "F_Key"
local R = {}
local u = game:GetService("VirtualInputManager")
local l = game:GetService("VirtualInputManager")
local B = game:GetService("GuiService")
local function A(s)
    B.SelectedObject = s
end
local function o(s)
    if s == "F_Key" then
        l:SendKeyEvent(true, Enum.KeyCode.F, false, nil)
    elseif s == "Left_Click" then
        u:SendMouseButtonEvent(0, 0, 0, true, game, 0)
    elseif s == "Navigation" then
        local s = c.LocalPlayer.PlayerGui.Hotbar.Block
        A(s)
        u:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
        u:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
        task.wait(.01)
        A(nil)
    end
end
if not LPH_OBFUSCATED then
    function LPH_JIT(s)
        return s
    end
    function LPH_JIT_MAX(s)
        return s
    end
    function LPH_NO_VIRTUALIZE(s)
        return s
    end
end
local q = nil
local sJ = {}
local bJ
local fJ
local IJ;
(LPH_NO_VIRTUALIZE(function()
    for s, b in pairs(getgc(true)) do
        if type(b) == "function" and islclosure(b) then
            local s = debug.getprotos(b)
            local f = debug.getupvalues(b)
            local I = debug.getconstants(b)
            if s and (f and (I and (# s == 4 and (# f == 24 and # I == 104)))) then
                (H)[debug.getupvalue(b, 16)] = debug.getconstant(b, 62)
                d = debug.getupvalue(b, 17);
                (H)[debug.getupvalue(b, 18)] = debug.getconstant(b, 64);
                (H)[debug.getupvalue(b, 19)] = debug.getconstant(b, 65)
                break
            end
        end
    end
end))();
(LPH_NO_VIRTUALIZE(function()
    for s, b in next, game:GetDescendants() do
        if b:IsA("RemoteEvent") and string.find(b.Name, "\n") then
            b.Changed:Once(function()
                table.insert(sJ, b)
            end)
        end
    end
end))()
repeat
    task.wait()
until # sJ == 3
local aJ = (sJ)[1]
local OJ = (sJ)[2]
local yJ = (sJ)[3]
local zJ
zJ = hookmetamethod(game, "__namecall", function(s, ...)
    local b = {
        ...
    }
    local f = getnamecallmethod()
    if not checkcaller() and (f == "FireServer" and string.find(s.Name, "\n")) then
        if (b)[2] then
            q = (b)[2]
        end
    end
    return zJ(s, ...)
end)
local ZJ
for s, b in pairs(getconnections((game:GetService("Players")).LocalPlayer.PlayerGui.Hotbar.Block.Activated)) do
    if b and (b.Function and not iscclosure(b.Function)) then
        for s, b in pairs(getupvalues(b.Function)) do
            if type(b) == "function" then
                ZJ = getupvalue(getupvalue(b, 2), 17)
                print("Parry_Key:", ZJ)
            end
        end
    end
end
local function NJ(...)
    aJ:FireServer(bJ, q, ...)
    OJ:FireServer(fJ, q, ...)
    yJ:FireServer(IJ, q, ...)
end
local function GJ(s)
    s = s or {}
    local b = {}
    local function f()
        setthreadidentity(6)
        for f, I in getgc() do
            if type(I) == "function" and islclosure(I) then
                local f = true
                local a = getinfo(I)
                if s.scriptName and not (tostring((getfenv(I)).script)):find(s.scriptName) then
                    f = false
                end
                if s.name and a.name ~= s.name then
                    f = false
                end
                if s.line and a.currentline ~= s.line then
                    f = false
                end
                if s.upvalueCount and # getupvalues(I) ~= s.upvalueCount then
                    f = false
                end
                if s.constantCount and # getconstants(I) ~= s.constantsCount then
                    f = false
                end
                if f then
                    table.insert(b, I)
                end
            end
        end
        setthreadidentity(8)
    end
    f()
    if # b == 0 then
        while task.wait(1) and # b == 0 do
            f()
        end
    end
    if # b == 1 then
        return (b)[1]
    end
end;
(getgenv()).skinChanger = false;
(getgenv()).swordModel = "";
(getgenv()).swordAnimations = "";
(getgenv()).swordFX = ""
local JJ = function()
end
if (getgenv()).updateSword and (getgenv()).skinChanger then
    (getgenv()).updateSword()
    return
end
local function DJ(s)
    s = s or {}
    local b = {}
    local function f()
        for f, I in getgc(true) do
            if type(I) == "table" then
                local f = true
                if s.highEntropyTableIndex and not rawget(I, s.highEntropyTableIndex) then
                    f = false
                end
                if f then
                    table.insert(b, I)
                end
            end
        end
    end
    f()
    if # b == 0 then
        while task.wait(1) and # b == 0 do
            f()
        end
    end
    if # b == 1 then
        return (b)[1]
    end
end
local XJ = game:GetService("Players")
local jJ = XJ.LocalPlayer
local FJ = game:GetService("ReplicatedStorage")
local wJ = ((FJ:WaitForChild("Shared", 9000000000.0)):WaitForChild("ReplicatedInstances", 9000000000.0)):WaitForChild("Swords", 9000000000.0)
local vJ = require(wJ)
local hJ
while task.wait() and not hJ do
    for s, b in getconnections(FJ.Remotes.FireSwordInfo.OnClientEvent) do
        if b.Function and islclosure(b.Function) then
            local s = getupvalues(b.Function)
            if # s == 1 and type((s)[1]) == "table" then
                hJ = (s)[1]
                break
            end
        end
    end
end
function getSlashName(s)
    local b = vJ:GetSword(s)
    return b and b.SlashName or "SlashEffect"
end
function setSword()
    if not (getgenv()).skinChanger then
        return
    end
    setupvalue(rawget(vJ, "EquipSwordTo"), 2, false)
    vJ:EquipSwordTo(jJ.Character, (getgenv()).swordModel)
    hJ:SetSword((getgenv()).swordAnimations)
end
local nJ
local QJ
while task.wait() and not QJ do
    for s, b in getconnections(FJ.Remotes.ParrySuccessAll.OnClientEvent) do
        if b.Function and (getinfo(b.Function)).name == "parrySuccessAll" then
            QJ = b
            nJ = b.Function
            b:Disable()
        end
    end
end
local kJ
while task.wait() and not kJ do
    for s, b in getconnections(FJ.Remotes.ParrySuccessClient.Event) do
        if b.Function and (getinfo(b.Function)).name == "parrySuccessAll" then
            kJ = b
            b:Disable()
        end
    end
end;
(getgenv()).slashName = getSlashName((getgenv()).swordFX)
local WJ = 0
local EJ = {}
FJ.Remotes.ParrySuccessAll.OnClientEvent:Connect(function(...)
    setthreadidentity(2)
    local s = {
        ...
    }
    if tostring((s)[4]) ~= jJ.Name then
        WJ = tick()
    elseif (getgenv()).skinChanger then
        (s)[1] = (getgenv()).slashName;
        (s)[3] = (getgenv()).swordFX
    end
    return nJ(unpack(s))
end)
table.insert(EJ, ((getconnections(FJ.Remotes.ParrySuccessAll.OnClientEvent)))[1]);
(getgenv()).updateSword = function()
    (getgenv()).slashName = getSlashName((getgenv()).swordFX)
    setSword()
end
task.spawn(function()
    while task.wait(1) do
        if (getgenv()).skinChanger then
            local s = jJ.Character or jJ.CharacterAdded:Wait()
            if jJ:GetAttribute("CurrentlyEquippedSword") ~= (getgenv()).swordModel then
                setSword()
            end
            if s and not s:FindFirstChild((getgenv()).swordModel) then
                setSword()
            end
            for s, b in s and s:GetChildren() or {} do
                if b:IsA("Model") and b.Name ~= (getgenv()).swordModel then
                    b:Destroy()
                end
                task.wait()
            end
        end
    end
end)
local iJ = 0
function create_animation(s, b, f)
    local I = (game:GetService("TweenService")):Create(s, b, f)
    I:Play()
    task.wait(b.Time)
    L:AddItem(I, 0)
    I:Destroy()
    I = nil
end
local TJ = {}
TJ.storage = {}
TJ.current = nil
TJ.track = nil
for s, b in pairs((game:GetService("ReplicatedStorage")).Misc.Emotes:GetChildren()) do
    if b:IsA("Animation") and b:GetAttribute("EmoteName") then
        local s = b:GetAttribute("EmoteName");
        (TJ.storage)[s] = b
    end
end
local MJ = {}
for s in pairs(TJ.storage) do
    table.insert(MJ, s)
end
table.sort(MJ)
local gJ = {}
function gJ.Parry_Animation()
    local s = (game:GetService("ReplicatedStorage")).Shared.SwordAPI.Collection.Default:FindFirstChild("GrabParry")
    local b = Y.Character:GetAttribute("CurrentlyEquippedSword")
    if not b then
        return
    end
    if not s then
        return
    end
    local f = (game:GetService("ReplicatedStorage")).Shared.ReplicatedInstances.Swords.GetSword:Invoke(b)
    if not f or not f.AnimationType then
        return
    end
    for b, I in pairs((game:GetService("ReplicatedStorage")).Shared.SwordAPI.Collection:GetChildren()) do
        if I.Name == f.AnimationType then
            if I:FindFirstChild("GrabParry") or I:FindFirstChild("Grab") then
                local b = "GrabParry"
                if I:FindFirstChild("Grab") then
                    b = "Grab"
                end
                s = (I)[b]
            end
        end
    end
    V = Y.Character.Humanoid.Animator:LoadAnimation(s)
    V:Play()
end
function gJ.Play_Animation(s)
    local b = (TJ.storage)[s]
    if not b then
        return false
    end
    local f = Y.Character.Humanoid.Animator
    if TJ.track then
        TJ.track:Stop()
    end
    TJ.track = f:LoadAnimation(b)
    TJ.track:Play()
    TJ.current = s
end
function gJ.Get_Balls()
    local s = {}
    for b, f in pairs(workspace.Balls:GetChildren()) do
        if f:GetAttribute("realBall") then
            f.CanCollide = false
            table.insert(s, f)
        end
    end
    return s
end
function gJ.Get_Ball()
    for s, b in pairs(workspace.Balls:GetChildren()) do
        if b:GetAttribute("realBall") then
            b.CanCollide = false
            return b
        end
    end
end
function gJ.Lobby_Balls()
    for s, b in pairs(workspace.TrainingBalls:GetChildren()) do
        if b:GetAttribute("realBall") then
            return b
        end
    end
end
local cJ = nil
function gJ.Closest_Player()
    local s = math.huge
    local b = nil
    for f, I in pairs(workspace.Alive:GetChildren()) do
        if tostring(I) ~= tostring(Y) then
            if I.PrimaryPart then
                local f = Y:DistanceFromCharacter(I.PrimaryPart.Position)
                if f < s then
                    s = f
                    b = I
                end
            end
        end
    end
    cJ = b
    return b
end
function gJ.Get_Entity_Properties(s)
    gJ.Closest_Player()
    if not cJ then
        return false
    end
    local b = cJ.PrimaryPart.Velocity
    local f = (Y.Character.PrimaryPart.Position - cJ.PrimaryPart.Position).Unit
    local I = (Y.Character.PrimaryPart.Position - cJ.PrimaryPart.Position).Magnitude
    return {
        Velocity = b;
        Direction = f;
        Distance = I
    }
end
local YJ = S.TouchEnabled and not S.MouseEnabled
function gJ.Parry_Data(s)
    gJ.Closest_Player()
    local b = {}
    local f = workspace.CurrentCamera
    local I
    if m == Enum.UserInputType.MouseButton1 or Enum.UserInputType.MouseButton2 or m == Enum.UserInputType.Keyboard then
        local s = S:GetMouseLocation()
        I = {
            s.X;
            s.Y
        }
    else
        I = {
            f.ViewportSize.X / 2,
            f.ViewportSize.Y / 2
        }
    end
    if YJ then
        I = {
            f.ViewportSize.X / 2;
            f.ViewportSize.Y / 2
        }
    end
    local a = {}
    for s, I in pairs(workspace.Alive:GetChildren()) do
        if I ~= Y.Character then
            local s = I.PrimaryPart.Position
            local O, y = f:WorldToScreenPoint(s)
            if y then
                (a)[I] = Vector2.new(O.X, O.Y)
            end;
            (b)[tostring(I)] = O
        end
    end
    if s == "Camera" then
        return {
            0,
            f.CFrame,
            b,
            I
        }
    end
    if s == "Backwards" then
        local s = f.CFrame.LookVector * - 10000
        s = Vector3.new(s.X, 0, s.Z)
        return {
            0,
            CFrame.new(f.CFrame.Position, f.CFrame.Position + s),
            b,
            I
        }
    end
    if s == "Straight" then
        local s = nil
        local a = math.huge
        local O = Vector2.new((I)[1], (I)[2])
        for b, I in pairs(workspace.Alive:GetChildren()) do
            if I ~= Y.Character then
                local b = I.PrimaryPart.Position
                local y, z = f:WorldToScreenPoint(b)
                if z then
                    local b = Vector2.new(y.X, y.Y)
                    local f = (O - b).Magnitude
                    if f < a then
                        a = f
                        s = I
                    end
                end
            end
        end
        if s then
            return {
                0,
                CFrame.new(Y.Character.PrimaryPart.Position, s.PrimaryPart.Position);
                b;
                I
            }
        else
            return {
                0;
                CFrame.new(Y.Character.PrimaryPart.Position, cJ.PrimaryPart.Position),
                b;
                I
            }
        end
    end
    if s == "Random" then
        return {
            0;
            CFrame.new(f.CFrame.Position, Vector3.new(math.random(- 4000, 4000), math.random(- 4000, 4000), math.random(- 4000, 4000))),
            b,
            I
        }
    end
    if s == "High" then
        local s = f.CFrame.UpVector * 10000
        return {
            0;
            CFrame.new(f.CFrame.Position, f.CFrame.Position + s);
            b,
            I
        }
    end
    if s == "Left" then
        local s = f.CFrame.RightVector * 10000
        return {
            0,
            CFrame.new(f.CFrame.Position, f.CFrame.Position - s);
            b;
            I
        }
    end
    if s == "Right" then
        local s = f.CFrame.RightVector * 10000
        return {
            0;
            CFrame.new(f.CFrame.Position, f.CFrame.Position + s),
            b,
            I
        }
    end
    if s == "RandomTarget" then
        local s = {}
        for b, I in pairs(workspace.Alive:GetChildren()) do
            if I ~= Y.Character and I.PrimaryPart then
                local b, a = f:WorldToScreenPoint(I.PrimaryPart.Position)
                if a then
                    table.insert(s, {
                        character = I;
                        screenXY = {
                            b.X;
                            b.Y
                        }
                    })
                end
            end
        end
        if # s > 0 then
            local f = (s)[math.random(1, # s)]
            local I = CFrame.new(Y.Character.PrimaryPart.Position, f.character.PrimaryPart.Position)
            return {
                0;
                I,
                b,
                f.screenXY
            }
        else
            return {
                0,
                f.CFrame,
                b;
                {
                    f.ViewportSize.X / 2;
                    f.ViewportSize.Y / 2
                }
            }
        end
    end
    return s
end
function gJ.Parry(s)
    local b = gJ.Parry_Data(s)
    if not x then
        o(K)
        x = true
    else
        NJ((b)[1], (b)[2], (b)[3], (b)[4])
    end
    if iJ > 7 then
        return false
    end
    iJ = iJ + 1
    task.delay(.5, function()
        if iJ > 0 then
            iJ = iJ - 1
        end
    end)
end
local rJ = 0
local PJ = tick()
function gJ.Linear_Interpolation(s, b, f)
    return s + (b - s) * f
end
local SJ = {}
local mJ = tick()
local LJ = workspace.Runtime
function gJ.Is_Curved()
    local s = gJ.Get_Ball()
    if not s then
        return false
    end
    local b = s:FindFirstChild("zoomies")
    if not b then
        return false
    end
    local f = ((game:GetService("Stats")).Network.ServerStatsItem)["Data Ping"]:GetValue()
    local I = b.VectorVelocity
    local a = I.Unit
    local O = Y.Character.PrimaryPart.Position
    local y = s.Position
    local z = (O - y).Unit
    local Z = z:Dot(a)
    local N = I.Magnitude
    local G = math.min(N / 100, 40)
    local J = 40 * math.max(Z, 0)
    local D = (O - y).Magnitude
    local X = D / N - f / 1000
    local j = (15 - math.min(D / 1000, 15)) + G
    table.insert(SJ, I)
    if # SJ > 4 then
        table.remove(SJ, 1)
    end
    if s:FindFirstChild("AeroDynamicSlashVFX") then
        L:AddItem(s.AeroDynamicSlashVFX, 0)
        P = tick()
    end
    if LJ:FindFirstChild("Tornado") then
        if tick() - P < (LJ.Tornado:GetAttribute("TornadoTime") or 1) + .314159 then
            return true
        end
    end
    local F = N > 160
    if F and X > f / 10 then
        if N < 300 then
            j = math.max(j - 15, 15)
        elseif N > 300 and N < 600 then
            j = math.max(j - 16, 16)
        elseif N > 600 and N < 1000 then
            j = math.max(j - 17, 17)
        elseif N > 1000 and N < 1500 then
            j = math.max(j - 19, 19)
        elseif N > 1500 then
            j = math.max(j - 20, 20)
        end
    end
    if D < j then
        return false
    end
    if N < 300 then
        if tick() - mJ < X / 1.2 then
            return true
        end
    elseif N >= 300 and N < 450 then
        if tick() - mJ < X / 1.21 then
            return true
        end
    elseif N > 450 and N < 600 then
        if tick() - mJ < X / 1.335 then
            return true
        end
    elseif N > 600 then
        if tick() - mJ < X / 1.5 then
            return true
        end
    end
    local w = .5 - f / 1000
    local v = a - I.Unit
    local h = z:Dot(v.Unit)
    local n = Z - h
    if n < w then
        return true
    end
    local Q = math.clamp(Z, - 1, 1)
    local k = math.deg(math.asin(Q))
    rJ = gJ.Linear_Interpolation(rJ, k, .8)
    if N < 300 then
        if rJ < .02 then
            PJ = tick()
        end
        if tick() - PJ < X / 1.19 then
            return true
        end
    else
        if rJ < .018 then
            PJ = tick()
        end
        if tick() - PJ < X / 1.5 then
            return true
        end
    end
    if # SJ == 4 then
        local s = (a - (SJ)[1].Unit).Unit
        local b = z:Dot(s)
        local f = Z - b
        local I = (a - (SJ)[2].Unit).Unit
        local O = z:Dot(I)
        local y = Z - O
        if f < w or y < w then
            return true
        end
    end
    local W = false
    local E = 85
    local i = Vector3.new(O.X - y.X, 0, O.Z - y.Z)
    if i.Magnitude > 0 then
        i = i.Unit
    end
    local T = - i
    local M = Vector3.new(a.X, 0, a.Z)
    if M.Magnitude > 0 then
        M = M.Unit
        local s = math.deg(math.acos(math.clamp(T:Dot(M), - 1, 1)))
        if s < E then
            W = true
        end
    end
    return Z < w or W
end
function gJ.Get_Ball_Properties(s)
    local b = gJ.Get_Ball()
    local f = Vector3.zero
    local I = b
    local a = (Y.Character.PrimaryPart.Position - I.Position).Unit
    local O = (Y.Character.PrimaryPart.Position - b.Position).Magnitude
    local y = a:Dot(f.Unit)
    return {
        Velocity = f,
        Direction = a,
        Distance = O;
        Dot = y
    }
end
function gJ.Spam_Service(s)
    local b = gJ.Get_Ball()
    local f = gJ.Closest_Player()
    if not b then
        return false
    end
    if not f or not f.PrimaryPart then
        return false
    end
    local I = 0
    local a = b.AssemblyLinearVelocity
    local O = a.Magnitude
    local y = (Y.Character.PrimaryPart.Position - b.Position).Unit
    local z = y:Dot(a.Unit)
    local Z = f.PrimaryPart.Position
    local N = Y:DistanceFromCharacter(Z)
    local G = s.Ping + math.min(O / 6, 95)
    if s.Entity_Properties.Distance > G then
        return I
    end
    if s.Ball_Properties.Distance > G then
        return I
    end
    if N > G then
        return I
    end
    local J = 5 - math.min(O / 5, 5)
    local D = math.clamp(z, - 1, 0) * J
    I = G - D
    return I
end
local eJ = {}
local pJ = nil
local VJ = false
local HJ = 0
local dJ = false
r.Remotes.DeathBall.OnClientEvent:Connect(function(s, b)
    if b then
        dJ = true
    else
        dJ = false
    end
end)
local tJ = false
r.Remotes.InfinityBall.OnClientEvent:Connect(function(s, b)
    if b then
        tJ = true
    else
        tJ = false
    end
end)
local UJ = false
r.Remotes.TimeHoleHoldBall.OnClientEvent:Connect(function(s, b)
    if b then
        UJ = true
    else
        UJ = false
    end
end)
local xJ = true
local CJ = workspace:WaitForChild("Balls")
local KJ = nil
local RJ = nil
local uJ = .02
local lJ = workspace:FindFirstChild("Runtime")
local function BJ()
    for s, b in ipairs(CJ:GetChildren()) do
        if b:FindFirstChild("ff") then
            return b
        end
    end
    return nil
end
local function AJ(s)
    if RJ then
        return
    end
    RJ = task.spawn(function()
        while xJ do
            gJ.Parry(pJ)
            task.wait(uJ)
        end
        RJ = nil
    end)
end
CJ.ChildAdded:Connect(function(s)
    s.ChildAdded:Connect(function(s)
        if (getgenv()).SlashOfFuryDetection and s.Name == "ComboCounter" then
            local b = s:FindFirstChildOfClass("TextLabel")
            if b then
                repeat
                    local s = tonumber(b.Text)
                    if s and s < 32 then
                        gJ.Parry(pJ)
                    end
                    task.wait()
                until not b.Parent or not b
            end
        end
    end)
end)
local oJ = game:GetService("Players")
local qJ = oJ.LocalPlayer
local sY = game:GetService("RunService")
if not qJ then
    return
end
lJ.ChildAdded:Connect(function(s)
    local b = s.Name
    if (getgenv()).PhantomV2Detection then
        if b == "maxTransmission" or b == "transmissionpart" then
            local b = s:FindFirstChildWhichIsA("WeldConstraint")
            if b then
                local s = qJ.Character or qJ.CharacterAdded:Wait()
                if s and b.Part1 == s.HumanoidRootPart then
                    KJ = BJ()
                    b:Destroy()
                    if KJ then
                        local b
                        b = sY.RenderStepped:Connect(function()
                            local f = KJ:GetAttribute("highlighted")
                            if f == true then
                                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 36
                                local b = s:FindFirstChild("HumanoidRootPart")
                                if b then
                                    local s = b.Position
                                    local f = KJ.Position
                                    local I = (f - s).Unit
                                    game.Players.LocalPlayer.Character.Humanoid:Move(I, false)
                                end
                            elseif f == false then
                                b:Disconnect()
                                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 10
                                game.Players.LocalPlayer.Character.Humanoid:Move(Vector3.new(0, 0, 0), false)
                                task.delay(3, function()
                                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 36
                                end)
                                KJ = nil
                            end
                        end)
                        task.delay(3, function()
                            if b and b.Connected then
                                b:Disconnect()
                                game.Players.LocalPlayer.Character.Humanoid:Move(Vector3.new(0, 0, 0), false)
                                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 36
                                KJ = nil
                            end
                        end)
                    end
                end
            end
        end
    end
end)
local bY = game.Players.LocalPlayer
local fY = bY:WaitForChild("PlayerGui")
local IY = bY:WaitForChild("PlayerGui")
local aY = fY:WaitForChild("Hotbar")
local OY = IY.Hotbar.Block.UIGradient
local yY = IY.Hotbar.Ability.UIGradient
local function zY(s)
    return s.Offset.Y < .4
end
local function ZY(s)
    return s.Offset.Y == .5
end
local function NY()
    if zY(OY) then
        (game:GetService("ReplicatedStorage")).Remotes.AbilityButtonPress:Fire()
        return true
    end
    return false
end
local function GY()
    if ZY(yY) then
        if (Y.Character.Abilities)["Raging Deflection"].Enabled or Y.Character.Abilities.Rapture.Enabled or (Y.Character.Abilities)["Calming Deflection"].Enabled or (Y.Character.Abilities)["Aerodynamic Slash"].Enabled or Y.Character.Abilities.Fracture.Enabled or (Y.Character.Abilities)["Death Slash"].Enabled then
            VJ = true;
            (game:GetService("ReplicatedStorage")).Remotes.AbilityButtonPress:Fire()
            task.wait(2.432);
            (((game:GetService("ReplicatedStorage")):WaitForChild("Remotes")):WaitForChild("DeathSlashShootActivation")):FireServer(true)
            return true
        end
    end
    return false
end
do
    local s = E:create_module({
        title = "Auto Parry",
        flag = "Auto_Parry";
        description = "Automatically parries ball";
        section = "left",
        callback = function(s)
            if (getgenv()).AutoParryNotify then
                if s then
                    n.SendNotification({
                        title = "Module Notification";
                        text = "Auto Parry has been turned ON";
                        duration = 3
                    })
                else
                    n.SendNotification({
                        title = "Module Notification";
                        text = "Auto Parry has been turned OFF",
                        duration = 3
                    })
                end
            end
            if s then
                (eJ)["Auto Parry"] = sY.PreSimulation:Connect(function()
                    local s = gJ.Get_Ball()
                    local b = gJ.Get_Balls()
                    for b, f in pairs(b) do
                        if not f then
                            return
                        end
                        local I = f:FindFirstChild("zoomies")
                        if not I then
                            return
                        end;
                        (f:GetAttributeChangedSignal("target")):Once(function()
                            VJ = false
                        end)
                        if VJ then
                            return
                        end
                        local a = f:GetAttribute("target")
                        local O = s:GetAttribute("target")
                        local y = I.VectorVelocity
                        local z = (Y.Character.PrimaryPart.Position - f.Position).Magnitude
                        local Z = ((game:GetService("Stats")).Network.ServerStatsItem)["Data Ping"]:GetValue() / 10
                        local N = math.clamp(Z / 10, 5, 17)
                        local G = y.Magnitude
                        local J = math.min(math.max(G - 9.5, 0), 650)
                        local D = 2.4 + J * .002
                        local X = t
                        if (getgenv()).RandomParryAccuracyEnabled then
                            if G < 200 then
                                X = .7 + (math.random(40, 100) - 1) * .0035353535353535
                            else
                                X = .7 + (math.random(1, 100) - 1) * .0035353535353535
                            end
                        end
                        local j = D * X
                        local F = N + math.max(G / j, 9.5)
                        local w = gJ.Is_Curved()
                        if f:FindFirstChild("AeroDynamicSlashVFX") then
                            L:AddItem(f.AeroDynamicSlashVFX, 0)
                            P = tick()
                        end
                        if LJ:FindFirstChild("Tornado") then
                            if tick() - P < (LJ.Tornado:GetAttribute("TornadoTime") or 1) + .314159 then
                                return
                            end
                        end
                        if O == tostring(Y) and w then
                            return
                        end
                        if f:FindFirstChild("ComboCounter") then
                            return
                        end
                        local v = Y.Character.PrimaryPart:FindFirstChild("SingularityCape")
                        if v then
                            return
                        end
                        if (getgenv()).InfinityDetection and tJ then
                            return
                        end
                        if (getgenv()).DeathSlashDetection and dJ then
                            return
                        end
                        if (getgenv()).TimeHoleDetection and UJ then
                            return
                        end
                        if a == tostring(Y) and z <= F then
                            if (getgenv()).AutoAbility and GY() then
                                return
                            end
                        end
                        if a == tostring(Y) and z <= F then
                            if (getgenv()).CooldownProtection and NY() then
                                return
                            end
                            local s = os.clock()
                            local b = s - HJ
                            if b > .5 then
                                gJ.Parry_Animation()
                            end
                            if (getgenv()).AutoParryKeypress then
                                l:SendKeyEvent(true, Enum.KeyCode.F, false, nil)
                            else
                                gJ.Parry(pJ)
                            end
                            HJ = s
                            VJ = true
                        end
                        local h = tick()
                        repeat
                            sY.PreSimulation:Wait()
                        until tick() - h >= 1 or not VJ
                        VJ = false
                    end
                end)
            else
                if (eJ)["Auto Parry"] then
                    (eJ)["Auto Parry"]:Disconnect();
                    (eJ)["Auto Parry"] = nil
                end
            end
        end
    })
    local b = s:create_dropdown({
        title = "First Parry Type",
        flag = "First_Parry_Type",
        options = {
            "F_Key";
            "Left_Click",
            "Navigation"
        };
        multi_dropdown = false,
        maximum_options = 3;
        callback = function(s)
            K = s
        end
    })
    local f = {
        Camera = "Camera",
        Random = "Random",
        Backwards = "Backwards";
        Straight = "Straight",
        High = "High",
        Left = "Left";
        Right = "Right";
        ["Random Target"] = "RandomTarget"
    }
    local I = s:create_dropdown({
        title = "Parry Type",
        flag = "Parry_Type";
        options = {
            "Camera",
            "Random";
            "Backwards",
            "Straight";
            "High",
            "Left",
            "Right";
            "Random Target"
        },
        multi_dropdown = false;
        maximum_options = 8,
        callback = function(s)
            pJ = (f)[s] or s
        end
    })
    s:create_slider({
        title = "Parry Accuracy";
        flag = "Parry_Accuracy",
        maximum_value = 100;
        minimum_value = 1,
        value = 100;
        round_number = true,
        callback = function(s)
            t = .7 + (s - 1) * .0035353535353535
        end
    })
    s:create_divider({})
    s:create_checkbox({
        title = "Infinity Detection";
        flag = "Infinity_Detection",
        callback = function(s)
            if s then
                (getgenv()).InfinityDetection = s
            end
        end
    })
    s:create_checkbox({
        title = "Anti Phantom";
        flag = "Anti_Phantom";
        callback = function(s)
            (getgenv()).PhantomV2Detection = s
        end
    })
    s:create_checkbox({
        title = "Keypress",
        flag = "Auto_Parry_Keypress",
        callback = function(s)
            (getgenv()).AutoParryKeypress = s
        end
    })
    local a = E:create_module({
        title = "Auto Spam Parry",
        flag = "Auto_Spam_Parry",
        description = "Automatically spam parries ball",
        section = "right",
        callback = function(s)
            if (getgenv()).AutoSpamNotify then
                if s then
                    n.SendNotification({
                        title = "Module Notification",
                        text = "Auto Spam Parry turned ON",
                        duration = 3
                    })
                else
                    n.SendNotification({
                        text = "Auto Spam Parry turned OFF";
                        duration = 3
                    })
                end
            end
            if s then
                (eJ)["Auto Spam"] = sY.PreSimulation:Connect(function()
                    local s = gJ.Get_Ball()
                    if not s then
                        return
                    end
                    local b = s:FindFirstChild("zoomies")
                    if not b then
                        return
                    end
                    gJ.Closest_Player()
                    local f = ((game:GetService("Stats")).Network.ServerStatsItem)["Data Ping"]:GetValue()
                    local I = math.clamp(f / 10, 1, 16)
                    local a = s:GetAttribute("target")
                    local O = gJ:Get_Ball_Properties()
                    local y = gJ:Get_Entity_Properties()
                    local z = gJ.Spam_Service({
                        Ball_Properties = O,
                        Entity_Properties = y;
                        Ping = I
                    })
                    local Z = cJ.PrimaryPart.Position
                    local N = Y:DistanceFromCharacter(Z)
                    local G = (Y.Character.PrimaryPart.Position - s.Position).Unit
                    local J = b.VectorVelocity.Unit
                    local D = G:Dot(J)
                    local X = Y:DistanceFromCharacter(s.Position)
                    if not a then
                        return
                    end
                    if N > z or X > z then
                        return
                    end
                    local j = Y.Character:GetAttribute("Pulsed")
                    if j then
                        return
                    end
                    if a == tostring(Y) and (N > 30 and X > 30) then
                        return
                    end
                    local F = C
                    if X <= z and iJ > F then
                        if (getgenv()).SpamParryKeypress then
                            u:SendKeyEvent(true, Enum.KeyCode.F, false, game)
                        else
                            gJ.Parry(pJ)
                        end
                    end
                end)
            else
                if (eJ)["Auto Spam"] then
                    (eJ)["Auto Spam"]:Disconnect();
                    (eJ)["Auto Spam"] = nil
                end
            end
        end
    })
    local O = a:create_dropdown({
        title = "Parry Type";
        flag = "Spam_Parry_Type",
        options = {
            "Legit",
            "Blatant"
        };
        multi_dropdown = false;
        maximum_options = 2,
        callback = function(s)
        end
    })
    a:create_slider({
        title = "Parry Threshold",
        flag = "Parry_Threshold",
        maximum_value = 3,
        minimum_value = 1,
        value = 2.5,
        round_number = false,
        callback = function(s)
            C = s
        end
    })
    a:create_divider({})
    if not YJ then
        local s = a:create_checkbox({
            title = "Animation Fix";
            flag = "AnimationFix",
            callback = function(s)
                if s then
                    (eJ)["Animation Fix"] = sY.PreSimulation:Connect(function()
                        local s = gJ.Get_Ball()
                        if not s then
                            return
                        end
                        local b = s:FindFirstChild("zoomies")
                        if not b then
                            return
                        end
                        gJ.Closest_Player()
                        local f = ((game:GetService("Stats")).Network.ServerStatsItem)["Data Ping"]:GetValue()
                        local I = math.clamp(f / 10, 10, 16)
                        local a = s:GetAttribute("target")
                        local O = gJ:Get_Ball_Properties()
                        local y = gJ:Get_Entity_Properties()
                        local z = gJ.Spam_Service({
                            Ball_Properties = O;
                            Entity_Properties = y,
                            Ping = I
                        })
                        local Z = cJ.PrimaryPart.Position
                        local N = Y:DistanceFromCharacter(Z)
                        local G = (Y.Character.PrimaryPart.Position - s.Position).Unit
                        local J = b.VectorVelocity.Unit
                        local D = G:Dot(J)
                        local X = Y:DistanceFromCharacter(s.Position)
                        if not a then
                            return
                        end
                        if N > z or X > z then
                            return
                        end
                        local j = Y.Character:GetAttribute("Pulsed")
                        if j then
                            return
                        end
                        if a == tostring(Y) and (N > 30 and X > 30) then
                            return
                        end
                        local F = C
                        if X <= z and iJ > F then
                            u:SendKeyEvent(true, Enum.KeyCode.F, false, game)
                        end
                    end)
                else
                    if (eJ)["Animation Fix"] then
                        (eJ)["Animation Fix"]:Disconnect();
                        (eJ)["Animation Fix"] = nil
                    end
                end
            end
        })
        s:change_state(true)
    end
    a:create_checkbox({
        title = "Keypress";
        flag = "Auto_Spam_Parry_Keypress",
        callback = function(s)
            (getgenv()).SpamParryKeypress = s
        end
    })
    a:create_checkbox({
        title = "Notify";
        flag = "Auto_Spam_Parry_Notify",
        callback = function(s)
            (getgenv()).AutoSpamNotify = s
        end
    })
    local y = E:create_module({
        title = "Manual Spam Parry",
        flag = "Manual_Spam_Parry";
        description = "Manually Spams Parry";
        section = "right",
        callback = function(s)
            if (getgenv()).ManualSpamNotify then
                if s then
                    n.SendNotification({
                        title = "Module Notification";
                        text = "Manual Spam Parry turned ON",
                        duration = 3
                    })
                else
                    n.SendNotification({
                        title = "Module Notification";
                        text = "Manual Spam Parry turned OFF",
                        duration = 3
                    })
                end
            end
            if s then
                (eJ)["Manual Spam"] = sY.PreSimulation:Connect(function()
                    if (getgenv()).spamui then
                        return
                    end
                    if (getgenv()).ManualSpamKeypress then
                        u:SendKeyEvent(true, Enum.KeyCode.F, false, game)
                    else
                        gJ.Parry(pJ)
                    end
                end)
            else
                if (eJ)["Manual Spam"] then
                    (eJ)["Manual Spam"]:Disconnect();
                    (eJ)["Manual Spam"] = nil
                end
            end
        end
    })
    y:change_state(false)
    if YJ then
        y:create_checkbox({
            title = "UI";
            flag = "Manual_Spam_UI";
            callback = function(s)
                (getgenv()).spamui = s
                if s then
                    local s = Instance.new("ScreenGui")
                    s.Name = "ManualSpamUI"
                    s.ResetOnSpawn = false
                    s.Parent = game.CoreGui
                    local b = Instance.new("Frame")
                    b.Name = "MainFrame"
                    b.Position = UDim2.new(0, 20, 0, 20)
                    b.Size = UDim2.new(0, 200, 0, 100)
                    b.BackgroundColor3 = Color3.fromRGB(10, 10, 50)
                    b.BackgroundTransparency = .3
                    b.BorderSizePixel = 0
                    b.Active = true
                    b.Draggable = true
                    b.Parent = s
                    local f = Instance.new("UICorner")
                    f.CornerRadius = UDim.new(0, 12)
                    f.Parent = b
                    local I = Instance.new("UIStroke")
                    I.Thickness = 2
                    I.Color = Color3.new(0, 0, 0)
                    I.Parent = b
                    local a = Instance.new("TextButton")
                    a.Name = "ClashModeButton"
                    a.Text = "Clash Mode"
                    a.Size = UDim2.new(0, 160, 0, 40)
                    a.Position = UDim2.new(.5, - 80, .5, - 20)
                    a.BackgroundTransparency = 1
                    a.BorderSizePixel = 0
                    a.Font = Enum.Font.GothamSemibold
                    a.TextColor3 = Color3.new(1, 1, 1)
                    a.TextSize = 22
                    a.Parent = b
                    local O = false
                    local function y()
                        O = not O
                        a.Text = O and "Stop" or "Clash Mode"
                        if O then
                            (eJ)["Manual Spam UI"] = (game:GetService("RunService")).Heartbeat:Connect(function()
                                gJ.Parry(pJ)
                            end)
                        else
                            if (eJ)["Manual Spam UI"] then
                                (eJ)["Manual Spam UI"]:Disconnect();
                                (eJ)["Manual Spam UI"] = nil
                            end
                        end
                    end
                    a.MouseButton1Click:Connect(y)
                else
                    if game.CoreGui:FindFirstChild("ManualSpamUI") then
                        (game.CoreGui:FindFirstChild("ManualSpamUI")):Destroy()
                    end
                    if (eJ)["Manual Spam UI"] then
                        (eJ)["Manual Spam UI"]:Disconnect();
                        (eJ)["Manual Spam UI"] = nil
                    end
                end
            end
        })
    end
    y:create_checkbox({
        title = "Keypress",
        flag = "Manual_Spam_Keypress",
        callback = function(s)
            (getgenv()).ManualSpamKeypress = s
        end
    })
    y:create_checkbox({
        title = "Notify";
        flag = "Manual_Spam_Parry_Notify";
        callback = function(s)
            (getgenv()).ManualSpamNotify = s
        end
    })
    local z = game.Players.LocalPlayer
    local Z = workspace.CurrentCamera
    local N = game.ReplicatedStorage.Remotes.ParryAttempt;
    (getgenv()).originalCameraSubject = nil
    function getspeed(s)
        if s then
            if s:FindFirstChild("zoomies") and s.zoomies.VectorVelocity then
                return s.zoomies.VectorVelocity
            end
        else
            for s, b in pairs(workspace.Balls:GetChildren()) do
                if b:FindFirstChild("zoomies") and b.zoomies.VectorVelocity then
                    return b.zoomies.VectorVelocity
                end
            end
        end
        return Vector3.new(0, 0, 0)
    end
    function restoreCamera()
        local s = z.Character
        if s and s:FindFirstChild("Humanoid") then
            Z.CameraSubject = s.Humanoid
        end
    end
    function handleBallTargetChange(s)
        local b = s:GetAttribute("target")
        local f = z.Character
        if not f then
            return
        end
        local I = f:FindFirstChild("HumanoidRootPart")
        local a = f:FindFirstChild("Humanoid")
        if not I or not a then
            return
        end
        if b == z.Name then
            if not (getgenv()).originalCFrame then
                (getgenv()).originalCFrame = I.CFrame
            end
            local b = getspeed(s)
            if b.Magnitude > 100 then
                task.wait(.2)
            end
            local f = Vector3.new(5, 5, 5)
            a.PlatformStand = true
            I:PivotTo(s.CFrame + f)
            task.wait(.1)
            a.PlatformStand = false
            Z.CameraSubject = s
        else
            if (getgenv()).originalCFrame then
                a.PlatformStand = true
                I:PivotTo((getgenv()).originalCFrame)
                task.wait(.1)
                a.PlatformStand = false;
                (getgenv()).originalCFrame = nil
                restoreCamera()
            end
        end
    end
    local G = i:create_module({
        title = "Fov";
        flag = "Fov";
        description = "Changes Camera POV",
        section = "left";
        callback = function(s)
            (getgenv()).CameraEnabled = s
            local b = (game:GetService("Workspace")).CurrentCamera
            if s then
                (getgenv()).CameraFOV = (getgenv()).CameraFOV or 70
                b.FieldOfView = (getgenv()).CameraFOV
                if not (getgenv()).FOVLoop then
                    (getgenv()).FOVLoop = (game:GetService("RunService")).RenderStepped:Connect(function()
                        if (getgenv()).CameraEnabled then
                            b.FieldOfView = (getgenv()).CameraFOV
                        end
                    end)
                end
            else
                b.FieldOfView = 70
                if (getgenv()).FOVLoop then
                    (getgenv()).FOVLoop:Disconnect();
                    (getgenv()).FOVLoop = nil
                end
            end
        end
    })
    G:create_slider({
        title = "Camera FOV",
        flag = "Camera_FOV",
        maximum_value = 120;
        minimum_value = 50;
        value = 70;
        round_number = true,
        callback = function(s)
            (getgenv()).CameraFOV = s
            if (getgenv()).CameraEnabled then
                (game:GetService("Workspace")).CurrentCamera.FieldOfView = s
            end
        end
    })
    local J = i:create_module({
        title = "Emotes",
        flag = "Emotes",
        description = "Custom Emotes",
        section = "right",
        callback = function(s)
            (getgenv()).Animations = s
            if s then
                eJ.Animations = sY.Heartbeat:Connect(function()
                    if not Y.Character or not Y.Character.PrimaryPart then
                        return
                    end
                    local s = Y.Character.PrimaryPart.AssemblyLinearVelocity.Magnitude
                    if s > 30 then
                        if TJ.track then
                            TJ.track:Stop()
                            TJ.track:Destroy()
                            TJ.track = nil
                        end
                    else
                        if not TJ.track and TJ.current then
                            gJ.Play_Animation(TJ.current)
                        end
                    end
                end)
            else
                if TJ.track then
                    TJ.track:Stop()
                    TJ.track:Destroy()
                    TJ.track = nil
                end
                if eJ.Animations then
                    eJ.Animations:Disconnect()
                    eJ.Animations = nil
                end
            end
        end
    })
    local D = (MJ)[1]
    local X = J:create_dropdown({
        title = "Animation Type",
        flag = "Selected_Animation";
        options = MJ;
        multi_dropdown = false,
        maximum_options = # MJ,
        callback = function(s)
            D = s
            if (getgenv()).Animations then
                gJ.Play_Animation(s)
            end
        end
    })
    X:update(D)
    _G.PlayerCosmeticsCleanup = {}
    local j = i:create_module({
        title = "Player Cosmetics";
        flag = "Player_Cosmetics";
        description = "Apply headless and korblox",
        section = "left";
        callback = function(s)
            local b = game:GetService("Players")
            local f = b.LocalPlayer
            local function I(s)
                local b = s:FindFirstChild("RightLeg") or s:FindFirstChild("Right Leg")
                if not b then
                    warn("Right leg not found on character")
                    return
                end
                for s, b in pairs(b:GetChildren()) do
                    if b:IsA("SpecialMesh") then
                        b:Destroy()
                    end
                end
                local f = Instance.new("SpecialMesh")
                f.MeshId = "rbxassetid://101851696"
                f.TextureId = "rbxassetid://115727863"
                f.Scale = Vector3.new(1, 1, 1)
                f.Parent = b
            end
            local function a(s)
                if s then
                    local b = s:FindFirstChild("RightLeg") or s:FindFirstChild("Right Leg")
                    if b then
                        local s = b:FindFirstChildOfClass("SpecialMesh")
                        if s then
                            _G.PlayerCosmeticsCleanup.originalMeshId = s.MeshId
                            _G.PlayerCosmeticsCleanup.originalTextureId = s.TextureId
                            _G.PlayerCosmeticsCleanup.originalScale = s.Scale
                        else
                            _G.PlayerCosmeticsCleanup.hadNoMesh = true
                        end
                        _G.PlayerCosmeticsCleanup.rightLegChildren = {}
                        for s, b in pairs(b:GetChildren()) do
                            if b:IsA("SpecialMesh") then
                                table.insert(_G.PlayerCosmeticsCleanup.rightLegChildren, {
                                    ClassName = b.ClassName;
                                    Properties = {
                                        MeshId = b.MeshId;
                                        TextureId = b.TextureId,
                                        Scale = b.Scale
                                    }
                                })
                            end
                        end
                    end
                end
            end
            local function O(s)
                if s then
                    local b = s:FindFirstChild("RightLeg") or s:FindFirstChild("Right Leg")
                    if b and _G.PlayerCosmeticsCleanup.rightLegChildren then
                        for s, b in pairs(b:GetChildren()) do
                            if b:IsA("SpecialMesh") then
                                b:Destroy()
                            end
                        end
                        if _G.PlayerCosmeticsCleanup.hadNoMesh then
                            return
                        end
                        for s, f in ipairs(_G.PlayerCosmeticsCleanup.rightLegChildren) do
                            if f.ClassName == "SpecialMesh" then
                                local s = Instance.new("SpecialMesh")
                                s.MeshId = f.Properties.MeshId
                                s.TextureId = f.Properties.TextureId
                                s.Scale = f.Properties.Scale
                                s.Parent = b
                            end
                        end
                    end
                end
            end
            if s then
                CosmeticsActive = true;
                (getgenv()).Config = {
                    Headless = true
                }
                if f.Character then
                    local s = f.Character:FindFirstChild("Head")
                    if s and (getgenv()).Config.Headless then
                        _G.PlayerCosmeticsCleanup.headTransparency = s.Transparency
                        local b = s:FindFirstChildOfClass("Decal")
                        if b then
                            _G.PlayerCosmeticsCleanup.faceDecalId = b.Texture
                            _G.PlayerCosmeticsCleanup.faceDecalName = b.Name
                        end
                    end
                    a(f.Character)
                    I(f.Character)
                end
                _G.PlayerCosmeticsCleanup.characterAddedConn = f.CharacterAdded:Connect(function(s)
                    local b = s:FindFirstChild("Head")
                    if b and (getgenv()).Config.Headless then
                        _G.PlayerCosmeticsCleanup.headTransparency = b.Transparency
                        local s = b:FindFirstChildOfClass("Decal")
                        if s then
                            _G.PlayerCosmeticsCleanup.faceDecalId = s.Texture
                            _G.PlayerCosmeticsCleanup.faceDecalName = s.Name
                        end
                    end
                    a(s)
                    I(s)
                end)
                if (getgenv()).Config.Headless then
                    headLoop = task.spawn(function()
                        while CosmeticsActive do
                            local s = f.Character
                            if s then
                                local b = s:FindFirstChild("Head")
                                if b then
                                    b.Transparency = 1
                                    local s = b:FindFirstChildOfClass("Decal")
                                    if s then
                                        s:Destroy()
                                    end
                                end
                            end
                            task.wait(.1)
                        end
                    end)
                end
            else
                CosmeticsActive = false
                if _G.PlayerCosmeticsCleanup.characterAddedConn then
                    _G.PlayerCosmeticsCleanup.characterAddedConn:Disconnect()
                    _G.PlayerCosmeticsCleanup.characterAddedConn = nil
                end
                if headLoop then
                    task.cancel(headLoop)
                    headLoop = nil
                end
                local s = f.Character
                if s then
                    local b = s:FindFirstChild("Head")
                    if b and _G.PlayerCosmeticsCleanup.headTransparency ~= nil then
                        b.Transparency = _G.PlayerCosmeticsCleanup.headTransparency
                        if _G.PlayerCosmeticsCleanup.faceDecalId then
                            local s = b:FindFirstChildOfClass("Decal") or Instance.new("Decal", b)
                            s.Name = _G.PlayerCosmeticsCleanup.faceDecalName or "face"
                            s.Texture = _G.PlayerCosmeticsCleanup.faceDecalId
                            s.Face = Enum.NormalId.Front
                        end
                    end
                    O(s)
                end
                _G.PlayerCosmeticsCleanup = {}
            end
        end
    })
    local F = i:create_module({
        title = "Fly";
        flag = "Fly";
        description = "Allows the player to fly",
        section = "right";
        callback = function(s)
            if s then
                (getgenv()).FlyEnabled = true
                local s = Y.Character or Y.CharacterAdded:Wait()
                local b = s:WaitForChild("HumanoidRootPart")
                local f = s:WaitForChild("Humanoid");
                (getgenv()).OriginalStateType = f:GetState();
                (getgenv()).RagdollHandler = f.StateChanged:Connect(function(s, b)
                    if (getgenv()).FlyEnabled then
                        if b == Enum.HumanoidStateType.Physics or b == Enum.HumanoidStateType.Ragdoll then
                            task.defer(function()
                                f:ChangeState(Enum.HumanoidStateType.GettingUp)
                                f:ChangeState(Enum.HumanoidStateType.Running)
                            end)
                        end
                    end
                end)
                local I = Instance.new("BodyGyro")
                I.P = 90000
                I.MaxTorque = Vector3.new(9000000000.0, 9000000000.0, 9000000000.0)
                I.Parent = b
                local a = Instance.new("BodyVelocity")
                a.Velocity = Vector3.new(0, 0, 0)
                a.MaxForce = Vector3.new(9000000000.0, 9000000000.0, 9000000000.0)
                a.Parent = b
                f.PlatformStand = true;
                (getgenv()).ResetterConnection = sY.Heartbeat:Connect(function()
                    if not (getgenv()).FlyEnabled then
                        return
                    end
                    if I and I.Parent then
                        I.P = 90000
                        I.MaxTorque = Vector3.new(9000000000.0, 9000000000.0, 9000000000.0)
                    end
                    if a and a.Parent then
                        a.MaxForce = Vector3.new(9000000000.0, 9000000000.0, 9000000000.0)
                    end
                    f.PlatformStand = true
                    if not I.Parent or not a.Parent then
                        if I then
                            I:Destroy()
                        end
                        if a then
                            a:Destroy()
                        end
                        I = Instance.new("BodyGyro")
                        I.P = 90000
                        I.MaxTorque = Vector3.new(9000000000.0, 9000000000.0, 9000000000.0)
                        I.Parent = b
                        a = Instance.new("BodyVelocity")
                        a.Velocity = Vector3.new(0, 0, 0)
                        a.MaxForce = Vector3.new(9000000000.0, 9000000000.0, 9000000000.0)
                        a.Parent = b
                    end
                end);
                (getgenv()).FlyConnection = sY.RenderStepped:Connect(function()
                    if not (getgenv()).FlyEnabled then
                        return
                    end
                    local s = workspace.CurrentCamera.CFrame
                    local b = Vector3.new(0, 0, 0)
                    if S:IsKeyDown(Enum.KeyCode.W) then
                        b = b + s.LookVector
                    end
                    if S:IsKeyDown(Enum.KeyCode.S) then
                        b = b - s.LookVector
                    end
                    if S:IsKeyDown(Enum.KeyCode.A) then
                        b = b - s.RightVector
                    end
                    if S:IsKeyDown(Enum.KeyCode.D) then
                        b = b + s.RightVector
                    end
                    if S:IsKeyDown(Enum.KeyCode.E) then
                        b = b + Vector3.new(0, 1, 0)
                    end
                    if S:IsKeyDown(Enum.KeyCode.Q) then
                        b = b - Vector3.new(0, 1, 0)
                    end
                    if b.Magnitude > 0 then
                        b = b.Unit
                    end
                    a.Velocity = b * ((getgenv()).FlySpeed or 50)
                    I.CFrame = s
                end)
            else
                (getgenv()).FlyEnabled = false
                if (getgenv()).FlyConnection then
                    (getgenv()).FlyConnection:Disconnect();
                    (getgenv()).FlyConnection = nil
                end
                if (getgenv()).RagdollHandler then
                    (getgenv()).RagdollHandler:Disconnect();
                    (getgenv()).RagdollHandler = nil
                end
                if (getgenv()).ResetterConnection then
                    (getgenv()).ResetterConnection:Disconnect();
                    (getgenv()).ResetterConnection = nil
                end
                local s = Y.Character
                if s then
                    local b = s:FindFirstChild("HumanoidRootPart")
                    local f = s:FindFirstChild("Humanoid")
                    if f then
                        f.PlatformStand = false
                        if (getgenv()).OriginalStateType then
                            f:ChangeState((getgenv()).OriginalStateType)
                        end
                    end
                    if b then
                        for s, b in ipairs(b:GetChildren()) do
                            if b:IsA("BodyGyro") or b:IsA("BodyVelocity") then
                                b:Destroy()
                            end
                        end
                    end
                end
            end
        end
    })
    local w = oJ.LocalPlayer
    local v = nil
    local h
    local function Q()
        local s = {}
        for b, f in ipairs(oJ:GetPlayers()) do
            if f ~= w then
                table.insert(s, f.Name)
            end
        end
        return s
    end
    local function k()
        local s = Q()
        if # s > 0 then
            v = (s)[1]
            if h then
                h:update(v)
            end
        else
            v = nil
        end
    end
    local W = i:create_module({
        title = "Player Follow";
        flag = "Player_Follow";
        description = "Follows the selected player";
        section = "left";
        callback = function(s)
            if s then
                (getgenv()).PlayerFollowEnabled = true;
                (getgenv()).PlayerFollowConnection = sY.Heartbeat:Connect(function()
                    if not v then
                        return
                    end
                    local s = oJ:FindFirstChild(v)
                    if s and (s.Character and s.Character.PrimaryPart) then
                        local b = w.Character
                        if b then
                            local f = b:FindFirstChild("Humanoid")
                            if f then
                                f:MoveTo(s.Character.PrimaryPart.Position)
                            end
                        end
                    end
                end)
            else
                (getgenv()).PlayerFollowEnabled = false
                if (getgenv()).PlayerFollowConnection then
                    (getgenv()).PlayerFollowConnection:Disconnect();
                    (getgenv()).PlayerFollowConnection = nil
                end
            end
        end
    })
    local c = Q()
    if # c > 0 then
        h = W:create_dropdown({
            title = "Follow Target";
            flag = "Follow_Target",
            options = c,
            multi_dropdown = false,
            maximum_options = # c;
            callback = function(s)
                if s then
                    v = s
                    if (getgenv()).FollowNotifyEnabled then
                        n.SendNotification({
                            title = "Module Notification",
                            text = "Now following: " .. s;
                            duration = 3
                        })
                    end
                end
            end
        })
        v = (c)[1]
        h:update(v);
        (getgenv()).FollowDropdown = h
    else
        v = nil
    end
    local m = table.concat(c, ",")
    local e = 0
    sY.Heartbeat:Connect(function(s)
        e = e + s
        if e >= 10 then
            local s = Q()
            table.sort(s)
            local b = table.concat(s, ",")
            if b ~= m then
                if h then
                    if # s > 0 then
                        if h.set_options then
                            h:set_options(s)
                        else
                            h.maximum_options = # s
                        end
                        if not table.find(s, v) then
                            v = (s)[1]
                            h:update(v)
                        end
                    else
                        v = nil
                    end
                end
                m = b
            end
            e = 0
        end
    end)
    W:create_checkbox({
        title = "Notify";
        flag = "Follow_Notify";
        default = false,
        callback = function(s)
            (getgenv()).FollowNotifyEnabled = s
        end
    })
    local p = i:create_module({
        title = "Hit Sounds",
        flag = "Hit_Sounds",
        description = "Toggles hit sounds",
        section = "right",
        callback = function(s)
            hit_Sound_Enabled = s
        end
    })
    local V = Instance.new("Folder")
    V.Name = "Useful Utility"
    V.Parent = workspace
    local H = Instance.new("Sound", V)
    H.Volume = 6
    local d = {
        "Medal",
        "Fatality",
        "Skeet";
        "Switches",
        "Rust Headshot",
        "Neverlose Sound",
        "Bubble",
        "Laser";
        "Steve",
        "Call of Duty",
        "Bat";
        "TF2 Critical";
        "Saber",
        "Bameware"
    }
    local U = {
        Medal = "rbxassetid://6607336718",
        Fatality = "rbxassetid://6607113255",
        Skeet = "rbxassetid://6607204501";
        Switches = "rbxassetid://6607173363",
        ["Rust Headshot"] = "rbxassetid://138750331387064",
        ["Neverlose Sound"] = "rbxassetid://110168723447153";
        Bubble = "rbxassetid://6534947588";
        Laser = "rbxassetid://7837461331",
        Steve = "rbxassetid://4965083997";
        ["Call of Duty"] = "rbxassetid://5952120301",
        Bat = "rbxassetid://3333907347",
        ["TF2 Critical"] = "rbxassetid://296102734";
        Saber = "rbxassetid://8415678813",
        Bameware = "rbxassetid://3124331820"
    }
    p:create_slider({
        title = "Volume",
        flag = "HitSoundVolume",
        minimum_value = 1;
        maximum_value = 10;
        value = 5;
        callback = function(s)
            H.Volume = s
        end
    })
    r.Remotes.ParrySuccess.OnClientEvent:Connect(function()
        if hit_Sound_Enabled then
            H:Play()
        end
    end)
    local x = {
        Eeyuh = "rbxassetid://16190782181",
        Sweep = "rbxassetid://103508936658553",
        Bounce = "rbxassetid://134818882821660";
        ["Everybody Wants To Rule The World"] = "rbxassetid://87209527034670";
        ["Missing Money"] = "rbxassetid://134668194128037";
        ["Sour Grapes"] = "rbxassetid://117820392172291";
        Erwachen = "rbxassetid://124853612881772",
        ["Grasp the Light"] = "rbxassetid://89549155689397";
        ["Beyond the Shadows"] = "rbxassetid://120729792529978",
        ["Rise to the Horizon"] = "rbxassetid://72573266268313";
        ["Echoes of the Candy Kingdom"] = "rbxassetid://103040477333590",
        Speed = "rbxassetid://125550253895893";
        ["Lo-fi Chill A"] = "rbxassetid://9043887091";
        ["Lo-fi Ambient"] = "rbxassetid://129775776987523";
        ["Tears in the Rain"] = "rbxassetid://129710845038263"
    }
    local R = Instance.new("Sound")
    R.Volume = 3
    R.Looped = false
    R.Parent = game:GetService("SoundService")
    local B
    local function A(s)
        R:Stop()
        R.SoundId = s
        R:Play()
    end
    local o = "Eeyuh"
    local q = T:create_module({
        title = "Sound Controller";
        flag = "sound_controller";
        description = "Control background music and sounds",
        section = "left",
        callback = function(s)
            (getgenv()).soundmodule = s
            if s then
                A((x)[o])
            else
                R:Stop()
            end
        end
    })
    q:create_checkbox({
        title = "Loop Song";
        flag = "LoopSong",
        callback = function(s)
            R.Looped = s
        end
    })
    q:create_divider({})
    q:create_dropdown({
        title = "Select Sound";
        flag = "sound_selection",
        options = {
            "Eeyuh";
            "Sweep";
            "Bounce";
            "Everybody Wants To Rule The World";
            "Missing Money",
            "Sour Grapes",
            "Erwachen",
            "Grasp the Light";
            "Beyond the Shadows",
            "Rise to the Horizon";
            "Echoes of the Candy Kingdom",
            "Speed",
            "Lo-fi Chill A",
            "Lo-fi Ambient",
            "Tears in the Rain"
        };
        multi_dropdown = false,
        maximum_options = 15;
        callback = function(s)
            o = s
            if (getgenv()).soundmodule then
                A((x)[s])
            end
        end
    })
    local sJ = T:create_module({
        title = "Filter",
        flag = "Filter",
        description = "Toggles custom world filter effects";
        section = "right";
        callback = function(s)
            (getgenv()).WorldFilterEnabled = s
            if not s then
                if game.Lighting:FindFirstChild("CustomAtmosphere") then
                    game.Lighting.CustomAtmosphere:Destroy()
                end
                game.Lighting.FogEnd = 100000
                game.Lighting.ColorCorrection.TintColor = Color3.new(1, 1, 1)
                game.Lighting.ColorCorrection.Saturation = 0
            end
        end
    })
    sJ:create_checkbox({
        title = "Enable Atmosphere",
        flag = "World_Filter_Atmosphere",
        callback = function(s)
            (getgenv()).AtmosphereEnabled = s
            if s then
                if not game.Lighting:FindFirstChild("CustomAtmosphere") then
                    local s = Instance.new("Atmosphere")
                    s.Name = "CustomAtmosphere"
                    s.Parent = game.Lighting
                end
            else
                if game.Lighting:FindFirstChild("CustomAtmosphere") then
                    game.Lighting.CustomAtmosphere:Destroy()
                end
            end
        end
    })
    sJ:create_slider({
        title = "Atmosphere Density";
        flag = "World_Filter_Atmosphere_Slider";
        minimum_value = 0;
        maximum_value = 1,
        value = .5;
        callback = function(s)
            if (getgenv()).AtmosphereEnabled and game.Lighting:FindFirstChild("CustomAtmosphere") then
                game.Lighting.CustomAtmosphere.Density = s
            end
        end
    })
    sJ:create_checkbox({
        title = "Enable Fog",
        flag = "World_Filter_Fog",
        callback = function(s)
            (getgenv()).FogEnabled = s
            if not s then
                game.Lighting.FogEnd = 100000
            end
        end
    })
    sJ:create_slider({
        title = "Fog Distance";
        flag = "World_Filter_Fog_Slider";
        minimum_value = 50;
        maximum_value = 10000,
        value = 1000,
        callback = function(s)
            if (getgenv()).FogEnabled then
                game.Lighting.FogEnd = s
            end
        end
    })
    sJ:create_checkbox({
        title = "Enable Saturation",
        flag = "World_Filter_Saturation",
        callback = function(s)
            (getgenv()).SaturationEnabled = s
            if not s then
                game.Lighting.ColorCorrection.Saturation = 0
            end
        end
    })
    sJ:create_slider({
        title = "Saturation Level";
        flag = "World_Filter_Saturation_Slider",
        minimum_value = - 1;
        maximum_value = 1,
        value = 0,
        callback = function(s)
            if (getgenv()).SaturationEnabled then
                game.Lighting.ColorCorrection.Saturation = s
            end
        end
    })
    sJ:create_checkbox({
        title = "Enable Hue",
        flag = "World_Filter_Hue",
        callback = function(s)
            (getgenv()).HueEnabled = s
            if not s then
                game.Lighting.ColorCorrection.TintColor = Color3.new(1, 1, 1)
            end
        end
    })
    sJ:create_slider({
        title = "Hue Shift",
        flag = "World_Filter_Hue_Slider";
        minimum_value = - 1;
        maximum_value = 1;
        value = 0;
        callback = function(s)
            if (getgenv()).HueEnabled then
                game.Lighting.ColorCorrection.TintColor = Color3.fromHSV(s, 1, 1)
            end
        end
    })
    local bJ = T:create_module({
        title = "Ball Trail",
        flag = "Ball_Trail";
        description = "Toggles ball trail effects";
        section = "left";
        callback = function(s)
            (getgenv()).BallTrailEnabled = s
            if s then
                for s, b in pairs(gJ.Get_Balls()) do
                    if not b:FindFirstChild("Trail") then
                        local s = Instance.new("Trail")
                        s.Name = "Trail"
                        local f = Instance.new("Attachment")
                        f.Name = "Attachment0"
                        f.Parent = b
                        local I = Instance.new("Attachment")
                        I.Name = "Attachment1"
                        I.Parent = b
                        f.Position = Vector3.new(0, b.Size.Y / 2, 0)
                        I.Position = Vector3.new(0, - b.Size.Y / 2, 0)
                        s.Attachment0 = f
                        s.Attachment1 = I
                        s.Lifetime = .4
                        s.WidthScale = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, .5);
                            NumberSequenceKeypoint.new(1, .5)
                        })
                        s.Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0),
                            NumberSequenceKeypoint.new(1, 1)
                        })
                        s.Color = ColorSequence.new((getgenv()).BallTrailColor or Color3.new(1, 1, 1))
                        s.Parent = b
                    else
                        local s = b:FindFirstChild("Trail")
                        s.Color = ColorSequence.new((getgenv()).BallTrailColor or Color3.new(1, 1, 1))
                        s.Lifetime = .4
                        s.WidthScale = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, .5),
                            NumberSequenceKeypoint.new(1, .5)
                        })
                        s.Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0),
                            NumberSequenceKeypoint.new(1, 1)
                        })
                    end
                end
            else
                for s, b in pairs(gJ.Get_Balls()) do
                    local f = b:FindFirstChild("Trail")
                    if f then
                        f:Destroy()
                    end
                end
            end
        end
    })
    bJ:create_slider({
        title = "Ball Trail Hue",
        flag = "Ball_Trail_Hue";
        minimum_value = 0,
        maximum_value = 360;
        value = 0;
        round_number = true,
        callback = function(s)
            if not (getgenv()).BallTrailRainbowEnabled then
                local b = Color3.fromHSV(s / 360, 1, 1);
                (getgenv()).BallTrailColor = b
                if (getgenv()).BallTrailEnabled then
                    for s, f in pairs(gJ.Get_Balls()) do
                        local I = f:FindFirstChild("Trail")
                        if I then
                            I.Color = ColorSequence.new(b)
                        end
                    end
                end
            end
        end
    })
    bJ:create_checkbox({
        title = "Rainbow Trail";
        flag = "Ball_Trail_Rainbow";
        callback = function(s)
            (getgenv()).BallTrailRainbowEnabled = s
        end
    })
    bJ:create_checkbox({
        title = "Particle Emitter";
        flag = "Ball_Trail_Particle";
        callback = function(s)
            (getgenv()).BallTrailParticleEnabled = s
            for b, f in pairs(gJ.Get_Balls()) do
                if s then
                    if not f:FindFirstChild("ParticleEmitter") then
                        local s = Instance.new("ParticleEmitter")
                        s.Name = "ParticleEmitter"
                        s.Rate = 100
                        s.Lifetime = NumberRange.new(.5, 1)
                        s.Speed = NumberRange.new(0, 1)
                        s.Size = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, .5),
                            NumberSequenceKeypoint.new(1, 0)
                        })
                        s.Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0);
                            NumberSequenceKeypoint.new(1, 1)
                        })
                        s.Parent = f
                    end
                else
                    local s = f:FindFirstChild("ParticleEmitter")
                    if s then
                        s:Destroy()
                    end
                end
            end
        end
    })
    bJ:create_checkbox({
        title = "Glow Effect",
        flag = "Ball_Trail_Glow";
        callback = function(s)
            (getgenv()).BallTrailGlowEnabled = s
            for b, f in pairs(gJ.Get_Balls()) do
                if s then
                    if not f:FindFirstChild("BallGlow") then
                        local s = Instance.new("PointLight")
                        s.Name = "BallGlow"
                        s.Range = 15
                        s.Brightness = 2
                        s.Parent = f
                    end
                else
                    local s = f:FindFirstChild("BallGlow")
                    if s then
                        s:Destroy()
                    end
                end
            end
        end
    })
    local fJ = 0;
    (game:GetService("RunService")).Heartbeat:Connect(function()
        if (getgenv()).BallTrailEnabled then
            for s, b in pairs(gJ.Get_Balls()) do
                local f = b:FindFirstChild("Trail")
                if f then
                    if (getgenv()).BallTrailRainbowEnabled then
                        fJ = (fJ + 1) % 360
                        local s = Color3.fromHSV(fJ / 360, 1, 1)
                        f.Color = ColorSequence.new(s);
                        (getgenv()).BallTrailColor = s
                    else
                        f.Color = ColorSequence.new((getgenv()).BallTrailColor or Color3.new(1, 1, 1))
                    end
                end
            end
        end
    end)
    local IJ = {}
    function qolPlayerNameVisibility()
        local function s(s)
            local b = s.Character
            while not b or not b.Parent do
                task.wait()
                b = s.Character
            end
            local f = b:WaitForChild("Head")
            local I = Instance.new("BillboardGui")
            I.Adornee = f
            I.Size = UDim2.new(0, 200, 0, 50)
            I.StudsOffset = Vector3.new(0, 3, 0)
            I.AlwaysOnTop = true
            I.Parent = f
            local a = Instance.new("TextLabel")
            a.Size = UDim2.new(1, 0, 1, 0)
            a.TextColor3 = Color3.fromRGB(255, 255, 255)
            a.TextSize = 8
            a.TextWrapped = false
            a.BackgroundTransparency = 1
            a.TextXAlignment = Enum.TextXAlignment.Center
            a.TextYAlignment = Enum.TextYAlignment.Center
            a.Parent = I;
            (IJ)[s] = a
            local O = b:FindFirstChild("Humanoid")
            if O then
                O.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
            end
            local y
            y = sY.Heartbeat:Connect(function()
                if not (b and b.Parent) then
                    y:Disconnect()
                    I:Destroy();
                    (IJ)[s] = nil
                    return
                end
                if (getgenv()).AbilityESP then
                    a.Visible = true
                    local b = s:GetAttribute("EquippedAbility")
                    if b then
                        a.Text = s.DisplayName .. (" [" .. (b .. "]"))
                    else
                        a.Text = s.DisplayName
                    end
                else
                    a.Visible = false
                end
            end)
        end
        for b, f in oJ:GetPlayers() do
            if f ~= z then
                f.CharacterAdded:Connect(function()
                    s(f)
                end)
                s(f)
            end
        end
        oJ.PlayerAdded:Connect(function(b)
            b.CharacterAdded:Connect(function()
                s(b)
            end)
        end)
    end
    qolPlayerNameVisibility()
    local aJ = T:create_module({
        title = "Ability ESP",
        flag = "AbilityESP";
        description = "Displays Player Abilities";
        section = "right";
        callback = function(s)
            (getgenv()).AbilityESP = s
            for b, f in pairs(IJ) do
                f.Visible = s
            end
        end
    })
    local OJ = T:create_module({
        title = "Custom Sky";
        flag = "Custom_Sky",
        description = "Toggles a custom skybox";
        section = "left",
        callback = function(s)
            local b = game.Lighting
            local f = b:FindFirstChildOfClass("Sky")
            if s then
                if not f then
                    f = Instance.new("Sky", b)
                end
            else
                if f then
                    local s = {
                        "591058823",
                        "591059876";
                        "591058104",
                        "591057861";
                        "591057625",
                        "591059642"
                    }
                    local I = {
                        "SkyboxBk",
                        "SkyboxDn";
                        "SkyboxFt";
                        "SkyboxLf",
                        "SkyboxRt",
                        "SkyboxUp"
                    }
                    for b, I in ipairs(I) do
                        (f)[I] = "rbxassetid://" .. (s)[b]
                    end
                    b.GlobalShadows = true
                end
            end
        end
    })
    OJ:create_dropdown({
        title = "Select Sky",
        flag = "custom_sky_selector",
        options = {
            "Default",
            "Vaporwave";
            "Redshift";
            "Desert",
            "DaBaby",
            "Minecraft";
            "SpongeBob";
            "Skibidi";
            "Blaze",
            "Pussy Cat",
            "Among Us";
            "Space Wave";
            "Space Wave2",
            "Turquoise Wave",
            "Dark Night";
            "Bright Pink",
            "White Galaxy",
            "Blue Galaxy"
        },
        multi_dropdown = false;
        maximum_options = 18;
        callback = function(s)
            local b = nil
            if s == "Default" then
                b = {
                    "591058823",
                    "591059876";
                    "591058104",
                    "591057861",
                    "591057625",
                    "591059642"
                }
            elseif s == "Vaporwave" then
                b = {
                    "1417494030";
                    "1417494146";
                    "1417494253";
                    "1417494402";
                    "1417494499",
                    "1417494643"
                }
            elseif s == "Redshift" then
                b = {
                    "401664839",
                    "401664862";
                    "401664960";
                    "401664881",
                    "401664901",
                    "401664936"
                }
            elseif s == "Desert" then
                b = {
                    "1013852";
                    "1013853";
                    "1013850",
                    "1013851";
                    "1013849";
                    "1013854"
                }
            elseif s == "DaBaby" then
                b = {
                    "7245418472";
                    "7245418472";
                    "7245418472",
                    "7245418472";
                    "7245418472";
                    "7245418472"
                }
            elseif s == "Minecraft" then
                b = {
                    "1876545003";
                    "1876544331",
                    "1876542941";
                    "1876543392";
                    "1876543764",
                    "1876544642"
                }
            elseif s == "SpongeBob" then
                b = {
                    "7633178166";
                    "7633178166";
                    "7633178166";
                    "7633178166";
                    "7633178166",
                    "7633178166"
                }
            elseif s == "Skibidi" then
                b = {
                    "14952256113",
                    "14952256113";
                    "14952256113";
                    "14952256113",
                    "14952256113";
                    "14952256113"
                }
            elseif s == "Blaze" then
                b = {
                    "150939022";
                    "150939038",
                    "150939047";
                    "150939056";
                    "150939063";
                    "150939082"
                }
            elseif s == "Pussy Cat" then
                b = {
                    "11154422902";
                    "11154422902",
                    "11154422902";
                    "11154422902";
                    "11154422902";
                    "11154422902"
                }
            elseif s == "Among Us" then
                b = {
                    "5752463190";
                    "5752463190";
                    "5752463190",
                    "5752463190";
                    "5752463190",
                    "5752463190"
                }
            elseif s == "Space Wave" then
                b = {
                    "16262356578",
                    "16262358026",
                    "16262360469";
                    "16262362003",
                    "16262363873",
                    "16262366016"
                }
            elseif s == "Space Wave2" then
                b = {
                    "1233158420",
                    "1233158838",
                    "1233157105";
                    "1233157640",
                    "1233157995";
                    "1233159158"
                }
            elseif s == "Turquoise Wave" then
                b = {
                    "47974894",
                    "47974690",
                    "47974821";
                    "47974776",
                    "47974859",
                    "47974909"
                }
            elseif s == "Dark Night" then
                b = {
                    "6285719338";
                    "6285721078",
                    "6285722964",
                    "6285724682",
                    "6285726335",
                    "6285730635"
                }
            elseif s == "Bright Pink" then
                b = {
                    "271042516",
                    "271077243";
                    "271042556";
                    "271042310",
                    "271042467",
                    "271077958"
                }
            elseif s == "White Galaxy" then
                b = {
                    "5540798456",
                    "5540799894",
                    "5540801779",
                    "5540801192",
                    "5540799108",
                    "5540800635"
                }
            elseif s == "Blue Galaxy" then
                b = {
                    "14961495673";
                    "14961494492",
                    "14961492844";
                    "14961491298";
                    "14961490439",
                    "14961489508"
                }
            end
            if not b then
                warn("Sky option not found: " .. tostring(s))
                return
            end
            local f = game.Lighting
            local I = f:FindFirstChildOfClass("Sky") or Instance.new("Sky", f)
            local a = {
                "SkyboxBk";
                "SkyboxDn",
                "SkyboxFt",
                "SkyboxLf",
                "SkyboxRt",
                "SkyboxUp"
            }
            for s, f in ipairs(a) do
                (I)[f] = "rbxassetid://" .. (b)[s]
            end
            f.GlobalShadows = false
        end
    })
    local yJ = T:create_module({
        title = "Ability Exploit";
        flag = "AbilityExploit",
        description = "Ability Exploit(Blatant)";
        section = "right",
        callback = function(s)
            (getgenv()).AbilityExploit = s
        end
    })
    yJ:create_checkbox({
        title = "Thunder Dash No Cooldown";
        flag = "ThunderDashNoCooldown";
        callback = function(s)
            (getgenv()).ThunderDashNoCooldown = s
            if (getgenv()).AbilityExploit and (getgenv()).ThunderDashNoCooldown then
                local s = (((game:GetService("ReplicatedStorage")):WaitForChild("Shared")):WaitForChild("Abilities")):WaitForChild("Thunder Dash")
                local b = require(s)
                b.cooldown = 0
                b.cooldownReductionPerUpgrade = 0
            end
        end
    })
    yJ:create_checkbox({
        title = "Continuity Zero Exploit";
        flag = "ContinuityZeroExploit",
        callback = function(s)
            (getgenv()).ContinuityZeroExploit = s
            if (getgenv()).AbilityExploit and (getgenv()).ContinuityZeroExploit then
                local s = ((game:GetService("ReplicatedStorage")):WaitForChild("Remotes")):WaitForChild("UseContinuityPortal")
                local b
                b = hookmetamethod(game, "__namecall", function(f, ...)
                    local I = getnamecallmethod()
                    if f == s and I == "FireServer" then
                        return b(f, CFrame.new(9e+017, 9e+016, 9e+015, 9e+014, 90000000000000.0, 9000000000000.0, 900000000000.0, 90000000000.0, 9000000000.0, 900000000.0, 90000000.0, 9000000.0), i.Name)
                    end
                    return b(f, ...)
                end)
            end
        end
    })
    local zJ = false
    local ZJ = M:create_module({
        title = "Auto Duels Requeue";
        flag = "AutoDuelsRequeue";
        description = "Automatically requeues duels";
        section = "left",
        callback = function(s)
            zJ = s
            if zJ then
                task.spawn(function()
                    while zJ do
                        ((((((game:GetService("ReplicatedStorage")):WaitForChild("Packages")):WaitForChild("_Index")):WaitForChild("sleitnick_net@0.1.0")):WaitForChild("net")):WaitForChild("RE/PlayerWantsRematch")):FireServer()
                        task.wait(5)
                    end
                end)
            end
        end
    })
    local NJ = {
        13772394625;
        14915220621
    }
    local GJ = "FFA"
    local JJ = false
    local DJ = M:create_module({
        title = "Auto Ranked Requeue";
        flag = "AutoRankedRequeue";
        description = "Automatically requeues Ranked";
        section = "right",
        callback = function(s)
            JJ = s
            if JJ then
                if not table.find(NJ, game.PlaceId) then
                    JJ = false
                    return
                end
                task.spawn(function()
                    while JJ do
                        (((game:GetService("ReplicatedStorage")):WaitForChild("Remotes")):WaitForChild("JoinQueue")):FireServer("Ranked", GJ, "Normal")
                        task.wait(5)
                    end
                end)
            end
        end
    })
    DJ:create_dropdown({
        title = "Select Queue Type";
        flag = "QueueType",
        options = {
            "FFA";
            "Duo"
        };
        multi_dropdown = false;
        maximum_options = 2;
        callback = function(s)
            GJ = s
        end
    })
    local XJ = false
    local jJ = 13772394625
    local FJ = M:create_module({
        title = "Auto LTM Requeue",
        flag = "AutoLTMRequeue",
        description = "Automatically requeues LTM";
        section = "left",
        callback = function(s)
            XJ = s
            if XJ then
                if game.PlaceId ~= jJ then
                    XJ = false
                    return
                end
                task.spawn(function()
                    while XJ do
                        ((((((game:GetService("ReplicatedStorage")):WaitForChild("Packages")):WaitForChild("_Index")):WaitForChild("sleitnick_net@0.1.0")):WaitForChild("net")):WaitForChild("RF/JoinTournamentEventQueue")):InvokeServer({})
                        task.wait(5)
                    end
                end)
            end
        end
    })
    local wJ = g:create_module({
        title = "Skin Changer",
        flag = "SkinChanger";
        description = "Skin Changer",
        section = "left",
        callback = function(s)
            (getgenv()).skinChanger = s
            if s then
                (getgenv()).updateSword()
            end
        end
    })
    wJ:change_state(false)
    wJ:create_paragraph({
        title = "\226\154\160\239\184\143EVERYONE CAN SEE ANIMATIONS",
        text = "IF YOU USE SKIN CHANGER BACKSWORD YOU MUST EQUIP AN ACTUAL BACKSWORD"
    })
    local vJ = wJ:create_textbox({
        title = "\239\191\172 Skin Name (Case Sensitive) \239\191\172",
        placeholder = "Enter Sword Skin Name... ";
        flag = "SkinChangerTextbox",
        callback = function(s)
            (getgenv()).swordModel = s;
            (getgenv()).swordAnimations = s;
            (getgenv()).swordFX = s
            if (getgenv()).skinChanger then
                (getgenv()).updateSword()
            end
        end
    })
    local hJ = {}
    hJ.CONFIG = {
        DEFAULT_DISTANCE = 30,
        MULTIPLIER_THRESHOLD = 70,
        TRAVERSING = 25;
        DIRECTION = 1,
        JUMP_PERCENTAGE = 50,
        DOUBLE_JUMP_PERCENTAGE = 50;
        JUMPING_ENABLED = false,
        MOVEMENT_DURATION = .8,
        OFFSET_FACTOR = .7;
        GENERATION_THRESHOLD = .25
    }
    hJ.ball = nil
    hJ.lobbyChoice = nil
    hJ.animationCache = nil
    hJ.doubleJumped = false
    hJ.ELAPSED = 0
    hJ.CONTROL_POINT = nil
    hJ.LAST_GENERATION = 0
    hJ.signals = {}
    do
        local s = game.GetService
        local function b()
            local b = cloneref(s(game, "ReplicatedFirst"))
            return b
        end
        hJ.clonerefPermission = b()
        if not hJ.clonerefPermission then
            warn("cloneref is not available on your executor! There is a risk of getting detected.")
        end
        function hJ.findCachedService(s, b)
            for s, f in s do
                if f.Name == b then
                    return f
                end
            end
            return
        end
        function hJ.getService(b, f)
            local I = hJ.findCachedService(b, f)
            if I then
                return I
            end
            local a = s(game, f)
            if hJ.clonerefPermission then
                a = cloneref(a)
            end
            table.insert(b, a)
            return a
        end
        hJ.customService = setmetatable({}, {
            __index = hJ.getService
        })
    end
    hJ.playerHelper = {
        isAlive = function(s)
            local b = nil
            if s and s:IsA("Player") then
                b = s.Character
            end
            if not b then
                return false
            end
            local f = b:FindFirstChild("HumanoidRootPart")
            local I = b:FindFirstChild("Humanoid")
            if not f or not I then
                return false
            end
            return I.Health > 0
        end,
        inLobby = function(s)
            if not s then
                return false
            end
            return s.Parent == hJ.customService.Workspace.Dead
        end,
        onGround = function(s)
            if not s then
                return false
            end
            return s.Humanoid.FloorMaterial ~= Enum.Material.Air
        end
    }
    function hJ.isLimited()
        local s = tick() - hJ.LAST_GENERATION
        return s < hJ.CONFIG.GENERATION_THRESHOLD
    end
    function hJ.percentageCheck(s)
        if hJ.isLimited() then
            return false
        end
        local b = math.random(100)
        hJ.LAST_GENERATION = tick()
        return s >= b
    end
    hJ.ballUtils = {
        getBall = function()
            for s, b in hJ.customService.Workspace.Balls:GetChildren() do
                if b:GetAttribute("realBall") then
                    hJ.ball = b
                    return
                end
            end
            hJ.ball = nil
        end,
        getDirection = function()
            if not hJ.ball then
                return
            end
            local s = (hJ.customService.Players.LocalPlayer.Character.HumanoidRootPart.Position - hJ.ball.Position).Unit
            return s
        end;
        getVelocity = function()
            if not hJ.ball then
                return
            end
            local s = hJ.ball:FindFirstChild("zoomies")
            if not s then
                return
            end
            return s.VectorVelocity
        end,
        getSpeed = function()
            local s = hJ.ballUtils.getVelocity()
            if not s then
                return
            end
            return s.Magnitude
        end;
        isExisting = function()
            return hJ.ball ~= nil
        end
    }
    hJ.lerp = function(s, b, f)
        return s + (b - s) * f
    end
    hJ.quadratic = function(s, b, f, I)
        local a = hJ.lerp(s, b, I)
        local O = hJ.lerp(b, f, I)
        return hJ.lerp(a, O, I)
    end
    hJ.getCandidates = function(s, b, f)
        local I = math.cos(b + math.pi / 2)
        local a = math.sin(b + math.pi / 2)
        local O = s + Vector3.new(I, 0, a) * f
        local y = math.cos(b - math.pi / 2)
        local z = math.sin(b - math.pi / 2)
        local Z = s + Vector3.new(y, 0, z) * f
        return O, Z
    end
    hJ.getControlPoint = function(s, b)
        local f = (s + b) * .5
        local I = s - b
        if I.Magnitude < 5 then
            return b
        end
        local a = math.atan2(I.Z, I.X)
        local O = I.Magnitude * hJ.CONFIG.OFFSET_FACTOR
        local y, z = hJ.getCandidates(f, a, O)
        local Z = s - f
        if (y - f):Dot(Z) < 0 then
            return y
        else
            return z
        end
    end
    hJ.getCurve = function(s, b, f)
        hJ.ELAPSED = hJ.ELAPSED + f
        local I = math.clamp(hJ.ELAPSED / hJ.CONFIG.MOVEMENT_DURATION, 0, 1)
        if I >= 1 then
            local f = (s - b).Magnitude
            if f >= 10 then
                hJ.ELAPSED = 0
            end
            hJ.CONTROL_POINT = nil
            return b
        end
        if not hJ.CONTROL_POINT then
            hJ.CONTROL_POINT = hJ.getControlPoint(s, b)
        end
        assert(hJ.CONTROL_POINT, "CONTROL_POINT: Vector3 expected, got nil")
        return hJ.quadratic(s, hJ.CONTROL_POINT, b, I)
    end
    hJ.map = {
        getFloor = function()
            local s = hJ.customService.Workspace:FindFirstChild("FLOOR")
            if not s then
                for s, b in pairs(hJ.customService.Workspace:GetDescendants()) do
                    if b:IsA("MeshPart") or b:IsA("BasePart") then
                        local s = b.Size
                        if s.X > 50 and (s.Z > 50 and b.Position.Y < 5) then
                            return b
                        end
                    end
                end
            end
            return s
        end
    }
    hJ.getRandomPosition = function()
        local s = hJ.map.getFloor()
        if not s or not hJ.ballUtils.isExisting() then
            return
        end
        local b = hJ.ballUtils.getDirection() * hJ.CONFIG.DIRECTION
        local f = hJ.ballUtils.getSpeed()
        local I = math.min(f / 10, hJ.CONFIG.MULTIPLIER_THRESHOLD)
        local a = hJ.CONFIG.DEFAULT_DISTANCE + I
        local O = b * a
        local y = os.time() / 1.2
        local z = math.sin(y) * hJ.CONFIG.TRAVERSING
        local Z = math.cos(y) * hJ.CONFIG.TRAVERSING
        local N = Vector3.new(z, 0, Z)
        local G = (s.Position + O) + N
        return G
    end
    hJ.lobby = {
        isChooserAvailable = function()
            return hJ.customService.Workspace.Spawn.NewPlayerCounter.GUI.SurfaceGui.Top.Options.Visible
        end;
        updateChoice = function(s)
            hJ.lobbyChoice = s
        end,
        getMapChoice = function()
            local s = hJ.lobbyChoice or math.random(1, 3)
            local b = hJ.customService.Workspace.Spawn.NewPlayerCounter.Colliders:FindFirstChild(s)
            return b
        end,
        getPadPosition = function()
            if not hJ.lobby.isChooserAvailable() then
                hJ.lobbyChoice = nil
                return
            end
            local s = hJ.lobby.getMapChoice()
            if not s then
                return
            end
            return s.Position, s.Name
        end
    }
    hJ.movement = {
        removeCache = function()
            if hJ.animationCache then
                hJ.animationCache = nil
            end
        end;
        createJumpVelocity = function(s)
            local b = math.huge
            local f = Instance.new("BodyVelocity")
            f.MaxForce = Vector3.new(b, b, b)
            f.Velocity = Vector3.new(0, 80, 0)
            f.Parent = s.Character.HumanoidRootPart
            hJ.customService.Debris:AddItem(f, .001)
            hJ.customService.ReplicatedStorage.Remotes.DoubleJump:FireServer()
        end,
        playJumpAnimation = function(s)
            if not hJ.animationCache then
                local b = hJ.customService.ReplicatedStorage.Assets.Tutorial.Animations.DoubleJump
                hJ.animationCache = s.Character.Humanoid.Animator:LoadAnimation(b)
            end
            if hJ.animationCache then
                hJ.animationCache:Play()
            end
        end,
        doubleJump = function(s)
            if hJ.doubleJumped then
                return
            end
            if not hJ.percentageCheck(hJ.CONFIG.DOUBLE_JUMP_PERCENTAGE) then
                return
            end
            hJ.doubleJumped = true
            hJ.movement.createJumpVelocity(s)
            hJ.movement.playJumpAnimation(s)
        end;
        jump = function(s)
            if not hJ.CONFIG.JUMPING_ENABLED then
                return
            end
            if not hJ.playerHelper.onGround(s.Character) then
                hJ.movement.doubleJump(s)
                return
            end
            if not hJ.percentageCheck(hJ.CONFIG.JUMP_PERCENTAGE) then
                return
            end
            hJ.doubleJumped = false
            s.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end,
        move = function(s, b)
            s.Character.Humanoid:MoveTo(b)
        end;
        stop = function(s)
            local b = s.Character.HumanoidRootPart.Position
            s.Character.Humanoid:MoveTo(b)
        end
    }
    hJ.signal = {
        connect = function(s, b, f)
            if not s then
                s = hJ.customService.HttpService:GenerateGUID()
            end;
            (hJ.signals)[s] = b:Connect(f)
            return (hJ.signals)[s]
        end;
        disconnect = function(s)
            if not s or not (hJ.signals)[s] then
                return
            end;
            (hJ.signals)[s]:Disconnect();
            (hJ.signals)[s] = nil
        end;
        stop = function()
            for s, b in pairs(hJ.signals) do
                local f = false
                repeat
                    if typeof(b) ~= "RBXScriptConnection" then
                        f = true
                        break
                    end
                    b:Disconnect();
                    (hJ.signals)[s] = nil
                    f = true
                until true
                if not f then
                    break
                end
            end
        end
    }
    hJ.findPath = function(s, b)
        local f = hJ.customService.Players.LocalPlayer.Character.HumanoidRootPart.Position
        if s then
            local s, I = hJ.lobby.getPadPosition()
            local a = tonumber(I)
            if a then
                hJ.lobby.updateChoice(a)
                if (getgenv()).AutoVote then
                    ((((((game:GetService("ReplicatedStorage")):WaitForChild("Packages")):WaitForChild("_Index")):WaitForChild("sleitnick_net@0.1.0")):WaitForChild("net")):WaitForChild("RE/UpdateVotes")):FireServer("FFA")
                end
            end
            if not s then
                return
            end
            return hJ.getCurve(f, s, b)
        end
        local I = hJ.getRandomPosition()
        if not I then
            return
        end
        return hJ.getCurve(f, I, b)
    end
    hJ.followPath = function(s)
        if not hJ.playerHelper.isAlive(hJ.customService.Players.LocalPlayer) then
            hJ.movement.removeCache()
            return
        end
        local b = hJ.customService.Players.LocalPlayer.Character.Parent == hJ.customService.Workspace.Dead
        local f = hJ.findPath(b, s)
        if not f then
            hJ.movement.stop(hJ.customService.Players.LocalPlayer)
            return
        end
        hJ.movement.move(hJ.customService.Players.LocalPlayer, f)
        hJ.movement.jump(hJ.customService.Players.LocalPlayer)
    end
    hJ.finishThread = function()
        hJ.signal.disconnect("auto-play")
        hJ.signal.disconnect("synchronize")
        if not hJ.playerHelper.isAlive(hJ.customService.Players.LocalPlayer) then
            return
        end
        hJ.movement.stop(hJ.customService.Players.LocalPlayer)
    end
    hJ.runThread = function()
        hJ.signal.connect("auto-play", hJ.customService.RunService.PostSimulation, hJ.followPath)
        hJ.signal.connect("synchronize", hJ.customService.RunService.PostSimulation, hJ.ballUtils.getBall)
    end
    local nJ = g:create_module({
        title = "Auto Play";
        flag = "AutoPlay",
        description = "Automatically Plays Game",
        section = "right",
        callback = function(s)
            if s then
                hJ.runThread()
            else
                hJ.finishThread()
            end
        end
    })
    local QJ = nJ:create_checkbox({
        title = "Anti AFK";
        flag = "AutoPlayAntiAFK";
        callback = function(s)
            if s then
                local s = getconnections or get_signal_cons
                if s then
                    for s, b in pairs(s(oJ.LocalPlayer.Idled)) do
                        if b.Disable then
                            b.Disable(b)
                        elseif b.Disconnect then
                            b.Disconnect(b)
                        end
                    end
                else
                    local s = cloneref(game:GetService("VirtualUser"))
                    oJ.LocalPlayer.Idled:Connect(function()
                        s:CaptureController()
                        s:ClickButton2(Vector2.new())
                    end)
                end
            end
        end
    })
    QJ:change_state(true)
    nJ:create_checkbox({
        title = "Enable Jumping",
        flag = "jumping_enabled",
        callback = function(s)
            hJ.CONFIG.JUMPING_ENABLED = s
        end
    })
    nJ:create_checkbox({
        title = "Auto Vote";
        flag = "AutoVote",
        callback = function(s)
            (getgenv()).AutoVote = s
        end
    })
    nJ:create_divider({})
    nJ:create_slider({
        title = "Distance From Ball",
        flag = "default_distance";
        maximum_value = 100;
        minimum_value = 5;
        value = hJ.CONFIG.DEFAULT_DISTANCE;
        round_number = true,
        callback = function(s)
            hJ.CONFIG.DEFAULT_DISTANCE = s
        end
    })
    nJ:create_slider({
        title = "Speed Multiplier";
        flag = "multiplier_threshold";
        maximum_value = 200,
        minimum_value = 10,
        value = hJ.CONFIG.MULTIPLIER_THRESHOLD;
        round_number = true;
        callback = function(s)
            hJ.CONFIG.MULTIPLIER_THRESHOLD = s
        end
    })
    nJ:create_slider({
        title = "Transversing";
        flag = "traversing";
        maximum_value = 100;
        minimum_value = 0;
        value = hJ.CONFIG.TRAVERSING;
        round_number = true,
        callback = function(s)
            hJ.CONFIG.TRAVERSING = s
        end
    })
    nJ:create_slider({
        title = "Direction";
        flag = "Direction";
        maximum_value = 1,
        minimum_value = - 1;
        value = hJ.CONFIG.DIRECTION;
        round_number = false,
        callback = function(s)
            hJ.CONFIG.DIRECTION = s
        end
    })
    nJ:create_slider({
        title = "Offset Factor";
        flag = "OffsetFactor";
        maximum_value = 1;
        minimum_value = .1;
        value = hJ.CONFIG.OFFSET_FACTOR;
        round_number = false;
        callback = function(s)
            hJ.CONFIG.OFFSET_FACTOR = s
        end
    })
    nJ:create_slider({
        title = "Movement Duration";
        flag = "MovementDuration",
        maximum_value = 1,
        minimum_value = .1,
        value = hJ.CONFIG.MOVEMENT_DURATION;
        round_number = false;
        callback = function(s)
            hJ.CONFIG.MOVEMENT_DURATION = s
        end
    })
    nJ:create_slider({
        title = "Generation Threshold";
        flag = "GenerationThreshold",
        maximum_value = .5,
        minimum_value = .1,
        value = hJ.CONFIG.GENERATION_THRESHOLD,
        round_number = false;
        callback = function(s)
            hJ.CONFIG.GENERATION_THRESHOLD = s
        end
    })
    nJ:create_slider({
        title = "Jump Chance";
        flag = "jump_percentage",
        maximum_value = 100;
        minimum_value = 0,
        value = hJ.CONFIG.JUMP_PERCENTAGE;
        round_number = true;
        callback = function(s)
            hJ.CONFIG.JUMP_PERCENTAGE = s
        end
    })
    nJ:create_slider({
        title = "Double Jump Chance",
        flag = "double_jump_percentage";
        maximum_value = 100;
        minimum_value = 0,
        value = hJ.CONFIG.DOUBLE_JUMP_PERCENTAGE,
        round_number = true;
        callback = function(s)
            hJ.CONFIG.DOUBLE_JUMP_PERCENTAGE = s
        end
    })
    local kJ
    local WJ
    local EJ = 0
    local rJ = g:create_module({
        title = "Ball Stats",
        flag = "ballStats",
        description = "Toggle ball speed stats display",
        section = "left";
        callback = function(s)
            if s then
                local s = {}
                if not kJ then
                    local b = game.Players.LocalPlayer
                    kJ = Instance.new("ScreenGui")
                    kJ.ResetOnSpawn = false
                    kJ.Parent = b:WaitForChild("PlayerGui")
                    textLabel = Instance.new("TextLabel")
                    textLabel.Name = "BallStatsLabel"
                    textLabel.Size = UDim2.new(.2, 0, .05, 0)
                    textLabel.Position = UDim2.new(0, 0, .1, 0)
                    textLabel.TextScaled = false
                    textLabel.TextSize = 26
                    textLabel.BackgroundTransparency = 1
                    textLabel.TextColor3 = Color3.new(1, 1, 1)
                    textLabel.Font = Enum.Font.Gotham
                    textLabel.ZIndex = 2
                    textLabel.Parent = kJ
                    shadowLabel = Instance.new("TextLabel")
                    shadowLabel.Name = "BallStatsShadow"
                    shadowLabel.Size = textLabel.Size
                    shadowLabel.Position = textLabel.Position + UDim2.new(0, 2, 0, 2)
                    shadowLabel.TextScaled = textLabel.TextScaled
                    shadowLabel.TextSize = textLabel.TextSize
                    shadowLabel.BackgroundTransparency = 1
                    shadowLabel.TextColor3 = Color3.new(0, 0, 0)
                    shadowLabel.Font = textLabel.Font
                    shadowLabel.ZIndex = 1
                    shadowLabel.Parent = kJ
                    peakLabel = Instance.new("TextLabel")
                    peakLabel.Name = "PeakStatsLabel"
                    peakLabel.Size = UDim2.new(.2, 0, .05, 0)
                    peakLabel.Position = UDim2.new(0, 0, .135, 0)
                    peakLabel.TextScaled = false
                    peakLabel.TextSize = 26
                    peakLabel.BackgroundTransparency = 1
                    peakLabel.TextColor3 = Color3.new(1, 1, 1)
                    peakLabel.Font = Enum.Font.Gotham
                    peakLabel.ZIndex = 2
                    peakLabel.Parent = kJ
                    peakShadow = Instance.new("TextLabel")
                    peakShadow.Name = "PeakStatsShadow"
                    peakShadow.Size = peakLabel.Size
                    peakShadow.Position = peakLabel.Position + UDim2.new(0, 2, 0, 2)
                    peakShadow.TextScaled = peakLabel.TextScaled
                    peakShadow.TextSize = peakLabel.TextSize
                    peakShadow.BackgroundTransparency = 1
                    peakShadow.TextColor3 = Color3.new(0, 0, 0)
                    peakShadow.Font = peakLabel.Font
                    peakShadow.ZIndex = 1
                    peakShadow.Parent = kJ
                    EJ = 0
                    local f = game:GetService("RunService")
                    WJ = f.Heartbeat:Connect(function()
                        local b = gJ.Get_Balls() or {}
                        for f, I in pairs(s) do
                            local a = false
                            for s, b in ipairs(b) do
                                if b == f then
                                    a = true
                                    break
                                end
                            end
                            if not a then
                                (s)[f] = nil
                            end
                        end
                        for b, f in ipairs(b) do
                            local I = f:FindFirstChild("zoomies")
                            if I then
                                local b = I.VectorVelocity.Magnitude;
                                (s)[f] = (s)[f] or 0
                                if b > (s)[f] then
                                    (s)[f] = b
                                end
                                local a = ("Velocity: %.2f"):format(b)
                                textLabel.Text = a
                                shadowLabel.Text = a
                                local O = ("Peak: %.2f"):format((s)[f])
                                peakLabel.Text = O
                                peakShadow.Text = O
                                break
                            end
                        end
                    end)
                end
            else
                if WJ then
                    WJ:Disconnect()
                    WJ = nil
                end
                if kJ then
                    kJ:Destroy()
                    kJ = nil
                end
                EJ = 0
            end
        end
    })
    local PJ
    local SJ = g:create_module({
        title = "Visualiser";
        flag = "Visualiser",
        description = "Parry Range Visualiser";
        section = "right";
        callback = function(s)
            if s then
                if not PJ then
                    PJ = Instance.new("Part")
                    PJ.Name = "VisualiserPart"
                    PJ.Shape = Enum.PartType.Ball
                    PJ.Material = Enum.Material.ForceField
                    PJ.Color = Color3.fromRGB(255, 255, 255)
                    PJ.Transparency = 0
                    PJ.CastShadow = false
                    PJ.Anchored = true
                    PJ.CanCollide = false
                    PJ.Parent = workspace
                end
                eJ.Visualiser = (game:GetService("RunService")).RenderStepped:Connect(function()
                    local s = Y.Character
                    local b = s and s:FindFirstChild("HumanoidRootPart")
                    if b and PJ then
                        PJ.CFrame = b.CFrame
                    end
                    if (getgenv()).VisualiserRainbow then
                        local s = (tick() % 5) / 5
                        PJ.Color = Color3.fromHSV(s, 1, 1)
                    else
                        local s = (getgenv()).VisualiserHue or 0
                        PJ.Color = Color3.fromHSV(s / 360, 1, 1)
                    end
                    local f = 0
                    local I = 350
                    local a = gJ.Get_Balls()
                    for s, b in pairs(a) do
                        if b and b:FindFirstChild("zoomies") then
                            local s = b.AssemblyLinearVelocity
                            f = math.min(s.Magnitude, I) / 6.5
                            break
                        end
                    end
                    local O = math.max(f, 6.5)
                    if PJ then
                        PJ.Size = Vector3.new(O, O, O)
                    end
                end)
            else
                if eJ.Visualiser then
                    eJ.Visualiser:Disconnect()
                    eJ.Visualiser = nil
                end
                if PJ then
                    PJ:Destroy()
                    PJ = nil
                end
            end
        end
    })
    SJ:create_checkbox({
        title = "Rainbow",
        flag = "VisualiserRainbow",
        callback = function(s)
            (getgenv()).VisualiserRainbow = s
        end
    })
    SJ:create_slider({
        title = "Color Hue",
        flag = "VisualiserHue",
        minimum_value = 0;
        maximum_value = 360;
        value = 0,
        callback = function(s)
            (getgenv()).VisualiserHue = s
        end
    })
    local mJ = g:create_module({
        title = "Auto Claim Rewards";
        flag = "AutoClaimRewards";
        description = "Automatically claims rewards.";
        section = "left",
        callback = function(s)
            (getgenv()).AutoClaimRewards = s
            if s then
                local s = game:GetService("ReplicatedStorage")
                local b = (((s:WaitForChild("Packages")):WaitForChild("_Index")):WaitForChild("sleitnick_net@0.1.0")):WaitForChild("net")
                task.spawn(function()
                    (b)["RF/RedeemQuestsType"]:InvokeServer("Battlepass", "Weekly");
                    (b)["RF/RedeemQuestsType"]:InvokeServer("Battlepass", "Daily");
                    (b)["RF/ClaimAllDailyMissions"]:InvokeServer("Daily");
                    (b)["RF/ClaimAllDailyMissions"]:InvokeServer("Weekly");
                    (b)["RF/ClaimAllClanBPQuests"]:InvokeServer()
                    local s = tonumber(z:GetAttribute("JoinedTimestamp")) + 10
                    for f = 1, 6, 1 do
                        while workspace:GetServerTimeNow() < (s + f * 300) + 1 do
                            task.wait(1)
                            if not (getgenv()).AutoClaimRewards then
                                return
                            end
                        end;
                        (b)["RF/ClaimPlaytimeReward"]:InvokeServer(f)
                    end
                end)
            end
        end
    })
    local xJ = g:create_module({
        title = "Disable Quantum Arena Effects";
        flag = "NoQuantumEffects";
        description = "Disables Quantum Arena effects.";
        section = "right",
        callback = function(s)
            (getgenv()).NoQuantumEffects = s
            if s then
                task.spawn(function()
                    local s
                    while task.wait() and ((getgenv()).NoQuantumEffects and not s) do
                        for b, f in getconnections(r.Remotes.QuantumArena.OnClientEvent) do
                            s = f
                            f:Disable()
                        end
                    end
                end)
            end
        end
    })
    local CJ = g:create_module({
        title = "No Render",
        flag = "No_Render";
        description = "Disables rendering of effects",
        section = "left",
        callback = function(s)
            Y.PlayerScripts.EffectScripts.ClientFX.Disabled = s
            if s then
                (eJ)["No Render"] = workspace.Runtime.ChildAdded:Connect(function(s)
                    L:AddItem(s, 0)
                end)
            else
                if (eJ)["No Render"] then
                    (eJ)["No Render"]:Disconnect();
                    (eJ)["No Render"] = nil
                end
            end
        end
    })
    local KJ = g:create_module({
        title = "Custom Announcer";
        flag = "Custom_Announcer";
        description = "Customize the game announcements",
        section = "right";
        callback = function(s)
            if s then
                local s = Y.PlayerGui:WaitForChild("announcer")
                local b = s:FindFirstChild("Winner")
                if b then
                    b.Text = n._config._flags.announcer_text or "discord.gg/asasaasasdefrtg5ryghrhr6yj6j7jj"
                end
                s.ChildAdded:Connect(function(s)
                    if s.Name == "Winner" then
                        s.Changed:Connect(function(b)
                            if b == "Text" and n._config._flags.Custom_Announcer then
                                s.Text = n._config._flags.announcer_text or "discord.gg/efsefsfsefsfsfsfs"
                            end
                        end)
                        if n._config._flags.Custom_Announcer then
                            s.Text = n._config._flags.announcer_text or "discord.gg/eg5y566u56erthhd"
                        end
                    end
                end)
            end
        end
    })
    KJ:create_textbox({
        title = "Custom Announcement Text";
        placeholder = "Enter custom announcer text... ";
        flag = "announcer_text",
        callback = function(s)
            n._config._flags.announcer_text = s
            if n._config._flags.Custom_Announcer then
                local b = Y.PlayerGui:WaitForChild("announcer")
                local f = b:FindFirstChild("Winner")
                if f then
                    f.Text = s
                end
            end
        end
    })
end
r.Remotes.ParrySuccessAll.OnClientEvent:Connect(function(s, b)
    if b.Parent and b.Parent ~= Y.Character then
        if b.Parent.Parent ~= workspace.Alive then
            return
        end
    end
    gJ.Closest_Player()
    local f = gJ.Get_Ball()
    if not f then
        return
    end
    local I = (Y.Character.PrimaryPart.Position - cJ.PrimaryPart.Position).Magnitude
    local a = (Y.Character.PrimaryPart.Position - f.Position).Magnitude
    local O = (Y.Character.PrimaryPart.Position - f.Position).Unit
    local y = O:Dot(f.AssemblyLinearVelocity.Unit)
    local z = gJ.Is_Curved()
    if I < 15 and (a < 15 and y > - 0.25) then
        if z then
            gJ.Parry(pJ)
        end
    end
    if not V then
        return
    end
    V:Stop()
end)
r.Remotes.ParrySuccess.OnClientEvent:Connect(function()
    if Y.Character.Parent ~= workspace.Alive then
        return
    end
    if not V then
        return
    end
    V:Stop()
end)
workspace.Balls.ChildAdded:Connect(function()
    VJ = false
end)
workspace.Balls.ChildRemoved:Connect(function(s)
    iJ = 0
    VJ = false
    if (eJ)["Target Change"] then
        (eJ)["Target Change"]:Disconnect();
        (eJ)["Target Change"] = nil
    end
end)
W:load()
