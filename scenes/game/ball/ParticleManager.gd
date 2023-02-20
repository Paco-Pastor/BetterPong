extends Node2D

var particles = preload("res://scenes/game/ball/BallParticles.tscn")

func _ready():
	add_child(particles.instance())

func update_color(color):
	for child in get_children():
		if child.is_in_group("oldParticles"):
			child.queue_free()
		else :
			child.add_to_group("oldParticles")
			child.emitting = false

	var p = particles.instance()
	p.update_color(color)
	add_child(p)
