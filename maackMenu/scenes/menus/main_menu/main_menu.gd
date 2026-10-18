extends MainMenu

@export var leaderboard_packed_scene : PackedScene
func _on_leader_board_button_pressed() -> void:
	$BackgroundMusicPlayer.stop()
	_open_sub_menu(leaderboard_packed_scene)

func _on_credits_button_pressed() -> void:
	$BackgroundMusicPlayer.stop()
