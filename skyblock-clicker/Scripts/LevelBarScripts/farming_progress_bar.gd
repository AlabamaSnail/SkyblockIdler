extends ProgressBar

# The skill speed and current progress


var skill_speed = 100 * pow(0.8, StatHolder.farming)

#L: 1 * (L**2 + 1)

var current_progress = 0.0


func _process(delta):
	if StatHolder.farmingToggle:
		# Increase the progress based on skill speed
		current_progress += skill_speed * delta

		# Clamp the progress to a maximum of 100
		if current_progress > 100:
			current_progress = 100
			#is_filling = false  # Stop filling when it reaches 100
			current_progress = 0
			StatHolder.farming += 1
			skill_speed = 100 * pow(0.8, StatHolder.farming)
			#print(skill_speed)

		# Set the progress bar value
		self.value = current_progress


func _on_farming_check_button_2_toggled(toggled_on: bool) -> void:
	StatHolder.farmingToggle = true
	StatHolder.miningToggle = false
	StatHolder.fishingToggle = false
	StatHolder.foragingToggle = false
