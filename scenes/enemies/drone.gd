extends CharacterBody2D

const SPEED : float = 300.0
var direction : Vector2 = Vector2.LEFT

func _physics_process(_delta):		
	if position.x > 1050:
		direction = Vector2.LEFT
	if position.x < 100:
		direction = Vector2.RIGHT
	velocity = SPEED * direction

	move_and_slide()
