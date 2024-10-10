extends Node2D


var EnemyHealthBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EnemyHealthBar = $EnemyHealthBar


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_main_enemy_pressed() -> void:
	if EnemyHealthBar.value >= 100:
		EnemyHealthBar.value = 0
		StatHolder.totalKills.plusEquals(1)
	else:
		EnemyHealthBar.value += 10
