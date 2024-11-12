class_name Main extends Node2D


enum Symbol{
	NONE,
	ROCK,
	PAPER,
	SCISSOR,
}
enum MatchState{
	DRAW,
	WIN,
	LOSE,
}

func _ready() -> void:
	$Char.ammo_changed.connect(func(amount):
		$UI.update_ammo(amount)
	)
	$UI.update_ammo($Char.get_ammo())

static func get_color_by_symbol(symbol:Symbol):
	match symbol:
		Symbol.ROCK: return Color("5a407b")
		Symbol.PAPER: return Color("743f27")
		Symbol.SCISSOR: return Color("235955")
	return Color.WHITE

static func get_random_symbol()->Symbol:
	return [Symbol.ROCK,Symbol.PAPER,Symbol.SCISSOR].pick_random()

static func match_symbols(own:Symbol,other:Symbol)->MatchState:
	if own == other:
		return MatchState.DRAW
	if  (own == Symbol.ROCK and other == Symbol.SCISSOR) or\
		(own == Symbol.PAPER and other == Symbol.ROCK) or\
		(own == Symbol.SCISSOR and other == Symbol.PAPER):
		return MatchState.WIN
	return MatchState.LOSE
