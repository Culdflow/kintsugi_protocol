extends RigidBody2D
class_name BodyPart

var health: int = 100
@export var anim_player: AnimationPlayer
@export var collision1: CollisionShape2D
@export var collision2: CollisionShape2D
var held_object: PickupObject = null
@export var hold_position: Marker2D = null


func _play_anim(animation):
	anim_player.stop()
	anim_player.play(animation)

func _limb_lost(pos, _scale):
	freeze = false
	set_scale(_scale)
	global_position = pos
	rotate(randf())
	apply_central_force(Vector2(randi_range(-50000, 50000), randi_range(-50000, 50000)))
	collision1.disabled = false
	collision2.disabled = false
