extends CharacterBody2D

@export var movementSpeed := 30


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# set player start position to center of the game window
	var width = get_viewport().get_visible_rect().size[0]
	var height = get_viewport().get_visible_rect().size[1]
	position = Vector2(width/2, height/2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var inputDirection = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = inputDirection * movementSpeed
	move_and_slide()
