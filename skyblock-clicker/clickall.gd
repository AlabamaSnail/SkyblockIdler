extends Button




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if StatHolder.buyAllButtonRunlock or StatHolder.buyAllButtonSRunlock:
		self.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if StatHolder.buyAllButtonRunlock or StatHolder.buyAllButtonSRunlock:
		self.visible = true
	else:
		self.visible = false
