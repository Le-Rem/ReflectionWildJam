class_name EnemyMng extends Node2D

func _ready() -> void:
	for child in get_children():
		if child is Marker2D:
			spawn(child.position)

func spawn(pos:Vector2):
	var enemy:Enemy = Enemy.RES.instantiate()
	enemy.position = pos
	enemy.target = $"../Char"
	add_child(enemy)
	enemy.set_symbol(Main.get_random_symbol())
