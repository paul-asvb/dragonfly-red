extends Node2D

const SPEED = 200;
@onready var screen_size = get_viewport_rect().size


func _process(delta: float) -> void:
	screen_size = get_viewport_rect().size
	position.x = wrapf(position.x, -screen_size.x/2,screen_size.x/2 )
	position.y = wrapf(position.y, -screen_size.y/2, screen_size.y/2)
	position += transform.x * SPEED * delta;
	
func _ready() -> void:
	await get_tree().create_timer(1.0).timeout  
	queue_free()  
