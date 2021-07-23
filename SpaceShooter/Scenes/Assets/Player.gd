extends KinematicBody2D

export var speed = 400
export var friction = 0.00001
export var acceleration = 0.1

var rotation_direction = 0
export (float) var rotation_speed = 35

var velocity = Vector2()

func get_input():
	var input = Vector2()
	if Input.is_action_pressed("right_turn"):
		rotation_direction += 0.1
	if Input.is_action_pressed("left_turn"):
		rotation_direction -= 0.1
	if Input.is_action_pressed("forward"):
		input = Vector2(speed, 0).rotated(rotation)
	return input
	

func _physics_process(delta):
	var direction = get_input()
	rotation += rotation_direction * rotation_speed * delta
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	rotation_direction = 0
	velocity = move_and_slide(velocity)
	

