extends Node2D




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	StatHolder.fishingSkillMulti = ((100 * pow(0.8, StatHolder.fishing)) 
	* pow(2.0, (StatHolder.fishingRebirthUpgrade * 1.0)) 
	* pow(2.0, (StatHolder.fishingSkillUpgrade * 1.0))
	* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0)))
	
	StatHolder.fishingMoneyMulti = StatHolder.MoneyfishingStacks * pow(2.0, (StatHolder.moneyRebirthUpgrade * 1.0))
	StatHolder.fishingMoneySpeed = ((StatHolder.fishing * 2.5) * StatHolder.fishingTool) * (1 + (StatHolder.strength * 0.025))
	
