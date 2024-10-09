extends ProgressBar

# The skill speed and current progress




#L: 1 * (L**2 + 1)


func _ready() -> void:
	self.value = StatHolder.farmingProgress
	
func _process(delta):
	if StatHolder.farmingToggle:
		# Increase the progress based on skill speed
		
		self.value = StatHolder.farmingProgress
		StatHolder.farmingProgress += StatHolder.farmingSkillMuli * delta

		# Clamp the progress to a maximum of 100
		if StatHolder.farmingProgress > 100:
			StatHolder.farmingProgress = 100
			#is_filling = false  # Stop filling when it reaches 100
			StatHolder.farmingProgress = 0
			StatHolder.farming += 1
			
			#print(skill_speed)

		# Set the progress bar value
		self.value = StatHolder.farmingProgress


func _on_farming_check_button_2_toggled(toggled_on: bool) -> void:
	StatHolder.farmingToggle = true
	StatHolder.miningToggle = false
	StatHolder.fishingToggle = false
	StatHolder.foragingToggle = false
