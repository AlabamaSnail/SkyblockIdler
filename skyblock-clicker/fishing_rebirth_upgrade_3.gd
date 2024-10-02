extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = "Lvl. " + str(StatHolder.fishingRebirthUpgrade) + " Fishing Skill x2 : " + str(StatHolder.fishingRebirthUpgrade ** 3 + 1) + "P"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.text = "Lvl. " + str(StatHolder.fishingRebirthUpgrade) + " Fishing Skill x2 : " + str(StatHolder.fishingRebirthUpgrade ** 3 + 1) + "P"

func _on_pressed() -> void:
	if StatHolder.rebirthPoints >= (StatHolder.fishingRebirthUpgrade ** 3 + 1):
		StatHolder.rebirthPoints -= (StatHolder.fishingRebirthUpgrade ** 3 + 1)
		StatHolder.fishingRebirthUpgrade += 1
		self.text = "Lvl. " + str(StatHolder.fishingRebirthUpgrade) + " Fishing Skill x2 : " + str(StatHolder.fishingRebirthUpgrade ** 3 + 1) + "P"
	else:
		self.disabled = true
		await get_tree().create_timer(0.2).timeout
		self.disabled = false
