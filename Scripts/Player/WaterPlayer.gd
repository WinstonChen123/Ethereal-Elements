extends CharacterBody2D

var spell = 0
@export var speed = 225
@onready var WaterBlastCoolDown = $Timers/Timer
@onready var IceShardCoolDown = $Timers/Timer2
@onready var IceWallCoolDown = $Timers/Timer3

@onready var shootingPoint = $"Markers/Shooting Point"
@onready var wallPoint = $"Markers/Wall Point"

@onready var WaterBlastArrow = $Arrows/Arrow
@onready var IceShardArrow = $Arrows/Arrow2
@onready var IceWallArrow = $Arrows/Arrow3

const WaterBlast = preload("res://Prefabs/Spells/WaterBlast.tscn")
const IceWall = preload("res://Prefabs/Spells/IceWall.tscn")
const IceShard = preload("res://Prefabs/Spells/IceShard.tscn")


func _ready():
	pass

func _physics_process(_delta):
	inputs()
	movement()
	
func Waterblast():
	var projectile = WaterBlast.instantiate()

	WaterBlastCoolDown.wait_time = 1.5
	owner.add_child(projectile)
	projectile.transform = shootingPoint.global_transform 
	WaterBlastCoolDown.start()

func Iceshard():
	var projectile = IceShard.instantiate()

	IceShardCoolDown.wait_time = 3
	owner.add_child(projectile)
	projectile.transform = shootingPoint.global_transform 
	IceShardCoolDown.start()

func Icewall():
	var projectile = IceWall.instantiate()
	
	IceWallCoolDown.wait_time = 7
	owner.add_child(projectile)
	projectile.transform = wallPoint.global_transform 
	IceWallCoolDown.start()

func spell4():
	var projectile = WaterBlast.instantiate()

	WaterBlastCoolDown.wait_time = 0.1
	owner.add_child(projectile)
	projectile.transform = shootingPoint.global_transform 
	WaterBlastCoolDown.start()

func spell5():
	var projectile = WaterBlast.instantiate()

	WaterBlastCoolDown.wait_time = 0.1
	owner.add_child(projectile)
	projectile.transform = shootingPoint.global_transform 
	WaterBlastCoolDown.start()

func movement():
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * speed
	
	move_and_slide()

func inputs():
	if Engine.time_scale == 1:
	#region Spells
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
			if WaterBlastCoolDown.is_stopped():
				if spell == 0:
					Waterblast()
				if spell == 3:
					spell4()
				if spell == 4:
					spell5()
			if IceShardCoolDown.is_stopped():
				if spell == 1:
					Iceshard()
			if IceWallCoolDown.is_stopped():
				if spell == 2:
					Icewall()
#endregion
		if Input.is_action_pressed("SpellChange") and spell == 0:
			WaterBlastArrow.show()
		else:
			WaterBlastArrow.hide()

		if Input.is_action_pressed("SpellChange") and spell == 1:
			IceShardArrow.show()
		else:
			IceShardArrow.hide()

		if Input.is_action_pressed("SpellChange") and spell == 2:
			IceWallArrow.show()
		else:
			IceWallArrow.hide()
		if Input.is_action_pressed("SpellChange") and spell == 3:
			WaterBlastArrow.show()
		if Input.is_action_pressed("SpellChange") and spell == 4:
			WaterBlastArrow.show()


