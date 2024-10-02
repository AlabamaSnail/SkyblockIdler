extends CheckButton
var toggled_on = false
func _on_toggled(toggled_on1: bool) -> void:
	toggled_on = toggled_on1

func _process(delta: float) -> void:
	if toggled_on:
		# Get the levels of each skill
		var foraging_level = StatHolder.foraging
		var farming_level = StatHolder.farming
		var fishing_level = StatHolder.fishing
		var mining_level = StatHolder.mining

		# Find the skill with the lowest level
		var lowest_skill = min(foraging_level, farming_level, fishing_level, mining_level)

		# Toggle the appropriate skill based on the lowest level
		if lowest_skill == foraging_level:
			StatHolder.foragingToggle = true
			StatHolder.farmingToggle = false
			StatHolder.fishingToggle = false
			StatHolder.miningToggle = false
		elif lowest_skill == farming_level:
			StatHolder.foragingToggle = false
			StatHolder.farmingToggle = true
			StatHolder.fishingToggle = false
			StatHolder.miningToggle = false
		elif lowest_skill == fishing_level:
			StatHolder.foragingToggle = false
			StatHolder.farmingToggle = false
			StatHolder.fishingToggle = true
			StatHolder.miningToggle = false
		elif lowest_skill == mining_level:
			StatHolder.foragingToggle = false
			StatHolder.farmingToggle = false
			StatHolder.fishingToggle = false
			StatHolder.miningToggle = true
		else:
			# If toggled off, stop all skill leveling
			StatHolder.foragingToggle = false
			StatHolder.farmingToggle = false
			StatHolder.fishingToggle = false
			StatHolder.miningToggle = false
