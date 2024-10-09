extends ProgressBar

# The skill speed and current progress

var label_stacks  # Reference to the "MForagingStacks" label

# Called when the node is added to the scene
func _ready():
	# Find the MForagingStacks label under the same parent and store reference
	label_stacks = get_parent().get_node("MMiningStacks")
	# Update the label with the initial stacks value
	_update_stacks_label()

# Update the MForagingStacks label text to display current stacks
func _update_stacks_label():
	label_stacks.text = "Money Per: $%s" % str(StatHolder.MoneyminingStacks)

# Called when the first button is pressed
func _on_m_mining_button_pressed():
	if not StatHolder.MoneyminingToggle and StatHolder.mining > 0:
		StatHolder.MoneyminingToggle = true  # Start filling the bar when the button is clicked

func _process(delta):
	_update_stacks_label()
	if StatHolder.MoneyminingToggle:
		# Update skill speed dynamically based on current foraging and tool stats
		# Increase the progress based on effective speed
		StatHolder.MoneyminingProgress += (StatHolder.miningMoneySpeed / StatHolder.MoneyminingStacks) * delta

		# Clamp the progress to a maximum of 100
		if StatHolder.MoneyminingProgress > 100:
			StatHolder.MoneyminingProgress = 100
			StatHolder.MoneyminingToggle = false  # Stop filling when it reaches 100
			StatHolder.MoneyminingProgress = 0
			StatHolder.money.plusEquals(StatHolder.miningMoneyMulti) # Add to money based on stacks

		# Set the progress bar value
		self.value = StatHolder.MoneyminingProgress

# Called when the second button is pressed
func _on_mm_stacks_up_pressed() -> void:
	if not StatHolder.MoneyminingToggle:
		# Recalculate the current skill speed at the moment the button is pressed
		
		# Check if skill speed is greater than 100 and apply stack doubling logic
		StatHolder.MoneyminingStacks *= 2  # Double the stacks value
		StatHolder.miningMoneySpeed -= 100  # Permanently subtract 100 from skill_speed
		_update_stacks_label()  # Update the label to reflect the new stacks value

# Called when the mf_stacks_down button is pressed (halves stacks and adds 100 to skill_speed)
func _on_mm_stacks_down_pressed() -> void:
	# Recalculate the current skill speed at the moment the button is pressed

	# Ensure stacks don't go below 1, and increase skill_speed if applicable
	if StatHolder.MoneyminingStacks > 1:
		StatHolder.MoneyminingStacks /= 2  # Halve the stacks value
		StatHolder.miningMoneySpeed += 100  # Add 100 back to skill_speed
		_update_stacks_label()  # Update the label to reflect the new stacks value


func _on_clickall_pressed() -> void:
	if not StatHolder.MoneyminingToggle and StatHolder.mining > 0:
		StatHolder.MoneyminingToggle = true  # Start filling the bar when the button is clicked
