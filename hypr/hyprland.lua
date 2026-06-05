-- PLUGINS
local hs = require("hyprsplit")

hs.config({
	num_workspaces = 10,
	persistent_workspaces = false,
})

-- MONITORS
hl.monitor({
	-- Laptop
	output = "eDP-1",
	mode = "2560x1600@60",
	position = "0x0",
	scale = "2",
})

-- hl.monitor({
-- 	-- Home screen
-- 	output = "DP-1",
-- 	mode = "1920x1080@60",
-- 	-- scaling from laptop screen means that we are only half the distance to the right
-- 	position = "1280x0",
-- 	scale = "1",
-- })

hl.monitor({
	-- Default Sharing
	output = "HDMI-A-1",
	mode = "preferred",
	-- scaling from laptop screen means that we are only half the distance to the right
	-- position = "auto-center-up",
	position = "auto-right",
	scale = "1",
	bitdepth = 10,
})

-- hl.monitor({
-- 	-- Mirror to any
-- 	output = "HDMI-A-1",
-- 	mirror = "eDP-1",
-- 	mode = "preferred",
-- 	position = "auto-center-up",
-- })

hl.config({
  xwayland = {
    force_zero_scaling = true
  }
})

-- START-UP

hl.on("hyprland.start", function()
	hl.exec_cmd("mako")
	hl.exec_cmd("wallpaper_startup")
	hl.exec_cmd("batsignal -bpWCDFPU")
	hl.exec_cmd("newsboat -x reload")
	hl.exec_cmd("rm -r ~/Downloads/ ")
	hl.exec_cmd("rm -r ~/Documents/ ")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("hyprctl hyprsunset identity")
	hl.exec_cmd("systemctl start --user kanata.service")
	hl.exec_cmd(
		"rm -f $WOBSOCK_BLUE && mkfifo $WOBSOCK_BLUE && tail -f $WOBSOCK_BLUE | wob -c $HOME/Copernicus/wob-blue.ini"
	)
	hl.exec_cmd(
		"rm -f $WOBSOCK_YELLOW && mkfifo $WOBSOCK_YELLOW && tail -f $WOBSOCK_YELLOW | wob -c $HOME/Copernicus/wob-yellow.ini"
	)
end)

-- ENV VARS

hl.env("XCURSOR_SIZE", "24")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("WOBSOCK_BLUE", "/tmp/wobpipe-blue")
hl.env("WOBSOCK_YELLOW", "/tmp/wobpipe-yellow")

-- APPEARANCE

-- Get colours from wal file
local function load_colours(file_path)
	local colours = {}
	for line in io.lines(file_path) do
		local key, value = line:match("^%$(%w+)%s*=%s*(.+)$")
		if key then
			colours[key] = value:match("^%s*(.-)%s*$")
		end
	end
	return colours
end

local theme = load_colours(".cache/wal/colors-hyprland.conf")

hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 5,
		border_size = 1,
		col = {
			active_border = theme.foreground,
			inactive_border = theme.colour1,
		},

		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
	},

	animations = {
		enabled = true,
	},

	-- Layout specific config
	dwindle = {
		preserve_split = true,
	},

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		key_press_enables_dpms = true,
	},

	input = {
		kb_layout = "gb",

		follow_mouse = 1, -- focus follows mouse location

		mouse_refocus = false, -- Mouse only refocuses if crossing a window boundary. useful for pop-ups

		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
			scroll_factor = 1.0,
		},

		sensitivity = 0.6, -- -1.0 - 1.0, 0 means no modification
		accel_profile = "flat",

		repeat_rate = 40, -- How quickly keys repeat
		repeat_delay = 250, -- Long to hold before starting to repeat keys
	},
})

-- ANIMATIONS

hl.curve("default", { type = "bezier", points = { { 0.25, 0.1 }, { 0.25, 1.0 } } })

hl.animation({ leaf = "workspaces", enabled = true, speed = 1, bezier = "default", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 1, bezier = "default", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1, bezier = "default", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 1, bezier = "default", style = "slide" })
hl.animation({ leaf = "fade", enabled = false })

-- WINDOW RULES

-- Make figures appear on top
hl.window_rule({
	match = { class = "^Matplotlib" },
	float = true,
	center = true,
	size = { 853, 533 },
})

