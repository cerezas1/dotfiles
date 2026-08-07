hl.config({animations = { enabled = true, },
})

hl.curve("cleanCurve", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("musicPanelDecel", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "cleanCurve", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "cleanCurve", style = "slide" })
hl.animation({ leaf = "fade", enabled = true, speed = 5, bezier = "cleanCurve" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "cleanCurve", style = "slide" })

hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "musicPanelDecel", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 3, bezier = "musicPanelDecel", style = "slide" })
