extends RigidBody2D

@export var start_speed := 400.0
@export var max_speed := 900.0
@export var speed_step := 25.0

func _ready() -> void:
	randomize()
	reset_ball()


func reset_ball():
	position = Vector2(640, 360)

	var direction = Vector2(
		[-1, 1].pick_random(),
		randf_range(-0.7, 0.7)
	).normalized()

	linear_velocity = direction * start_speed


func _integrate_forces(state):
	# Geschwindigkeit langsam erhöhen
	var speed = linear_velocity.length()

	if speed < max_speed:
		speed += speed_step * state.step

	linear_velocity = linear_velocity.normalized() * speed
