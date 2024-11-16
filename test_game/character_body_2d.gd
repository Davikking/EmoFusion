extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

enum Ability {JOY, SADNESS}

@onready var player = %P1

var current_ability : Ability = Ability.JOY  # Default to Joy ability
var block_scene : PackedScene
var water_scene : PackedScene

func _ready():
	# Preload the scenes for block and water creation
	block_scene = preload("res://scenes/Block.tscn")
   # water_scene = preload("res://water.tscn")

func switch_ability():
	# Switch between JOY and SADNESS abilities
	if current_ability == Ability.JOY:
		current_ability = Ability.SADNESS
	else:
		current_ability = Ability.JOY

func use_ability():
	var block_position: Vector2
	if current_ability == Ability.JOY:
		# Calculate the position in front of the player
		block_position = player.global_position + player.facing_direction * 64
		create_block(block_position)
	elif current_ability == Ability.SADNESS:
		# Use the provided position for water creation
		create_water(position)

func create_block(position: Vector2):
	var block = block_scene.instance()
	block.position = position
	get_parent().add_child(block)

func create_water(position: Vector2):
	var water = water_scene.instance()
	water.position = position
	get_parent().add_child(water)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
