extends Area2D

func _on_Wall_area_entered(area):
	if area.name == "Ball":
		area.direction *= Vector2(-1, 1)
	if area.name == "Player":
		area.vel = -area.vel
