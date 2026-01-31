extends Area2D

signal level_completed

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is CharacterBody2D:
		print("EXIT TRIGGERED")
		get_tree().change_scene_to_file("res://scenes/levels/level_2_space.tscn")
