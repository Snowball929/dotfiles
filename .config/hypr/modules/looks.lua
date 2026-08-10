
-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 1,
        gaps_out = {
            top = 2,
            bottom = 2,
            left = 4,
            right = 4,
        },

        border_size = 1,

        col = {
            active_border   = "rgba(177,172,247,1)",
            -- active_border   = "rgba(185,100,255,1)",
          inactive_border = "rgba(220,195,255,0)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 4,
        rounding_power = 4,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 0.7,

        shadow = {
            enabled      = false,
          range        = 4,
          render_power = 3,
          color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
          size      = 2,
          passes    = 3,
          noise     = 0.05,
          vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})
