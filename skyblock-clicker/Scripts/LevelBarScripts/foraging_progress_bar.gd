extends ProgressBar

# The skill speed and current progress


var skill_speed = 100 * pow(0.8 , StatHolder.foraging)

#L: 1 * (L**2 + 1)

func _ready() -> void:
	self.value = StatHolder.foragingProgress
	skill_speed = 100 * pow(0.8 , StatHolder.foraging)
func _process(delta):
	if StatHolder.foragingToggle:
		# Increase the progress based on skill speed
		skill_speed = 100 * pow(0.8 , StatHolder.foraging)
		self.value = StatHolder.foragingProgress
		StatHolder.foragingProgress += skill_speed * delta

		# Clamp the progress to a maximum of 100
		if StatHolder.foragingProgress > 100:
			StatHolder.foragingProgress = 100
			#is_filling = false  # Stop filling when it reaches 100
			StatHolder.foragingProgress = 0
			StatHolder.foraging += 1
			skill_speed = 100 * pow(0.8, StatHolder.foraging)
			#print(skill_speed)

		# Set the progress bar value
		self.value = StatHolder.foragingProgress


func _on_check_button_toggled(toggled_on: bool) -> void:
	StatHolder.farmingToggle = false
	StatHolder.miningToggle = false
	StatHolder.fishingToggle = false
	StatHolder.foragingToggle = true
