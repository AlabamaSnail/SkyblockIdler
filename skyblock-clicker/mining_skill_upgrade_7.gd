extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = "Lvl. " + str(StatHolder.miningSkillUpgrade) + " Mining Skill x2 : $" + str((StatHolder.miningSkillUpgrade ** 4 + 200) / 2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.text = "Lvl. " + str(StatHolder.miningSkillUpgrade) + " Mining Skill x2 : $" + str((StatHolder.miningSkillUpgrade ** 4 + 200) / 2)

func _on_pressed() -> void:
	if StatHolder.money >= ((StatHolder.miningSkillUpgrade ** 4 + 200) / 2):
		StatHolder.money -= ((StatHolder.miningSkillUpgrade ** 4 + 200) / 2)
		StatHolder.miningSkillUpgrade += 1
		self.text = "Lvl. " + str(StatHolder.miningSkillUpgrade) + " Mining Skill x2 : $" + str((StatHolder.miningSkillUpgrade ** 4 + 200) / 2)
	else:
		self.disabled = true
		await get_tree().create_timer(0.2).timeout
		self.disabled = false
