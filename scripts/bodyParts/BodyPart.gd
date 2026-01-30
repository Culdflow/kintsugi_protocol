extends RigidBody2D
class_name BodyPart

var health: int = 100
@export var anim_player: AnimationPlayer
@export var collision: CollisionShape2D
var held_object: PickupObject = null
@export var hold_position: Marker2D = null


func _play_anim(animation):
	anim_player.stop()
	anim_player.play(animation)

func _limb_lost(pos, _scale):
	freeze = false
	scale = Vector2(_scale, _scale)
	global_position = pos
	rotate(0.2)
	collision.disabled = false
