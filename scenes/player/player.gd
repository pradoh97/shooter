extends CharacterBody2D

@export var max_speed : int = 500
var speed : int = max_speed
var shielded : bool = false
signal laser(initial_position : Vector2, initial_direction : Vector2)
signal granade(initial_position : Vector2, initial_direction : Vector2)

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
	globals.player_pos = position
	look_at(get_global_mouse_position())
	var projectile_direction = (get_global_mouse_position() - position).normalized()

	if Input.is_action_pressed("primary action") and can_laser and globals.laser > 0:
		globals.laser -= 1
		var laser_mark = $laser_start_position.get_child(randi() % $laser_start_position.get_child_count())
		can_laser = false
		$shoot_particles/GPUParticles2D.emitting = true
		$shoot_particles/GPUParticles2D2.emitting = true
		$laser_timer.start()
		laser.emit(laser_mark.global_position, projectile_direction)

	if Input.is_action_pressed("secondary action") and can_granade and globals.granade > 0:
		globals.granade -= 1
		var granade_mark = $laser_start_position.get_child(randi() % $laser_start_position.get_child_count())
		can_granade = false
		$granade_timer.start()
		granade.emit(granade_mark.global_position, projectile_direction)


func _on_laser_timer_timeout():
	can_laser = true


func _on_granade_timer_timeout():
	can_granade = true

func hit(damage):
	if not shielded:
		globals.health -= damage
		shielded = true
		$shield.start()
	if globals.health <= 0:
		queue_free()

func _on_shield_timeout():
	shielded = false
