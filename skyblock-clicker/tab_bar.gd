extends TabBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_tab_selected(tab: int) -> void:
	if tab == 0:
		$ToolUpgradeTab.visible = true
		$SkillUpgrades.visible = false
		$MiscUpgrades.visible = false
	if tab == 1:
		$ToolUpgradeTab.visible = false
		$SkillUpgrades.visible = true
		$MiscUpgrades.visible = false
	if tab == 2:
		$ToolUpgradeTab.visible = false
		$SkillUpgrades.visible = false
		$MiscUpgrades.visible = true
