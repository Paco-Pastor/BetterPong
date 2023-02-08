extends Area2D

var direction = -1
var y_delta = 10
var speed = 20
var r_delta = 10

func _ready():
	$Sprite.play("idle")
	#$Particles2D.set_emitting(true)

func _physics_process(_delta):
	print(self)
	global_position.x += direction * speed
	global_position.y += y_delta
	rotation_degrees += r_delta

func bounce(area):
	#$Particles2D.process_material.color_ramp.gradient.colors[1] = area.color
	direction *= -1

func bounce_wall(): y_delta *= -1

func invert_rotation():
	r_delta *= -1
