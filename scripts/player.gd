extends CharacterBody2D

class_name Player_sc

@export var leftLeg: BodyPart = null
@export var rightLeg: BodyPart = null
@export var leftArm: BodyPart = null
@export var rightArm: BodyPart = null

@export var state_machine: StateMachine

const gravity_speed_MAX = 500
@export var gravity_speed = 0
@export var gravity_speed_addr = 50

func _physics_process(delta: float) -> void:
	if (Input.is_action_just_pressed("up") && is_on_floor()):
		state_machine.current_state.Transitioned.emit(state_machine.current_state, "jumpingstate")
	if (is_on_floor()):
		gravity_speed = 0
	else:
		velocity.y += gravity_speed * delta
		gravity_speed += gravity_speed_addr
	move_and_slide()

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
