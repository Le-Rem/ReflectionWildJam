extends CollisionPolygon2D

var pol_2D:Polygon2D

func _ready() -> void:
	if pol_2D == null:
		pol_2D = $"../Polygon2D"
	if pol_2D != null:
		polygon = pol_2D.polygon
