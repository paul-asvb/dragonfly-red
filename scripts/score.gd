extends Node2D

var score_p1=0
var score_p2=0

func run(id) -> void:
	
	if id == 1:
		score_p1 = score_p1+ 1
		$p1.text = str(score_p1)
	
	if id == 2:
		score_p2 = score_p2+ 1
		$p2.text = str(score_p2)

func _process(delta: float) -> void:
	pass


func _on_tree_exiting() -> void:
	EventBus.spaceship_hit.disconnect(run)

func _on_tree_entered() -> void:
	EventBus.spaceship_hit.connect(run)
