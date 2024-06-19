extends item_container

func hit(_damage):
	if not opened:
		$LidSprite.hide()
		for i in range(5):
			var pos = $spawn_position.get_child(randi()%$spawn_position.get_child_count()).global_position
			open.emit(pos, current_direction)
			opened = true
