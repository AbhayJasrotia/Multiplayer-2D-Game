extends CharacterBody2D

@export var speed := 250.0


func _ready():
	queue_redraw()


func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_key_pressed(KEY_W):
		direction.y -= 1

	if Input.is_key_pressed(KEY_S):
		direction.y += 1

	if Input.is_key_pressed(KEY_A):
		direction.x -= 1

	if Input.is_key_pressed(KEY_D):
		direction.x += 1

	direction = direction.normalized()

	velocity = direction * speed

	move_and_slide()


func _draw():
	# Tank body
	draw_rect(Rect2(-30, -20, 60, 40), Color.DARK_GREEN)

	# Tank tracks
	draw_rect(Rect2(-35, -25, 70, 8), Color.BLACK)
	draw_rect(Rect2(-35, 17, 70, 8), Color.BLACK)

	# Turret
	draw_circle(Vector2.ZERO, 18, Color.GREEN)

	# Gun barrel
	draw_rect(Rect2(0, -5, 45, 10), Color.DARK_GREEN)
