extends Node2D

var enemyScene : PackedScene = load("res://Scenes/enemy.tscn")
var pickupScene : PackedScene = load("res://Scenes/pick_up.tscn")

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
		enemyInstance.connect("enemyDeath", _on_enemy_enemy_death)
		$Enemies.add_child(enemyInstance)
		numEnemies+= 1


func _on_enemy_enemy_death(pos: Vector2) -> void:
	#print("enemy defeated")
	var pickup = pickupScene.instantiate()
	pickup.global_position = pos
	$PickUps.add_child(pickup)
