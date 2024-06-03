extends Node2D

func _ready():
	pass

func _process(delta):
	pass

func _on_gate_player_entered_gate(body):
	print("Shit: ", body)


func _on_player_granade():
	print("Granade from level")


func _on_player_laser():
	print("Laser from level")
