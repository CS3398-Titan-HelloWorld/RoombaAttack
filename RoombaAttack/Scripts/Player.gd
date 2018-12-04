extends "res://Scripts/EntityClass.gd"

const TYPE = "Player"


export (int) var speed
var screensize
var velocity = Vector2()
var body
var hitStun = 10

func _ready():
	SetCurrentHealth(GetMaxHealth())
	SetLifeStatus(true)
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
	
	if(self.get_slide_count() > 0 && self.get_slide_collision(0).collider.has_method("GetCurrentHealth") ):
		OnPlayerCollision()

func _physics_process(delta):
	move_and_slide(velocity)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "Right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h =  velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "Up"
		$AnimatedSprite.flip_v = velocity.y > 0

""" Use OnPlayerCollision() to add new collision events involving the player"""

func OnPlayerCollision():
	var collision = self.get_slide_collision(0).collider
	#print("I entered a body!")
	if collision.GetType() == "Roomba" && hitStun == 10:
		hide()
		"""emit_signal("hit")"""
		$squish.play()
		$CollisionShape.disabled = true
		self.ReduceHealth()
	elif collision.GetType() == "Food" && hitStun == 10:
		print("Found the food!!!")
		self.IncrementHealth()
		collision.DecrementHealth()
	CollisionCooldown()

func ReduceHealth():
	if GetCurrentHealth() < 0:
		SetCurrentHealth(GetCurrentHealth() - 1)
	if GetCurrentHealth() == 0:
		is_alive = false

func IncrementHealth():
	if  GetCurrentHealth() < GetMaxHealth():
		SetCurrentHealth(GetCurrenthealth() + 1)

func CollisionCooldown():
	while hitStun > 0:
		hitStun -= 1

func CollisionCooldownReset():
	hitStun = 10

