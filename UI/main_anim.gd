extends Control

func _ready() -> void:
	$AnimationPlayer.play("play", -1, 2)



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scenes/levels/level_1_station.tscn")
