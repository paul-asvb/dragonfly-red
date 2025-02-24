extends Node2D

const SPACESHIP = preload("res://scenes/spaceship.tscn")
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	
	var spaceship1 = SPACESHIP.instantiate().with_data(1)
	add_child(spaceship1)
	spaceship1.rotation_degrees = 90;
	spaceship1.position = Vector2(-600,0)
	
	var spaceship2 = SPACESHIP.instantiate().with_data(2)
	add_child(spaceship2)
	spaceship2.rotation_degrees = -90;
	spaceship2.position = Vector2(600,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
