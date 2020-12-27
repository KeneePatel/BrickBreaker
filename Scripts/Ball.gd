extends Area2D

var vel : float = 0
var direction : Vector2 = Vector2()

func _ready():
	direction = Vector2(-1, 1)
	vel = 2.6

func _process(delta):
	position += direction * vel * delta * 60
