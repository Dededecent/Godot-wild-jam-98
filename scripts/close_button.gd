extends Button
signal credits_closed

func _pressed() -> void:
	credits_closed.emit()

