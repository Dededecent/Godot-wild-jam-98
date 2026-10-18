extends Control
@export var leaderboardSlot: PackedScene
func _ready():
	var displayed = 0
	add_to_leaderboard("test1", 100)
	for score in Globals.leaderboard:
		if displayed > 10:
			return
		else:
			displayed += 1
			var newleaderboardslot = leaderboardSlot.instantiate()
			newleaderboardslot.get_node("%PlayerName").text = score.get("Name")
			newleaderboardslot.get_node("%SlotScore").text = str(score.get("score"))
			$VBoxContainer.add_child(newleaderboardslot)
			
		



func add_to_leaderboard(player: String, player_points: int) -> void:
	var entry = {"Name": player, "score": player_points}
	Globals.leaderboard.append(entry)
	Globals.leaderboard.sort_custom(func(a,b): return a["score"] > b["score"])
