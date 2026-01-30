extends State
class_name glidingstate

const gravity_speed_MAX = 500
@export var gravity_speed = 0
@export var gravity_speed_addr = 50
@export var player_speed: int

func _enter():
	print("[ENTERED]: gliding state")

func _exit():
	print("[EXITED]: gliding state")

func _update(_delta: float):
	if (player.is_on_floor() && player.velocity.x == 0):
		gravity_speed = 0
		Transitioned.emit(self, "idlestate")
	elif (player.is_on_floor()):
		gravity_speed = 0
		Transitioned.emit(self, "runningstate")
	elif (player.velocity.x == 0):
		Transitioned.emit(self, "fallingstate")
	player.velocity.x = (Input.get_action_strength("right") - Input.get_action_strength("left")) * player_speed
	
