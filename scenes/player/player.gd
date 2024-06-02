extends Node2D

const speed : int = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("left","right","up", "down")
	position += direction*speed*delta
	
	if Input.is_action_pressed("primary action"):
		print("Shooting")
	if Input.is_action_pressed("secondary action"):
		print("Granade")