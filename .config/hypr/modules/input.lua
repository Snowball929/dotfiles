---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 1, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "glorious-model-d-wireless",
    sensitivity = -0.5,
})
hl.device({
    name        = "wacom-intuos-s-2-pen",
    output = "DP-1"
})
hl.device({
    name        = "opentabletdriver-virtual-artist-tablet",
    output = "DP-1"
})


-- hl.cursor({
--     invisible = false,
--     enable_hyprcursor = true,
-- })
