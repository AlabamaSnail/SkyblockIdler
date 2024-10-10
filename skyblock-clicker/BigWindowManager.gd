extends Node2D

# Crafting
var CraftingNotUnlockedLabel
var CraftingBackground
var CraftingStuff

# Info
var InfoBackground
var InfoLabels

# Combat
var CombatBackground
var CombatNotUnlockedLabel
var CombatStuff
# Options



var Everything
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Crafting
	CraftingNotUnlockedLabel = get_parent().get_node("BackgroundHolder").get_node("CraftingNotUnlocked")
	CraftingBackground = get_parent().get_node("BackgroundHolder").get_node("CraftingBackground")
	CraftingStuff = get_parent().get_node("Crafting")
	# Combat
	CombatNotUnlockedLabel = get_parent().get_node("BackgroundHolder").get_node("CombatNotUnlocked")
	CombatBackground = get_parent().get_node("BackgroundHolder").get_node("CombatBackground")
	CombatStuff = get_parent().get_node("Combat")
	# Info
	InfoBackground = get_parent().get_node("BackgroundHolder").get_node("InfoBackground")
	InfoLabels = get_parent().get_node("BackgroundHolder").get_node("InfoLabels")


	Everything = [CraftingNotUnlockedLabel, CraftingBackground, CombatNotUnlockedLabel, CombatBackground, InfoBackground, InfoLabels, CraftingStuff, CombatStuff]
	
	
	for i in Everything:
		i.visible = false
	InfoBackground.visible = true
	InfoLabels.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_options_pressed() -> void:
	for i in Everything:
		i.visible = false


func _on_combat_pressed() -> void:
	for i in Everything:
		i.visible = false
	CombatBackground.visible = true
	combat_menu()


func _on_crafting_pressed() -> void:
	for i in Everything:
		i.visible = false
	CraftingBackground.visible = true
	crafting_menu()
	



func _on_info_button_pressed() -> void:
	for i in Everything:
		i.visible = false
	InfoBackground.visible = true
	InfoLabels.visible = true


func crafting_menu() -> void:
	if StatHolder.craftingUnlocked:
		CraftingNotUnlockedLabel.visible = false
		CraftingStuff.visible = true
	else:
		CraftingNotUnlockedLabel.visible = true
		CraftingStuff.visible = false
		
func combat_menu() -> void:
	if StatHolder.combatUnlocked:
		CombatNotUnlockedLabel.visible = false
		CombatStuff.visible = true
	else:
		CombatNotUnlockedLabel.visible = true
		CombatStuff.visible = false
