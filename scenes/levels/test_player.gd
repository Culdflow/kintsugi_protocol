extends CharacterBody2D

@export var speed := 250.0
@export var jump_force := 450.0
@export var gravity := 1200.0

func _physics_process(delta):
	# Gravité
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		# éviter l'accumulation
		velocity.y = 0.0

	# Déplacement horizontal
	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

	# Saut
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = -jump_force

	move_and_slide()
