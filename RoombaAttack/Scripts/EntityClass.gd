''' Author: Porter D. Chase '''
''' This is the base class for Kinematic Entities that require health (Unable to abstract more than this due to Godot limitations'''

extends KinematicBody2D

var is_alive = true

var maxHealth = int(3)
var currentHealth = int(maxhealth)




''' Getters and Setters - for Health Manipulation'''
func GetCurrentHealth():
	return currentHealth
func SetCurrentHealth(var health):
	currentHealth = health

func GetMaxHealth():
	return maxHealth
func SetMaxHealth(var mHealth):
	maxHealth = mHealth
