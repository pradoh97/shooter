extends Node2D

signal particles_end

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = $GPUParticles2D.lifetime

func _on_timer_timeout():
	particles_end.emit()
