extends Area2D
const ANIM_SPEED := 10
const SIZE := 16
var realPosition: Vector2
var moving := false
var inputs := {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}
var won: bool = false
signal Dead
signal Win

func _ready() -> void:
	position = position.snapped(Vector2(SIZE/2,SIZE/2))
	realPosition = position
func _unhandled_input(event: InputEvent) -> void:
	for direction in inputs.keys():
		if event.is_action(direction):
			if moving:
				return
			else:
				move(inputs[direction])

func _physics_process(delta: float) -> void:
	if has_overlapping_bodies() and !won:
		win()

func _on_body_entered(_body) -> void:
	pass
	#win()					

func move(direction: Vector2):
	var raycast: RayCast2D = $RayCast2D	
	var padcast: RayCast2D = $PadCast
	
	raycast.set_target_position(direction*SIZE)
	raycast.force_raycast_update()
	padcast.set_target_position(direction*SIZE)
	padcast.force_raycast_update()

	if  !raycast.is_colliding() or padcast.is_colliding():
		var tween = create_tween()
		realPosition += direction * SIZE
		tween.tween_property(self, "position",
		realPosition, 1.0/ANIM_SPEED).set_trans(Tween.TRANS_SINE)
		moving = true
		await tween.finished
		moving = false
		position = position.snapped(Vector2(SIZE/2,SIZE/2))
	else:
		var tween = create_tween()
		realPosition += direction * SIZE
		tween.tween_property(self, "position",
		realPosition, 1.0/ANIM_SPEED).set_trans(Tween.TRANS_SINE)
		moving = true
		await tween.finished
		moving = false
		position = position.snapped(Vector2(SIZE/2,SIZE/2))
		die()
func die():
	Dead.emit()
	queue_free()
func win():
	if !won:
		won = true
		Win.emit()
		queue_free()
	
