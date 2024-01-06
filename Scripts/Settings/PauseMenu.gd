extends Control

#region Toggle
var isPaused = false
@onready var PauseMenu = $"."
@onready var SettingsPanel = $"../Settings Panel"

func _physics_process(_delta):
	if Input.is_action_just_pressed("Pause"):
		pauseMenu()

func pauseMenu():
	if !isPaused:
		Engine.time_scale = 0
		PauseMenu.show()
	else:
		Engine.time_scale = 1
		PauseMenu.hide()

	isPaused = !isPaused
#endregion
#region Buttons	
@onready var ResumeArrow1 = $Resume/Label
@onready var ResumeArrow2 = $Resume/Label2
@onready var SettingsArrow1 = $Settings/Label
@onready var SettingsArrow2 = $Settings/Label2
@onready var AchievementsArrow1 = $Achievements/Label
@onready var AchievementsArrow2 = $Achievements/Label2
@onready var QuitArrow1 = $Quit/Label
@onready var QuitArrow2 = $Quit/Label2

#region ResumeButton

func _on_resume_pressed():
	isPaused = false
	Engine.time_scale = 1
	PauseMenu.hide()
func _on_resume_mouse_entered():
	ResumeArrow1.show()
	ResumeArrow2.show()
func _on_resume_mouse_exited():
	ResumeArrow1.hide()
	ResumeArrow2.hide()

#endregion
#region SettingsButton

func _on_settings_pressed():
	SettingsPanel.show()
func _on_settings_mouse_entered():
	SettingsArrow1.show()
	SettingsArrow2.show()

func _on_settings_mouse_exited():
	SettingsArrow1.hide()
	SettingsArrow2.hide()

#endregion
#region AchievementsButton

func _on_achievements_pressed():
	pass # Replace with function body.

func _on_achievements_mouse_entered():
	AchievementsArrow1.show()
	AchievementsArrow2.show()


func _on_achievements_mouse_exited():
	AchievementsArrow1.hide()
	AchievementsArrow2.hide()

#endregion
#region QuitButton
func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
func _on_quit_mouse_entered():
	QuitArrow1.show()
	QuitArrow2.show()

func _on_quit_mouse_exited():
	QuitArrow1.hide()
	QuitArrow2.hide()

#endregion

#endregion
