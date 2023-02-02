extends Area2D

var speed = 20

func _ready():
	$Sprite.play("idle")

func _physics_process(_delta):
	get_input()
	position.y = clamp(position.y,-1000,1000)

func get_input():
	if(Input.is_action_pressed("ui_up")):
		move_local_y(-speed)
	elif(Input.is_action_pressed("ui_down")):
		move_local_y(speed)

func _on_Bar_area_entered(area):
	if area.is_in_group("BALLS"): area.bounce()
