extends MainMenu

@export var leaderboard_packed_scene : PackedScene
func _on_leader_board_button_pressed() -> void:
	_open_sub_menu(leaderboard_packed_scene)
	
