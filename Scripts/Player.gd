extends Area2D

var vel : float = 0

func _process(delta):
	position += Vector2.RIGHT * vel * 0.5
	
	if Input.is_action_pressed("ui_left"):
		vel = -12 * delta * 60
	elif Input.is_action_pressed("ui_right"):
		vel = 12 * delta * 60
	else:
		if vel > 1:
			vel -= 0.5
		elif vel < -1:
			vel += 0.5
		else:
			vel = 0

func _on_Player_area_entered(area):
	if area.name == "Ball":
		area.direction *= Vector2(1.1, -1.1)
