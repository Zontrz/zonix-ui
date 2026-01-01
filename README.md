<div align="center">

# ⚡ ZONIX UI v1.4.0

### The Ultimate Roblox UI Library

**Modern • Sleek • Feature-Rich • Mobile-Friendly**

[📖 Documentation](https://zon.su/zonix) • [⬇️ Download](https://hub.zon.su/zonix-ui.lua) • [🌐 Website](https://zon.su)

</div>

---

## 🎯 What's New in v1.4.0

### 🆕 NEW COMPONENTS & FEATURES:

- 🔎 **NEW: Advanced Search Component** - Brand new Search component with 6 modes, fuzzy matching, intelligent ranking, and extensive customization!
- 🔲 **NEW: Shrink Minimize Mode** - Minimize windows to compact 100x100 square OR traditional topbar-only collapse

### ⚡ SEARCH COMPONENT FEATURES:

- 🔍 **6 Search Modes** - Exact, Contains, Starts With, Ends With, Fuzzy, Regex with visual mode selector
- ✨ **Fuzzy Matching** - Advanced Levenshtein distance algorithm for typo-tolerant searches ("togle" finds "toggle"!)
- 📊 **Intelligent Ranking** - Results scored and sorted by relevance with name/tag match boosting
- 🎨 **Score-Based Highlighting** - Better matches = brighter highlights and longer duration (2-4 seconds)
- 🏷️ **Tag-Based Search** - Search elements by custom tags with AddElementTag() method
- 📜 **Search History** - Auto-saves up to 10 recent searches with dropdown quick access
- ⚡ **Live Search** - Search as you type with configurable debouncing and performance optimization
- 📱 **Fully Responsive** - Scales perfectly on ALL screen sizes (80% mobile to 150% large desktop)
- 🎯 **API Methods** - SetMode(), GetMode(), AddElementTag(), Clear(), ClearHistory(), Focus(), GetResults()
- 👁️ **HideNonMatching Mode** - Focus mode that hides all non-matching elements while searching
- 📍 **Flexible Positioning** - Place search bar at top, bottom, or in creation order
- 🔧 **CustomSearch Function** - Search workspace parts, players, or ANY custom data source
- 🎯 **Enhanced Callback** - Search object now passed as 3rd parameter for method access

---

## 🎯 Features

- 🎨 **3 Built-in Themes** - Dark, Light, and Midnight
- 📱 **Fully Responsive** - Works perfectly on mobile, tablet, and desktop
- 🎮 **Touch Support** - Native touch controls for mobile devices
- 💾 **Config System** - Save and load your settings
- 🔧 **14 Core Components** - Label, Section, Paragraph, Divider, Button, Checkbox, Toggle, Slider, Dropdown, Textbox, ProgressBar, Keybind, ColorPicker, **Search**
- ⚡ **Notifications & Prompts** - Built-in user feedback system
- 🌈 **Custom Themes** - Create your own themes with 13 color properties
- 🌈 **Rainbow Mode** - Animated rainbow borders and effects
- 🔑 **Flag System** - Easy access to component values
- 📋 **Clipboard Support** - Works across all executors
- ⚙️ **Auto-Detection** - Automatically detects and adapts to your executor
- 🖼️ **Enhanced Icons** - Emoji and image icons for Window & Tabs
- ✅ **Checkboxes** - Simple toggle controls
- 📑 **SubTabs** - Organize content with tabs within tabs (ALL 14 components supported)
- 📦 **GroupBoxes** - Group UI elements together (ALL 14 components supported)
- 📏 **Spacing Control** - Add custom spacing between elements
- ➡️ **In-line Layout** - Place elements side-by-side
- 🔄 **Nested GroupBoxes** - GroupBox inside GroupBox support
- 🔍 **Advanced Search** - Real-time search with history and highlighting
- 🔲 **Minimize Modes** - "collapse" or "shrink" window minimize options

---

## 📦 Installation

```lua
local Zonix = loadstring(game:HttpGet("https://hub.zon.su/zonix-ui.lua"))()
```

**Alternative GitHub Path:**
```lua
local Zonix = loadstring(game:HttpGet("https://raw.githubusercontent.com/Zontrz/zonix-ui/refs/heads/main/main.lua"))()
```

**File Location:** https://hub.zon.su/zonix-ui.lua  
**GitHub:** https://raw.githubusercontent.com/Zontrz/zonix-ui/refs/heads/main/main.lua  
**Documentation:** https://zon.su/zonix

---

## 🚀 Quick Start

```lua
-- Load the library
local Zonix = loadstring(game:HttpGet("https://hub.zon.su/zonix-ui.lua"))()

-- Create a window with emoji icon
local Window = Zonix:Window({
    Name = "My Script Hub",
    Icon = {
        Type = "emoji",  -- or "image"
        Value = "🔥"     -- emoji or rbxassetid
    }
})

-- Create a tab with icon
local Tab = Window:Tab({
    Name = "Main",
    Icon = {
        Type = "emoji",
        Value = "🏠"
    }
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
  - [Checkbox](#checkbox-new)
  - [Slider](#slider)
  - [Dropdown](#dropdown)
  - [Textbox](#textbox)
  - [Keybind](#keybind)
  - [ColorPicker](#colorpicker)
  - [Search](#search-new-in-v140)
  - [CopyButton](#copybutton)
  - [ProgressBar](#progressbar)
  - [Spacing](#spacing-new)
  - [GroupBox](#groupbox-new)
  - [SubTab](#subtab-new)
  - [In-line Layout](#in-line-layout-new)
- [Flag System](#-flag-system)
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
    Name = "My Script Name",  -- Window title (optional, default: "Zonix UI")
    Icon = {                  -- Window icon (optional)
        Type = "emoji",       -- "emoji" or "image"
        Value = "🔥"          -- emoji character or rbxassetid
    },
    MinimizeMode = "collapse" -- Minimize behavior (optional, default: "collapse")
                              -- Options: "collapse" (bar only) or "shrink" (small square)
})
```

**Parameters:**
- `Name` (string, optional) - The window title (default: "Zonix UI")
- `Icon` (table, optional) - Window icon configuration
  - `Type` (string) - Icon type: `"emoji"` (text/emoji) or `"image"` (rbxassetid)
  - `Value` (string) - Icon value: emoji character (e.g., "🔥") or asset ID (e.g., "rbxassetid://12345")
- `MinimizeMode` (string, optional) - Minimize behavior (default: "collapse")
  - `"collapse"` - Collapses window to topbar only (traditional minimize)
  - `"shrink"` - Shrinks window to small 100x100 square (compact minimize)

**Window Features:**
- Draggable by clicking and holding the top bar
- Minimize button (_) - Collapses window based on MinimizeMode setting
  - **Collapse Mode**: Shrinks to topbar only (traditional)
  - **Shrink Mode**: Minimizes to small 100x100 square
- Close button (×) - Destroys the window completely
- Smooth animations for all interactions
- Automatic shadow and glow effects
- Emoji or image icon support (28x28 pixels, centered vertically)

**Icon Examples:**
```lua
-- Emoji icon with collapse minimize
local Window = Zonix:Window({
    Name = "Cool Script",
    Icon = {
        Type = "emoji",
        Value = "⚡"
    },
    MinimizeMode = "collapse"
})

-- Image icon with shrink minimize
local Window = Zonix:Window({
    Name = "Premium Script",
    Icon = {
        Type = "image",
        Value = "rbxassetid://90642687165275"
    },
    MinimizeMode = "shrink"
})
```

### Creating Tabs

```lua
local Tab = Window:Tab({
    Name = "Tab Name",  -- Tab name (optional, default: "Tab")
    Icon = {            -- Tab icon (optional)
        Type = "emoji", -- "emoji" or "image"
        Value = "🏠"    -- emoji or rbxassetid
    }
})
```

**Tab Parameters:**
- `Name` (string, optional) - Tab display name (default: "Tab")
- `Icon` (table, optional) - Tab icon configuration (default: "📄" emoji)
  - `Type` (string) - Icon type: `"emoji"` (text/emoji) or `"image"` (rbxassetid)
  - `Value` (string) - Icon value: emoji character (e.g., "🏠") or asset ID (e.g., "rbxassetid://12345")

**Tab Features:**
- Click to switch between tabs
- First tab is automatically selected
- Smooth color transitions on selection
- Scrollable content area
- Hover effects for inactive tabs
- Emoji or image icon support

**Tab Icon Examples:**
```lua
-- Emoji icons
local HomeTab = Window:Tab({
    Name = "Home",
    Icon = { Type = "emoji", Value = "🏠" }
})

local SettingsTab = Window:Tab({
    Name = "Settings",
    Icon = { Type = "emoji", Value = "⚙️" }
})

-- Image icon
local PremiumTab = Window:Tab({
    Name = "Premium",
    Icon = { Type = "image", Value = "rbxassetid://12345" }
})
```

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

Advanced color picker with multiple color space support (RGB, HSV, HSL, CMYK, HEX).

```lua
local MyColor = Tab:ColorPicker({
    Name = "Theme Color",                      -- ColorPicker name (required)
    Default = Color3.fromRGB(138, 43, 226),   -- Starting color (optional, default: white)
    Flag = "ThemeColor",                       -- Flag name (optional)
    Callback = function(color)                 -- Function called on color change (optional)
        print("Color changed to:", color)
    end
})

-- Methods
MyColor:Set(Color3.fromRGB(255, 0, 0))        -- Update color
local color = Zonix.Flags.ThemeColor         -- Access current value via flag
```

**Features:**
- **Interactive Color Wheel**: Visual HSV color selector with saturation/value gradient
- **Hue Slider**: Full spectrum hue selection bar with draggable cursor
- **Live Preview**: Real-time color preview box showing selected color
- **Multiple Color Formats**:
  - **RGB** (Red, Green, Blue) - Standard RGB values (0-255)
  - **HSV** (Hue, Saturation, Value) - Hue in degrees (0-360°), S/V in percentages
  - **HSL** (Hue, Saturation, Lightness) - Alternative color representation
  - **CMYK** (Cyan, Magenta, Yellow, Key/Black) - Print color model in percentages
  - **HEX** - Hexadecimal color code (e.g., #8A2BE2)
- **Copy to Clipboard**: Built-in button to instantly copy HEX color codes
- **Modal Interface**: Full-screen overlay with clean, professional design
- **Smooth Interactions**: Drag-to-select color with visual feedback and indicators

**Usage Example:**
```lua
local BgColor = Tab:ColorPicker({
    Name = "Background Color",
    Default = Color3.fromRGB(15, 15, 20),
    Flag = "BgColor",
    Callback = function(color)
        game.Lighting.Ambient = color
    end
})

-- Later, update the color programmatically
BgColor:Set(Color3.fromRGB(25, 25, 35))
```

**Methods:**
- `:Set(color)` - Set color (expects Color3)

---

### Search

Advanced search component with **6 search modes**, fuzzy matching, intelligent ranking, custom search targets, and extensive customization.

```lua
local MySearch = Tab:Search({
    Placeholder = "Search UI elements...",    -- Placeholder text (optional)
    DefaultMode = "contains",                 -- Default search mode (optional)
    ShowModeSelector = true,                  -- Show mode dropdown (optional, default: true)
    LiveSearch = true,                        -- Search as you type (optional, default: true)
    CaseSensitive = false,                    -- Case-sensitive search (optional, default: false)
    SaveHistory = true,                       -- Save search history (optional, default: true)
    MaxHistorySize = 10,                      -- Max history items (optional, default: 10)
    ShowResultCount = true,                   -- Show result count (optional, default: true)
    ClearButton = true,                       -- Show clear button (optional, default: true)
    SearchDelay = 0.3,                        -- Debounce delay in seconds (optional, default: 0.3)
    HighlightColor = Color3.fromRGB(88, 101, 242), -- Result highlight color (optional)
    FuzzyThreshold = 0.6,                     -- Fuzzy match threshold 0-1 (optional, default: 0.6)
    MaxResults = 100,                         -- Max results to show (optional, default: 100)
    SearchInTags = true,                      -- Search in element tags (optional, default: true)
    HideNonMatching = false,                  -- Hide non-matching elements (optional, default: false)
    Position = "order",                       -- Search bar position (optional, default: "order")
                                              -- Options: "top", "bottom", "order"
    CustomSearch = nil,                       -- Custom search function (optional)
    Callback = function(query, results, search)  -- 'search' parameter added
        print("Search query:", query)
        print("Found", #results, "results")
        print("Current mode:", search:GetMode())
    end
})
```

**Search Modes:**
1. **🔍 Contains** - Finds text anywhere in element (default, fast)
2. **🎯 Exact** - Exact text match only (most precise)
3. **▶️ Starts With** - Matches text at the beginning
4. **◀️ Ends With** - Matches text at the end
5. **✨ Fuzzy** - Approximate matching using Levenshtein distance (typo-tolerant)
6. **🔧 Regex** - Pattern matching with regular expressions (most powerful)

**Advanced Features:**
- 🎯 **Intelligent Ranking**: Results scored and sorted by relevance
- 🎨 **Score-Based Highlighting**: Better matches = brighter, longer-lasting highlights
- 🏷️ **Tag System**: Search and boost results by custom element tags
- 🎛️ **Visual Mode Selector**: Dropdown to easily switch between search modes
- ⚡ **Performance Optimized**: Configurable max results and fuzzy threshold
- 📊 **Result Counter**: Live count with search mode indicator
- 👁️ **Hide Non-Matching**: Only show matching elements (focus mode)
- 📍 **Flexible Positioning**: Place search bar at top, bottom, or in order
- 🔧 **Custom Search**: Search workspace, players, or any custom data

**Methods:**
- `:Clear()` - Clear search text and results
- `:ClearHistory()` - Clear search history
- `:SetText(text)` - Set search text programmatically
- `:Focus()` - Focus the search input
- `:GetResults()` - Get current search results array
- `:SetMode(mode)` - Change search mode ("exact", "contains", "startswith", "endswith", "fuzzy", "regex")
- `:GetMode()` - Get current search mode
- `:AddElementTag(elementName, tag)` - Add searchable tag to an element

**Properties:**
- `.Value` - Current search query string
- `.Results` - Array of matching elements (sorted by score)
- `.History` - Array of search history items
- `.Searching` - Boolean indicating if search is in progress
- `.CurrentMode` - Current search mode

**Example 1: Basic Search with Positioning**
```lua
-- Create search that appears at the top
local Search = Tab:Search({
    Placeholder = "Search components...",
    Position = "top",  -- Force to top of tab
    DefaultMode = "contains"
})

-- Add your components below - they'll still be searchable!
Tab:Button({ Name = "Click Me" })
Tab:Toggle({ Name = "Enable Feature" })
Tab:Slider({ Name = "Speed" })
```

**Example 2: Hide Non-Matching Elements (Focus Mode)**
```lua
-- When searching, hide all elements that don't match
local Search = Tab:Search({
    Placeholder = "Search to filter...",
    Position = "top",
    HideNonMatching = true,  -- Only show matching elements!
    Callback = function(query, results)
        if #results > 0 then
            print("Showing", #results, "matching elements")
        else
            print("No matches - showing all elements")
        end
    end
})

Tab:Section("Player")
Tab:Slider({ Name = "Walk Speed" })
Tab:Slider({ Name = "Jump Power" })

Tab:Section("ESP")
Tab:Toggle({ Name = "ESP Enabled" })
Tab:ColorPicker({ Name = "ESP Color" })

-- Searching "speed" will show ONLY Walk Speed and Jump Power!
```

**Example 3: Search Workspace Parts**
```lua
-- Search for parts in workspace instead of UI elements
local PartSearch = Tab:Search({
    Placeholder = "Search workspace parts...",
    Position = "top",
    CustomSearch = function(query, mode)
        local results = {}
        local searchQuery = query:lower()
        
        -- Search all parts in workspace by name
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                local name = part.Name:lower()
                
                if name:find(searchQuery, 1, true) then
                    table.insert(results, {
                        Name = part.Name,
                        Object = part,        -- Store the actual part
                        Position = part.Position,
                        Score = 1
                    })
                end
            end
        end
        
        return results
    end,
    Callback = function(query, results)
        print("Found", #results, "parts")
        for _, result in ipairs(results) do
            print("Part:", result.Name, "at", result.Position)
        end
    end
})
```

**Example 4: Search Players**
```lua
-- Search for players in the game
local PlayerSearch = Tab:Search({
    Placeholder = "Search players...",
    Position = "top",
    CustomSearch = function(query, mode)
        local results = {}
        local searchQuery = query:lower()
        
        for _, player in pairs(game.Players:GetPlayers()) do
            local name = player.Name:lower()
            local displayName = player.DisplayName:lower()
            
            if name:find(searchQuery, 1, true) or 
               displayName:find(searchQuery, 1, true) then
                table.insert(results, {
                    Name = player.Name,
                    DisplayName = player.DisplayName,
                    Player = player,
                    Score = 1
                })
            end
        end
        
        return results
    end,
    Callback = function(query, results)
        if #results > 0 then
            print("Found players:")
            for _, result in ipairs(results) do
                print("- " .. result.Name .. " (" .. result.DisplayName .. ")")
            end
        end
    end
})
```

**Example 5: Universal Search (Workspace + Players)**
```lua
local UniversalSearch = Tab:Search({
    Placeholder = "Search everything...",
    Position = "top",
    CustomSearch = function(query, mode)
        local results = {}
        local searchQuery = query:lower()
        
        -- Search workspace parts
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and part.Name:lower():find(searchQuery, 1, true) then
                table.insert(results, {
                    Name = part.Name,
                    Type = "Part",
                    Object = part,
                    Position = part.Position,
                    Score = 1
                })
            end
        end
        
        -- Search players
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Name:lower():find(searchQuery, 1, true) then
                table.insert(results, {
                    Name = player.Name,
                    Type = "Player",
                    Object = player,
                    Score = 1
                })
            end
        end
        
        return results
    end,
    Callback = function(query, results)
        for _, result in ipairs(results) do
            if result.Type == "Part" then
                print("Part:", result.Name, "at", result.Position)
            else
                print("Player:", result.Name)
            end
        end
    end
})
```

**Example 6: Using Search Modes**
```lua
local Search = Tab:Search({
    Placeholder = "Search components...",
    DefaultMode = "fuzzy",  -- Start with fuzzy search
    FuzzyThreshold = 0.7,   -- 70% similarity required
    Callback = function(query, results, search)
        print(string.format("Mode: %s | Found %d results", search:GetMode(), #results))
    end
})

-- Switch to exact match
Search:SetMode("exact")

-- Switch to fuzzy for typo tolerance
Search:SetMode("fuzzy")

-- Search with regex pattern
Search:SetMode("regex")
Search:SetText("^Toggle.*")  -- Find elements starting with "Toggle"
```

**Example 7: Using Tags**
```lua
local Search = Tab:Search({
    Placeholder = "Search by tags...",
    SearchInTags = true,
    Position = "top"
})

-- Add tags to elements for better searchability
Search:AddElementTag("Speed Slider", "movement")
Search:AddElementTag("Speed Slider", "player")
Search:AddElementTag("Jump Power", "movement")
Search:AddElementTag("ESP Toggle", "visual")

-- Now searching "movement" will find both Speed Slider and Jump Power
-- with "Speed Slider" ranked higher due to name + tag match
```

**Example 8: Fuzzy Search**
```lua
-- Fuzzy search is great for typos and approximate matches
local FuzzySearch = Tab:Search({
    DefaultMode = "fuzzy",
    FuzzyThreshold = 0.6,  -- 60% similarity (lower = more lenient)
    Position = "top",
    Callback = function(query, results)
        -- "togle" will match "toggle"
        -- "sped" will match "speed"
        -- "colr" will match "color"
        print("Fuzzy found:", #results, "matches")
    end
})
```

**Position Options:**
- `"top"` - Search bar appears at the very top (regardless of when created)
- `"bottom"` - Search bar appears at the very bottom (regardless of when created)
- `"order"` - Search bar appears where you create it in code (default)

**CustomSearch Function Format:**
```lua
CustomSearch = function(query, mode)
    -- query: The search text entered by user
    -- mode: Current search mode ("contains", "fuzzy", etc.)
    
    -- Return array of results
    return {
        {
            Name = "Result 1",         -- Required: Display name
            Score = 1,                 -- Optional: Relevance score (default 1)
            -- Add any custom properties you want:
            Object = workspace.Part,
            Position = Vector3.new(),
            CustomData = "anything"
        }
    }
end
```

**Important Notes:**
- When using `CustomSearch`, the `HideNonMatching` feature is disabled (custom results don't have UI frames)
- The callback now receives 3 parameters: `query`, `results`, and `search` object
- Search can be created before or after elements when using `Position = "top"` or `Position = "bottom"`
- All 14 UI components are automatically searchable by their Name property

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

### Checkbox *(NEW!)*

Simple checkbox toggle control.

```lua
local MyCheckbox = Tab:Checkbox({
    Name = "Enable Auto-Farm",            -- Checkbox label (required)
    Default = false,                      -- Starting state (optional, default: false)
    Flag = "AutoFarm",                    -- Flag name (optional)
    Callback = function(checked)          -- Function called on toggle (optional)
        print("Checkbox is:", checked)
    end
})

-- Methods
MyCheckbox:Set(true)                      -- Update checkbox state
local isChecked = Zonix.Flags.AutoFarm   -- Access current value via flag
```

**Methods:**
- `:Set(value)` - Set checkbox state (true/false)

**Note:** Checkboxes are similar to toggles but with a different visual style. Use checkboxes for simple on/off options within groups.

---

### Spacing *(NEW!)*

Add custom vertical spacing between components.

```lua
Tab:AddSpacing(10)                        -- Add 10 pixels of spacing
Tab:AddSpacing(20)                        -- Add 20 pixels of spacing
```

**Use Cases:**
- Separate different sections visually
- Add breathing room between dense UI elements
- Create visual hierarchy in your interface

---

### GroupBox *(NEW!)*

Group related UI elements together with a labeled container.

```lua
local FarmGroup = Tab:GroupBox({
    Name = "Farming Options",             -- GroupBox title (required)
    Inline = false                        -- Use inline layout (optional, default: false)
})

-- Add elements to the GroupBox
FarmGroup:Checkbox({
    Name = "Auto Collect",
    Default = true,
    Callback = function(checked)
        print("Auto collect:", checked)
    end
})

FarmGroup:AddSpacing(5)

FarmGroup:Button({
    Name = "Start Farming",
    Callback = function()
        print("Farming started!")
    end
})
```

**GroupBox Methods:**
- `:Checkbox(config)` - Add a checkbox to the group
- `:Button(config)` - Add a button to the group
- `:AddSpacing(pixels)` - Add spacing within the group

**Inline Option:**
When `Inline = true`, the GroupBox takes up only 48% width, allowing you to place two GroupBoxes side-by-side using the in-line layout system.

---

### SubTab *(NEW!)*

Create tabs within tabs for better organization.

```lua
local MySubTabs = Tab:SubTab({
    Tabs = {"General", "Advanced", "Settings"}  -- SubTab names (required)
})

-- Access individual sub-tabs
local GeneralTab = MySubTabs.Tabs[1]
local AdvancedTab = MySubTabs.Tabs[2]
local SettingsTab = MySubTabs.Tabs[3]

-- Add elements to sub-tabs
GeneralTab:Button({
    Name = "Basic Action",
    Callback = function()
        print("General action!")
    end
})

AdvancedTab:Checkbox({
    Name = "Advanced Feature",
    Default = false
})

SettingsTab:GroupBox({
    Name = "Config"
}):Checkbox({
    Name = "Save on Exit"
})
```

**SubTab Methods:**
Each sub-tab supports:
- `:Button(config)` - Add a button
- `:Checkbox(config)` - Add a checkbox
- `:AddSpacing(pixels)` - Add spacing
- `:GroupBox(config)` - Add a group box

---

### In-line Layout *(NEW!)*

Place elements side-by-side instead of stacking vertically.

```lua
-- Start inline layout
local inline = Tab:StartInline()

-- Add GroupBoxes that will appear side-by-side
local LeftGroup = Tab:GroupBox({
    Name = "Speed Settings",
    Inline = true
})

local RightGroup = Tab:GroupBox({
    Name = "Farming Settings",
    Inline = true
})

-- Stop inline layout
inline.Stop()

-- Elements below this will stack normally again
Tab:Button({
    Name = "Apply Settings"
})
```

**How it Works:**
1. Call `Tab:StartInline()` to begin horizontal layout
2. Add GroupBoxes with `Inline = true` (they'll appear side-by-side)
3. Call `inline.Stop()` to return to normal vertical stacking

**Best Practices:**
- Use inline layout for grouping related controls (e.g., Speed section next to Farming section)
- Limit to 2 inline groups for optimal mobile compatibility
- Always call `.Stop()` to prevent layout issues

---

## 🔑 Flag System

The flag system allows you to easily access and monitor component values without storing references. Set a `Flag` parameter on any interactive component, and access its current value via `Zonix.Flags`.

### Components Supporting Flags

| Component | Flag Access | Value Type |
|-----------|-------------|------------|
| Button | `Zonix.Flags.YourFlag` | `true` (when clicked) |
| Checkbox | `Zonix.Flags.YourFlag` | `boolean` |
| Toggle | `Zonix.Flags.YourFlag` | `boolean` |
| Slider | `Zonix.Flags.YourFlag` | `number` |
| Dropdown | `Zonix.Flags.YourFlag` | `string` |
| Textbox | `Zonix.Flags.YourFlag` | `string` |
| Keybind | `Zonix.Flags.YourFlag` | `Enum.KeyCode` |
| ColorPicker | `Zonix.Flags.YourFlag` | `Color3` |

### Example Usage

```lua
-- Setting flags on components
Tab:Toggle({
    Name = "Auto Farm",
    Flag = "AutoFarm",
    Default = false
})

Tab:Slider({
    Name = "Speed",
    Flag = "Speed",
    Min = 0,
    Max = 100,
    Default = 50
})

Tab:Dropdown({
    Name = "Mode",
    Flag = "GameMode",
    Options = {"Easy", "Normal", "Hard"},
    Default = "Normal"
})

Tab:Textbox({
    Name = "Username",
    Flag = "Username",
    Default = ""
})

Tab:Checkbox({
    Name = "Enable ESP",
    Flag = "ESP",
    Default = true
})

Tab:Keybind({
    Name = "Toggle UI",
    Flag = "UIKeybind",
    Default = Enum.KeyCode.RightShift
})

Tab:ColorPicker({
    Name = "ESP Color",
    Flag = "ESPColor",
    Default = Color3.fromRGB(255, 0, 0)
})

-- Accessing flag values
while task.wait(0.1) do
    if Zonix.Flags.AutoFarm then
        local speed = Zonix.Flags.Speed
        local mode = Zonix.Flags.GameMode
        local username = Zonix.Flags.Username
        local espEnabled = Zonix.Flags.ESP
        local espColor = Zonix.Flags.ESPColor
        
        print("Farming at speed:", speed, "in mode:", mode)
    end
end

-- Check keybind
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Zonix.Flags.UIKeybind then
        print("UI keybind pressed!")
    end
end)
```

### Flag Best Practices

✅ **DO:**
- Use descriptive flag names (e.g., `"PlayerSpeed"` not `"s"`)
- Check if flag exists before accessing: `if Zonix.Flags.MyFlag then`
- Use flags in loops for real-time value monitoring
- Set flags on all interactive components for easy config save/load

❌ **DON'T:**
- Use special characters in flag names
- Reuse flag names across different components
- Modify `Zonix.Flags` directly (use component `:Set()` methods)

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

### Example 5: New v1.3 Features Showcase

```lua
local Zonix = loadstring(game:HttpGet("https://hub.zon.su/zonix-ui.lua"))()
local Window = Zonix:Window({ Name = "v1.3 Features", Icon = "rbxassetid://90642687165275" })
local Tab = Window:Tab({ Name = "New Features", Icon = "✨" })

-- Checkboxes
Tab:Section("Checkboxes")
Tab:Checkbox({
    Name = "Auto Farm",
    Default = true,
    Flag = "AutoFarm",
    Callback = function(checked)
        print("Auto Farm:", checked)
    end
})

Tab:Checkbox({
    Name = "Auto Collect",
    Default = false,
    Flag = "AutoCollect"
})

Tab:AddSpacing(10)  -- Add spacing

-- SubTabs
Tab:Section("SubTabs Example")
local MySubTabs = Tab:SubTab({
    Tabs = {"General", "Advanced", "Settings"}
})

-- General SubTab
MySubTabs.Tabs[1]:Checkbox({
    Name = "Enable Notifications",
    Default = true
})

MySubTabs.Tabs[1]:AddSpacing(5)

MySubTabs.Tabs[1]:Button({
    Name = "Test Button",
    Callback = function()
        Zonix:Notify({
            Title = "SubTab Test",
            Content = "Button in General tab clicked!",
            Type = "Success"
        })
    end
})

-- Advanced SubTab
MySubTabs.Tabs[2]:Checkbox({
    Name = "Debug Mode",
    Default = false
})

-- Settings SubTab
MySubTabs.Tabs[3]:Checkbox({
    Name = "Save on Exit",
    Default = true
})

Tab:AddSpacing(15)

-- In-line Layout with GroupBoxes
Tab:Section("In-line GroupBoxes")
local inline = Tab:StartInline()

local SpeedGroup = Tab:GroupBox({
    Name = "Speed Settings",
    Inline = true
})

SpeedGroup:Checkbox({
    Name = "Speed Enabled",
    Default = false
})

SpeedGroup:AddSpacing(3)

SpeedGroup:Button({
    Name = "Apply Speed",
    Callback = function()
        print("Speed applied!")
    end
})

local FarmGroup = Tab:GroupBox({
    Name = "Farm Settings",
    Inline = true
})

FarmGroup:Checkbox({
    Name = "Auto Farm",
    Default = true
})

FarmGroup:AddSpacing(3)

FarmGroup:Checkbox({
    Name = "Sell Items",
    Default = false
})

inline.Stop()  -- Stop inline layout

Tab:AddSpacing(10)

-- Regular GroupBox (full width)
local MiscGroup = Tab:GroupBox({
    Name = "Miscellaneous"
})

MiscGroup:Checkbox({
    Name = "Anti-AFK",
    Default = true
})

MiscGroup:AddSpacing(5)

MiscGroup:Button({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
})
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
