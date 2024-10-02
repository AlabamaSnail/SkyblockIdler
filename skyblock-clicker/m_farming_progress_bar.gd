extends ProgressBar

# The skill speed and current progress
var label_stacks  # Reference to the "MForagingStacks" label

# Called when the node is added to the scene
func _ready():
	# Find the MForagingStacks label under the same parent and store reference
	label_stacks = get_parent().get_node("MFarmingStacks")
	# Update the label with the initial stacks value
	_update_stacks_label()

# Update the MForagingStacks label text to display current stacks
func _update_stacks_label():
	label_stacks.text = "Money Per: $%s" % str(StatHolder.MoneyfarmingStacks )

# Called when the first button is pressed
func _on_m_farming_button_pressed():
	if not StatHolder.MoneyfarmingToggle and StatHolder.farming > 0:
		StatHolder.MoneyfarmingToggle = true  # Start filling the bar when the button is clicked

func _process(delta):
	_update_stacks_label()
	if StatHolder.MoneyfarmingToggle:
		# Update skill speed dynamically based on current foraging and tool stats
		var skill_speed = ((StatHolder.farming * 2.5) * StatHolder.farmingTool) * (1 + (StatHolder.strength * 0.025))

		# Calculate effective speed based on stacks, which are only changed via the second button
		
		# Increase the progress based on effective speed
		StatHolder.MoneyfarmingProgress += (skill_speed / StatHolder.MoneyfarmingStacks ) * delta

		# Clamp the progress to a maximum of 100
		if StatHolder.MoneyfarmingProgress > 100:
			StatHolder.MoneyfarmingProgress = 100
			StatHolder.MoneyfarmingToggle = false  # Stop filling when it reaches 100
			StatHolder.MoneyfarmingProgress = 0
			StatHolder.money += StatHolder.MoneyfarmingStacks   # Add to money based on stacks

		# Set the progress bar value
		self.value = StatHolder.MoneyfarmingProgress

# Called when the second button is pressed
func _on_mf_stacks_up_pressed() -> void:
	if not StatHolder.MoneyfarmingToggle:
		# Recalculate the current skill speed at the moment the button is pressed
		var skill_speed = ((StatHolder.farming * 2.5) * StatHolder.farmingTool) * (1 + (StatHolder.strength * 0.025))
		
		# Check if skill speed is greater than 100 and apply stack doubling logic
		StatHolder.MoneyfarmingStacks  *= 2  # Double the stacks value
		skill_speed -= 100  # Permanently subtract 100 from skill_speed
		_update_stacks_label()  # Update the label to reflect the new stacks value

# Called when the mf_stacks_down button is pressed (halves stacks and adds 100 to skill_speed)
func _on_mf_stacks_down_pressed() -> void:
	# Recalculate the current skill speed at the moment the button is pressed
	var skill_speed = ((StatHolder.farming * 2.5) * StatHolder.farmingTool) * (1 + (StatHolder.strength * 0.025))

	# Ensure stacks don't go below 1, and increase skill_speed if applicable
	if StatHolder.MoneyfarmingStacks  > 1:
		StatHolder.MoneyfarmingStacks  /= 2  # Halve the stacks value
		skill_speed += 100  # Add 100 back to skill_speed
		_update_stacks_label()  # Update the label to reflect the new stacks value


func _on_clickall_pressed() -> void:
	if not StatHolder.MoneyfarmingToggle and StatHolder.farming > 0:
		StatHolder.MoneyfarmingToggle = true  # Start filling the bar when the button is clicked
