local function center_float(identifier, type)
	hl.window_rule({
		match = { [type] = ".*" .. identifier .. ".*" },
		float = true,
		center = true,
	})
end

-- If btop is too small, it will not render data so we give it a minimum.
hl.window_rule({
	match = {
		title = "btop",
	},
	min_size = { 875, 600 },
})

local floatByTytle = {
	"Open",
	"Picture in picture",
	"All Files",
	"Save",
	"btop",
	"Steam - Self Updater",
}

local floatByClass = {
	"blueman-manager",
	"org.pulseaudio.pavucontrol",
	"thunar",
	"org.kde.kcalc",
	"org.cachyos.hello",
}

for index = 1, #floatByTytle do
	center_float(floatByTytle[index], "title")
end

for index = 1, #floatByClass do
	center_float(floatByClass[index], "class")
end
