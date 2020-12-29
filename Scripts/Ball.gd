extends RigidBody2D

func _process(_delta):
	var body = get_colliding_bodies()
	if !body.empty():
		if body[0].is_in_group("Bricks"):
			body[0].queue_free()
