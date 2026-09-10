MainMod = "SUPER"
Terminal = "ghostty"
FileManager = "thunar"
Browser = "vivaldi"
Menu = "wofi --show drun"

-- Helpful tools
require("utils")
-- Base Hyprland config
require("config")
-- Gaming
-- TODO: decide if this should be optional
-- require("config.gaming")
-- User / Machine specific Configuration
pcall(require, "user-config")

-- General Settings
hl.config({
	general = {
		-- TODO: Needs testing
		-- TODO: @see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/
		-- TODO: Try with some fps game?
		-- TODO: Also check misc { ?vrr } option
		-- TODO: Ask in discord?
		-- TODO: If allow_tearing, direct_scanout and vrr are only gaming related, consider making a gaming.lua config.
		allow_tearing = true,
		resize_on_border = true,
	},

	misc = {
		font_family = "JetBrainsMono Nerd Font Propo",
		disable_hyprland_logo = true,
		enable_swallow = true,
		swallow_regex = "^(com.mitchellh.ghostty)$",
	},

	render = {
		-- Direct scanout attempts to reduce lag when there is only one fullscreen application.
		-- Set to false if the fullscreen apps show graphical glitches.
		-- TODO: Move to gaming config?
		direct_scanout = true,
	},
})

-- TODO: Move to other files - Candidates: swaync.lua | layerrules.lua | notifications.lua
hl.layer_rule({
	match = { namespace = "swaync-control-center" },
	-- TODO:: Try to add bezier to the animation (Ask Discord?).
	animation = "slide right",
	-- TODO: This should also apply to the actual notrification layer as well as the control center
	no_screen_share = true,
})

-- Switch to a submap for lock or powerdown.
-- TODO: Implement correct commands when available
-- TODO: Exist submap on every selection
hl.bind(MainMod .. "+ ESCAPE", hl.dsp.submap("terminate"))
hl.define_submap("terminate", function()
	hl.bind("L", function()
		hl.dispatch(hl.dsp.exec_raw("hyprlock"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)

	hl.bind("U", function()
		hl.dispatch(hl.dsp.exec_raw("hyprctl notify 4 1000 0 SWITCH USER"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)

	hl.bind("P", function()
		hl.dispatch(hl.dsp.exec_raw("hyprctl notify 3 1000 0 POWEROFF"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)

	hl.bind("escape", hl.dsp.submap("reset"))
end)
