extends RigidBody2D
class_name BodyPart

var health: int = 100
@export var anim_player: AnimationPlayer
@export var collision: CollisionShape2D

func _play_anim(animation):
	anim_player.stop()
	anim_player.play(animation)

func _limb_lost():
	freeze = false
	apply_force(Vector2(10, 10))
	collision.disabled = false
