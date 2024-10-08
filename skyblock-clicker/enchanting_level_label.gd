extends Label


func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.text = "Level: " + str(StatHolder.enchanting) + "| Cost: $" + Big.new(StatHolder.enchanting ** 3 + 125).toAA()    # Set Skill
