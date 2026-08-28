-- TODO: Do I need to start those with uwsm?
-- Initialize top and bottom bars separatly to be able to toggle them separatly
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar -c " .. os.getenv("XDG_CONFIG_HOME") .. "/waybar/top.jsonc")
	hl.exec_cmd("waybar -c " .. os.getenv("XDG_CONFIG_HOME") .. "/waybar/bottom.jsonc")
end)

-- Switch to a submap called for toggling waybar bars.
hl.bind(MainMod .. " + W", hl.dsp.submap("waybar_toggle"))
hl.define_submap("waybar_toggle", function()
	hl.bind("T", hl.dsp.exec_cmd('pkill -SIGUSR1 -f "waybar -c .*top.jsonc"'))
	hl.bind("B", hl.dsp.exec_cmd('pkill -SIGUSR1 -f "waybar -c .*bottom.jsonc"'))
	hl.bind("escape", hl.dsp.submap("reset"))
end)
