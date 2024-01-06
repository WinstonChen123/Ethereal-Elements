extends Control

#region KeybindsSetup

@onready var inputButtonScene = preload("res://UI/Settings/Controls/Keybind.tscn")
@onready var actionList = $PanelContainer/MarginContainer/VBoxContainer/ScrollContainer/ActionList

var isRemapping = false
var actionToRemap = null
var remappingButton = null
var inputActions = {
	"Up": "MoveUp",
	"Down": "MoveDown",
	"Left": "MoveLeft",
	"Right": "MoveRight",
	"SpellChange": "SpellWheel",
	"Interact": "Interact",
	"UsePotion": "UsePotion",
	"Roll": "Roll",
	"Spell1": "ChangeToSpell1",
	"Spell2": "ChangeToSpell2",
	"Spell3": "ChangeToSpell3",
	"Spell4": "ChangeToSpell4",
	"Spell5": "ChangeToSpell5",
	"UseSpell": "UseSpell"
}

var resource = preload("res://Resource/InputActions.gd").new()  # Load the keybind resource
const file = "res://Resource/keybind.res"

func _ready():
	InputMap.load_from_project_settings()  # Load the default InputMap
	createActionList()

func createActionList():
	for item in actionList.get_children():
		item.queue_free()

	for action in inputActions:
		var button = inputButtonScene.instantiate()
		var actionLabel = button.find_child("LabelAction")
		var inputLabel = button.find_child("LabelInput")
		actionLabel.text = " " + str(inputActions[action])
		
		var events = InputMap.action_get_events(action)
		if events.size() > 0:
			inputLabel.text = events[0].as_text().trim_suffix("(Physical)")
		else:
			inputLabel.text = ""
			
		actionList.add_child(button)
		button.pressed.connect(onInputButtonPressed.bind(button, action))

func onInputButtonPressed(button, action):
	if !isRemapping:
		isRemapping = true
		actionToRemap = action
		remappingButton = button
		button.find_child("LabelInput").text = "Press Key to Rebind..."

func save():
	resource.inputActions = inputActions  # Save the inputActions dictionary to the resource
	ResourceSaver.save(resource, file)

func load_inputmap_from_file():
	if FileAccess.file_exists(file):
		print("File exists")  # Debug print
		resource = ResourceLoader.load(file)
		print("Resource loaded: ", resource)  # Debug print
		print("inputActions: ", resource.inputActions)  # Debug print
		
		#restore input map from resource
		for key in resource.inputActions.keys():
			if InputMap.has_action(key):
				#removing old mapping
				var map = InputMap.action_get_events(key)
				var action_event_to_erase
				for m in map:
					if m is InputEventKey:
						action_event_to_erase = m
				InputMap.action_erase_event(key, action_event_to_erase)
				
				#setting up new key
				var new_event = InputEventKey.new()
				inputActions[key] = new_event.keycode
				InputMap.action_add_event(key, new_event)
				print("Keybind restored: ", key, " -> ", new_event.as_text())  # Debug print
	else:
		print("File does not exist")  # Debug print

func _input(event):
	if isRemapping:
		if(event is InputEventKey || (event is InputEventMouseButton && event.pressed)):
			if event is InputEventMouseButton && event.double_click:
				event.double_click = false
				
			InputMap.action_erase_events(actionToRemap)
			InputMap.action_add_event(actionToRemap, event)
			updateActionList(remappingButton, event)
			
			isRemapping = false
			actionToRemap = null
			remappingButton = null
			
			accept_event()
			save()

func updateActionList(button, event):
	button.find_child("LabelInput").text = event.as_text() + " "
	inputActions[actionToRemap] = event.keycode  # Update the inputActions dictionary
	save()
#endregion

#region Buttons

@onready var ControlSettings = $"."
@onready var BackArrow1 = $Back/Label
@onready var BackArrow2 = $Back/Label2
@onready var ResetArrow1 = $ResetDefaults/Label
@onready var ResetArrow2 = $ResetDefaults/Label2



func _on_back_pressed():
	ControlSettings.hide()


func _on_back_mouse_entered():
	BackArrow1.show()
	BackArrow2.show()


func _on_back_mouse_exited():
	BackArrow1.hide()
	BackArrow2.hide()

func _on_reset_defaults_pressed():
	createActionList()

func _on_reset_defaults_mouse_entered():
	ResetArrow1.show()
	ResetArrow2.show()

func _on_reset_defaults_mouse_exited():
	ResetArrow1.hide()
	ResetArrow2.hide()
#endregion


