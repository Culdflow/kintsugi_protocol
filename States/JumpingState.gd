extends State
class_name jumpingstate

@export var jump_height: int = 500

func _enter():
	print("[ENTERED]: jumping state")
	player.velocity.y -= jump_height

func _exit():
	print("[EXITED]: jumping state")

func _update(_delta: float):
	pass

func _physics_update(_delta: float):
	if (player.is_on_floor()):
		Transitioned.emit(self, "idlestate")
	if (player.velocity.y >= 0):
		Transitioned.emit(self, "fallingstate")
	var inputs = Input.get_action_strength("right") + Input.get_action_strength(("left"))
	if (inputs > 0):
		Transitioned.emit(self, "glidejumpstate")
