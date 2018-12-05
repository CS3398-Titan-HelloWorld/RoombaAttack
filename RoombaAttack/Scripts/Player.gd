extends "res://Scripts/EntityClass.gd"

const TYPE = "Player"


export (int) var speed
var screensize
var velocity = Vector2()
var body
var hitStun = 10
var health = 3
var score = 1000
onready var health_label = get_node("HUD/health_indicator")
onready var score_label = get_node("HUD/score_label")


func _ready():
	health_label.set_text("Health:" + str(health))
	SetCurrentHealth(GetMaxHealth())
	SetLifeStatus(true)
	screensize = get_viewport_rect().size
	pass
func _process(delta):
	score -= 1
	score_label.set_text("\nScore:" + str(score))
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
func returnScore():
	return score

func _physics_process(delta):
	move_and_slide(velocity)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "Right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h =  velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "Up"
		$AnimatedSprite.flip_v = velocity.y > 0
		
	if(self.get_slide_count() > 0 && self.get_slide_collision(0).collider.has_method("GetCurrentHealth") ):
		OnPlayerCollision()

""" Use OnPlayerCollision() to add new collision events involving the player"""

func OnPlayerCollision():
	var collision = self.get_slide_collision(0).collider
	#print("I entered a body!")
	CollisionCooldown()
	CollisionCooldownReset()
	
	if collision.GetType() == "Roomba" && hitStun == 10:
		hitStun -= 1
		hide()
		print("Losing Health")
		$squish.play()
		#$CollisionShape.disabled = true
		self.ReduceHealth()
	elif collision.GetType() == "Food" && hitStun == 10:

		print("Found the food!!!")
		self.IncrementHealth()
		if (health < 4):
			health +=1
		health_label.set_text("Health:" + str(health))
		collision.DecrementHealth()
		self.IncrementHealth()
		print("Found the food!!!")
		print(GetCurrentHealth())


func ReduceHealth():
	if GetCurrentHealth() < 0:
		SetCurrentHealth(GetCurrentHealth() - 1)
		health = GetCurrentHealth()
		health_label.set_text("Health:" + str(health))
	if GetCurrentHealth() == 0:
		is_alive = false

func IncrementHealth():
	if  GetCurrentHealth() < GetMaxHealth():
		SetCurrentHealth(GetCurrenthealth() + 1)

		health = GetCurrentHealth()
		health_label.set_text("Health:" + str(health))
	else:
		print("Your health is maxed out at:")
		print (GetCurrentHealth())

func CollisionCooldown():
	while hitStun > 0:
		hitStun -= 1

func CollisionCooldownReset():
	hitStun = 10

