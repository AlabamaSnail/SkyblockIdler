extends Label

var Health = 0

func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Health = (StatHolder.combat * 3) + (StatHolder.catacombs * 3) + (StatHolder.carpentry * 2) + (StatHolder.enchanting * 1) + (StatHolder.taming * 1) + (StatHolder.farming * 4) + (StatHolder.fishing * 3)

	self.text = "Health: " + str(Health)    # Set Skill




#Fishing - +3 hp + 2 str
#Farming - +4 hp
#Combat  - +3 hp +3 str
#Catacombs - +3 str +3 def +3 Health
#Carpentry +2 Health +1 Str
#Enchanting - +2 Int +1 Hp
#Taming - +1 Str +1 Hp +1 Int
