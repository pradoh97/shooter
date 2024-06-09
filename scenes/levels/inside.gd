extends level

@export var next_scene : PackedScene

func change_level():
	get_tree().change_scene_to_packed(next_scene)

func _on_area_2d_body_entered(_body):
	var player_animation = get_tree().create_tween()
	player_animation.tween_property($Player, "speed", 0, 0.2)
	change_level()
