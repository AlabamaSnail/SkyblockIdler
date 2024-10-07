extends Label

var hue : float = 0.0
var hue_speed : float = 0.5  # Controls how fast the hue changes

func _process(delta: float) -> void:
	# Increment the hue value over time
	hue += hue_speed * delta
	
	# Keep the hue between 0 and 1
	if hue > 1.0:
		hue -= 1.0

	# Create a color with the changing hue
	var rainbow_color: Color = Color.from_hsv(hue, 1.0, 1.0)
	
	# Apply the color to the label's font color
	modulate = rainbow_color
