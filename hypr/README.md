# Hyprland
No manual actions are really needed besides ensuring that `user-conf.lua` requires the correct machine config (optional).

## Directory & File Structure

`~/$XDG_CONFIG_HOME/hypr/`

```
├── hyprland.lua               # Main entry point & general settings
├── user-config.lua            # User-specific configuration and overrides
├── laptop.lua                 # Laptop utilities like lid switch handling & monitor toggling
├── hyprpaper.conf             # Wallpaper daemon configuration
├── config/                    # Core configuration modules
│   ├── autostart.lua          # Autostart services and background daemons
│   ├── animations.lua         # Well... animations... duh
│   ├── decorations.lua        # Window borders, rounding, blur, groupbar styling and other eye candy
│   ├── gaming.lua             # Gaming utilities, and window rules
│   ├── hypr-core-legacy.lua   # Core window rules (suppress maximize, XWayland drag fix)
│   ├── keyboard.lua           # Keyboard layouts and switching rules
│   ├── keybinds.lua           # Global keybindings, media controls, and window actions
│   ├── mouse.lua              # Mouse focus behaviors and touchpad gestures
│   ├── windowrules.lua        # General floating, centering, and sizing rules
│   ├── workspaces.lua         # Workspace keybinds and special workspaces
│   ├── apps/                  # Application-specific configurations
│   │   ├── jetbrains.lua      # JetBrains IDE window rules & border sizing
│   │   ├── steam.lua          # Steam window rules (floating Friends List)
│   │   └── waybar.lua         # Dual Waybar instances & submap controls
│   └── machines/              # Host-specific monitor setups
│       ├── franky.lua         # Dual-monitor setup with VRR and 10-bit color depth
│       └── merrygo.lua        # Portable monitor configuration template
└── utils/                     # Utility helpers and tools
    ├── cursor-zoom.lua        # Dynamic cursor magnifier zoom toggle
    └── screen-capture.lua     # Hyprshot directory environment and screenshot helpers
```

## Keybinds
Complete List of Keybinds (By File)

### Core System, Apps & Navigation
File: [config/keybinds.lua](config/keybinds.lua)

#### Application Shortcuts
| Keybind | Description |
|---|---|
| SUPER + RETURN | Launch default terminal |
| SUPER + SPACE | Open application launcher |
| SUPER + E | Open graphical file manager |
| SUPER + B | Open default web browser |
| SUPER + X | Launch 1Password password manager |
| CONTROL + SHIFT + Escape | Launch system monitor in terminal |
| SUPER + V | Open clipboard manager picker |

#### Window Management & Layout
| Keybind | Description |
|---|---|
| SUPER + Q | Close focused window |
| SUPER + SHIFT + Q | Force kill active window process |
| SUPER + F | Toggle fullscreen mode |
| SUPER + M | Toggle maximized window state |
| SUPER + P | Toggle floating state for active window |

#### Window Focus & Window Movement (Vim Navigation)
| Keybind | Description |
|---|---|
| SUPER + H | Move focus left |
| SUPER + J | Move focus up |
| SUPER + K | Move focus down |
| SUPER + L | Move focus right |
| SUPER + SHIFT + H | Move active window left |
| SUPER + SHIFT + J | Move active window up |
| SUPER + SHIFT + K | Move active window down |
| SUPER + SHIFT + L | Move active window right |
| ALT + TAB | Cycle focus forward through windows |
| ALT + SHIFT + TAB | Cycle focus backward through windows |

#### Window Grouping / Tabs
| Keybind | Description |
|---|---|
| SUPER + G | Toggle window tabbed group |
| SUPER + SHIFT + G | Move window out of group to the right |
| SUPER + mouse:274 | Move window out of group using Middle Click |
| SUPER + TAB | Switch to next window in group |
| SUPER + SHIFT + TAB | Switch to previous window in group |

#### Mouse Window Controls
| Keybind | Description |
|---|---|
| SUPER + mouse:272 (LMB Drag) | Move / drag window |
| SUPER + mouse:273 (RMB Drag) | Resize window |

#### Media & Hardware Controls
| Keybind | Description |
|---|---|
| XF86AudioRaiseVolume | Step audio volume up by 5% (repeating) |
| XF86AudioLowerVolume | Step audio volume down by 5% (repeating) |
| XF86AudioMute | Toggle audio mute (works while locked) |
| XF86AudioPlay | Play / pause media (works while locked) |
| XF86AudioPrev | Previous media track (works while locked) |
| XF86AudioNext | Next media track (works while locked) |
| XF86MonBrightnessUp | Step brightness up by 5% |
| XF86MonBrightnessDown | Step brightness down by 5% |

### Workspace Navigation & Special Workspaces
File: [config/workspaces.lua](config/workspaces.lua)

| Keybind | Description |
|---|---|
| SUPER + [1-9] | Switch to workspace 1–9 |
| SUPER + 0 | Switch to workspace 10 |
| SUPER + SHIFT + [1-9] | Move window to workspace 1–9 and follow focus |
| SUPER + SHIFT + 0 | Move window to workspace 10 and follow focus |
| SUPER + CONTROL + [1-9] | Move window to workspace 1–9 silently |
| SUPER + CONTROL + 0 | Move window to workspace 10 silently |
| SUPER + Right | Move to next workspace |
| SUPER + mouse_up | Move to next workspace via scroll up |
| SUPER + Left | Move to previous workspace |
| SUPER + mouse_down | Move to previous workspace via scroll down |
| SUPER + C | Toggle dropdown terminal scratchpad |
| SUPER + SHIFT + C | Move window to console scratchpad |
| SUPER + CONTROL + C | Move window to console silently |
| SUPER + O | Toggle Obsidian notes scratchpad |
| SUPER + SHIFT + O | Move window to obsidian scratchpad |
| SUPER + CONTROL + O | Move window to obsidian silently |

### Waybar Submap
File: [config/apps/waybar.lua](config/apps/waybar.lua)

| Keybind | Description |
|---|---|
| SUPER + W | Activates the waybar_toggle modal submap |
| T | Toggle top Waybar instance visibility |
| B | Toggle bottom Waybar instance visibility |
| Escape | Exit submap back to global keybindings |

### Magnifier Tool
File: [utils/cursor-zoom.lua](utils/cursor-zoom.lua)

| Keybind | Description |
|---|---|
| SUPER + Z | Toggle cursor zoom magnifier |

### Laptop configuration
File: [laptop.lua](laptop.lua)

| Keybind | Description |
|---|---|
| switch:on:Lid Switch | Disables laptop screen (eDP-1) |
| switch:off:Lid Switch | Enables laptop screen (eDP-1) |
| 4 finger drag (Horizontal) | Cycle workspaces |

### Keyboard Layout Switching
File: [config/keyboard.lua](config/keyboard.lua)

| Keybind | Description |
|---|---|
| Alt + Shift | Toggle active keyboard layout between selected languages |

### Screenshot Utilities
File: [utils/screen-capture.lua](utils/screen-capture.lua)

| Keybind | Description |
|---|---|
| Print | Hyprshot capture entire output and edit with swappy |
| SUPER + Print | Hyprshot capture active window and edit with swappy |
| SHIFT + Print | Hyprshot capture selected region and edit with swappy |
