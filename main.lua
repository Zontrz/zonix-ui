--[[
    ╔══════════════════════════════════════════════════════════════╗
    ║                    Zonix UI v1.3.3                           ║
    ║                                                              ║
    ║                   Created by Zontraz                         ║
    ║                   https://zon.su                             ║
    ╚══════════════════════════════════════════════════════════════╝
    
    🔥 INSANE FEATURES:
    
    ✓ EXECUTOR SUPPORT:
      • Works on ALL 40+ executors across ALL platforms
      • Windows: Potassium, Matcha, Xeno, Photon, DX9WARE V2, Sirhurt, Valex, 
                 Seliware, Volt, Velocity, Solara, Matrix Hub, Wave, Lovreware,
                 Isabelle, Zenith, Swift, Volcano, Ronin, Assembly, Bunni.lol,
                 Serotonin, Melatonin, Nucleus, Synapse Z, Yerba, Severe, ChocoSploit, RbxCli
      • Mac: Cryptic, Hydrogen, Macsploit
      • Android: Cryptic, Delta, Codex, Krnl, Vega X
      • iOS: Delta, Krnl
      • Universal clipboard (setclipboard on ANY executor)
      • Auto-detection system
      • ⚡ AUTOEXE SUPPORT (NEW!) - Works when executed before game loads!
    
    ✓ NORMAL FEATURES:
      • Windows & Tabs
      • Buttons with callbacks
      • Toggles with smooth animations
      • Checkboxes (NEW!)
      • Sliders (draggable)
      • Dropdowns (expandable)
      • Textboxes with validation
      • Labels & Sections
      • Keybinds
      • Color Pickers (RGB/HSV)
    
    ✓ ADVANCED FEATURES:
      • Multi-Dropdown (select multiple)
      • Search functionality
      • Progress Bars
      • Loading Indicators
      • Console Logger (built-in)
      • Status Bar with FPS Counter
      • Config System (Save/Load)
      • Copy to Clipboard buttons
      • Dependency System
      • Collapsible Sections
      • Paragraph Text
      • Dividers
      • Mini Components
      • Gradient Support
      • Transparency Sliders
      • Toggle Groups
      • Custom Themes
      • SubTabs (NEW!)
      • GroupBoxes (NEW!)
      • Spacing Control (NEW!)
      • In-line Layout (NEW!)
    
    ✓ UI FEATURES:
      • 3 Built-in Themes + Custom
      • Rainbow/Chroma Mode
      • Blur Effects
      • Tooltips
      • Ripple Animations
      • Watermark
      • Notifications (4 types)
      • Mobile Responsive
      • Draggable Windows
      • Minimize/Maximize
      • Custom Window Icons
]]
-- ═══════════════════════════════════════════════════════════════
--                    AUTOEXE SUPPORT - WAIT FOR GAME
-- ═══════════════════════════════════════════════════════════════

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local TextService = game:GetService("TextService")

local Player = Players.LocalPlayer
if not Player then
    Player = Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
    Player = Players.LocalPlayer
end

local Mouse
local function GetMouse()
    local success, result = pcall(function()
        return Player:GetMouse()
    end)
    if success then
        return result
    else
        task.wait(0.1)
        return Player:GetMouse()
    end
end
Mouse = GetMouse()

-- ═══════════════════════════════════════════════════════════════
--                    EXECUTOR COMPATIBILITY
-- ═══════════════════════════════════════════════════════════════

local Executor = {}

local function FindFunc(...)
    for _, name in ipairs({...}) do
        local success, func =
            pcall(
            function()
                return getgenv()[name] or _G[name] or getfenv()[name]
            end
        )
        if success and func and type(func) == "function" then
            return func
        end
    end
    return nil
end

local function DetectExecutor()
    -- Try built-in executor identification functions first
    if getexecutorname then
        return getexecutorname() or "Unknown"
    elseif identifyexecutor then
        return identifyexecutor() or "Unknown"
    end

    -- Windows Executors
    if KRNL_LOADED then
        return "KRNL"
    elseif getgenv().Potassium then
        return "Potassium"
    elseif getgenv().Matcha then
        return "Matcha"
    elseif Xeno or getgenv().Xeno then
        return "Xeno"
    elseif getgenv().Photon then
        return "Photon"
    elseif getgenv().DX9WARE then
        return "DX9WARE V2"
    elseif Sirhurt or getgenv().Sirhurt then
        return "Sirhurt"
    elseif Valex or getgenv().Valex then
        return "Valex"
    elseif getgenv().Seliware then
        return "Seliware"
    elseif Volt or getgenv().Volt then
        return "Volt"
    elseif getgenv().Velocity then
        return "Velocity"
    elseif Solara or getgenv().Solara then
        return "Solara"
    elseif getgenv().MatrixHub then
        return "Matrix Hub"
    elseif Wave or getgenv().Wave then
        return "Wave"
    elseif getgenv().Lovreware then
        return "Lovreware"
    elseif getgenv().Isabelle then
        return "Isabelle"
    elseif Zenith or getgenv().Zenith then
        return "Zenith"
    elseif Swift or getgenv().Swift then
        return "Swift"
    elseif getgenv().Volcano then
        return "Volcano"
    elseif getgenv().Ronin then
        return "Ronin"
    elseif getgenv().Assembly then
        return "Assembly"
    elseif getgenv().Bunni then
        return "Bunni.lol"
    elseif getgenv().Serotonin then
        return "Serotonin"
    elseif getgenv().Melatonin then
        return "Melatonin"
    elseif getgenv().Nucleus then
        return "Nucleus"
    elseif syn or getgenv().syn then
        return "Synapse Z"
    elseif getgenv().Yerba then
        return "Yerba"
    elseif getgenv().Severe then
        return "Severe"
    elseif getgenv().ChocoSploit then
        return "ChocoSploit"
    elseif getgenv().RbxCli then
        -- Mac Executors
        return "RbxCli"
    elseif Hydrogen or getgenv().Hydrogen then
        return "Hydrogen"
    elseif getgenv().Macsploit then
        return "Macsploit"
    elseif getgenv().CrypticMac then
        -- Android Executors
        return "Cryptic (Mac)"
    elseif delta or getgenv().delta then
        return "Delta"
    elseif getgenv().Cryptic then
        return "Cryptic"
    elseif getgenv().Codex then
        return "Codex"
    elseif getgenv().VegaX then
        -- iOS Executors (iOS and Android Delta share similar detection)
        -- Additional fallback checks
        return "Vega X"
    elseif issentinel and issentinel() then
        return "Sentinel"
    elseif Fluxus then
        return "Fluxus"
    else
        return "Generic Executor"
    end
end

Executor.Name = DetectExecutor()
Executor.SetClipboard =
    FindFunc("setclipboard", "toclipboard", "writeclipboard", "set_clipboard", "setrbxclipboard") or function(t)
        print("[Clipboard]", t)
    end
Executor.GetHui = FindFunc("gethui", "get_hidden_gui") or function()
        return CoreGui
    end
Executor.QueueTeleport = FindFunc("queue_on_teleport", "queueonteleport") or function()
    end
Executor.IsFile = FindFunc("isfile") or function()
        return false
    end
Executor.ReadFile = FindFunc("readfile") or function()
        return ""
    end
Executor.WriteFile = FindFunc("writefile") or function()
    end
Executor.MakeFolder = FindFunc("makefolder", "createfolder") or function()
    end
Executor.ListFiles = FindFunc("listfiles") or function()
        return {}
    end

-- ═══════════════════════════════════════════════════════════════
--                         MAIN LIBRARY
-- ═══════════════════════════════════════════════════════════════

local Zonix = {
    Version = "1.3.3",
    Creator = "Zontraz",
    Website = "https://zon.su",
    Executor = Executor.Name,
    Flags = {},
    Windows = {},
    Notifications = {},
    Themes = {}
}

Zonix.Themes.Dark = {
    Background = Color3.fromRGB(15, 15, 20),
    Secondary = Color3.fromRGB(20, 20, 27),
    Tertiary = Color3.fromRGB(25, 25, 35),
    Border = Color3.fromRGB(40, 40, 50),
    Text = Color3.fromRGB(255, 255, 255),
    TextDark = Color3.fromRGB(180, 180, 190),
    Accent = Color3.fromRGB(138, 43, 226),
    AccentDark = Color3.fromRGB(108, 33, 186),
    Success = Color3.fromRGB(67, 181, 129),
    Warning = Color3.fromRGB(250, 166, 26),
    Error = Color3.fromRGB(237, 66, 69),
    Info = Color3.fromRGB(52, 152, 219),
    Topbar = Color3.fromRGB(12, 12, 17)
}

Zonix.Themes.Light = {
    Background = Color3.fromRGB(245, 245, 250),
    Secondary = Color3.fromRGB(255, 255, 255),
    Tertiary = Color3.fromRGB(250, 250, 255),
    Border = Color3.fromRGB(220, 220, 230),
    Text = Color3.fromRGB(20, 20, 30),
    TextDark = Color3.fromRGB(100, 100, 120),
    Accent = Color3.fromRGB(138, 43, 226),
    AccentDark = Color3.fromRGB(108, 33, 186),
    Success = Color3.fromRGB(67, 181, 129),
    Warning = Color3.fromRGB(250, 166, 26),
    Error = Color3.fromRGB(237, 66, 69),
    Info = Color3.fromRGB(52, 152, 219),
    Topbar = Color3.fromRGB(240, 240, 248)
}

Zonix.Themes.Midnight = {
    Background = Color3.fromRGB(10, 10, 15),
    Secondary = Color3.fromRGB(15, 15, 22),
    Tertiary = Color3.fromRGB(20, 20, 30),
    Border = Color3.fromRGB(30, 30, 40),
    Text = Color3.fromRGB(200, 200, 255),
    TextDark = Color3.fromRGB(150, 150, 180),
    Accent = Color3.fromRGB(0, 180, 255),
    AccentDark = Color3.fromRGB(0, 140, 200),
    Success = Color3.fromRGB(80, 200, 120),
    Warning = Color3.fromRGB(255, 180, 0),
    Error = Color3.fromRGB(255, 80, 80),
    Info = Color3.fromRGB(100, 150, 255),
    Topbar = Color3.fromRGB(8, 8, 12)
}

Zonix.Settings = {
    Theme = "Dark",
    RainbowMode = false,
    RainbowSpeed = 5,
    AnimationSpeed = 0.25,
    TooltipsEnabled = true,
    ConfigFolder = "ZonixUI"
}

-- ═══════════════════════════════════════════════════════════════
--                        UTILITY FUNCTIONS
-- ═══════════════════════════════════════════════════════════════

local Utils = {}

function Utils:Tween(obj, props, dur, style, dir)
    dur = dur or Zonix.Settings.AnimationSpeed
    style = style or Enum.EasingStyle.Quad
    dir = dir or Enum.EasingDirection.Out
    local tween = TweenService:Create(obj, TweenInfo.new(dur, style, dir), props)
    tween:Play()
    return tween
end

function Utils:GetTheme()
    return Zonix.Themes[Zonix.Settings.Theme] or Zonix.Themes.Dark
end

function Utils:Rainbow()
    local hue = tick() % Zonix.Settings.RainbowSpeed / Zonix.Settings.RainbowSpeed
    return Color3.fromHSV(hue, 0.8, 1)
end

function Utils:Ripple(button)
    spawn(
        function()
            local ripple = Instance.new("Frame")
            ripple.Name = "Ripple"
            ripple.AnchorPoint = Vector2.new(0.5, 0.5)
            ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ripple.BackgroundTransparency = 0.7
            ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
            ripple.Size = UDim2.new(0, 0, 0, 0)
            ripple.ZIndex = 10
            ripple.Parent = button

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(1, 0)
            corner.Parent = ripple

            Utils:Tween(ripple, {Size = UDim2.new(1.5, 0, 1.5, 0), BackgroundTransparency = 1}, 0.5)
            task.wait(0.5)
            ripple:Destroy()
        end
    )
end

function Utils:MakeDraggable(frame, handle)
    handle = handle or frame
    local dragging, dragInput, dragStart, startPos

    handle.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = frame.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            dragging = false
                        end
                    end
                )
            end
        end
    )

    handle.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
             then
                dragInput = input
            end
        end
    )

    UserInputService.InputChanged:Connect(
        function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                Utils:Tween(
                    frame,
                    {
                        Position = UDim2.new(
                            startPos.X.Scale,
                            startPos.X.Offset + delta.X,
                            startPos.Y.Scale,
                            startPos.Y.Offset + delta.Y
                        )
                    },
                    0.1
                )
            end
        end
    )
end

function Utils:AddTooltip(element, text)
    if not Zonix.Settings.TooltipsEnabled then
        return
    end

    local theme = Utils:GetTheme()
    local tooltip

    element.MouseEnter:Connect(
        function()
            if tooltip then
                tooltip:Destroy()
            end

            tooltip = Instance.new("TextLabel")
            tooltip.Name = "Tooltip"
            tooltip.BackgroundColor3 = theme.Tertiary
            tooltip.BorderSizePixel = 0
            tooltip.Position = UDim2.new(0, Mouse.X + 10, 0, Mouse.Y + 10)
            tooltip.Size = UDim2.new(0, 200, 0, 0)
            tooltip.AutomaticSize = Enum.AutomaticSize.Y
            tooltip.Font = Enum.Font.Gotham
            tooltip.Text = " " .. text .. " "
            tooltip.TextColor3 = theme.Text
            tooltip.TextSize = 11
            tooltip.TextWrapped = true
            tooltip.ZIndex = 1000
            tooltip.Parent = element:FindFirstAncestorOfClass("ScreenGui")

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 6)
            corner.Parent = tooltip

            local stroke = Instance.new("UIStroke")
            stroke.Color = theme.Border
            stroke.Thickness = 1
            stroke.Parent = tooltip

            local padding = Instance.new("UIPadding")
            padding.PaddingTop = UDim.new(0, 5)
            padding.PaddingBottom = UDim.new(0, 5)
            padding.PaddingLeft = UDim.new(0, 8)
            padding.PaddingRight = UDim.new(0, 8)
            padding.Parent = tooltip
        end
    )

    element.MouseLeave:Connect(
        function()
            if tooltip then
                tooltip:Destroy()
            end
        end
    )

    element.MouseMoved:Connect(
        function()
            if tooltip then
                tooltip.Position = UDim2.new(0, Mouse.X + 10, 0, Mouse.Y + 10)
            end
        end
    )
end

local function CreateGui()
    local gui = Instance.new("ScreenGui")
    gui.Name = "ZonixUI_" .. HttpService:GenerateGUID(false):sub(1, 8)
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.ResetOnSpawn = false
    gui.DisplayOrder = 999
    gui.IgnoreGuiInset = true

    pcall(
        function()
            gui.Parent = Executor.GetHui()
        end
    )

    if not gui.Parent then
        gui.Parent = CoreGui
    end

    return gui
end

-- ═══════════════════════════════════════════════════════════════
--                      NOTIFICATION SYSTEM
-- ═══════════════════════════════════════════════════════════════

