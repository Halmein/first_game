extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -290.0
const DEATH = -180.0
var deathBool = false
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var shape: CollisionShape2D = $Shape
@onready var death_sound: AudioStreamPlayer2D = $death_sound

func jump():
	velocity.y = JUMP_VELOCITY
	
func die():
	velocity.y = DEATH
	deathBool = true
	death_sound.play()
	shape.queue_free()
	

func _physics_process(delta: float) -> void:
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	#flip_h
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true
	
	#play animation
	if direction == 0 :
		sprite.play("idle")
	else:
		sprite.play("run")
	
	#Test
	#if Input.is_action_just_pressed("move_left"):
	#	sprite.flip_h = true
	#if Input.is_action_just_pressed("move_right"):
	#	sprite.flip_h = false
	
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		sprite.play("jump")
		velocity.y = JUMP_VELOCITY
	
	#Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func _process(_delta):
	#Engine.time_scale = 0.5
	if deathBool == true:
		sprite.play("death")
	else:
		pass
	
	move_and_slide()
