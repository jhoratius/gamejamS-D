extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction_x := 0.0
var facing_right := true

func get_direction():
	if direction_x != 0.0:
		facing_right = direction_x >= 0.0

func get_facing_direction():
	$Sprite2D.flip_h = not facing_right

func _physics_process(delta: float) -> void:
	get_direction()
	get_facing_direction()

	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	direction_x = Input.get_axis("left", "right")
	velocity.x = direction_x * SPEED
	move_and_slide()
