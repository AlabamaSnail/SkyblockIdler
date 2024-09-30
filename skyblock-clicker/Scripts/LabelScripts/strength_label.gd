extends Label



func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	StatHolder.strength = (StatHolder.foraging * 2) + (StatHolder.mining * 1) + (StatHolder.farming * 1) + (StatHolder.fishing * 2) + (StatHolder.combat * 3) + (StatHolder.catacombs * 3) + (StatHolder.runecrafting * 1) + (StatHolder.carpentry * 1) + (StatHolder.taming * 1)

	self.text = "Strength: " + str(StatHolder.strength)    # Set Skill

#Foraging 2
#Mining 1
#Farming 1
#Fishing 2
#Combat 3
#Catacombs 3
#Runcrafting 1
#Carpentry 1
#Taming 1
