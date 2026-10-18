extends Node2D
@export var lives: int = 3
signal GuySpawn
signal Points
signal LivesChanged
signal GameOver

func _ready() -> void:
	pass

func _player_dead() -> void:
	lives_changed(1)
	print(lives)
	GuySpawn.emit()
func _player_win() -> void:
	Points.emit()
	GuySpawn.emit()

func lives_changed(lost: int):
	lives -= lost
	if lives <= 0:
		GameOver.emit()
	LivesChanged.emit()
