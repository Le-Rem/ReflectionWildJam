class_name SymbolDisplay extends AnimatedSprite2D

@export var symbol:Main.Symbol = Main.Symbol.NONE

func set_symbol(symbol:Main.Symbol):
	self.symbol = symbol
	match symbol:
		Main.Symbol.ROCK:
			play("rock")
		Main.Symbol.PAPER:
			play("paper")
		Main.Symbol.SCISSOR:
			play("scissor")
		_:
			play("none")

func get_symbol()->Main.Symbol:
	return symbol
