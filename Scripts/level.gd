extends Node2D

var enemyScene : PackedScene = load("res://Scenes/enemy.tscn")

@export var maxEnemies := 5
var numEnemies := 0


func _on_enemy_spawn_timer_timeout() -> void:
	if numEnemies < maxEnemies :
		var enemyInstance = enemyScene.instantiate()
		var rng = RandomNumberGenerator.new()
		var gameWindowWidth = get_viewport().get_visible_rect().size[0]
		var gameWindowHeight = get_viewport().get_visible_rect().size[1]
		var posX = rng.randf_range(0, gameWindowWidth)
		var posY = rng.randf_range(0, gameWindowHeight)
		enemyInstance.position = Vector2(posX, posY)
		enemyInstance.set_target($Player)
		$Enemies.add_child(enemyInstance)
		numEnemies+= 1
