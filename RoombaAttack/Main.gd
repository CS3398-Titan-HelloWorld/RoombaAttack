extends Node
export (PackedScene) var Mob
var score
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
	$StartTimer.start()
func _input(event):
	if Input.is_action_pressed("ui_escape"):
		get_tree().quit()
#Not needed with the changing of levels
#func _on_EndPosition_body_entered(body):
	#game_over()