extends item_container

func hit(damage):
	print("ouch")
	if not opened:
		$LidSprite.hide()
		var pos = $spawn_position/Marker2D.global_position
		open.emit(pos, current_direction)
		opened = true
