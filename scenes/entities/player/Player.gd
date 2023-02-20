extends Node2D
class_name Player

var score = 0

var bar = preload("res://scenes/entities/bar/Bar.tscn")

func _init(xPos, color):
	var b = bar.instance()
	b.global_position = Vector2(xPos,0)
	b.color = color
	add_child(b)
	var sa = Score.new(xPos)
	add_child(sa)

