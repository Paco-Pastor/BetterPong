extends Node2D

var p1
var p2

var ball = preload("res://scenes/game/ball/Ball.tscn")

func _ready():
	p1 = Player.new(-1800,Color.red)
	p2 = Player.new(1800,Color.greenyellow)
	add_child(p1)
	add_child(p2)
	new_ball()

func new_ball():
	var b = ball.instance()
	add_child(b)
