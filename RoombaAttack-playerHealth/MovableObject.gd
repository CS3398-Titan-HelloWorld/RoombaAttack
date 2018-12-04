extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass
func _physics_process(delta):
	if(is_colliding()):
		if(get_collider() == get_node("Player"):
			//apply movement
			queue_free()
	

