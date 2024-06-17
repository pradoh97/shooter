extends Node2D
class_name level

var laser_scene : PackedScene = preload("res://scenes/projectiles/laser.tscn")
var granade_scene : PackedScene = preload("res://scenes/projectiles/granade.tscn")

func _on_player_granade(initial_position, initial_direction):
	var granade = granade_scene.instantiate() as RigidBody2D
	granade.position = initial_position
	granade.linear_velocity = initial_direction * granade.speed
	$Projectiles.add_child(granade)
	$ui.update_granade_text()


func _on_player_laser(initial_position, initial_direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = initial_position 
	laser.direction = initial_direction
	laser.rotation_degrees = rad_to_deg(initial_direction.angle()) + 90
	$Projectiles.add_child(laser)
	$ui.update_laser_text()

func _on_house_player_entered():
	var camera_zoom = get_tree().create_tween()
	camera_zoom.tween_property($Player/Camera2D, "zoom", Vector2(1,1), 0.5)


func _on_house_player_exited():
	var camera_zoom = get_tree().create_tween()
	camera_zoom.tween_property($Player/Camera2D, "zoom", Vector2(0.5,0.5), 0.5)


func _on_player_update_stats():
	$ui.update_laser_text()
	$ui.update_granade_text()
