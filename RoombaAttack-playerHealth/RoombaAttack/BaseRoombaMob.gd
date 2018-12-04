''' Author: Porter D. Chase '''
''' This class is for the base Roomba Mob. Will Extend the health class and then add collision detection signals '''

extends "res://Scripts/EntityClass.gd"

const TYPE = "Roomba"
signal roomba_hit_obstacle

var damageDealt = 1
var moveSpeed = 60
var spritedir = "Down"

''' This is currently useless, to be implemented later '''
func CollisionDetection(body):
	if body.Get("TYPE") != "Player":
		emit("roomba_hit_obstacle")

func RandoMovement():
	var motion = movedir.normalized() * moveSpeed
	move_and_slied(motion, Vector2(0,0))

func spriteDirLoop():
	match movedir:
		Vector2(-1,0):
			spritedir = "Left"
		Vector2(1,0):
			spritedir = "Right"
		Vector2(0,-1):
			spritedir = "Up"
		Vector2(0,1):
			spritedir = "Down"


'''Getters and Setters'''
func GetDamageDealt():
	return damageDealt
func SetDamageDealt(damage):
	 damageDealt = damage

func GetMoveSpeed():
	return moveSpeed
func SetMoveSpeed(speed):
	moveSpeed = speed

func GetType():
	return TYPE