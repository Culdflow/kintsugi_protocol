extends State
class_name ZombieState

@onready var two_arms_speed = player.two_arms_speed
@onready var one_arm_speed = player.one_arm_speed
@onready var no_arms_speed = player.no_arms_speed
@onready var rotation_speed = player.arm_rotation_speed

var arm_time: float = 0.0
var left_arm_anchor: Vector2 = Vector2(50, 295)
var right_arm_anchor: Vector2 = Vector2(50, 345)

var original_torso_pos: Vector2
var original_torso_rot: float
var original_collision_pos: Vector2
var original_collision_shape: Shape2D
var original_left_arm_pos: Vector2
var original_left_arm_rot: float
var original_right_arm_pos: Vector2
var original_right_arm_rot: float

func _enter():
	print("[ENTERED]: Zombie state")
	var torso = player.get_node("Torso")
	var collision = player.get_node("CollisionShape2D")

	original_torso_pos = torso.position
	original_torso_rot = torso.rotation
	original_collision_pos = collision.position
	original_collision_shape = collision.shape

	if player.leftArm:
		original_left_arm_pos = player.leftArm.position
		original_left_arm_rot = player.leftArm.rotation
	if player.rightArm:
		original_right_arm_pos = player.rightArm.position
		original_right_arm_rot = player.rightArm.rotation

	# Corps couché au sol
	torso.rotation = deg_to_rad(90)
	torso.position = Vector2(0, 330)

	# Collision aplatie
	collision.shape = collision.shape.duplicate()
	collision.position = Vector2(0, 350)
	collision.shape.size = Vector2(250, 30)

func _exit():
	print("[EXITED]: Zombie state")
	var torso = player.get_node("Torso")
	var head = player.get_node("Head")
	var collision = player.get_node("CollisionShape2D")

	torso.position = original_torso_pos
	torso.rotation = original_torso_rot
	collision.position = original_collision_pos
	collision.shape = original_collision_shape

	if player.leftArm:
		player.leftArm.position = original_left_arm_pos
		player.leftArm.rotation = original_left_arm_rot
	if player.rightArm:
		player.rightArm.position = original_right_arm_pos
		player.rightArm.rotation = original_right_arm_rot

func _update(delta: float):
	var is_moving = player.velocity.x != 0

	if is_moving:
		var dir = sign(player.velocity.x)
		arm_time += delta * rotation_speed * dir

	if player.leftArm:
		player.leftArm.rotation = arm_time
		player.leftArm.position = left_arm_anchor
	if player.rightArm:
		player.rightArm.rotation = arm_time + PI
		player.rightArm.position = right_arm_anchor

func _physics_update(_delta: float):
	var arm_count = 0
	if player.leftArm:
		arm_count += 1
	if player.rightArm:
		arm_count += 1

	var speed: int
	match arm_count:
		2: speed = two_arms_speed
		1: speed = one_arm_speed
		_: speed = no_arms_speed

	player.velocity.x = (Input.get_action_strength("right") - Input.get_action_strength("left")) * speed
