extends State
class_name IdleState

func _enter():
	print("[ENTERED]: Idle state")

func _exit():
	print("[EXITED]: Idle state")

func _update(_delta: float):
	var inputs = Input.get_action_strength("right") + Input.get_action_strength(("left"))
	if (inputs > 0):
		Transitioned.emit(self, "runningstate")

func _physics_update(_delta: float):
	pass
