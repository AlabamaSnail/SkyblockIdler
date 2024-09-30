extends ProgressBar

# The skill speed and current progress
var skill_speed = 100 * pow(0.8, StatHolder.mining)
var current_progress = 0.0
var is_filling = false  # Flag to control when to fill the bar

# Called when the button is pressed
func _on_mining_button_pressed():
	#print(StatHolder.foraging)
	if not is_filling:
		is_filling = true  # Start filling the bar when the button is clicked

func _process(delta):
	if is_filling:
		# Increase the progress based on skill speed
		current_progress += skill_speed * delta

		# Clamp the progress to a maximum of 100
		if current_progress > 100:
			current_progress = 100
			is_filling = false  # Stop filling when it reaches 100
			current_progress = 0
			StatHolder.mining += 1
			skill_speed = 100 * pow(0.8, StatHolder.mining)
			#print(skill_speed)

		# Set the progress bar value
		self.value = current_progress
