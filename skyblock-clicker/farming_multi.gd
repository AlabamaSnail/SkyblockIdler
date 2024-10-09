extends Node2D




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	StatHolder.farmingSkillMuli = ((100 * pow(0.8, StatHolder.farming)) 
	* pow(2.0, (StatHolder.farmingRebirthUpgrade * 1.0)) 
	* pow(2.0, (StatHolder.farmingSkillUpgrade * 1.0)) 
	* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0)))
	
	StatHolder.farmingMoneyMulti = StatHolder.MoneyfarmingStacks * pow(2.0, (StatHolder.moneyRebirthUpgrade * 1.0))
	StatHolder.farmingMoneySpeed = ((StatHolder.farming * 2.5) * StatHolder.farmingTool) * (1 + (StatHolder.strength * 0.025))
	
