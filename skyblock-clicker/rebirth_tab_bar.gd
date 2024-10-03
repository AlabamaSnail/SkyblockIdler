extends TabBar  # Inherit from TabBar since the script is attached to a TabBar

@export var rainbow_speed = 1.0  # Speed of the rainbow cycle

var hue_value = 0.0  # Start with hue 0

# This function converts hue to an RGB color
func hue_to_rgb(hue: float) -> Color:
	return Color.from_hsv(hue, 1.0, 1.0)

# Called every frame
func _process(delta: float) -> void:
	hue_value += rainbow_speed * delta
	if hue_value > 1.0:
		hue_value = 0.0  # Loop the hue back to 0
	
	var rainbow_color = hue_to_rgb(hue_value)
	
	# Duplicate the current theme to modify it
	var new_theme = self.theme.duplicate()  
	new_theme.set_color("font_selected_color", "TabBar", rainbow_color)
	
	# Apply the new theme back to the TabBar
	self.theme = new_theme


func _on_tab_selected(tab: int) -> void:
	if tab == 0:
		$NormalRebirths.visible = true
		$SuperRebirths.visible = false
		$UltraRebirths.visible = false
	if tab == 1:
		$NormalRebirths.visible = false
		$SuperRebirths.visible = true
		$UltraRebirths.visible = false
	if tab == 2:
		$NormalRebirths.visible = false
		$SuperRebirths.visible = false
		$UltraRebirths.visible = true
