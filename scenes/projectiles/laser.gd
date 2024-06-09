extends Area2D

@export var speed : int = 2000
var direction: Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	if "hit" in body:
		body.hit()
	
	$shoot_particles/GPUParticles2D.emitting = true
	$shoot_particles/GPUParticles2D2.emitting = true
	
	$CollisionShape2D.disabled = true
	$LightOccluder2D.visible = false
	$Sprite2D.visible = false
	$PointLight2D.enabled = false
	$shoot_particles/Timer.start()
	
	speed=0


func _on_shoot_particles_particles_end():
	queue_free()