-- Thunderbird: float the app, but not the main window
hl.window_rule({
	match = { class = "^org.mozilla.Thunderbird" },
	float = true,
})
hl.window_rule({
	match = { title = "^Mozilla Thunderbird" },
	float = false,
})

-- Zoom
hl.window_rule({
	match = { class = "^zoom" },
	float = true,
})

-- Annotation toolbar
hl.window_rule({
	match = { title = "^annotate_toolbar" },
	no_initial_focus = true,
	border_size = 0,
})

-- SciQLop (commented out)
-- hl.window_rule({
--     match = { class = "^SciQLop" },
--     stay_focused = true,
-- })

-- GProjector
hl.window_rule({
	match = { class = "^gov-nasa-giss-projector-GProjector" },
	stay_focused = true,
})

local mainMod = "SUPER"

-- Terminal & window management
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

-- Lock screen (using a timer to avoid undefined DPMS behavior)
hl.bind("SUPER + SHIFT + ALT + L", function()
	hl.timer(function()
		hl.dispatch(hl.dsp.dpms({ action = "disable" }))
	end, { timeout = 500, type = "oneshot" })
	hl.dispatch(hl.dsp.exec_cmd("hyprlock"))
end)

--- APPLICATIONS ---
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("qutebrowser"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("kitty neomutt"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("kitty yazi"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("kitty newsboat"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("wallpapermenu"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("select_wallpaper_with_theme"))

--- SCRIPTS ---
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("kitty --title=PhysicsCalculator ~/Main/scripts/physicsCalculator"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("search_passwords"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("search_vpn"))

-- Shader changes
hl.bind(mainMod .. " + equal", hl.dsp.exec_cmd("toggle_eink"))
hl.bind(
	mainMod .. " + SHIFT + equal",
	hl.dsp.exec_cmd("hyprshade toggle $HOME/.config/hypr/shaders/blue-light-filter.glsl")
)

--- WORKFLOW ---
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("screenshot"))

-- Toggle tiling / gaps
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("toggle_tiling"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("toggle_gaps"))

-- Window focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Toggle kanata
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("bash -c $HOME/Copernicus/scripts/toggle_kanata"))

-- Toggle waybar
hl.bind(mainMod .. " + slash", hl.dsp.exec_cmd("toggle_waybar"))

-- Emoji / accents
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("rofimoji -a copy"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("accent_characters"))

-- Move window
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces
for i = 1, 9 do
	hl.bind(mainMod .. " + " .. i, hs.dsp.focus({ workspace = i }))
end
hl.bind(mainMod .. " + 0", hs.dsp.focus({ workspace = 10 }))

-- Move window to workspace
for i = 1, 9 do
	hl.bind(mainMod .. " + SHIFT + " .. i, hs.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + SHIFT + 0", hs.dsp.window.move({ workspace = 10 }))

-- Toggle waybar & hyprpaper
hl.bind(mainMod .. " + SHIFT + W", function()
	hl.dispatch(hl.dsp.exec_cmd("killall waybar; waybar"))
	hl.dispatch(hl.dsp.exec_cmd("killall hyprpaper; hyprpaper"))
end)

-- Workspace cycling
hl.bind(mainMod .. " + Tab", hs.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + SHIFT + Tab", hs.dsp.focus({ workspace = "m-1" }))

-- Move/resize with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ... with keyboard
local resize_rate = 50
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.resize({ x = -resize_rate, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.resize({ x = 0, y = resize_rate, relative = true }))
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.resize({ x = 0, y = -resize_rate, relative = true }))
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.resize({ x = resize_rate, y = 0, relative = true }))

-- Volume
hl.bind("xf86audioraisevolume", hl.dsp.exec_cmd("volume --inc 5"))
hl.bind("xf86audiolowervolume", hl.dsp.exec_cmd("volume --dec 5"))
hl.bind("xf86AudioMicMute", hl.dsp.exec_cmd("volume --toggle-mic"))
hl.bind("xf86audioMute", hl.dsp.exec_cmd("volume --toggle"))

-- Brightness
hl.bind("xf86MonBrightnessDown", hl.dsp.exec_cmd("brightness --dec"))
hl.bind("xf86MonBrightnessUp", hl.dsp.exec_cmd("brightness --inc"))

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})
