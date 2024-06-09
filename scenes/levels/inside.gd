extends level

@export var next_scene : PackedScene

func _on_area_2d_body_entered(_body):
	var player_animation = get_tree().create_tween()
	player_animation.tween_property($Player, "speed", 0, 0.2)
	transition_layer.change_scene(next_scene.resource_path)
