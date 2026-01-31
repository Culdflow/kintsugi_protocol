extends interractableObject
class_name maskPiece

var _label_object_inst: LabelObject = null
var _player: Player_sc = null

var move_time := 1.0
var elapsed := 0.0
var start_pos: Vector2
var target_pos: Vector2
var moving := false
var duration := 1.0


func _physics_process(delta: float) -> void:
	if not moving or not _player:
		return

	elapsed += delta
	var remaining_time = max(duration - elapsed, 0.0001)

	var target_pos := _player.head_marker.global_position
	var to_target := target_pos - global_position
	var distance := to_target.length()

	# Move exactly enough to arrive in remaining time
	var velocity = to_target.normalized() * (distance / remaining_time)
	global_position += velocity * delta

	if elapsed >= duration or distance <= 10.0:
		moving = false
		global_position = target_pos
		_tween_finished()

func _interract(player: Player_sc):
	player.mask_piece = 1
	_label_object_inst = _label_object.instantiate()
	get_parent().add_child(_label_object_inst)
	_label_object_inst._spawn(global_position + Vector2(0, -100), "retrieved mask piece", Color.GREEN)
	_player = player
	start_move()

func start_move():
	start_pos = global_position
	target_pos = _player.head_marker.global_position
	elapsed = 0.0
	moving = true


func _tween_finished():
	if(_label_object_inst):
		_label_object_inst._despawn()
	queue_free()
