extends Node2D

func play_one_instance_sound(audio_stream: AudioStream, position: Vector2) -> void:
	#creates a new AudioStream2d node
	var audio_player = AudioStreamPlayer2D.new()

	audio_player.stream = audio_stream
	add_child(audio_player)
	audio_player.play()
	
	await audio_player.finished
	audio_player.queue_free()
	
