extends "res://BaseRoombaMob.gd"

var direction = 1.0
var collisionWaiter = 1000

var minRot = 0
var maxRot = 1

func _ready():

	direction = spawn_direction * PI
	print("Roomba Ready")

func _physics_process(delta):
	move_and_slide(velocity)
	velocity.x = rand_range(min_speed, max_speed) * direction
	velocity.y = rand_range(min_speed, max_speed) * direction
	#print("doing physics")
	
	if velocity.x != 0:
		$Sprite.flip_v = false
		$Sprite.flip_h =  velocity.x < 0
	elif velocity.y != 0:
		$Sprite.flip_v = velocity.y > 0
		
	CollisionCooldown()
		
	if OnCollision():
		#self.move_and_collide()
		direction = rand_rang(minRot, maxRot) * PI

func CollisionCooldown():
	while collisionWaiter > 0:
		collisionWaiter -= 1
	#print("Cooldown complete")
func OnCollision():
	if (self.get_slide_count() > 0 && collisionWaiter == 300):
		var collision = self.get_slide_collision(0).collider
		if collision != null:
			return true
		else:
			return false
