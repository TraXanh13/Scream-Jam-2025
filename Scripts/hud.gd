extends CanvasLayer

func _ready() -> void:
	$"../Player".connect("health_updated", _on_player_health_updated)
	$"../Player".connect("exp_updated", _on_player_exp_updated)
	$"../Player".connect("player_level_up" , _on_player_health_updated)
	$"MarginContainer2/VBoxContainer/Health bar".max_value = $"../Player".maxHealth
	$"MarginContainer2/VBoxContainer/Health bar".value = $"../Player".health
	$"MarginContainer2/VBoxContainer/Exp bar".value = 0
	$"MarginContainer2/VBoxContainer/Exp bar".max_value = $"../Player".expToNextLevel
	
func _on_player_health_updated(health : int):
	$"MarginContainer2/VBoxContainer/Health bar".value = health

func _on_player_exp_updated(experience : int):
	$"MarginContainer2/VBoxContainer/Exp bar".value = experience
	
func _on_player_level_up():
	print("Leveled up!!")
