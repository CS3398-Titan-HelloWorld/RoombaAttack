extends KinematicBody2D

export (int) var speed
var screensize
var velocity = Vector2()

func _ready():
	screensize = get_viewport_rect().size
	pass

func _process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x +=1
	if Input.is_action_pressed("ui_left"):
		velocity.x -=1
	if Input.is_action_pressed("ui_down"):
		velocity.y +=1
	if Input.is_action_pressed("ui_up"):
		velocity.y -=1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
func _physics_process(delta):
	move_and_slide(velocity)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "Right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h =  velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "Up"
		$AnimatedSprite.flip_v = velocity.y > 0

func on_Player_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape.disabled = true

