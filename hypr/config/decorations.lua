local colors = require(os.getenv("XDG_CONFIG_HOME") .. "/colors/colors")

hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 4,
		border_size = 2,
		col = { active_border = colors.blue },
	},

	decoration = {
		rounding = 8,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		-- TODO: This does not seem to work.
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		-- TODO: This does not seem to work... reevaluate after the other blur setting is in place.
		blur = {
			enabled = true,
			size = 5,
			passes = 3,
			vibrancy = 0.1696,
			xray = true,
		},

		shadow = {
			enabled = false,
		},
	},

	group = {
		col = { border_active = colors.blue },

		groupbar = {
			keep_upper_gap = false,
			gaps_in = 6,
			height = 16,

			indicator_gap = 0,
			indicator_height = 0,
			gradients = true,
			gradient_rounding = 16,
			gradient_rounding_power = 2,
			gradient_round_only_edges = false,

			font_size = 12,
			text_padding = 24,
			font_weight_active = "bold",

			text_color = colors.mauve,
			text_color_inactive = colors.blue,
			col = {
				active = colors.crust,
				inactive = colors.base,
			},
		},
	},
})
