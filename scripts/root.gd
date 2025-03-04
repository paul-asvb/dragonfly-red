extends Node2D

const GAME = preload("res://scenes/game.tscn")
const SCORE = preload("res://scenes/score.tscn")

func _ready() -> void:
	reset(0)
	

func _process(delta: float) -> void:
	$Countdown.text = str($Timer.time_left).pad_decimals(2)

func reset(int) -> void:
	print("trset")
	$Countdown.visible = true
	$Intro.visible = true
	$Timer.start()
	await  $Timer.timeout
	$Countdown.visible = false
	$Intro.visible = false
	$game_node.add_child(GAME.instantiate())

func _on_tree_exited() -> void:
	EventBus.spaceship_hit.disconnect(reset)

func _on_tree_entered() -> void:
	EventBus.spaceship_hit.connect(reset)
