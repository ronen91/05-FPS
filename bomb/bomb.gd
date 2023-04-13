extends RigidBody

export var trauma_amount := 0.1


func _ready():
	$Timer.start()

func light_fuse():
	$Timer.start()

func _on_bomb_body_entered(body):
	if body.name == "Enemy":
		$Flash.cause_trauma()
		var exit = get_node_or_null("root/Maze/Exit")
		if exit != null:
			exit.unlock()
			queue_free()
	$Enemy.die()


func _on_Timer_timeout():
	cause_trauma()
	$bomb.hide()
	$AnimatedSprite3D.show()
	$AnimatedSprite3D.play()
	



func cause_trauma():
	var trauma_areas = $Flash.get_overlapping_areas()
	for area in trauma_areas:
		if area.has_method("add_trauma"):
			area.add_trauma(trauma_amount)

func _on_AnimatedSprite3D_animation_finished():
	queue_free()
