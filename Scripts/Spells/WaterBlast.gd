extends Area2D

var speed = 300
var damage = 5

@onready var tip = $Marker2D
@onready var sprite = $ColorRect

const NutellaSpreadParticle = preload("res://Prefabs/Spells/NutellaSpread.tscn")


func _physics_process(delta):
	position += transform.x * speed * delta

	await get_tree().create_timer(0.9).timeout
	
	queue_free()

func _on_area_entered(area):
	if area.is_in_group("Wall"):
		nutellaSpread()
		sprite.hide()
		
		await get_tree().create_timer(0.3).timeout
		
		queue_free() 

func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		nutellaSpread()
		body.health -= damage
		sprite.hide()
		
		await get_tree().create_timer(0.3).timeout
		queue_free() 

func nutellaSpread():
	var nutellaSpread = NutellaSpreadParticle.instantiate()

	add_child(nutellaSpread)
	nutellaSpread.transform = tip.transform
