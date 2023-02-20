extends Particles2D

func update_color(color):
	process_material.color_ramp.gradient.colors[1] = color
	var transparentColor = Color(color.r,color.g,color.b,0)
	process_material.color_ramp.gradient.colors[2] = transparentColor
