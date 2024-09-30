extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = "Lvl. " + str(StatHolder.foragingTool) + " Axe | $" + str(StatHolder.foragingTool ** 3 + 20)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	if StatHolder.money >= (StatHolder.foragingTool ** 3 + 20):
		StatHolder.money -= (StatHolder.foragingTool ** 3 + 20)
		StatHolder.foragingTool += 1
		self.text = "Lvl. " + str(StatHolder.foragingTool) + " Axe | $" + str(StatHolder.foragingTool ** 3 + 20)
	else:
		self.disabled = true
		await get_tree().create_timer(0.2).timeout
		self.disabled = false
