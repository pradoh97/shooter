extends level

func _on_gate_player_entered_gate(_body):
	var player_animation = get_tree().create_tween()
	player_animation.tween_property($Player, "speed", 0, 0.2)
	transition_layer.change_scene("res://scenes/levels/inside.tscn")

func _on_house_player_entered():
	var camera_zoom = get_tree().create_tween()
	camera_zoom.tween_property($Player/Camera2D, "zoom", Vector2(0.75,0.75), 0.5)

func _on_house_player_exited():
	var camera_zoom = get_tree().create_tween()
	camera_zoom.tween_property($Player/Camera2D, "zoom", Vector2(0.5,0.5), 0.5)
