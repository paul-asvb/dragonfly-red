class_name Spaceship
extends RigidBody2D

const SPEED = 400.0
const ROTATION = 360*5
const BULLET = preload("res://scenes/bullet.tscn")
var burn_left =false
var burn_right= false
var ship = 1
var lives = 5

@onready var screen_size = get_viewport_rect().size

signal hit



var thrust = Vector2(0, -100)
var torque = 2

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

func _integrate_forces(state):
	var booster_fire_left = Input.is_action_pressed("player01_left")
	var booster_fire_right = Input.is_action_pressed("player01_right")
	if ship == 2:
		booster_fire_left = Input.is_action_pressed("player02_left")
		booster_fire_right = Input.is_action_pressed("player02_right")

	if booster_fire_left || booster_fire_right:
		state.apply_force(thrust.rotated(rotation))
	else:
		state.apply_force(Vector2())
	var rotation_direction = 0
	burn_left = false
	burn_right = false
	if booster_fire_left:
		rotation_direction += ROTATION
		burn_left = true;
	if booster_fire_right:
		rotation_direction -= ROTATION
		burn_right = true
	
	$fire_left.visible = burn_left
	$fire_right.visible = burn_right

	state.apply_torque(rotation_direction * torque)
