extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("DEATH")
	Engine.time_scale = 0.5
	timer.start()
	body.die()
	

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	GameManager.score = 0
	get_tree().reload_current_scene()
