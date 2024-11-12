extends Line2D

var max_points = 24
@export var target:Char

func _process(delta):
	update_trajectory(delta)

func update_trajectory(delta):
	clear_points()
	var pos = target.global_position
	var vel = target.get_shoot_dir().normalized() * (Ammo.THROW_SPEED)
	$CollisionTest.position = pos
	for i in max_points:
		add_point(pos)
		
		var collision = $CollisionTest.move_and_collide(vel*delta)
		if collision:
			vel = vel.bounce(collision.get_normal())
		pos += Ammo.apply_physics(vel) * delta
		$CollisionTest.position = pos
		
