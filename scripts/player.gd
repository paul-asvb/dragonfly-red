extends CharacterBody2D

const SPEED = 400.0
const ROTATION = 0.1
const BULLET = preload("res://scenes/bullet.tscn")

@onready var screen_size = get_viewport_rect().size

func _ready():
	pass 
	
func _process(delta: float) -> void:
	screen_size = get_viewport_rect().size

	position.x = wrapf(position.x, -screen_size.x/2,screen_size.x/2 )
	position.y = wrapf(position.y, -screen_size.y/2, screen_size.y/2)
		
	if Input.is_action_pressed("ui_down"):
		var bullet_instance = BULLET.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.rotation_degrees = rotation_degrees - 90
		bullet_instance.position = position
		
func _physics_process(delta: float) -> void:
	var booster_fire := Input.get_axis("ui_left", "ui_right")
	
	if (booster_fire == -1):
		rotate(-ROTATION)
	if (booster_fire == 1):
		rotate(ROTATION)
		
	velocity = Vector2(0,-SPEED).rotated(rotation)
	move_and_slide()
