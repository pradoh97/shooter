extends Area2D

var available_types = ['laser', 'laser', 'laser', 'laser', 'granade', 'health']
var type = available_types[randi()%len(available_types)]
func _ready():
	if type == 'laser':
		$Sprite2D.modulate = Color(0.2,0.2,0.7)
	if type == 'granade':
		$Sprite2D.modulate = Color(0.2,0.7,0.2)
	if type == 'health':
		$Sprite2D.modulate = Color(0.7,0.2,0.2)


func _on_body_entered(body):
	body.add_item(type)
	queue_free()
