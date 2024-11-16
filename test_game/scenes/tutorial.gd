extends Node2D

@onready var player = %P1
@onready var p1welcome = %P1WelcomePanel
@onready var p1jump = %P1JumpPanel
@onready var p1sadness = %P1SadnessPanel
@onready var p1joy = %P1JoyPanel
@onready var p1final = %P1FinalPanel

func _ready() -> void:
	# Ensure all panels are hidden initially
	p1welcome.hide()
	p1jump.hide()
	p1sadness.hide()
	p1joy.hide()
	p1final.hide()

func _on_p_1_welcome_body_entered(body: Node2D) -> void:
	if body == player:
		p1welcome.popup() # Show the welcome panel

func _on_p_1_welcome_body_exited(body: Node2D) -> void:
	if body == player:
		p1welcome.hide() # Hide the welcome panel

func _on_p_1_jump_body_entered(body: Node2D) -> void:
	if body == player:
		p1jump.popup() # Show the jump panel

func _on_p_1_jump_body_exited(body: Node2D) -> void:
	if body == player:
		p1jump.hide() # Hide the jump panel

func _on_p_1_sadness_body_entered(body: Node2D) -> void:
	if body == player:
		p1sadness.popup() # Show the sadness panel

func _on_p_1_sadness_body_exited(body: Node2D) -> void:
	if body == player:
		p1sadness.hide() # Hide the sadness panel

func _on_p_1_joy_body_entered(body: Node2D) -> void:
	if body == player:
		p1joy.popup() # Show the joy panel

func _on_p_1_joy_body_exited(body: Node2D) -> void:
	if body == player:
		p1joy.hide() # Hide the joy panel

func _on_p_1_final_body_entered(body: Node2D) -> void:
	if body == player:
		p1final.popup() # Show the final panel

func _on_p_1_final_body_exited(body: Node2D) -> void:
	if body == player:
		p1final.hide() # Hide the final panel
