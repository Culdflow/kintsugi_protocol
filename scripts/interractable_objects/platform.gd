extends interractableObject
class_name interractable_platform

@onready var sprite: Sprite2D = $Sprite2D
@onready var solid_collision: CollisionShape2D = $SolidBody/SolidCollision

var repaired := false

func _ready() -> void:
	super._ready()

	# Visuel cassé (optionnel)
	sprite.self_modulate = Color(1.0, 0.208, 0.169, 1.0)

	# Collision OFF au départ
	solid_collision.disabled = true

func _interract(player) -> void:
	print("INTERACT OK")

	if repaired:
		return

	repaired = true
	sprite.self_modulate = Color.WHITE

	# Collision ON
	solid_collision.disabled = false
	print("SolidCollision disabled? ", solid_collision.disabled)
	print("SolidCollision shape: ", solid_collision.shape)
	monitoring = false
	print("Repair triggered (platform)")
