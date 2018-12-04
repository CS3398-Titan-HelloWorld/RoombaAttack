extends KinematicBody2D

var velocity  = Vector2()
var speed = 200

func _physics_process(delta):
	var collision = move_and_slide(velocity  * delta)
	if collision:
		velocity += $Player.velocity
	  



