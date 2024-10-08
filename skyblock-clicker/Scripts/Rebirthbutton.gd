extends Button

# Reference to the StatHolder for accessing skill levels and money
var maxMoneyRun = Big.new(0)

func _ready() -> void:
	# Initialize button text with current rebirth points
	update_rebirth_button_text()

# Function to calculate rebirth points based on skill levels and money
func calculate_rebirth_points() -> int:
	var total_skill_level = 0
	var skill_levels = [StatHolder.foraging, StatHolder.mining, StatHolder.farming, StatHolder.fishing, StatHolder.enchanting, StatHolder.alchemy, StatHolder.luck]
	
	for skill_level in skill_levels:
		total_skill_level += pow(skill_level, 1.5)  # Scaling factor for levels
	
	var money_factor = maxMoneyRun.plus(1).absLog10()

	# Calculate rebirth points and ensure a minimum of 1 rebirth point
	var points = int((total_skill_level * money_factor) * 0.001)
	return points

# Function called when the rebirth button is pressed
func _on_pressed() -> void:
	if can_rebirth():
		# Calculate rebirth points
		var points = calculate_rebirth_points()

		# Reset all skills, progress, and upgrades
		StatHolder.rebirthPoints += points
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
		StatHolder.alchemy = 0
		StatHolder.alchemyProgress = 0
		StatHolder.alchemySkillUpgrade = 0
		StatHolder.alchemyToggle = false
		StatHolder.luck = 0
		StatHolder.luckProgress = 0
		StatHolder.luckSkillUpgrade = 0
		StatHolder.luckToggle = false
		StatHolder.enchanting = 0
		StatHolder.enchantingProgress = 0
		StatHolder.enchantingSkillUpgrade = 0
		StatHolder.enchantingToggle = false
		
		# Reset upgrades and money
		StatHolder.money = Big.new(0)
		maxMoneyRun = Big.new(0)

		# Update the button text to show new rebirth points
		update_rebirth_button_text()

# Function to check if rebirth is allowed (all skills must be >= 15)
func can_rebirth() -> bool:
	return calculate_rebirth_points() > 0

# Function to update the rebirth button text
func update_rebirth_button_text() -> void:
	$PointsGainedLabel.text = "Points Gained: %d" % calculate_rebirth_points()

func _process(delta: float) -> void:
	update_rebirth_button_text()
	if StatHolder.money.isGreaterThanOrEqualTo(maxMoneyRun):
		maxMoneyRun = Big.new(StatHolder.money)
