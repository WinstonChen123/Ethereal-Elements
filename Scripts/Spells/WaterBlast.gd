extends Area2D

var speed = 300
var damage = 5

func _physics_process(delta):
	position += transform.x * speed * delta
	
	await get_tree().create_timer(1.0).timeout
	
	queue_free()

func _on_area_entered(area):
	if area.is_in_group("AllyProjectileDetectable"):
		queue_free()


func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		queue_free()
		body.health -= damage
