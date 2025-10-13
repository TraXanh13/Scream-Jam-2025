extends Area2D

@export var moveSpeed := 20
var target : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if target != null:
		var targetDirection = (target.global_position - global_position).normalized()
		var velocity = targetDirection * moveSpeed
		global_position += velocity * delta
	
func set_target(targetToChase: CharacterBody2D):
	if targetToChase != null:
		target = targetToChase
