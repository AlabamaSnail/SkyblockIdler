extends Button

func _ready() -> void:
	update_buy_all_button_text()

func _process(delta: float) -> void:
	update_buy_all_button_text()

func _on_pressed() -> void:
	buy_all_tools_evenly()

func update_buy_all_button_text() -> void:
	var total_upgrades = calculate_total_possible_upgrades()
	self.text = "Buy All : " + str(total_upgrades)

func calculate_total_possible_upgrades() -> int:
	var farming = StatHolder.farmingTool
	var fishing = StatHolder.fishingTool
	var foraging = StatHolder.foragingTool
	var mining = StatHolder.miningTool

	# Create a copy of the player's money by creating a new Big instance
	var money = Big.new(StatHolder.money)  # Duplicate the money value
	var upgrades = 0

	while true:
		var lowest_tool = get_temp_lowest_tool_level(farming, fishing, foraging, mining)
		var cost = Big.new(calculate_tool_upgrade_cost(lowest_tool, farming, fishing, foraging, mining))
		
		if money.isGreaterThanOrEqualTo(cost):
			money.minusEquals(cost) # Modify the copy, not the actual player's money
			upgrades += 1
			match lowest_tool:
				"farming":
					farming += 1
				"fishing":
					fishing += 1
				"foraging":
					foraging += 1
				"mining":
					mining += 1
		else:
			break

	return upgrades

func buy_all_tools_evenly() -> void:
	var farming = StatHolder.farmingTool
	var fishing = StatHolder.fishingTool
	var foraging = StatHolder.foragingTool
	var mining = StatHolder.miningTool

	var money = StatHolder.money

	while true:
		var lowest_tool = get_temp_lowest_tool_level(farming, fishing, foraging, mining)
		var cost = Big.new(calculate_tool_upgrade_cost(lowest_tool, farming, fishing, foraging, mining))
		
		if money.isGreaterThanOrEqualTo(cost):
			money.minusEquals(cost)
			match lowest_tool:
				"farming":
					farming += 1
					StatHolder.farmingTool += 1
				"fishing":
					fishing += 1
					StatHolder.fishingTool += 1
				"foraging":
					foraging += 1
					StatHolder.foragingTool += 1
				"mining":
					mining += 1
					StatHolder.miningTool += 1
		else:
			break

	# Update money after purchasing all upgrades
	StatHolder.money = money

func get_temp_lowest_tool_level(farming, fishing, foraging, mining) -> String:
	var levels = {
		"farming": farming,
		"fishing": fishing,
		"foraging": foraging,
		"mining": mining
	}

	var lowest_tool = "farming"
	var lowest_level = farming

	for tool in levels.keys():
		if levels[tool] < lowest_level:
			lowest_tool = tool
			lowest_level = levels[tool]

	return lowest_tool

func calculate_tool_upgrade_cost(tool_name: String, farming, fishing, foraging, mining) -> Big:
	match tool_name:
		"farming":
			return Big.new(farming ** 3 + 20)
		"fishing":
			return Big.new(fishing ** 3 + 20)
		"foraging":
			return Big.new(foraging ** 3 + 20)
		"mining":
			return Big.new(mining ** 3 + 20)
	return Big.new(0)
