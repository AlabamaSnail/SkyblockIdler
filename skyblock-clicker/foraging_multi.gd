extends Node2D




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	StatHolder.foragingSkillMulti = ((100 * pow(0.8, StatHolder.foraging)) 
	* pow(2.0, (StatHolder.foragingRebirthUpgrade * 1.0)) 
	* pow(2.0, (StatHolder.foragingSkillUpgrade * 1.0))
	* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0)))
	
	StatHolder.foragingMoneyMulti = StatHolder.MoneyforagingStacks  * pow(2.0, (StatHolder.moneyRebirthUpgrade * 1.0))
	StatHolder.foragingMoneySpeed = ((StatHolder.foraging * 2.5) * StatHolder.foragingTool * (1 + (StatHolder.strength * 0.025)))
	
