-- TODO: Needs QA
local function matchGame(matchRule)
	hl.window_rule({
		match = matchRule,
		content = "game",
		workspace = "9 silent",
		-- suppress_event = "activatefocus activate",
		-- fullscreen = true,
		border_size = 0,
	})
end
matchGame({ class = "(gamescope|steam_app.*)" })
matchGame({ xdg_tag = "proton-game" })

hl.window_rule({ match = { content = "game", fullscreen = true }, confine_pointer = true })
