extends Node2D

@onready var interact_area := $InteractArea
@onready var label := $Label

var player_inside := false
var repaired := false

func _ready():
	label.visible = false
	#interact_area.body_entered.connect(_on_body_entered)
	#interact_area.body_exited.connect(_on_body_exited)

func _process(_delta):
	if player_inside and not repaired and Input.is_action_just_pressed("ui_select"):
		repaired = true
		label.text = "REPAIRED"
		print("Repair triggered")

#func _on_body_entered(body):
	#if body is CharacterBody2D and not repaired:
		#player_inside = true
		#label.visible = true
		#label.text = "Press E"
#
#func _on_body_exited(body):
	#if body is CharacterBody2D:
		#player_inside = false
		#label.visible = false
