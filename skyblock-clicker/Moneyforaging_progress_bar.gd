extends ProgressBar

# The skill speed and current progress

var label_stacks  # Reference to the "MForagingStacks" label

# Called when the node is added to the scene
func _ready():
	# Find the MForagingStacks label under the same parent and store reference
	label_stacks = get_parent().get_node("MForagingStacks")
	# Update the label with the initial stacks value
	_update_stacks_label()

# Update the MForagingStacks label text to display current stacks
func _update_stacks_label():
	label_stacks.text = "Money Per: $%s" % StatHolder.MoneyforagingStacks.toAA()

# Called when the first button is pressed
func _on_m_foraging_button_pressed():
	if not StatHolder.MoneyforagingToggle and StatHolder.foraging > 0:
		StatHolder.MoneyforagingToggle = true  # Start filling the bar when the button is clicked

func _process(delta):
	_update_stacks_label()
	if StatHolder.MoneyforagingToggle:
		# Update skill speed dynamically based on current foraging and tool stats
		var skill_speed = Big.new((StatHolder.foraging * 2.5)).times(StatHolder.foragingTool).times(1 + (StatHolder.strength * 0.025))

		# Calculate effective speed based on stacks, which are only changed via the second button
		var effective_speed = skill_speed.dividedBy(StatHolder.MoneyforagingStacks)

		# Increase the progress based on effective speed
		StatHolder.MoneyforagingProgress = Big.new(StatHolder.MoneyforagingProgress).plus(effective_speed.times(delta))

		# Clamp the progress to a maximum of 100
		if StatHolder.MoneyforagingProgress.isGreaterThan(100):
			StatHolder.MoneyforagingProgress = Big.new(0)
			StatHolder.MoneyforagingToggle = false  # Stop filling when it reaches 100

			# Add to money based on stacks and rebirth multiplier
			var rebirth_multiplier = Big.new(2).toThePowerOf(StatHolder.moneyRebirthUpgrade)
			StatHolder.money = Big.new(StatHolder.money).plus(StatHolder.MoneyforagingStacks.times(rebirth_multiplier))

		# Set the progress bar value
		self.value = StatHolder.MoneyforagingProgress.toFloat()

# Called when the second button is pressed
func _on_m_foraging_button_2_pressed() -> void:
	if not StatHolder.MoneyforagingToggle:
		# Recalculate the current skill speed at the moment the button is pressed
		var skill_speed = Big.new((StatHolder.foraging * 2.5)).times(StatHolder.foragingTool).times(1 + (StatHolder.strength * 0.025))

		# Check if skill speed is greater than 100 and apply stack doubling logic
		StatHolder.MoneyforagingStacks = StatHolder.MoneyforagingStacks.times(2)
		skill_speed = skill_speed.minus(100)  # Permanently subtract 100 from skill_speed
		_update_stacks_label()  # Update the label to reflect the new stacks value

# Called when the mf_stacks_down button is pressed (halves stacks and adds 100 to skill_speed)
func _on_mf_stacks_down_pressed() -> void:
	# Recalculate the current skill speed at the moment the button is pressed
	var skill_speed = Big.new((StatHolder.foraging * 2.5)).times(StatHolder.foragingTool).times(1 + (StatHolder.strength * 0.025))

	# Ensure stacks don't go below 1, and increase skill_speed if applicable
	if StatHolder.MoneyforagingStacks.isGreaterThan(1):
		StatHolder.MoneyforagingStacks = StatHolder.MoneyforagingStacks.dividedBy(2)  # Halve the stacks value
		skill_speed = skill_speed.plus(100)  # Add 100 back to skill_speed
		_update_stacks_label()  # Update the label to reflect the new stacks value

# Called when the clickall button is pressed
func _on_clickall_pressed() -> void:
	if not StatHolder.MoneyforagingToggle and StatHolder.foraging > 0:
		StatHolder.MoneyforagingToggle = true  # Start filling the bar when the button is clicked
