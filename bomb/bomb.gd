extends RigidBody

func _ready():
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
	$Flash.cause_trauma()
	Global.update_time(-1)
	queue_free()
