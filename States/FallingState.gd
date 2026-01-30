extends State
class_name FallingState


const gravity_speed_MAX = 500
@export var gravity_speed = 0
@export var gravity_speed_addr = 50
@export var player: Player_sc

func _enter():
	print("[ENTERED]: Falling state")

func _exit():
	print("[EXITED]: Falling state")

func _update(_delta: float):
	var inputs = Input.get_action_strength("right") + Input.get_action_strength(("left"))
	if (inputs > 0):
		Transitioned.emit(self, "glidingstate")
	if (player.is_on_floor()):
		gravity_speed = 0
		Transitioned.emit(self, "idlestate")
	player.velocity.y += gravity_speed * _delta
	gravity_speed += gravity_speed_addr
