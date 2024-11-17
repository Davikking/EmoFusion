extends Node2D

@onready var P1 = %P1
@onready var P2 = %P2

@onready var p1welcome = %P1WelcomePanel
@onready var p1jump = %P1JumpPanel
@onready var p1sadness = %P1SadnessPanel
@onready var p1joy = %P1JoyPanel
@onready var p2welcome = %P2WelcomePanel
@onready var p2jump = %P2JumpPanel
@onready var p2sadness = %P2SadnessPanel
@onready var p2joy = %P2JoyPanel
@onready var final = %FinalPanel

func _ready() -> void:
	p1welcome.popup()
	p1jump.hide()
	p1sadness.hide()
	p1joy.hide()
	
	p2welcome.popup()
	p2jump.hide()
	p2sadness.hide()
	p2joy.hide()
	
	final.hide()


func _process(delta: float) -> void:
	if %Soundtrack.playing == false:
		%Soundtrack.play()
		
###################################################################

# P1 Event Handlers
func _on_p_1_welcome_body_entered(body: Node2D) -> void:
	if body == P1:
		p1welcome.popup()

func _on_p_1_welcome_body_exited(body: Node2D) -> void:
	if body == P1:
		p1welcome.hide()

func _on_p_1_jump_body_entered(body: Node2D) -> void:
	if body == P1:
		p1jump.popup()

func _on_p_1_jump_body_exited(body: Node2D) -> void:
	if body == P1:
		p1jump.hide()

func _on_p_1_sadness_body_entered(body: Node2D) -> void:
	if body == P1:
		p1sadness.popup()

func _on_p_1_sadness_body_exited(body: Node2D) -> void:
	if body == P1:
		p1sadness.hide()

func _on_p_1_joy_body_entered(body: Node2D) -> void:
	if body == P1:
		p1joy.popup()

func _on_p_1_joy_body_exited(body: Node2D) -> void:
	if body == P1:
		p1joy.hide()

###################################################################

# P2 Event Handlers
func _on_p_2_welcome_body_entered(body: Node2D) -> void:
	if body == P2:
		p2welcome.popup()

func _on_p_2_welcome_body_exited(body: Node2D) -> void:
	if body == P2:
		p2welcome.hide()

func _on_p_2_jump_body_entered(body: Node2D) -> void:
	if body == P2:
		p2jump.popup()

func _on_p_2_jump_body_exited(body: Node2D) -> void:
	if body == P2:
		p2jump.hide()

func _on_p_2_sadness_body_entered(body: Node2D) -> void:
	if body == P2:
		p2sadness.popup()

func _on_p_2_sadness_body_exited(body: Node2D) -> void:
	if body == P2:
		p2sadness.hide()

func _on_p_2_joy_body_entered(body: Node2D) -> void:
	if body == P2:
		p2joy.popup()

func _on_p_2_joy_body_exited(body: Node2D) -> void:
	if body == P2:
		p2joy.hide()

###################################################################

func _on_final_body_entered(body: Node2D) -> void:
	if body == P1 || body == P2:
		final.popup()

func _on_final_body_exited(body: Node2D) -> void:
	if body == P1 || body == P2:
		final.hide()

###################################################################

var is_p1_in_final_area = false
var is_p2_in_final_area = false
var is_bridge_up = false

func build_bridge() -> void:
	$FinalPart/FinalPlatform/FP1/AnimationPlayer.play("up")
	$FinalPart/FinalPlatform/FP2/AnimationPlayer.play("up")
	$FinalPart/FinalPlatform/FP3/AnimationPlayer.play("up")
	$FinalPart/FinalPlatform/FP4/AnimationPlayer.play("up")
	$FinalPart/FinalPlatform/FP5/AnimationPlayer.play("up")
	
	
func _on_final_area_body_entered(body: Node2D) -> void:
	
	if body == P1:
		is_p1_in_final_area = true
		
	if body == P2:
		is_p2_in_final_area = true
		
	if is_p1_in_final_area && is_p2_in_final_area && !is_bridge_up:
		build_bridge()
		is_bridge_up = true


func _on_final_area_body_exited(body: Node2D) -> void:
	
	if body == P1:
		is_p1_in_final_area = false
		
	if body == P2:
		is_p2_in_final_area = false
		
