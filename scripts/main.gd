extends Node3D
var flipped :bool
enum Camera{FRONT, GAME, LEFT, RIGHT, BACK}
var CameraState: Camera = Camera.FRONT
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("flip"):
		if CameraState == Camera.GAME:
			$Camera3D.look_at($WallFront.global_position)
			CameraState = Camera.FRONT
			$Camera3D/GUIPanel3D_left.hide()
			$Camera3D/GUIPanel3D_right.hide()

		else:
			$Camera3D.look_at($Sprite3D.global_position)
			CameraState = Camera.GAME
			$Camera3D/GUIPanel3D_left.show()
			$Camera3D/GUIPanel3D_right.show()
	$SubViewport.push_input(event, false)
func screen_left() -> void:
	match CameraState:
		Camera.FRONT:
			$Camera3D.look_at($WallLeft.global_position)
			CameraState = Camera.LEFT
			print("test")
		Camera.LEFT:
			$Camera3D.look_at($WallBack.global_position)
			CameraState = Camera.BACK
			print("test")
		Camera.BACK:
			$Camera3D.look_at($WallRight.global_position)
			CameraState = Camera.RIGHT
			print("test")
		Camera.RIGHT:
			$Camera3D.look_at($WallFront.global_position)
			CameraState = Camera.FRONT
			print("test")
func screen_right() -> void:
	match CameraState:
		Camera.FRONT:
			$Camera3D.look_at($WallRight.global_position)
			CameraState = Camera.RIGHT
			print("test")
		Camera.LEFT:
			$Camera3D.look_at($WallFront.global_position)
			CameraState = Camera.FRONT
			print("test")
		Camera.BACK:
			$Camera3D.look_at($WallLeft.global_position)
			CameraState = Camera.LEFT
			print("test")
		Camera.RIGHT:
			$Camera3D.look_at($WallFront.global_position)
			CameraState = Camera.LEFT
			print("test")
