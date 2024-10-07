extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_button_text()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$FBuyMaxButton.text = "Buy Max : " + str(calculate_max_upgrades())
	update_button_text()

func _on_pressed() -> void:
	var cost = Big.new(StatHolder.foragingTool ** 3 + 20)  # Calculate cost using Big
	if StatHolder.money.isGreaterThanOrEqualTo(cost):
		StatHolder.money.minusEquals(cost)
		StatHolder.foragingTool += 1
		update_button_text()
	else:
		self.disabled = true
		await get_tree().create_timer(0.2).timeout
		self.disabled = false

func calculate_max_upgrades() -> int:
	var upgrades = 0
	var money = Big.new(StatHolder.money)  # Ensure money is a Big object
	var cost = Big.new(StatHolder.foragingTool ** 3 + 20)  # Convert cost to Big

	# Calculate how many upgrades the player can afford
	while money.isGreaterThanOrEqualTo(cost):
		money.minusEquals(cost)
		upgrades += 1
		cost = Big.new((StatHolder.foragingTool + upgrades) ** 3 + 20)  # Convert updated cost to Big
	return upgrades

func _on_buymaxbutton_pressed() -> void:
	var max_upgrades = calculate_max_upgrades()

	# Apply all the upgrades
	for i in range(max_upgrades):
		var upgrade_cost = Big.new(StatHolder.foragingTool ** 3 + 20)  # Convert to Big
		StatHolder.money.minusEquals(upgrade_cost)  # Subtract using Big operation
		StatHolder.foragingTool += 1

	# Update the text to reflect the new level and cost
	update_button_text()

func update_button_text() -> void:
	var cost = Big.new(StatHolder.foragingTool ** 3 + 20)  # Calculate cost using Big
	self.text = "Lvl. " + str(StatHolder.foragingTool) + " Axe | $" + cost.toAA()
