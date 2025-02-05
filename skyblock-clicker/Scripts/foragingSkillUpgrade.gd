extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = "Lvl. " + str(StatHolder.foragingTool) + " Axe | $" + str(StatHolder.foragingTool ** 3 + 20)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$FBuyMaxButton.text = "Buy Max : " + str(calculate_max_upgrades())

func _on_pressed() -> void:
	if StatHolder.money >= (StatHolder.foragingTool ** 3 + 20):
		StatHolder.money -= (StatHolder.foragingTool ** 3 + 20)
		StatHolder.foragingTool += 1
		self.text = "Lvl. " + str(StatHolder.foragingTool) + " Axe | $" + str(StatHolder.foragingTool ** 3 + 20)
	else:
		self.disabled = true
		await get_tree().create_timer(0.2).timeout
		self.disabled = false

func calculate_max_upgrades() -> int:
	var upgrades = 0
	var money = StatHolder.money
	var cost = StatHolder.foragingTool ** 3 + 20

	# Calculate how many upgrades the player can afford
	while money >= cost:
		money -= cost
		upgrades += 1
		cost = (StatHolder.foragingTool + upgrades) ** 3 + 20 # Update cost for next upgrade
	return upgrades

func _on_buymaxbutton_pressed() -> void:
	var max_upgrades = calculate_max_upgrades()

	# Apply all the upgrades
	for i in range(max_upgrades):
		StatHolder.money -= (StatHolder.foragingTool ** 3 + 20)
		StatHolder.foragingTool += 1

	# Update the text to reflect the new level and cost
	self.text = "Lvl. " + str(StatHolder.foragingTool) + " Axe | $" + str(StatHolder.foragingTool ** 3 + 20)
