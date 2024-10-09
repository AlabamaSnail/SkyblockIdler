extends ProgressBar

# The skill speed and current progress




#L: 1 * (L**2 + 1)

func _ready() -> void:
	self.value = StatHolder.foragingProgress
	
func _process(delta):
	if StatHolder.foragingToggle:
		# Increase the progress based on skill speed
		
		StatHolder.foragingProgress += StatHolder.foragingSkillMulti * delta
		# Clamp the progress to a maximum of 100
		if StatHolder.foragingProgress > 100:
			StatHolder.foragingProgress = 100
			#is_filling = false  # Stop filling when it reaches 100
			StatHolder.foragingProgress = 0
			StatHolder.foraging += 1
			#print(skill_speed)

		# Set the progress bar value
		self.value = StatHolder.foragingProgress


func _on_check_button_toggled(toggled_on: bool) -> void:
	StatHolder.farmingToggle = false
	StatHolder.miningToggle = false
	StatHolder.fishingToggle = false
	StatHolder.foragingToggle = true
