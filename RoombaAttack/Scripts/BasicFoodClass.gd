""" Author: Porter D. Chase 
    Script: BasicFoodClass
	Objective: This class will be attached to the Food items and provide functionality
	           that removes the food object when a "player pickup" emmitter is triggered"""

extends "res://Scripts/EntityClass.gd"

const TYPE = "Food"

func InitializeFoodItem():
	SetMaxHealth(1)
	SetCurrentHealth(GetMaxHealth())
	
func DecrementHealth():
	SetCurrentHealth(GetCurrentHealth() - 1)
	print(GetCurrentHealth())

func GetType():
	return TYPE