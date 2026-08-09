for key = 1, 9 do
	-- Switch workspaces with MainMod + [1-9]
	hl.bind(MainMod .. " + " .. key, hl.dsp.focus({ workspace = key }))
	-- Move active window to a workspace and follow
	hl.bind(MainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = key }))
	-- Move active window to a workspace without swiching focus
	hl.bind(MainMod .. " + CONTROL + " .. key, hl.dsp.window.move({ workspace = key, follow = false }))
end

-- Cycle through workspaces
hl.bind(MainMod .. " + right", hl.dsp.focus({ workspace = "+1" }))
hl.bind(MainMod .. " + mouse_up", hl.dsp.focus({ workspace = "+1" }))
hl.bind(MainMod .. " + left", hl.dsp.focus({ workspace = "-1" }))
hl.bind(MainMod .. " + mouse_down", hl.dsp.focus({ workspace = "-1" }))

-- Special workspaces
hl.config({ binds = { hide_special_on_workspace_change = true } })

local specialWorkspaces = {
	["C"] = "console",
	["O"] = "obsidian",
}
for key, workspaceName in pairs(specialWorkspaces) do
	-- Bind toggle and move to workspace
	hl.bind(MainMod .. " + " .. key, hl.dsp.workspace.toggle_special(workspaceName))
	hl.bind(MainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = "special:" .. workspaceName }))
	hl.bind(MainMod .. " + CONTROL + " .. key, hl.dsp.window.move({ workspace = workspaceName, follow = false }))
end
