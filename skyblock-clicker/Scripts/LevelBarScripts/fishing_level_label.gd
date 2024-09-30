extends Label


func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.text = "Level: " + str(StatHolder.fishing)    # Set Skill
