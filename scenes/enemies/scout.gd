extends CharacterBody2D

var player_nearby : bool = false
var can_laser : bool = true
var shoot_from_gun2 : int = false

signal laser(pos, dir)

func _process(_delta):

	if player_nearby:
		look_at(globals.player_pos)
		if can_laser:
			var pos : Vector2 = $laser_spawn_positions.get_child(shoot_from_gun2).global_position
			var dir : Vector2 = (globals.player_pos - position).normalized()
			laser.emit(pos, dir)
			shoot_from_gun2 = not shoot_from_gun2
			can_laser = false
			$laser_cooldown.start()

func _on_attack_area_body_entered(_body):
	player_nearby = true

func _on_attack_area_body_exited(_body):
	player_nearby = false

func _on_laser_cooldown_timeout():
	can_laser = true

func hit(damage):
	queue_free()
