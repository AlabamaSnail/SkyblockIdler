extends Node2D

var CraftingNotUnlockedLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CraftingNotUnlockedLabel = get_parent().get_node("BackgroundHolder").get_node("CraftingNotUnlocked")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if StatHolder.craftingUnlocked:
		self.visible = true
		CraftingNotUnlockedLabel.visible = false
	else:
		self.visible = false
		CraftingNotUnlockedLabel.visible = true
