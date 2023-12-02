extends Node

func move(moveModifiers) -> Vector2:
	var speed = moveModifiers.speed
	var direction = moveModifiers.direction
	return direction * speed
