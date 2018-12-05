extends "res://Scripts/BasicFoodClass.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var score;

func _ready():
	InitializeFoodItem()
	SetMaxHealth(1)
	SetCurrentHealth(GetMaxHealth())
	pass

func _process(delta):
	if(!is_alive):
	#	add_coins(score)
		queue_free()
	
	if(GetCurrentHealth() <= 0):
		is_alive = false

""" This Functionality should be in the GameManager
func add_coins(score):
	score += 10

#Getters and Setters
func GetCurrentScore():
	return currentScore
"""