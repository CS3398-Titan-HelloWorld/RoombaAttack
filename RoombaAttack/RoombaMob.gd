extends "res://BaseRoombaMob.gd"

var direction = 1.0


func _ready():

	direction = spawn_direction* PI
	print("Roomba Ready")
func physics_process(delta):
	velocity = rand_range(min_speed, max_speed) * direction
	print("doing physics")
	
	if velocity.x != 0:
		$Sprite.flip_v = false
		$Sprite.flip_h =  velocity.x < 0
	elif velocity.y != 0:
		$Sprite.flip_v = velocity.y > 0
		
	if is_colliding():
		move_and_collide()
		direction = direction +( .5* PI)
	
