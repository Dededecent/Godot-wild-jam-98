extends Node2D
@export var lives: int = 3
signal GuySpawn
signal Points
signal LivesChanged
signal GameOver
signal EagleSpawn
var EagleTimeLength: float

func _ready() -> void:
	EagleTimeLength = randf_range(8,12)
	$EagleTimer.start(EagleTimeLength)

func _physics_process(delta: float) -> void:
	print($EagleSpawner.position)


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

func _on_eagle_timer_timeout() -> void:
	if $GuySpawner.get_node_or_null("guy") != null:
		$EagleSpawner.global_position.y = $GuySpawner/guy.global_position.y
	$EagleScreech.play()
	EagleSpawn.emit()
	if Globals.points >= 25:
		EagleTimeLength = randf_range(7,10)
		$EagleTimer.start(EagleTimeLength)
	else:
		EagleTimeLength = randf_range(8,12)
		$EagleTimer.start(EagleTimeLength)

