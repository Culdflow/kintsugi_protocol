extends State
class_name RunningState

@export var player_speed: int

func _enter():
	print("[ENTERED]: running state")

func _exit():
	print("[EXITED]: running state")

func _update(_delta: float):
	pass

func _physics_update(delta: float):
	player.velocity.x = (Input.get_action_strength("right") - Input.get_action_strength("left")) * player_speed
	if (player.velocity.x == 0):
		Transitioned.emit(self, "idlestate")
