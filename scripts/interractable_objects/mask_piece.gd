extends interractableObject
class_name maskPiece

func _interract(player: Player_sc):
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.tween_property(self, "global_position", player.head_marker.global_position, 0.5)
	tween.tween_callback(queue_free)
