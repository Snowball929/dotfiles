---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "kitty"
local fileManager = "dolphin --platformtheme kde"
local menu = "wofi --show drun"
local menurun = "wofi --show run"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
-- closeWindowBind:set_enabled(false)

hl.bind(mainMod .. " + bracketright", hl.dsp.exec_cmd("hyprshot -m region --freeze"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + X", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind(
	mainMod .. " + V",
	hl.dsp.exec_cmd(
		"cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy && wtype -M ctrl -k v -m ctrl"
	)
)
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("~/appImages/Vesktop-1.6.5.AppImage"))
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
local closeWindowBind = hl.bind(" + ALT + F4", hl.dsp.window.close())
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("gio launch /home/snow/.local/share/applications/spf.desktop"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + K", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd(menurun))

hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.layout("swapsplit"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("~/Documents/scripts/killHyprshot.sh"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ x = -200, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ x = 200, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ x = 0, y = -200, relative = true }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ x = 0, y = 200, relative = true }))

-- Resizing Binds
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.resize({ x = -200, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.resize({ x = 200, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.resize({ x = 0, y = -200, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.resize({ x = 0, y = 200, relative = true }), { repeating = true })

hl.bind(mainMod .. " + space", hl.dsp.layout("promote"))
-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
	hl.bind(mainMod .. " + CONTROL + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind("ALT + TAB", hl.dsp.focus({ workspace = 3 }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + minus", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + minus", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ direction = "right" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"SHIFT + XF86AudioMute",
	hl.dsp.exec_cmd("~/Documents/scripts/pactlScript.sh"),
	{ locked = true, repeating = true }
)
hl.bind(
	mainMod .. " + XF86AudioMute",
	hl.dsp.exec_cmd("~/Documents/scripts/pactlScript.sh"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--discord mutes
hl.bind(
	mainMod .. " + backslash",
	hl.dsp.send_shortcut({ mods = "CTRL SHIFT", key = "M", window = "class:^(vesktop)$" })
)

--obs binding
hl.bind(mainMod .. " + equal", hl.dsp.pass({ window = "class:^(com\\.obsproject\\.Studio)$" }))
