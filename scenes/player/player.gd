extends CharacterBody2D

const speed : int = 500

signal laser
signal granade

var can_laser : bool = true
var can_granade : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left","right","up", "down")
	
	#Usa delta automaticamente
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_pressed("primary action") and can_laser:
		laser.emit()
		can_laser = false
		$laser_timer.start()
	
	if Input.is_action_pressed("secondary action") and can_granade:
		granade.emit()
		can_granade = false
		$granade_timer.start()


func _on_laser_timer_timeout():
	can_laser = true


func _on_granade_timer_timeout():
	can_granade = true
