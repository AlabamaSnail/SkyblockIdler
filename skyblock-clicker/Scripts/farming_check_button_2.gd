extends CheckButton

func _ready():
	# Set the initial state of the CheckButton based on StatHolder.foragingToggle
	set_pressed(StatHolder.farmingToggle)

func _process(delta: float) -> void:
	# Continuously update the CheckButton state based on StatHolder.foragingToggle
	set_pressed(StatHolder.farmingToggle)
