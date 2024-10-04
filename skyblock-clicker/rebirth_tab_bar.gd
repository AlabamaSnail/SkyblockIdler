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

	# Check if the current theme is not null before modifying it
	if self.theme:
		# Duplicate the current theme to modify it
		var new_theme = self.theme.duplicate()
		if new_theme.has_color("font_selected_color", "TabBar"):  # Ensure the color property exists
			new_theme.set_color("font_selected_color", "TabBar", rainbow_color)
			
			# Apply the new theme back to the TabBar
			self.theme = new_theme
		else:
			print_debug("font_selected_color not found for TabBar")

# Handle tab selection
func _on_tab_selected(tab: int) -> void:
	$NormalRebirths.visible = tab == 0
	$SuperRebirths.visible = tab == 1
	$UltraRebirths.visible = tab == 2
