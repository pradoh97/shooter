extends CanvasLayer

@onready var laser_label : Label = $weapons_counter/laser/Label
@onready var granade_label : Label = $weapons_counter/granade/Label

func _ready():
	update_granade_text()
	update_laser_text()

func update_laser_text():
	laser_label.text = str(globals.laser_amount)
	if globals.laser_amount == 0:
		$weapons_counter/laser.modulate = Color(1, 0, 0)

func update_granade_text():
	granade_label.text = str(globals.granade_amount)
	if globals.granade_amount == 0:
		$weapons_counter/granade.modulate = Color(1, 0, 0)
