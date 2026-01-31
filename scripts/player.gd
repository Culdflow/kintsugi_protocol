extends CharacterBody2D

class_name Player_sc

@export var leftLeg: BodyPart = null
@export var rightLeg: BodyPart = null
@export var leftArm: BodyPart = null
@export var rightArm: BodyPart = null
@export var state_machine: StateMachine
@export var head_marker: Marker2D
const gravity_speed_MAX = 500
@export var gravity_speed = 0
@export var gravity_speed_addr = 50



func _physics_process(delta: float) -> void:
	if (Input.is_action_just_pressed("up") && is_on_floor() && (leftLeg != null || rightLeg != null)):
		state_machine.current_state.Transitioned.emit(state_machine.current_state, "jumpingstate")
	if (is_on_floor()):
		gravity_speed = 0
	else:
		velocity.y += gravity_speed * delta
		gravity_speed += gravity_speed_addr
	move_and_slide()
	
	if (Input.is_action_just_pressed("Interact")):
		var arm: BodyPart = null
		if (leftArm && leftArm.held_object):
			arm = leftArm
		elif (rightArm && rightArm.held_object):
			arm = rightArm
		if (arm):
			arm.held_object.freeze = false
			arm.held_object = null
			print("let go of object")
	var arm: BodyPart = null
	if (leftArm && leftArm.held_object):
		arm = leftArm
	elif (rightArm && rightArm.held_object):
		arm = rightArm
	if (arm):
		arm.held_object.global_position = arm.hold_position.global_position

func play_limbs_anim(animation):
	if (leftArm):
		leftArm._play_anim(animation)
	if (leftLeg):
		leftLeg._play_anim(animation)
	if (rightArm):
		rightArm._play_anim(animation)
	if (rightLeg):
		rightLeg._play_anim(animation)

func _lose_limb(limb:BodyPart):
	if (limb == leftArm):
		leftArm = null
	if (limb == leftLeg):
		leftLeg = null
	if (limb == rightArm):
		rightArm = null
	if (limb == rightLeg):
		rightLeg = null
	var limb_scene := limb.scene_file_path
	var new_limb: BodyPart = load(limb_scene).instantiate()
	new_limb._limb_lost(limb.global_position)
	limb.queue_free()
	get_parent().add_child(new_limb)
	if (leftLeg == null && rightLeg == null):
		state_machine.current_state.Transitioned.emit(state_machine.current_state, "zombiestate")

func pickup(obj: PickupObject):
	var arm: BodyPart = null
	if (leftArm):
		arm = leftArm
	elif (rightArm):
		arm = rightArm
	else:
		return
	if arm.held_object != null:
		# Replace l'ancien objet à côté du joueur
		arm.held_object.freeze = false  # remet la physique
		print("Replaced", arm.held_object.item_name)
	arm.held_object = obj
	arm.held_object.freeze = true
	
	print("Picked up:", arm.held_object.item_name)
