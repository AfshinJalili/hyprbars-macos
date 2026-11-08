-- Swap test: starts on Omarchy's packaged plugin; the run script then flips
-- HYPRBARS_SWAP and reloads, the way a live session would move to this one.
local root = os.getenv("HYPRBARS_ROOT")
hl.monitor({ output = "WAYLAND-1", mode = "preferred", position = "auto", scale = "1" })
hl.config({ animations = { enabled = false }, misc = { disable_hyprland_logo = true, disable_splash_rendering = true } })
hl.window_rule({ match = { class = ".*" }, float = true, size = "560 160", move = "40 60" })
local f = io.open(root .. "/test/.swap", "r")
local path = f and (root .. "/build/hyprbars-macos.so") or "/usr/lib/omarchy-hyprland-titlebars/titlebars.so"
if f then f:close() end
hl.plugin.load(path)
if hl.plugin.hyprbars then dofile(root .. "/test/style.lua") end
hl.on("hyprland.start", function() hl.exec_cmd("foot -e sleep 600") end)
