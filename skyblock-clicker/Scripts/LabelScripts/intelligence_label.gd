extends Label


func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	StatHolder.intelligence = (StatHolder.alchemy * 2) + (StatHolder.enchanting * 2) + (StatHolder.taming * 1) + (StatHolder.social * 1)

	self.text = "Intelligence: " + str(StatHolder.intelligence)    # Set Skill
