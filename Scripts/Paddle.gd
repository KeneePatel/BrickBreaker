extends KinematicBody2D

var vel : int = 1
const max_displacement : int = 190

func _process(delta):
	position.x += vel * delta * 60
	
	if position.x <= max_displacement and position.x >= -max_displacement:
		if Input.is_action_pressed("ui_left"):
			vel = -5
		elif Input.is_action_pressed("ui_right"):
			vel = 5
	else:
		vel = 0
		if position.x <= max_displacement:
			position.x += 1
		else:
			position.x -= 1
