extends Area2D
class_name interractableObject

var _body: PhysicsBody2D = null
@onready var _label_object = preload("res://Objects/label_object.tscn")

func _interract(player: Player_sc):
	pass

func _ready() -> void:
	body_entered.connect(_body_entered)
	body_exited.connect(_body_exited)

func _body_entered(body):
	if body is Player_sc:
		_body = body

func _body_exited(body):
	if body is Player_sc:
		_body = null

func _process(delta: float) -> void:
	print("body = ", _body)
	if _body && Input.is_action_just_pressed("Interact"):
		_interract(_body)
