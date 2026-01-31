extends Control



func _on_button_button_down() -> void:
	$AudioStreamPlayer.play()
	get_tree().change_scene_to_file("res://UI/main_anim.tscn")


func _on_audio_stream_player_2_finished() -> void:
	$AudioStreamPlayer2.play()
	get_tree().change_scene_to_file("res://UI/main_anim.tscn")
