extends Node2D


#region Buttons
@onready var settingsPanel = $"Settings Panel"
@onready var PlayArrow1 = $Play/Label
@onready var PlayArrow2 = $Play/Label2
@onready var CreditsArrow1 = $Credits/Label
@onready var CreditsArrow2 = $Credits/Label2
@onready var SettingsArrow1 = $Settings/Label
@onready var SettingsArrow2 = $Settings/Label2
@onready var AchievementsArrow1 = $Achievements/Label
@onready var AchievementsArrow2 = $Achievements/Label2
@onready var QuitArrow1 = $Quit/Label
@onready var QuitArrow2 = $Quit/Label2

#region PlayButton

func _on_play_pressed():
	get_tree().change_scene_to_file("res://UI/Elements/ElementSelector.tscn")
#	get_tree().change_scene_to_file("res://Scenes/WaterCamp.tscn")
	Engine.time_scale = 1
func _on_play_mouse_entered():
	PlayArrow1.show()
	PlayArrow2.show()
func _on_play_mouse_exited():
	PlayArrow1.hide()
	PlayArrow2.hide()

#endregion
#region CreditsButton

func _on_credits_pressed():
	pass # Replace with function body.

func _on_credits_mouse_entered():
	CreditsArrow1.show()
	CreditsArrow2.show()

func _on_credits_mouse_exited():
	CreditsArrow1.hide()
	CreditsArrow2.hide()

#endregion
#region SettingsButton

func _on_settings_pressed():
	settingsPanel.show()
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
	get_tree().quit()
func _on_quit_mouse_entered():
	QuitArrow1.show()
	QuitArrow2.show()


func _on_quit_mouse_exited():
	QuitArrow1.hide()
	QuitArrow2.hide()

#endregion

#endregion
