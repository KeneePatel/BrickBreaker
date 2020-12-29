extends RigidBody2D

func _ready():
	set_friction(0)
	set_bounce(1)

func _process(delta):
	var body = get_colliding_bodies()
	if !body.empty():
		if body[0].is_in_group("Bricks"):
			body[0].queue_free()
