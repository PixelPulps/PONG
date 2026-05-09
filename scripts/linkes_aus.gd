extends Area2D

@export var game_manager : Node

func _on_body_entered(body):
	if body.name == "Ball":
		game_manager.goal_right()
