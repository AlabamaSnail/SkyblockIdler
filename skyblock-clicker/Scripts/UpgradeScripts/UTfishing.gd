extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = "Lvl. " + str(StatHolder.fishingTool) + " Fishing Rod | $" + Big.new((StatHolder.fishingTool ** 3 + 20)).toAA()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$FFFBuyMaxButton.text = "Buy Max : " + str(calculate_max_upgrades())
	self.text = "Lvl. " + str(StatHolder.fishingTool) + " Fishing Rod | $" + Big.new((StatHolder.fishingTool ** 3 + 20)).toAA()

func _on_pressed() -> void:
	if StatHolder.money.isGreaterThanOrEqualTo(Big.new(StatHolder.fishingTool ** 3 + 20)):
		StatHolder.money.minusEquals(Big.new(StatHolder.fishingTool ** 3 + 20))
		StatHolder.fishingTool += 1
		self.text = "Lvl. " + str(StatHolder.fishingTool) + " Fishing Rod | $" + Big.new((StatHolder.fishingTool ** 3 + 20)).toAA()
	else:
		self.disabled = true
		await get_tree().create_timer(0.2).timeout
		self.disabled = false

func calculate_max_upgrades() -> int:
	var upgrades = 0
	var money = Big.new(StatHolder.money)  # Ensure money is a Big object
	var cost = Big.new(StatHolder.fishingTool ** 3 + 20)  # Convert cost to Big

	# Calculate how many upgrades the player can afford
	while money.isGreaterThanOrEqualTo(cost):
		money.minusEquals(cost)
		upgrades += 1
		cost = Big.new((StatHolder.fishingTool + upgrades) ** 3 + 20)  # Update and convert cost to Big
	return upgrades

func _on_fff_buy_max_button_pressed() -> void:
	var max_upgrades = calculate_max_upgrades()

	# Apply all the upgrades
	for i in range(max_upgrades):
		var upgrade_cost = Big.new(StatHolder.fishingTool ** 3 + 20)  # Convert to Big
		StatHolder.money.minusEquals(upgrade_cost)  # Subtract using Big operation
		StatHolder.fishingTool += 1

	# Update the text to reflect the new level and cost
	self.text = "Lvl. " + str(StatHolder.fishingTool) + " Fishing Rod | $" + Big.new((StatHolder.fishingTool ** 3 + 20)).toAA()
