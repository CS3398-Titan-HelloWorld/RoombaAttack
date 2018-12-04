''' Author: Porter D. Chase '''
''' This class is for the base Roomba Mob. Will Extend the health class and then add collision detection signals '''

##extends "res://Scripts/EntityClass.gd"
extends KinematicBody2D

const TYPE = "Roomba"
signal roomba_hit_player
export (int) var min_speed
export (int) var max_speed
export (float) var spawn_direction # the number multiplied by PI to get the radian

export (int) var damage
export (int) var health

var velocity = Vector2() 

func CollisionDetection(body):
	if body.Get("TYPE") != "Player":
		emit("roomba_hit_player")