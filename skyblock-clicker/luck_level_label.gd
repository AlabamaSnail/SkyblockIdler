extends Label


func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.text = "Level: " + str(StatHolder.luck) + "| Cost: $" + Big.new(StatHolder.luck ** 10 + 1000).toAA()    # Set Skill
