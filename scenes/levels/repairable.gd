extends Node2D

@export var solid_body_path: NodePath
@export var sprite_path: NodePath
@export var interact_area_path: NodePath
@export var label_path: NodePath

var player_inside := false
var repaired := false

@onready var solid_body: StaticBody2D = get_node_or_null(solid_body_path) as StaticBody2D
@onready var sprite: Sprite2D = get_node_or_null(sprite_path) as Sprite2D
@onready var interact_area: Area2D = get_node_or_null(interact_area_path) as Area2D
@onready var label: Label = get_node_or_null(label_path) as Label

func _ready():
	# Garde-fous (pour te dire EXACTEMENT ce qui manque)
	if interact_area == null: push_error("Repairable: interact_area_path invalide"); return
	if label == null: push_error("Repairable: label_path invalide"); return
	if sprite == null: push_error("Repairable: sprite_path invalide"); return
	if solid_body == null: push_error("Repairable: solid_body_path invalide (pas un StaticBody2D)"); return

	label.visible = false

	# Désactive la collision au départ (méthode simple)
	solid_body.set_deferred("collision_layer", 0)
	solid_body.set_deferred("collision_mask", 0)

	interact_area.body_entered.connect(_on_body_entered)
	interact_area.body_exited.connect(_on_body_exited)

func _process(_delta):
	if player_inside and not repaired and Input.is_action_just_pressed("Interact"):
		repair()

func repair():
	repaired = true
	label.visible = true
	label.text = "REPAIRED"

	# Reset visuel
	sprite.self_modulate = Color.WHITE

	# Active collision
	solid_body.collision_layer = 1
	solid_body.collision_mask = 1

	# Option : on désactive l’interaction
	interact_area.monitoring = false

	print("Repair triggered")

func _on_body_entered(body):
	if body is CharacterBody2D and not repaired:
		player_inside = true
		label.visible = true
		label.text = "Press E"

func _on_body_exited(body):
	if body is CharacterBody2D:
		player_inside = false
		if not repaired:
			label.visible = false
