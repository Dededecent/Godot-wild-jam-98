extends Node2D
@export var lives: int = 3
signal GuySpawn
signal Points

func _ready() -> void:
	pass

func _player_dead() -> void:
	lives -= 1
	print(lives)
	if lives == 0:
		game_over()
	else:
		GuySpawn.emit()
func _player_win() -> void:
	Points.emit()
	GuySpawn.emit()
func game_over():
	print("test")
	
