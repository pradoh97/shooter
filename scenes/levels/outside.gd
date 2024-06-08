extends level


func _on_gate_player_entered_gate(_body):
	var player_animation = get_tree().create_tween()
	player_animation.tween_property($Player, "speed", 0, 0.2)
