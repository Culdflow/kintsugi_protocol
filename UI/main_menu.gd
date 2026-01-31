extends Control



func _on_button_button_down() -> void:
	$AudioStreamPlayer.play()
	SceneManager.change_scene("res://UI/main_anim.tscn")
