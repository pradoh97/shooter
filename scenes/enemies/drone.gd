extends CharacterBody2D

const INITIAL_SPEED : float = 400
const MAX_SPEED : float = 700
var speed : float = INITIAL_SPEED
var pursuing_player : bool = false
var direction : Vector2
var vulnerable : bool = true
var can_move : bool = true
var health = randi_range(2,3)
var explosion_active : bool = false

func _ready():
	$Explosion.hide()

func _physics_process(delta):
	var collision = null
	
	if pursuing_player and can_move:
		direction = (globals.player_pos - global_position).normalized()
		look_at(globals.player_pos)
		var tween = create_tween()
		tween.tween_property(self, "speed", MAX_SPEED, 2)
	
	if not can_move:
		pursuing_player = false
		speed -= 200
		var tween = create_tween()
		tween.tween_property(self, "speed", 0, 2)
	
	velocity = speed * direction * delta
	collision = move_and_collide(velocity)
	
	if collision:
		hit(health)
	if explosion_active:
		var targets = get_tree().get_nodes_in_group("entity")
		for target in targets:
			var in_range = target.global_position.distance_to(global_position) < 200
			if "hit" in target and in_range:
				target.hit(2)
			

func hit(damage):
	if vulnerable:
		health -= damage
		vulnerable = false
		$hit_timer.start()
		$Sprite2D.material.set_shader_parameter("progress", 1)
	if health <= 0:
		explosion_active = true
		can_move = false
		$AnimationPlayer.play("explosion")

func _on_notice_area_body_entered(_body):
	pursuing_player = true

func _on_timer_timeout():
	vulnerable = true
	$Sprite2D.material.set_shader_parameter("progress", 0)
	