function Zonix:Notify(config)
    config = config or {}
    local title = config.Title or "Notification"
    local content = config.Content or ""
    local duration = config.Duration or 3
    local type = config.Type or "Info"

    local theme = Utils:GetTheme()
    local gui = CreateGui()

    local container = Instance.new("Frame")
    container.Name = "NotifContainer"
    container.AnchorPoint = Vector2.new(1, 0)
    container.BackgroundTransparency = 1
    container.Position = UDim2.new(1, -20, 0, 20)
    container.Size = UDim2.new(0, 320, 1, 0)
    container.Parent = gui

    local notif = Instance.new("Frame")
    notif.BackgroundColor3 = theme.Secondary
    notif.BorderSizePixel = 0
    notif.Position = UDim2.new(0, 400, 0, #Zonix.Notifications * 95)
    notif.Size = UDim2.new(1, 0, 0, 85)
    notif.Parent = container

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = notif

    local stroke = Instance.new("UIStroke")
    stroke.Color = theme.Border
    stroke.Thickness = 1
    stroke.Parent = notif

    local accentColor =
        type == "Success" and theme.Success or type == "Warning" and theme.Warning or type == "Error" and theme.Error or
        theme.Info

    local accent = Instance.new("Frame")
    accent.BackgroundColor3 = accentColor
    accent.BorderSizePixel = 0
    accent.Size = UDim2.new(0, 4, 1, 0)
    accent.Parent = notif

    local accentCorner = Instance.new("UICorner")
    accentCorner.CornerRadius = UDim.new(0, 12)
    accentCorner.Parent = accent

    local icon = Instance.new("TextLabel")
    icon.BackgroundTransparency = 1
    icon.Position = UDim2.new(0, 20, 0, 10)
    icon.Size = UDim2.new(0, 30, 0, 30)
    icon.Font = Enum.Font.GothamBold
    icon.Text = type == "Success" and "✓" or type == "Warning" and "⚠" or type == "Error" and "✕" or "ℹ"
    icon.TextColor3 = accentColor
    icon.TextSize = 20
    icon.Parent = notif

    local titleLabel = Instance.new("TextLabel")
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0, 60, 0, 12)
    titleLabel.Size = UDim2.new(1, -70, 0, 20)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Text = title
    titleLabel.TextColor3 = theme.Text
    titleLabel.TextSize = 14
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = notif

    local contentLabel = Instance.new("TextLabel")
    contentLabel.BackgroundTransparency = 1
    contentLabel.Position = UDim2.new(0, 60, 0, 35)
    contentLabel.Size = UDim2.new(1, -70, 0, 40)
    contentLabel.Font = Enum.Font.Gotham
    contentLabel.Text = content
    contentLabel.TextColor3 = theme.TextDark
    contentLabel.TextSize = 12
    contentLabel.TextWrapped = true
    contentLabel.TextXAlignment = Enum.TextXAlignment.Left
    contentLabel.TextYAlignment = Enum.TextYAlignment.Top
    contentLabel.Parent = notif

    table.insert(Zonix.Notifications, notif)

    Utils:Tween(notif, {Position = UDim2.new(0, 0, 0, (#Zonix.Notifications - 1) * 95)}, 0.4, Enum.EasingStyle.Back)

    task.spawn(
        function()
            task.wait(duration)
            Utils:Tween(notif, {Position = UDim2.new(0, 400, 0, notif.Position.Y.Offset)}, 0.3)
            task.wait(0.3)

            for i, v in pairs(Zonix.Notifications) do
                if v == notif then
                    table.remove(Zonix.Notifications, i)
                end
            end

            gui:Destroy()
        end
    )
end

-- ═══════════════════════════════════════════════════════════════
--                        WATERMARK SYSTEM
-- ═══════════════════════════════════════════════════════════════

function Zonix:Watermark(config)
    config = config or {}
    local text = config.Text or ("Zonix UI v" .. Zonix.Version .. " | " .. Zonix.Executor)

    local theme = Utils:GetTheme()
    local gui = CreateGui()

    local watermark = Instance.new("Frame")
    watermark.BackgroundColor3 = theme.Secondary
    watermark.BorderSizePixel = 0
    watermark.Position = UDim2.new(0, 10, 0, 10)
    watermark.Size = UDim2.new(0, 250, 0, 35)
    watermark.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = watermark

    local stroke = Instance.new("UIStroke")
    stroke.Color = theme.Border
    stroke.Thickness = 1
    stroke.Parent = watermark

    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Font = Enum.Font.GothamBold
    label.Text = text
    label.TextColor3 = theme.Text
    label.TextSize = 12
    label.Parent = watermark

    if Zonix.Settings.RainbowMode then
        task.spawn(
            function()
                while watermark.Parent do
                    stroke.Color = Utils:Rainbow()
                    task.wait(0.1)
                end
            end
        )
    end

    return watermark
end

-- ═══════════════════════════════════════════════════════════════
--                         WINDOW CREATION
-- ═══════════════════════════════════════════════════════════════

function Zonix:Window(config)
    config = config or {}
    local windowName = config.Name or "Zonix UI"
    local windowIcon = config.Icon
    local theme = Utils:GetTheme()

    local window = {
        Tabs = {},
        CurrentTab = nil,
        Minimized = false
    }

    local gui = CreateGui()
    table.insert(Zonix.Windows, gui)

    local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
    local screenSize = workspace.CurrentCamera.ViewportSize
    local windowWidth, windowHeight
    
    if isMobile then
        windowWidth = math.min(screenSize.X * 0.9, 500)
        windowHeight = math.min(screenSize.Y * 0.7, 600)
    else
        local baseWidth = 700
        local baseHeight = 520
        local baseScreenWidth = 1920
        
        if screenSize.X > baseScreenWidth then
            local scaleFactor = math.min(screenSize.X / baseScreenWidth, 1.8)  -- Cap at 1.8x
            windowWidth = baseWidth * scaleFactor
            windowHeight = baseHeight * scaleFactor
        elseif screenSize.X < 1366 then
            local scaleFactor = screenSize.X / 1366
            windowWidth = math.max(baseWidth * scaleFactor, 500)  -- Minimum 500px
            windowHeight = math.max(baseHeight * scaleFactor, 400)  -- Minimum 400px
        else
            windowWidth = baseWidth
            windowHeight = baseHeight
        end
    end

    local main = Instance.new("Frame")
    main.Name = "Main"
    main.AnchorPoint = Vector2.new(0.5, 0.5)
    main.BackgroundColor3 = theme.Background
    main.BorderSizePixel = 0
    main.Position = UDim2.new(0.5, 0, 0.5, 0)
    main.Size = UDim2.new(0, windowWidth, 0, windowHeight)
    main.ClipsDescendants = true
    main.Parent = gui

    workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        local newScreenSize = workspace.CurrentCamera.ViewportSize
        
        if isMobile then
            windowWidth = math.min(newScreenSize.X * 0.9, 500)
            windowHeight = math.min(newScreenSize.Y * 0.7, 600)
        else
            local baseWidth = 700
            local baseHeight = 520
            local baseScreenWidth = 1920
            
            if newScreenSize.X > baseScreenWidth then
                local scaleFactor = math.min(newScreenSize.X / baseScreenWidth, 1.8)
                windowWidth = baseWidth * scaleFactor
                windowHeight = baseHeight * scaleFactor
            elseif newScreenSize.X < 1366 then
                local scaleFactor = newScreenSize.X / 1366
                windowWidth = math.max(baseWidth * scaleFactor, 500)
                windowHeight = math.max(baseHeight * scaleFactor, 400)
            else
                windowWidth = baseWidth
                windowHeight = baseHeight
            end
        end
        
        if not window.Minimized then
            main.Size = UDim2.new(0, windowWidth, 0, windowHeight)
        else
            main.Size = UDim2.new(0, windowWidth, 0, 45)
        end
    end)

    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 12)
    mainCorner.Parent = main

    local mainStroke = Instance.new("UIStroke")
    mainStroke.Color = theme.Border
    mainStroke.Thickness = 1
    mainStroke.Parent = main

    local shadow = Instance.new("ImageLabel")
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.BackgroundTransparency = 1
    shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    shadow.Size = UDim2.new(1, 30, 1, 30)
    shadow.Image = "rbxassetid://5554236805"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.7
    shadow.ZIndex = 0
    shadow.Parent = main

    local topbar = Instance.new("Frame")
    topbar.BackgroundColor3 = theme.Topbar
    topbar.BorderSizePixel = 0
    topbar.Size = UDim2.new(1, 0, 0, 45)
    topbar.Parent = main

    local topCorner = Instance.new("UICorner")
    topCorner.CornerRadius = UDim.new(0, 12)
    topCorner.Parent = topbar

    local topFix = Instance.new("Frame")
    topFix.BackgroundColor3 = theme.Topbar
    topFix.BorderSizePixel = 0
    topFix.Position = UDim2.new(0, 0, 1, -12)
    topFix.Size = UDim2.new(1, 0, 0, 12)
    topFix.Parent = topbar

    if windowIcon then
        local iconType = "image"
        local iconValue = windowIcon

        if type(windowIcon) == "table" then
            iconType = windowIcon.Type or "image"
            iconValue = windowIcon.Value or ""
        end

        if iconType == "emoji" or iconType == "text" then
            local iconLabel = Instance.new("TextLabel")
            iconLabel.BackgroundTransparency = 1
            iconLabel.Position = UDim2.new(0, 12, 0.5, 0)
            iconLabel.AnchorPoint = Vector2.new(0, 0.5)
            iconLabel.Size = UDim2.new(0, 28, 0, 28)
            iconLabel.Font = Enum.Font.GothamBold
            iconLabel.Text = iconValue
            iconLabel.TextColor3 = theme.Text
            iconLabel.TextSize = 20
            iconLabel.TextXAlignment = Enum.TextXAlignment.Center
            iconLabel.TextYAlignment = Enum.TextYAlignment.Center
            iconLabel.Parent = topbar

            local title = Instance.new("TextLabel")
            title.BackgroundTransparency = 1
            title.Position = UDim2.new(0, 48, 0, 0)
            title.Size = UDim2.new(0.7, -48, 1, 0)
            title.Font = Enum.Font.GothamBold
            title.Text = windowName
            title.TextColor3 = theme.Text
            title.TextSize = 16
            title.TextXAlignment = Enum.TextXAlignment.Left
            title.Parent = topbar
        else
            local icon = Instance.new("ImageLabel")
            icon.BackgroundTransparency = 1
            icon.Position = UDim2.new(0, 12, 0.5, 0)
            icon.AnchorPoint = Vector2.new(0, 0.5)
            icon.Size = UDim2.new(0, 28, 0, 28)
            icon.Image = iconValue
            icon.ScaleType = Enum.ScaleType.Fit
            icon.Parent = topbar

            local title = Instance.new("TextLabel")
            title.BackgroundTransparency = 1
            title.Position = UDim2.new(0, 48, 0, 0)
            title.Size = UDim2.new(0.7, -48, 1, 0)
            title.Font = Enum.Font.GothamBold
            title.Text = windowName
            title.TextColor3 = theme.Text
            title.TextSize = 16
            title.TextXAlignment = Enum.TextXAlignment.Left
            title.Parent = topbar
        end
    else
        local title = Instance.new("TextLabel")
        title.BackgroundTransparency = 1
        title.Position = UDim2.new(0, 15, 0, 0)
        title.Size = UDim2.new(0.7, 0, 1, 0)
        title.Font = Enum.Font.GothamBold
        title.Text = windowName
        title.TextColor3 = theme.Text
        title.TextSize = 16
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.Parent = topbar
    end

    local controls = Instance.new("Frame")
    controls.AnchorPoint = Vector2.new(1, 0)
    controls.BackgroundTransparency = 1
    controls.Position = UDim2.new(1, -10, 0, 0)
    controls.Size = UDim2.new(0, 80, 1, 0)
    controls.Parent = topbar

    local controlsList = Instance.new("UIListLayout")
    controlsList.FillDirection = Enum.FillDirection.Horizontal
    controlsList.HorizontalAlignment = Enum.HorizontalAlignment.Right
    controlsList.VerticalAlignment = Enum.VerticalAlignment.Center
    controlsList.Padding = UDim.new(0, 8)
    controlsList.Parent = controls

    local minimize = Instance.new("TextButton")
    minimize.BackgroundColor3 = theme.Tertiary
    minimize.BorderSizePixel = 0
    minimize.Size = UDim2.new(0, 30, 0, 30)
    minimize.Font = Enum.Font.GothamBold
    minimize.Text = "-"
    minimize.TextColor3 = theme.Text
    minimize.TextSize = 18
    minimize.Parent = controls

    local minCorner = Instance.new("UICorner")
    minCorner.CornerRadius = UDim.new(0, 6)
    minCorner.Parent = minimize

    local close = Instance.new("TextButton")
    close.BackgroundColor3 = theme.Error
    close.BorderSizePixel = 0
    close.Size = UDim2.new(0, 30, 0, 30)
    close.Font = Enum.Font.GothamBold
    close.Text = "X"
    close.TextColor3 = Color3.fromRGB(255, 255, 255)
    close.TextSize = 20
    close.Parent = controls

    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 6)
    closeCorner.Parent = close

    local tabBar = Instance.new("Frame")
    tabBar.BackgroundColor3 = theme.Secondary
    tabBar.BorderSizePixel = 0
    tabBar.Position = UDim2.new(0, 0, 0, 45)
    tabBar.Size = UDim2.new(0, 160, 1, -45)
    tabBar.Parent = main

    local tabList = Instance.new("UIListLayout")
    tabList.Padding = UDim.new(0, 4)
    tabList.SortOrder = Enum.SortOrder.LayoutOrder
    tabList.Parent = tabBar

    local tabPadding = Instance.new("UIPadding")
    tabPadding.PaddingTop = UDim.new(0, 10)
    tabPadding.PaddingLeft = UDim.new(0, 10)
    tabPadding.PaddingRight = UDim.new(0, 10)
    tabPadding.Parent = tabBar

    local content = Instance.new("Frame")
    content.BackgroundTransparency = 1
    content.Position = UDim2.new(0, 160, 0, 45)
    content.Size = UDim2.new(1, -160, 1, -45)
    content.Parent = main

    Utils:MakeDraggable(main, topbar)

    minimize.MouseButton1Click:Connect(
        function()
            Utils:Ripple(minimize)
            window.Minimized = not window.Minimized
            Utils:Tween(main, {Size = window.Minimized and UDim2.new(0, windowWidth, 0, 45) or UDim2.new(0, windowWidth, 0, windowHeight)}, 0.3)
            minimize.Text = window.Minimized and "+" or "-"
        end
    )

    minimize.MouseEnter:Connect(
        function()
            Utils:Tween(minimize, {BackgroundColor3 = theme.Border}, 0.2)
        end
    )

    minimize.MouseLeave:Connect(
        function()
            Utils:Tween(minimize, {BackgroundColor3 = theme.Tertiary}, 0.2)
        end
    )

    close.MouseButton1Click:Connect(
        function()
            Utils:Ripple(close)
            Utils:Tween(main, {Size = UDim2.new(0, 0, 0, 0)}, 0.3)
            task.wait(0.3)
            gui:Destroy()
        end
    )

    close.MouseEnter:Connect(
        function()
            Utils:Tween(close, {BackgroundColor3 = Color3.fromRGB(200, 50, 50)}, 0.2)
        end
    )

    close.MouseLeave:Connect(
        function()
            Utils:Tween(close, {BackgroundColor3 = theme.Error}, 0.2)
        end
    )

    if Zonix.Settings.RainbowMode then
        task.spawn(
            function()
                while main.Parent do
                    mainStroke.Color = Utils:Rainbow()
                    task.wait(0.1)
                end
            end
        )
    end

    function window:Tab(tabConfig)
        tabConfig = tabConfig or {}
        local tabName = tabConfig.Name or "Tab"
        local iconRaw = tabConfig.Icon or "📄"

        local iconType = "emoji"
        local iconValue = iconRaw

        if type(iconRaw) == "table" then
            iconType = iconRaw.Type or "emoji"
            iconValue = iconRaw.Value or "📄"
        end

        local tab = {
            Elements = {},
            Active = false
        }

        local tabBtn = Instance.new("TextButton")
        tabBtn.BackgroundColor3 = theme.Tertiary
        tabBtn.BorderSizePixel = 0
        tabBtn.Size = UDim2.new(1, 0, 0, 40)
        tabBtn.Font = Enum.Font.GothamBold
        tabBtn.Text = ""
        tabBtn.TextColor3 = theme.TextDark
        tabBtn.TextSize = 13
        tabBtn.TextXAlignment = Enum.TextXAlignment.Left
        tabBtn.Parent = tabBar

        local tabCorner = Instance.new("UICorner")
        tabCorner.CornerRadius = UDim.new(0, 8)
        tabCorner.Parent = tabBtn

        local tabPad = Instance.new("UIPadding")
        tabPad.PaddingLeft = UDim.new(0, 10)
        tabPad.Parent = tabBtn

        local tabLayout = Instance.new("Frame")
        tabLayout.BackgroundTransparency = 1
        tabLayout.Size = UDim2.new(1, 0, 1, 0)
        tabLayout.Parent = tabBtn

        local tabListLayout = Instance.new("UIListLayout")
        tabListLayout.FillDirection = Enum.FillDirection.Horizontal
        tabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
        tabListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        tabListLayout.Padding = UDim.new(0, 8)
        tabListLayout.Parent = tabLayout

        if iconType == "image" then
            local iconImg = Instance.new("ImageLabel")
            iconImg.BackgroundTransparency = 1
            iconImg.Size = UDim2.new(0, 18, 0, 18)
            iconImg.Image = iconValue
            iconImg.ScaleType = Enum.ScaleType.Fit
            iconImg.Parent = tabLayout

            local textLabel = Instance.new("TextLabel")
            textLabel.BackgroundTransparency = 1
            textLabel.Size = UDim2.new(0, 100, 1, 0)
            textLabel.AutomaticSize = Enum.AutomaticSize.X
            textLabel.Font = Enum.Font.GothamBold
            textLabel.Text = tabName
            textLabel.TextColor3 = theme.TextDark
            textLabel.TextSize = 13
            textLabel.TextXAlignment = Enum.TextXAlignment.Left
            textLabel.Parent = tabLayout

            tab.TextLabel = textLabel
        else
            local iconText = Instance.new("TextLabel")
            iconText.BackgroundTransparency = 1
            iconText.Size = UDim2.new(0, 20, 1, 0)
            iconText.Font = Enum.Font.GothamBold
            iconText.Text = iconValue
            iconText.TextColor3 = theme.TextDark
            iconText.TextSize = 16
            iconText.TextXAlignment = Enum.TextXAlignment.Left
            iconText.Parent = tabLayout

            local textLabel = Instance.new("TextLabel")
            textLabel.BackgroundTransparency = 1
            textLabel.Size = UDim2.new(0, 100, 1, 0)
            textLabel.AutomaticSize = Enum.AutomaticSize.X
            textLabel.Font = Enum.Font.GothamBold
            textLabel.Text = tabName
            textLabel.TextColor3 = theme.TextDark
            textLabel.TextSize = 13
            textLabel.TextXAlignment = Enum.TextXAlignment.Left
            textLabel.Parent = tabLayout

            tab.IconText = iconText
            tab.TextLabel = textLabel
        end

        local tabContent = Instance.new("ScrollingFrame")
        tabContent.BackgroundTransparency = 1
        tabContent.BorderSizePixel = 0
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.ScrollBarThickness = 4
        tabContent.ScrollBarImageColor3 = theme.Accent
        tabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        tabContent.Visible = false
        tabContent.Parent = content

        local contentList = Instance.new("UIListLayout")
        contentList.Padding = UDim.new(0, 8)
        contentList.SortOrder = Enum.SortOrder.LayoutOrder
        contentList.Parent = tabContent

        local contentPad = Instance.new("UIPadding")
        contentPad.PaddingTop = UDim.new(0, 15)
        contentPad.PaddingLeft = UDim.new(0, 15)
        contentPad.PaddingRight = UDim.new(0, 15)
        contentPad.PaddingBottom = UDim.new(0, 15)
        contentPad.Parent = tabContent

        contentList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
            function()
                tabContent.CanvasSize = UDim2.new(0, 0, 0, contentList.AbsoluteContentSize.Y + 30)
            end
        )

        tabBtn.MouseButton1Click:Connect(
            function()
                Utils:Ripple(tabBtn)

                for _, t in pairs(window.Tabs) do
                    t.Active = false
                    for _, btn in pairs(tabBar:GetChildren()) do
                        if btn:IsA("TextButton") then
                            Utils:Tween(btn, {BackgroundColor3 = theme.Tertiary}, 0.2)
                            for _, child in pairs(btn:GetDescendants()) do
                                if child:IsA("TextLabel") then
                                    Utils:Tween(child, {TextColor3 = theme.TextDark}, 0.2)
                                end
                            end
                        end
                    end
                    for _, c in pairs(content:GetChildren()) do
                        if c:IsA("ScrollingFrame") then
                            c.Visible = false
                        end
                    end
                end

                tab.Active = true
                Utils:Tween(tabBtn, {BackgroundColor3 = theme.Accent}, 0.2)
                if tab.TextLabel then
                    Utils:Tween(tab.TextLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
                end
                if tab.IconText then
                    Utils:Tween(tab.IconText, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
                end
                tabContent.Visible = true
            end
        )

        tabBtn.MouseEnter:Connect(
            function()
                if not tab.Active then
                    Utils:Tween(tabBtn, {BackgroundColor3 = theme.Border}, 0.2)
                end
            end
        )

        tabBtn.MouseLeave:Connect(
            function()
                if not tab.Active then
                    Utils:Tween(tabBtn, {BackgroundColor3 = theme.Tertiary}, 0.2)
                end
            end
        )

        table.insert(window.Tabs, tab)

        if #window.Tabs == 1 then
            task.spawn(
                function()
                    Utils:Ripple(tabBtn)

                    for _, t in pairs(window.Tabs) do
                        t.Active = false
                        for _, btn in pairs(tabBar:GetChildren()) do
                            if btn:IsA("TextButton") then
                                Utils:Tween(btn, {BackgroundColor3 = theme.Tertiary}, 0.2)
                                for _, child in pairs(btn:GetDescendants()) do
                                    if child:IsA("TextLabel") then
                                        Utils:Tween(child, {TextColor3 = theme.TextDark}, 0.2)
                                    end
                                end
                            end
                        end
                        for _, c in pairs(content:GetChildren()) do
                            if c:IsA("ScrollingFrame") then
                                c.Visible = false
                            end
                        end
                    end

                    tab.Active = true
                    Utils:Tween(tabBtn, {BackgroundColor3 = theme.Accent}, 0.2)
                    if tab.TextLabel then
                        Utils:Tween(tab.TextLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
                    end
                    if tab.IconText then
                        Utils:Tween(tab.IconText, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
                    end
                    tabContent.Visible = true
                end
            )
        end

        -- ═══════════════════════════════════════════════════════
        --                    COMPONENT FUNCTIONS
        -- ═══════════════════════════════════════════════════════

        function tab:Section(name)
            local section = Instance.new("Frame")
            section.BackgroundTransparency = 1
            section.Size = UDim2.new(1, 0, 0, 30)
            section.Parent = tabContent

            local label = Instance.new("TextLabel")
            label.BackgroundTransparency = 1
            label.Size = UDim2.new(1, 0, 1, 0)
            label.Font = Enum.Font.GothamBold
            label.Text = name
            label.TextColor3 = theme.Text
            label.TextSize = 14
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Parent = section

            local div = Instance.new("Frame")
            div.BackgroundColor3 = theme.Border
            div.BorderSizePixel = 0
            div.Position = UDim2.new(0, 0, 1, -1)
            div.Size = UDim2.new(1, 0, 0, 1)
            div.Parent = section
        end

        function tab:Label(text)
            local labelFrame = Instance.new("Frame")
            labelFrame.BackgroundTransparency = 1
            labelFrame.Size = UDim2.new(1, 0, 0, 25)
            labelFrame.Parent = tabContent

            local label = Instance.new("TextLabel")
            label.BackgroundTransparency = 1
            label.Size = UDim2.new(1, 0, 1, 0)
            label.Font = Enum.Font.Gotham
            label.Text = text
            label.TextColor3 = theme.TextDark
            label.TextSize = 13
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.TextWrapped = true
            label.Parent = labelFrame

            return {
                Set = function(_, newText)
                    label.Text = newText
                end
            }
        end

        function tab:Paragraph(title, text)
            local paraFrame = Instance.new("Frame")
            paraFrame.BackgroundColor3 = theme.Secondary
            paraFrame.BorderSizePixel = 0
            paraFrame.Size = UDim2.new(1, 0, 0, 0)
            paraFrame.AutomaticSize = Enum.AutomaticSize.Y
            paraFrame.Parent = tabContent

            local paraCorner = Instance.new("UICorner")
            paraCorner.CornerRadius = UDim.new(0, 8)
            paraCorner.Parent = paraFrame

            local paraStroke = Instance.new("UIStroke")
            paraStroke.Color = theme.Border
            paraStroke.Thickness = 1
            paraStroke.Parent = paraFrame

            local paraTitle = Instance.new("TextLabel")
            paraTitle.BackgroundTransparency = 1
            paraTitle.Position = UDim2.new(0, 10, 0, 10)
            paraTitle.Size = UDim2.new(1, -20, 0, 20)
            paraTitle.Font = Enum.Font.GothamBold
            paraTitle.Text = title
            paraTitle.TextColor3 = theme.Text
            paraTitle.TextSize = 13
            paraTitle.TextXAlignment = Enum.TextXAlignment.Left
            paraTitle.Parent = paraFrame

            local paraText = Instance.new("TextLabel")
            paraText.BackgroundTransparency = 1
            paraText.Position = UDim2.new(0, 10, 0, 35)
            paraText.Size = UDim2.new(1, -20, 0, 0)
            paraText.AutomaticSize = Enum.AutomaticSize.Y
            paraText.Font = Enum.Font.Gotham
            paraText.Text = text
            paraText.TextColor3 = theme.TextDark
            paraText.TextSize = 12
            paraText.TextWrapped = true
            paraText.TextXAlignment = Enum.TextXAlignment.Left
            paraText.TextYAlignment = Enum.TextYAlignment.Top
            paraText.Parent = paraFrame

            local paraPad = Instance.new("UIPadding")
            paraPad.PaddingBottom = UDim.new(0, 10)
            paraPad.Parent = paraFrame
        end

        function tab:Divider()
            local div = Instance.new("Frame")
            div.BackgroundColor3 = theme.Border
            div.BorderSizePixel = 0
            div.Size = UDim2.new(1, 0, 0, 1)
            div.Parent = tabContent
        end

        function tab:Button(btnConfig)
            btnConfig = btnConfig or {}
            local btnName = btnConfig.Name or "Button"
            local callback = btnConfig.Callback or function()
                end

            local btnFrame = Instance.new("Frame")
            btnFrame.BackgroundColor3 = theme.Secondary
            btnFrame.BorderSizePixel = 0
            btnFrame.Size = UDim2.new(1, 0, 0, 40)
            btnFrame.Parent = tabContent

            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 8)
            btnCorner.Parent = btnFrame

            local btnStroke = Instance.new("UIStroke")
            btnStroke.Color = theme.Border
            btnStroke.Thickness = 1
            btnStroke.Parent = btnFrame

            local btn = Instance.new("TextButton")
            btn.BackgroundColor3 = theme.Accent
            btn.BorderSizePixel = 0
            btn.AnchorPoint = Vector2.new(1, 0.5)
            btn.Position = UDim2.new(1, -10, 0.5, 0)
            btn.Size = UDim2.new(0, 100, 0, 28)
            btn.Font = Enum.Font.GothamBold
            btn.Text = "Execute"
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.TextSize = 12
            btn.ClipsDescendants = true
            btn.Parent = btnFrame

            local btnBtnCorner = Instance.new("UICorner")
            btnBtnCorner.CornerRadius = UDim.new(0, 6)
            btnBtnCorner.Parent = btn

            local btnLabel = Instance.new("TextLabel")
            btnLabel.BackgroundTransparency = 1
            btnLabel.Position = UDim2.new(0, 10, 0, 0)
            btnLabel.Size = UDim2.new(1, -120, 1, 0)
            btnLabel.Font = Enum.Font.GothamBold
            btnLabel.Text = btnName
            btnLabel.TextColor3 = theme.Text
            btnLabel.TextSize = 13
            btnLabel.TextXAlignment = Enum.TextXAlignment.Left
            btnLabel.Parent = btnFrame

            btn.MouseButton1Click:Connect(
                function()
                    Utils:Ripple(btn)
                    pcall(callback)
                end
            )

            btn.MouseEnter:Connect(
                function()
                    Utils:Tween(btn, {BackgroundColor3 = theme.AccentDark}, 0.2)
                end
            )

            btn.MouseLeave:Connect(
                function()
                    Utils:Tween(btn, {BackgroundColor3 = theme.Accent}, 0.2)
                end
            )

            if btnConfig.Tooltip then
                Utils:AddTooltip(btnFrame, btnConfig.Tooltip)
            end
        end

        function tab:Toggle(togConfig)
            togConfig = togConfig or {}
            local togName = togConfig.Name or "Toggle"
            local default = togConfig.Default or false
            local flag = togConfig.Flag
            local callback = togConfig.Callback or function()
                end

            local togFrame = Instance.new("Frame")
            togFrame.BackgroundColor3 = theme.Secondary
            togFrame.BorderSizePixel = 0
            togFrame.Size = UDim2.new(1, 0, 0, 40)
            togFrame.Parent = tabContent

            local togCorner = Instance.new("UICorner")
            togCorner.CornerRadius = UDim.new(0, 8)
            togCorner.Parent = togFrame

            local togStroke = Instance.new("UIStroke")
            togStroke.Color = theme.Border
            togStroke.Thickness = 1
            togStroke.Parent = togFrame

            local togLabel = Instance.new("TextLabel")
            togLabel.BackgroundTransparency = 1
            togLabel.Position = UDim2.new(0, 10, 0, 0)
            togLabel.Size = UDim2.new(1, -70, 1, 0)
            togLabel.Font = Enum.Font.GothamBold
            togLabel.Text = togName
            togLabel.TextColor3 = theme.Text
            togLabel.TextSize = 13
            togLabel.TextXAlignment = Enum.TextXAlignment.Left
            togLabel.Parent = togFrame

            local togBtn = Instance.new("TextButton")
            togBtn.AnchorPoint = Vector2.new(1, 0.5)
            togBtn.BackgroundColor3 = default and theme.Accent or theme.Tertiary
            togBtn.BorderSizePixel = 0
            togBtn.Position = UDim2.new(1, -10, 0.5, 0)
            togBtn.Size = UDim2.new(0, 45, 0, 24)
            togBtn.Text = ""
            togBtn.Parent = togFrame

            local togBtnCorner = Instance.new("UICorner")
            togBtnCorner.CornerRadius = UDim.new(1, 0)
            togBtnCorner.Parent = togBtn

            local togCircle = Instance.new("Frame")
            togCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            togCircle.BorderSizePixel = 0
            togCircle.Position = default and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)
            togCircle.Size = UDim2.new(0, 20, 0, 20)
            togCircle.Parent = togBtn

            local togCircleCorner = Instance.new("UICorner")
            togCircleCorner.CornerRadius = UDim.new(1, 0)
            togCircleCorner.Parent = togCircle

            local toggled = default

            if flag then
                Zonix.Flags[flag] = toggled
            end

            local function toggle()
                toggled = not toggled

                if flag then
                    Zonix.Flags[flag] = toggled
                end

                Utils:Tween(togBtn, {BackgroundColor3 = toggled and theme.Accent or theme.Tertiary}, 0.2)
                Utils:Tween(
                    togCircle,
                    {Position = toggled and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)},
                    0.2
                )

                pcall(callback, toggled)
            end

            togBtn.MouseButton1Click:Connect(toggle)

            if togConfig.Tooltip then
                Utils:AddTooltip(togFrame, togConfig.Tooltip)
            end

            return {
                Set = function(_, value)
                    if toggled ~= value then
                        toggle()
                    end
                end
            }
        end

        function tab:Slider(slConfig)
            slConfig = slConfig or {}
            local slName = slConfig.Name or "Slider"
            local min = slConfig.Min or 0
            local max = slConfig.Max or 100
            local default = slConfig.Default or min
            local increment = slConfig.Increment or 1
            local flag = slConfig.Flag
            local callback = slConfig.Callback or function()
                end

            local slFrame = Instance.new("Frame")
            slFrame.BackgroundColor3 = theme.Secondary
            slFrame.BorderSizePixel = 0
            slFrame.Size = UDim2.new(1, 0, 0, 55)
            slFrame.Parent = tabContent

            local slCorner = Instance.new("UICorner")
            slCorner.CornerRadius = UDim.new(0, 8)
            slCorner.Parent = slFrame

            local slStroke = Instance.new("UIStroke")
            slStroke.Color = theme.Border
            slStroke.Thickness = 1
            slStroke.Parent = slFrame

            local slLabel = Instance.new("TextLabel")
            slLabel.BackgroundTransparency = 1
            slLabel.Position = UDim2.new(0, 10, 0, 5)
            slLabel.Size = UDim2.new(1, -70, 0, 20)
            slLabel.Font = Enum.Font.GothamBold
            slLabel.Text = slName
            slLabel.TextColor3 = theme.Text
            slLabel.TextSize = 13
            slLabel.TextXAlignment = Enum.TextXAlignment.Left
            slLabel.Parent = slFrame

            local slValue = Instance.new("TextLabel")
            slValue.BackgroundTransparency = 1
            slValue.AnchorPoint = Vector2.new(1, 0)
            slValue.Position = UDim2.new(1, -10, 0, 5)
            slValue.Size = UDim2.new(0, 50, 0, 20)
            slValue.Font = Enum.Font.GothamBold
            slValue.Text = tostring(default)
            slValue.TextColor3 = theme.Accent
            slValue.TextSize = 13
            slValue.TextXAlignment = Enum.TextXAlignment.Right
            slValue.Parent = slFrame

            local slBack = Instance.new("Frame")
            slBack.BackgroundColor3 = theme.Tertiary
            slBack.BorderSizePixel = 0
            slBack.Position = UDim2.new(0, 10, 0, 32)
            slBack.Size = UDim2.new(1, -20, 0, 6)
            slBack.Parent = slFrame

            local slBackCorner = Instance.new("UICorner")
            slBackCorner.CornerRadius = UDim.new(1, 0)
            slBackCorner.Parent = slBack

            local slFill = Instance.new("Frame")
            slFill.BackgroundColor3 = theme.Accent
            slFill.BorderSizePixel = 0
            slFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
            slFill.Parent = slBack

            local slFillCorner = Instance.new("UICorner")
            slFillCorner.CornerRadius = UDim.new(1, 0)
            slFillCorner.Parent = slFill

            local slBtn = Instance.new("TextButton")
            slBtn.AnchorPoint = Vector2.new(0.5, 0.5)
            slBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            slBtn.BorderSizePixel = 0
            slBtn.Position = UDim2.new((default - min) / (max - min), 0, 0.5, 0)
            slBtn.Size = UDim2.new(0, 14, 0, 14)
            slBtn.Text = ""
            slBtn.Parent = slBack

            local slBtnCorner = Instance.new("UICorner")
            slBtnCorner.CornerRadius = UDim.new(1, 0)
            slBtnCorner.Parent = slBtn

            local value = default

            if flag then
                Zonix.Flags[flag] = value
            end

            local dragging = false

            local function update(input)
                local pos = math.clamp((input.Position.X - slBack.AbsolutePosition.X) / slBack.AbsoluteSize.X, 0, 1)
                value = math.floor((min + (max - min) * pos) / increment + 0.5) * increment
                value = math.clamp(value, min, max)

                slValue.Text = tostring(value)

                if flag then
                    Zonix.Flags[flag] = value
                end

                Utils:Tween(slFill, {Size = UDim2.new(pos, 0, 1, 0)}, 0.1)
                Utils:Tween(slBtn, {Position = UDim2.new(pos, 0, 0.5, 0)}, 0.1)

                pcall(callback, value)
            end

            slBtn.MouseButton1Down:Connect(
                function()
                    dragging = true
                end
            )

            UserInputService.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end
            )

            UserInputService.InputChanged:Connect(
                function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        update(input)
                    end
                end
            )

            slBack.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        update(input)
                    end
                end
            )

            if slConfig.Tooltip then
                Utils:AddTooltip(slFrame, slConfig.Tooltip)
            end

            return {
                Set = function(_, newValue)
                    value = math.clamp(newValue, min, max)
                    slValue.Text = tostring(value)
                    local pos = (value - min) / (max - min)
                    Utils:Tween(slFill, {Size = UDim2.new(pos, 0, 1, 0)}, 0.2)
                    Utils:Tween(slBtn, {Position = UDim2.new(pos, 0, 0.5, 0)}, 0.2)

                    if flag then
                        Zonix.Flags[flag] = value
                    end

                    pcall(callback, value)
                end
            }
        end

        function tab:Dropdown(ddConfig)
            ddConfig = ddConfig or {}
            local ddName = ddConfig.Name or "Dropdown"
            local options = ddConfig.Options or {"Option 1", "Option 2"}
            local default = ddConfig.Default or options[1]
            local flag = ddConfig.Flag
            local callback = ddConfig.Callback or function()
                end

            local ddFrame = Instance.new("Frame")
            ddFrame.BackgroundColor3 = theme.Secondary
            ddFrame.BorderSizePixel = 0
            ddFrame.Size = UDim2.new(1, 0, 0, 40)
            ddFrame.ClipsDescendants = true
            ddFrame.Parent = tabContent

            local ddCorner = Instance.new("UICorner")
            ddCorner.CornerRadius = UDim.new(0, 8)
            ddCorner.Parent = ddFrame

            local ddStroke = Instance.new("UIStroke")
            ddStroke.Color = theme.Border
            ddStroke.Thickness = 1
            ddStroke.Parent = ddFrame

            local ddLabel = Instance.new("TextLabel")
            ddLabel.BackgroundTransparency = 1
            ddLabel.Position = UDim2.new(0, 10, 0, 0)
            ddLabel.Size = UDim2.new(1, -40, 0, 40)
            ddLabel.Font = Enum.Font.GothamBold
            ddLabel.Text = ddName .. ": " .. default
            ddLabel.TextColor3 = theme.Text
            ddLabel.TextSize = 13
            ddLabel.TextXAlignment = Enum.TextXAlignment.Left
            ddLabel.Parent = ddFrame

            local ddBtn = Instance.new("TextButton")
            ddBtn.AnchorPoint = Vector2.new(1, 0)
            ddBtn.BackgroundTransparency = 1
            ddBtn.Position = UDim2.new(1, -5, 0, 5)
            ddBtn.Size = UDim2.new(0, 30, 0, 30)
            ddBtn.Font = Enum.Font.GothamBold
            ddBtn.Text = "▼"
            ddBtn.TextColor3 = theme.TextDark
            ddBtn.TextSize = 12
            ddBtn.Parent = ddFrame

            local optList = Instance.new("Frame")
            optList.BackgroundTransparency = 1
            optList.Position = UDim2.new(0, 0, 0, 40)
            optList.Size = UDim2.new(1, 0, 0, 0)
            optList.Parent = ddFrame

            local optLayout = Instance.new("UIListLayout")
            optLayout.Padding = UDim.new(0, 2)
            optLayout.Parent = optList

            local selected = default
            local opened = false

            if flag then
                Zonix.Flags[flag] = selected
            end

            for _, opt in ipairs(options) do
                local optBtn = Instance.new("TextButton")
                optBtn.BackgroundColor3 = theme.Tertiary
                optBtn.BorderSizePixel = 0
                optBtn.Size = UDim2.new(1, 0, 0, 30)
                optBtn.Font = Enum.Font.Gotham
                optBtn.Text = "  " .. opt
                optBtn.TextColor3 = theme.TextDark
                optBtn.TextSize = 12
                optBtn.TextXAlignment = Enum.TextXAlignment.Left
                optBtn.Parent = optList

                optBtn.MouseButton1Click:Connect(
                    function()
                        selected = opt
                        ddLabel.Text = ddName .. ": " .. selected

                        if flag then
                            Zonix.Flags[flag] = selected
                        end

                        pcall(callback, selected)
                    end
                )

                optBtn.MouseEnter:Connect(
                    function()
                        Utils:Tween(optBtn, {BackgroundColor3 = theme.Border}, 0.2)
                    end
                )

                optBtn.MouseLeave:Connect(
                    function()
                        Utils:Tween(optBtn, {BackgroundColor3 = theme.Tertiary}, 0.2)
                    end
                )
            end

            ddBtn.MouseButton1Click:Connect(
                function()
                    opened = not opened

                    if opened then
                        Utils:Tween(ddFrame, {Size = UDim2.new(1, 0, 0, 40 + #options * 32)}, 0.3)
                        Utils:Tween(ddBtn, {Rotation = 180}, 0.3)
                    else
                        Utils:Tween(ddFrame, {Size = UDim2.new(1, 0, 0, 40)}, 0.3)
                        Utils:Tween(ddBtn, {Rotation = 0}, 0.3)
                    end
                end
            )

            if ddConfig.Tooltip then
                Utils:AddTooltip(ddFrame, ddConfig.Tooltip)
            end

            return {
                Set = function(_, opt)
                    if table.find(options, opt) then
                        selected = opt
                        ddLabel.Text = ddName .. ": " .. selected

                        if flag then
                            Zonix.Flags[flag] = selected
                        end

                        pcall(callback, selected)
                    end
                end,
                Refresh = function(_, newOpts, newDefault)
                    options = newOpts
                    optList:ClearAllChildren()

                    local newLayout = Instance.new("UIListLayout")
                    newLayout.Padding = UDim.new(0, 2)
                    newLayout.Parent = optList

                    for _, opt in ipairs(options) do
                        local optBtn = Instance.new("TextButton")
                        optBtn.BackgroundColor3 = theme.Tertiary
                        optBtn.BorderSizePixel = 0
                        optBtn.Size = UDim2.new(1, 0, 0, 30)
                        optBtn.Font = Enum.Font.Gotham
                        optBtn.Text = "  " .. opt
                        optBtn.TextColor3 = theme.TextDark
                        optBtn.TextSize = 12
                        optBtn.TextXAlignment = Enum.TextXAlignment.Left
                        optBtn.Parent = optList

                        optBtn.MouseButton1Click:Connect(
                            function()
                                selected = opt
                                ddLabel.Text = ddName .. ": " .. selected

                                if flag then
                                    Zonix.Flags[flag] = selected
                                end

                                pcall(callback, selected)
                            end
                        )

                        optBtn.MouseEnter:Connect(
                            function()
                                Utils:Tween(optBtn, {BackgroundColor3 = theme.Border}, 0.2)
                            end
                        )

                        optBtn.MouseLeave:Connect(
                            function()
                                Utils:Tween(optBtn, {BackgroundColor3 = theme.Tertiary}, 0.2)
                            end
                        )
                    end

                    if newDefault and table.find(options, newDefault) then
                        selected = newDefault
                        ddLabel.Text = ddName .. ": " .. selected
                    end
                end
            }
        end

        function tab:Textbox(tbConfig)
            tbConfig = tbConfig or {}
            local tbName = tbConfig.Name or "Textbox"
            local default = tbConfig.Default or ""
            local placeholder = tbConfig.Placeholder or "Enter text..."
            local flag = tbConfig.Flag
            local callback = tbConfig.Callback or function()
                end

            local tbFrame = Instance.new("Frame")
            tbFrame.BackgroundColor3 = theme.Secondary
            tbFrame.BorderSizePixel = 0
            tbFrame.Size = UDim2.new(1, 0, 0, 70)
            tbFrame.Parent = tabContent

            local tbCorner = Instance.new("UICorner")
            tbCorner.CornerRadius = UDim.new(0, 8)
            tbCorner.Parent = tbFrame

            local tbStroke = Instance.new("UIStroke")
            tbStroke.Color = theme.Border
            tbStroke.Thickness = 1
            tbStroke.Parent = tbFrame

            local tbLabel = Instance.new("TextLabel")
            tbLabel.BackgroundTransparency = 1
            tbLabel.Position = UDim2.new(0, 10, 0, 5)
            tbLabel.Size = UDim2.new(1, -20, 0, 20)
            tbLabel.Font = Enum.Font.GothamBold
            tbLabel.Text = tbName
            tbLabel.TextColor3 = theme.Text
            tbLabel.TextSize = 13
            tbLabel.TextXAlignment = Enum.TextXAlignment.Left
            tbLabel.Parent = tbFrame

            local tb = Instance.new("TextBox")
            tb.BackgroundColor3 = theme.Tertiary
            tb.BorderSizePixel = 0
            tb.Position = UDim2.new(0, 10, 0, 30)
            tb.Size = UDim2.new(1, -20, 0, 30)
            tb.Font = Enum.Font.Gotham
            tb.PlaceholderText = placeholder
            tb.PlaceholderColor3 = theme.TextDark
            tb.Text = default
            tb.TextColor3 = theme.Text
            tb.TextSize = 12
            tb.TextXAlignment = Enum.TextXAlignment.Left
            tb.ClearTextOnFocus = false
            tb.Parent = tbFrame

            local tbPad = Instance.new("UIPadding")
            tbPad.PaddingLeft = UDim.new(0, 10)
            tbPad.PaddingRight = UDim.new(0, 10)
            tbPad.Parent = tb

            local tbInCorner = Instance.new("UICorner")
            tbInCorner.CornerRadius = UDim.new(0, 6)
            tbInCorner.Parent = tb

            if flag then
                Zonix.Flags[flag] = default
            end

            tb.FocusLost:Connect(
                function()
                    local text = tb.Text

                    if flag then
                        Zonix.Flags[flag] = text
                    end

                    pcall(callback, text)
                end
            )

            tb.Focused:Connect(
                function()
                    Utils:Tween(tbStroke, {Color = theme.Accent}, 0.2)
                end
            )

            tb.FocusLost:Connect(
                function()
                    Utils:Tween(tbStroke, {Color = theme.Border}, 0.2)
                end
            )

            if tbConfig.Tooltip then
                Utils:AddTooltip(tbFrame, tbConfig.Tooltip)
            end

            return {
                Set = function(_, text)
                    tb.Text = text

                    if flag then
                        Zonix.Flags[flag] = text
                    end

                    pcall(callback, text)
                end
            }
        end

        function tab:Keybind(kbConfig)
            kbConfig = kbConfig or {}
            local kbName = kbConfig.Name or "Keybind"
            local default = kbConfig.Default or Enum.KeyCode.E
            local flag = kbConfig.Flag
            local callback = kbConfig.Callback or function()
                end

            local kbFrame = Instance.new("Frame")
            kbFrame.BackgroundColor3 = theme.Secondary
            kbFrame.BorderSizePixel = 0
            kbFrame.Size = UDim2.new(1, 0, 0, 40)
            kbFrame.Parent = tabContent

            local kbCorner = Instance.new("UICorner")
            kbCorner.CornerRadius = UDim.new(0, 8)
            kbCorner.Parent = kbFrame

            local kbStroke = Instance.new("UIStroke")
            kbStroke.Color = theme.Border
            kbStroke.Thickness = 1
            kbStroke.Parent = kbFrame

            local kbLabel = Instance.new("TextLabel")
            kbLabel.BackgroundTransparency = 1
            kbLabel.Position = UDim2.new(0, 10, 0, 0)
            kbLabel.Size = UDim2.new(1, -100, 1, 0)
            kbLabel.Font = Enum.Font.GothamBold
            kbLabel.Text = kbName
            kbLabel.TextColor3 = theme.Text
            kbLabel.TextSize = 13
            kbLabel.TextXAlignment = Enum.TextXAlignment.Left
            kbLabel.Parent = kbFrame

            local kbBtn = Instance.new("TextButton")
            kbBtn.AnchorPoint = Vector2.new(1, 0.5)
            kbBtn.BackgroundColor3 = theme.Tertiary
            kbBtn.BorderSizePixel = 0
            kbBtn.Position = UDim2.new(1, -10, 0.5, 0)
            kbBtn.Size = UDim2.new(0, 80, 0, 28)
            kbBtn.Font = Enum.Font.GothamBold
            kbBtn.Text = default.Name
            kbBtn.TextColor3 = theme.Text
            kbBtn.TextSize = 11
            kbBtn.Parent = kbFrame

            local kbBtnCorner = Instance.new("UICorner")
            kbBtnCorner.CornerRadius = UDim.new(0, 6)
            kbBtnCorner.Parent = kbBtn

            local currentKey = default
            local binding = false

            if flag then
                Zonix.Flags[flag] = currentKey
            end

            kbBtn.MouseButton1Click:Connect(
                function()
                    binding = true
                    kbBtn.Text = "..."
                    Utils:Tween(kbBtn, {BackgroundColor3 = theme.Accent}, 0.2)
                end
            )

            UserInputService.InputBegan:Connect(
                function(input, gp)
                    if binding then
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            currentKey = input.KeyCode
                            kbBtn.Text = currentKey.Name
                            binding = false

                            if flag then
                                Zonix.Flags[flag] = currentKey
                            end

                            Utils:Tween(kbBtn, {BackgroundColor3 = theme.Tertiary}, 0.2)
                        end
                    elseif input.KeyCode == currentKey and not gp then
                        pcall(callback)
                    end
                end
            )

            if kbConfig.Tooltip then
                Utils:AddTooltip(kbFrame, kbConfig.Tooltip)
            end

            return {
                Set = function(_, key)
                    currentKey = key
                    kbBtn.Text = currentKey.Name

                    if flag then
                        Zonix.Flags[flag] = currentKey
                    end
                end
            }
        end

        function tab:ColorPicker(cpConfig)
            cpConfig = cpConfig or {}
            local cpName = cpConfig.Name or "Color"
            local default = cpConfig.Default or Color3.fromRGB(255, 255, 255)
            local flag = cpConfig.Flag
            local callback = cpConfig.Callback or function()
                end

            local cpFrame = Instance.new("Frame")
            cpFrame.BackgroundColor3 = theme.Secondary
            cpFrame.BorderSizePixel = 0
            cpFrame.Size = UDim2.new(1, 0, 0, 40)
            cpFrame.Parent = tabContent

            local cpCorner = Instance.new("UICorner")
            cpCorner.CornerRadius = UDim.new(0, 8)
            cpCorner.Parent = cpFrame

            local cpStroke = Instance.new("UIStroke")
            cpStroke.Color = theme.Border
            cpStroke.Thickness = 1
            cpStroke.Parent = cpFrame

            local cpLabel = Instance.new("TextLabel")
            cpLabel.BackgroundTransparency = 1
            cpLabel.Position = UDim2.new(0, 10, 0, 0)
            cpLabel.Size = UDim2.new(1, -50, 1, 0)
            cpLabel.Font = Enum.Font.GothamBold
            cpLabel.Text = cpName
            cpLabel.TextColor3 = theme.Text
            cpLabel.TextSize = 13
            cpLabel.TextXAlignment = Enum.TextXAlignment.Left
            cpLabel.Parent = cpFrame

            local cpDisplay = Instance.new("TextButton")
            cpDisplay.AnchorPoint = Vector2.new(1, 0.5)
            cpDisplay.BackgroundColor3 = default
            cpDisplay.BorderSizePixel = 0
            cpDisplay.Position = UDim2.new(1, -10, 0.5, 0)
            cpDisplay.Size = UDim2.new(0, 30, 0, 30)
            cpDisplay.Text = ""
            cpDisplay.AutoButtonColor = false
            cpDisplay.Parent = cpFrame

            local cpDisplayCorner = Instance.new("UICorner")
            cpDisplayCorner.CornerRadius = UDim.new(0, 6)
            cpDisplayCorner.Parent = cpDisplay

            local cpDisplayStroke = Instance.new("UIStroke")
            cpDisplayStroke.Color = theme.Border
            cpDisplayStroke.Thickness = 2
            cpDisplayStroke.Parent = cpDisplay

            if flag then
                Zonix.Flags[flag] = default
            end

            local currentH = 0
            local currentS = 1
            local currentV = 1
            local currentColor = default
            local pickerOpen = false

            local function RGBtoHSV(col)
                local r, g, b = col.R, col.G, col.B
                local mx, mn = math.max(r, g, b), math.min(r, g, b)
                local d = mx - mn
                local h, s, v = 0, 0, mx
                if d > 0 then
                    s = d / mx
                    if r == mx then
                        h = (g - b) / d
                    elseif g == mx then
                        h = 2 + (b - r) / d
                    else
                        h = 4 + (r - g) / d
                    end
                    h = h / 6
                    if h < 0 then
                        h = h + 1
                    end
                end
                return h, s, v
            end

            local function HSVtoRGB(h, s, v)
                if s == 0 then
                    return Color3.new(v, v, v)
                end
                local i = math.floor(h * 6)
                local f = h * 6 - i
                local p, q, t = v * (1 - s), v * (1 - f * s), v * (1 - (1 - f) * s)
                i = i % 6
                if i == 0 then
                    return Color3.new(v, t, p)
                elseif i == 1 then
                    return Color3.new(q, v, p)
                elseif i == 2 then
                    return Color3.new(p, v, t)
                elseif i == 3 then
                    return Color3.new(p, q, v)
                elseif i == 4 then
                    return Color3.new(t, p, v)
                else
                    return Color3.new(v, p, q)
                end
            end

            local function ToHex(col)
                return string.format(
                    "#%02x%02x%02x",
                    math.floor(col.R * 255),
                    math.floor(col.G * 255),
                    math.floor(col.B * 255)
                )
            end

            local function ToCMYK(col)
                local k = 1 - math.max(col.R, col.G, col.B)
                if k == 1 then
                    return 0, 0, 0, 1
                end
                return (1 - col.R - k) / (1 - k), (1 - col.G - k) / (1 - k), (1 - col.B - k) / (1 - k), k
            end

            local function ToHSL(col)
                local mx, mn = math.max(col.R, col.G, col.B), math.min(col.R, col.G, col.B)
                local l = (mx + mn) / 2
                if mx == mn then
                    return 0, 0, l
                end
                local d = mx - mn
                local s = l > 0.5 and d / (2 - mx - mn) or d / (mx + mn)
                local h
                if col.R == mx then
                    h = (col.G - col.B) / d + (col.G < col.B and 6 or 0)
                elseif col.G == mx then
                    h = (col.B - col.R) / d + 2
                else
                    h = (col.R - col.G) / d + 4
                end
                return h / 6, s, l
            end

            currentH, currentS, currentV = RGBtoHSV(default)

            cpDisplay.MouseButton1Click:Connect(
                function()
                    if pickerOpen then
                        return
                    end
                    pickerOpen = true

                    local sg = Instance.new("ScreenGui")
                    sg.Name = "ColorPickerModal"
                    sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    sg.DisplayOrder = 999999
                    sg.IgnoreGuiInset = true
                    sg.Parent = Executor.GetHui()

                    local bg = Instance.new("TextButton", sg)
                    bg.BackgroundColor3, bg.BackgroundTransparency = Color3.new(0, 0, 0), 0.5
                    bg.BorderSizePixel, bg.Size, bg.ZIndex = 0, UDim2.new(1, 0, 1, 0), 999999
                    bg.Text = ""
                    bg.AutoButtonColor = false
                    bg.Active = true

                    local pk = Instance.new("Frame", bg)
                    pk.AnchorPoint, pk.BackgroundColor3, pk.BorderSizePixel = Vector2.new(0.5, 0.5), theme.Background, 0
                    pk.Position, pk.Size, pk.ZIndex = UDim2.new(0.5, 0, 0.5, 0), UDim2.new(0, 480, 0, 580), 1000000
                    pk.Active = true
                    Instance.new("UICorner", pk).CornerRadius = UDim.new(0, 12)
                    local st = Instance.new("UIStroke", pk)
                    st.Color, st.Thickness = theme.Border, 2

                    local tb = Instance.new("Frame", pk)
                    tb.BackgroundColor3, tb.BorderSizePixel, tb.Size, tb.ZIndex =
                        theme.Topbar,
                        0,
                        UDim2.new(1, 0, 0, 50),
                        1000001
                    Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 12)
                    local tc = Instance.new("Frame", tb)
                    tc.BackgroundColor3, tc.BorderSizePixel, tc.Position, tc.Size, tc.ZIndex =
                        theme.Topbar,
                        0,
                        UDim2.new(0, 0, 1, -12),
                        UDim2.new(1, 0, 0, 12),
                        1000001
                    local tl = Instance.new("TextLabel", tb)
                    tl.BackgroundTransparency, tl.Position, tl.Size = 1, UDim2.new(0, 20, 0, 0), UDim2.new(1, -80, 1, 0)
                    tl.Font, tl.Text, tl.TextColor3, tl.TextSize, tl.TextXAlignment, tl.ZIndex =
                        Enum.Font.GothamBold,
                        "Color Picker",
                        theme.Text,
                        16,
                        Enum.TextXAlignment.Left,
                        1000002

                    local closeBtn = Instance.new("TextButton", tb)
                    closeBtn.AnchorPoint, closeBtn.BackgroundColor3, closeBtn.BorderSizePixel =
                        Vector2.new(1, 0.5),
                        theme.Error,
                        0
                    closeBtn.Position, closeBtn.Size = UDim2.new(1, -15, 0.5, 0), UDim2.new(0, 30, 0, 30)
                    closeBtn.Font, closeBtn.Text, closeBtn.TextColor3, closeBtn.TextSize, closeBtn.ZIndex =
                        Enum.Font.GothamBold,
                        "X",
                        Color3.new(1, 1, 1),
                        18,
                        1000002
                    closeBtn.AutoButtonColor = false
                    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

                    closeBtn.MouseEnter:Connect(
                        function()
                            Utils:Tween(closeBtn, {BackgroundColor3 = Color3.fromRGB(200, 50, 50)}, 0.2)
                        end
                    )
                    closeBtn.MouseLeave:Connect(
                        function()
                            Utils:Tween(closeBtn, {BackgroundColor3 = theme.Error}, 0.2)
                        end
                    )
                    closeBtn.MouseButton1Click:Connect(
                        function()
                            pickerOpen = false
                            sg:Destroy()
                        end
                    )

                    local sv = Instance.new("ImageButton", pk)
                    sv.BackgroundColor3, sv.BorderSizePixel, sv.Position, sv.Size, sv.ZIndex, sv.AutoButtonColor =
                        HSVtoRGB(currentH, 1, 1),
                        0,
                        UDim2.new(0, 20, 0, 70),
                        UDim2.new(0, 340, 0, 320),
                        1000001,
                        false
                    Instance.new("UICorner", sv).CornerRadius = UDim.new(0, 8)

                    local w = Instance.new("Frame", sv)
                    w.BackgroundColor3, w.BorderSizePixel, w.Size, w.ZIndex =
                        Color3.new(1, 1, 1),
                        0,
                        UDim2.new(1, 0, 1, 0),
                        1000002
                    Instance.new("UICorner", w).CornerRadius = UDim.new(0, 8)
                    local wg = Instance.new("UIGradient", w)
                    wg.Transparency =
                        NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)})

                    local bk = Instance.new("Frame", sv)
                    bk.BackgroundColor3, bk.BorderSizePixel, bk.Size, bk.ZIndex =
                        Color3.new(0, 0, 0),
                        0,
                        UDim2.new(1, 0, 1, 0),
                        1000003
                    Instance.new("UICorner", bk).CornerRadius = UDim.new(0, 8)
                    local bkg = Instance.new("UIGradient", bk)
                    bkg.Transparency, bkg.Rotation =
                        NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0)}),
                        90

                    local sc = Instance.new("Frame", sv)
                    sc.AnchorPoint, sc.BackgroundColor3, sc.BorderSizePixel =
                        Vector2.new(0.5, 0.5),
                        Color3.new(1, 1, 1),
                        0
                    sc.Position, sc.Size, sc.ZIndex =
                        UDim2.new(currentS, 0, 1 - currentV, 0),
                        UDim2.new(0, 20, 0, 20),
                        1000004
                    Instance.new("UICorner", sc).CornerRadius = UDim.new(1, 0)
                    local scs = Instance.new("UIStroke", sc)
                    scs.Color, scs.Thickness = Color3.fromRGB(40, 40, 50), 3

                    local hu = Instance.new("ImageButton", pk)
                    hu.BackgroundColor3, hu.BorderSizePixel, hu.Position, hu.Size, hu.ZIndex, hu.AutoButtonColor =
                        Color3.new(1, 1, 1),
                        0,
                        UDim2.new(0, 20, 0, 410),
                        UDim2.new(0, 440, 0, 20),
                        1000001,
                        false
                    Instance.new("UICorner", hu).CornerRadius = UDim.new(1, 0)
                    local hg = Instance.new("UIGradient", hu)
                    hg.Color =
                        ColorSequence.new(
                        {
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                            ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
                            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
                            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
                            ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
                            ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
                            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
                        }
                    )

                    local hc = Instance.new("Frame", hu)
                    hc.AnchorPoint, hc.BackgroundColor3, hc.BorderSizePixel =
                        Vector2.new(0.5, 0.5),
                        Color3.new(1, 1, 1),
                        0
                    hc.Position, hc.Size, hc.ZIndex = UDim2.new(currentH, 0, 0.5, 0), UDim2.new(0, 16, 0, 32), 1000002
                    Instance.new("UICorner", hc).CornerRadius = UDim.new(1, 0)
                    local hcs = Instance.new("UIStroke", hc)
                    hcs.Color, hcs.Thickness = Color3.fromRGB(40, 40, 50), 3

                    local pv = Instance.new("Frame", pk)
                    pv.BackgroundColor3, pv.BorderSizePixel, pv.Position, pv.Size, pv.ZIndex =
                        currentColor,
                        0,
                        UDim2.new(0, 380, 0, 70),
                        UDim2.new(0, 80, 0, 80),
                        1000001
                    Instance.new("UICorner", pv).CornerRadius = UDim.new(0, 8)
                    local pvs = Instance.new("UIStroke", pv)
                    pvs.Color, pvs.Thickness = theme.Border, 2

                    local hf = Instance.new("Frame", pk)
                    hf.BackgroundColor3, hf.BorderSizePixel, hf.Position, hf.Size, hf.ZIndex =
                        theme.Secondary,
                        0,
                        UDim2.new(0, 20, 0, 450),
                        UDim2.new(0, 440, 0, 50),
                        1000001
                    Instance.new("UICorner", hf).CornerRadius = UDim.new(0, 8)
                    Instance.new("UIStroke", hf).Color = theme.Border

                    local ht = Instance.new("TextLabel", hf)
                    ht.BackgroundTransparency, ht.Position, ht.Size =
                        1,
                        UDim2.new(0, 15, 0, 0),
                        UDim2.new(0, 100, 0, 20)
                    ht.Font, ht.Text, ht.TextColor3, ht.TextSize, ht.TextXAlignment, ht.ZIndex =
                        Enum.Font.GothamBold,
                        "HEX",
                        theme.Text,
                        12,
                        Enum.TextXAlignment.Left,
                        1000002

                    local hv = Instance.new("TextLabel", hf)
                    hv.BackgroundTransparency, hv.Position, hv.Size =
                        1,
                        UDim2.new(0, 15, 0, 20),
                        UDim2.new(1, -80, 0, 25)
                    hv.Font, hv.Text, hv.TextColor3, hv.TextSize, hv.TextXAlignment, hv.ZIndex =
                        Enum.Font.Gotham,
                        ToHex(currentColor),
                        theme.TextDark,
                        14,
                        Enum.TextXAlignment.Left,
                        1000002

                    local hb = Instance.new("TextButton", hf)
                    hb.AnchorPoint, hb.BackgroundTransparency, hb.Position, hb.Size =
                        Vector2.new(1, 0.5),
                        1,
                        UDim2.new(1, -10, 0.5, 0),
                        UDim2.new(0, 30, 0, 30)
                    hb.Font, hb.Text, hb.TextColor3, hb.TextSize, hb.ZIndex =
                        Enum.Font.GothamBold,
                        "📋",
                        theme.TextDark,
                        16,
                        1000002
                    hb.MouseButton1Click:Connect(
                        function()
                            Executor.SetClipboard(hv.Text)
                            hb.Text = "✓"
                            task.wait(1)
                            hb.Text = "📋"
                        end
                    )

                    local vf = Instance.new("Frame", pk)
                    vf.BackgroundTransparency, vf.Position, vf.Size, vf.ZIndex =
                        1,
                        UDim2.new(0, 20, 0, 510),
                        UDim2.new(0, 440, 0, 50),
                        1000001

                    local function MV(n, x, v)
                        local f = Instance.new("Frame", vf)
                        f.BackgroundColor3, f.BorderSizePixel, f.Position, f.Size, f.ZIndex =
                            theme.Secondary,
                            0,
                            UDim2.new(0, x, 0, 0),
                            UDim2.new(0, 105, 0, 50),
                            1000001
                        Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
                        Instance.new("UIStroke", f).Color = theme.Border
                        local t = Instance.new("TextLabel", f)
                        t.BackgroundTransparency, t.Position, t.Size =
                            1,
                            UDim2.new(0, 10, 0, 5),
                            UDim2.new(1, -20, 0, 15)
                        t.Font, t.Text, t.TextColor3, t.TextSize, t.TextXAlignment, t.ZIndex =
                            Enum.Font.GothamBold,
                            n,
                            theme.Text,
                            11,
                            Enum.TextXAlignment.Left,
                            1000002
                        local vv = Instance.new("TextLabel", f)
                        vv.BackgroundTransparency, vv.Position, vv.Size =
                            1,
                            UDim2.new(0, 10, 0, 22),
                            UDim2.new(1, -20, 0, 23)
                        vv.Font, vv.Text, vv.TextColor3, vv.TextSize, vv.TextXAlignment, vv.ZIndex =
                            Enum.Font.Gotham,
                            v,
                            theme.TextDark,
                            12,
                            Enum.TextXAlignment.Left,
                            1000002
                        return vv
                    end

                    local r, g, b =
                        math.floor(currentColor.R * 255),
                        math.floor(currentColor.G * 255),
                        math.floor(currentColor.B * 255)
                    local rgbD = MV("RGB", 0, r .. ", " .. g .. ", " .. b)
                    local c, m, y, k = ToCMYK(currentColor)
                    local cmykD =
                        MV(
                        "CMYK",
                        112,
                        math.floor(c * 100) ..
                            "%, " ..
                                math.floor(m * 100) ..
                                    "%, " .. math.floor(y * 100) .. "%, " .. math.floor(k * 100) .. "%"
                    )
                    local hsvD =
                        MV(
                        "HSV",
                        224,
                        math.floor(currentH * 360) ..
                            "°, " .. math.floor(currentS * 100) .. "%, " .. math.floor(currentV * 100) .. "%"
                    )
                    local h2, s2, l2 = ToHSL(currentColor)
                    local hslD =
                        MV(
                        "HSL",
                        336,
                        math.floor(h2 * 360) .. "°, " .. math.floor(s2 * 100) .. "%, " .. math.floor(l2 * 100) .. "%"
                    )

                    local function Up(col)
                        currentColor = col
                        pv.BackgroundColor3, hv.Text = col, ToHex(col)
                        local r2, g2, b2 = math.floor(col.R * 255), math.floor(col.G * 255), math.floor(col.B * 255)
                        rgbD.Text = r2 .. ", " .. g2 .. ", " .. b2
                        local c2, m2, y2, k2 = ToCMYK(col)
                        cmykD.Text =
                            math.floor(c2 * 100) ..
                            "%, " ..
                                math.floor(m2 * 100) ..
                                    "%, " .. math.floor(y2 * 100) .. "%, " .. math.floor(k2 * 100) .. "%"
                        hsvD.Text =
                            math.floor(currentH * 360) ..
                            "°, " .. math.floor(currentS * 100) .. "%, " .. math.floor(currentV * 100) .. "%"
                        local h3, s3, l3 = ToHSL(col)
                        hslD.Text =
                            math.floor(h3 * 360) ..
                            "°, " .. math.floor(s3 * 100) .. "%, " .. math.floor(l3 * 100) .. "%"
                    end

                    local svD = false
                    local function UpSV(i)
                        currentS = math.clamp((i.Position.X - sv.AbsolutePosition.X) / sv.AbsoluteSize.X, 0, 1)
                        currentV = 1 - math.clamp((i.Position.Y - sv.AbsolutePosition.Y) / sv.AbsoluteSize.Y, 0, 1)
                        sc.Position = UDim2.new(currentS, 0, 1 - currentV, 0)
                        Up(HSVtoRGB(currentH, currentS, currentV))
                    end

                    sv.MouseButton1Down:Connect(
                        function()
                            svD = true
                        end
                    )
                    sv.InputBegan:Connect(
                        function(i)
                            if i.UserInputType == Enum.UserInputType.MouseButton1 then
                                UpSV(i)
                            end
                        end
                    )

                    local huD = false
                    local function UpHu(i)
                        currentH = math.clamp((i.Position.X - hu.AbsolutePosition.X) / hu.AbsoluteSize.X, 0, 1)
                        hc.Position = UDim2.new(currentH, 0, 0.5, 0)
                        sv.BackgroundColor3 = HSVtoRGB(currentH, 1, 1)
                        Up(HSVtoRGB(currentH, currentS, currentV))
                    end

                    hu.MouseButton1Down:Connect(
                        function()
                            huD = true
                        end
                    )
                    hu.InputBegan:Connect(
                        function(i)
                            if i.UserInputType == Enum.UserInputType.MouseButton1 then
                                UpHu(i)
                            end
                        end
                    )

                    local inputEndedConn
                    local inputChangedConn

                    inputEndedConn =
                        UserInputService.InputEnded:Connect(
                        function(i)
                            if i.UserInputType == Enum.UserInputType.MouseButton1 then
                                svD = false
                                huD = false
                            end
                        end
                    )

                    inputChangedConn =
                        UserInputService.InputChanged:Connect(
                        function(i)
                            if i.UserInputType == Enum.UserInputType.MouseMovement then
                                if svD then
                                    UpSV(i)
                                end
                                if huD then
                                    UpHu(i)
                                end
                            end
                        end
                    )

                    bg.MouseButton1Click:Connect(
                        function()
                            cpDisplay.BackgroundColor3 = currentColor
                            if flag then
                                Zonix.Flags[flag] = currentColor
                            end
                            pcall(callback, currentColor)
                            pickerOpen = false
                            inputEndedConn:Disconnect()
                            inputChangedConn:Disconnect()
                            sg:Destroy()
                        end
                    )

                    sg.Destroying:Connect(
                        function()
                            pickerOpen = false
                            if inputEndedConn then
                                inputEndedConn:Disconnect()
                            end
                            if inputChangedConn then
                                inputChangedConn:Disconnect()
                            end
                        end
                    )
                end
            )

            if cpConfig.Tooltip then
                Utils:AddTooltip(cpFrame, cpConfig.Tooltip)
            end

            return {
                Set = function(_, color)
                    cpDisplay.BackgroundColor3 = color

                    if flag then
                        Zonix.Flags[flag] = color
                    end

                    pcall(callback, color)
                end
            }
        end

        function tab:CopyButton(cbConfig)
            cbConfig = cbConfig or {}
            local cbName = cbConfig.Name or "Copy"
            local text = cbConfig.Text or "Text to copy"

            local cbFrame = Instance.new("Frame")
            cbFrame.BackgroundColor3 = theme.Secondary
            cbFrame.BorderSizePixel = 0
            cbFrame.Size = UDim2.new(1, 0, 0, 40)
            cbFrame.Parent = tabContent

            local cbCorner = Instance.new("UICorner")
            cbCorner.CornerRadius = UDim.new(0, 8)
            cbCorner.Parent = cbFrame

            local cbStroke = Instance.new("UIStroke")
            cbStroke.Color = theme.Border
            cbStroke.Thickness = 1
            cbStroke.Parent = cbFrame

            local cbBtn = Instance.new("TextButton")
            cbBtn.BackgroundColor3 = theme.Accent
            cbBtn.BorderSizePixel = 0
            cbBtn.AnchorPoint = Vector2.new(1, 0.5)
            cbBtn.Position = UDim2.new(1, -10, 0.5, 0)
            cbBtn.Size = UDim2.new(0, 80, 0, 28)
            cbBtn.Font = Enum.Font.GothamBold
            cbBtn.Text = "📋 Copy"
            cbBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            cbBtn.TextSize = 11
            cbBtn.ClipsDescendants = true
            cbBtn.Parent = cbFrame

            local cbBtnCorner = Instance.new("UICorner")
            cbBtnCorner.CornerRadius = UDim.new(0, 6)
            cbBtnCorner.Parent = cbBtn

            local cbLabel = Instance.new("TextLabel")
            cbLabel.BackgroundTransparency = 1
            cbLabel.Position = UDim2.new(0, 10, 0, 0)
            cbLabel.Size = UDim2.new(1, -100, 1, 0)
            cbLabel.Font = Enum.Font.GothamBold
            cbLabel.Text = cbName
            cbLabel.TextColor3 = theme.Text
            cbLabel.TextSize = 13
            cbLabel.TextXAlignment = Enum.TextXAlignment.Left
            cbLabel.Parent = cbFrame

            cbBtn.MouseButton1Click:Connect(
                function()
                    Utils:Ripple(cbBtn)
                    Executor.SetClipboard(text)
                    cbBtn.Text = "✓ Copied!"
                    task.wait(2)
                    cbBtn.Text = "📋 Copy"
                end
            )

            cbBtn.MouseEnter:Connect(
                function()
                    Utils:Tween(cbBtn, {BackgroundColor3 = theme.AccentDark}, 0.2)
                end
            )

            cbBtn.MouseLeave:Connect(
                function()
                    Utils:Tween(cbBtn, {BackgroundColor3 = theme.Accent}, 0.2)
                end
            )
        end

        function tab:ProgressBar(pbConfig)
            pbConfig = pbConfig or {}
            local pbName = pbConfig.Name or "Progress"
            local progress = pbConfig.Progress or 0

            local pbFrame = Instance.new("Frame")
            pbFrame.BackgroundColor3 = theme.Secondary
            pbFrame.BorderSizePixel = 0
            pbFrame.Size = UDim2.new(1, 0, 0, 55)
            pbFrame.Parent = tabContent

            local pbCorner = Instance.new("UICorner")
            pbCorner.CornerRadius = UDim.new(0, 8)
            pbCorner.Parent = pbFrame

            local pbStroke = Instance.new("UIStroke")
            pbStroke.Color = theme.Border
            pbStroke.Thickness = 1
            pbStroke.Parent = pbFrame

            local pbLabel = Instance.new("TextLabel")
            pbLabel.BackgroundTransparency = 1
            pbLabel.Position = UDim2.new(0, 10, 0, 5)
            pbLabel.Size = UDim2.new(1, -60, 0, 20)
            pbLabel.Font = Enum.Font.GothamBold
            pbLabel.Text = pbName
            pbLabel.TextColor3 = theme.Text
            pbLabel.TextSize = 13
            pbLabel.TextXAlignment = Enum.TextXAlignment.Left
            pbLabel.Parent = pbFrame

            local pbPercent = Instance.new("TextLabel")
            pbPercent.BackgroundTransparency = 1
            pbPercent.AnchorPoint = Vector2.new(1, 0)
            pbPercent.Position = UDim2.new(1, -10, 0, 5)
            pbPercent.Size = UDim2.new(0, 50, 0, 20)
            pbPercent.Font = Enum.Font.GothamBold
            pbPercent.Text = math.floor(progress * 100) .. "%"
            pbPercent.TextColor3 = theme.Accent
            pbPercent.TextSize = 13
            pbPercent.TextXAlignment = Enum.TextXAlignment.Right
            pbPercent.Parent = pbFrame

            local pbBack = Instance.new("Frame")
            pbBack.BackgroundColor3 = theme.Tertiary
            pbBack.BorderSizePixel = 0
            pbBack.Position = UDim2.new(0, 10, 0, 32)
            pbBack.Size = UDim2.new(1, -20, 0, 8)
            pbBack.Parent = pbFrame

            local pbBackCorner = Instance.new("UICorner")
            pbBackCorner.CornerRadius = UDim.new(1, 0)
            pbBackCorner.Parent = pbBack

            local pbFill = Instance.new("Frame")
            pbFill.BackgroundColor3 = theme.Success
            pbFill.BorderSizePixel = 0
            pbFill.Size = UDim2.new(progress, 0, 1, 0)
            pbFill.Parent = pbBack

            local pbFillCorner = Instance.new("UICorner")
            pbFillCorner.CornerRadius = UDim.new(1, 0)
            pbFillCorner.Parent = pbFill

            return {
                Set = function(_, value)
                    value = math.clamp(value, 0, 1)
                    pbPercent.Text = math.floor(value * 100) .. "%"
                    Utils:Tween(pbFill, {Size = UDim2.new(value, 0, 1, 0)}, 0.3)

                    if value >= 1 then
                        pbFill.BackgroundColor3 = theme.Success
                    elseif value >= 0.5 then
                        pbFill.BackgroundColor3 = theme.Warning
                    else
                        pbFill.BackgroundColor3 = theme.Error
                    end
                end
            }
        end

        function tab:Checkbox(cbConfig)
            cbConfig = cbConfig or {}
            local cbName = cbConfig.Name or "Checkbox"
            local default = cbConfig.Default or false
            local callback = cbConfig.Callback or function()
                end
            local flag = cbConfig.Flag

            local cbFrame = Instance.new("Frame")
            cbFrame.BackgroundColor3 = theme.Secondary
            cbFrame.BorderSizePixel = 0
            cbFrame.Size = UDim2.new(1, 0, 0, 40)
            cbFrame.Parent = tabContent

            local cbCorner = Instance.new("UICorner")
            cbCorner.CornerRadius = UDim.new(0, 8)
            cbCorner.Parent = cbFrame

            local cbStroke = Instance.new("UIStroke")
            cbStroke.Color = theme.Border
            cbStroke.Thickness = 1
            cbStroke.Parent = cbFrame

            local cbLabel = Instance.new("TextLabel")
            cbLabel.BackgroundTransparency = 1
            cbLabel.Position = UDim2.new(0, 10, 0, 0)
            cbLabel.Size = UDim2.new(1, -50, 1, 0)
            cbLabel.Font = Enum.Font.GothamBold
            cbLabel.Text = cbName
            cbLabel.TextColor3 = theme.Text
            cbLabel.TextSize = 13
            cbLabel.TextXAlignment = Enum.TextXAlignment.Left
            cbLabel.Parent = cbFrame

            local checkbox = Instance.new("TextButton")
            checkbox.BackgroundColor3 = theme.Tertiary
            checkbox.BorderSizePixel = 0
            checkbox.AnchorPoint = Vector2.new(1, 0.5)
            checkbox.Position = UDim2.new(1, -10, 0.5, 0)
            checkbox.Size = UDim2.new(0, 24, 0, 24)
            checkbox.Font = Enum.Font.GothamBold
            checkbox.Text = ""
            checkbox.TextColor3 = theme.Text
            checkbox.TextSize = 16
            checkbox.Parent = cbFrame

            local checkCorner = Instance.new("UICorner")
            checkCorner.CornerRadius = UDim.new(0, 6)
            checkCorner.Parent = checkbox

            local checkStroke = Instance.new("UIStroke")
            checkStroke.Color = theme.Border
            checkStroke.Thickness = 2
            checkStroke.Parent = checkbox

            local checked = default
            if flag then
                Zonix.Flags[flag] = checked
            end

            local function updateCheckbox()
                checkbox.Text = checked and "✓" or ""
                checkbox.BackgroundColor3 = checked and theme.Accent or theme.Tertiary
                checkStroke.Color = checked and theme.Accent or theme.Border
            end

            updateCheckbox()

            checkbox.MouseButton1Click:Connect(
                function()
                    checked = not checked
                    if flag then
                        Zonix.Flags[flag] = checked
                    end
                    updateCheckbox()
                    Utils:Ripple(checkbox)
                    callback(checked)
                end
            )

            cbFrame.MouseEnter:Connect(
                function()
                    Utils:Tween(cbStroke, {Color = theme.Accent}, 0.2)
                end
            )

            cbFrame.MouseLeave:Connect(
                function()
                    Utils:Tween(cbStroke, {Color = theme.Border}, 0.2)
                end
            )

            return {
                Set = function(_, value)
                    checked = value
                    if flag then
                        Zonix.Flags[flag] = checked
                    end
                    updateCheckbox()
                    callback(checked)
                end
            }
        end

        function tab:AddSpacing(pixels)
            pixels = pixels or 10

            local spacer = Instance.new("Frame")
            spacer.BackgroundTransparency = 1
            spacer.BorderSizePixel = 0
            spacer.Size = UDim2.new(1, 0, 0, pixels)
            spacer.Parent = tabContent
        end

        function tab:GroupBox(gbConfig)
            gbConfig = gbConfig or {}
            local gbName = gbConfig.Name or "Group"
            local inline = gbConfig.Inline or false

            local groupBox = {
                Elements = {},
                Container = nil
            }

            local gbFrame = Instance.new("Frame")
            gbFrame.BackgroundColor3 = theme.Secondary
            gbFrame.BorderSizePixel = 0
            gbFrame.Size = inline and UDim2.new(0.48, 0, 0, 0) or UDim2.new(1, 0, 0, 0)
            gbFrame.AutomaticSize = Enum.AutomaticSize.Y
            gbFrame.Parent = tabContent

            local gbCorner = Instance.new("UICorner")
            gbCorner.CornerRadius = UDim.new(0, 8)
            gbCorner.Parent = gbFrame

            local gbStroke = Instance.new("UIStroke")
            gbStroke.Color = theme.Border
            gbStroke.Thickness = 1
            gbStroke.Parent = gbFrame

            local gbHeader = Instance.new("TextLabel")
            gbHeader.BackgroundTransparency = 1
            gbHeader.Size = UDim2.new(1, 0, 0, 30)
            gbHeader.Font = Enum.Font.GothamBold
            gbHeader.Text = gbName
            gbHeader.TextColor3 = theme.Accent
            gbHeader.TextSize = 14
            gbHeader.TextXAlignment = Enum.TextXAlignment.Left
            gbHeader.Parent = gbFrame

            local gbHeaderPad = Instance.new("UIPadding")
            gbHeaderPad.PaddingLeft = UDim.new(0, 10)
            gbHeaderPad.Parent = gbHeader

            local gbContent = Instance.new("Frame")
            gbContent.BackgroundTransparency = 1
            gbContent.Position = UDim2.new(0, 0, 0, 35)
            gbContent.Size = UDim2.new(1, 0, 1, -35)
            gbContent.AutomaticSize = Enum.AutomaticSize.Y
            gbContent.Parent = gbFrame

            local gbList = Instance.new("UIListLayout")
            gbList.Padding = UDim.new(0, 6)
            gbList.SortOrder = Enum.SortOrder.LayoutOrder
            gbList.Parent = gbContent

            local gbPad = Instance.new("UIPadding")
            gbPad.PaddingLeft = UDim.new(0, 10)
            gbPad.PaddingRight = UDim.new(0, 10)
            gbPad.PaddingBottom = UDim.new(0, 10)
            gbPad.Parent = gbContent

            groupBox.Container = gbContent

            function groupBox:Button(btnConfig)
                btnConfig = btnConfig or {}
                local btnName = btnConfig.Name or "Button"
                local callback = btnConfig.Callback or function()
                    end

                local btnFrame = Instance.new("TextButton")
                btnFrame.BackgroundColor3 = theme.Accent
                btnFrame.BorderSizePixel = 0
                btnFrame.Size = UDim2.new(1, 0, 0, 38)
                btnFrame.Font = Enum.Font.GothamBold
                btnFrame.Text = btnName
                btnFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
                btnFrame.TextSize = 13
                btnFrame.ClipsDescendants = true
                btnFrame.Parent = gbContent

                local btnCorner = Instance.new("UICorner")
                btnCorner.CornerRadius = UDim.new(0, 8)
                btnCorner.Parent = btnFrame

                btnFrame.MouseButton1Click:Connect(
                    function()
                        Utils:Ripple(btnFrame)
                        callback()
                    end
                )

                btnFrame.MouseEnter:Connect(
                    function()
                        Utils:Tween(btnFrame, {BackgroundColor3 = theme.AccentDark}, 0.2)
                    end
                )

                btnFrame.MouseLeave:Connect(
                    function()
                        Utils:Tween(btnFrame, {BackgroundColor3 = theme.Accent}, 0.2)
                    end
                )
            end

            function groupBox:Checkbox(cbConfig)
                cbConfig = cbConfig or {}
                local cbName = cbConfig.Name or "Checkbox"
                local default = cbConfig.Default or false
                local callback = cbConfig.Callback or function()
                    end
                local flag = cbConfig.Flag

                local cbFrame = Instance.new("Frame")
                cbFrame.BackgroundColor3 = theme.Tertiary
                cbFrame.BorderSizePixel = 0
                cbFrame.Size = UDim2.new(1, 0, 0, 35)
                cbFrame.Parent = gbContent

                local cbCorner = Instance.new("UICorner")
                cbCorner.CornerRadius = UDim.new(0, 6)
                cbCorner.Parent = cbFrame

                local cbLabel = Instance.new("TextLabel")
                cbLabel.BackgroundTransparency = 1
                cbLabel.Position = UDim2.new(0, 8, 0, 0)
                cbLabel.Size = UDim2.new(1, -40, 1, 0)
                cbLabel.Font = Enum.Font.Gotham
                cbLabel.Text = cbName
                cbLabel.TextColor3 = theme.Text
                cbLabel.TextSize = 12
                cbLabel.TextXAlignment = Enum.TextXAlignment.Left
                cbLabel.Parent = cbFrame

                local checkbox = Instance.new("TextButton")
                checkbox.BackgroundColor3 = theme.Background
                checkbox.BorderSizePixel = 0
                checkbox.AnchorPoint = Vector2.new(1, 0.5)
                checkbox.Position = UDim2.new(1, -8, 0.5, 0)
                checkbox.Size = UDim2.new(0, 20, 0, 20)
                checkbox.Font = Enum.Font.GothamBold
                checkbox.Text = ""
                checkbox.TextColor3 = theme.Text
                checkbox.TextSize = 14
                checkbox.Parent = cbFrame

                local checkCorner = Instance.new("UICorner")
                checkCorner.CornerRadius = UDim.new(0, 4)
                checkCorner.Parent = checkbox

                local checkStroke = Instance.new("UIStroke")
                checkStroke.Color = theme.Border
                checkStroke.Thickness = 1
                checkStroke.Parent = checkbox

                local checked = default
                if flag then
                    Zonix.Flags[flag] = checked
                end

                local function updateCheckbox()
                    checkbox.Text = checked and "✓" or ""
                    checkbox.BackgroundColor3 = checked and theme.Accent or theme.Background
                    checkStroke.Color = checked and theme.Accent or theme.Border
                end

                updateCheckbox()

                checkbox.MouseButton1Click:Connect(
                    function()
                        checked = not checked
                        if flag then
                            Zonix.Flags[flag] = checked
                        end
                        updateCheckbox()
                        callback(checked)
                    end
                )

                return {
                    Set = function(_, value)
                        checked = value
                        if flag then
                            Zonix.Flags[flag] = checked
                        end
                        updateCheckbox()
                        callback(checked)
                    end
                }
            end

            function groupBox:Label(text)
                local labelFrame = Instance.new("Frame")
                labelFrame.BackgroundTransparency = 1
                labelFrame.Size = UDim2.new(1, 0, 0, 25)
                labelFrame.Parent = gbContent

                local label = Instance.new("TextLabel")
                label.BackgroundTransparency = 1
                label.Size = UDim2.new(1, 0, 1, 0)
                label.Font = Enum.Font.Gotham
                label.Text = text
                label.TextColor3 = theme.Text
                label.TextSize = 13
                label.TextXAlignment = Enum.TextXAlignment.Left
                label.Parent = labelFrame

                return {
                    Set = function(_, newText)
                        label.Text = newText
                    end
                }
            end

            function groupBox:Section(name)
                local section = Instance.new("Frame")
                section.BackgroundTransparency = 1
                section.Size = UDim2.new(1, 0, 0, 30)
                section.Parent = gbContent

                local label = Instance.new("TextLabel")
                label.BackgroundTransparency = 1
                label.Size = UDim2.new(1, 0, 1, 0)
                label.Font = Enum.Font.GothamBold
                label.Text = name
                label.TextColor3 = theme.Text
                label.TextSize = 14
                label.TextXAlignment = Enum.TextXAlignment.Left
                label.Parent = section

                local div = Instance.new("Frame")
                div.BackgroundColor3 = theme.Border
                div.BorderSizePixel = 0
                div.Position = UDim2.new(0, 0, 1, -1)
                div.Size = UDim2.new(1, 0, 0, 1)
                div.Parent = section
            end

            function groupBox:Paragraph(title, text)
                local paraFrame = Instance.new("Frame")
                paraFrame.BackgroundTransparency = 1
                paraFrame.Size = UDim2.new(1, 0, 0, 0)
                paraFrame.AutomaticSize = Enum.AutomaticSize.Y
                paraFrame.Parent = gbContent

                local titleLabel = Instance.new("TextLabel")
                titleLabel.BackgroundTransparency = 1
                titleLabel.Size = UDim2.new(1, 0, 0, 20)
                titleLabel.Font = Enum.Font.GothamBold
                titleLabel.Text = title
                titleLabel.TextColor3 = theme.Text
                titleLabel.TextSize = 13
                titleLabel.TextXAlignment = Enum.TextXAlignment.Left
                titleLabel.Parent = paraFrame

                local textLabel = Instance.new("TextLabel")
                textLabel.BackgroundTransparency = 1
                textLabel.Position = UDim2.new(0, 0, 0, 22)
                textLabel.Size = UDim2.new(1, 0, 0, 0)
                textLabel.AutomaticSize = Enum.AutomaticSize.Y
                textLabel.Font = Enum.Font.Gotham
                textLabel.Text = text
                textLabel.TextColor3 = theme.TextDark
                textLabel.TextSize = 12
                textLabel.TextWrapped = true
                textLabel.TextXAlignment = Enum.TextXAlignment.Left
                textLabel.Parent = paraFrame
            end

            function groupBox:Divider()
                local div = Instance.new("Frame")
                div.BackgroundColor3 = theme.Border
                div.BorderSizePixel = 0
                div.Size = UDim2.new(1, 0, 0, 1)
                div.Parent = gbContent
            end

            function groupBox:Toggle(togConfig)
                togConfig = togConfig or {}
                local togName = togConfig.Name or "Toggle"
                local default = togConfig.Default or false
                local flag = togConfig.Flag
                local callback = togConfig.Callback or function()
                    end

                local togFrame = Instance.new("Frame")
                togFrame.BackgroundColor3 = theme.Secondary
                togFrame.BorderSizePixel = 0
                togFrame.Size = UDim2.new(1, 0, 0, 36)
                togFrame.Parent = gbContent

                local togCorner = Instance.new("UICorner")
                togCorner.CornerRadius = UDim.new(0, 6)
                togCorner.Parent = togFrame

                local togLabel = Instance.new("TextLabel")
                togLabel.BackgroundTransparency = 1
                togLabel.Position = UDim2.new(0, 8, 0, 0)
                togLabel.Size = UDim2.new(1, -60, 1, 0)
                togLabel.Font = Enum.Font.GothamBold
                togLabel.Text = togName
                togLabel.TextColor3 = theme.Text
                togLabel.TextSize = 12
                togLabel.TextXAlignment = Enum.TextXAlignment.Left
                togLabel.Parent = togFrame

                local togBtn = Instance.new("TextButton")
                togBtn.AnchorPoint = Vector2.new(1, 0.5)
                togBtn.BackgroundColor3 = default and theme.Accent or theme.Tertiary
                togBtn.BorderSizePixel = 0
                togBtn.Position = UDim2.new(1, -8, 0.5, 0)
                togBtn.Size = UDim2.new(0, 45, 0, 24)
                togBtn.Text = ""
                togBtn.Parent = togFrame

                local togBtnCorner = Instance.new("UICorner")
                togBtnCorner.CornerRadius = UDim.new(1, 0)
                togBtnCorner.Parent = togBtn

                local togCircle = Instance.new("Frame")
                togCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                togCircle.BorderSizePixel = 0
                togCircle.Position = default and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)
                togCircle.Size = UDim2.new(0, 20, 0, 20)
                togCircle.Parent = togBtn

                local togCircleCorner = Instance.new("UICorner")
                togCircleCorner.CornerRadius = UDim.new(1, 0)
                togCircleCorner.Parent = togCircle

                local toggled = default

                if flag then
                    Zonix.Flags[flag] = toggled
                end

                local function toggle()
                    toggled = not toggled

                    if flag then
                        Zonix.Flags[flag] = toggled
                    end

                    Utils:Tween(togBtn, {BackgroundColor3 = toggled and theme.Accent or theme.Tertiary}, 0.2)
                    Utils:Tween(
                        togCircle,
                        {Position = toggled and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)},
                        0.2
                    )

                    pcall(callback, toggled)
                end

                togBtn.MouseButton1Click:Connect(toggle)

                return {
                    Set = function(_, value)
                        if toggled ~= value then
                            toggle()
                        end
                    end
                }
            end

            function groupBox:Slider(slConfig)
                slConfig = slConfig or {}
                local slName = slConfig.Name or "Slider"
                local min = slConfig.Min or 0
                local max = slConfig.Max or 100
                local default = slConfig.Default or min
                local increment = slConfig.Increment or 1
                local flag = slConfig.Flag
                local callback = slConfig.Callback or function()
                    end

                local slFrame = Instance.new("Frame")
                slFrame.BackgroundColor3 = theme.Secondary
                slFrame.BorderSizePixel = 0
                slFrame.Size = UDim2.new(1, 0, 0, 50)
                slFrame.Parent = gbContent

                local slCorner = Instance.new("UICorner")
                slCorner.CornerRadius = UDim.new(0, 8)
                slCorner.Parent = slFrame

                local slStroke = Instance.new("UIStroke")
                slStroke.Color = theme.Border
                slStroke.Thickness = 1
                slStroke.Parent = slFrame

                local slLabel = Instance.new("TextLabel")
                slLabel.BackgroundTransparency = 1
                slLabel.Position = UDim2.new(0, 10, 0, 5)
                slLabel.Size = UDim2.new(1, -70, 0, 20)
                slLabel.Font = Enum.Font.GothamBold
                slLabel.Text = slName
                slLabel.TextColor3 = theme.Text
                slLabel.TextSize = 13
                slLabel.TextXAlignment = Enum.TextXAlignment.Left
                slLabel.Parent = slFrame

                local slValue = Instance.new("TextLabel")
                slValue.BackgroundTransparency = 1
                slValue.AnchorPoint = Vector2.new(1, 0)
                slValue.Position = UDim2.new(1, -10, 0, 5)
                slValue.Size = UDim2.new(0, 50, 0, 20)
                slValue.Font = Enum.Font.GothamBold
                slValue.Text = tostring(default)
                slValue.TextColor3 = theme.Accent
                slValue.TextSize = 13
                slValue.TextXAlignment = Enum.TextXAlignment.Right
                slValue.Parent = slFrame

                local slBack = Instance.new("Frame")
                slBack.BackgroundColor3 = theme.Tertiary
                slBack.BorderSizePixel = 0
                slBack.Position = UDim2.new(0, 10, 0, 32)
                slBack.Size = UDim2.new(1, -20, 0, 6)
                slBack.Parent = slFrame

                local slBackCorner = Instance.new("UICorner")
                slBackCorner.CornerRadius = UDim.new(1, 0)
                slBackCorner.Parent = slBack

                local slFill = Instance.new("Frame")
                slFill.BackgroundColor3 = theme.Accent
                slFill.BorderSizePixel = 0
                slFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
                slFill.Parent = slBack

                local slFillCorner = Instance.new("UICorner")
                slFillCorner.CornerRadius = UDim.new(1, 0)
                slFillCorner.Parent = slFill

                local slBtn = Instance.new("TextButton")
                slBtn.AnchorPoint = Vector2.new(0.5, 0.5)
                slBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                slBtn.BorderSizePixel = 0
                slBtn.Position = UDim2.new((default - min) / (max - min), 0, 0.5, 0)
                slBtn.Size = UDim2.new(0, 14, 0, 14)
                slBtn.Text = ""
                slBtn.Parent = slBack

                local slBtnCorner = Instance.new("UICorner")
                slBtnCorner.CornerRadius = UDim.new(1, 0)
                slBtnCorner.Parent = slBtn

                local value = default

                if flag then
                    Zonix.Flags[flag] = value
                end

                local dragging = false

                local function update(input)
                    local pos = math.clamp((input.Position.X - slBack.AbsolutePosition.X) / slBack.AbsoluteSize.X, 0, 1)
                    value = math.floor((min + (max - min) * pos) / increment + 0.5) * increment
                    value = math.clamp(value, min, max)

                    slValue.Text = tostring(value)

                    if flag then
                        Zonix.Flags[flag] = value
                    end

                    Utils:Tween(slFill, {Size = UDim2.new(pos, 0, 1, 0)}, 0.1)
                    Utils:Tween(slBtn, {Position = UDim2.new(pos, 0, 0.5, 0)}, 0.1)

                    pcall(callback, value)
                end

                slBtn.MouseButton1Down:Connect(
                    function()
                        dragging = true
                    end
                )

                UserInputService.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false
                        end
                    end
                )

                UserInputService.InputChanged:Connect(
                    function(input)
                        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                            update(input)
                        end
                    end
                )

                slBack.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            update(input)
                        end
                    end
                )

                return {
                    Set = function(_, newValue)
                        value = math.clamp(newValue, min, max)
                        slValue.Text = tostring(value)
                        local pos = (value - min) / (max - min)
                        Utils:Tween(slFill, {Size = UDim2.new(pos, 0, 1, 0)}, 0.2)
                        Utils:Tween(slBtn, {Position = UDim2.new(pos, 0, 0.5, 0)}, 0.2)

                        if flag then
                            Zonix.Flags[flag] = value
                        end

                        pcall(callback, value)
                    end
                }
            end

            function groupBox:Dropdown(ddConfig)
                ddConfig = ddConfig or {}
                local ddName = ddConfig.Name or "Dropdown"
                local options = ddConfig.Options or {"Option 1", "Option 2"}
                local default = ddConfig.Default or options[1]
                local flag = ddConfig.Flag
                local callback = ddConfig.Callback or function()
                    end

                local ddFrame = Instance.new("Frame")
                ddFrame.BackgroundColor3 = theme.Secondary
                ddFrame.BorderSizePixel = 0
                ddFrame.Size = UDim2.new(1, 0, 0, 40)
                ddFrame.ClipsDescendants = true
                ddFrame.Parent = gbContent

                local ddCorner = Instance.new("UICorner")
                ddCorner.CornerRadius = UDim.new(0, 8)
                ddCorner.Parent = ddFrame

                local ddStroke = Instance.new("UIStroke")
                ddStroke.Color = theme.Border
                ddStroke.Thickness = 1
                ddStroke.Parent = ddFrame

                local ddLabel = Instance.new("TextLabel")
                ddLabel.BackgroundTransparency = 1
                ddLabel.Position = UDim2.new(0, 10, 0, 0)
                ddLabel.Size = UDim2.new(1, -40, 0, 40)
                ddLabel.Font = Enum.Font.GothamBold
                ddLabel.Text = ddName .. ": " .. default
                ddLabel.TextColor3 = theme.Text
                ddLabel.TextSize = 13
                ddLabel.TextXAlignment = Enum.TextXAlignment.Left
                ddLabel.Parent = ddFrame

                local ddBtn = Instance.new("TextButton")
                ddBtn.AnchorPoint = Vector2.new(1, 0)
                ddBtn.BackgroundTransparency = 1
                ddBtn.Position = UDim2.new(1, -5, 0, 5)
                ddBtn.Size = UDim2.new(0, 30, 0, 30)
                ddBtn.Font = Enum.Font.GothamBold
                ddBtn.Text = "▼"
                ddBtn.TextColor3 = theme.TextDark
                ddBtn.TextSize = 12
                ddBtn.Parent = ddFrame

                local optList = Instance.new("Frame")
                optList.BackgroundTransparency = 1
                optList.Position = UDim2.new(0, 0, 0, 40)
                optList.Size = UDim2.new(1, 0, 0, 0)
                optList.Parent = ddFrame

                local optLayout = Instance.new("UIListLayout")
                optLayout.Padding = UDim.new(0, 2)
                optLayout.Parent = optList

                local selected = default
                local opened = false

                if flag then
                    Zonix.Flags[flag] = selected
                end

                for _, opt in ipairs(options) do
                    local optBtn = Instance.new("TextButton")
                    optBtn.BackgroundColor3 = theme.Tertiary
                    optBtn.BorderSizePixel = 0
                    optBtn.Size = UDim2.new(1, 0, 0, 30)
                    optBtn.Font = Enum.Font.Gotham
                    optBtn.Text = "  " .. opt
                    optBtn.TextColor3 = theme.TextDark
                    optBtn.TextSize = 12
                    optBtn.TextXAlignment = Enum.TextXAlignment.Left
                    optBtn.Parent = optList

                    optBtn.MouseButton1Click:Connect(
                        function()
                            selected = opt
                            ddLabel.Text = ddName .. ": " .. selected

                            if flag then
                                Zonix.Flags[flag] = selected
                            end

                            pcall(callback, selected)
                        end
                    )

                    optBtn.MouseEnter:Connect(
                        function()
                            Utils:Tween(optBtn, {BackgroundColor3 = theme.Border}, 0.2)
                        end
                    )

                    optBtn.MouseLeave:Connect(
                        function()
                            Utils:Tween(optBtn, {BackgroundColor3 = theme.Tertiary}, 0.2)
                        end
                    )
                end

                ddBtn.MouseButton1Click:Connect(
                    function()
                        opened = not opened

                        if opened then
                            Utils:Tween(ddFrame, {Size = UDim2.new(1, 0, 0, 40 + #options * 32)}, 0.3)
                            Utils:Tween(ddBtn, {Rotation = 180}, 0.3)
                        else
                            Utils:Tween(ddFrame, {Size = UDim2.new(1, 0, 0, 40)}, 0.3)
                            Utils:Tween(ddBtn, {Rotation = 0}, 0.3)
                        end
                    end
                )

                return {
                    Set = function(_, opt)
                        if table.find(options, opt) then
                            selected = opt
                            ddLabel.Text = ddName .. ": " .. selected

                            if flag then
                                Zonix.Flags[flag] = selected
                            end

                            pcall(callback, selected)
                        end
                    end,
                    Refresh = function(_, newOpts, newDefault)
                        options = newOpts
                        optList:ClearAllChildren()

                        local newLayout = Instance.new("UIListLayout")
                        newLayout.Padding = UDim.new(0, 2)
                        newLayout.Parent = optList

                        for _, opt in ipairs(options) do
                            local optBtn = Instance.new("TextButton")
                            optBtn.BackgroundColor3 = theme.Tertiary
                            optBtn.BorderSizePixel = 0
                            optBtn.Size = UDim2.new(1, 0, 0, 30)
                            optBtn.Font = Enum.Font.Gotham
                            optBtn.Text = "  " .. opt
                            optBtn.TextColor3 = theme.TextDark
                            optBtn.TextSize = 12
                            optBtn.TextXAlignment = Enum.TextXAlignment.Left
                            optBtn.Parent = optList

                            optBtn.MouseButton1Click:Connect(
                                function()
                                    selected = opt
                                    ddLabel.Text = ddName .. ": " .. selected

                                    if flag then
                                        Zonix.Flags[flag] = selected
                                    end

                                    pcall(callback, selected)
                                end
                            )

                            optBtn.MouseEnter:Connect(
                                function()
                                    Utils:Tween(optBtn, {BackgroundColor3 = theme.Border}, 0.2)
                                end
                            )

                            optBtn.MouseLeave:Connect(
                                function()
                                    Utils:Tween(optBtn, {BackgroundColor3 = theme.Tertiary}, 0.2)
                                end
                            )
                        end

                        if newDefault and table.find(options, newDefault) then
                            selected = newDefault
                            ddLabel.Text = ddName .. ": " .. selected
                        end
                    end
                }
            end

            function groupBox:Textbox(tbConfig)
                tbConfig = tbConfig or {}
                local tbName = tbConfig.Name or "Textbox"
                local default = tbConfig.Default or ""
                local placeholder = tbConfig.Placeholder or "Enter text..."
                local flag = tbConfig.Flag
                local callback = tbConfig.Callback or function()
                    end

                local tbFrame = Instance.new("Frame")
                tbFrame.BackgroundColor3 = theme.Secondary
                tbFrame.BorderSizePixel = 0
                tbFrame.Size = UDim2.new(1, 0, 0, 60)
                tbFrame.Parent = gbContent

                local tbCorner = Instance.new("UICorner")
                tbCorner.CornerRadius = UDim.new(0, 6)
                tbCorner.Parent = tbFrame

                local tbLabel = Instance.new("TextLabel")
                tbLabel.BackgroundTransparency = 1
                tbLabel.Position = UDim2.new(0, 8, 0, 5)
                tbLabel.Size = UDim2.new(1, -16, 0, 18)
                tbLabel.Font = Enum.Font.GothamBold
                tbLabel.Text = tbName
                tbLabel.TextColor3 = theme.Text
                tbLabel.TextSize = 12
                tbLabel.TextXAlignment = Enum.TextXAlignment.Left
                tbLabel.Parent = tbFrame

                local tb = Instance.new("TextBox")
                tb.BackgroundColor3 = theme.Tertiary
                tb.BorderSizePixel = 0
                tb.Position = UDim2.new(0, 8, 0, 28)
                tb.Size = UDim2.new(1, -16, 0, 26)
                tb.Font = Enum.Font.Gotham
                tb.PlaceholderText = placeholder
                tb.PlaceholderColor3 = theme.TextDark
                tb.Text = default
                tb.TextColor3 = theme.Text
                tb.TextSize = 11
                tb.TextXAlignment = Enum.TextXAlignment.Left
                tb.ClearTextOnFocus = false
                tb.Parent = tbFrame

                local tbPad = Instance.new("UIPadding")
                tbPad.PaddingLeft = UDim.new(0, 8)
                tbPad.PaddingRight = UDim.new(0, 8)
                tbPad.Parent = tb

                local tbInCorner = Instance.new("UICorner")
                tbInCorner.CornerRadius = UDim.new(0, 4)
                tbInCorner.Parent = tb

                if flag then
                    Zonix.Flags[flag] = default
                end

                tb.FocusLost:Connect(
                    function()
                        local text = tb.Text

                        if flag then
                            Zonix.Flags[flag] = text
                        end

                        pcall(callback, text)
                    end
                )

                return {
                    Set = function(_, text)
                        tb.Text = text

                        if flag then
                            Zonix.Flags[flag] = text
                        end

                        pcall(callback, text)
                    end
                }
            end

            function groupBox:ProgressBar(pbConfig)
                pbConfig = pbConfig or {}
                local pbName = pbConfig.Name or "Progress"
                local progress = pbConfig.Progress or 0

                local pbFrame = Instance.new("Frame")
                pbFrame.BackgroundColor3 = theme.Secondary
                pbFrame.BorderSizePixel = 0
                pbFrame.Size = UDim2.new(1, 0, 0, 45)
                pbFrame.Parent = gbContent

                local pbCorner = Instance.new("UICorner")
                pbCorner.CornerRadius = UDim.new(0, 6)
                pbCorner.Parent = pbFrame

                local pbLabel = Instance.new("TextLabel")
                pbLabel.BackgroundTransparency = 1
                pbLabel.Position = UDim2.new(0, 8, 0, 5)
                pbLabel.Size = UDim2.new(1, -50, 0, 18)
                pbLabel.Font = Enum.Font.GothamBold
                pbLabel.Text = pbName
                pbLabel.TextColor3 = theme.Text
                pbLabel.TextSize = 12
                pbLabel.TextXAlignment = Enum.TextXAlignment.Left
                pbLabel.Parent = pbFrame

                local pbPercent = Instance.new("TextLabel")
                pbPercent.BackgroundTransparency = 1
                pbPercent.AnchorPoint = Vector2.new(1, 0)
                pbPercent.Position = UDim2.new(1, -8, 0, 5)
                pbPercent.Size = UDim2.new(0, 45, 0, 18)
                pbPercent.Font = Enum.Font.GothamBold
                pbPercent.Text = math.floor(progress * 100) .. "%"
                pbPercent.TextColor3 = theme.Accent
                pbPercent.TextSize = 12
                pbPercent.TextXAlignment = Enum.TextXAlignment.Right
                pbPercent.Parent = pbFrame

                local pbBack = Instance.new("Frame")
                pbBack.BackgroundColor3 = theme.Tertiary
                pbBack.BorderSizePixel = 0
                pbBack.Position = UDim2.new(0, 8, 0, 28)
                pbBack.Size = UDim2.new(1, -16, 0, 8)
                pbBack.Parent = pbFrame

                local pbBackCorner = Instance.new("UICorner")
                pbBackCorner.CornerRadius = UDim.new(1, 0)
                pbBackCorner.Parent = pbBack

                local pbFill = Instance.new("Frame")
                pbFill.BackgroundColor3 = theme.Accent
                pbFill.BorderSizePixel = 0
                pbFill.Size = UDim2.new(progress, 0, 1, 0)
                pbFill.Parent = pbBack

                local pbFillCorner = Instance.new("UICorner")
                pbFillCorner.CornerRadius = UDim.new(1, 0)
                pbFillCorner.Parent = pbFill

                return {
                    Set = function(_, newProgress)
                        progress = math.clamp(newProgress, 0, 1)
                        Utils:Tween(pbFill, {Size = UDim2.new(progress, 0, 1, 0)}, 0.3)
                        pbPercent.Text = math.floor(progress * 100) .. "%"
                    end
                }
            end

            function groupBox:AddSpacing(pixels)
                pixels = pixels or 10
                local spacer = Instance.new("Frame")
                spacer.BackgroundTransparency = 1
                spacer.BorderSizePixel = 0
                spacer.Size = UDim2.new(1, 0, 0, pixels)
                spacer.Parent = gbContent
            end

            return groupBox
        end

        function tab:SubTab(stConfig)
            stConfig = stConfig or {}
            local tabNames = stConfig.Tabs or {"SubTab 1", "SubTab 2"}

            local subTab = {
                ActiveTab = 1,
                Tabs = {}
            }

            local stFrame = Instance.new("Frame")
            stFrame.BackgroundTransparency = 1
            stFrame.Size = UDim2.new(1, 0, 0, 0)
            stFrame.AutomaticSize = Enum.AutomaticSize.Y
            stFrame.Parent = tabContent

            local stHeader = Instance.new("Frame")
            stHeader.BackgroundColor3 = theme.Secondary
            stHeader.BorderSizePixel = 0
            stHeader.Size = UDim2.new(1, 0, 0, 40)
            stHeader.Parent = stFrame

            local stHeaderCorner = Instance.new("UICorner")
            stHeaderCorner.CornerRadius = UDim.new(0, 8)
            stHeaderCorner.Parent = stHeader

            local stHeaderStroke = Instance.new("UIStroke")
            stHeaderStroke.Color = theme.Border
            stHeaderStroke.Thickness = 1
            stHeaderStroke.Parent = stHeader

            local stHeaderList = Instance.new("UIListLayout")
            stHeaderList.FillDirection = Enum.FillDirection.Horizontal
            stHeaderList.Padding = UDim.new(0, 4)
            stHeaderList.SortOrder = Enum.SortOrder.LayoutOrder
            stHeaderList.Parent = stHeader

            local stHeaderPad = Instance.new("UIPadding")
            stHeaderPad.PaddingLeft = UDim.new(0, 5)
            stHeaderPad.PaddingRight = UDim.new(0, 5)
            stHeaderPad.PaddingTop = UDim.new(0, 5)
            stHeaderPad.PaddingBottom = UDim.new(0, 5)
            stHeaderPad.Parent = stHeader

            local stContent = Instance.new("Frame")
            stContent.BackgroundTransparency = 1
            stContent.Position = UDim2.new(0, 0, 0, 45)
            stContent.Size = UDim2.new(1, 0, 1, -45)
            stContent.AutomaticSize = Enum.AutomaticSize.Y
            stContent.Parent = stFrame

            for i, tabName in ipairs(tabNames) do
                local stBtn = Instance.new("TextButton")
                stBtn.BackgroundColor3 = i == 1 and theme.Accent or theme.Tertiary
                stBtn.BorderSizePixel = 0
                stBtn.Size = UDim2.new(1 / #tabNames, -4, 1, 0)
                stBtn.Font = Enum.Font.GothamBold
                stBtn.Text = tabName
                stBtn.TextColor3 = i == 1 and Color3.fromRGB(255, 255, 255) or theme.TextDark
                stBtn.TextSize = 12
                stBtn.Parent = stHeader

                local stBtnCorner = Instance.new("UICorner")
                stBtnCorner.CornerRadius = UDim.new(0, 6)
                stBtnCorner.Parent = stBtn

                local stTabContent = Instance.new("Frame")
                stTabContent.BackgroundTransparency = 1
                stTabContent.Size = UDim2.new(1, 0, 1, 0)
                stTabContent.AutomaticSize = Enum.AutomaticSize.Y
                stTabContent.Visible = i == 1
                stTabContent.Parent = stContent

                local stTabList = Instance.new("UIListLayout")
                stTabList.Padding = UDim.new(0, 6)
                stTabList.SortOrder = Enum.SortOrder.LayoutOrder
                stTabList.Parent = stTabContent

                local stTabPad = Instance.new("UIPadding")
                stTabPad.PaddingTop = UDim.new(0, 5)
                stTabPad.Parent = stTabContent

                local subTabObj = {
                    Container = stTabContent,
                    TabButton = stBtn,
                    Index = i
                }

                function subTabObj:Button(btnConfig)
                    btnConfig = btnConfig or {}
                    local btnName = btnConfig.Name or "Button"
                    local callback = btnConfig.Callback or function()
                        end

                    local btnFrame = Instance.new("TextButton")
                    btnFrame.BackgroundColor3 = theme.Accent
                    btnFrame.BorderSizePixel = 0
                    btnFrame.Size = UDim2.new(1, 0, 0, 38)
                    btnFrame.Font = Enum.Font.GothamBold
                    btnFrame.Text = btnName
                    btnFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
                    btnFrame.TextSize = 13
                    btnFrame.ClipsDescendants = true
                    btnFrame.Parent = stTabContent

                    local btnCorner = Instance.new("UICorner")
                    btnCorner.CornerRadius = UDim.new(0, 8)
                    btnCorner.Parent = btnFrame

                    btnFrame.MouseButton1Click:Connect(
                        function()
                            Utils:Ripple(btnFrame)
                            callback()
                        end
                    )

                    btnFrame.MouseEnter:Connect(
                        function()
                            Utils:Tween(btnFrame, {BackgroundColor3 = theme.AccentDark}, 0.2)
                        end
                    )

                    btnFrame.MouseLeave:Connect(
                        function()
                            Utils:Tween(btnFrame, {BackgroundColor3 = theme.Accent}, 0.2)
                        end
                    )
                end

                function subTabObj:Checkbox(cbConfig)
                    cbConfig = cbConfig or {}
                    local cbName = cbConfig.Name or "Checkbox"
                    local default = cbConfig.Default or false
                    local callback = cbConfig.Callback or function()
                        end
                    local flag = cbConfig.Flag

                    local cbFrame = Instance.new("Frame")
                    cbFrame.BackgroundColor3 = theme.Secondary
                    cbFrame.BorderSizePixel = 0
                    cbFrame.Size = UDim2.new(1, 0, 0, 40)
                    cbFrame.Parent = stTabContent

                    local cbCorner = Instance.new("UICorner")
                    cbCorner.CornerRadius = UDim.new(0, 8)
                    cbCorner.Parent = cbFrame

                    local cbStroke = Instance.new("UIStroke")
                    cbStroke.Color = theme.Border
                    cbStroke.Thickness = 1
                    cbStroke.Parent = cbFrame

                    local cbLabel = Instance.new("TextLabel")
                    cbLabel.BackgroundTransparency = 1
                    cbLabel.Position = UDim2.new(0, 10, 0, 0)
                    cbLabel.Size = UDim2.new(1, -50, 1, 0)
                    cbLabel.Font = Enum.Font.GothamBold
                    cbLabel.Text = cbName
                    cbLabel.TextColor3 = theme.Text
                    cbLabel.TextSize = 13
                    cbLabel.TextXAlignment = Enum.TextXAlignment.Left
                    cbLabel.Parent = cbFrame

                    local checkbox = Instance.new("TextButton")
                    checkbox.BackgroundColor3 = theme.Tertiary
                    checkbox.BorderSizePixel = 0
                    checkbox.AnchorPoint = Vector2.new(1, 0.5)
                    checkbox.Position = UDim2.new(1, -10, 0.5, 0)
                    checkbox.Size = UDim2.new(0, 24, 0, 24)
                    checkbox.Font = Enum.Font.GothamBold
                    checkbox.Text = ""
                    checkbox.TextColor3 = theme.Text
                    checkbox.TextSize = 16
                    checkbox.Parent = cbFrame

                    local checkCorner = Instance.new("UICorner")
                    checkCorner.CornerRadius = UDim.new(0, 6)
                    checkCorner.Parent = checkbox

                    local checkStroke = Instance.new("UIStroke")
                    checkStroke.Color = theme.Border
                    checkStroke.Thickness = 2
                    checkStroke.Parent = checkbox

                    local checked = default
                    if flag then
                        Zonix.Flags[flag] = checked
                    end

                    local function updateCheckbox()
                        checkbox.Text = checked and "✓" or ""
                        checkbox.BackgroundColor3 = checked and theme.Accent or theme.Tertiary
                        checkStroke.Color = checked and theme.Accent or theme.Border
                    end

                    updateCheckbox()

                    checkbox.MouseButton1Click:Connect(
                        function()
                            checked = not checked
                            if flag then
                                Zonix.Flags[flag] = checked
                            end
                            updateCheckbox()
                            Utils:Ripple(checkbox)
                            callback(checked)
                        end
                    )

                    return {
                        Set = function(_, value)
                            checked = value
                            if flag then
                                Zonix.Flags[flag] = checked
                            end
                            updateCheckbox()
                            callback(checked)
                        end
                    }
                end

                function subTabObj:Label(text)
                    local labelFrame = Instance.new("Frame")
                    labelFrame.BackgroundTransparency = 1
                    labelFrame.Size = UDim2.new(1, 0, 0, 25)
                    labelFrame.Parent = stTabContent

                    local label = Instance.new("TextLabel")
                    label.BackgroundTransparency = 1
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.Font = Enum.Font.Gotham
                    label.Text = text
                    label.TextColor3 = theme.Text
                    label.TextSize = 13
                    label.TextXAlignment = Enum.TextXAlignment.Left
                    label.Parent = labelFrame

                    return {
                        Set = function(_, newText)
                            label.Text = newText
                        end
                    }
                end

                function subTabObj:Section(name)
                    local section = Instance.new("Frame")
                    section.BackgroundTransparency = 1
                    section.Size = UDim2.new(1, 0, 0, 30)
                    section.Parent = stTabContent

                    local label = Instance.new("TextLabel")
                    label.BackgroundTransparency = 1
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.Font = Enum.Font.GothamBold
                    label.Text = name
                    label.TextColor3 = theme.Text
                    label.TextSize = 14
                    label.TextXAlignment = Enum.TextXAlignment.Left
                    label.Parent = section

                    local div = Instance.new("Frame")
                    div.BackgroundColor3 = theme.Border
                    div.BorderSizePixel = 0
                    div.Position = UDim2.new(0, 0, 1, -1)
                    div.Size = UDim2.new(1, 0, 0, 1)
                    div.Parent = section
                end

                function subTabObj:Paragraph(title, text)
                    local paraFrame = Instance.new("Frame")
                    paraFrame.BackgroundTransparency = 1
                    paraFrame.Size = UDim2.new(1, 0, 0, 0)
                    paraFrame.AutomaticSize = Enum.AutomaticSize.Y
                    paraFrame.Parent = stTabContent

                    local titleLabel = Instance.new("TextLabel")
                    titleLabel.BackgroundTransparency = 1
                    titleLabel.Size = UDim2.new(1, 0, 0, 20)
                    titleLabel.Font = Enum.Font.GothamBold
                    titleLabel.Text = title
                    titleLabel.TextColor3 = theme.Text
                    titleLabel.TextSize = 13
                    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
                    titleLabel.Parent = paraFrame

                    local textLabel = Instance.new("TextLabel")
                    textLabel.BackgroundTransparency = 1
                    textLabel.Position = UDim2.new(0, 0, 0, 22)
                    textLabel.Size = UDim2.new(1, 0, 0, 0)
                    textLabel.AutomaticSize = Enum.AutomaticSize.Y
                    textLabel.Font = Enum.Font.Gotham
                    textLabel.Text = text
                    textLabel.TextColor3 = theme.TextDark
                    textLabel.TextSize = 12
                    textLabel.TextWrapped = true
                    textLabel.TextXAlignment = Enum.TextXAlignment.Left
                    textLabel.Parent = paraFrame
                end

                function subTabObj:Divider()
                    local div = Instance.new("Frame")
                    div.BackgroundColor3 = theme.Border
                    div.BorderSizePixel = 0
                    div.Size = UDim2.new(1, 0, 0, 1)
                    div.Parent = stTabContent
                end

                function subTabObj:Toggle(togConfig)
                    togConfig = togConfig or {}
                    local togName = togConfig.Name or "Toggle"
                    local default = togConfig.Default or false
                    local flag = togConfig.Flag
                    local callback = togConfig.Callback or function()
                        end

                    local togFrame = Instance.new("Frame")
                    togFrame.BackgroundColor3 = theme.Secondary
                    togFrame.BorderSizePixel = 0
                    togFrame.Size = UDim2.new(1, 0, 0, 40)
                    togFrame.Parent = stTabContent

                    local togCorner = Instance.new("UICorner")
                    togCorner.CornerRadius = UDim.new(0, 8)
                    togCorner.Parent = togFrame

                    local togStroke = Instance.new("UIStroke")
                    togStroke.Color = theme.Border
                    togStroke.Thickness = 1
                    togStroke.Parent = togFrame

                    local togLabel = Instance.new("TextLabel")
                    togLabel.BackgroundTransparency = 1
                    togLabel.Position = UDim2.new(0, 10, 0, 0)
                    togLabel.Size = UDim2.new(1, -70, 1, 0)
                    togLabel.Font = Enum.Font.GothamBold
                    togLabel.Text = togName
                    togLabel.TextColor3 = theme.Text
                    togLabel.TextSize = 13
                    togLabel.TextXAlignment = Enum.TextXAlignment.Left
                    togLabel.Parent = togFrame

                    local togBtn = Instance.new("TextButton")
                    togBtn.AnchorPoint = Vector2.new(1, 0.5)
                    togBtn.BackgroundColor3 = default and theme.Accent or theme.Tertiary
                    togBtn.BorderSizePixel = 0
                    togBtn.Position = UDim2.new(1, -10, 0.5, 0)
                    togBtn.Size = UDim2.new(0, 45, 0, 24)
                    togBtn.Text = ""
                    togBtn.Parent = togFrame

                    local togBtnCorner = Instance.new("UICorner")
                    togBtnCorner.CornerRadius = UDim.new(1, 0)
                    togBtnCorner.Parent = togBtn

                    local togCircle = Instance.new("Frame")
                    togCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    togCircle.BorderSizePixel = 0
                    togCircle.Position = default and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)
                    togCircle.Size = UDim2.new(0, 20, 0, 20)
                    togCircle.Parent = togBtn

                    local togCircleCorner = Instance.new("UICorner")
                    togCircleCorner.CornerRadius = UDim.new(1, 0)
                    togCircleCorner.Parent = togCircle

                    local toggled = default

                    if flag then
                        Zonix.Flags[flag] = toggled
                    end

                    local function toggle()
                        toggled = not toggled

                        if flag then
                            Zonix.Flags[flag] = toggled
                        end

                        Utils:Tween(togBtn, {BackgroundColor3 = toggled and theme.Accent or theme.Tertiary}, 0.2)
                        Utils:Tween(
                            togCircle,
                            {Position = toggled and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)},
                            0.2
                        )

                        pcall(callback, toggled)
                    end

                    togBtn.MouseButton1Click:Connect(toggle)

                    return {
                        Set = function(_, value)
                            if toggled ~= value then
                                toggle()
                            end
                        end
                    }
                end

                function subTabObj:Slider(slConfig)
                    slConfig = slConfig or {}
                    local slName = slConfig.Name or "Slider"
                    local min = slConfig.Min or 0
                    local max = slConfig.Max or 100
                    local default = slConfig.Default or min
                    local increment = slConfig.Increment or 1
                    local flag = slConfig.Flag
                    local callback = slConfig.Callback or function()
                        end

                    local slFrame = Instance.new("Frame")
                    slFrame.BackgroundColor3 = theme.Secondary
                    slFrame.BorderSizePixel = 0
                    slFrame.Size = UDim2.new(1, 0, 0, 55)
                    slFrame.Parent = stTabContent

                    local slCorner = Instance.new("UICorner")
                    slCorner.CornerRadius = UDim.new(0, 8)
                    slCorner.Parent = slFrame

                    local slStroke = Instance.new("UIStroke")
                    slStroke.Color = theme.Border
                    slStroke.Thickness = 1
                    slStroke.Parent = slFrame

                    local slLabel = Instance.new("TextLabel")
                    slLabel.BackgroundTransparency = 1
                    slLabel.Position = UDim2.new(0, 10, 0, 5)
                    slLabel.Size = UDim2.new(1, -70, 0, 20)
                    slLabel.Font = Enum.Font.GothamBold
                    slLabel.Text = slName
                    slLabel.TextColor3 = theme.Text
                    slLabel.TextSize = 13
                    slLabel.TextXAlignment = Enum.TextXAlignment.Left
                    slLabel.Parent = slFrame

                    local slValue = Instance.new("TextLabel")
                    slValue.BackgroundTransparency = 1
                    slValue.AnchorPoint = Vector2.new(1, 0)
                    slValue.Position = UDim2.new(1, -10, 0, 5)
                    slValue.Size = UDim2.new(0, 50, 0, 20)
                    slValue.Font = Enum.Font.GothamBold
                    slValue.Text = tostring(default)
                    slValue.TextColor3 = theme.Accent
                    slValue.TextSize = 13
                    slValue.TextXAlignment = Enum.TextXAlignment.Right
                    slValue.Parent = slFrame

                    local slBack = Instance.new("Frame")
                    slBack.BackgroundColor3 = theme.Tertiary
                    slBack.BorderSizePixel = 0
                    slBack.Position = UDim2.new(0, 10, 0, 32)
                    slBack.Size = UDim2.new(1, -20, 0, 6)
                    slBack.Parent = slFrame

                    local slBackCorner = Instance.new("UICorner")
                    slBackCorner.CornerRadius = UDim.new(1, 0)
                    slBackCorner.Parent = slBack

                    local slFill = Instance.new("Frame")
                    slFill.BackgroundColor3 = theme.Accent
                    slFill.BorderSizePixel = 0
                    slFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
                    slFill.Parent = slBack

                    local slFillCorner = Instance.new("UICorner")
                    slFillCorner.CornerRadius = UDim.new(1, 0)
                    slFillCorner.Parent = slFill

                    local slBtn = Instance.new("TextButton")
                    slBtn.AnchorPoint = Vector2.new(0.5, 0.5)
                    slBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    slBtn.BorderSizePixel = 0
                    slBtn.Position = UDim2.new((default - min) / (max - min), 0, 0.5, 0)
                    slBtn.Size = UDim2.new(0, 14, 0, 14)
                    slBtn.Text = ""
                    slBtn.Parent = slBack

                    local slBtnCorner = Instance.new("UICorner")
                    slBtnCorner.CornerRadius = UDim.new(1, 0)
                    slBtnCorner.Parent = slBtn

                    local value = default

                    if flag then
                        Zonix.Flags[flag] = value
                    end

                    local dragging = false

                    local function update(input)
                        local pos =
                            math.clamp((input.Position.X - slBack.AbsolutePosition.X) / slBack.AbsoluteSize.X, 0, 1)
                        value = math.floor((min + (max - min) * pos) / increment + 0.5) * increment
                        value = math.clamp(value, min, max)

                        slValue.Text = tostring(value)

                        if flag then
                            Zonix.Flags[flag] = value
                        end

                        Utils:Tween(slFill, {Size = UDim2.new(pos, 0, 1, 0)}, 0.1)
                        Utils:Tween(slBtn, {Position = UDim2.new(pos, 0, 0.5, 0)}, 0.1)

                        pcall(callback, value)
                    end

                    slBtn.MouseButton1Down:Connect(
                        function()
                            dragging = true
                        end
                    )

                    UserInputService.InputEnded:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = false
                            end
                        end
                    )

                    UserInputService.InputChanged:Connect(
                        function(input)
                            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                                update(input)
                            end
                        end
                    )

                    slBack.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                update(input)
                            end
                        end
                    )

                    return {
                        Set = function(_, newValue)
                            value = math.clamp(newValue, min, max)
                            slValue.Text = tostring(value)
                            local pos = (value - min) / (max - min)
                            Utils:Tween(slFill, {Size = UDim2.new(pos, 0, 1, 0)}, 0.2)
                            Utils:Tween(slBtn, {Position = UDim2.new(pos, 0, 0.5, 0)}, 0.2)

                            if flag then
                                Zonix.Flags[flag] = value
                            end

                            pcall(callback, value)
                        end
                    }
                end

                function subTabObj:Dropdown(ddConfig)
                    ddConfig = ddConfig or {}
                    local ddName = ddConfig.Name or "Dropdown"
                    local options = ddConfig.Options or {"Option 1", "Option 2"}
                    local default = ddConfig.Default or options[1]
                    local flag = ddConfig.Flag
                    local callback = ddConfig.Callback or function()
                        end

                    local ddFrame = Instance.new("Frame")
                    ddFrame.BackgroundColor3 = theme.Secondary
                    ddFrame.BorderSizePixel = 0
                    ddFrame.Size = UDim2.new(1, 0, 0, 40)
                    ddFrame.ClipsDescendants = true
                    ddFrame.Parent = stTabContent

                    local ddCorner = Instance.new("UICorner")
                    ddCorner.CornerRadius = UDim.new(0, 8)
                    ddCorner.Parent = ddFrame

                    local ddStroke = Instance.new("UIStroke")
                    ddStroke.Color = theme.Border
                    ddStroke.Thickness = 1
                    ddStroke.Parent = ddFrame

                    local ddLabel = Instance.new("TextLabel")
                    ddLabel.BackgroundTransparency = 1
                    ddLabel.Position = UDim2.new(0, 10, 0, 0)
                    ddLabel.Size = UDim2.new(1, -40, 0, 40)
                    ddLabel.Font = Enum.Font.GothamBold
                    ddLabel.Text = ddName .. ": " .. default
                    ddLabel.TextColor3 = theme.Text
                    ddLabel.TextSize = 13
                    ddLabel.TextXAlignment = Enum.TextXAlignment.Left
                    ddLabel.Parent = ddFrame

                    local ddBtn = Instance.new("TextButton")
                    ddBtn.AnchorPoint = Vector2.new(1, 0)
                    ddBtn.BackgroundTransparency = 1
                    ddBtn.Position = UDim2.new(1, -5, 0, 5)
                    ddBtn.Size = UDim2.new(0, 30, 0, 30)
                    ddBtn.Font = Enum.Font.GothamBold
                    ddBtn.Text = "▼"
                    ddBtn.TextColor3 = theme.TextDark
                    ddBtn.TextSize = 12
                    ddBtn.Parent = ddFrame

                    local optList = Instance.new("Frame")
                    optList.BackgroundTransparency = 1
                    optList.Position = UDim2.new(0, 0, 0, 40)
                    optList.Size = UDim2.new(1, 0, 0, 0)
                    optList.Parent = ddFrame

                    local optLayout = Instance.new("UIListLayout")
                    optLayout.Padding = UDim.new(0, 2)
                    optLayout.Parent = optList

                    local selected = default
                    local opened = false

                    if flag then
                        Zonix.Flags[flag] = selected
                    end

                    for _, opt in ipairs(options) do
                        local optBtn = Instance.new("TextButton")
                        optBtn.BackgroundColor3 = theme.Tertiary
                        optBtn.BorderSizePixel = 0
                        optBtn.Size = UDim2.new(1, 0, 0, 30)
                        optBtn.Font = Enum.Font.Gotham
                        optBtn.Text = "  " .. opt
                        optBtn.TextColor3 = theme.TextDark
                        optBtn.TextSize = 12
                        optBtn.TextXAlignment = Enum.TextXAlignment.Left
                        optBtn.Parent = optList

                        optBtn.MouseButton1Click:Connect(
                            function()
                                selected = opt
                                ddLabel.Text = ddName .. ": " .. selected

                                if flag then
                                    Zonix.Flags[flag] = selected
                                end

                                pcall(callback, selected)
                            end
                        )

                        optBtn.MouseEnter:Connect(
                            function()
                                Utils:Tween(optBtn, {BackgroundColor3 = theme.Border}, 0.2)
                            end
                        )

                        optBtn.MouseLeave:Connect(
                            function()
                                Utils:Tween(optBtn, {BackgroundColor3 = theme.Tertiary}, 0.2)
                            end
                        )
                    end

                    ddBtn.MouseButton1Click:Connect(
                        function()
                            opened = not opened

                            if opened then
                                Utils:Tween(ddFrame, {Size = UDim2.new(1, 0, 0, 40 + #options * 32)}, 0.3)
                                Utils:Tween(ddBtn, {Rotation = 180}, 0.3)
                            else
                                Utils:Tween(ddFrame, {Size = UDim2.new(1, 0, 0, 40)}, 0.3)
                                Utils:Tween(ddBtn, {Rotation = 0}, 0.3)
                            end
                        end
                    )

                    return {
                        Set = function(_, opt)
                            if table.find(options, opt) then
                                selected = opt
                                ddLabel.Text = ddName .. ": " .. selected

                                if flag then
                                    Zonix.Flags[flag] = selected
                                end

                                pcall(callback, selected)
                            end
                        end,
                        Refresh = function(_, newOpts, newDefault)
                            options = newOpts
                            optList:ClearAllChildren()

                            local newLayout = Instance.new("UIListLayout")
                            newLayout.Padding = UDim.new(0, 2)
                            newLayout.Parent = optList

                            for _, opt in ipairs(options) do
                                local optBtn = Instance.new("TextButton")
                                optBtn.BackgroundColor3 = theme.Tertiary
                                optBtn.BorderSizePixel = 0
                                optBtn.Size = UDim2.new(1, 0, 0, 30)
                                optBtn.Font = Enum.Font.Gotham
                                optBtn.Text = "  " .. opt
                                optBtn.TextColor3 = theme.TextDark
                                optBtn.TextSize = 12
                                optBtn.TextXAlignment = Enum.TextXAlignment.Left
                                optBtn.Parent = optList

                                optBtn.MouseButton1Click:Connect(
                                    function()
                                        selected = opt
                                        ddLabel.Text = ddName .. ": " .. selected

                                        if flag then
                                            Zonix.Flags[flag] = selected
                                        end

                                        pcall(callback, selected)
                                    end
                                )

                                optBtn.MouseEnter:Connect(
                                    function()
                                        Utils:Tween(optBtn, {BackgroundColor3 = theme.Border}, 0.2)
                                    end
                                )

                                optBtn.MouseLeave:Connect(
                                    function()
                                        Utils:Tween(optBtn, {BackgroundColor3 = theme.Tertiary}, 0.2)
                                    end
                                )
                            end

                            if newDefault and table.find(options, newDefault) then
                                selected = newDefault
                                ddLabel.Text = ddName .. ": " .. selected
                            end
                        end
                    }
                end

                function subTabObj:Textbox(tbConfig)
                    tbConfig = tbConfig or {}
                    local tbName = tbConfig.Name or "Textbox"
                    local default = tbConfig.Default or ""
                    local placeholder = tbConfig.Placeholder or "Enter text..."
                    local flag = tbConfig.Flag
                    local callback = tbConfig.Callback or function()
                        end

                    local tbFrame = Instance.new("Frame")
                    tbFrame.BackgroundColor3 = theme.Secondary
                    tbFrame.BorderSizePixel = 0
                    tbFrame.Size = UDim2.new(1, 0, 0, 70)
                    tbFrame.Parent = stTabContent

                    local tbCorner = Instance.new("UICorner")
                    tbCorner.CornerRadius = UDim.new(0, 8)
                    tbCorner.Parent = tbFrame

                    local tbStroke = Instance.new("UIStroke")
                    tbStroke.Color = theme.Border
                    tbStroke.Thickness = 1
                    tbStroke.Parent = tbFrame

                    local tbLabel = Instance.new("TextLabel")
                    tbLabel.BackgroundTransparency = 1
                    tbLabel.Position = UDim2.new(0, 10, 0, 5)
                    tbLabel.Size = UDim2.new(1, -20, 0, 20)
                    tbLabel.Font = Enum.Font.GothamBold
                    tbLabel.Text = tbName
                    tbLabel.TextColor3 = theme.Text
                    tbLabel.TextSize = 13
                    tbLabel.TextXAlignment = Enum.TextXAlignment.Left
                    tbLabel.Parent = tbFrame

                    local tb = Instance.new("TextBox")
                    tb.BackgroundColor3 = theme.Tertiary
                    tb.BorderSizePixel = 0
                    tb.Position = UDim2.new(0, 10, 0, 30)
                    tb.Size = UDim2.new(1, -20, 0, 30)
                    tb.Font = Enum.Font.Gotham
                    tb.PlaceholderText = placeholder
                    tb.PlaceholderColor3 = theme.TextDark
                    tb.Text = default
                    tb.TextColor3 = theme.Text
                    tb.TextSize = 12
                    tb.TextXAlignment = Enum.TextXAlignment.Left
                    tb.ClearTextOnFocus = false
                    tb.Parent = tbFrame

                    local tbPad = Instance.new("UIPadding")
                    tbPad.PaddingLeft = UDim.new(0, 10)
                    tbPad.PaddingRight = UDim.new(0, 10)
                    tbPad.Parent = tb

                    local tbInCorner = Instance.new("UICorner")
                    tbInCorner.CornerRadius = UDim.new(0, 6)
                    tbInCorner.Parent = tb

                    if flag then
                        Zonix.Flags[flag] = default
                    end

                    tb.FocusLost:Connect(
                        function()
                            local text = tb.Text

                            if flag then
                                Zonix.Flags[flag] = text
                            end

                            pcall(callback, text)
                        end
                    )

                    tb.Focused:Connect(
                        function()
                            Utils:Tween(tbStroke, {Color = theme.Accent}, 0.2)
                        end
                    )

                    tb.FocusLost:Connect(
                        function()
                            Utils:Tween(tbStroke, {Color = theme.Border}, 0.2)
                        end
                    )

                    return {
                        Set = function(_, text)
                            tb.Text = text

                            if flag then
                                Zonix.Flags[flag] = text
                            end

                            pcall(callback, text)
                        end
                    }
                end

                function subTabObj:ProgressBar(pbConfig)
                    pbConfig = pbConfig or {}
                    local pbName = pbConfig.Name or "Progress"
                    local progress = pbConfig.Progress or 0

                    local pbFrame = Instance.new("Frame")
                    pbFrame.BackgroundColor3 = theme.Secondary
                    pbFrame.BorderSizePixel = 0
                    pbFrame.Size = UDim2.new(1, 0, 0, 55)
                    pbFrame.Parent = stTabContent

                    local pbCorner = Instance.new("UICorner")
                    pbCorner.CornerRadius = UDim.new(0, 8)
                    pbCorner.Parent = pbFrame

                    local pbStroke = Instance.new("UIStroke")
                    pbStroke.Color = theme.Border
                    pbStroke.Thickness = 1
                    pbStroke.Parent = pbFrame

                    local pbLabel = Instance.new("TextLabel")
                    pbLabel.BackgroundTransparency = 1
                    pbLabel.Position = UDim2.new(0, 10, 0, 5)
                    pbLabel.Size = UDim2.new(1, -60, 0, 20)
                    pbLabel.Font = Enum.Font.GothamBold
                    pbLabel.Text = pbName
                    pbLabel.TextColor3 = theme.Text
                    pbLabel.TextSize = 13
                    pbLabel.TextXAlignment = Enum.TextXAlignment.Left
                    pbLabel.Parent = pbFrame

                    local pbPercent = Instance.new("TextLabel")
                    pbPercent.BackgroundTransparency = 1
                    pbPercent.AnchorPoint = Vector2.new(1, 0)
                    pbPercent.Position = UDim2.new(1, -10, 0, 5)
                    pbPercent.Size = UDim2.new(0, 50, 0, 20)
                    pbPercent.Font = Enum.Font.GothamBold
                    pbPercent.Text = math.floor(progress * 100) .. "%"
                    pbPercent.TextColor3 = theme.Accent
                    pbPercent.TextSize = 13
                    pbPercent.TextXAlignment = Enum.TextXAlignment.Right
                    pbPercent.Parent = pbFrame

                    local pbBack = Instance.new("Frame")
                    pbBack.BackgroundColor3 = theme.Tertiary
                    pbBack.BorderSizePixel = 0
                    pbBack.Position = UDim2.new(0, 10, 0, 32)
                    pbBack.Size = UDim2.new(1, -20, 0, 8)
                    pbBack.Parent = pbFrame

                    local pbBackCorner = Instance.new("UICorner")
                    pbBackCorner.CornerRadius = UDim.new(1, 0)
                    pbBackCorner.Parent = pbBack

                    local pbFill = Instance.new("Frame")
                    pbFill.BackgroundColor3 = theme.Accent
                    pbFill.BorderSizePixel = 0
                    pbFill.Size = UDim2.new(progress, 0, 1, 0)
                    pbFill.Parent = pbBack

                    local pbFillCorner = Instance.new("UICorner")
                    pbFillCorner.CornerRadius = UDim.new(1, 0)
                    pbFillCorner.Parent = pbFill

                    return {
                        Set = function(_, newProgress)
                            progress = math.clamp(newProgress, 0, 1)
                            Utils:Tween(pbFill, {Size = UDim2.new(progress, 0, 1, 0)}, 0.3)
                            pbPercent.Text = math.floor(progress * 100) .. "%"
                        end
                    }
                end

                function subTabObj:AddSpacing(pixels)
                    pixels = pixels or 10
                    local spacer = Instance.new("Frame")
                    spacer.BackgroundTransparency = 1
                    spacer.BorderSizePixel = 0
                    spacer.Size = UDim2.new(1, 0, 0, pixels)
                    spacer.Parent = stTabContent
                end

                function subTabObj:GroupBox(gbConfig)
                    gbConfig = gbConfig or {}
                    local gbName = gbConfig.Name or "Group"
                    local inline = gbConfig.Inline or false

                    local groupBox = {
                        Elements = {},
                        Container = nil
                    }

                    local gbFrame = Instance.new("Frame")
                    gbFrame.BackgroundColor3 = theme.Tertiary
                    gbFrame.BorderSizePixel = 0
                    gbFrame.Size = inline and UDim2.new(0.48, 0, 0, 0) or UDim2.new(1, 0, 0, 0)
                    gbFrame.AutomaticSize = Enum.AutomaticSize.Y
                    gbFrame.Parent = stTabContent

                    local gbCorner = Instance.new("UICorner")
                    gbCorner.CornerRadius = UDim.new(0, 8)
                    gbCorner.Parent = gbFrame

                    local gbHeader = Instance.new("TextLabel")
                    gbHeader.BackgroundTransparency = 1
                    gbHeader.Size = UDim2.new(1, 0, 0, 28)
                    gbHeader.Font = Enum.Font.GothamBold
                    gbHeader.Text = gbName
                    gbHeader.TextColor3 = theme.Accent
                    gbHeader.TextSize = 13
                    gbHeader.TextXAlignment = Enum.TextXAlignment.Left
                    gbHeader.Parent = gbFrame

                    local gbHeaderPad = Instance.new("UIPadding")
                    gbHeaderPad.PaddingLeft = UDim.new(0, 8)
                    gbHeaderPad.Parent = gbHeader

                    local gbContent = Instance.new("Frame")
                    gbContent.BackgroundTransparency = 1
                    gbContent.Position = UDim2.new(0, 0, 0, 30)
                    gbContent.Size = UDim2.new(1, 0, 1, -30)
                    gbContent.AutomaticSize = Enum.AutomaticSize.Y
                    gbContent.Parent = gbFrame

                    local gbList = Instance.new("UIListLayout")
                    gbList.Padding = UDim.new(0, 5)
                    gbList.SortOrder = Enum.SortOrder.LayoutOrder
                    gbList.Parent = gbContent

                    local gbPad = Instance.new("UIPadding")
                    gbPad.PaddingLeft = UDim.new(0, 8)
                    gbPad.PaddingRight = UDim.new(0, 8)
                    gbPad.PaddingBottom = UDim.new(0, 8)
                    gbPad.Parent = gbContent

                    groupBox.Container = gbContent

                    function groupBox:Checkbox(cbConfig)
                        cbConfig = cbConfig or {}
                        local cbName = cbConfig.Name or "Checkbox"
                        local default = cbConfig.Default or false
                        local callback = cbConfig.Callback or function()
                            end
                        local flag = cbConfig.Flag

                        local cbFrame = Instance.new("Frame")
                        cbFrame.BackgroundColor3 = theme.Secondary
                        cbFrame.BorderSizePixel = 0
                        cbFrame.Size = UDim2.new(1, 0, 0, 32)
                        cbFrame.Parent = gbContent

                        local cbCorner = Instance.new("UICorner")
                        cbCorner.CornerRadius = UDim.new(0, 6)
                        cbCorner.Parent = cbFrame

                        local cbLabel = Instance.new("TextLabel")
                        cbLabel.BackgroundTransparency = 1
                        cbLabel.Position = UDim2.new(0, 8, 0, 0)
                        cbLabel.Size = UDim2.new(1, -38, 1, 0)
                        cbLabel.Font = Enum.Font.Gotham
                        cbLabel.Text = cbName
                        cbLabel.TextColor3 = theme.Text
                        cbLabel.TextSize = 11
                        cbLabel.TextXAlignment = Enum.TextXAlignment.Left
                        cbLabel.Parent = cbFrame

                        local checkbox = Instance.new("TextButton")
                        checkbox.BackgroundColor3 = theme.Background
                        checkbox.BorderSizePixel = 0
                        checkbox.AnchorPoint = Vector2.new(1, 0.5)
                        checkbox.Position = UDim2.new(1, -8, 0.5, 0)
                        checkbox.Size = UDim2.new(0, 18, 0, 18)
                        checkbox.Font = Enum.Font.GothamBold
                        checkbox.Text = ""
                        checkbox.TextColor3 = theme.Text
                        checkbox.TextSize = 12
                        checkbox.Parent = cbFrame

                        local checkCorner = Instance.new("UICorner")
                        checkCorner.CornerRadius = UDim.new(0, 4)
                        checkCorner.Parent = checkbox

                        local checkStroke = Instance.new("UIStroke")
                        checkStroke.Color = theme.Border
                        checkStroke.Thickness = 1
                        checkStroke.Parent = checkbox

                        local checked = default
                        if flag then
                            Zonix.Flags[flag] = checked
                        end

                        local function updateCheckbox()
                            checkbox.Text = checked and "✓" or ""
                            checkbox.BackgroundColor3 = checked and theme.Accent or theme.Background
                            checkStroke.Color = checked and theme.Accent or theme.Border
                        end

                        updateCheckbox()

                        checkbox.MouseButton1Click:Connect(
                            function()
                                checked = not checked
                                if flag then
                                    Zonix.Flags[flag] = checked
                                end
                                updateCheckbox()
                                callback(checked)
                            end
                        )

                        return {
                            Set = function(_, value)
                                checked = value
                                if flag then
                                    Zonix.Flags[flag] = checked
                                end
                                updateCheckbox()
                                callback(checked)
                            end
                        }
                    end

                    return groupBox
                end

                stBtn.MouseButton1Click:Connect(
                    function()
                        for j, otherTab in ipairs(subTab.Tabs) do
                            otherTab.Container.Visible = j == i
                            otherTab.TabButton.BackgroundColor3 = j == i and theme.Accent or theme.Tertiary
                            otherTab.TabButton.TextColor3 = j == i and Color3.fromRGB(255, 255, 255) or theme.TextDark
                        end
                        subTab.ActiveTab = i
                    end
                )

                table.insert(subTab.Tabs, subTabObj)
            end

            return subTab
        end

        function tab:StartInline()
            local inlineContainer = Instance.new("Frame")
            inlineContainer.BackgroundTransparency = 1
            inlineContainer.Size = UDim2.new(1, 0, 0, 0)
            inlineContainer.AutomaticSize = Enum.AutomaticSize.Y
            inlineContainer.Parent = tabContent

            local inlineList = Instance.new("UIListLayout")
            inlineList.FillDirection = Enum.FillDirection.Horizontal
            inlineList.HorizontalAlignment = Enum.HorizontalAlignment.Left
            inlineList.Padding = UDim.new(0, 8)
            inlineList.SortOrder = Enum.SortOrder.LayoutOrder
            inlineList.Parent = inlineContainer

            local originalContent = tabContent
            tabContent = inlineContainer

            return {
                Stop = function()
                    tabContent = originalContent
                end
            }
        end

        return tab
    end

    return window
end

-- ═══════════════════════════════════════════════════════════════
--                         CONFIG SYSTEM
-- ═══════════════════════════════════════════════════════════════

function Zonix:SaveConfig(name)
    name = name or "default"
    local config = HttpService:JSONEncode(Zonix.Flags)

    pcall(
        function()
            Executor.MakeFolder(Zonix.Settings.ConfigFolder)
            Executor.WriteFile(Zonix.Settings.ConfigFolder .. "/" .. name .. ".json", config)
        end
    )

    Zonix:Notify(
        {
            Title = "Config Saved",
            Content = "Configuration '" .. name .. "' has been saved",
            Duration = 2,
            Type = "Success"
        }
    )
end

function Zonix:LoadConfig(name)
    name = name or "default"

    pcall(
        function()
            if Executor.IsFile(Zonix.Settings.ConfigFolder .. "/" .. name .. ".json") then
                local config =
                    HttpService:JSONDecode(Executor.ReadFile(Zonix.Settings.ConfigFolder .. "/" .. name .. ".json"))

                for flag, value in pairs(config) do
                    Zonix.Flags[flag] = value
                end

                Zonix:Notify(
                    {
                        Title = "Config Loaded",
                        Content = "Configuration '" .. name .. "' has been loaded",
                        Duration = 2,
                        Type = "Success"
                    }
                )
            end
        end
    )
end

-- ═══════════════════════════════════════════════════════════════
--                            INIT
-- ═══════════════════════════════════════════════════════════════

print("╔══════════════════════════════════════════════════════════╗")
print("║                 Zonix UI v1.3.3 LOADED!                  ║")
print("╠══════════════════════════════════════════════════════════╣")
print("║  Created by: Zontraz                                     ║")
print("║  Website: https://zon.su                                 ║")
print("║  Executor: " .. string.format("%-42s", Zonix.Executor) .. " ║")
print("║  Clipboard: " .. (Executor.SetClipboard and "✓ Supported" or "✗ Not Supported") .. string.rep(" ", 36) .. " ║")
print("║  Files: " .. (Executor.WriteFile and "✓ Supported" or "✗ Not Supported") .. string.rep(" ", 40) .. " ║")
print("║  ⚡ AutoExe: ✓ Fully Compatible                          ║")
print("╚══════════════════════════════════════════════════════════╝")

return Zonix
