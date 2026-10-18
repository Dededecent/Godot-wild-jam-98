extends VBoxContainer

var points := Globals.points
var Name: String
@export var MainMenu: PackedScene



func _on_save_pressed() -> void:
	if %NameEntry.get_text() != '':
		add_to_leaderboard(%NameEntry.get_text(), Globals.points)
		Globals.points = 0
		print("test")
		get_tree().change_scene_to_packed(MainMenu)

	

		
func add_to_leaderboard(player: String, player_points: int) -> void:
	var entry = {"Name": player, "score": player_points}
	Globals.leaderboard.append(entry)
	Globals.leaderboard.sort_custom(func(a,b): return a["score"] > b["score"])
