extends Button

func _on_pressed() -> void:
	GameManager.score = 0
	get_tree().change_scene_to_file("res://scenes/game.tscn")
