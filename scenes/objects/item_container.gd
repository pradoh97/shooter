extends StaticBody2D
class_name item_container

signal open(pos, dir)
var opened : bool = false

@onready var current_direction : Vector2 = Vector2.DOWN.rotated(rotation)

func hit(damage):
	pass
