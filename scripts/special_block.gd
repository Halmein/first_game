extends Area2D

@onready var game_manager: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(_body):
	GameManager.score += 10
	print("POWER UP")
	animation_player.play("pickup")
