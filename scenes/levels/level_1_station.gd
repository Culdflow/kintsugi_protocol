extends Node2D
signal level_completed

@export var audio: AudioStreamPlayer

func _ready():
	# Cherche un node nommé "Exit" n'importe où dans la scène
	var exit_area := find_child("Exit", true, false)
	audio.finished.connect(_audio_ended)

	if exit_area == null:
		push_error("Level1_Station: Node 'Exit' introuvable. Vérifie le nom exact dans l'arbre.")
		return

	# Vérifie que Exit a bien le signal attendu
	if not exit_area.has_signal("level_completed"):
		push_error("Level1_Station: 'Exit' n'a pas le signal 'level_completed'. Ajoute-le dans Exit.gd.")
		return

	exit_area.level_completed.connect(func():
		level_completed.emit()
	)
	
func _audio_ended():
	audio.play()
