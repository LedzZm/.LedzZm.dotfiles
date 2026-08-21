hl.on("hyprland.start", function()
	-- Register the hyprland polkit agent (GUI password prompt for apps)
	hl.exec_cmd("systemctl --user enable --now hyprpolkitagent.service")
	-- Register clipboard manager.
	hl.exec_cmd("wl-paste --watch cliphist store")
	-- Autostart bluetooth device manager.
	hl.exec_cmd("blueman-applet --no-tray")
	-- Register hyprpaper.
	hl.exec_cmd("systemctl --user enable --now hyprpaper.service")
end)
