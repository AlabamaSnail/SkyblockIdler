extends ProgressBar

# The skill speed and current progress


var skill_speed = (100 * pow(0.8, StatHolder.luck)) * pow(2.0, (StatHolder.luckRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.luckSkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))

#L: 1 * (L**2 + 1)

func _ready() -> void:
	self.value = StatHolder.luckProgress
	skill_speed = (100 * pow(0.8, StatHolder.luck)) * pow(2.0, (StatHolder.luckRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.luckSkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))
func _process(delta):
	
	
	
	if StatHolder.luckToggle:
		# Increase the progress based on skill speed
		skill_speed = (100 * pow(0.8, StatHolder.luck)) * pow(2.0, (StatHolder.luckRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.luckSkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))
		self.value = StatHolder.luckProgress
		StatHolder.luckProgress += skill_speed * delta

		# Clamp the progress to a maximum of 100
		if StatHolder.luckProgress > 100:
			StatHolder.luckProgress = 100
			#is_filling = false  # Stop filling when it reaches 100
			StatHolder.luckProgress = 0
			StatHolder.luck += 1
			skill_speed = (100 * pow(0.8, StatHolder.luck)) * pow(2.0, (StatHolder.luckRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.luckSkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))
			#print(skill_speed)
			StatHolder.luckToggle = false

		# Set the progress bar value
		self.value = StatHolder.luckProgress
		




func _on_alchemy_button_pressed() -> void:
	var cost = Big.new(StatHolder.luck ** 10 + 1000)  # Calculate cost using Big
	if StatHolder.money.isGreaterThanOrEqualTo(cost):
		StatHolder.money.minusEquals(cost)
		StatHolder.luckToggle = true
	
