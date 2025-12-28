<div align="center">

# ⚡ ZONIX UI v1.2

### The Ultimate Roblox UI Library

**Modern • Sleek • Feature-Rich • Mobile-Friendly**

[📖 Documentation](https://zon.su/zonix) • [⬇️ Download](https://hub.zon.su/zonix-ui.lua) • [🌐 Website](https://zon.su)

</div>

---

## 🎯 Features

- 🎨 **3 Built-in Themes** - Dark, Light, and Midnight
- 📱 **Fully Responsive** - Works perfectly on mobile, tablet, and desktop
- 🎮 **Touch Support** - Native touch controls for mobile devices
- 💾 **Config System** - Save and load your settings
- 🔧 **14 Components** - Everything you need to build powerful UIs
- ⚡ **Notifications & Prompts** - Built-in user feedback system
- 🌈 **Custom Themes** - Create your own themes with 13 color properties
- 🌈 **Rainbow Mode** - Animated rainbow borders and effects
- 🔑 **Flag System** - Easy access to component values
- 📋 **Clipboard Support** - Works across all executors
- ⚙️ **Auto-Detection** - Automatically detects and adapts to your executor

---

## 📦 Installation

```lua
local Zonix = loadstring(game:HttpGet("https://hub.zon.su/zonix-ui.lua"))()
```

**File Location:** https://hub.zon.su/zonix-ui.lua  
**Documentation:** https://zon.su/zonix

---

## 🚀 Quick Start

```lua
-- Load the library
local Zonix = loadstring(game:HttpGet("https://hub.zon.su/zonix-ui.lua"))()

-- Create a window
local Window = Zonix:Window({
    Name = "My Script Hub"
})

-- Create a tab
local Tab = Window:Tab({
    Name = "Main",
    Icon = "🏠"
})

-- Add components
Tab:Button({
    Name = "Click Me!",
    Callback = function()
        print("Button clicked!")
    end
})
```

---

## 📚 Table of Contents

- [Window Creation](#-window-creation)
- [Components](#-components)
  - [Label](#label)
  - [Section](#section)
  - [Paragraph](#paragraph)
  - [Divider](#divider)
  - [Button](#button)
  - [Toggle](#toggle)
  - [Slider](#slider)
  - [Dropdown](#dropdown)
  - [Textbox](#textbox)
  - [Keybind](#keybind)
  - [ColorPicker](#colorpicker)
  - [CopyButton](#copybutton)
  - [ProgressBar](#progressbar)
- [Utilities](#-utilities)
  - [Notifications](#notifications)
  - [Prompts](#prompts)
  - [Themes](#themes)
  - [Config System](#config-system)
- [Examples](#-examples)
- [FAQ](#-faq)

---

## 🪟 Window Creation

### Basic Window

```lua
local Window = Zonix:Window({
    Name = "My Script Name"    -- Window title (optional, default: "Zonix UI")
})
```

**Parameters:**
- `Name` (string, optional) - The window title (default: "Zonix UI")

**Window Features:**
- Draggable by clicking and holding the top bar
- Minimize button (_) - Collapses window to topbar only
- Close button (×) - Destroys the window completely
- Smooth animations for all interactions
- Automatic shadow and glow effects

### Creating Tabs

```lua
local Tab = Window:Tab({
    Name = "Tab Name",    -- Tab name (optional, default: "Tab")
    Icon = "🏠"          -- Tab icon (optional, default: "📄")
})
```

**Tab Features:**
- Click to switch between tabs
- First tab is automatically selected
- Smooth color transitions on selection
- Scrollable content area
- Hover effects for inactive tabs

---

## 🧩 Components

### Label

Display static text.

```lua
local MyLabel = Tab:Label("This is a label")

-- Update dynamically
MyLabel:Set("Updated text!")
```

**Methods:**
- `:Set(text)` - Update label text

---

### Section

Create section headers to organize your UI.

```lua
Tab:Section("Settings")
Tab:Section("⚙️ Advanced Options")
```

---

### Paragraph

Display multi-line text with a title.

```lua
Tab:Paragraph("About", "This is a paragraph with detailed information. You can use this for descriptions, credits, or any multi-line text.")
```

---

### Divider

Add visual separation between components.

```lua
Tab:Divider()
```

---

### Button

Interactive button with callback.

```lua
Tab:Button({
    Name = "Click Me",                    -- Button text (required)
    Callback = function()                  -- Function to run on click (required)
        print("Button was clicked!")
    end
})
```

---

### Toggle

On/off switch with state tracking.

```lua
local MyToggle = Tab:Toggle({
    Name = "Enable Feature",              -- Toggle name (required)
    Default = false,                       -- Starting state (optional, default: false)
    Flag = "MyToggle",                    -- Flag name for value access (optional)
    Callback = function(value)            -- Function called on change (optional)
        print("Toggle is now:", value)
    end
})

-- Methods
MyToggle:Set(true)                        -- Update toggle state
local state = Zonix.Flags.MyToggle       -- Access current value via flag
```

**Methods:**
- `:Set(value)` - Set toggle state (true/false)

---

### Slider

Numeric slider with range.

```lua
local MySlider = Tab:Slider({
    Name = "Speed",                       -- Slider name (required)
    Min = 0,                              -- Minimum value (required)
    Max = 100,                            -- Maximum value (required)
    Default = 50,                         -- Starting value (optional, default: Min)
    Increment = 1,                        -- Step size (optional, default: 1)
    Flag = "Speed",                       -- Flag name (optional)
    Callback = function(value)            -- Function called on change (optional)
        print("Speed set to:", value)
    end
})

-- Methods
MySlider:Set(75)                         -- Update slider value
local value = Zonix.Flags.Speed         -- Access current value via flag
```

**Methods:**
- `:Set(value)` - Set slider value

---

### Dropdown

Selection menu with multiple options.

```lua
local MyDropdown = Tab:Dropdown({
    Name = "Select Option",               -- Dropdown name (required)
    Options = {"Option 1", "Option 2", "Option 3"}, -- Available options (required)
    Default = "Option 1",                 -- Starting selection (optional)
    Flag = "Selected",                    -- Flag name (optional)
    Callback = function(value)            -- Function called on selection (optional)
        print("Selected:", value)
    end
})

-- Methods
MyDropdown:Set("Option 2")               -- Change selection
MyDropdown:Update({"New", "Options", "List"}) -- Replace all options
local selected = Zonix.Flags.Selected   -- Access current value via flag
```

**Methods:**
- `:Set(option)` - Set selected option
- `:Update(options)` - Replace dropdown options

---

### Textbox

Text input field.

```lua
local MyTextbox = Tab:Textbox({
    Name = "Username",                    -- Textbox label (required)
    Placeholder = "Enter username...",    -- Placeholder text (optional)
    Default = "",                         -- Starting value (optional, default: "")
    Flag = "Username",                    -- Flag name (optional)
    Callback = function(value)            -- Function called on text change (optional)
        print("Text entered:", value)
    end
})

-- Methods
MyTextbox:Set("NewText")                 -- Update textbox value
local text = Zonix.Flags.Username       -- Access current value via flag
```

**Methods:**
- `:Set(text)` - Set textbox text

---

### Keybind

Key binding component.

```lua
local MyKeybind = Tab:Keybind({
    Name = "Toggle UI",                   -- Keybind name (required)
    Default = Enum.KeyCode.RightShift,    -- Starting key (optional)
    Flag = "UIToggle",                    -- Flag name (optional)
    Callback = function(key)              -- Function called on key press (optional)
        print("Pressed:", key.Name)
    end
})

-- Methods
MyKeybind:Set(Enum.KeyCode.F)            -- Change keybind
local key = Zonix.Flags.UIToggle        -- Access current key via flag
```

**Methods:**
- `:Set(keycode)` - Set keybind

---

### ColorPicker

Color selection component.

```lua
local MyColor = Tab:ColorPicker({
    Name = "Theme Color",                 -- ColorPicker name (required)
    Default = Color3.fromRGB(0, 255, 255), -- Starting color (optional)
    Flag = "ThemeColor",                  -- Flag name (optional)
    Callback = function(color)            -- Function called on color change (optional)
        print("Color:", color)
    end
})

-- Methods
MyColor:Set(Color3.fromRGB(255, 0, 255)) -- Change color
local color = Zonix.Flags.ThemeColor    -- Access current color via flag
```

**Methods:**
- `:Set(color3)` - Set color

---

### CopyButton

Button that copies text to clipboard.

```lua
Tab:CopyButton({
    Name = "Copy Discord Link",           -- Button text (required)
    Text = "discord.gg/example"           -- Text to copy (required)
})
```

**Features:**
- Automatically copies text when clicked
- Works across all executors with fallback support
- Shows success feedback

---

### ProgressBar

Visual progress indicator.

```lua
local MyProgress = Tab:ProgressBar({
    Name = "Loading Progress",            -- ProgressBar name (required)
    Progress = 0.5                        -- Starting progress 0-1 (optional, default: 0)
})

-- Methods
MyProgress:Set(0.75)                     -- Update progress (0 to 1)
```

**Methods:**
- `:Set(value)` - Set progress (0.0 to 1.0)

---

## 🛠️ Utilities

### Notifications

Display temporary messages to the user.

```lua
Zonix:Notify({
    Title = "Success!",                   -- Notification title (required)
    Content = "Operation completed",      -- Notification message (required)
    Type = "Success",                     -- Type: "Success", "Error", "Warning", "Info" (optional)
    Duration = 5                          -- Display time in seconds (optional, default: 5)
})
```

**Types:**
- `Success` - Green notification for successful operations
- `Error` - Red notification for errors
- `Warning` - Yellow notification for warnings
- `Info` - Blue notification for information

---

### Prompts

Get user input through dialog boxes.

```lua
Zonix:Prompt({
    Title = "Confirm Action",             -- Prompt title (required)
    Content = "Are you sure?",            -- Prompt message (required)
    Buttons = {
        Confirm = {
            Text = "Yes",                  -- Button text (required)
            Callback = function()          -- Function to run on click (required)
                print("User confirmed!")
            end
        },
        Cancel = {
            Text = "No",                   -- Button text (required)
            Callback = function()          -- Function to run on click (required)
                print("User cancelled!")
            end
        }
    }
})
```

---

### Themes

#### Built-in Themes

Zonix UI comes with **3 beautiful built-in themes**:

| Theme | Background | Accent | Description |
|-------|------------|--------|-------------|
| **Dark** | Deep blue-gray | Purple (#8A2BE2) | Default dark theme, easy on the eyes |
| **Light** | Clean white | Purple (#8A2BE2) | Bright theme for daytime use |
| **Midnight** | Very dark blue | Cyan (#00B4FF) | Ultra-dark theme with cyan accents |

#### Switching Themes

```lua
-- Change theme
Zonix.Settings.Theme = "Dark"
Zonix.Settings.Theme = "Light"
Zonix.Settings.Theme = "Midnight"
```

#### Rainbow Mode

Enable animated rainbow borders and effects on windows and UI elements:

```lua
Zonix.Settings.RainbowMode = true
Zonix.Settings.RainbowSpeed = 5  -- 1-10 (higher = faster)
```

#### Creating Custom Themes

Create your own custom themes with full color control (13 properties required):

```lua
Zonix.Themes.MyTheme = {
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

-- Use your custom theme
Zonix.Settings.Theme = "MyTheme"
```

**Theme Color Properties:**

| Property | Usage |
|----------|-------|
| `Background` | Main window background |
| `Secondary` | Tab bar, component backgrounds |
| `Tertiary` | Component interiors (textbox, slider track) |
| `Border` | Window borders, dividers |
| `Text` | Primary text color |
| `TextDark` | Secondary text, placeholders |
| `Accent` | Buttons, active elements |
| `AccentDark` | Hover states |
| `Success` | Success notifications |
| `Warning` | Warning notifications |
| `Error` | Error notifications |
| `Info` | Info notifications |
| `Topbar` | Window topbar background |

#### All Settings

Complete list of customizable settings:

```lua
Zonix.Settings.Theme = "Dark"
Zonix.Settings.RainbowMode = false
Zonix.Settings.RainbowSpeed = 5
Zonix.Settings.AnimationSpeed = 0.25
Zonix.Settings.TooltipsEnabled = true
Zonix.Settings.ConfigFolder = "ZonixUI"
```

| Setting | Type | Default | Description |
|---------|------|---------|-------------|
| `Theme` | string | "Dark" | Current theme name |
| `RainbowMode` | boolean | false | Enable rainbow effects |
| `RainbowSpeed` | number | 5 | Rainbow animation speed (1-10) |
| `AnimationSpeed` | number | 0.25 | UI animation duration in seconds |
| `TooltipsEnabled` | boolean | true | Show hover tooltips |
| `ConfigFolder` | string | "ZonixUI" | Folder name for config files |

---

### Config System

Save and load your UI configurations.

#### Saving Configuration

```lua
Zonix:SaveConfig("MyConfig")
```

**What gets saved:**
- All component values (toggles, sliders, textboxes, etc.)
- Color picker selections
- Dropdown selections
- Keybinds

#### Loading Configuration

```lua
Zonix:LoadConfig("MyConfig")
```

**Note:** Configs are saved per-game using `game.PlaceId` to prevent conflicts.

---

## 💡 Examples

### Example 1: Simple Script

```lua
local Zonix = loadstring(game:HttpGet("https://hub.zon.su/zonix-ui.lua"))()
local Window = Zonix:Window({ Name = "Simple Script" })
local Tab = Window:Tab({ Name = "Main", Icon = "🏠" })

local WalkSpeed = 16

Tab:Slider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(value)
        WalkSpeed = value
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

Tab:Button({
    Name = "Reset WalkSpeed",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        Zonix:Notify({
            Title = "Reset",
            Content = "WalkSpeed reset to default",
            Type = "Info"
        })
    end
})
```

### Example 2: Progress Loading

```lua
local Zonix = loadstring(game:HttpGet("https://hub.zon.su/zonix-ui.lua"))()
local Window = Zonix:Window({ Name = "Loader" })
local Tab = Window:Tab({ Name = "Load", Icon = "⏳" })

local Progress = Tab:ProgressBar({ Name = "Loading...", Progress = 0 })

Tab:Button({
    Name = "Start Loading",
    Callback = function()
        for i = 0, 10 do
            wait(0.3)
            Progress:Set(i / 10)
        end
        Zonix:Notify({
            Title = "Complete!",
            Content = "Loading finished",
            Type = "Success"
        })
    end
})
```

### Example 3: Dynamic Components

```lua
local Zonix = loadstring(game:HttpGet("https://hub.zon.su/zonix-ui.lua"))()
local Window = Zonix:Window({ Name = "Dynamic UI" })
local Tab = Window:Tab({ Name = "Main", Icon = "🎮" })

local Label = Tab:Label("Status: Idle")
local Slider = Tab:Slider({ Name = "Value", Min = 0, Max = 100, Default = 50 })
local Toggle = Tab:Toggle({ Name = "Feature", Default = false })

Tab:Button({
    Name = "Update All",
    Callback = function()
        Label:Set("Status: Updated!")
        Slider:Set(75)
        Toggle:Set(true)
    end
})
```

### Example 4: All Components Showcase

```lua
local Zonix = loadstring(game:HttpGet("https://hub.zon.su/zonix-ui.lua"))()
local Window = Zonix:Window({ Name = "All Components" })
local Tab = Window:Tab({ Name = "Main", Icon = "🎨" })

Tab:Section("Text Components")
Tab:Label("This is a label")
Tab:Paragraph("About", "This is a paragraph with multiple lines of text.")
Tab:Divider()

Tab:Section("Interactive Components")
Tab:Button({ Name = "Click Me", Callback = function() print("Clicked") end })
Tab:Toggle({ Name = "Enable Feature", Flag = "Feature" })
Tab:Slider({ Name = "Value", Min = 0, Max = 100, Flag = "Value" })
Tab:Dropdown({ Name = "Option", Options = {"A", "B", "C"}, Flag = "Option" })
Tab:Textbox({ Name = "Input", Placeholder = "Type...", Flag = "Input" })
Tab:Keybind({ Name = "Hotkey", Default = Enum.KeyCode.E, Flag = "Hotkey" })
Tab:ColorPicker({ Name = "Color", Flag = "Color" })
Tab:Divider()

Tab:Section("Utility Components")
Tab:CopyButton({ Name = "Copy URL", Text = "https://hub.zon.su" })
Tab:ProgressBar({ Name = "Progress", Progress = 0.75 })
```

---

## ❓ FAQ

<details>
<summary><b>Q: Does this work on mobile?</b></summary>
<br>
A: Yes! Zonix UI is fully responsive and works perfectly on mobile, tablet, and desktop with touch support.
</details>

<details>
<summary><b>Q: Which executor is best?</b></summary>
<br>
A: Zonix UI works on ALL executors. Choose based on your needs, platform, and preferences.
</details>

<details>
<summary><b>Q: Does clipboard work on all executors?</b></summary>
<br>
A: Zonix UI tries multiple clipboard function names and works on most executors with automatic fallbacks.
</details>

<details>
<summary><b>Q: How do I save my settings?</b></summary>
<br>
A: Use <code>Zonix:SaveConfig("name")</code> to save and <code>Zonix:LoadConfig("name")</code> to load configurations.
</details>

<details>
<summary><b>Q: Can I use multiple windows?</b></summary>
<br>
A: Yes! Create multiple windows with different names and they'll work independently.
</details>

<details>
<summary><b>Q: How do I access component values?</b></summary>
<br>
A: Use flags! Set a <code>Flag</code> parameter on components and access via <code>Zonix.Flags.YourFlag</code>
</details>

<details>
<summary><b>Q: Will this get me banned?</b></summary>
<br>
A: Using any exploit carries risk. Zonix UI itself won't get you banned, but the scripts you run might. Always use on alt accounts.
</details>

<details>
<summary><b>Q: How do I update the library?</b></summary>
<br>
A: Simply reload the script with the latest version from hub.zon.su. Your configs will be preserved if using the same config names.
</details>

<details>
<summary><b>Q: Can I customize the UI colors?</b></summary>
<br>
A: Yes! Create custom themes by defining all 13 color properties in <code>Zonix.Themes.YourTheme</code> then set <code>Zonix.Settings.Theme = "YourTheme"</code>
</details>
