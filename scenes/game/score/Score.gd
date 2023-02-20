extends Node2D
class_name Score

func _init(xPos):
	global_position.x = xPos * 0.5
	var sa = scoreArea.new()
	add_child(sa)
