extends Area2D
@export var direction: Vector2


var realPosition := position
var SIZE := 16

func move():
	if !has_overlapping_bodies():
		queue_free()
	realPosition += direction * SIZE

func _physics_process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	move()
