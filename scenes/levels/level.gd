extends Node2D

var laser_scene : PackedScene = preload("res://scenes/projectiles/laser.tscn")
var granade_scene : PackedScene = preload("res://scenes/projectiles/granade.tscn")

func _on_gate_player_entered_gate(body):
	print("Shit: ", body)


func _on_player_granade(initial_position, initial_direction):
	var granade = granade_scene.instantiate() as RigidBody2D
	granade.position = initial_position
	granade.linear_velocity = initial_direction * granade.speed
	$Projectiles.add_child(granade)


func _on_player_laser(initial_position, initial_direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = initial_position 
	laser.direction = initial_direction
	laser.rotation_degrees = rad_to_deg(initial_direction.angle()) + 90
	$Projectiles.add_child(laser)
