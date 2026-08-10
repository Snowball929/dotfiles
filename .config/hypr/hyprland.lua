--mouse preset 1 2400 dpi purple-top and red-bottom
--mouse preset 2 800 dpi blue-top and bottom

------------------------
---- IMPORT MODULES ----
------------------------
require("modules/windowrules")
require("modules/looks")
require("modules/binds")
require("modules/input")
require("modules/layout")
require("modules/animations")
require("modules/opacity")

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@75",
    position = "0x0",
    scale    = "1",
})
hl.monitor({
    output   = "DP-1",
    mode     = "2560x1440@144",
    position = "1920x0",
    scale    = "1",
})


-------------------
---- AUTOSTART ----
-------------------
-- #exec-once = $terminal
-- #exec-once = nm-applet &
-- #exec-once = /usr/lib/polkit-kde-authentication-agent-1
-- #exec-once = systemctl --user start hyprpolkitagent
-- #exec-once = systemctl --user start hyprpolkitagent.service

hl.on("hyprland.start", function ()
  hl.exec_cmd("wl-paste --type text --watch cliphist store # Stores only text data")
  hl.exec_cmd("wl-paste --type image --watch cliphist store # Stores only image data")

  hl.exec_cmd("/usr/libexec/hyprpolkitagent")
  hl.exec_cmd("swaync")
  hl.exec_cmd("waybar & awww-daemon")
  hl.exec_cmd("steam")
  hl.exec_cmd("kitty")
  hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
  hl.exec_cmd("hypridle")
--   hl.exec_cmd("~/appImages/Vesktop-1.6.5.AppImage")
  hl.exec_cmd("kwalletd6&")
  hl.exec_cmd("otd-daemon")
  hl.exec_cmd("balooctl6 enable")

  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=hyprland")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic ")
hl.env("XCURSOR_SIZE", "24")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")


hl.env("HYPRSHOT_DIR", "/home/snow/Pictures/Screenshots")

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GL_GSYNC_ALLOWED", "1")


debug.disable_logs = false
debug.gl_debugging = true

-- hl.env("EZA_COLORS="da=32"")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


