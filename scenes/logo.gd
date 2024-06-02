extends Sprite2D

var pos: Vector2 = Vector2.ZERO
var test_scale : int = 1
const speed: int = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pos = Vector2(100,200)
	position = pos
	var test_rotation = 45
	rotation_degrees = test_rotation
	test_scale = 2
	scale = Vector2(test_scale, test_scale)
	print($"..".test_array)
	$"..".test_function()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed * delta
	if position.x > 1000:
		position.x = 0
	#test_scale += 1
	#scale = Vector2(test_scale, test_scale)
