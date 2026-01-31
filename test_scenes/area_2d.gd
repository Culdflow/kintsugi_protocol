extends Area2D



func _on_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://test_scenes/test_scene_2.tscn")
