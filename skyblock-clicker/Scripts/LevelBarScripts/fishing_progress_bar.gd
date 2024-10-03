extends ProgressBar

# The skill speed and current progress


var skill_speed = (100 * pow(0.8, StatHolder.fishing)) * pow(2.0, (StatHolder.fishingRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.fishingSkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))
#L: 1 * (L**2 + 1)


func _ready() -> void:
	self.value = StatHolder.fishingProgress
	skill_speed = (100 * pow(0.8, StatHolder.fishing)) * pow(2.0, (StatHolder.fishingRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.fishingSkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))
func _process(delta):
	if StatHolder.fishingToggle:
		# Increase the progress based on skill speed
		skill_speed = (100 * pow(0.8, StatHolder.fishing)) * pow(2.0, (StatHolder.fishingRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.fishingSkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))
		self.value = StatHolder.fishingProgress
		StatHolder.fishingProgress += skill_speed * delta

		# Clamp the progress to a maximum of 100
		if StatHolder.fishingProgress > 100:
			StatHolder.fishingProgress = 100
			#is_filling = false  # Stop filling when it reaches 100
			StatHolder.fishingProgress = 0
			StatHolder.fishing += 1
			skill_speed = (100 * pow(0.8, StatHolder.fishing)) * pow(2.0, (StatHolder.fishingRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.fishingSkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))
			#print(skill_speed)

		# Set the progress bar value
		self.value = StatHolder.fishingProgress


func _on_fishing_check_button_3_toggled(toggled_on: bool) -> void:
	StatHolder.farmingToggle = false
	StatHolder.miningToggle = false
	StatHolder.fishingToggle = true
	StatHolder.foragingToggle = false
