extends Node

@export var ball : RigidBody2D
@export var player1 : Node2D
@export var player2 : Node2D

var score_p1 := 0
var score_p2 := 0

func _ready() -> void:
	reset_ball()

# Wird von den Areas aufgerufen
func goal_left():
	score_p2 += 1
	print("Player 2 scored: ", score_p2)
	reset_ball()

func goal_right():
	score_p1 += 1
	print("Player 1 scored: ", score_p1)
	reset_ball()

func reset_ball():
	ball.position = get_viewport().get_visible_rect().size / 2

	var dir = [-1, 1].pick_random()
	ball.linear_velocity = Vector2(dir * 400, randf_range(-150, 150))
	
