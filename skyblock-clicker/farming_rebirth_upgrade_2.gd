extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = "Lvl. " + str(StatHolder.farmingRebirthUpgrade) + " Farming Skill x2 : " + str(StatHolder.farmingRebirthUpgrade ** 2 + 1) + "P"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.text = "Lvl. " + str(StatHolder.farmingRebirthUpgrade) + " Farming Skill x2 : " + str(StatHolder.farmingRebirthUpgrade ** 2 + 1) + "P"

func _on_pressed() -> void:
	if StatHolder.rebirthPoints >= (StatHolder.farmingRebirthUpgrade ** 2 + 1):
		StatHolder.rebirthPoints -= (StatHolder.farmingRebirthUpgrade ** 2 + 1)
		StatHolder.farmingRebirthUpgrade += 1
		self.text = "Lvl. " + str(StatHolder.farmingRebirthUpgrade) + " Farming Skill x2 : " + str(StatHolder.farmingRebirthUpgrade ** 2 + 1) + "P"
	else:
		self.disabled = true
		await get_tree().create_timer(0.2).timeout
		self.disabled = false
