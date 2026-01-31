extends Area2D



func _on_body_entered(body: Node2D) -> void:
	SceneManager.change_scene("res://test_scenes/test_scene_2.tscn")
