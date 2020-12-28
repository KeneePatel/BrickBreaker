extends KinematicBody2D

var vel : float = 1
const max_displacement : int = 192

func _process(delta):
	position.x += vel * delta * 60
	
	if position.x <= max_displacement and position.x >= -max_displacement:
		if Input.is_action_pressed("ui_left"):
			vel = -5
		elif Input.is_action_pressed("ui_right"):
			vel = 5
		else:
			if vel > 0: vel -= 0.25
			elif vel < 0: vel += 0.25
	else:
		vel = 0
		if position.x <= max_displacement:
			position.x += 1
		else:
			position.x -= 1
			
	if InputEventScreenTouch:
		print()

func _input(event):
	if event is InputEventMouseButton and event.position.x < 240:
		vel = -5
		print(event.position)
	if event is InputEventMouseButton and event.position.x > 240:
		vel = +5
		print(event.position)
