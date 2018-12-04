extends "res://Scripts/BasicFoodClass.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var score;

func _ready():
	InitializeFoodItem()

func _process(delta):
	if(!is_alive):
		queue_free()
	
	if(GetCurrentHealth() <= 0):
		is_alive = false

"""
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
func _on_Aread2D_body_entered(body):
	if body.get_name() == "Player":
		if body.add_coins(score):
			queue_free()
func add_coins(score):
	score += 10
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass """