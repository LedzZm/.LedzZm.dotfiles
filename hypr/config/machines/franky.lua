-- vrr: Variable refresh rate sends less frames when not needed (Idle state or staring at the same thing). If supported by the monitor it is always good (well... unless glitching). Check if supported using `hyprctl systeminfo`
-- bitdepth: Will smoothen out darker gradients. Maaaaaybe will make a small difference in HDR gaming. Not power hungry so if supported go ahead and use it.
--
--
-- TODO: Handle HDR?
-- TODO: Any other settings need handling?
hl.monitor({
	output = "desc:Dell Inc. DELL S2721DS 3WTDQ43",
	mode = "highres",
	position = "0x0",
	scale = 1,
})
hl.monitor({
	output = "desc:HP Inc. OMEN 27q CNC3361KCJ",
	mode = "highres",
	position = "2560x0",
	scale = 1,
	vrr = 1,
	bitdepth = 10,
	-- cm = "wide",
})
