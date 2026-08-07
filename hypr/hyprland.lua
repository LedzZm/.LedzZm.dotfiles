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
require("config/keyboard")
--
-- # Window and layer management.
--
-- #source = ~/.config/hypr/config/windowrules
--
-- Workspaces (Keybinds & rules)
require("config/workspaces")

-- App Configuration
require(os.getenv("XDG_CONFIG_HOME") .. "/hypr/config/apps/*.lua")
-- 	#source = ~/.config/hypr/config/apps/*
--
-- # Config / Feature that are either unstable, OR I am not sure I want / need them.
-- 	#source = ~/.config/hypr/experimental
--
-- # User / Machine specific Configuration
-- --	#source = ~/.config/hypr/config/user-config --
