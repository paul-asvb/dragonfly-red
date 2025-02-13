extends Node2D

const SPACESHIP = preload("res://scenes/spaceship.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var spaceship1 = SPACESHIP.instantiate()
	add_child(spaceship1)
	spaceship1.position = Vector2(100,300)
	
	var spaceship2 = SPACESHIP.instantiate()
	add_child(spaceship2)
	spaceship2.position = Vector2(300,300)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
