extends Node2D

var EnemyHealthBar
var EnemyHealthLabel

var MaxHealth = Big.new(1000)
var CurrentHealth = Big.new(1000)

func _ready() -> void:
	EnemyHealthBar = $EnemyHealthBar
	EnemyHealthLabel = $HealthBarLabel

func _process(delta: float) -> void:
	MaxHealth = Big.new(1000).toThePowerOf(StatHolder.enemyType.plus(1).toFloat())
	EnemyHealthLabel.text = "Health: " + CurrentHealth.toAA() + " / " + MaxHealth.toAA()
	
	# Update health bar value based on current health as a percentage
	var percentage_health = (CurrentHealth.dividedBy(MaxHealth)).toFloat() * 100
	EnemyHealthBar.value = percentage_health

func _on_main_enemy_pressed() -> void:
	# Calculate the actual damage as a Big number based on strength
	var damage = Big.new(StatHolder.strength)
	
	# Subtract the damage from current health
	CurrentHealth.minusEquals(damage)
	
	# Ensure health doesn't go below zero
	if CurrentHealth.isLessThan(Big.new(0)):
		CurrentHealth = Big.new(0)
	
	# Recalculate percentage health for the health bar
	var percentage_health = (CurrentHealth.dividedBy(MaxHealth)).toFloat() * 100
	EnemyHealthBar.value = percentage_health
	
	# If the health bar is empty (enemy is defeated), handle kill logic
	if CurrentHealth.isLessThan(1):
		StatHolder.totalKills.plusEquals(Big.new(1))
		# Optionally reset the enemy for the next fight
		_reset_enemy_health()

func _on_next_enemy_type_pressed() -> void:
	StatHolder.enemyType.plusEquals(Big.new(1))
	_reset_enemy_health()

func _on_previous_enemy_type_pressed() -> void:
	if StatHolder.enemyType.isGreaterThan(Big.new(1)):
		StatHolder.enemyType.minusEquals(Big.new(1))
		_reset_enemy_health()

# Function to reset health when a new enemy type is selected or when defeated
func _reset_enemy_health() -> void:
	MaxHealth = Big.new(1000).toThePowerOf(StatHolder.enemyType.plus(1).toFloat())
	CurrentHealth = MaxHealth
