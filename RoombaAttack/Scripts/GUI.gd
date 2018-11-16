extends CanvasLayer

signal start_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	
func show_game_over():
	show_message("Game Over!")
	
func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
func update_score(score):
		$ScoreLabel.text = str(score)