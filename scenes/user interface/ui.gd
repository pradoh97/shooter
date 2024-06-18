extends CanvasLayer

@onready var laser_label : Label = $weapons_counter/laser/Label
@onready var granade_label : Label = $weapons_counter/granade/Label
@onready var health_bar : TextureProgressBar = $TextureProgressBar

func _ready():
	globals.connect("update_stats", update_stats)
	update_stats()

func update_laser_text():
	laser_label.text = str(globals.laser)
	if globals.laser == 0:
		$weapons_counter/laser.modulate = Color(1, 0, 0)
	else : $weapons_counter/granade.modulate = Color(1, 1, 1)

func update_granade_text():
	granade_label.text = str(globals.granade)
	if globals.granade == 0:
		$weapons_counter/granade.modulate = Color(1, 0, 0)
	else : $weapons_counter/granade.modulate = Color(1, 1, 1)

func update_health_bar():
	health_bar.value = globals.health
	#if globals.granade_amount == 0:
		#$weapons_counter/granade.modulate = Color(1, 0, 0)
func update_stats():
	update_granade_text()
	update_health_bar()
	update_laser_text()
