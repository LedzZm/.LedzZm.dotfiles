hl.config({
	input = {
		kb_layout = "us, gr",
	},
})
-- Using this instead of kb_options, to allow for more bind flexibility. kb_options will
-- not allow using shift+alt in other keybind combinatins if not configured this way.
hl.bind("ALT + SHIFT + SHIFT_L", hl.dsp.exec_cmd("hyprctl switchxkblayout all next"), { release = true, locked = true })
-- TODO: The following does not work atm, since shift mod mask applies on keydown... keep lookout of changelog that will allow the following to work.
-- hl.bind("ALT + SHIFT_L", hl.dsp.exec_cmd("hyprctl switchxkblayout all next"), { release = true, locked = true })
