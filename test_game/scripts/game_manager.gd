# game_manager.gd
extends Node

var joy_character : Node
var sadness_character : Node
var empathy_meter : Node

func _ready():
	# Instance the characters and empathy meter from the main scene
	joy_character = $P1
	sadness_character = $P2
	#empathy_meter = $EmpathyMeter

	# Connect empathy signal to an event
	#empathy_meter.connect("empathy_threshold_reached", self, "_on_empathy_threshold_reached")

func _on_empathy_threshold_reached():
	# Handle the event when empathy threshold is reached (e.g., adjust game difficulty)
	print("Empathy threshold reached! One character becomes harder to control.")

func _process(delta):
	# Handle input for JoyCharacter
	if Input.is_action_just_pressed("joyAbl"):
		joy_character.use_ability()
	if Input.is_action_just_pressed("switch_joy_ability"):
		joy_character.switch_ability()

	# Handle input for SadnessCharacter
	if Input.is_action_just_pressed("sadness_ability"):
		sadness_character.use_ability()
	if Input.is_action_just_pressed("switch_sadness_ability"):
		sadness_character.switch_ability()

	# Check if both characters are using the same ability simultaneously
	if joy_character.current_ability == sadness_character.current_ability:
		empathy_meter.on_both_same_emotion()
