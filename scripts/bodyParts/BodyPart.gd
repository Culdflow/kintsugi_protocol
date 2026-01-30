extends RigidBody2D
class_name BodyPart

var health: int = 100
@export var anim_player: AnimationPlayer
@export var collision: CollisionShape2D

func _play_anim(animation):
	anim_player.stop()
	anim_player.play(animation)

func _limb_lost(pos):
	freeze = false
	global_position = pos
	rotate(0.2)
	collision.disabled = false
