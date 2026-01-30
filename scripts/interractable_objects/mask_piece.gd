extends interractableObject
class_name maskPiece

var _label_object_inst: LabelObject = null
var speed = 400
var velocity: Vector2
var _player: Player_sc = null

func _interract(player: Player_sc):
	_label_object_inst = _label_object.instantiate()
	get_parent().add_child(_label_object_inst)
	_label_object_inst._spawn(global_position + Vector2(0, -100), "retrieved mask piece", Color.GREEN)
	_player = player

func _physics_process(delta: float) -> void:
	if _player:
		velocity = Vector2(_player.head_marker.global_position.x - global_position.x, _player.head_marker.global_position.y - global_position.y).normalized() * speed
		speed += 50
		global_position += velocity * delta
		if ((_player.head_marker.global_position - global_position) >= Vector2(-10, -10) && (_player.head_marker.global_position - global_position) <= Vector2(10, 10)):
			_tween_finished()

func _tween_finished():
	if(_label_object_inst):
		_label_object_inst._despawn()
	queue_free()
