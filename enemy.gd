class_name Enemy extends CharacterBody2D

const RES = preload("res://enemy.tscn")

@export var target:CharacterBody2D
var relative_speed:float = .5

const detection_radius:float = 666

func _physics_process(delta: float) -> void:
	if target == null:
		return
	if position.distance_to(target.position) > detection_radius:
		return
	velocity = position.direction_to(target.position).normalized() * target.velocity.length() * relative_speed
	move_and_slide()

func set_symbol(symbol:Main.Symbol):
	$SymbolDisplay.set_symbol(symbol)
func get_symbol()->Main.Symbol:
	return $SymbolDisplay.get_symbol()
