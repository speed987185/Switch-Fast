extends CharacterBody2D


const SPEED = 350

const JUMP_VELOCITY = -800
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var sfx_jump: AudioStreamPlayer2D = $Sfx_jump
@onready var rolling: AudioStreamPlayer2D = $rolling




func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sfx_jump.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	
	#flipping 
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	#animations
	if direction == 0:
		animated_sprite.play("idle")
		
	else:
		animated_sprite.play("run")
		
		
		
	#directions
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
