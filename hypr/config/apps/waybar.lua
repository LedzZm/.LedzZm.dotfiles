hl.on("hyprland.start", function()
	hl.exec_cmd("waybar -c " .. os.getenv("XDG_CONFIG_HOME") .. "/waybar/top.jsonc")
	hl.exec_cmd("waybar -c " .. os.getenv("XDG_CONFIG_HOME") .. "/waybar/bottom.jsonc")
end)
