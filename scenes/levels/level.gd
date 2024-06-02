extends Node2D

var test_array : Array[String] = ["Test", "Hello", "Stuff"]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Logo.rotation_degrees = 90


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Logo.rotation_degrees += 150 * delta
	if $Logo.rotation_degrees > 180:
		$Logo.rotation_degrees = 0

