extends Node

enum Winner {NULL, LEFT, RIGHT}
var last_winner

func _ready():
	last_winner = Winner.NULL
