extends Control

#region Buttons	
@onready var AudioSettings = $AudioSettings
@onready var GameSettings = $GameSettings
@onready var Controls = $Controls2
@onready var SettingsPanel = $"."
@onready var GameArrow1 = $Video/Label
@onready var GameArrow2 = $Video/Label2
@onready var AudioArrow1 = $Audio/Label
@onready var AudioArrow2 = $Audio/Label2
@onready var ControlArrow1 = $Controls/Label
@onready var ControlArrow2 = $Controls/Label2
@onready var BackArrow1 = $Back/Label
@onready var BackArrow2 = $Back/Label2

#region GameButton

func _on_game_pressed():
	GameSettings.show()
func _on_game_mouse_entered():
	GameArrow1.show()
	GameArrow2.show()

func _on_game_mouse_exited():
	GameArrow1.hide()
	GameArrow2.hide()

#endregion
#region AudioButton

func _on_audio_pressed():
	AudioSettings.show()

func _on_audio_mouse_entered():
	AudioArrow1.show()
	AudioArrow2.show()

func _on_audio_mouse_exited():
	AudioArrow1.hide()
	AudioArrow2.hide()

#endregion
#region ControlButton

func _on_controls_pressed():
	Controls.show()

func _on_controls_mouse_entered():
	ControlArrow1.show()
	ControlArrow2.show()

func _on_controls_mouse_exited():
	ControlArrow1.hide()
	ControlArrow2.hide()

#endregion
#region BackButton
func _on_back_pressed():
	SettingsPanel.hide()
func _on_back_mouse_entered():
	BackArrow1.show()
	BackArrow2.show()

func _on_back_mouse_exited():
	BackArrow1.hide()
	BackArrow2.hide()

#endregion

#endregion
