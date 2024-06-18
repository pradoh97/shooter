extends Node2D
class_name level

var laser_scene : PackedScene = preload("res://scenes/projectiles/laser.tscn")
var granade_scene : PackedScene = preload("res://scenes/projectiles/granade.tscn")
var item_scene : PackedScene = preload("res://scenes/items/item.tscn")

func _ready():
	for container in get_tree().get_nodes_in_group("containers"):
		container.connect("open", _on_container_opened)
	for scout in get_tree().get_nodes_in_group("scouts"):
		scout.connect("laser", _on_scout_laser)

func _on_container_opened(pos, dir):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = dir
	$Items.call_deferred("add_child", item)

func _on_player_granade(initial_position, initial_direction):
	var granade = granade_scene.instantiate() as RigidBody2D
	granade.position = initial_position
	granade.linear_velocity = initial_direction * granade.speed
	$Projectiles.add_child(granade)

func _on_player_laser(initial_position, initial_direction):
	create_laser(initial_position, initial_direction)

func create_laser(pos, dir):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.direction = dir
	laser.rotation_degrees = rad_to_deg(dir.angle()) + 90
	$Projectiles.add_child(laser)

func _on_scout_laser(pos, dir):
	create_laser(pos, dir)
