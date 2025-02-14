class_name Spaceship
extends CharacterBody2D

const SPEED = 400.0
const ROTATION = 0.1
const BULLET = preload("res://scenes/bullet.tscn")
var ship = 1
@onready var screen_size = get_viewport_rect().size

func with_data(ship: int) -> Spaceship:
	self.ship = ship
	return self

func _ready() -> void:
	if ship == 1:
		get_node("body").set_animation("ship1")
	else:
		get_node("body").set_animation("ship2")

func _process(delta: float) -> void:
	screen_size = get_viewport_rect().size

	position.x = wrapf(position.x, -screen_size.x/2,screen_size.x/2 )
	position.y = wrapf(position.y, -screen_size.y/2, screen_size.y/2)

	var shoot_button = Input.is_action_just_pressed("player01_shoot")
	if self.ship == 2:
		shoot_button = Input.is_action_just_pressed("player02_shoot")
	
	if shoot_button:
		var bullet_instance = BULLET.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.rotation_degrees = rotation_degrees - 90
		bullet_instance.position = position
	
func _physics_process(delta: float) -> void:
	
	var booster_fire = Input.get_axis("player01_left", "player01_right")
	if ship == 2:
		booster_fire = Input.get_axis("player02_left", "player02_right")
		
	if (booster_fire == -1):
		rotate(-ROTATION)
	if (booster_fire == 1):
		rotate(ROTATION)
	velocity = Vector2(0,-SPEED).rotated(rotation)
	move_and_slide()
