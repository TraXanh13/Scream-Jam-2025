extends Node2D

var enemyScene : PackedScene = load("res://Scenes/enemy.tscn")
var pickupScene : PackedScene = load("res://Scenes/pick_up.tscn")

@export var maxEnemies := 5
var numEnemies := 0
var numEnemiesKilled := 0

var waveNumber : int = 1
signal start_next_wave
signal wave_ended


func _on_enemy_spawn_timer_timeout() -> void:
	if numEnemies < maxEnemies :
		var enemyInstance = enemyScene.instantiate()
		var rng = RandomNumberGenerator.new()
		var gameWindowWidth = get_viewport().get_visible_rect().size[0]
		var gameWindowHeight = get_viewport().get_visible_rect().size[1]
		var posX = rng.randf_range(20, gameWindowWidth-20)
		var posY = rng.randf_range(20, gameWindowHeight-20)
		enemyInstance.position = Vector2(posX, posY)
		enemyInstance.set_target($Player)
		enemyInstance.connect("enemyDeath", _on_enemy_enemy_death)
		$Enemies.add_child(enemyInstance)
		numEnemies+= 1


func _on_enemy_enemy_death(pos: Vector2) -> void:
	#print("enemy defeated")
	
	# Spawn exp pickup at defeated enemy location and add to level under PickUps
	var pickup = pickupScene.instantiate()
	pickup.global_position = pos
	$PickUps.add_child(pickup)
	
	# Increment number of enemies defeated
	# Start next wave if numEnemiesKilled == maxEnemies
	numEnemiesKilled += 1
	if (numEnemiesKilled >= maxEnemies):
		wave_ended.emit()


func _on_wave_ended() -> void:
	print("Wave completed...")
	$"Timers/Enemy Spawn Timer".stop()
	$"Timers/Wave Delay Timer".start()


func _on_wave_delay_timer_timeout() -> void:
	$"Timers/Wave Delay Timer".stop()
	start_next_wave.emit()


func _on_start_next_wave() -> void:
	print("Next wave starting...")
	numEnemies = 0
	numEnemiesKilled = 0
	$"Timers/Enemy Spawn Timer".start()
