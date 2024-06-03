extends Node2D

var laser_scene : PackedScene = preload("res://scenes/projectiles/laser.tscn")
var granade_scene : PackedScene = preload("res://scenes/projectiles/granade.tscn")

func _on_gate_player_entered_gate(body):
	print("Shit: ", body)


func _on_player_granade(position):
	var granade = granade_scene.instantiate()
	granade.position = position
	$Projectiles.add_child(granade)


func _on_player_laser(position):
	var laser = laser_scene.instantiate()
	laser.position = position
	$Projectiles.add_child(laser)
