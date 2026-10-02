extends Node2D

const enemy_scene: PackedScene = preload("res://scenes/enemy.tscn")
var n_enemies := 5
var rnd = RandomNumberGenerator.new()

func _ready() -> void:
	for i in range(0, n_enemies):
		var enemy = enemy_scene.instantiate()
		$Enemies.add_child(enemy)
		enemy.global_position = Vector2(rnd.randi_range(400, 700), rnd.randi_range(400, 700))

func _process(_delta: float) -> void:
	pass
