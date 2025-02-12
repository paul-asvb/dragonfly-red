extends CharacterBody2D

const SPEED = 300.0
const ROTATION = 0.1
const BULLET = preload("res://scenes/bullet.tscn")

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_down"):
		var bullet_instance = BULLET.instantiate()
	
		get_tree().root.add_child(bullet_instance)
	
func _physics_process(delta: float) -> void:
	
	
	#velocity = BOOSTER_POWER.normalized() + BOOSTER_POWER + 
	var booster_fire := Input.get_axis("ui_left", "ui_right")
	
	if (booster_fire == -1):
		rotate(-ROTATION)
		
	if (booster_fire == 1):
		rotate(ROTATION)
	
	velocity = Vector2(0,-SPEED).rotated(rotation)
	move_and_slide()
