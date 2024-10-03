extends ProgressBar

# The skill speed and current progress


var skill_speed = (100 * pow(0.8, StatHolder.farming)) * pow(2.0, (StatHolder.farmingRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.farmingSkillUpgrade * 1.0)) * pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))

#L: 1 * (L**2 + 1)


func _ready() -> void:
	self.value = StatHolder.farmingProgress
	skill_speed = (100 * pow(0.8, StatHolder.farming)) * pow(2.0, (StatHolder.farmingRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.farmingSkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))
func _process(delta):
	if StatHolder.farmingToggle:
		# Increase the progress based on skill speed
		skill_speed = (100 * pow(0.8, StatHolder.farming)) * pow(2.0, (StatHolder.farmingRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.farmingSkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))
		self.value = StatHolder.farmingProgress
		StatHolder.farmingProgress += skill_speed * delta

		# Clamp the progress to a maximum of 100
		if StatHolder.farmingProgress > 100:
			StatHolder.farmingProgress = 100
			#is_filling = false  # Stop filling when it reaches 100
			StatHolder.farmingProgress = 0
			StatHolder.farming += 1
			skill_speed = (100 * pow(0.8, StatHolder.farming)) * pow(2.0, (StatHolder.farmingRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.farmingSkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))
			#print(skill_speed)

		# Set the progress bar value
		self.value = StatHolder.farmingProgress


func _on_farming_check_button_2_toggled(toggled_on: bool) -> void:
	StatHolder.farmingToggle = true
	StatHolder.miningToggle = false
	StatHolder.fishingToggle = false
	StatHolder.foragingToggle = false
