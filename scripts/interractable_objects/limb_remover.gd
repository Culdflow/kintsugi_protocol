extends interractableObject
class_name limbRemover

enum limbs
{
	LEFT_LEG, RIGHT_LEG, LEFT_ARM, RIGHT_ARM
}

var _label_object_inst: LabelObject = null
var _info_label: LabelObject = null
@export var limb_asked: limbs
@export var text_message: String
var limb_accepted: BodyPart

func _body_entered_modif(body):
	if !_info_label:
		_info_label = _label_object.instantiate()
		add_child(_info_label)
		_info_label._spawn(global_position + Vector2(0, -100), text_message, Color.WHITE)

func _body_exited_modif(body):
	if (_info_label):
		_info_label._despawn()

func _interract(player: Player_sc):
	if (_info_label):
		_info_label._despawn()
	print("interracted")
	if limb_asked == limbs.LEFT_LEG:
		limb_accepted = player.leftLeg
	if (limb_asked == limbs.RIGHT_LEG):
		limb_accepted = player.rightLeg
	if (limb_asked == limbs.LEFT_ARM):
		limb_accepted = player.leftArm
	if (limb_asked == limbs.RIGHT_ARM):
		limb_accepted = player.rightArm
	if (!_label_object_inst):
		_label_object_inst = _label_object.instantiate()
		add_child(_label_object_inst)
		if (limb_accepted == null):
			_label_object_inst._spawn(global_position + Vector2(0, -100), "you do not have this limb", Color.RED)
		else:
			player._lose_limb(limb_accepted)
			_label_object_inst._spawn(global_position + Vector2(0, -100), "extracted limb", Color.WHITE)
		get_tree().create_timer(1).timeout.connect(_on_timer_stop)

func _on_timer_stop():
	if (_label_object_inst):
		_label_object_inst._despawn()
	_label_object_inst = null
