extends Area2D
class_name PickupDetector


var can_pickup := false
var player: Player_sc
var parent_object: PickupObject

func _ready():
	parent_object = get_parent() as PickupObject

func _on_body_entered(body):
	if body is Player_sc:
		can_pickup = true
		player = body
		print("Player entered pickup zone for", parent_object.item_name)

func _on_body_exited(body):
	if body == player:
		can_pickup = false
		player = null
		print("Player exited pickup zone for", parent_object.item_name)

func _process(delta):
	if can_pickup and Input.is_action_just_pressed("Interact"):
		if player != null:
			player._die()
			player.pickup(parent_object)
