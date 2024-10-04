extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if StatHolder.skillRebirthUpgrade >= 2:
		self.disabled = true

func _on_pressed() -> void:
	if StatHolder.rebirthPoints >= 75:
		StatHolder.rebirthPoints -= 75
		StatHolder.skillRebirthUpgrade = 2
		self.disabled = true
	else:
		self.disabled = true
		await get_tree().create_timer(0.2).timeout
		self.disabled = false
