extends KinematicBody2D

var vel : float = 1
const max_displacement : int = 200
const ball_scene = preload("res://PartScenes/Ball.tscn")

func _ready():
	set_physics_process(true)
	set_process_input(true)

func _physics_process(delta):
	position.x += vel * delta * 60
	
	if position.x <= 240 + max_displacement and position.x >= 240 - max_displacement:
		if Input.is_action_pressed("ui_left"):
			vel = -5
		elif Input.is_action_pressed("ui_right"):
			vel = 5
		else:
			if vel > 0: vel -= 0.25
			elif vel < 0: vel += 0.25
	else:
		vel = 0
		if position.x <= 240 + max_displacement:
			position.x += 1
		else:
			position.x -= 1

func _input(event):
	if event.is_action_released("ui_select"):
		var ball = ball_scene.instance()
		ball.set_position(get_position() - Vector2(0, 16))
		ball.set_linear_velocity(Vector2((randi()%5-2)*100, (randi()%3+3)*-100))
		get_tree().get_root().add_child(ball)
