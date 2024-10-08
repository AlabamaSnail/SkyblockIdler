extends ProgressBar

# The skill speed and current progress


var skill_speed = (100 * pow(0.8, StatHolder.enchanting)) * pow(2.0, (StatHolder.enchantingRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.enchantingSkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))

#L: 1 * (L**2 + 1)

func _ready() -> void:
	self.value = StatHolder.enchantingProgress
	skill_speed = (100 * pow(0.8, StatHolder.enchanting)) * pow(2.0, (StatHolder.enchantingRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.enchantingSkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))
func _process(delta):
	
	
	
	if StatHolder.enchantingToggle:
		# Increase the progress based on skill speed
		skill_speed = (100 * pow(0.8, StatHolder.enchanting)) * pow(2.0, (StatHolder.enchantingRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.enchantingSkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))
		self.value = StatHolder.enchantingProgress
		StatHolder.enchantingProgress += skill_speed * delta

		# Clamp the progress to a maximum of 100
		if StatHolder.enchantingProgress > 100:
			StatHolder.enchantingProgress = 100
			#is_filling = false  # Stop filling when it reaches 100
			StatHolder.enchantingProgress = 0
			StatHolder.enchanting += 1
			skill_speed = (100 * pow(0.8, StatHolder.enchanting)) * pow(2.0, (StatHolder.enchantingRebirthUpgrade * 1.0)) * pow(2.0, (StatHolder.enchantingSkillUpgrade * 1.0))* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0))
			#print(skill_speed)
			StatHolder.enchantingToggle = false

		# Set the progress bar value
		self.value = StatHolder.enchantingProgress
		




func _on_enchanting_button_pressed() -> void:
	var cost = Big.new(StatHolder.enchanting ** 3 + 125)  # Calculate cost using Big
	if StatHolder.money.isGreaterThanOrEqualTo(cost):
		StatHolder.money.minusEquals(cost)
		StatHolder.enchantingToggle = true
	
