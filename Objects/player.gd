extends CharacterBody2D

class_name Player_sc

@export var leftLeg: BodyPart = null
@export var rightLeg: BodyPart = null
@export var leftArm: BodyPart = null
@export var rightArm: BodyPart = null

func _physics_process(delta: float) -> void:
	move_and_slide()
