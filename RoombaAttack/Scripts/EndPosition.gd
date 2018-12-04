#EndPosition.gd
extends Area2D
signal hit
var score


export(String, FILE, "*.tscn") var next_level
func _ready():
	get_viewport().audio_listener_enable_2d = true
	$AUDIO.play()
	pass

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			$crunch.play()
			get_tree().change_scene(next_level)
			score = body.returnScore()