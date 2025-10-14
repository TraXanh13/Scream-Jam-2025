extends Area2D

var targetDirection
@export var projectileSpeed := 50
@export var duration := 5.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.wait_time = duration
	$Timer.start()
	var mousePosition = get_global_mouse_position()
	targetDirection = global_position.direction_to(mousePosition)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += targetDirection * projectileSpeed * delta


func _on_area_entered(area: Area2D) -> void:
	print("projectile hit!")
	if (area != null and area.health != null):
		area.health -= 1
	queue_free()


func _on_timer_timeout() -> void:
	queue_free()
