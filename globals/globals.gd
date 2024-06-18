extends Node

signal update_stats

var player_pos : Vector2

var laser = 20 :
	set(value):
		laser = value
		update_stats.emit()

var granade = 5 :
	set(value):
		granade = value
		update_stats.emit()

var health = 60:
	set(value):
		health = value
		update_stats.emit()
