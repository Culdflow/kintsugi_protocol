extends CharacterBody2D
class_name Player_sc

const speed := 200
var gravity_speed = 0
var gravity_speed_addr = 50

var held_object: PickupObject = null

func _physics_process(delta: float):
	if !is_on_floor():
		velocity.y += gravity_speed * delta
		gravity_speed += gravity_speed_addr
	else:
		gravity_speed = 0

	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed

	move_and_slide()

	# Faire suivre l'objet tenu
	if held_object != null:
		held_object.add_collision_exception_with(self)
		#held_object.
		held_object.lock_rotation
		held_object.global_position = global_position + Vector2(0,-50)

func pickup(obj: PickupObject):
	if held_object != null:
		# Replace l'ancien objet à côté du joueur
		held_object.global_position = global_position + Vector2(0,-300)
		held_object.sleeping = false  # remet la physique
		print("Replaced", held_object.item_name)
		


	held_object = obj
	held_object.sleeping = true
	print("Picked up:", held_object.item_name)
