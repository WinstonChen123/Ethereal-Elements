extends Area2D

func _physics_process(delta):
	await get_tree().create_timer(5.0).timeout
	
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("AllyProjectileDetectable") or body.is_in_group("Enemy"):
		body.speed = 0
	elif not body.is_in_group("AllyProjectileDetectable") or body.is_in_group("Enemy"):
		body.speed = 300
