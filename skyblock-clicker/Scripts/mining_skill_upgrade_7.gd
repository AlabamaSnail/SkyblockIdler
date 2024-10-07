extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = "Lvl. " + str(StatHolder.miningSkillUpgrade) + " Mining Skill x2 : $" + Big.new((StatHolder.miningSkillUpgrade ** 4 + 200) / 2).toAA()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.text = "Lvl. " + str(StatHolder.miningSkillUpgrade) + " Mining Skill x2 : $" + Big.new((StatHolder.miningSkillUpgrade ** 4 + 200) / 2).toAA()

func _on_pressed() -> void:
	var cost = Big.new((StatHolder.miningSkillUpgrade ** 4 + 200) / 2)
	if StatHolder.money.isGreaterThanOrEqualTo(cost):
		StatHolder.money.minusEquals(cost)
		StatHolder.miningSkillUpgrade += 1
		self.text = "Lvl. " + str(StatHolder.miningSkillUpgrade) + " Mining Skill x2 : $" + Big.new((StatHolder.miningSkillUpgrade ** 4 + 200) / 2).toAA()
	else:
		self.disabled = true
		await get_tree().create_timer(0.2).timeout
		self.disabled = false
