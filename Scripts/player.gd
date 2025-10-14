extends CharacterBody2D

@export var movementSpeed := 30
@export var health := 5

var projectile_scene: PackedScene = load("res://Scenes/projectile.tscn")
@export var canAttack := true

var experience : int = 0
var expToNextLevel : int = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# set player start position to center of the game window
	var width = get_viewport().get_visible_rect().size[0]
	var height = get_viewport().get_visible_rect().size[1]
	position = Vector2(width/2, height/2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if health <= 0:
		print("You died...")
	player_movement()

func player_movement() -> void:
	var inputDirection = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = inputDirection * movementSpeed
	move_and_slide()

func _on_attack_timer_timeout() -> void:
	if canAttack:
		var projectile = projectile_scene.instantiate()
		projectile.position = global_position
		$"../..".add_child(projectile)

func _take_damage(damage: int):
	if (health <= 0):
		pass
	elif (health < damage):
		health = 0
	else:
		health -= damage
		
func _add_exp(value: int):
	experience += value
	if (experience >= expToNextLevel):
		experience = 0
		print("Level up!!")
