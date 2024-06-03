extends CharacterBody2D


const SPEED : float = 300.0
var direction : Vector2 = Vector2.LEFT

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(_delta):		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if position.x > 1050:
		direction = Vector2.LEFT
	if position.x < 100:
		direction = Vector2.RIGHT
	velocity = SPEED * direction
	#velocity. = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
