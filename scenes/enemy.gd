extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction_x := 1.0
var facing_right := true

func get_direction():
	facing_right = direction_x >= 0

func _physics_process(delta: float) -> void:
	get_direction()

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_on_wall():
		direction_x *= -1
	else:
		velocity.x = direction_x * SPEED
	#print("is_on_wall: " + str(is_on_wall()))
	#print("is_on_floor: " + str(is_on_floor()))
	#print("direction_x: " + str(direction_x))

	move_and_slide()
