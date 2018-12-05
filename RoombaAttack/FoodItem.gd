extends "res://Scripts/BasicFoodClass.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
<<<<<<< Updated upstream
var score;

func _ready():
	InitializeFoodItem()
=======
>>>>>>> Stashed changes

func _process(delta):
	if(!is_alive):
	#	add_coins(score)
		queue_free()
	
	if(GetCurrentHealth() <= 0):
		is_alive = false


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	SetMaxHealth(1)
	SetCurrentHealth(GetMaxHealth())
	pass

""" This Functionality should be in the GameManager
func add_coins(score):
	score += 10

#Getters and Setters
func GetCurrentScore():
	return currentScore
"""