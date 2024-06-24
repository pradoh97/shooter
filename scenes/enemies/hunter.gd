extends CharacterBody2D

var active : bool = false
var speed : int = 350
var player_near : bool = false
var vulnerable : bool = true
var health : float = 5

func _ready():
	$NavigationAgent2D.path_desired_distance = 4.0
	$NavigationAgent2D.target_desired_distance = 4.0
	$NavigationAgent2D.target_position = globals.player_pos

func _physics_process(_delta):
	if active:
		var next_path_pos : Vector2 = $NavigationAgent2D.get_next_path_position()
		var direction : Vector2 = (next_path_pos - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
		var look_angle = direction.angle()
		rotation = look_angle

func _on_notice_area_body_entered(_body):
	active = true
	$AnimationPlayer.play("walk")

func _on_notice_area_body_exited(_body):
	active = false
	$AnimationPlayer.stop()

func _on_navigation_timeout():
	$NavigationAgent2D.target_position = globals.player_pos

func _on_attack_area_body_entered(_body):
	$AnimationPlayer.play("attack")
	player_near = true

func _on_attack_area_body_exited(_body):
	$AnimationPlayer.play("walk")
	player_near = false

func attack():
	if player_near:
		globals.health -= 20


func _on_hit_timeout():
	vulnerable = true

func hit(damage):
	if vulnerable:
		health -= damage
		vulnerable = false
		$timers/hit.start()
	if health <= 0:
		queue_free()
