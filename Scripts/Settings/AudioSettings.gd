extends Control

@onready var AudioSettings = $"."
@onready var BackArrow1 = $Back/Label
@onready var BackArrow2 = $Back/Label2


func _on_back_pressed():
	AudioSettings.hide()


func _on_back_mouse_entered():
	BackArrow1.show()
	BackArrow2.show()


func _on_back_mouse_exited():
	BackArrow1.hide()
	BackArrow2.hide()
