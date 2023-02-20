extends Area2D

var direction = 1
var y_delta = 10
var speed = 18
var r_delta = 10

func _ready():
	if Game.last_winner == Game.Winner.RIGHT : direction = -1
	elif Game.last_winner == Game.Winner.NULL :
		var directions = [-1,1]
		direction = directions[randi() % 2]
	$Sprite.play("idle")

func _physics_process(_delta):
	global_position.x += direction * speed
	global_position.y += y_delta
	$Sprite.rotation_degrees += r_delta

func bounce(area): # dimension barre = (95,421)
	var yDiff = area.global_position.y - global_position.y
	var y_delta_tmp

	if y_delta != 0: y_delta_tmp = yDiff / (y_delta * 0.5)
	else : y_delta_tmp = 0
	
	if y_delta_tmp > 40 :
		y_delta = 40
	else :
		y_delta = y_delta_tmp
	
	if (yDiff > 0 and y_delta > 0) or (yDiff < 0 and y_delta < 0): y_delta *= -1
	direction *= -1
	r_delta *= -1
	$ParticleManager.update_color(area.color)

func bounce_wall(): y_delta *= -1

func _on_VisibilityNotifier2D_screen_exited():
	if global_position.x > 0 :
		$"/root/Level".p1.score += 1
		Game.last_winner = Game.Winner.LEFT
	else :
		$"/root/Level".p2.score += 1
		Game.last_winner = Game.Winner.RIGHT
	$Kill.start()
	
func _on_Kill_timeout():
	$"/root/Level".new_ball()
	queue_free()
