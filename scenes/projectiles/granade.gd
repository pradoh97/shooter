extends RigidBody2D

const speed = 750
var explosion_active : bool = false
var targets : Array = []

func explode():
	$AnimationPlayer.play("exploding")
	explosion_active = true

func _process(_delta):
	if explosion_active and targets.size():
		deal_damage()

func deal_damage():
	for target in targets:
		target.hit(0.25)

func _on_area_2d_body_entered(body):
	if body.has_method("hit"):
		targets.append(body)

func _on_area_2d_body_exited(body):
	if body.has_method("hit"):
		targets.pop_at(targets.find(body))
