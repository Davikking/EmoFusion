extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -180.0

enum Ability {JOY, SADNESS}

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var player_name = self.name
@onready var player = %P1
@onready var tutorial = preload("res://scenes/tutorial.tscn")
@onready var tileMap = %TileMap
var final_direction = 1
var in_water : bool = false  # Whether the player is in water
var water_slow_factor : float = 0.5  # Slow-down factor when in water

var current_ability : Ability = Ability.JOY  # Default to Joy ability
@export var block_scene : PackedScene
var water_scene : PackedScene

func _ready():
	# Preload the scenes for block and water creation
	block_scene = preload("res://scenes/Block.tscn")
	water_scene = preload("res://scenes/water.tscn")

func _ready() -> void:
	if player_name == "P1":
		animated_sprite.modulate = Color(0.8, 0.6, 1.0)
	else:
		animated_sprite.modulate = Color(0.6, 1.0, 0.8)
	
	

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed(player_name+"_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# -1 = left, 1 = right
	var direction := Input.get_axis(player_name+"_move_left", player_name+"_move_right")
	#print(direction)
	
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
		final_direction = 1
	elif direction < 0:
		animated_sprite.flip_h = true
		final_direction = -1
		
	# Animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
		
	# movement logic
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# Handle input for JoyCharacter
		if Input.is_action_just_pressed("joyAbl"):
			player.use_ability()
		#if Input.is_action_just_pressed("switch_joy_ability"):
			#joy_character.switch_ability()

	# Handle input for SadnessCharacter
		#if Input.is_action_just_pressed("sadness_ability"):
			#sadness_character.use_ability()
		#if Input.is_action_just_pressed("switch_sadness_ability"):
			#sadness_character.switch_ability()

	# Check if both characters are using the same ability simultaneously
		#if joy_character.current_ability == sadness_character.current_ability:
			#empathy_meter.on_both_same_emotion()

	move_and_slide()
	
func switch_ability():
	# Switch between JOY and SADNESS abilities
	if current_ability == Ability.JOY:
		current_ability = Ability.SADNESS
	else:
		current_ability = Ability.JOY

func use_ability():
	var direction := Input.get_axis(player_name+"_move_left", player_name+"_move_right")
	print(direction)
	# Flip the Sprite
	var x_offset = 32
	var y_offset = 0
	var block = block_scene.instantiate()
	#print(block)
	print(player.global_position)
	print(final_direction)
	
	block.position.x = (player.global_position.x + (final_direction * x_offset))
	block.position.y = (player.global_position.y + (final_direction * y_offset))
	#var map = tileMap.instantiate()
	print(tileMap)
	tileMap.add_child(block)
	print(block)
	
	#create_block(block.position.x, block.position.y)
	
	'''
	var block_position: Vector2
	if current_ability == Ability.JOY:
		# Calculate the position in front of the player
		block_position = Vector2(player.global_position.x + (direction * 64), player.global_position.y)
		var block = block_scene.instance()
		block.position = position
		get_parent().add_child(block)
	elif current_ability == Ability.SADNESS:
		# Use the provided position for water creation
		create_water(position)
		'''

	
	
