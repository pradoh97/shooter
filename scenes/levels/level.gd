extends Node2D

var laser_scene : PackedScene = preload("res://scenes/projectiles/laser.tscn")
var granade_scene : PackedScene = preload("res://scenes/projectiles/granade.tscn")

func _on_gate_player_entered_gate(_body):
	var player_animation = get_tree().create_tween()
	player_animation.tween_property($Player, "speed", 0, 0.5)


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


func _on_house_player_entered():
	var camera_zoom = get_tree().create_tween()
	camera_zoom.tween_property($Player/Camera2D, "zoom", Vector2(1,1), 0.5)


func _on_house_player_exited():
	var camera_zoom = get_tree().create_tween()
	camera_zoom.tween_property($Player/Camera2D, "zoom", Vector2(0.5,0.5), 0.5)
