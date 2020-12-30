extends RigidBody2D

const speed_up : int = 5
const max_speed : int = 400

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var body = get_colliding_bodies()
	if !body.empty():
		if body[0].is_in_group("Bricks"):
			body[0].queue_free()
		if body[0].get_name() == "Paddle":
			var speed = get_linear_velocity().length()
			#print("ball position: ", get_position())
			#print("paddle position: ", body[0].get_node("Anchor").get_global_position())
			var direction = get_position() - body[0].get_node("Anchor").get_global_position()
			#print("Direction: ", direction)
			#print("unit Direction: ", direction.normalized()) # unit vector for direction
			var velocity = direction.normalized()*min(speed + speed_up, max_speed*delta)*60
			set_linear_velocity(velocity)
	if get_position().y > 860:
		print("ball is dead.")
		queue_free()
