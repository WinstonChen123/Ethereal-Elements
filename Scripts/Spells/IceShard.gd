extends Area2D

var speed = 500
var damage = 10

func _physics_process(delta):
	position += transform.x * speed * delta
	
	await get_tree().create_timer(2.0).timeout
	
	queue_free()

func _on_area_entered(area):
	if area.is_in_group("Wall"):
		queue_free()


func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		body.health -= damage
