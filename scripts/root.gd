extends Node2D

const GAME = preload("res://scenes/game.tscn")
const SCORE = preload("res://scenes/score.tscn")
var game: Game;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()
	await  $Timer.timeout
	game = GAME.instantiate()
	add_child(game)
	add_child(SCORE.instantiate())
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func reset(int) -> void:
	print("reset")
	
func _process(delta: float) -> void:
	$Countdown.text = str($Timer.time_left).pad_decimals(2)

func _on_tree_exited() -> void:
	EventBus.spaceship_hit.disconnect(reset)

func _on_tree_entered() -> void:
	EventBus.spaceship_hit.connect(reset)
