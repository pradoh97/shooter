extends Node

signal update_stats

var player_hit_sound : AudioStreamPlayer

var player_pos : Vector2

var laser = 20 :
	set(value):
		laser = value
		update_stats.emit()

var granade = 5 :
	set(value):
		granade = value
		update_stats.emit()

var health = 100:
	set(value):
		health = value
		if value <= 0:
			player_hit_sound.play()
		update_stats.emit()

func _ready():
	player_hit_sound = AudioStreamPlayer.new()
	player_hit_sound.stream = load("res://audio/solid_impact.ogg")
	add_child(player_hit_sound)
