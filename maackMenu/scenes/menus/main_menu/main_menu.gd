extends MainMenu

@export var leaderboard_packed_scene : PackedScene
@export var credits_packed_scene : PackedScene
var leaderboard : Node
var credits : Node

func _on_leader_board_button_pressed() -> void:
	$BackgroundMusicPlayer.stop()
	$LeaderBoardMusic.play()
	leaderboard = _open_sub_menu(leaderboard_packed_scene)
	leaderboard.get_node("Back").leaderboard_closed.connect(_leaderboard_closed)

func _on_credits_button_pressed() -> void:
	credits = _open_sub_menu(credits_packed_scene)
	credits.get_node("ContentContainer/BoxContainer/MenuButtonsMargin/MenuButtons/CloseButton").credits_closed.connect(_credits_closed)
	$BackgroundMusicPlayer.stop()
	$CreditsMusic.play()

func _leaderboard_closed():
	$LeaderBoardMusic.stop()
	$BackgroundMusicPlayer.play()
func _credits_closed():
	$CreditsMusic.stop()
	$BackgroundMusicPlayer.play()
	
