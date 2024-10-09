extends Node2D




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	StatHolder.miningSkillMulti = ((100 * pow(0.8, StatHolder.mining))
	* pow(2.0, (StatHolder.miningRebirthUpgrade * 1.0)) 
	* pow(2.0, (StatHolder.miningSkillUpgrade * 1.0))
	* pow(2.0, (StatHolder.skillRebirthUpgrade * 1.0)))
	
	StatHolder.miningMoneyMulti = StatHolder.MoneyminingStacks * pow(2.0, (StatHolder.moneyRebirthUpgrade * 1.0))
	StatHolder.miningMoneySpeed = ((StatHolder.mining * 2.5) * StatHolder.miningTool) * (1 + (StatHolder.strength * 0.025))
	
