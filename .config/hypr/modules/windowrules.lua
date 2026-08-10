--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
-- See https://wiki.hypr.land/Configuring/Window-Rules/ for more
-- See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules



--tags gamescope as game
hl.window_rule({
    name = "windowrule-1",
    match = {
        class = [=[^(gamescope)$|^(steam_app_\d+)$|^(steam_proton)$]=],
    },
    tag = [=[+games]=],
})
hl.window_rule({
    name = "windowrule-2",
    match = {
        xdg_tag = [=[^(proton-game)$]=],
    },
    tag = [=[+games]=],
})
--tags mincraft as game
hl.window_rule({
    name = "windowrule-3",
    match = {
        title = [=[^(Minecraft.*)$]=],
    },
    tag = [=[+games]=],
})
--moves retroarch games to workspace 2
hl.window_rule({
    name = "windowrule-3-2",
    match = {
        title = [=[^RetroArch .+$]=],
    },
    tag = [=[+games]=],
})
--moves main retroarch window to workspace 1
hl.window_rule({
    name = "windowrule-3-3",
    match = {
        title = [=[^RetroArch$]=],
    },
    workspace = [=[1]=],
    fullscreen = true,
})


--moves azahar window to workspace 2 and fullscreen
hl.window_rule({
    name = "windowrule-3-4",
    match = {
        title = [=[^Azahar 2125.1.1 .+$]=],
    },
    fullscreen = true,
    workspace = [=[2]=],
})
--makes azahar banners opaque
hl.window_rule({
    name = "windowrule-3-5",
    match = {
        title = [=[^Azahar$]=],
    },
    opacity = [=[1 override 1 override 1 override]=],
})

--steam has no blur and should make opaque but ummm doesnt...
-- windowrule {
--   name = windowrule-4
--   no_blur = off
--   force_rgbx = off
--   match:class = (steam)$
-- }

-- #tags proton as game
-- windowrule {
--   name = windowrule-2
--   tag = +games
--   match:class = ^(steam_proton)$
-- }



--windowrule = tag +games, class:^(.*.exe.*)$ #Commented or else any thing i open with wine will go to that workspace

-- #adds games tag to steam apps
-- windowrule {
--   name = windowrule-5
--   tag = +games
--   match:class = ^(steam_app_\d+)$
-- }

--moves all games to workspace 2 and removes blur
hl.window_rule({
    name = "windowrule-6",
    match = {
        tag = [=[games*]=],
    },
    workspace = [=[2]=],
    no_blur = true,
    fullscreen = true,
})

-- Ignore maximize requests from apps. You'll probably like this. Idk man i guess
hl.window_rule({
    name = "windowrule-7",
    match = {
        class = [=[.*]=],
    },
    suppress_event = [=[maximize]=],
})

