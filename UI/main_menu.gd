extends Control


func _ready() -> void:
	$AudioStreamPlayer2.play()

func _on_button_button_down() -> void:
	$AudioStreamPlayer.play()
	$AudioStreamPlayer2.volume_db = $AudioStreamPlayer2.volume_db - 1
	get_tree().change_scene_to_file("res://UI/main_anim.tscn")


func _on_audio_stream_player_2_finished() -> void:
	$AudioStreamPlayer2.play()
