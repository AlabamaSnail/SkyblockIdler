extends Label

var Defense = 0

func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Defense =  (StatHolder.foraging * 1) + (StatHolder.mining * 2) + (StatHolder.farming * 1) + (StatHolder.combat * 1) + (StatHolder.catacombs * 3)+ (StatHolder.alchemy * 1) + (StatHolder.runecrafting * 2)

	self.text = "Defense: " + str(Defense)    # Set Skill
