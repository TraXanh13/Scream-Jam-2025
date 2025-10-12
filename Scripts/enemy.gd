extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	var gameWindowWidth = get_viewport().get_visible_rect().size[0]
	var gameWindowHeight = get_viewport().get_visible_rect().size[1]
	var posX = rng.randf_range(0, gameWindowWidth)
	var posY = rng.randf_range(0, gameWindowHeight)
	position = Vector2(posX, posY)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
