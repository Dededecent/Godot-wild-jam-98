extends Node2D

@export var spawnDirection: Vector2
@export var lilyPad: PackedScene
var numPads: int

func _ready() -> void:
	numPads = randi() % 2 + 2 # random number between 2 and 3
	spawnPad()


func spawnPad():
	lilyPad.instantiate()
	lilyPad.direction = spawnDirection
	numPads -= 1
	if numPads == 0:
		$Timer.start()		


func _on_area_exited(area: Area2D) -> void:
	
