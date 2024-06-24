extends item_container

func hit(_damage):
	if not opened:
		$AudioStreamPlayer2D.play()
		$LidSprite.hide()
		var pos = $spawn_position/Marker2D.global_position
		open.emit(pos, current_direction)
		opened = true
