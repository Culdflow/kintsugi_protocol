extends State
class_name FallingState



func _enter():
	print("[ENTERED]: Falling state")

func _exit():
	print("[EXITED]: Falling state")

func _update(_delta: float):
	var inputs = Input.get_action_strength("right") + Input.get_action_strength(("left"))
	if (inputs > 0):
		Transitioned.emit(self, "glidingstate")
	if (player.is_on_floor()):
		player.gravity_speed = 0
		Transitioned.emit(self, "idlestate")
	
