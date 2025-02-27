extends Node2D

const GAME = preload("res://scenes/game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var game = GAME.instantiate()
	add_child(game)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func reset(int) -> void:
	print("reset");
	GAME.free()


func _on_tree_exited() -> void:
	EventBus.spaceship_hit.disconnect(reset)

func _on_tree_entered() -> void:
	EventBus.spaceship_hit.connect(reset)
