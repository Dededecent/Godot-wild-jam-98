extends Node3D
var flipped :bool
enum Camera{FRONT, GAME, LEFT, RIGHT, BACK}
var CameraState: Camera = Camera.FRONT
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("flip"):
		if flipped:
			$Camera3D.look_at($WallFront.global_position)
			flipped = false
			CameraState = Camera.FRONT

		else:
			$Camera3D.look_at($Sprite3D.global_position)
			flipped = true
			CameraState = Camera.GAME
	$SubViewport.push_input(event, false)
