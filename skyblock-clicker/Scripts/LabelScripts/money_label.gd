extends Label

var Money = Big.new(0, 0)
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Money = Big.new(StatHolder.money)
	Money.setSuffixSeparator(" ")
	Money.setDecimalSeparator(".")
	Money.setThousandDecimals(1)  # Defaults to 2  
	self.text = "Money: $" + str(Money.toAA())    # Set Skill




#Fishing - +3 hp + 2 str
#Farming - +4 hp
#Combat  - +3 hp +3 str
#Catacombs - +3 str +3 def +3 Health
#Carpentry +2 Health +1 Str
#Enchanting - +2 Int +1 Hp
#Taming - +1 Str +1 Hp +1 Int
