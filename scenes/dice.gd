extends Node

@onready var roll: CenterContainer = $Control/Dice01/roll
@onready var _dice: TextureRect = $Control/Dice01/roll/dice
@onready var roll2: CenterContainer = $Control/Dice02/roll2
@onready var _dice2: TextureRect = $Control/Dice02/roll2/dice
@onready var roll_btn: TextureButton = $roll_btn


var tween
var tween2
var dice = []
var rolling: bool = false
var shake_speed := 0.33
var offset := Vector2(0, 0)

func _ready() -> void:
	dice.append(load("res://assets/dice_faces/dice_n1.png"))
	dice.append(load("res://assets/dice_faces/dice_n2.png"))
	dice.append(load("res://assets/dice_faces/dice_n3.png"))
	dice.append(load("res://assets/dice_faces/dice_n4.png"))
	dice.append(load("res://assets/dice_faces/dice_n5.png"))
	dice.append(load("res://assets/dice_faces/dice_n6.png"))

func _process(_delta: float) -> void:
	if rolling:
		var dice_roll = randi() % 6 + 1
		var dice_roll2 = randi() % 6 + 1
		var result = dice_roll
		var result2 = dice_roll2
		_dice.texture = dice[result - 1]
		_dice2.texture = dice[result2 - 1]

func _on_roll_btn_pressed() -> void:
	print("pressed")
	rolling = true
	roll_btn.disabled = true
	shake(roll)
	shake(roll2)
	await get_tree().create_timer(1.4).timeout
	rolling = false
	roll_btn.disabled = false

func shake(node: Control) -> void:
	node.pivot_offset = node.size / 2
	var t := create_tween()
	t.tween_property(node, "rotation", rad_to_deg(40), shake_speed)
	t.tween_property(node, "rotation", rad_to_deg(-40), shake_speed)
	t.tween_property(node, "rotation", rad_to_deg(20), shake_speed)
	t.tween_property(node, "rotation", rad_to_deg(0), shake_speed)

#func shake(node: Control) -> void:
	#node.pivot_offset = node.size / 2
	#var t := create_tween()
	#for angle in [40.0, -40.0, 20.0, 0.0]:
		#t.tween_property(node, "rotation_degrees", angle, shake_speed)

#func shake(tween:Variant):
	#tween = create_tween()
	#tween.tween_property(roll, "rotation", rad_to_deg(40), shake_speed)
	#tween.tween_property(roll, "rotation", rad_to_deg(-40), shake_speed)
	#tween.tween_property(roll, "rotation", rad_to_deg(20), shake_speed)
	#tween.tween_property(roll, "rotation", rad_to_deg(0), shake_speed)
