extends CharacterBody2D

const SPEED = 300.0
var noticed_player = false
var attack_player = false
var can_attack = false
var lives = 5

func _physics_process(_delta):
	var location_to_move = globals.player_pos - global_position
	look_at(globals.player_pos)
	velocity = location_to_move.normalized() * SPEED
	move_and_slide()

func _on_notice_area_body_entered(_body):
	$AnimatedSprite2D.play("walk")
	noticed_player = true

func _on_notice_area_body_exited(_body):
	$AnimatedSprite2D.stop()
	noticed_player = false

func _on_attack_area_body_entered(_body):
	$AnimatedSprite2D.play("attack")
	attack_player = true

func _on_attack_area_body_exited(_body):
	$AnimatedSprite2D.play("walk")
	attack_player = false
	
func _on_animated_sprite_2d_animation_looped():
	if attack_player:
		globals.health -= 10

func hit(damage):
	lives -= damage
	$AnimatedSprite2D.material.set_shader_parameter("progress", 1)
	$hit_shader_timer.start()
	if lives <= 0:
		queue_free()


func _on_hit_timer_timeout():
	$AnimatedSprite2D.material.set_shader_parameter("progress", 0)
