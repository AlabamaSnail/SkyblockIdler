extends Node2D

var RebirthNotUnlockedLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	RebirthNotUnlockedLabel = get_parent().get_node("BackgroundHolder").get_node("RebirthNotUnlocked")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if StatHolder.foraging >= 15 and StatHolder.mining >= 15 and StatHolder.fishing >= 15 and StatHolder.farming >= 15:
		StatHolder.rebirthUnlocked = true
		
	if StatHolder.rebirthUnlocked:
		self.visible = true
		RebirthNotUnlockedLabel.visible = false
	else:
		self.visible = false
		RebirthNotUnlockedLabel.visible = true
