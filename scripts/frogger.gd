extends Node2D
@export var lives: int = 3

func player_dead() -> void:
	lives -= 1
	if lives == 0:
		game_over()
func game_over():
	print("test")
	
