extends Label

func _process(delta: float) -> void:
	self.text = "Você fez " + str(GameManager.score) + " pontos"
