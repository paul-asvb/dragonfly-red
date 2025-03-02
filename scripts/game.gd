class_name Game
extends Node2D

const SPACESHIP = preload("res://scenes/spaceship.tscn")
var spaceship1 
var spaceship2 
# This enum lists all the possible states the character can be in.
enum States {WAITING, RUNNING}

# This variable keeps track of the character's current state.
var state: States = States.WAITING

func _ready() -> void:
	spaceship1 = SPACESHIP.instantiate().with_data(1)
	add_child(spaceship1)
	spaceship1.rotation_degrees = 90;
	spaceship1.position = Vector2(-600,0)
	
	spaceship2 = SPACESHIP.instantiate().with_data(2)
	add_child(spaceship2)
	spaceship2.rotation_degrees = -90;
	spaceship2.position = Vector2(600,0)
	
func reset(int) -> void:
	await get_tree().create_timer(2).timeout
	get_tree().reload_current_scene()


func _on_tree_exited() -> void:
	EventBus.spaceship_hit.disconnect(reset)

func _on_tree_entered() -> void:
	EventBus.spaceship_hit.connect(reset)
