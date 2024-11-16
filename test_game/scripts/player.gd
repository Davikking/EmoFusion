extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -180.0


@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var player_name = self.name

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
	
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
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

	move_and_slide()
