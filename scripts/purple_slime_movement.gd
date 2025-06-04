extends Node2D

var direction = 1
const speed = 60
var dead := false
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var killzone: CollisionShape2D = $Killzone/CollisionShape2D
@onready var death_sound: AudioStreamPlayer2D = $DeathSound

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dead == true:
		pass
	else:
		if ray_cast_right.is_colliding():
			direction = -1
			animated_sprite.flip_h = true
		if ray_cast_left.is_colliding():
			direction = 1
			animated_sprite.flip_h = false
		position.x += direction * speed * delta

func _on_death_area_body_entered(body: Node2D) -> void:
	dead = true
	body.jump()
	timer.start()
	killzone.queue_free()
	ray_cast_left.queue_free()
	ray_cast_right.queue_free()
	death_sound.play()
	animated_sprite.play("death")
	
func _on_timer_timeout() -> void:
	queue_free()
