-- Binds for quick app launch
hl.bind(MainMod .. " + RETURN", hl.dsp.exec_cmd(Terminal))
hl.bind(MainMod .. " + SPACE", hl.dsp.exec_cmd(Menu))
hl.bind(MainMod .. " + E", hl.dsp.exec_cmd(FileManager))
hl.bind(MainMod .. " + B", hl.dsp.exec_cmd(Browser))

-- TODO: DoBeDOBeDO
-- hl.bind(
-- 	MainMod .. " + V",
-- 	hl.dsp.exec_cmd("cliphist list | wofi --dmenu --pre-display-cmd 'echo '%s' | cut -f 2' | cliphist decode | wl-copy")
-- )
--
hl.bind(MainMod .. "+ Q", hl.dsp.window.close())
hl.bind(MainMod .. "+ SHIFT + Q", hl.dsp.window.kill())
hl.bind(MainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(MainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized" }))

-- TOGGLEFLOATING AND BELOW
