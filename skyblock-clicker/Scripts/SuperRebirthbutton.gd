extends Button

# Reference to the StatHolder for accessing skill levels and money
var test = 0
var maxRebirthPoints = 0
func _ready() -> void:
	# Initialize button text with current rebirth points
	update_rebirth_button_text()

# Function to calculate rebirth points based on skill levels and money
func calculate_rebirth_points() -> int:
	var total_skill_level = 0
	var skill_levels = [StatHolder.foraging, StatHolder.mining, StatHolder.farming, StatHolder.fishing]
	
	for skill_level in skill_levels:
		total_skill_level += pow(skill_level, 1.5)  # Scaling factor for levels
	
	
	# Calculate rebirth points and ensure a minimum of 1 rebirth point
	var points = int((total_skill_level * StatHolder.rebirthPoints) * 0.000001)
	return points  # Ensure at least 1 rebirth point if all conditions are met

# Function called when the rebirth button is pressed
func _on_pressed() -> void:
	if can_rebirth():
		# Calculate rebirth points

		# Reset all skills, progress, and upgrades
		StatHolder.rebirthPoints = 0
		StatHolder.foraging = 0
		StatHolder.mining = 0
		StatHolder.farming = 0
		StatHolder.fishing = 0
		StatHolder.foragingProgress = 0
		StatHolder.miningProgress = 0
		StatHolder.farmingProgress = 0
		StatHolder.fishingProgress = 0
		StatHolder.foragingTool = 1
		StatHolder.miningTool = 1
		StatHolder.farmingTool = 1
		StatHolder.fishingTool = 1
		StatHolder.MoneyfarmingProgress = 0
		StatHolder.MoneyforagingProgress = 0
		StatHolder.MoneyfishingProgress = 0
		StatHolder.MoneyminingProgress = 0
		StatHolder.MoneyfarmingStacks = 1
		StatHolder.MoneyforagingStacks = 1
		StatHolder.MoneyfishingStacks = 1
		StatHolder.MoneyminingStacks = 1
		StatHolder.foragingSkillUpgrade = 0
		StatHolder.farmingSkillUpgrade = 0
		StatHolder.fishingSkillUpgrade = 0
		StatHolder.miningSkillUpgrade = 0
		# Reset upgrades and money
		StatHolder.money = Big.new(0)
		StatHolder.buyAllButtonRunlock = false
		
		StatHolder.rebirthPoints = 0
		StatHolder.moneyRebirthUpgrade = 0
		StatHolder.skillRebirthUpgrade = 0
		StatHolder.miningRebirthUpgrade = 0
		StatHolder.foragingRebirthUpgrade = 0
		StatHolder.farmingRebirthUpgrade = 0
		StatHolder.fishingRebirthUpgrade = 0
		StatHolder.craftingUnlocked = true
		StatHolder.combatUnlocked = true
		
		StatHolder.superRebirthPoints += calculate_rebirth_points()
		maxRebirthPoints = 0

		# Update the button text to show new rebirth points
		update_rebirth_button_text()

# Function to check if rebirth is allowed (all skills must be >= 15)
func can_rebirth() -> bool:
	return calculate_rebirth_points() > 0

# Function to update the rebirth button text
func update_rebirth_button_text() -> void:
	$PointsGainedLabel.text = " Super Points Gained: %d" % calculate_rebirth_points()
	
	
func _process(delta: float) -> void:
	update_rebirth_button_text()
	if StatHolder.rebirthPoints >= maxRebirthPoints:
		maxRebirthPoints = StatHolder.rebirthPoints
