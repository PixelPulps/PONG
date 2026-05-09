extends RigidBody2D

@export var start_speed := 400.0
@export var speed_increase := 20.0

func _ready() -> void:
	randomize()

	# Zufällige Start-Richtung
	var direction_x = [-1, 1].pick_random()
	var direction_y = randf_range(-0.8, 0.8)

	var direction = Vector2(direction_x, direction_y).normalized()

	linear_velocity = direction * start_speed


func _physics_process(delta: float) -> void:
	# Geschwindigkeit konstant halten
	linear_velocity = linear_velocity.normalized() * linear_velocity.length()
