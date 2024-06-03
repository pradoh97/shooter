extends CharacterBody2D

const speed : int = 500

signal laser(position)
signal granade(position)

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
		var laser_mark = $laser_start_position.get_child(randi() % $laser_start_position.get_child_count())
		can_laser = false
		$laser_timer.start()
		laser.emit(laser_mark.global_position)
	
	if Input.is_action_pressed("secondary action") and can_granade:
		can_granade = false
		$granade_timer.start()
		granade.emit(global_position)


func _on_laser_timer_timeout():
	can_laser = true


func _on_granade_timer_timeout():
	can_granade = true
