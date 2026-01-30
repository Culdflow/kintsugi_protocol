extends State
class_name IdleState

@export var player: Player_sc

func _enter():
	print("[ENTERED]: Idle state")

func _exit():
	print("[EXITED]: Idle state")

func _update(_delta: float):
	if (!player.is_on_floor()):
		Transitioned.emit(self, "fallingstate")
	var inputs = Input.get_action_strength("right") + Input.get_action_strength(("left"))
	if (inputs > 0):
		Transitioned.emit(self, "runningstate")

func _physics_update(_delta: float):
	pass
