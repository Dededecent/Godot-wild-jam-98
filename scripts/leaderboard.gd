extends Control
@export var leaderboardSlot: PackedScene
var empty := false
func _ready():
	var displayed = 0
	if Globals.leaderboard.is_empty():
		add_to_leaderboard("None yet :)", -100000000)
		empty = true
	for score in Globals.leaderboard:
		if displayed > 10:
			return
		else:
			displayed += 1
			var newleaderboardslot = leaderboardSlot.instantiate()
			newleaderboardslot.get_node("%PlayerName").text = score.get("Name")
			newleaderboardslot.get_node("%SlotScore").text = str(score.get("score"))
			$VBoxContainer.add_child(newleaderboardslot)
			
		
func _on_back_pressed():
	if empty == true:
		Globals.leaderboard.clear()
	queue_free()


func add_to_leaderboard(player: String, player_points: int) -> void:
	var entry = {"Name": player, "score": player_points}
	Globals.leaderboard.append(entry)
	Globals.leaderboard.sort_custom(func(a,b): return a["score"] > b["score"])
