extends Node2D

const SPACESHIP = preload("res://scenes/spaceship.tscn")
var spaceship1 
var spaceship2 

func _ready() -> void:
	reset(0)
	
func reset(int) -> void:
	spaceship1 = SPACESHIP.instantiate().with_data(1)
	add_child(spaceship1)
	spaceship1.rotation_degrees = 90;
	spaceship1.position = Vector2(-600,0)
	
	spaceship2 = SPACESHIP.instantiate().with_data(2)
	add_child(spaceship2)
	spaceship2.rotation_degrees = -90;
	spaceship2.position = Vector2(600,0)


func _on_tree_exited() -> void:
	EventBus.spaceship_hit.disconnect(reset)

func _on_tree_entered() -> void:
	EventBus.spaceship_hit.connect(reset)
