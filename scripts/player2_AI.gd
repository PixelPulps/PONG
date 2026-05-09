extends CharacterBody2D

@export var speed := 320.0
@export var reaction_time := 0.15
@export var error_margin := 25.0
@export var ball : RigidBody2D

var target_y := 0.0
var timer := 0.0

func _physics_process(delta: float) -> void:
	timer -= delta

	# Nur reagieren wenn Ball auf AI zufliegt
	if ball.linear_velocity.x > 0:

		if timer <= 0:
			timer = reaction_time

			# sichere Zeitberechnung (kein Division-Fehler)
			var dx = position.x - ball.position.x
			var vx = ball.linear_velocity.x

			if abs(vx) > 0.01:
				var t = dx / vx

				# nur Zukunft berechnen
				if t > 0 and t < 2.5:
					target_y = ball.position.y + ball.linear_velocity.y * t
				else:
					target_y = ball.position.y

			# menschlicher Fehler
			target_y += randf_range(-error_margin, error_margin)

		# Bewegung
		var diff = target_y - position.y

		if abs(diff) > 8:
			velocity.y = clamp(diff, -1, 1) * speed
		else:
			velocity.y = 0

	else:
		# leicht zur Mitte zurück
		velocity.y = move_toward(velocity.y, 0, speed * delta)

	velocity.x = 0
	move_and_slide()
