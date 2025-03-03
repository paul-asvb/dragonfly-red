class_name Bullet
extends Node2D

const SPEED = 300;
const ttl = 4.0;
var belongs_to = 0;
@onready var screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	screen_size = get_viewport_rect().size
	position.x = wrapf(position.x, -screen_size.x/2,screen_size.x/2 )
	position.y = wrapf(position.y, -screen_size.y/2, screen_size.y/2)
	position += transform.x * SPEED * delta;
	
func _ready() -> void:
	if belongs_to == 2:
		$fire.set_animation("red");
	await get_tree().create_timer(ttl).timeout
	queue_free()  

func _on_body_entered(body: Node2D) -> void:
	if "ship" in body:
		if body.get("ship") != belongs_to:
			body.emit_signal("hit",belongs_to)
