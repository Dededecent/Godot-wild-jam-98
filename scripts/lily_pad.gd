extends Area2D
@export var direction: Vector2
var realPosition := position
const SIZE := 16
const ANIM_SPEED := 4
var moving := false

func _ready():
	position = position.snapped(Vector2(SIZE/2,SIZE/2))
	move()
	
func move():
	realPosition += direction * SIZE
	
	if moving == true:
		return
	else:
		var tween = create_tween()
		tween.tween_property(self, "position",
		realPosition, 1.0/ANIM_SPEED).set_trans(Tween.TRANS_SINE)
		moving = true
		for area in get_overlapping_areas():
			if area.has_method("move") and !area.moving:
				area.move(direction)
		await tween.finished
		position = position.snapped(Vector2(SIZE/2,SIZE/2))
		moving = false
	if !has_overlapping_bodies():
		queue_free()

	

func _on_timer_timeout() -> void:
	move()
