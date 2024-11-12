class_name SymbolicWall extends StaticBody2D

@export var initial_symbol:Main.Symbol = Main.Symbol.NONE

func _ready():
	set_symbol(initial_symbol)

func set_symbol(symbol:Main.Symbol):
	$SymbolDisplay.set_symbol(symbol)
	$Polygon2D.color = Main.get_color_by_symbol(symbol)
func get_symbol()->Main.Symbol:
	return $SymbolDisplay.get_symbol()
