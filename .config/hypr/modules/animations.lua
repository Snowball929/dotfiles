-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeInOutCubic",  { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}       } })
hl.curve("smoothOut",       { type = "bezier", points = { {0.36, 0},    {0.66, -0.56}   } })
hl.curve("smoothIn",        { type = "bezier", points = { {0.25, 1},    {0.5, 1}        } })
hl.curve("overshot",        { type = "bezier", points = { {0.05, 0.9},  {0.1, 1.05}     } })
hl.curve("softSnap",        { type = "bezier", points = { {0.4, 0},     {0.2, 1}        } })
hl.curve("fluent",          { type = "bezier", points = { {0.0, 0.0},   {0.2, 1}        } })
hl.curve("snappy",          { type = "bezier", points = { { 0.25, 1 },  { 0.5, 1}       } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

-- hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
-- hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",        enabled = true,  speed = 3, bezier = "overshot",     style = "popin 80%" })
hl.animation({ leaf = "windowsIn",      enabled = true,  speed = 2, bezier = "softSnap",  })
hl.animation({ leaf = "windowsOut",     enabled = true,  speed = 2, bezier = "snappy", })
hl.animation({ leaf = "windowsMove",    enabled = true,  speed = 2, bezier = "softSnap"    })

-- hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",       enabled = true,  speed = 2, bezier = "smoothIn", style = "popin 92%" })
hl.animation({ leaf = "layersOut",      enabled = true,  speed = 2, bezier = "softSnap" })

hl.animation({ leaf = "fade",           enabled = true,  speed = 4, bezier = "smoothIn" })
hl.animation({ leaf = "fadeIn",         enabled = true,  speed = 4, bezier = "smoothIn" })
hl.animation({ leaf = "fadeOut",        enabled = true,  speed = 4, bezier = "smoothOut"})
hl.animation({ leaf = "fadeSwitch",     enabled = true,  speed = 4, bezier = "smoothIn" })
hl.animation({ leaf = "fadeShadow",     enabled = true,  speed = 46,bezier = "smoothIn" })
hl.animation({ leaf = "fadeDim",        enabled = true,  speed = 4, bezier = "smoothIn" })
hl.animation({ leaf = "fadeDpms",       enabled = true,  speed = 4, bezier = "smoothIn" })
hl.animation({ leaf = "fadeLayers",     enabled = true,  speed = 3, bezier = "softSnap" })

hl.animation({ leaf = "workspaces",    enabled = true,  speed = 3, bezier = "easeInOutCubic", style = "slidefadevert" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.21, bezier = "easeInOutCubic", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 2.21, bezier = "easeInOutCubic", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true,  speed = 5, bezier = "overshot", style = "slidefadevert" })
-- hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

