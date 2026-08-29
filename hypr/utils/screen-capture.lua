-- TODO: Move to UWSM file if I end up keeping UWSM.
hl.env("HYPRSHOT_DIR", os.getenv("HOME") .. "/Pictures/Screenshots")

hl.bind("Print", hl.dsp.exec_raw("hyprshot -m output -r - | swappy -f -"))
-- Screenshot a window
hl.bind(MainMod .. " + Print", hl.dsp.exec_raw("hyprshot -m window -r - | swappy -f -"))
-- Screenshot a region
hl.bind("SHIFT + Print", hl.dsp.exec_raw("hyprshot -m region -r - | swappy -f -"))
