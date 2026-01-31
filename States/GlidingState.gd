extends State
class_name glidingstate

@onready var player_speed = player.player_float_speed

func _enter():
	print("[ENTERED]: gliding state")

func _exit():
	print("[EXITED]: gliding state")

func _update(_delta: float):
	if (player.is_on_floor() && player.velocity.x == 0):
		Transitioned.emit(self, "idlestate")
	elif (player.is_on_floor()):
		Transitioned.emit(self, "runningstate")
	elif (player.velocity.x == 0):
		Transitioned.emit(self, "fallingstate")
	player.velocity.x = (Input.get_action_strength("right") - Input.get_action_strength("left")) * player_speed
	
