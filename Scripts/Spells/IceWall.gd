extends Area2D

func _physics_process(delta):
	await get_tree().create_timer(5.0).timeout
	
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("AllyProjectileDetectable"):
		body.speed = 0
