extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if StatHolder.buyAllButtonRunlock:
		self.disabled = true

func _on_pressed() -> void:
	if StatHolder.rebirthPoints >= 500:
		StatHolder.rebirthPoints -= 500
		StatHolder.buyAllButtonRunlock = true
		self.disabled = true
	else:
		self.disabled = true
		await get_tree().create_timer(0.2).timeout
		self.disabled = false
