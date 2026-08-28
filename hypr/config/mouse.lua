hl.config({
	input = {
		-- Follow mouse but do not change keyboard focus
		follow_mouse = 2,
		float_switch_override_focus = 2,

		touchpad = {
			-- Map click+drag to a three finger drag.
			drag_3fg = 1,
		},
	},
})

-- Cycle through workspace on 4 finger drag.
hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
