extends Area2D

func _physics_process(delta):
	await get_tree().create_timer(5.0).timeout
	
	queue_free()
