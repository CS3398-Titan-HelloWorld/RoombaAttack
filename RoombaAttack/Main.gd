extends Node
var score
export (PackedScene) var RoombaMob

func _ready():
	randomize()

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$GUI.show_game_over()
func new_game():
	score = 0
	$GUI.update_score(score)
	$Player.start($StartPosition.position)
	$AUDIO.play()
	$StartTimer.start()
	
	
	var roomb = RoombaMob.instance()
	add_child(roomb)
	roomb.start($RoombaSpawn.position)
	var direction = $RoombaSpawn.rotation + PI * roomb.spawn_direction
	roomb.set_linear_velocity(Vector2(rand_range(roomb.min_speed, roomb.max_speed), 0).rotated(direction))
	
func _input(event):
	if Input.is_action_pressed("ui_escape"):
		get_tree().quit()
#Not needed with the changing of levels
#func _on_EndPosition_body_entered(body):
	#game_over()