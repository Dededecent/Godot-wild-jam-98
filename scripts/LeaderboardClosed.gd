extends Button
signal leaderboard_closed

func _pressed():
	leaderboard_closed.emit()
