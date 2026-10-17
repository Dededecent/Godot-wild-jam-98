extends Node3D
var flipped :bool
enum Camera{FRONT, GAME, LEFT, RIGHT, BACK}
var CameraState: Camera = Camera.FRONT
var points: int = 0
var TrainState: int = 3
var TrainSpeed: float = 4
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("flip"):
		if CameraState == Camera.GAME:
			$Camera3D.look_at($WallFront.global_position)
			CameraState = Camera.FRONT
			$Camera3D/GUIPanel3D_left.show()
			$Camera3D/GUIPanel3D_right.show()

		else:
			$Camera3D.look_at($Sprite3D.global_position)
			CameraState = Camera.GAME
			$Camera3D/GUIPanel3D_left.hide()
			$Camera3D/GUIPanel3D_right.hide()
	$SubViewport.push_input(event, false)
func screen_left() -> void:
	match CameraState:
		Camera.FRONT:
			$Camera3D.look_at($WallLeft.global_position)
			CameraState = Camera.LEFT
		Camera.LEFT:
			$Camera3D.look_at($WallBack.global_position)
			CameraState = Camera.BACK
		Camera.BACK:
			$Camera3D.look_at($WallRight.global_position)
			CameraState = Camera.RIGHT
		Camera.RIGHT:
			$Camera3D.look_at($WallFront.global_position)
			CameraState = Camera.FRONT
func screen_right() -> void:
	match CameraState:
		Camera.FRONT:
			$Camera3D.look_at($WallRight.global_position)
			CameraState = Camera.RIGHT
		Camera.LEFT:
			$Camera3D.look_at($WallFront.global_position)
			CameraState = Camera.FRONT
		Camera.BACK:
			$Camera3D.look_at($WallLeft.global_position)
			CameraState = Camera.LEFT
		Camera.RIGHT:
			$Camera3D.look_at($WallBack.global_position)
			CameraState = Camera.BACK
func _send_train() -> void:
	if TrainState <= 2:
		points += 1
		TrainState = 3
		$Points.text = "Points:" + str(points) + " " + str(TrainState) + " " + str(%Frogger.lives)
		if points >= 10:
			TrainSpeed = 3.5
		if points >= 20:
			TrainSpeed = 3
		if points >= 30:
			TrainSpeed = 2.5
		if points >= 50:
			TrainSpeed = 2.25
		if points >= 100:
			TrainSpeed = 1.75
		if points >= 120:
			TrainSpeed = 1.5

func _on_frogger_points() -> void:
	pass # Replace with function body.
	print("test")
	points += 1
	$Points.text = "Points:" + str(points) + " " + str(TrainState) + " " + str(%Frogger.lives)


func _on_train_timer_timeout() -> void:
	TrainState -= 1
	$Points.text = "Points:" + str(points) + " " + str(TrainState) + " " + str(%Frogger.lives)
	if TrainState == 0:
		%Frogger.lives -= 1
	$TrainTimer.start(TrainSpeed)
	
func game_over() -> void:
	pass
	
