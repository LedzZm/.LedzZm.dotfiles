-- # TODO: - Will need handling afer idle inhibitor setup
-- #bindl = , switch:on:Lid Switch, exec, hyprctl keyword monitor "eDP-1, disable"
-- #bindl = , switch:off:Lid Switch, exec, hyprctl keyword monitor "eDP-1, preferred, auto, 1.5"
-- #TODO: - Clean up
--
-- Trigger when the switch is toggled.
-- hl.bind("switch:Lid Switch", hl.dsp.exec_cmd("swaylock"), { locked = true })
-- Trigger when the switch is turning on.
hl.bind("switch:on:Lid Switch", function()
	hl.monitor({ output = "eDP-1", disabled = true })
end)

hl.bind("switch:off:Lid Switch", function()
	hl.monitor({ output = "eDP-1", disabled = false })
end)
