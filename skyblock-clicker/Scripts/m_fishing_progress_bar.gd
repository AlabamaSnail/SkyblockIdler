extends ProgressBar

# The skill speed and current progress
var label_stacks  # Reference to the "MForagingStacks" label

# Called when the node is added to the scene
func _ready():
	# Find the MForagingStacks label under the same parent and store reference
	label_stacks = get_parent().get_node("MFishingStacks")
	# Update the label with the initial stacks value
	_update_stacks_label()

# Update the MForagingStacks label text to display current stacks
func _update_stacks_label():
	label_stacks.text = "Money Per: $%s" % str(StatHolder.MoneyfishingStacks)

# Called when the first button is pressed
func _on_m_fishing_button_pressed():
	if not StatHolder.MoneyfishingToggle and StatHolder.fishing > 0:
		StatHolder.MoneyfishingToggle = true  # Start filling the bar when the button is clicked

func _process(delta):
	_update_stacks_label()
	if StatHolder.MoneyfishingToggle:
		# Update skill speed dynamically based on current foraging and tool stats

		# Calculate effective speed based on stacks, which are only changed via the second button
		
		# Increase the progress based on effective speed
		StatHolder.MoneyfishingProgress += (StatHolder.fishingMoneySpeed / StatHolder.MoneyfishingStacks) * delta

		# Clamp the progress to a maximum of 100
		if StatHolder.MoneyfishingProgress > 100:
			StatHolder.MoneyfishingProgress = 100
			StatHolder.MoneyfishingToggle = false  # Stop filling when it reaches 100
			StatHolder.MoneyfishingProgress = 0
			StatHolder.money.plusEquals(StatHolder.fishingMoneyMulti)  # Add to money based on stacks

		# Set the progress bar value
		self.value = StatHolder.MoneyfishingProgress

# Called when the second button is pressed
func _on_m_fish_stacks_up_pressed() -> void:
	if not StatHolder.MoneyfishingToggle:
		# Recalculate the current skill speed at the moment the button is pressed
		
		# Check if skill speed is greater than 100 and apply stack doubling logic
		StatHolder.MoneyfishingStacks *= 2  # Double the stacks value
		StatHolder.fishingMoneySpeed -= 100  # Permanently subtract 100 from skill_speed
		_update_stacks_label()  # Update the label to reflect the new stacks value

# Called when the mf_stacks_down button is pressed (halves stacks and adds 100 to skill_speed)
func _on_m_fish_stacks_down_pressed() -> void:
	# Recalculate the current skill speed at the moment the button is pressed

	# Ensure stacks don't go below 1, and increase skill_speed if applicable
	if StatHolder.MoneyfishingStacks > 1:
		StatHolder.MoneyfishingStacks /= 2  # Halve the stacks value
		StatHolder.fishingMoneySpeed += 100  # Add 100 back to skill_speed
		_update_stacks_label()  # Update the label to reflect the new stacks value


func _on_clickall_pressed() -> void:
	if not StatHolder.MoneyfishingToggle and StatHolder.fishing > 0:
		StatHolder.MoneyfishingToggle = true  # Start filling the bar when the button is clicked
