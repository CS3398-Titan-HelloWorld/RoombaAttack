''' Author: Porter D. Chase '''
''' This class is for the base Roomba Mob. Will Extend the health class and then add collision detection signals '''

extends "res://Scripts/EntityClass.gd"

const TYPE = "Roomba"
signal roomba_hit_obstacle

''' This is currently useless, to be implemented later '''

func CollisionDetection(body):
	if body.Get("TYPE") != "Player":
		emit("roomba_hit_obstacle")