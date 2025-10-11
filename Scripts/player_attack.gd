extends Node2D

var projectile_scene: PackedScene = load("res://Scenes/projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_attack_timer_timeout() -> void:
	print("player attack")
	var projectile = projectile_scene.instantiate()
	add_child(projectile)
