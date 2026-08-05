MainMod = "SUPER"
Terminal = "ghostty"
FileManager = "thunar"
Browser = "vivaldi"
Menu = "wofi --show drun"

-- Base Config
require("config/hypr-core-legacy")
require("config/autostart")
-- Eye Candy
require("config/decorations")

-- 	#source = ~/.config/hypr/config/animations
--
-- Input
--
-- #source = ~/.config/hypr/config/mouse
require("config/keybinds")
-- 	#source = ~/.config/hypr/config/keyboard
-- 	#source = ~/.config/hypr/config/keybinds
--
-- # Window and layer management.
--
-- #source = ~/.config/hypr/config/windowrules
--
-- # Workspaces (Keybinds & rules)
--
-- 	#source = ~/.config/hypr/config/workspaces
--
-- # App Configuration
-- 	#source = ~/.config/hypr/config/apps/*
--
-- # Config / Feature that are either unstable, OR I am not sure I want / need them.
-- 	#source = ~/.config/hypr/experimental
--
-- # User / Machine specific Configuration
-- --	#source = ~/.config/hypr/config/user-config --
