extends Node2D
class_name LabelObject

@export var animPlayer: AnimationPlayer
@export var label: Label

func _ready() -> void:
	animPlayer.animation_finished.connect(_anim_finished)

func _spawn(pos: Vector2, text, color):
	global_position = pos
	label.text = text
	label.modulate = Color(color)
	animPlayer.play("pop_up")

func _despawn():
	animPlayer.play("pop_out")

func _anim_finished(anim):
	if anim == "pop_out":
		queue_free()
