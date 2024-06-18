extends RigidBody2D

const speed = 750
var explosion_active : bool = false
var targets : Array = []

func explode():
	$AnimationPlayer.play("exploding")
	explosion_active = true

func _process(_delta):
	if explosion_active:
		if targets.size():
			deal_damage()

func deal_damage():
	for target in targets:
		if(target.has_method("hit")):
			target.hit(0.25)

func _on_area_2d_body_entered(body):
	targets.append(body)

func _on_area_2d_body_exited(body):
	targets.pop_at(targets.find(body))
