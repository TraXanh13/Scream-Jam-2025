extends CharacterBody2D

@export var movementSpeed := 200
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	position += direction * movementSpeed * delta
