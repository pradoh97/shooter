extends Area2D

var available_types = ['laser', 'laser', 'laser', 'laser', 'granade', 'health']
var type = available_types[randi()%len(available_types)]
var direction : Vector2
var distance : int = randi_range(150, 200)

func _ready():
	if type == 'laser':
		$Sprite2D.modulate = Color(0.2,0.2,0.7)
	if type == 'granade':
		$Sprite2D.modulate = Color(0.2,0.7,0.2)
	if type == 'health':
		$Sprite2D.modulate = Color(0.7,0.2,0.2)

	var spawn_tween = create_tween()
	var target_positon = position + direction * distance
	spawn_tween.set_parallel(true)
	spawn_tween.tween_property(self, "position", target_positon, 0.5)
	spawn_tween.tween_property(self, "scale", Vector2(1,1), 0.5).from(Vector2(0,0))

func _on_body_entered(_body):
	if type == 'laser':
		globals.laser = globals.laser + 5
	if type == 'granade':
		globals.granade = globals.granade + 1
	if type == 'health':

		if(globals.health >= 100):
			globals.health = 100
		else :
			globals.health = globals.health + 10
	queue_free()
