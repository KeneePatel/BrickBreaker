extends Area2D

func _on_Ceiling_area_entered(area):
	area.direction *= Vector2(1, -1)
