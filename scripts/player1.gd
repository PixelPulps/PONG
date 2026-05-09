extends CharacterBody2D

@export var SPEED = 300.0

func _physics_process(delta: float) -> void:
	# Bewegung nur auf der Y-Achse
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = 0

	# X-Position bleibt immer gleich
	velocity.x = 0

	move_and_slide()
