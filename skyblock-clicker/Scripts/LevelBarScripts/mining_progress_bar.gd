extends ProgressBar

# The skill speed and current progress



#L: 1 * (L**2 + 1)


func _ready() -> void:
	self.value = StatHolder.miningProgress
func _process(delta):
	if StatHolder.miningToggle:
		# Increase the progress based on skill speed
		self.value = StatHolder.miningProgress
		StatHolder.miningProgress += StatHolder.miningSkillMulti * delta

		# Clamp the progress to a maximum of 100
		if StatHolder.miningProgress > 100:
			StatHolder.miningProgress = 100
			#is_filling = false  # Stop filling when it reaches 100
			StatHolder.miningProgress = 0
			StatHolder.mining += 1
			#print(skill_speed)

		# Set the progress bar value
		self.value = StatHolder.miningProgress


func _on_mining_check_button_toggled(toggled_on: bool) -> void:
	StatHolder.foragingToggle = false
	StatHolder.farmingToggle = false
	StatHolder.fishingToggle = false
	StatHolder.miningToggle = true
