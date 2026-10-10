extends Area2D
const ANIM_SPEED := 3
const SIZE := 16
var realPosition: Vector2
var moving := false
var inputs := {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}


func _ready() -> void:
	realPosition = position
func _unhandled_input(event: InputEvent) -> void:
	for direction in inputs.keys():
		if event.is_action(direction):
			if moving:
				return
			else:
				move(inputs[direction])
					


func move(direction: Vector2):
	var raycast: RayCast2D = $RayCast2D	
	
	print("truthzooka")
	raycast.set_target_position(direction*SIZE)
	raycast.force_raycast_update()
	if !raycast.is_colliding():
		var tween = create_tween()
		realPosition += direction * SIZE
		tween.tween_property(self, "position",
		realPosition, 1.0/ANIM_SPEED).set_trans(Tween.TRANS_SINE)
		moving = true
		await tween.finished
		moving = false
	else:
		var tween = create_tween()
		realPosition += direction * SIZE
		tween.tween_property(self, "position",
		realPosition, 1.0/ANIM_SPEED).set_trans(Tween.TRANS_SINE)
		moving = true
		await tween.finished
		moving = false
		queue_free()
		

		
		
	
