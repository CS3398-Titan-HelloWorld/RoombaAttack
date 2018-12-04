#EndPosition.gd
extends Area2D
signal hit

export(String, FILE, "*.tscn") var next_level
<<<<<<< HEAD

func _ready():
	get_viewport().audio_listener_enable_2d = true
	$crunch.play()
	pass

=======
func _ready():
	get_viewport().audio_listener_enable_2d = true
	$AUDIO.play()
	pass
	
>>>>>>> 6c3e6003505bb1cb33a990c9b095cb79294c843c
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			$crunch.play()
			get_tree().change_scene(next_level)
			