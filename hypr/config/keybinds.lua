-- Binds for quick app launch
-- TODO: Do those need to be executed with uwsm???
hl.bind(MainMod .. " + RETURN", hl.dsp.exec_cmd(Terminal))
hl.bind(MainMod .. " + SPACE", hl.dsp.exec_cmd(Menu))
hl.bind(MainMod .. " + E", hl.dsp.exec_cmd(FileManager))
hl.bind(MainMod .. " + B", hl.dsp.exec_cmd(Browser))
hl.bind(MainMod .. " + X", hl.dsp.exec_cmd("1password"))

-- Shortcut for using the clipboard manager app
hl.bind(
	MainMod .. " + V",
	hl.dsp.exec_cmd(
		[[cliphist list | wofi --dmenu --pre-display-cmd "echo '%s' | cut -f 2" | cliphist decode | wl-copy]]
	)
)

-- Basic Window Management
hl.bind(MainMod .. "+ Q", hl.dsp.window.close())
hl.bind(MainMod .. "+ SHIFT + Q", hl.dsp.window.kill())
hl.bind(MainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(MainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(MainMod .. " + P", hl.dsp.window.float())

-- Group Window Management
hl.bind(MainMod .. " + G", hl.dsp.group.toggle())
hl.bind(MainMod .. " + mouse:274", hl.dsp.window.move({ out_of_group = "right" }))
hl.bind(MainMod .. " + SHIFT + G", hl.dsp.window.move({ out_of_group = "right" }))
hl.bind(MainMod .. " + TAB", hl.dsp.group.next())
hl.bind(MainMod .. " + SHIFT + TAB", hl.dsp.group.prev())

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(MainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(MainMod .. " + mouse:273", hl.dsp.window.resize())

-- Move focus with mainMod + vim motions
hl.bind(MainMod .. " + J", hl.dsp.focus({ direction = "up" }))
hl.bind(MainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(MainMod .. " + K", hl.dsp.focus({ direction = "down" }))
hl.bind(MainMod .. " + H", hl.dsp.focus({ direction = "left" }))

-- Move window towards a direction
hl.bind(MainMod .. "+ SHIFT + J", hl.dsp.window.move({ direction = "up" }))
hl.bind(MainMod .. "+ SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(MainMod .. "+ SHIFT + K", hl.dsp.window.move({ direction = "down" }))
hl.bind(MainMod .. "+ SHIFT + H", hl.dsp.window.move({ direction = "left" }))

-- Volume up/down with long press
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
-- Allow mute/unmute even when screen is locked
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

-- Requires playerctl (Usable even when screen is locked)
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

-- Bind brightness keys
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"))
