extends CharacterBody2D

var spell = 0
@export var speed = 300

@onready var attackCooldown = $Timer
@onready var shootingPoint = $"Shooting Point"

const enemy = preload("res://Prefabs/Mobs/Enemy.tscn")
const WaterBlast = preload("res://Prefabs/Spells/WaterBlast.tscn")
const IceWall = preload("res://Prefabs/Spells/IceWall.tscn")

func _ready():
	pass

func _physics_process(_delta):
	inputs()
	movement()
	
func spell1():
	var projectile = WaterBlast.instantiate()

	attackCooldown.wait_time = 0.001
	owner.add_child(projectile)
	projectile.transform = shootingPoint.global_transform 
	attackCooldown.start()

func spell2():
	var projectile = IceWall.instantiate()
	
	attackCooldown.wait_time = 5
	owner.add_child(projectile)
	projectile.transform = shootingPoint.global_transform 
	attackCooldown.start()

func spell3():
	var projectile = WaterBlast.instantiate()

	attackCooldown.wait_time = 0.1
	owner.add_child(projectile)
	projectile.transform = shootingPoint.global_transform 
	attackCooldown.start()

func spell4():
	var projectile = WaterBlast.instantiate()

	attackCooldown.wait_time = 0.1
	owner.add_child(projectile)
	projectile.transform = shootingPoint.global_transform 
	attackCooldown.start()

func spell5():
	var projectile = enemy.instantiate()

	attackCooldown.wait_time = 0.001
	owner.add_child(projectile)
	projectile.transform = $"Shooting Point2".global_transform 
	attackCooldown.start()


func movement():
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * speed
	
	move_and_slide()

func inputs():
	if Engine.time_scale == 1:
		$".".look_at(get_global_mouse_position())
		if Input.is_action_pressed("Spell1"):
			spell = 0
		if Input.is_action_pressed("Spell2"):
			spell = 1
		if Input.is_action_pressed("Spell3"):
			spell = 2
		if Input.is_action_pressed("Spell4"):
			spell = 3
		if Input.is_action_pressed("Spell5"):
			spell = 4
		if Input.is_action_pressed("UseSpell"):
			if attackCooldown.is_stopped():
				if spell == 0:
					spell1()
				if spell == 1:
					spell2()
				if spell == 2:
					spell3()
				if spell == 3:
					spell4()
				if spell == 4:
					spell5()

