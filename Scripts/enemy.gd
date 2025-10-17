extends Area2D

@export var health := 2
@export var moveSpeed := 20
@export var attackDamage : int = 1
const SFX_enemy_death = preload("res://Sounds/enemy_death_normal.ogg")
var target : CharacterBody2D


signal enemyDeath(pos: Vector2)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if health <= 0:
		#print("Enemy defeated")
		#play_one_instance_sound(SFX_enemy_death, global_position)
		enemyDeath.emit(global_position)
		queue_free()
	
	if target != null:
		var targetDirection = (target.global_position - global_position).normalized()
		var velocity = targetDirection * moveSpeed
		global_position += velocity * delta
	
func set_target(targetToChase: CharacterBody2D):
	if targetToChase != null:
		target = targetToChase


func _on_body_entered(body: Node2D) -> void:
	if (body != null):
		body._take_damage(attackDamage)
		
func _take_damage(damage: int):
	if (health <= 0):
		pass
	elif (health < damage):
		health = 0
	else:
		health -= damage
