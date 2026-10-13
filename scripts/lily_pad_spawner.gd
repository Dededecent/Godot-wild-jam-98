extends Node2D

@export var SpawnDirection: Vector2
@export var Spawnee: PackedScene
@export var SpawnedMax: int
@export var SpawnedMin: int
@export var TimerLength: int
var numPads: int



func _ready() -> void:
	position = position.snapped(Vector2(8,8))
	numPads = (randi() % (SpawnedMax+1 - SpawnedMin)) + SpawnedMin

	spawnPad()



func spawnPad():
	var newPad = Spawnee.instantiate()
	newPad.direction = SpawnDirection
	numPads -= 1
	self.call_deferred("add_child", newPad)
	if numPads <= 0:
		numPads = (randi() % (SpawnedMax+1 - SpawnedMin)) + SpawnedMin
		$Timer.start(TimerLength)		



func _on_area_exited(_area: Area2D) -> void:
	if !$Timer.is_stopped():
		return
	else:
		spawnPad()


func _on_timer_timeout() -> void:
	spawnPad()
