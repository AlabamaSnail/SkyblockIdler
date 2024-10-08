extends ProgressBar

# The skill speed and current progress


var skill_speed = (100 * pow(0.8, StatHolder.alchemy)) * pow(2.0, (StatHolder.alchemyRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.alchemySkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))

#L: 1 * (L**2 + 1)

func _ready() -> void:
	self.value = StatHolder.alchemyProgress
	skill_speed = (100 * pow(0.8, StatHolder.alchemy)) * pow(2.0, (StatHolder.alchemyRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.alchemySkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))
func _process(delta):
	
	
	
	if StatHolder.alchemyToggle:
		# Increase the progress based on skill speed
		skill_speed = (100 * pow(0.8, StatHolder.alchemy)) * pow(2.0, (StatHolder.alchemyRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.alchemySkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))
		self.value = StatHolder.alchemyProgress
		StatHolder.alchemyProgress += skill_speed * delta

		# Clamp the progress to a maximum of 100
		if StatHolder.alchemyProgress > 100:
			StatHolder.alchemyProgress = 100
			#is_filling = false  # Stop filling when it reaches 100
			StatHolder.alchemyProgress = 0
			StatHolder.alchemy += 1
			skill_speed = (100 * pow(0.8, StatHolder.alchemy)) * pow(2.0, (StatHolder.alchemyRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.alchemySkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))
			#print(skill_speed)
			StatHolder.alchemyToggle = false

		# Set the progress bar value
		self.value = StatHolder.alchemyProgress
		




func _on_alchemy_button_pressed() -> void:
	var cost = Big.new(StatHolder.alchemy ** 5 + 125)  # Calculate cost using Big
	if StatHolder.money.isGreaterThanOrEqualTo(cost):
		StatHolder.money.minusEquals(cost)
		StatHolder.alchemyToggle = true
	
