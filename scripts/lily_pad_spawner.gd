extends Node2D

@export var SpawnDirection: Vector2
@export var Spawnee: PackedScene
@export var SpawnedMax: int
@export var SpawnedMin: int
@export var TimerLength: int
@export var UseTimer: bool = true
@export var UseDirection: bool = true
@export var InstaSpawn: bool = true
@export var sendMulti: bool = true
var numPads: int



func _ready() -> void:
	position = position.snapped(Vector2(8,8))
	numPads = (randi() % (SpawnedMax+1 - SpawnedMin)) + SpawnedMin
	if InstaSpawn:
		spawnPad()



func spawnPad():
	var newPad = Spawnee.instantiate()
	if UseDirection:
		newPad.direction = SpawnDirection
	numPads -= 1
	self.call_deferred("add_child", newPad)
	if newPad.has_signal("Dead"):
		newPad.Dead.connect(get_parent()._player_dead)
	if newPad.has_signal("Win"):
		newPad.Win.connect(get_parent()._player_win)
	if numPads <= 0:
		numPads = (randi() % (SpawnedMax+1 - SpawnedMin)) + SpawnedMin
		if UseTimer:
			$Timer.start(TimerLength)		

func _on_area_exited(_area: Area2D) -> void:
	if !sendMulti:
		return
	if !$Timer.is_stopped():
		return
	else:
		spawnPad()


func _on_timer_timeout() -> void:
	if UseTimer:
		spawnPad()


func _spawn_signal() -> void:
	spawnPad()
