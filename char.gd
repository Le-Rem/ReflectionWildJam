class_name Char extends CharacterBody2D


const SPEED = 1600.0
const FRICTION = .95
const MIN_VEL = 66

var ammo:int = 3
signal ammo_changed(int)
func get_ammo()->int:
	return ammo


func _ready() -> void:
	ammo_changed.emit(ammo)
	

func _physics_process(delta: float) -> void:
	var input_dir:Vector2 = Input.get_vector(
			"left",
			"right",
			"up",
			"down"
	)
	var is_move_by_input:bool = input_dir != Vector2.ZERO
	input_dir = input_dir.normalized() * SPEED * delta
	velocity += input_dir
	velocity *= FRICTION
	if not is_move_by_input and velocity.length() < MIN_VEL:
		velocity = Vector2.ZERO
	move_and_slide()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click") :
		_shoot()

func _shoot():
	var ammo:Ammo = Ammo.RES.instantiate()
	ammo.position = position
	add_sibling(ammo)
	ammo.throw(get_shoot_dir())

func get_shoot_dir()->Vector2:
	var topLeft = get_viewport().get_camera_2d().get_screen_center_position() - get_viewport_rect().size / 2  
	var aim_pos :Vector2 = topLeft + get_viewport().get_mouse_position()
	return position.direction_to(aim_pos)
