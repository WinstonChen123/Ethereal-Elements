extends CharacterBody2D

var speed = 200
var Velocity = Vector2(0, 0)
var health = 4

const enemy = preload("res://Prefabs/Mobs/Enemy.tscn")

func _process(delta):
	new_jew()
	position += transform.x * speed * delta
	look_at($"../Player".global_position)
	
	move_and_slide()
	if health == 0:
		print("i died")
		queue_free()


func _on_tree_entered(area):
	if area.is_in_group("AllyProjectile"):
		queue_free()

func new_jew():
	var Enemy = enemy.instantiate()
	Enemy.position = $Marker2D.global_position
