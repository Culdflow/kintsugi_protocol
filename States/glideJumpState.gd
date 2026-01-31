extends State
class_name glidejumpstate

@onready var player_speed = player.player_jump_speed

func _enter():
	print("[ENTERED]: glide jump state")
	
func _exit():
	print("[EXITED]: glide jump state")

func _update(_delta: float):
	pass

func _physics_update(_delta: float):
	if (player.is_on_floor()):
		Transitioned.emit(self, "runningstate")
	if (player.velocity.y >= 0):
		Transitioned.emit(self, "glidingstate")
	player.velocity.x = (Input.get_action_strength("right") - Input.get_action_strength("left")) * player_speed
	