-- Fix some dragging issues with XWayland apparently
hl.window_rule({
    name = "windowrule-8",
    match = {
        class = [=[^$]=],
        title = [=[^$]=],
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})
--default, unsure
-- OMITTED: comment says "default, unsure" and match:title = () is ambiguous / probably overbroad
-- windowrule {
--   name = windowrule-9
--   opaque = on
--   no_shadow = on
--   no_blur = on
--   match:title = ()
-- }
--default, unsure
-- OMITTED: comment says "default, unsure" and match:class = () is ambiguous / probably overbroad
-- windowrule {
--   name = windowrule-10
--   opaque = on
--   no_shadow = on
--   no_blur = on
--   match:class = ()
-- }

--workspace 5 and up are opaque
hl.window_rule({
    name = "windowrule-11",
    match = {
        workspace = [=[r[5-9]]=],
    },
    opacity = [=[1 override 1 override 1.0 override]=],
})
--makes zotero pop-up float
hl.window_rule({
    name = "windowrule-13",
    match = {
        class = [=[(Zotero)]=],
    },
    float = true,
})
--stops main zotero floating
hl.window_rule({
    name = "windowrule-14",
    match = {
        title = [=[(Zotero)]=],
    },
    float = false,
})

--positions volume control in corner and size correctly 
hl.window_rule({
    name = "windowrule-16",
    match = {
        workspace = [=[m[DP-1]]=],
        title = [=[(Volume Control)]=],
    },
    float = true,
    size = { 650, 700 },
    move = { 1903, 61 }, --was 1903 55 before pill bar
})

hl.window_rule({
    name = "windowrule-17",
    match = {
        workspace = [=[m[HDMI-A-1]]=],
        title = [=[(Volume Control)]=],
    },
    float = true,
    size = { 650, 700 },
    move = { 1264, 57 },
})

--floats kcalc on mouse postion
hl.window_rule({
    name = "windowrule-18",
    match = {
        title = [=[(KCalc)]=],
    },
    float = true,
    size = { 400, 500 },
    move = { [=[cursor_x-200]=], [=[cursor_y-250]=] },
})

--enables transparency on superfile when in use
hl.window_rule({
    name = "windowrule-20",
    match = {
        title = [=[(superfile)]=],
    },
    opacity = [=[0.9 override 0.7 override 0.7 override]=],
})



--stops ltspice floating
hl.window_rule({
    name = "windowrule-21",
    match = {
        title = [=[(LTspice)]=],
    },
    float = false,
})


--steam properties now floats 
hl.window_rule({
    name = "windowrule-22",
    match = {
        title = [=[negative:Steam]=],
        class = [=[(steam)]=],
    },
    float = true,
    center = true,
})
--stops drop downs in steam from floating 
hl.window_rule({
    name = "windowrule-23",
    match = {
        title = [=[^$]=],
        class = [=[(steam)]=],
    },
    float = true,
    center = false,
    opacity = [=[1.0 override 1.0 override 1.0 override]=],
})
--forces friends list to float below mouse
hl.window_rule({
    name = "windowrule-24",
    match = {
        title = [=[(Friends List)]=],
    },
    float = true,
    size = { 400, 500 },
    move = { [=[cursor_x-200]=], [=[cursor_y+30]=] },
})
--forces screenshare prompt to float above mouse
hl.window_rule({
    name = "windowrule-25",
    match = {
        class = [=[(hyprland-share-picker)]=],
    },
    float = true,
    size = { 500, 290 },
    --move = { [=[cursor_x-100]=], [=[cursor_y-320]=] },
    move = {5, 785},
})
--changes PNG and JPEG export window in GIMP to be floating and centered
hl.window_rule({
    name = "windowrule-26",
    match = {
        title = [=[Export Image as PNG|Export Image as JPEG|Export Image as WebP|Preferences]=],
        class = [=[file-png|file-jpeg|file-webp|gimp]=],
    },
    float = true,
    center = true,
})

--moves discord to workspace 3 on startup
hl.window_rule({
    name = "windowrule-27",
    match = {
        class = [=[vesktop]=],
    },
    workspace = [=[3]=],
})
--moves steam to workspace 1 on startup
hl.window_rule({
    name = "windowrule-27-1",
    match = {
        class = [=[steam]=],
        title = [=[Steam|Sign in to Steam]=],
    },
    workspace = [=[1]=],
})

--ensures that fullscreen of voice call is opaque 
hl.window_rule({
    name = "windowrule-28",
    match = {
        title = [=[^(.*Discord \| General.*)$|^(.*Discord \| morbuis.*)$]=],
    },
    opacity = [=[1.0 override 1.0 override 1.0 override]=],
})

--forces calendar to be small
hl.window_rule({
    name = "windowrule-29",
    match = {
        class = [=[org.kde.korganizer]=],
    },
    float = true,
    size = { 650, 540 },
})
--forces youtube videos to be opaque
hl.window_rule({
    name = "windowrule-30",
    match = {
        title = [=[^(.*YouTube.*)$|^(.*Netflix.*)$]=],
    },
    opacity = [=[1.0 override 1.0 override 1.0 override]=],
})

--centers steamvr and gives it a distinct border, not like ill be seeing it
hl.window_rule({
    name = "windowrule-31",
    match = {
        title = [=[SteamVR Status]=],
    },
    float = true,
    center = true,
    border_color = [=[rgba(255,255,255,1) rgba(255,255,0,1)]=],
    border_size = 5,
    rounding = 10,
    rounding_power = 3,
    opacity = [=[1.0 override 1.0 override 1.0 override]=],
})
--removes the border and noise from the vr pop-ups
hl.window_rule({
    name = "windowrule-32",
    match = {
        title = [=[vrmonitor]=],
        class = [=[vrmonitor]=],
    },
    float = true,
    center = false,
    no_blur = true,
    opacity = [=[1.0 override 1.0 override 1.0 override]=],
})
--blurs both waybars and swaync -t
hl.layer_rule({
    name = "layerrule-1",
    match = {
        namespace = [=[^(.*bar1.*)$|^(.*bar2.*)$|^(.*swaync-control-center.*)$]=],
    },
    blur = true,
    ignore_alpha = 0.1,
})

--removes black border from hyprshot picture
hl.layer_rule({
    name = "layerrule-2",
    match = {
        namespace = [=[selection]=],
    },
    no_anim = true,
})
hl.layer_rule({
    name = "layerrule-3",
    match = {
        namespace = [=[swaync-control-center]=],
    },
    animation = [=[slidefadevert top]=],
})
hl.layer_rule({
    name = "layerrule-4",
    match = {
        namespace = [=[swaync-notification-window]=],
    },
    animation = [=[slidefadevert bottom]=],
})
hl.layer_rule({
    name = "layerrule-5",
    match = {
        namespace = [=[wofi|rofi]=],
    },
    animation = [=[slidefadevert top]=],
})
--makes yast password small and floating
hl.window_rule({
    name = "windowrule-33",
    match = {
        title = [=[xdg-su: /sbin/yast2]=],
        class = [=[XTerm]=],
    },
    float = true,
    center = true,
    size = { 200, 100 },
})



--positions btop widgets and resizes
hl.window_rule({
    name = "windowrule-34",
    match = {
        title = [=[(btop-mem)]=],
        workspace = [=[m[DP-1]]=],
    },
    float = true,
    size = { 433, 250 },
    move = { 2120, 55 }, --was at 2120 55 before pill bar
})

hl.window_rule({
    name = "windowrule-34-2",
    match = {
        title = [=[(btop-mem)]=],
        workspace = [=[m[HDMI-A-1]]=],
    },
    float = true,
    size = { 433, 250 },
    move = { 1481, 55 },
})
hl.window_rule({
    name = "windowrule-34-3",
    match = {
        title = [=[(btop-cpu)]=],
        workspace = [=[m[DP-1]]=],
    },
    float = true,
    size = { 838, 488 },
    move = { 1715, 55 }, --was 1715 55 before pill bar
})

hl.window_rule({
    name = "windowrule-34-4",
    match = {
        title = [=[(btop-cpu)]=],
        workspace = [=[m[HDMI-A-1]]=],
    },
    float = true,
    size = { 612, 440 },
    move = { 1302, 55 },
})
hl.window_rule({
    name = "windowrule-34-5",
    match = {
        title = [=[(btop-net)]=],
    },
    float = true,
    size = { 433, 250 },
    move = { [=[cursor_x-216]=], 55 },
})
--resize and float normal btop window, just makes sense 
hl.window_rule({
    name = "windowrule-34-7",
    match = {
        title = [=[btop-float]=],
        workspace = [=[m[DP-1]]=],
    },
    float = true,
    center = true,
    size = { 1200, 1200 },
})

hl.window_rule({
    name = "windowrule-34-8",
    match = {
        title = [=[btop-float]=],
        workspace = [=[m[HDMI-A-1]]=],
    },
    float = true,
    center = true,
    size = { 950, 900 },
})




--forces krita pop-ups to be opaque | vlc too
hl.window_rule({
    name = "windowrule-35",
    match = {
        title = [=[Krita|vlc]=],
        float = true,
    },
    opacity = [=[1.0 override 1.0 override 1.0 override]=],
})
--make calendar float and small
hl.window_rule({
    name = "windowrule-37",
    match = {
        title = [=[calcure-float]=],
        workspace = [=[m[HDMI-A-1]]=],
    },
    float = true,
    move = { 642, 60 },
    size = { 636, 430 },
})
hl.window_rule({
    name = "windowrule-37-2",
    match = {
        title = [=[calcure-float]=],
        workspace = [=[m[DP-1]]=],
    },
    float = true,
    move = { 962, 61 },
    size = { 636, 430 },
})
hl.window_rule({
    name = "windowrule-37-3",
    match = {
        title = [=[calcure]=],
    },
    float = true,
    center = false,
    size = { 1005, 807 },
})
--pinta force opaque popups
hl.window_rule({
    name = "windowrule-38",
    match = {
        title = [=[Pinta]=],
        class = [=[Pinta]=],
    },
    float = true,
    opacity = [=[1.0 override 1.0 override 1.0 override]=],
})
hl.window_rule({
    name = "windowrule-39",
    match = {
        title = [=[Resize Canvas]=],
        class = [=[Pinta]=],
    },
    float = true,
})
--gimp float search window
hl.window_rule({
    name = "windowrule-40",
    match = {
        class = [=[gimp]=],
        title = [=[Search Actions]=],
    },
    float = true,
    size = { 547, 308 },
})
--noita alphabet opaque
hl.window_rule({
    name = "windowrule-41",
    match = {
        title = [=[noita_alphabet.png.*]=],
        class = [=[org.kde.okular]=],
    },
    opacity = [=[1.0 override 1.0 override 1.0 override]=],
})
--changes Open File window in VLC to be floating and centered | float kate open file window
hl.window_rule({
    name = "windowrule-42",
    match = {
        title = [=[Select one or more files to open|Open File — Kate]=],
        class = [=[xdg-desktop-portal-gtk|org.kde.kate]=],
    },
    float = true,
    center = true,
})
hl.window_rule({
    name = "windowrule-43",
    match = {
        class = [=[org.kde.krita]=],
    },
    no_blur = true,
    force_rgbx = false,
})

--float obs settings and resize
hl.window_rule({
    name = "windowrule-45",
    match = {
        title = [=[Settings]=],
        class = [=[com.obsproject.Studio]=],
    },
    center = true,
    size = { 950, 710 },
})
--make spotify slighty transparent
hl.window_rule({
    name = "windowrule-46",
    match = {
        class = [=[spotify-qt|Spotify]=],
    },
    opacity = [=[0.9 override 0.7 override]=],
})
--make dolphin slightly transparent
hl.window_rule({
    name = "windowrule-47",
    match = {
        class = [=[org.kde.dolphin]=],
    },
    opacity = [=[0.95 override 0.7 override]=],
})
hl.window_rule({
    name = "windowrule-48",
    match = {
        class = [=[openshot]=],
        title = [=[openshot]=],
    },
    opacity = [=[1 override 1 override 1.0 override]=],
})
hl.window_rule({
    name = "windowrule-49",
    match = {
        class = [=[xdg-desktop-portal-gtk]=],
    },
    float = true,
    center = true,
})
hl.window_rule({
    name = "windowrule-50",
    match = {
        class = [=[firefox]=],
        title = [=[Library]=],
    },
    size = { 1110, 845 },
    float = true,
    center = true,
})
hl.window_rule({
    name = "windowrule-51",
    match = {
        class = [=[kitty]=],
        title = [=[^(.*smassh.*)$]=],
    },
    opacity = [=[0.9 override 0.7 override]=],
})

hl.window_rule({
    name = "firefox_width",
    match = {
        class = [=[firefox]=],
    },
    scrolling_width = 0.6,
})

hl.window_rule({
    name = "windowrule-52",
    match = {
        class = [=[org.kde.gwenview]=],
        title = [=[Save Image — Gwenview]=],
    },
    size = { 800, 500 },
    float = true,
})



-- Omitted uncertain effect(s) from original config:
-- windowrule-32: border_color = 000000 -- raw color value 000000 is not shown in current Lua wiki examples; clarify whether this should be rgb(000000), rgba(...), or no border_color rule
