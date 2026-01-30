extends State
class_name testState
func _enter():
	print("yo")

func _exit():
	print("exited")

func _update(_delta: float):
	print("a")

func _physics_update(_delta: float):
	pass
