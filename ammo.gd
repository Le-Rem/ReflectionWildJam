class_name Ammo extends CharacterBody2D

const FRICTION = .988
const MIN_VEL = 66

const RES = preload("res://ammo.tscn")
const THROW_SPEED:float = 1000

var _remove_on_stop:bool = true

#func _ready() -> void:
	#velocity = (Vector2.RIGHT * 2500).rotated(randf()*TAU)

func _physics_process(delta: float) -> void:
	if velocity == Vector2.ZERO:
		return
	velocity = apply_physics(velocity)
	move_and_slide()
	var col:KinematicCollision2D  = get_last_slide_collision()
	if col:
		_collided(col)
	if velocity.length() < MIN_VEL:
		velocity = Vector2.ZERO
		_on_stop()


static func apply_physics(current_vel:Vector2)->Vector2:
	current_vel *= FRICTION
	return current_vel


func _collided(col:KinematicCollision2D):
	velocity = velocity.bounce(col.get_normal())
	var collider = col.get_collider()
	if collider is SymbolicWall:
		var symbol = (collider as SymbolicWall).get_symbol()
		$SymbolDisplay.set_symbol(symbol)
		$Sprite2D.modulate = Main.get_color_by_symbol(symbol)
	elif collider is Enemy:
		var match_result:Main.MatchState = Main.match_symbols($SymbolDisplay.get_symbol(),(collider as Enemy).get_symbol())
		match match_result:
			Main.MatchState.WIN: collider.queue_free()
			Main.MatchState.LOSE: queue_free()

func _on_stop():
	$SymbolDisplay.set_symbol(Main.Symbol.NONE)
	if _remove_on_stop:
		queue_free()

func throw(dir:Vector2):
	velocity = dir.normalized() * THROW_SPEED
