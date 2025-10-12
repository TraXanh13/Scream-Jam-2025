extends Node2D

var enemyScene : PackedScene = load("res://Scenes/enemy.tscn")

@export var maxEnemies := 5
var numEnemies := 0


func _on_enemy_spawn_timer_timeout() -> void:
	if numEnemies < maxEnemies :
		var enemyInstance = enemyScene.instantiate()
		$Enemies.add_child(enemyInstance)
		numEnemies+= 1
		print("enemy spawned")
	
