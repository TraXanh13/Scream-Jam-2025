extends Area2D

@export var exp_value : int = 1

func _on_body_entered(body: Node2D) -> void:
	print("exp picked up")
	if (body != null):
		body._add_exp(exp_value)
	queue_free()
